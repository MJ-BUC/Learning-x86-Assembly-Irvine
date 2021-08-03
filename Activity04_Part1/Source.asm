TITLE Mark Bucaro/Calculate absolute value of user input value

INCLUDE Irvine32.inc

.data
	prompt  BYTE "Enter a value: ", 0
	result  BYTE "The absolute value is: ", 0
	
.code
Absolute PROC					;creates function
	cmp  eax, 0					;compares for "if"
	jge  dontdoit				;jump greater than equal to
	neg  eax

dontdoit:						;label
	ret
Absolute ENDP

main PROC
	mov  edx, OFFSET prompt		;prompts the user
	call WriteString
	call ReadInt

	call Absolute

	mov  edx, OFFSET result		;the result is output
	call WriteString
	call WriteInt
	call crlf

	call WaitMsg

	exit
main ENDP
END main