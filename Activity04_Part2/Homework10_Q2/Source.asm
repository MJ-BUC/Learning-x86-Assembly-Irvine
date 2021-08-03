TITLE Mark Bucaro/Calculate exponents

INCLUDE Irvine32.inc

.data
	xPrompt  BYTE "Enter a value for x: ", 0
	yPrompt  BYTE "Enter a value for y: ", 0
	resultPrompt  BYTE "x to the y power is: ", 0
	x  DWORD 0
	y  DWORD 0
	result DWORD 0
	counter  DWORD ?
	
.code
power PROC
	mov  eax, y				;check exponent for zero
	cmp  eax, 0
	je  isZero

	cmp  eax, 1				;check exponent for 1
	je  isOne

	mov  eax, 0				;eax is acting as the accumulator
	mov  ecx, y				;counter for the firat loop
	dec  ecx
	add  eax, x				;start with the x value entered
	mov  result, eax		;result acts as the total
	mov  eax, 0				;reset the accumulator to zero

again:
	
	mov  counter, ecx		;stores the outer loops counter
	mov  ecx, x				;counter for nested loop

more:
	add  eax, result		;add result to accumulator number of 'x' times
	
	loop more

	mov  result, eax		;move accumlator total back to result
	mov  eax, 0				;reset the accumulator
	mov  ecx, counter		;bring back counter for outer loop
	
	loop again

	mov  eax, result		;finally move the result to eax to be displayed

	ret

isZero:
	mov  eax, 1
	ret

isOne:
	mov  eax, x
	ret

power ENDP

main PROC
	mov  eax, 0

	mov  edx, OFFSET xPrompt
	call WriteString
	call ReadInt
	mov  x, eax

	mov  edx, OFFSET yPrompt
	call WriteString
	call ReadInt
	mov  y, eax

	call power

	mov  edx, OFFSET resultPrompt
	call WriteString
	call WriteInt
	
	call crlf

	call Waitmsg

	exit
main ENDP
END main