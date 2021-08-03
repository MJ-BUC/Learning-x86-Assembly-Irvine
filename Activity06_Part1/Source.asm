TITLE Mark Bucaro/Integer Multiplication, Division, and Modulus Operations

INCLUDE Irvine32.inc

.data
	
	
.code
Multiplication PROC
	push  edx
	imul  ebx
	pop  edx
	ret
Multiplication ENDP

Division PROC
	push  edx
	cdq
	idiv  ebx
	pop  edx
	ret
Division ENDP

Modulus PROC
	push  edx
	cdq
	idiv  ebx
	mov  eax, edx
	pop  edx
	ret
Modulus ENDP

main PROC
	mov  eax, 22
	mov  ebx, 5
	call Modulus
	call WriteInt
	call crlf

	call WaitMsg

	exit
main ENDP
END main