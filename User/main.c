/********************************** (C) COPYRIGHT *******************************
* File Name          : main.c
* Author             : Nedelcu Bogdan Sebastian
* Version            : V1.0.0
* Date               : 27/August/2024
* Description        : Main program body.
*********************************************************************************
* Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
* Attention: This software (modified or not) and binary are used for
* microcontroller manufactured by Nanjing Qinheng Microelectronics.
*******************************************************************************/

/****************************** readme.md file ************************************
                           MounRiver Studio_Community
                                Version: v1.50

                           Nedelcu Bogdan Sebastian
                                27/August/2024
                     Modbus TCP stack running on CH32V307VCT6
***********************************************************************************

    SPECIAL THANKS => <<<XuPing>>> for help with ModbusTCP library. Some modfications were made.

    Red LED A15
    Blue LED PB4

    Debug messages on USART1 (TX - PA9)

    ModbusTCP running on IP = 192.168.43.10, PORT = 502

    To test Modbus we need RMMS utility (Radzio! Modbus Master Simulator):

        https://en.radzio.dxp.pl/modbus-master-simulator/

    Line 29 in net_config.h. WCHNET_NUM_TCP_LISTEN changed to 3 from 2 to allow more clients

    ===>>> Delay_ms & Delay_us removed from eth_driver_10M.c - we use SysTick now !!!!
        Line 545 on ReInitMACReg we commented a Delay_Us
        Line 786 on ETH_Configuration we commented a Delay_Us
        Line 943 eth_driver_10M.c commented a Delay_ms
	
    Line 272 in main.c turn Red LED on when TCP link error/cable unpluged
 */

#include "string.h"
#include "eth_driver.h"
#include "main.h"
#include "ModbusTCP.h"

volatile uint32_t TimingDelay;

uint8_t coil[100];  // Coils
uint16_t mreg[100]; // Holding Registers

#define RED_LED_ON        GPIOA->BSHR = GPIO_Pin_15
#define RED_LED_OFF       GPIOA->BCR = GPIO_Pin_15
#define RED_LED_TOGGLE    GPIOA->OUTDR ^= GPIO_Pin_15
#define BLUE_LED_TOGGLE   GPIOB->OUTDR ^= GPIO_Pin_4

#define MODBUS_SERVER_PORT    502

u8 socket, SocketId, SocketIdForListen;

u8 MODBUSDataBuffer[RECE_BUF_LEN];

u8 SocketRecvBuf[WCHNET_MAX_SOCKET_NUM][RECE_BUF_LEN]; // Socket receive buffer

u8 IPAddr[4] = {192, 168, 43, 10};  // IP address
u8 IPMask[4] = {255, 255, 255, 0};  // Subnet mask
u8 GWIPAddr[4] = {192, 168, 43, 1}; // Gateway IP address
u8 MACAddr[6] = {0, 0, 0, 0, 0, 0}; // MAC address

/*********************************************************************
 * @fn      SYSTICK_Init_Config
 *
 * @brief   SYSTICK_Init_Config.
 *
 * @return  none
 */
void SysTick_Config(u_int64_t ticks)
{
    SysTick->SR &= ~(1 << 0);//clear State flag
    SysTick->CMP = ticks;
    SysTick->CNT = 0;
    SysTick->CTLR = 0xF;

    NVIC_SetPriority(SysTicK_IRQn, 15);
    NVIC_EnableIRQ(SysTicK_IRQn);
}

/*********************************************************************
 * @fn      mStopIfError
 *
 * @brief   check if error.
 *
 * @param   iError - error constants.
 *
 * @return  none
 */
void mStopIfError(u8 iError)
{
    if (iError == WCHNET_ERR_SUCCESS)
        return;
    printf("Error: %02X\r\n", (u16) iError);
}

/*********************************************************************
 * @fn      TIM2_Init
 *
 * @brief   Initializes TIM2.
 *
 * @return  none
 */
void TIM2_Init(void)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure = { 0 };

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);

    TIM_TimeBaseStructure.TIM_Period = SystemCoreClock / 1000000;
    TIM_TimeBaseStructure.TIM_Prescaler = WCHNETTIMERPERIOD * 1000 - 1;
    TIM_TimeBaseStructure.TIM_ClockDivision = 0;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
    TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);

    TIM_Cmd(TIM2, ENABLE);
    TIM_ClearITPendingBit(TIM2, TIM_IT_Update);
    NVIC_EnableIRQ(TIM2_IRQn);
}


/*********************************************************************
 * @fn      WCHNET_CreateMODBUSSocket
 *
 * @brief   Create socket used for ModbusTCP.
 *          WCHNET establishes the corresponding socket.
 *
 * @return  none
 */
void WCHNET_CreateMODBUSSocket(void)
{
	/*
    u8 i;
    SOCK_INF TmpSocketInf;

    memset((void *) &TmpSocketInf, 0, sizeof(SOCK_INF));
    //printf("Create ModbusTCP socket\n");
    TmpSocketInf.ProtoType = PROTO_TYPE_TCP;
    TmpSocketInf.SourPort = MODBUS_SERVER_PORT;
    i = WCHNET_SocketCreat(&SocketId, &TmpSocketInf);
    printf(" ==== Modbus Socket Id %d\r\n", SocketIdForListen);
    mStopIfError(i);
    i = WCHNET_SocketListen(SocketId);
    mStopIfError(i);
    */

    u8 i;
    SOCK_INF TmpSocketInf;

    memset((void *) &TmpSocketInf, 0, sizeof(SOCK_INF));
    TmpSocketInf.SourPort = MODBUS_SERVER_PORT;
    TmpSocketInf.ProtoType = PROTO_TYPE_TCP;
    i = WCHNET_SocketCreat(&SocketIdForListen, &TmpSocketInf);
    printf(" ==== Modbus Socket Id %d\r\n", SocketIdForListen);
    mStopIfError(i);
    i = WCHNET_SocketListen(SocketIdForListen);
    mStopIfError(i);
}


/*********************************************************************
 * @fn      WCHNET_HandleSockInt
 *
 * @brief   Socket Interrupt Handle
 *
 * @param   socketid - socket id.
 *          intstat - interrupt status
 *
 * @return  none
 */
void WCHNET_HandleSockInt(u8 socketid, u8 intstat)
{
    u32 len;

    // Receive data
    if (intstat & SINT_STAT_RECV)
    {
        len = WCHNET_SocketRecvLen(socketid, NULL);

        // Receive MODBUS data
        if (SocketInf[socketid].SourPort == MODBUS_SERVER_PORT)
        {
        	socket = socketid;
            WCHNET_SocketRecv(socketid, MODBUSDataBuffer, &len);
            printf(" ==== MODBUS socket received data length:%d\r\n",len);
            // Parse Modbus data
            MB_Parse_Data(socketid, len);

            // Modbus socket must be open all the time!
            /*After the request is processed, the current
             * socket connection is closed, and a new connection
             * will be established when the browser sends the next
             * request.*/
            //WCHNET_SocketClose(socket, TCP_CLOSE_NORMAL);

            // Clear HTTP data buffer
            memset(MODBUSDataBuffer, 0, sizeof(MODBUSDataBuffer));

            // Toggle led on Modbus call
            RED_LED_TOGGLE;
        }
    }

    // Connect successfully
    if (intstat & SINT_STAT_CONNECT)
    {
        WCHNET_ModifyRecvBuf(socketid, (u32)SocketRecvBuf[socketid], RECE_BUF_LEN);
        printf(" ==== TCP socket %d connected\n", socketid);
    }

    // Disconnect
    if (intstat & SINT_STAT_DISCONNECT)
    {
        printf(" ==== TCP socket %d disconnected\n", socketid);
    }
}

/*********************************************************************
 * @fn      WCHNET_HandleGlobalInt
 *
 * @brief   Global Interrupt Handle
 *
 * @return  none
 */
void WCHNET_HandleGlobalInt(void)
{
    u8 intstat;
    u16 i;
    u8 socketint;

    // Get global interrupt flag
    intstat = WCHNET_GetGlobalInt();

    // Unreachable interrupt
    if (intstat & GINT_STAT_UNREACH)
    {
        printf("GINT_STAT_UNREACH\n");
    }

    //IP conflict
    if (intstat & GINT_STAT_IP_CONFLI)
    {
        printf("GINT_STAT_IP_CONFLI\n");
    }

    // PHY status change
    if (intstat & GINT_STAT_PHY_CHANGE)
    {
        i = WCHNET_GetPHYStatus();
        if (i & PHY_Linked_Status)
        {
            printf(" ==== PHY Link Success\n");
            RED_LED_OFF;
        }
        else
        {
        	// Signall TCP link error if cable is plugged/unplugged
        	printf(" ==== PHY Link Lost\n");
        	RED_LED_ON;
        }
    }

    // Socket related interrupt
    if (intstat & GINT_STAT_SOCKET)
    {
        for (i = 0; i < WCHNET_MAX_SOCKET_NUM; i++)
        {
            socketint = WCHNET_GetSocketInt(i);
            if (socketint)
                WCHNET_HandleSockInt(i, socketint);
        }
    }
}

/*********************************************************************
 * @fn      GPIOInit
 *
 * @brief   GPIO initialization Red & Blue LEDS, PA15 & PB4
 *
 * @return  none
 */
void GPIOInit(void)
{
	GPIO_InitTypeDef GPIO_InitStructure = {0};

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
}

/*********************************************************************
 * @fn      main
 *
 * @brief   Main program
 *
 * @return  none
 */
int main(void)
{
    u8 i;

    SystemCoreClockUpdate();

	TimingDelay = 0;

	// SysTick counts miliseconds
	SysTick_Config(SystemCoreClock/1000-1);

	// 500 ms delay to allow system to stabilize
	TimingDelay = 500;
    while (TimingDelay != 0x00);

    USART_Printf_Init(115200);
    GPIOInit();

    printf("======== ModbusTCP Server =========\n");
    printf("SystemClk:%d\n", SystemCoreClock);
    printf("ChipID:%08x\n", DBGMCU_GetCHIPID());
    printf("net version:%x\n", WCHNET_GetVer());
    if (WCHNET_LIB_VER != WCHNET_GetVer()) {
        printf("version error.\n");
    }

    WCHNET_GetMacAddr(&MACAddr[0]);

    printf("MAC Address: ");
    for(i = 0; i < 6; i++)
        printf("%x ", MACAddr[i]);
    printf("\n");

    // Ethernet library timer
    TIM2_Init();

	// 500 ms delay to allow TIM2 to stabilize
	TimingDelay = 500;
    while (TimingDelay != 0x00);

    // In line 943 eth_driver_10M.c commented a Delay_ms !!!!!! - we use SysTick now !!!!
    // Also in line 545 on ReInitMACReg we commented a Delay_Us
    // Also in line 786 on ETH_Configuration we commented a Delay_Us
    //Ethernet library initialize
    i = ETH_LibInit(IPAddr, GWIPAddr, IPMask, MACAddr);

    mStopIfError(i);

    if (i == WCHNET_ERR_SUCCESS)
        printf("WCHNET_LibInit Success\n");
    printf("===================================\n");

    //Create TCP Socket
    WCHNET_CreateMODBUSSocket();

    while(1)
    {
        // Ethernet library main task function,
        // which needs to be called cyclically
        WCHNET_MainTask();
        // Query the Ethernet global interrupt,
        // if there is an interrupt, call the global interrupt handler
        if(WCHNET_QueryGlobalInt())
        {
        	WCHNET_HandleGlobalInt();
        }
    }
}

