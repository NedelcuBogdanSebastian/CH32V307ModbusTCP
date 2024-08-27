################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Peripheral/src/ch32v30x_adc.c \
../Peripheral/src/ch32v30x_bkp.c \
../Peripheral/src/ch32v30x_can.c \
../Peripheral/src/ch32v30x_crc.c \
../Peripheral/src/ch32v30x_dac.c \
../Peripheral/src/ch32v30x_dbgmcu.c \
../Peripheral/src/ch32v30x_dma.c \
../Peripheral/src/ch32v30x_dvp.c \
../Peripheral/src/ch32v30x_eth.c \
../Peripheral/src/ch32v30x_exti.c \
../Peripheral/src/ch32v30x_flash.c \
../Peripheral/src/ch32v30x_fsmc.c \
../Peripheral/src/ch32v30x_gpio.c \
../Peripheral/src/ch32v30x_i2c.c \
../Peripheral/src/ch32v30x_iwdg.c \
../Peripheral/src/ch32v30x_misc.c \
../Peripheral/src/ch32v30x_opa.c \
../Peripheral/src/ch32v30x_pwr.c \
../Peripheral/src/ch32v30x_rcc.c \
../Peripheral/src/ch32v30x_rng.c \
../Peripheral/src/ch32v30x_rtc.c \
../Peripheral/src/ch32v30x_sdio.c \
../Peripheral/src/ch32v30x_spi.c \
../Peripheral/src/ch32v30x_tim.c \
../Peripheral/src/ch32v30x_usart.c \
../Peripheral/src/ch32v30x_wwdg.c 

OBJS += \
./Peripheral/src/ch32v30x_adc.o \
./Peripheral/src/ch32v30x_bkp.o \
./Peripheral/src/ch32v30x_can.o \
./Peripheral/src/ch32v30x_crc.o \
./Peripheral/src/ch32v30x_dac.o \
./Peripheral/src/ch32v30x_dbgmcu.o \
./Peripheral/src/ch32v30x_dma.o \
./Peripheral/src/ch32v30x_dvp.o \
./Peripheral/src/ch32v30x_eth.o \
./Peripheral/src/ch32v30x_exti.o \
./Peripheral/src/ch32v30x_flash.o \
./Peripheral/src/ch32v30x_fsmc.o \
./Peripheral/src/ch32v30x_gpio.o \
./Peripheral/src/ch32v30x_i2c.o \
./Peripheral/src/ch32v30x_iwdg.o \
./Peripheral/src/ch32v30x_misc.o \
./Peripheral/src/ch32v30x_opa.o \
./Peripheral/src/ch32v30x_pwr.o \
./Peripheral/src/ch32v30x_rcc.o \
./Peripheral/src/ch32v30x_rng.o \
./Peripheral/src/ch32v30x_rtc.o \
./Peripheral/src/ch32v30x_sdio.o \
./Peripheral/src/ch32v30x_spi.o \
./Peripheral/src/ch32v30x_tim.o \
./Peripheral/src/ch32v30x_usart.o \
./Peripheral/src/ch32v30x_wwdg.o 

C_DEPS += \
./Peripheral/src/ch32v30x_adc.d \
./Peripheral/src/ch32v30x_bkp.d \
./Peripheral/src/ch32v30x_can.d \
./Peripheral/src/ch32v30x_crc.d \
./Peripheral/src/ch32v30x_dac.d \
./Peripheral/src/ch32v30x_dbgmcu.d \
./Peripheral/src/ch32v30x_dma.d \
./Peripheral/src/ch32v30x_dvp.d \
./Peripheral/src/ch32v30x_eth.d \
./Peripheral/src/ch32v30x_exti.d \
./Peripheral/src/ch32v30x_flash.d \
./Peripheral/src/ch32v30x_fsmc.d \
./Peripheral/src/ch32v30x_gpio.d \
./Peripheral/src/ch32v30x_i2c.d \
./Peripheral/src/ch32v30x_iwdg.d \
./Peripheral/src/ch32v30x_misc.d \
./Peripheral/src/ch32v30x_opa.d \
./Peripheral/src/ch32v30x_pwr.d \
./Peripheral/src/ch32v30x_rcc.d \
./Peripheral/src/ch32v30x_rng.d \
./Peripheral/src/ch32v30x_rtc.d \
./Peripheral/src/ch32v30x_sdio.d \
./Peripheral/src/ch32v30x_spi.d \
./Peripheral/src/ch32v30x_tim.d \
./Peripheral/src/ch32v30x_usart.d \
./Peripheral/src/ch32v30x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
Peripheral/src/ch32v30x_adc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_bkp.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_bkp.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_can.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_can.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_crc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_crc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_dac.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_dac.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_dbgmcu.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_dbgmcu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_dma.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_dma.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_dvp.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_dvp.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_eth.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_eth.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_exti.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_exti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_flash.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_flash.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_fsmc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_fsmc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_gpio.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_i2c.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_iwdg.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_iwdg.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_misc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_misc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_opa.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_opa.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_pwr.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_pwr.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_rcc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_rcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_rng.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_rng.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_rtc.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_rtc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_sdio.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_sdio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_spi.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_tim.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_tim.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_usart.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_usart.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Peripheral/src/ch32v30x_wwdg.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/Peripheral/src/ch32v30x_wwdg.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


