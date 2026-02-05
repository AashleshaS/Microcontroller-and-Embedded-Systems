; SETUP TEST DATA 
; We load data: 
;11, FF, 22, FF, 33 startat 40H.
; Expected "After" result: 
;11, 22, 33, 00, 00...

MOV R0, #40H        
MOV @R0, #11H  ; 40H = 11
INC R0
MOV @R0, #0FFH ;41H =FF(remove)
INC R0
MOV @R0, #22H     ; 42H = 22
INC R0
MOV @R0, #0FFH ;43H =FF(remove)
INC R0
MOV @R0, #33H     ; 44H = 33

;INITIALIZE POINTERS 
MOV R0, #40H        
MOV R1, #40H        
MOV R7, #32         

;SCAN AND COMPACT LOOP
SCAN_LOOP:
    MOV A, @R0     
    ; Check if byte is FFH
    CJNE A, #0FFH, KEEP_BYTE 
    ; If byte IS FFH, we skip it.
    SJMP NEXT_ITERATION

KEEP_BYTE:
    MOV @R1, A      
    INC R1         

NEXT_ITERATION:
    INC R0          
    DJNZ R7, SCAN_LOOP 

;FILL REMAINING BYTES WITH 00H 
FILL_LOOP:
    CJNE R1, #60H, WRITE_ZERO 
    SJMP STOP      

WRITE_ZERO:
    MOV @R1, #00H   
    INC R1          
    SJMP FILL_LOOP  

STOP:
    SJMP STOP   
