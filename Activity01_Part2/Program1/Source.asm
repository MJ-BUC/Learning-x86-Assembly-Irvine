TITLE Mark Bucaro/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	a  SWORD 5
	b  SWORD 6
	cc SWORD 7
	d  SWORD 8
	e  SWORD 2
	f  SWORD 3
	g  SWORD 1
	h  SWORD 4

.code
main PROC
	; Your code goes here
	dec  g						; --g;

	mov  ax, f					; b = f + h;
	add  ax, h
	mov  b, ax

	mov  ax, d					; e = d + 22 - c - a;
	add  ax, 22
	sub  ax, cc
	sub  ax, a
	mov  e, ax
	
	mov  ax, g					; f = -g;
	neg  ax
	mov  f, ax

	inc  a						; ++a;

	mov  ax, f					; g = f + e - 5;
	add  ax, e
	sub  ax, 5
	mov  g, ax

	mov  ax, d					; a = d + 19 - b;
	add  ax, 19
	sub  ax, b
	mov  a, ax

	mov  ax, f					; h = c + a + (-f);
	neg  ax
	mov  bx, cc
	add  bx, a
	add  bx, ax
	mov  h, bx

	movsx  eax, a
	movsx  ebx, b
	movsx  ecx, cc
	movsx  edx, d
	call Dumpregs

	movsx  eax, e
	movsx  ebx, f
	movsx  ecx, g
	movsx  edx, h
	call Dumpregs



	mov  ax, g					; g = g + 6;
	add  ax, 6
	mov  g, ax

	mov  f, 16					; f = 16;

	dec  h						; --h;

	mov  ax, 5					; d = 5 - e;
	sub  ax, e
	mov  d, ax

	mov  ax, b					; b = -b;
	neg  ax
	mov  b, ax

	mov  ax, g					; e = -g + 11 - a;
	neg  ax
	add  ax, 11
	sub  ax, a
	mov  e, ax

	mov  ax, d					; f = d + c - a;
	add  ax, cc
	sub  ax, a
	mov  f, ax

	mov  ax, cc					; c = c - 100 + b;
	sub  ax, 100
	add  ax, b
	mov  cc, ax

	movsx  eax, a
	movsx  ebx, b
	movsx  ecx, cc
	movsx  edx, d
	call Dumpregs

	movsx  eax, e
	movsx  ebx, f
	movsx  ecx, g
	movsx  edx, h
	call Dumpregs

	exit
main ENDP
END main