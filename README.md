# FreeRTOS-SystemView

This is a Template For Using FeeRTOS + Segger SysView + STM32CUBEID

            SystemView version: 3.50  
            FreeRTOS Kernel V10.4.3
            STM32F412ZGT6


####  FreeRTOS with SystemView


    int main(void) {
	...
	...
	...
	/* USER CODE BEGIN 2 */
	// 1- Enable  CYCCNT (Cycle Counter Register) for Segger SystemView
	DWT->CTRL |= (1 << 0);
	
	// 2-  Start Recording 
	SEGGER_SYSVIEW_Conf();
	//vSetVarulMaxPRIGROUPValue();	// uncomment for Single-shot recording 
	//SEGGER_SYSVIEW_Start();	// uncomment for Single-shot recording 
	...
	...
	...
	/* USER CODE END 2 */
Note :

* Single-shot recording : add these functions

        vSetVarulMaxPRIGROUPValue();
        SEGGER_SYSVIEW_Start();
	
* Continues recording	: Comment them

        //vSetVarulMaxPRIGROUPValue();
        //SEGGER_SYSVIEW_Start(); 
		
Get the systemview RTT buffer address and the number of bytes used.
		
```
    _SEGGER_RTT.aUp[1].pBuffer	//start Address of RTT Buffer )
	_SEGGER_RTT.aUp[1].WrOff	// Size of Vaild Data available in the buffer
```

Note:
there is a problem caused by the no initialization of variable **ulMaxPRIGROUPValue** before start, call
Function vSetVarulMaxPRIGROUPValue()  before the SEGGER_SYSVIEW_Start().

Following the function defintion:

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



