;Timer0 Interrupt Example

ORG 0000H
LJMP MAIN

ORG 000BH
CPL P1.0
RETI

MAIN: MOV TMOD, #01H
	  MOV IE, #82H
	  SETB TR0
	  SJMP $
END