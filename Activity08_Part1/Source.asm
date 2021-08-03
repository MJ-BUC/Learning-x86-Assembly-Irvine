TITLE Mark Bucaro/Advanced Functions Review, and Recursion

INCLUDE Irvine32.inc

.data
	
	
.code
R PROC
	push  ebp
	mov  ebp, esp

	push eax

	cmp  DWORD PTR [ebp + 8], 0
	jle  endNow

	test  DWORD PTR [ebp + 8], 1
	jnz  isOne

isZero:
	dec  DWORD PTR [ebp + 8]
	push  DWORD PTR [ebp + 8]
	call R
	mov  eax, DWORD PTR [ebp + 8]
	call WriteDec
	mov  al, ' '
	call WriteChar
	jmp endIff

isOne:
	mov  eax, DWORD PTR [ebp + 8]
	call WriteDec
	mov  al, ' '
	call WriteChar
	mov  eax, DWORD PTR [ebp + 8]
	shr  eax, 1
	dec  eax
	push  eax
	call R
	
endIff:
endNow:
	pop  eax

	pop  ebp
	ret  4
R ENDP

main PROC
	push  1111
	call R
	call crlf

	call WaitMsg

	exit
main ENDP
END main