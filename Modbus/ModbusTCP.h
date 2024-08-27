/********************************** (C) COPYRIGHT ***********************************
 * File Name : Modbus_TCP_slave.h
 * Author : XuPing
 * Version : V1.0.0
 * Date : 2023/10/19
 * Description : This file contains the headers of the Modbus TCP protocol.
 * Modified : 27/August/2024 by Nedelcu Bogdan Sebastian
 *******************************************************************************/

#ifndef __MODBUSTCP_H__
#define __MODBUSTCP_H__

/* Include header file ----------------------------------------------------------------*/

/* Type definition ------------------------------------------------------------------*/

/* Macro definition --------------------------------------------------------------------*/
#define TCP_ALLSLAVEADDR 255
#define TCP_MAX 100

/* Extended variables ------------------------------------------------------------------*/

/* Function declaration ------------------------------------------------------------------*/
void MB_Parse_Data(uint8_t _Socketid, uint32_t  P_RxCount); // mosbus TCP parsing data

#endif

/********************************* END OF FILE ************************************/
