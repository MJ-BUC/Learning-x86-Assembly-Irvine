TITLE Mark Bucaro/Print values, reorder them, and print again

INCLUDE Irvine32.inc

.data
	a  WORD 1
	b  WORD 2
	cc  WORD 3
	d  WORD 4
	seperate  BYTE " ", 0

.code
reorder PROC
	mov  ax, a
	push  ax
	mov  ax, b
	push  ax
	mov  ax, cc
	push  ax
	mov  ax, d
	push  ax
	
	pop  ax
	mov  cc, ax
	pop  ax
	mov  b, ax
	pop  ax
	mov  a, ax
	pop  ax
	mov  d, ax
	
	ret

reorder ENDP

main PROC
	mov  eax, 0
	mov  ecx, 2

again:
	mov  ax, a
	call WriteInt

	mov  ax, b
	mov  edx, OFFSET seperate
	call WriteString
	call WriteInt

	mov  ax, cc
	mov  edx, OFFSET seperate
	call WriteString
	call WriteInt

	mov  ax, d
	mov  edx, OFFSET seperate
	call WriteString
	call WriteInt

	call crlf

	call reorder

	loop again

	call WaitMsg

	exit
main ENDP
END main