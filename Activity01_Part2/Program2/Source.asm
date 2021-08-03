TITLE Mark Bucaro/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	a  BYTE 5           ;char
	b  WORD	7			;short
	cc DWORD 11			;int
	d  DWORD 13			;int
.code
main PROC
	; Your code goes here
	neg  a							; a = -a;

	mov  eax, 0
	movzx  eax, b					; d = b + 17;
	add  eax, 17
	mov  d, eax

	movzx  ax, a					; b = static_cast<short>(a);
	mov  b, ax

	mov  eax, 0
	movzx  eax, b					; c = static_cast<int>(b);
	mov  cc, eax

	mov  al, a						; a = a - 3;
	sub  al, 3
	mov  a, al

	mov  eax, 0
	movsx  eax, a					; d = static_cast<int>(a);
	mov  d, eax

	movsx  eax, a
	movzx  ebx, b
	mov  ecx, cc
	mov  edx, d
	call Dumpregs




	mov  a, 19						; a = 19;
	
	mov  b, 108						; b = 108;

	mov  cc, 77						; c = 77;

	mov  d, 7						; d = 7;

	mov  eax, 0
	movzx  eax, a					; c = -(a + b + c + d) + a + b + c;
	add  eax, DWORD PTR b
	add  eax, cc
	add  eax, d
	neg  eax
	add  eax, DWORD PTR a
	add  eax, DWORD PTR b
	add  eax, cc
	mov  cc, eax

	mov  eax, 0
	movzx  eax, a					; d = a + b - c - d - a + b + c - d - a - a + b + a + d + c;
	add  eax, DWORD PTR b
	sub  eax, cc
	sub  eax, d
	sub  eax, DWORD PTR a
	add  eax, DWORD PTR b
	add  eax, cc
	sub  eax, d
	sub  eax, DWORD PTR a
	sub  eax, DWORD PTR a
	add  eax, DWORD PTR b
	add  eax, DWORD PTR a
	add  eax, d
	add  eax, cc
	mov  d, eax


	movzx  eax, a
	movzx  ebx, b
	mov  ecx, cc
	mov  edx, d
	call Dumpregs

	exit
main ENDP
END main