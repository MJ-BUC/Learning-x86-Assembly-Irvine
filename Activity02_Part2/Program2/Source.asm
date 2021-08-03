TITLE Mark Bucaro/Add and subtract elements of an array

INCLUDE Irvine32.inc

.data
	; Your data goes here
	arr  WORD  8, 3, 1, 4, 9, 5, 7, 2, 6, 10
	sum  WORD 0
.code
main PROC
	; Your code goes here
	mov  eax, 0
	mov  edx, 0
	mov  ecx, 5
	mov  esi, OFFSET arr

again:
	mov  eax, '+'						;std::cout << '+';
	call WriteChar

	mov  dx, [esi]						;std::cout << *value;
	movzx  eax, dx
	call WriteInt

	mov  dx, [esi]						;sum += *value;
	movzx  eax, dx
	add  DWORD PTR sum, eax

	add  esi, 2							;++value;

	mov  eax, '-'						;std::cout << '-';
	call Writechar

	mov  dx, [esi]						;std::cout << *value;
	movzx  eax, dx
	call WriteInt

	mov  dx, [esi]						;sum -= *value;
	movzx  eax, dx
	sub  DWORD PTR sum, eax

	add  esi, 2							;++value;

	loop again

	mov  eax, '='						;std::cout << '=';
	call WriteChar

	mov  eax, DWORD PTR sum				;std::cout << sum;
	call WriteInt

	call crlf							;std::cout << std::endl;
	call WaitMsg

	exit
main ENDP
END main