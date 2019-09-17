



/******************************************************************************
* file: minmax.s
* author: Arun Madhavan : CS18M510
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  This is the code for assignment 2: Finding Maximum, Minimum and number of elements in the given array
  */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_items: .word 10, 4, 28, 100, 56, 23, 1, 98, 320, 600, 200, 8, 0 @ 0 is used to terminate the data

  @ TEXT section
      .text

.globl _main


_main:

	LDR r4, =data_items @ get the address of data_items
	LDR r0, [r4] 		@ get value of first element of data_items and store in r0
	
	MOV r5, #0			@Counter for getting number of elements
	MOV r2, r0 			@MAX value will be saved in r2, initial value is set as starting element value in r0
	MOV r3, r0 			@MIN value will be saved in r3, initial value is set as starting element value in r0

	LOOP:
		CMP r0, #0		@Compare each element with 0 to check for termination
		BEQ end			@If 0, then terminate with r5 as number of elements, r2 as max element and r3 as min element
		CMP r2, r0		@Compare the max value in r2 with current array element in r0 
		MOVLT r2, r0	@If max value r2 is less then move current array element in r0 to r2 as new max value 
		CMP r3, r0		@Compare the min value in r3 with current array element in r0 
		MOVGT r3, r0	@If min value r2 is greater then move current array element in r0 to r2 as new min value 
		ADD r5, r5, #1	@Increment the Counter r5 by #1 to count number of elements
		ADD r4, r4, #4	@Add the word size(#4) to r4(current address) to get the address of next element in array
		LDR r0, [r4]	@Load r0 with value of new element at new updated address r4
		B LOOP			@Jump to LOOP

	end:
		@At this point below register holds the required output values:
			@r5: Number of Elements in the array data_items
			@r2: Maximum element present in the array of data_items
			@r3: Minimum element present in the array of data_items


       