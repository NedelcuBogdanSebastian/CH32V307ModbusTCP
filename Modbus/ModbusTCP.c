/********************************** (C) COPYRIGHT ***********************************
 * File Name : ModbusTCP.h
 * Author : XuPing
 * Version : V1.0.0
 * Date : 2023/10/19
 * Description : This file contains the headers of the Modbus TCP protocol.
 * Modified : 27/August/2024 by Nedelcu Bogdan Sebastian
 *******************************************************************************/

/* Include header files ----------------------------------------------------------------*/
#include "debug.h"
#include <string.h>
#include "net_config.h"
#include "wchnet.h"
#include "ModbusTCP.h"

/*
    Read:
        01: Coils (FC=01)
        03: Multiple Holding Registers (FC=03)
    Write:
        05: Single Coil (FC=05)
        06: Single Holding Register (FC=06)
        0F: Multiple Coils (FC=15)
        10: Multiple Holding Registers (FC=16)
 */

/* Private function declaration --------------------------------------------------------------*/
void TCP_Exception_RSP(uint8_t socketid, uint8_t _FunCode, uint8_t _ExCode); // Fault response
void MB_TCP_RSP(uint8_t socket_id, uint8_t _FunCode); //Normal response

void TCP_RSP_01_02(uint8_t socketid); // FunCode 01 02 read switches
void TCP_RSP_03_04(uint8_t socketid); // Function code 03 04 read registers
void TCP_RSP_05(uint8_t socketid);    // Function code 05 write single output switching volume
void TCP_RSP_06(uint8_t socketid);    // Function code 06 Write Single Holding Registers
void TCP_RSP_0F(uint8_t socketid);    // Function code 15 Write multiple output switches
void TCP_RSP_10(uint8_t socketid);    // Function code 16 Write multiple holding registers

/* Private macro definition ----------------------------------------------------------------*/

/* Private variable ------------------------------------------------------------------*/
uint8_t Rx_Buf[256]; // Receive buffer, 256 bytes max.
uint8_t Tx_Buf[256]; // Transmit buffer, 256 bytes max.

uint32_t P_TxCount = 0;               // Send character count
uint16_t P_Addr, P_RegNum, P_ByteNum; // Register address, register count, byte count

/* Extended variable ------------------------------------------------------------------*/
extern uint8_t coil[100];  // Coils
extern uint16_t mreg[100]; // Holding Registers
extern uint8_t MODBUSDataBuffer[RECE_BUF_LEN]; // Used as receive buffer, max 800*2 bytes

/* Private function prototype --------------------------------------------------------------*/

/*********************************************************************
 * Function: read input/output coil (bit)
 * Input parameter: socketid - socket id.
 * Return value: none
 * Description: None
 */
void TCP_RSP_01_02(uint8_t socketid)
{
    uint16_t A_Leng = 0, B_Leng = 0;
    uint8_t i, x;
    uint8_t data[1024];

    if ((P_Addr + P_RegNum) < TCP_MAX)
    {
        Tx_Buf[0] = MODBUSDataBuffer[0]; // Transaction identifier
        Tx_Buf[1] = MODBUSDataBuffer[1]; // Transaction identifier
        Tx_Buf[2] = MODBUSDataBuffer[2]; // Protocol identifier
        Tx_Buf[3] = MODBUSDataBuffer[3]; // Protocol identifier

        Tx_Buf[6] = MODBUSDataBuffer[6]; // Station number
        Tx_Buf[7] = MODBUSDataBuffer[7]; // Function code
        P_ByteNum = P_RegNum / 8;        // Byte number

        if (P_RegNum % 8) P_ByteNum += 1; // Byte count +1 if there is a remainder in the bits
        Tx_Buf[8] = P_ByteNum; // Return word count

        // Special cases, such as when the starting address is 5 and the number of bits is 16,
        // if you calculate the number of bytes according to P_ByteNum, you need to add 1 and
        // take the data of the latter array to fill
        // if((P_RegNum % 8==0) && (P_Addr!=0))
        // {
        // P_ByteNum += 1; // }
        // }

        if ((P_RegNum % 8 == 0) && (P_Addr % 8 != 0))
        {
            P_ByteNum += 1;
        }

		A_Leng = P_Addr / 8; // Store according to the array position, calculate the starting position
		B_Leng = P_Addr % 8; // Calculate bits

		// Zero the array to be used and send the contents of the array
		memset( & data[0], 0, 1024);
		memset( & Tx_Buf[9], 0, P_ByteNum);

		// Separate data placement, array number 1, 2 3, 4 5, 6 ....
		// Two arrays to store the same data, to facilitate the following calculations
		for (i = 0; i < P_ByteNum; i++)
		{
			data[2 * i + 1] = coil[A_Leng + i];
			data[2 * i + 2] = coil[A_Leng + i];
		}

		// Assignment based on byte count
		for (x = 0; x < P_ByteNum; x++)
		{
			// Fill one byte of content data at a time, but there will be an offset problem
		    // Offset the array bits 1, 3, 5... etc. array bit offset, that is, the first two bytes
			// of the first offset, if the offset address is zero, then no offset */
			data[2 * x + 1] = data[2 * x + 1] >> B_Leng;

			// First fill the offset data content, assuming offset two bits,
			// then is still need to fill 6 bits of data content
			for (i = 0; i < 8 - B_Leng; i++)
			{
				// Determine the first bit after offset, which is also the lowest bit
				if ((data[2 * x + 1]) & 0x01)
				{
					Tx_Buf[9 + x] |= (1 << i);
				}
				// The for loop continues to judge after one bit offset
				data[2 * x + 1] >>= 1;
			}

			// Since there is an offset, then we need to take the data content of the array with one bit higher
			// to fill the data content after the last offset, totaling 8 bits and one byte
			for (i = 0; i < B_Leng; i++)
			{
				// To judge the higher bit of data, we assume that the previous take data[1], here take data[4], data[6],
				// because the next round of byte loop data[2*x+1] value is data[3], data[5] ...
				// This does not affect the original data content when judging the assignment shift
				if ((data[2 * x + 4]) & 0x01) {
					Tx_Buf[9 + x] |= (1 << (8 + i - B_Leng));
				}
				data[2 * x + 4] >>= 1;
			}
		}

		// Only if the read coil first address is not 0,8,16,... and the number of coils to be read is not an integer multiple of 8.
		if(!((P_Addr%8 == 0)&&(P_RegNum%8 == 0)))
		{
			// Offset the high bit after zero
			for(i=0;i<8-P_RegNum % 8;i++)
			{
			  Tx_Buf[8+P_ByteNum] &= ~(1 << (P_RegNum % 8+i));
			}
		}

		P_ByteNum += 3;
		Tx_Buf[4] = P_ByteNum >> 8;
		Tx_Buf[5] = P_ByteNum;

		P_TxCount=P_ByteNum+6;
		WCHNET_SocketSend(socketid, Tx_Buf, &P_TxCount);           //Socket sends data.
	}
    else
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02);    // Send error code
}

/*********************************************************************
 * Function: read input/output registers (1 register = 2 Bytes)
 * Input parameter: socketid - socket id.
 * Return value: None
 * Description: None
 */
void TCP_RSP_03_04(uint8_t socketid)
{
    uint16_t i;

    if ((P_Addr + P_RegNum) < TCP_MAX)
    {
        Tx_Buf[0] = MODBUSDataBuffer[0];     // Transaction identifier
        Tx_Buf[1] = MODBUSDataBuffer[1];     // Transaction identifier
        Tx_Buf[2] = MODBUSDataBuffer[2];     // Protocol identifier
        Tx_Buf[3] = MODBUSDataBuffer[3];     // Protocol identifier

        Tx_Buf[6] = MODBUSDataBuffer[6];     // Station number
        Tx_Buf[7] = MODBUSDataBuffer[7];     // Function code

        P_ByteNum = P_RegNum * 2;            // Byte number
        Tx_Buf[8] = P_ByteNum;               // Number of bytes returned

        for (i = 0; i<P_RegNum; i++)
        {
            Tx_Buf[9 + i * 2] = mreg[P_Addr + i];        // Low byte
            Tx_Buf[10 + i * 2] = mreg[P_Addr + i] >> 8;  // High byte
        }
        P_ByteNum += 3;
        Tx_Buf[4] = P_ByteNum >> 8;
        Tx_Buf[5] = P_ByteNum;

        P_TxCount = P_ByteNum+6;

        WCHNET_SocketSend(socketid, Tx_Buf, &P_TxCount);           //Socket sends data.
    }
    else
    {
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02);    //Function code error response
        printf(" === MBTCP Function code : %d \n", MODBUSDataBuffer[7]);
    }
}

/*********************************************************************
 * Function: Write a single coil
 * Input parameter: socketid - socket id.
 * Return value: none
 * Description: None
 */
void TCP_RSP_05(uint8_t socketid)
{
    uint16_t A_Leng,B_Leng;
    if (P_Addr < TCP_MAX)
    {
        Tx_Buf[0] = MODBUSDataBuffer[0];   // Transaction identifier
        Tx_Buf[1] = MODBUSDataBuffer[1];   // Transaction identifier
        Tx_Buf[2] = MODBUSDataBuffer[2];   // Protocol identifier
        Tx_Buf[3] = MODBUSDataBuffer[3];   // Protocol identifier
        Tx_Buf[4] = MODBUSDataBuffer[4];   // Later bytes
        Tx_Buf[5] = MODBUSDataBuffer[5];   // Number of bytes to follow
        Tx_Buf[6] = MODBUSDataBuffer[6];   // Station number
        Tx_Buf[7] = MODBUSDataBuffer[7];   // Function code
        Tx_Buf[8] = MODBUSDataBuffer[8];   // Write address
        Tx_Buf[9] = MODBUSDataBuffer[9];   //
        Tx_Buf[10] = MODBUSDataBuffer[10]; // Write content
        Tx_Buf[11] = MODBUSDataBuffer[11]; //

        A_Leng = P_Addr / 8; // Store according to array position, calculate start position
        B_Leng = P_Addr % 8; // Calculate bits

        if (MODBUSDataBuffer[10] == 0xff || MODBUSDataBuffer[11] == 0xff)
        {
            // Assign the value directly to the appropriate address
            coil[A_Leng] |= 1<<B_Leng;
            printf(" === Turning on coil\n");
        }
        else
        {
            // Directly assign the value to the corresponding address
            coil[A_Leng] &= ~(1<<B_Leng);
            // coil[P_Addr] = 0x00;
            printf(" === Turning off coil.\n");
        }

        P_TxCount=12;
        WCHNET_SocketSend(socketid, Tx_Buf, &P_TxCount);           //Socket sends data.
    }
    else
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02);    // Send error code
}

/*********************************************************************
 * Function: Write single register.
 * Input parameter: socketid - socket id.
 * Return value: none
 * Description: None
 */
void TCP_RSP_06(uint8_t socketid)
{
    if (P_Addr < TCP_MAX)
    {
        Tx_Buf[0] = MODBUSDataBuffer[0];   // Transaction identifier
        Tx_Buf[1] = MODBUSDataBuffer[1];   // Transaction identifier
        Tx_Buf[2] = MODBUSDataBuffer[2];   // Protocol identifier
        Tx_Buf[3] = MODBUSDataBuffer[3];   // Protocol identifier
        Tx_Buf[4] = MODBUSDataBuffer[4];   // Later bytes
        Tx_Buf[5] = MODBUSDataBuffer[5];   // Number of bytes to follow
        Tx_Buf[6] = MODBUSDataBuffer[6];   // Station number
        Tx_Buf[7] = MODBUSDataBuffer[7];   // Function code
        Tx_Buf[8] = MODBUSDataBuffer[8];   // Write address
        Tx_Buf[9] = MODBUSDataBuffer[9];   // Write address
        Tx_Buf[10] = MODBUSDataBuffer[10]; // Write content
        Tx_Buf[11] = MODBUSDataBuffer[11]; // Write content

        mreg[P_Addr] = MODBUSDataBuffer[10];       // Low byte data written
        mreg[P_Addr] |= MODBUSDataBuffer[11] << 8; // High byte data write

        P_TxCount = 12; // High byte data write

        WCHNET_SocketSend(socketid, Tx_Buf, & P_TxCount);       // Socket sends data
    } else
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02); // Send error code
}

/*********************************************************************
 * Function: write multiple coils (function code: 0x0F)
 * Input parameter: socketid - socket id.
 * Return value: none
 * Description: None
 */
void TCP_RSP_0F(uint8_t socketid)
{
    uint8_t next_data[255];
    uint16_t i, x;
    uint16_t A_Leng, B_Leng;

    if((P_Addr + P_RegNum) < TCP_MAX)
    {
        Tx_Buf[0] = MODBUSDataBuffer[0];   // Transaction identifier
        Tx_Buf[1] = MODBUSDataBuffer[1];   // Transaction identifier
        Tx_Buf[2] = MODBUSDataBuffer[2];   // Protocol identifier
        Tx_Buf[3] = MODBUSDataBuffer[3];   // Protocol identifier
        Tx_Buf[4] = 0;                     // Following bytes
        Tx_Buf[5] = 6;                     // Number of bytes to follow
        Tx_Buf[6] = MODBUSDataBuffer[6];   // Station number
        Tx_Buf[7] = MODBUSDataBuffer[7];   // Function code
        Tx_Buf[8] = MODBUSDataBuffer[8];   // Starting address
        Tx_Buf[9] = MODBUSDataBuffer[9];   //
        Tx_Buf[10] = MODBUSDataBuffer[10]; // Quantity
        Tx_Buf[11] = MODBUSDataBuffer[11]; //

        A_Leng = P_Addr / 8; // Store according to array position, calculate start position
        B_Leng = P_Addr % 8; // Calculate bits

        // memset(coil,0,MODBUSDataBuffer[12]+1); // Calculate bits; //Calculate bits

        for (x = 0; x < MODBUSDataBuffer[12]; x++) // Write coil according to byte count
        {
            next_data[x] = MODBUSDataBuffer[13 + x];
            // printf("---------------Rx_Buf[x]=%x\n",Rx_Buf[13+x]);
            for (i = 0; i < (8 - B_Leng); i++) // Set coil (first address start)
            {
                if ((MODBUSDataBuffer[13 + x]) & 0x01) // Determine if the bit is valid or not
                {
                    coil[A_Leng + x] |= (1 << (i % 8)) << B_Leng; // Assign value from offset address, offset address is B_Leng
                    //printf("1---r[%d]=%x\n",i,coil[A_Leng+x]);
                } else {
                    coil[A_Leng + x] &= ~((1 << (i % 8)) << B_Leng); // Corresponding bit clearing
                }
                MODBUSDataBuffer[13 + x] >>= 1; // Continue to determine the next bit
            }

            for (i = 0; i < B_Leng; i++) // Set coil (remaining bits set)
            {
                if ((next_data[x] >> (8 - B_Leng)) & 0x01) // Continue to process the remaining data according to the previous judgment
                {
                    coil[A_Leng + x + 1] |= 1 << (i % 8); // Remaining bits are assigned to set bits
                    //printf("3---r[%d]=%x\n",i,coil[A_Leng+x+1]);
                } else {
                    coil[A_Leng + x + 1] &= ~(1 << (i % 8)); // Corresponding bit clearing
                }
                next_data[x] >>= 1;
            }
        }

        P_TxCount = 12;
        WCHNET_SocketSend(socketid, Tx_Buf, & P_TxCount); // Socket sends data.
    }
    else
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02); // Function code error response
}

/*********************************************************************
 * Function: Write multiple registers (function code: 0x10)
 * Input parameter: socketid - socket id.
 * Return value: none
 * Description: None
 */
void TCP_RSP_10(uint8_t socketid) {
    uint16_t i;

	if ((P_Addr + P_RegNum) < TCP_MAX)
	{
		Tx_Buf[0] = MODBUSDataBuffer[0];   // Transaction identifier
		Tx_Buf[1] = MODBUSDataBuffer[1];   // Transaction identifier
		Tx_Buf[2] = MODBUSDataBuffer[2];   // Protocol identifier
		Tx_Buf[3] = MODBUSDataBuffer[3];   // Protocol identifier
		Tx_Buf[4] = 0;                     // Following bytes
		Tx_Buf[5] = 6;                     // Number of bytes to follow
		Tx_Buf[6] = MODBUSDataBuffer[6];   // Station number
		Tx_Buf[7] = MODBUSDataBuffer[7];   // Function code
		Tx_Buf[8] = MODBUSDataBuffer[8];   // Starting address
		Tx_Buf[9] = MODBUSDataBuffer[9];   // Start address
		Tx_Buf[10] = MODBUSDataBuffer[10]; // Quantity
		Tx_Buf[11] = MODBUSDataBuffer[11]; // Quantity

		for (i = 0; i < P_RegNum; i++) // Write to registers
		{
			mreg[P_Addr + i] = MODBUSDataBuffer[13 + i * 2]; // Low byte
			mreg[P_Addr + i] |= MODBUSDataBuffer[14 + i * 2] << 8; // High byte
		}
		P_TxCount = 12;

		WCHNET_SocketSend(socketid, Tx_Buf, & P_TxCount); // Socket sends data
	}
    else
        TCP_Exception_RSP(socketid, MODBUSDataBuffer[7], 0x02); // Function code error response
}

/*********************************************************************
 * Function: Exception Response
 * Input parameters: socketid - socket id,_FunCode :function code to send exception,_ExCode: exception code
 * Return value: None
 * Description: Send an exception response when an exception occurs in the communication data frame.
 */
void TCP_Exception_RSP(uint8_t socketid, uint8_t _FunCode, uint8_t _ExCode)
{
    Tx_Buf[0] = MODBUSDataBuffer[0]; // Transaction identifier
    Tx_Buf[1] = MODBUSDataBuffer[1]; // Transaction identifier
    Tx_Buf[2] = MODBUSDataBuffer[2]; // Protocol identifier
    Tx_Buf[3] = MODBUSDataBuffer[3]; // Protocol identifier
    Tx_Buf[4] = 0;                   // Following bytes
    Tx_Buf[5] = 3;                   // Number of bytes to follow
    Tx_Buf[6] = MODBUSDataBuffer[6]; // Station number
    Tx_Buf[7] = _FunCode | 0x80;     // Function code
    Tx_Buf[8] = _ExCode;             // Exception code

    P_TxCount = 9;

    WCHNET_SocketSend(socketid, Tx_Buf, & P_TxCount); // Socket sends data.
}

/*********************************************************************
 * Function: Normal response
 * Input parameters: socket_id - socket id,_FunCode :FunCode
 * Return value: none
 * Description: Send response data frame when communication data frame has no exception and executed successfully.
 */
void MB_TCP_RSP(uint8_t socket_id, uint8_t _FunCode)
{
    P_Addr = ((MODBUSDataBuffer[8] << 8) | MODBUSDataBuffer[9]);     // Register address
    P_RegNum = ((MODBUSDataBuffer[10] << 8) | MODBUSDataBuffer[11]); // Register number

    switch (_FunCode)
    {
        case 01:                        // 0x01 Read Multiple Coils
        case 02:                        // 0x02 Read Multiple Discrete Inputs
            TCP_RSP_01_02(socket_id);
        break;
        case 03:                        // 0x03 Read Multiple Holding Registers
        case 04:                        // 0x04 Read Multiple Input Registers
            TCP_RSP_03_04(socket_id);
            break;
        case 05:                        // 0x05 Write Single Coil
            TCP_RSP_05(socket_id);
            break;
        case 06:                        // 0x06 Write Single Holding Register
            TCP_RSP_06(socket_id);
            break;
        case 15:                        // 0X0F Write Multiple Coils
            TCP_RSP_0F(socket_id);
            break;
        case 16:                        // 0x10 Write Multiple Holding Registers
            TCP_RSP_10(socket_id);
            break;
    }
}

/*********************************************************************
 * Function: Analyze and execute the received data
 * Input parameter: _Socketid - socket id.
 * Return value: None
 * Description: None
 */
void MB_Parse_Data(uint8_t _Socketid, uint32_t  P_RxCount) {

	printf("(P_RxCount - 6) = %d \n", (P_RxCount - 6));
    printf("(MODBUSDataBuffer[5] | MODBUSDataBuffer[4] << 8) = %d \n", (MODBUSDataBuffer[5] | MODBUSDataBuffer[4] << 8));

    if ((P_RxCount - 6) == (MODBUSDataBuffer[5] | MODBUSDataBuffer[4] << 8)) // Validation number
    {
        if (MODBUSDataBuffer[6] < TCP_ALLSLAVEADDR) // Slave ID
        {
            if ((MODBUSDataBuffer[7] == 01) || (MODBUSDataBuffer[7] == 02) || (MODBUSDataBuffer[7] == 03) || (MODBUSDataBuffer[7] == 04) ||
			    (MODBUSDataBuffer[7] == 05) || (MODBUSDataBuffer[7] == 06) || (MODBUSDataBuffer[7] == 15) || (MODBUSDataBuffer[7] == 16)) // Function code
            {
                MB_TCP_RSP(_Socketid, MODBUSDataBuffer[7]); // Normal feedback
            } else {
                printf("Function code error response\n");
                TCP_Exception_RSP(_Socketid, MODBUSDataBuffer[7], 0x01); // Function code error response
            }
        } else {
            printf("Station number error response\n");
            TCP_Exception_RSP(_Socketid, MODBUSDataBuffer[7], 0x03); // ID station number error response
        }
    } else {
        printf("Quantity error response\n");
        TCP_Exception_RSP(_Socketid, MODBUSDataBuffer[7], 0x04); // Quantity error response
    }
    P_RxCount = 0;
}
