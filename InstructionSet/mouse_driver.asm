; Este es el que trabajamos en clase
; Hay que hacerle unos arreglos para que corra bien
MOV		R0, #0x408
MOV		R4, #0x404
MOV		R6, #0x400
MOV		R7, #0xA
MOV		R8, #0x020
MOV		R9, #0x064
		
LOOP
		LDR		R1, [R0]
		AND		R2, R1, #1
		CMP		R2, #1
		BNE		LOOP
		LDR		R5, [R4]
		ADD		R5, R5, #1
		STR		R5, [R4]
		STR		R7, [R6]
		STR		R9, [R8]
		B		LOOP
