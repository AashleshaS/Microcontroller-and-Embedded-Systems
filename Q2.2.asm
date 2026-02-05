;Setup Input Values
MOV 50H, #04H     
MOV 51H, #04H    

;Load Values into Registers 
MOV A, 50H
MOV R0, A     
MOV A, 51H
MOV R1, A     

;Comparison Loop
COMPARE_LOOP:
    ;Check if A is 0?
    MOV A, R0
    JZ CHECK_B_ZERO 

    ;Check if B is 0?
    MOV A, R1
    JZ A_IS_GREATER 

    ;If neither is zero, dec both and loop
    DEC R0
    DEC R1
    
    ;Simulate Unconditional Jump using JNZ
    MOV A, #01H     ; Force A to be non-zero
    JNZ COMPARE_LOOP

;Logic Handlers
CHECK_B_ZERO:
    MOV A, R1       
    JZ BOTH_EQUAL  
    
    ; If A reached 0 first, but B is not 0 -> A < B
    MOV A, #01H     
    JNZ A_IS_LESS

A_IS_GREATER:
    MOV R2, #01H    
    MOV A, #00H     
    JZ STOP

A_IS_LESS:
    MOV R2, #0FFH   
    MOV A, #00H     
    JZ STOP

BOTH_EQUAL:
    MOV R2, #00H    

;Stop Execution
STOP:
    MOV A, #01H     
    JNZ STOP
