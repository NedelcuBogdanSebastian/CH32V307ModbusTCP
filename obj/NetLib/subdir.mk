################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../NetLib/eth_driver_10M.c 

OBJS += \
./NetLib/eth_driver_10M.o 

C_DEPS += \
./NetLib/eth_driver_10M.d 


# Each subdirectory must supply rules for building sources it contributes
NetLib/eth_driver_10M.o: C:/Users/Bogdan/mrs_community_workspace3/CH32V307ModbusTCP/NetLib/eth_driver_10M.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Core" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Debug" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\Modbus" -I"C:\Users\Bogdan\mrs_community_workspace3\CH32V307ModbusTCP\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


