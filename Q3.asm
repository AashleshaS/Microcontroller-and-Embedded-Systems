MOV 40H, #50H       
MOV 50H, #99H       

;Direct Addressing 

MOV A, 40H         
MOV R2, A           


; Indirect Addressing Logic 
MOV R0, 40H        
MOV A, @R0          
      
MOV R3, A          