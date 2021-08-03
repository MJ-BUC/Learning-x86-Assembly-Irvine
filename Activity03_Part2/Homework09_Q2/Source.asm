TITLE Mark Bucaro/takes user input and calculates f(x)=(8 * x) + c

INCLUDE Irvine32.inc

.data
	x  BYTE "Enter a value for x: ", 0
	cc  BYTE "Enter a value for c: ", 0
	result  BYTE "f(x)= ", 0
	sum  DWORD 0

.code
equation PROC					;result = Equation(x, c)

	mov  ecx, 8

	pop  eax
	pop  eax
	add  sum, eax

	pop  eax

again:
	add  sum, eax
	
	loop again

	mov  eax, sum
	mov  edx, OFFSET result		;std::cout << "f(x) = " << result << std::endl
	call WriteString
	call WriteInt

	call crlf

	ret
equation ENDP

main PROC
	mov  eax, 0

	mov  edx, OFFSET x
	call WriteString
	call ReadInt				;std::cin >> x
	push  eax

	mov  edx, OFFSET cc
	call WriteString
	call ReadInt				;std::cin >> c
	push  eax

	call equation

	call WaitMsg

	exit
main ENDP
END main