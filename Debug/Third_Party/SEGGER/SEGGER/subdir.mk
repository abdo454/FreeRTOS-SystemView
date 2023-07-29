################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/SEGGER/SEGGER/SEGGER_RTT.c \
../Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.c \
../Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../Third_Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT.o \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT.d \
./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/SEGGER/SEGGER/%.o Third_Party/SEGGER/SEGGER/%.su Third_Party/SEGGER/SEGGER/%.cyclo: ../Third_Party/SEGGER/SEGGER/%.c Third_Party/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F412Zx -c -I../Core/Inc -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/SEGGER/Syscalls" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/config" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/Config" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/OS" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/SEGGER" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source/include" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third_Party/SEGGER/SEGGER/%.o: ../Third_Party/SEGGER/SEGGER/%.S Third_Party/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Third_Party-2f-SEGGER-2f-SEGGER

clean-Third_Party-2f-SEGGER-2f-SEGGER:
	-$(RM) ./Third_Party/SEGGER/SEGGER/SEGGER_RTT.cyclo ./Third_Party/SEGGER/SEGGER/SEGGER_RTT.d ./Third_Party/SEGGER/SEGGER/SEGGER_RTT.o ./Third_Party/SEGGER/SEGGER/SEGGER_RTT.su ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.cyclo ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.d ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.o ./Third_Party/SEGGER/SEGGER/SEGGER_RTT_printf.su ./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.cyclo ./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.o ./Third_Party/SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-Third_Party-2f-SEGGER-2f-SEGGER

