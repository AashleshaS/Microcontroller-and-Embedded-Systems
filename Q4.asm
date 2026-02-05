;Construct '81' using CPL and ANL
CLR A               ; A = 00H
CPL A               ; A = FFH(1111 1111)

; We now have all 1s. We only want 81H (1000 0001).
; We use ANL (AND) to "mask out" the bits we don't want.
ANL A, #81H         ; [ANL] FFH AND 81H = 81H
                    ; (1111 1111) AND (1000 0001) = 1000 0001

MOV B, A            ; '81' in Register B

; Transform '81' to '91' using XRL ---
; Current A: 81H (1000 0001)
; Target A:  91H (1001 0001)
; Difference: Bit 4 (the 10H bit) needs to flip from 0 to 1.

XRL A, #10H         ; [XRL] Exclusive OR toggles specific bits.
                    ; 81H XOR 10H = 91H
                    ; (1000 0001) XOR (0001 0000) = 1001 0001
