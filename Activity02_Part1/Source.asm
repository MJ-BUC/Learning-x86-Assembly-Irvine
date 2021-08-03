TITLE Mark Bucaro/Printing

INCLUDE Irvine32.inc

.data
	; Your data goes here
	demo  BYTE "demo", 0
	character  DWORD OFFSET demo

.code
main PROC
	; Your code goes here
	
	mov  ecx, 20

again:
	mov  eax, character
	mov  al, BYTE PTR [eax]
	call WriteChar

	inc  character

	loop again

	call crlf			;carriage return line feed
	call WaitMsg

	exit
main ENDP
END main