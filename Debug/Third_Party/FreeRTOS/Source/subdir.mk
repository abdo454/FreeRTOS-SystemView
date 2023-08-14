################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS/Source/croutine.c \
../Third_Party/FreeRTOS/Source/event_groups.c \
../Third_Party/FreeRTOS/Source/list.c \
../Third_Party/FreeRTOS/Source/queue.c \
../Third_Party/FreeRTOS/Source/stream_buffer.c \
../Third_Party/FreeRTOS/Source/tasks.c \
../Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./Third_Party/FreeRTOS/Source/croutine.o \
./Third_Party/FreeRTOS/Source/event_groups.o \
./Third_Party/FreeRTOS/Source/list.o \
./Third_Party/FreeRTOS/Source/queue.o \
./Third_Party/FreeRTOS/Source/stream_buffer.o \
./Third_Party/FreeRTOS/Source/tasks.o \
./Third_Party/FreeRTOS/Source/timers.o 

C_DEPS += \
./Third_Party/FreeRTOS/Source/croutine.d \
./Third_Party/FreeRTOS/Source/event_groups.d \
./Third_Party/FreeRTOS/Source/list.d \
./Third_Party/FreeRTOS/Source/queue.d \
./Third_Party/FreeRTOS/Source/stream_buffer.d \
./Third_Party/FreeRTOS/Source/tasks.d \
./Third_Party/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS/Source/%.o Third_Party/FreeRTOS/Source/%.su Third_Party/FreeRTOS/Source/%.cyclo: ../Third_Party/FreeRTOS/Source/%.c Third_Party/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F412Zx -c -I../Core/Inc -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/User" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/SEGGER/Syscalls" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/config" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/Config" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/OS" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/SEGGER/SEGGER" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source/include" -I"/home/abdo/work/STM32/RTOS_workspace/FreeRTOS_Template/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2f-Source

clean-Third_Party-2f-FreeRTOS-2f-Source:
	-$(RM) ./Third_Party/FreeRTOS/Source/croutine.cyclo ./Third_Party/FreeRTOS/Source/croutine.d ./Third_Party/FreeRTOS/Source/croutine.o ./Third_Party/FreeRTOS/Source/croutine.su ./Third_Party/FreeRTOS/Source/event_groups.cyclo ./Third_Party/FreeRTOS/Source/event_groups.d ./Third_Party/FreeRTOS/Source/event_groups.o ./Third_Party/FreeRTOS/Source/event_groups.su ./Third_Party/FreeRTOS/Source/list.cyclo ./Third_Party/FreeRTOS/Source/list.d ./Third_Party/FreeRTOS/Source/list.o ./Third_Party/FreeRTOS/Source/list.su ./Third_Party/FreeRTOS/Source/queue.cyclo ./Third_Party/FreeRTOS/Source/queue.d ./Third_Party/FreeRTOS/Source/queue.o ./Third_Party/FreeRTOS/Source/queue.su ./Third_Party/FreeRTOS/Source/stream_buffer.cyclo ./Third_Party/FreeRTOS/Source/stream_buffer.d ./Third_Party/FreeRTOS/Source/stream_buffer.o ./Third_Party/FreeRTOS/Source/stream_buffer.su ./Third_Party/FreeRTOS/Source/tasks.cyclo ./Third_Party/FreeRTOS/Source/tasks.d ./Third_Party/FreeRTOS/Source/tasks.o ./Third_Party/FreeRTOS/Source/tasks.su ./Third_Party/FreeRTOS/Source/timers.cyclo ./Third_Party/FreeRTOS/Source/timers.d ./Third_Party/FreeRTOS/Source/timers.o ./Third_Party/FreeRTOS/Source/timers.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2f-Source

