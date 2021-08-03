TITLE Mark Bucaro/Multiply two values together

INCLUDE Irvine32.inc

.data
	x  DWORD ?
	y  DWORD ?
	r  DWORD ?
	xPrompt  BYTE "Enter a value for x:", 0
	yPrompt  BYTE "Enter a value for y:", 0
	result  BYTE "The result is: ", 0
	
.code
;------------------------------------
;INPUT - EBX - X
;INPUT - ECX - Y
;OUTPUT - EAX - X * Y
;------------------------------------
multiply PROC
	push  ebx
	push  ecx
	mov  eax, 0					;unsigned int a = 0

again:							;while loop  -  while (y != 0)
	cmp  ecx, 0
	je  done					;jump if equal
	test  ecx, 1				;non destructive 'and'
	jz  dontdoit				;jump if zero
	add  eax, ebx				;a += x;

dontdoit:
	shl  ebx, 1					;shift left  -   x <<= 1
	shr  ecx, 1					;shift right  -  y >>= 1
	jmp  again

done:
	pop  ecx					;return a
	pop  ebx
	ret

multiply ENDP

main PROC
	mov  edx, OFFSET xPrompt
	call WriteString
	call ReadInt
	mov  x, eax

	mov  edx, OFFSET yPrompt
	call WriteString
	call ReadInt
	mov  y, eax

	;unsigned int r = multiplt(x,y)
	mov  ebx, x
	mov  ecx, y
	call multiply
	mov  r, eax

	mov  edx, OFFSET result
	call WriteString
	mov  eax, r
	call WriteInt
	call crlf

	call WaitMsg

	exit
main ENDP
END main