# FreeRTOS-SystemView

This is a Template For Using FeeRTOS with Segger SysView.

            SystemView version: 3.50  
            FreeRTOS Kernel 	V10.4.3
            STM32F412ZGT6
            Ubuntu 		22.04 LTS
            
####  FreeRTOS with SystemView

    void my_main(void) {
        // Segger System View Configuration
    	// 1- Enable  CYCCNT (Cycle Counter Register) for Segger SystemView
    	DWT->CTRL |= (1 << 0);
    	
    	// 2-  Start Recording
    	SEGGER_SYSVIEW_Conf();
    	vSetVarulMaxPRIGROUPValue();
    	SEGGER_SYSVIEW_Start();
    	SEGGER_SYSVIEW_Print("Hello From Programm. \n"); // some text to check if J_Link RTT Viewer is working
    	...
    	...
    	//3- Create Tasks
    	...
    	//4-Start the schedular
        vTaskStartScheduler();
        while (1) {
        }
    }

the template has example about Task Creation and Deletion with The Following output:

 ![Flash module organization](https://github.com/abdo454/FreeRTOS-SystemView/blob/main/User/my_main_example.png?raw=true)

--------
* Note : 
 SEGGER requires use of J-Link. So SEGGER offers a firmware to upgrade the ST-LINK on-board on the Nucleo and Discovery Boards Into a J-Link. For More information, follow the link [Converting ST-LINK On-Board Into a J-Link](https://www.segger.com/products/debug-probes/j-link/models/other-j-links/st-link-on-board/)


		
Get the systemview RTT buffer address and the number of bytes used.
		
```
    _SEGGER_RTT.aUp[1].pBuffer	//start Address of RTT Buffer )
	_SEGGER_RTT.aUp[1].WrOff	// Size of Vaild Data available in the buffer
```

Note: 
there is a problem which caused by the no initialization of variable **ulMaxPRIGROUPValue**, So you have to call the
function vSetVarulMaxPRIGROUPValue()  before calling SEGGER_SYSVIEW_Start(), as shown in the Template inside my_main() function.

the function defintion is as follow:

    //###########################################################
    // Add function below in file portmacro.h
    #ifdef configASSERT
    	void vSetVarulMaxPRIGROUPValue( void );
    #endif
    //###########################################################
    // Add function below in file port.c
    #if( configASSERT_DEFINED == 1 )
    void vSetVarulMaxPRIGROUPValue( void )
    {
    	volatile uint8_t * const pucFirstUserPriorityRegister = ( volatile uint8_t * const ) ( portNVIC_IP_REGISTERS_OFFSET_16 + portFIRST_USER_INTERRUPT_NUMBER );
    	volatile uint8_t ucMaxPriorityValue;
    	/* Determine the number of priority bits available.  First write to all
    	possible bits. */
    	*pucFirstUserPriorityRegister = portMAX_8_BIT_VALUE;
    	/* Read the value back to see how many bits stuck. */
    	ucMaxPriorityValue = *pucFirstUserPriorityRegister;
    	/* Calculate the maximum acceptable priority group value for the number
    	of bits read back. */
    	ulMaxPRIGROUPValue = portMAX_PRIGROUP_BITS;
    	while( ( ucMaxPriorityValue & portTOP_BIT_OF_BYTE ) == portTOP_BIT_OF_BYTE )
    	{
    		ulMaxPRIGROUPValue--;
    		ucMaxPriorityValue <<= ( uint8_t ) 0x01;
    	}
    #ifdef __NVIC_PRIO_BITS
    	{
    		/* Check the CMSIS configuration that defines the number of
    		priority bits matches the number of priority bits actually queried
    		from the hardware. */
    		configASSERT( ( portMAX_PRIGROUP_BITS - ulMaxPRIGROUPValue ) == __NVIC_PRIO_BITS );
    	}
    #endif
    #ifdef configPRIO_BITS
    	{
    		/* Check the FreeRTOS configuration that defines the number of
    		priority bits matches the number of priority bits actually queried
    		from the hardware. */
    		configASSERT( ( portMAX_PRIGROUP_BITS - ulMaxPRIGROUPValue ) == configPRIO_BITS );
    	}
    #endif
    	/* Shift the priority group value back to its position within the AIRCR
    	register. */
    	ulMaxPRIGROUPValue <<= portPRIGROUP_SHIFT;
    	ulMaxPRIGROUPValue &= portPRIORITY_GROUP_MASK;
    }
    #endif /* conifgASSERT_DEFINED */



