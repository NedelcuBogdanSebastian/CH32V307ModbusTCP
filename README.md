
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

    Extern socket function !!! defined in main.h
    Line 272 in main.c turn Red LED on when TCP link error/cable unpluged
