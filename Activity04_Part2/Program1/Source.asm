TITLE Mark Bucaro/Determines whether a value is odd or even

INCLUDE Irvine32.inc

.data
	prompt  BYTE "Enter a value: ", 0
	evenPrompt  BYTE "The value is even!", 0
	oddPrompt  BYTE "The value is odd!", 0
	
.code
isEven PROC
	pop  eax
	pop  eax
	test  al, 1
	jz  evenValue					;jump if zero
	jnz  oddValue					;jump if not zero

evenValue:							;even label
	mov  edx, OFFSET evenPrompt
	call WriteString

	call crlf

	ret

oddValue:							;odd label
	mov  edx, OFFSET oddPrompt
	call WriteString

	call crlf

	ret

isEven ENDP

main PROC
	mov  eax, 0

	mov  edx, OFFSET prompt
	call Writestring
	call ReadInt
	push  eax

	call isEven

	call WaitMsg

	exit
main ENDP
END main