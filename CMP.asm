DATA SEGMENT
 	MSG1 DB 'ENTER THE FIRST NUMBER : $'
 	MSG2 DB 0AH,0DH,'ENTER THE SECOND NUMBER : $'
 	MSG3 DB 0AH,0DH,'THE NUMBERS ARE EQUALS$'
 	MSG4 DB 0AH,0DH,'THE NUMBERS ARE NOT EQUALS$'
 	NUM1 DB ?
 	NUM2 DB ?
 DATA ENDS
 CODE SEGMENT
 ASSUME CS:CODE,DS:DATA
 START: MOV AX,DATA
 	MOV DS,AX
 	
 	LEA DX,MSG1
 	MOV AH,09H
 	INT 21H
 	
 	MOV AH,01H
 	INT 21H
 	SUB AL,30H
 	MOV NUM1,AL
 	
 	LEA DX,MSG2
 	MOV AH,09H
 	INT 21H
 	
 	MOV AH,01H
 	INT 21H
 	SUB AL,30H
 	MOV NUM2,AL
 	
 	MOV AL,NUM1
 	MOV BL,NUM2
 	CMP AL,BL
 	
 	JNE NOTEQUAL
 	LEA DX,MSG3
 	MOV AH,09H
 	INT 21H
 	JMP STOP
 	
 NOTEQUAL: LEA DX,MSG4
 	MOV AH,09H
 	INT 21H
 	
 STOP: MOV AH,4CH
 	INT 21H
 
 CODE ENDS
 END START
