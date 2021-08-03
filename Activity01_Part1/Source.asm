TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	a  SWORD 5
	b  SWORD 6
	cc SWORD 7
	d  SWORD 8
	e  Sword ?
	f  SWORD ?
	g  SWORD ?
	h  SWORD ?	
.code
main PROC
	; Your code goes here
	inc  d									; ++d;
	
	dec  cc									; --c;
	
	mov  ax, a								; b = a + 2;
	add  ax, 2
	mov  b, ax

	mov  ax, d								; a = d + 9;
	add  ax, 9
	mov  a, ax

	mov  ax, a								; e = a + b - c - d;
	add  ax, b
	sub  ax, cc
	sub  ax, d
	mov  e, ax

	mov  ax, cc								; f = -c;
	neg  ax
	mov  f, ax

	mov  ax, f								; g = f + e;
	add  ax, e
	mov  g, ax

	mov  ax, b								; h = -b - c + a;
	neg  ax
	sub  ax, cc
	add  ax, a
	mov  h, ax

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



	dec  h									; --h;

	add  g, 6								; g = g + 6;

	mov  f, 16								; f = 16;

	mov  ax, g								; e = -g - f;
	neg  ax
	sub  ax, f
	mov  e, ax

	mov  ax, 5								; d = 5 - e;
	sub  ax, e
	mov  d, ax

	neg  cc									; c = -c;

	mov  ax, cc								; b = c + e - h;
	add  ax, e
	sub  ax, h
	mov  b, ax

	mov  ax, b								; a = -b + c - d;
	neg  ax
	add  ax, cc
	sub  ax, d
	mov  a, ax


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