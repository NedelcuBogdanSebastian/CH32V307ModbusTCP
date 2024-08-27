################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Modbus/sav/Modbus_TCP_slave.c 

OBJS += \
./Modbus/sav/Modbus_TCP_slave.o 

C_DEPS += \
./Modbus/sav/Modbus_TCP_slave.d 


# Each subdirectory must supply rules for building sources it contributes
Modbus/sav/%.o: ../Modbus/sav/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"C:\Users\Bogdan\mrs_community_workspace\WebServer\NetLib" -I"C:\Users\Bogdan\mrs_community_workspace3\WebServer\HTTP" -I"C:\Users\Bogdan\mrs_community_workspace3\WebServer\CRC16" -I"C:\Users\Bogdan\mrs_community_workspace\WebServer\Core" -I"C:\Users\Bogdan\mrs_community_workspace\WebServer\Debug" -I"C:\Users\Bogdan\mrs_community_workspace\WebServer\Peripheral\inc" -I"C:\Users\Bogdan\mrs_community_workspace3\WebServer\User" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


