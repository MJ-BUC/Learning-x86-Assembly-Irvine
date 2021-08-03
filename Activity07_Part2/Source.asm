TITLE Mark Bucaro/Advanced Functions (Part 1)

INCLUDE Irvine32.inc

.data
	promptOne  BYTE "The square root of ", 0
	promptTwo  BYTE " is: ", 0

.code
sqrt  EQU DWORD PTR [ebp-4]
subtractant  EQU DWORD PTR [ebp-8]

SquareRoot PROC
	push  ebp
	mov  ebp, esp
	sub  esp, 8				;reserve space for locals
	mov  sqrt, 0			;sqrt local
	mov  subtractant, 1		;subtractant local
top:
	cmp  eax, subtractant
	jl  done
	sub  eax, subtractant
	add  subtractant, 2
	inc  sqrt
	loop top
done:
	mov  eax, sqrt
	mov  esp, ebp
	pop  ebp
	ret
SquareRoot ENDP

main PROC
	mov  ecx, 100

again:
	mov  edx, OFFSET promptOne
	call WriteString

	mov  eax, ecx
	call WriteInt

	mov  edx, OFFSET promptTwo
	call WriteString

	push  ecx
	call SquareRoot
	pop  ecx
	call WriteInt

	call crlf
	loop again

	call WaitMsg

	exit
main ENDP
END main