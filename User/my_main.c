/*
 * my_main.c
 *
 *  Created on: Aug 2, 2023
 *      Author: abdo
 */

#include "main.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "queue.h"
#include "semphr.h"
#include "event_groups.h"

TaskHandle_t TaskHandle_1;
TaskHandle_t TaskHandle_2;
TaskHandle_t TaskHandle_3;
TaskHandle_t TaskHandle_4;
TaskHandle_t TaskHandle_5;

/* Local Tasks declaration */
static void MyTask1(void *pvParameters);
static void MyTask2(void *pvParameters);
static void MyTask3(void *pvParameters);
static void MyTask4(void *pvParameters);
static void MyTask5(void *pvParameters);
static void MyIdleTask(void *pvParameters);
void my_main(void) {

	// Segger System View Configuration
	// 1- Enable  CYCCNT (Cycle Counter Register) for Segger SystemView
	DWT->CTRL |= (1 << 0);

	// 2-  Start Recording
	SEGGER_SYSVIEW_Conf();
	vSetVarulMaxPRIGROUPValue();
	SEGGER_SYSVIEW_Start();
	SEGGER_SYSVIEW_Print("Hello From Programm. \n"); // some text to check if J_Link RTT Viewer is working

	//3- Create Tasks	/* Create the 2 tasks with priorities 1 and 3. */
	xTaskCreate((TaskFunction_t) MyTask1, (const char*) "Task1",
	configMINIMAL_STACK_SIZE, NULL, 1, &TaskHandle_1);
	xTaskCreate(MyTask3, (const char*) "Task3", configMINIMAL_STACK_SIZE, NULL,
			3, &TaskHandle_3);

	xTaskCreate(MyIdleTask, (const char*) "IdleTask", configMINIMAL_STACK_SIZE,
	NULL, tskIDLE_PRIORITY, NULL);

	vTaskStartScheduler(); /* Start the schedular */
	while (1) {

	}
}

static void MyTask1(void *pvParameters) {

	SEGGER_SYSVIEW_Print("\n\rIn Task1");
	vTaskDelete(TaskHandle_1);
}

static void MyTask2(void *pvParameters) {
	SEGGER_SYSVIEW_Print("\n\rIn Task2 ");
	vTaskDelete(TaskHandle_2);
}

static void MyTask3(void *pvParameters) {

	SEGGER_SYSVIEW_Print("\n\rTask3, creating new tasks 2");

	/* Create two new tasks 2, 4 */
	xTaskCreate(MyTask2, (const char*) "Task2", configMINIMAL_STACK_SIZE, NULL,
			2, &TaskHandle_2);
	taskENTER_CRITICAL();
	SEGGER_SYSVIEW_Print("\n\rTask3, creating new tasks 4");

	xTaskCreate(MyTask4, (const char*) "Task4", configMINIMAL_STACK_SIZE, NULL,
			4, &TaskHandle_4);

	SEGGER_SYSVIEW_Print("\n\rBack in Task3, Creating Task5");

	xTaskCreate(MyTask5, (const char*) "Task5", configMINIMAL_STACK_SIZE, NULL,
			5, &TaskHandle_5);
	taskEXIT_CRITICAL();

	SEGGER_SYSVIEW_Print("\n\rBack in Task3, Exiting task3");

	vTaskDelete(TaskHandle_3);

}

static void MyTask4(void *pvParameters) {

	SEGGER_SYSVIEW_Print("\n\rIn Task4");
	vTaskDelete(TaskHandle_4);
}

static void MyTask5(void *pvParameters) {

	SEGGER_SYSVIEW_Print("\n\rIn Task5");
	vTaskDelete(TaskHandle_5);
}

static void MyIdleTask(void *pvParameters) {
	SEGGER_SYSVIEW_Print("\n\rIn idle state");
	while (1) {

	}
}

