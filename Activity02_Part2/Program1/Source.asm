TITLE Mark Bucaro/Double 10 times starting from 3

INCLUDE Irvine32.inc

.data
	; Your data goes here
	value  DWORD 3
.code
main PROC
	; Your code goes here
	mov  ecx, 10			;ecx is mandatory for the loop
	
again:
	mov  eax, value			;std::cout << value;
	call WriteInt

	mov  al, ' '			;std::cout << ' ';
	call WriteChar

	mov  eax, value			;value += 3;
	add  eax, eax
	mov value, eax

	loop again				;loops code encased

	call crlf				;carriage return line feed
	call WaitMsg

	exit
main ENDP
END main