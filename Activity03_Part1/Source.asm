TITLE Mark BUcaro/Receives user input, take the sum and difference

INCLUDE Irvine32.inc

.data
	enterSigned1  BYTE "Enter a signed integer value: ", 0
	enterSigned2  BYTE "Enter a second signed integer value: ", 0
	sumIs  BYTE "The sum is: ", 0
	diffIS  BYTE "The difference is: ", 0
.code
main PROC
	mov  ecx, 3

again:

	call ClrScr						;Clear the screen
	
	mov  dl, 10						;Move the cursor to row 10, column 10
	mov  dh, 10
	call GotoXY
	mov  edx, OFFSET enterSigned1
	call WriteString
	call ReadInt					;std::cin >> eax
	mov  edi, eax

	mov  dl, 10						;Move the cursor to row 11, column 10
	mov  dh, 11
	call GotoXY
	mov  edx, OFFSET enterSigned2
	call WriteString
	call ReadInt					;std::cin >> eax
	mov  esi, eax

	mov  eax, esi					;eax = edi + esi
	add  eax, edi
	mov  edx, OFFSET sumIs
	call WriteString
	call WriteInt
	call crlf

	mov  eax, edi					;eax = edi - esi
	sub  eax, esi
	mov  edx, OFFSET diffIs
	call WriteString
	call WriteInt
	call crlf

	mov eax, 2000					;Pause for two seconds
	call Delay

	loop again

	call WaitMsg

	exit
main ENDP
END main