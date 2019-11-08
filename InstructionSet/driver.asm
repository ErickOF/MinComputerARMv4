; Base address
MOV		R0, #0x400
;
MOV		R1, #0x00A
;
MOV		R2, #0x020
MOV		R3, #0x064
; TEST
MOV 		R10, #0x001
; Mouse address
ADD		R4, R0, #0x004 ; R4 = 0x404
ADD		R5, R0, #0x008 ; R5 = 0x408

; Read data from mouse's memory space
LOOP
		; Load data in 
		LDR R6, [R5]
		; Get the LSB
		AND R7, R6, #0x001
		STR R10, [R5]
		; Compare and branch if R7 is not 1
		CMP R7, #0x001
		BNE LOOP
		; Load next memory addres of mouse
		LDR R8, [R4]
		ADD R8, R8, #0x001
		STR R8, [R4]
		STR R1, [R0]
		STR R3, [R2] 
		; Back to the loop
		B LOOP