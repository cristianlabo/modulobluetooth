################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/src/FreeRTOSCommonHooks.c \
../freertos/src/croutine.c \
../freertos/src/event_groups.c \
../freertos/src/heap_3.c \
../freertos/src/list.c \
../freertos/src/port.c \
../freertos/src/queue.c \
../freertos/src/redlib_memfix.c \
../freertos/src/tasks.c \
../freertos/src/timers.c 

OBJS += \
./freertos/src/FreeRTOSCommonHooks.o \
./freertos/src/croutine.o \
./freertos/src/event_groups.o \
./freertos/src/heap_3.o \
./freertos/src/list.o \
./freertos/src/port.o \
./freertos/src/queue.o \
./freertos/src/redlib_memfix.o \
./freertos/src/tasks.o \
./freertos/src/timers.o 

C_DEPS += \
./freertos/src/FreeRTOSCommonHooks.d \
./freertos/src/croutine.d \
./freertos/src/event_groups.d \
./freertos/src/heap_3.d \
./freertos/src/list.d \
./freertos/src/port.d \
./freertos/src/queue.d \
./freertos/src/redlib_memfix.d \
./freertos/src/tasks.d \
./freertos/src/timers.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/src/%.o: ../freertos/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -D__USE_LPCOPEN -D__REDLIB__ -DCORE_M4 -D__MULTICORE_NONE -I"C:\Users\cmg-8\Documents\LPCXpresso_8.2.0_647\workspace-modulo-bluetooth\modulobluetooth\lpc_chip_43xx\inc" -I"C:\Users\cmg-8\Documents\LPCXpresso_8.2.0_647\workspace-modulo-bluetooth\modulobluetooth\lpc_board_nxp_lpcxpresso_4337\inc" -I"C:\Users\cmg-8\Documents\LPCXpresso_8.2.0_647\workspace-modulo-bluetooth\modulobluetooth\freertos_examples_10_to_16\example\inc" -I"C:\Users\cmg-8\Documents\LPCXpresso_8.2.0_647\workspace-modulo-bluetooth\modulobluetooth\freertos_examples_10_to_16\freertos\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fsingle-precision-constant -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


