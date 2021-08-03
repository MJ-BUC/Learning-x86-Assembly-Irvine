TITLE Mark Bucaro/Integer Multiplication, Division, and Modulus Operations

INCLUDE Irvine32.inc

.data
	
	
.code
Multiplication PROC
	push  edx
	imul  ebx
	pop  edx
	ret
Multiplication ENDP

Division PROC
	push  edx
	cdq
	idiv  ebx
	pop  edx
	ret
Division ENDP

Modulus PROC
	push  edx
	cdq
	idiv  ebx
	mov  eax, edx
	pop  edx
	ret
Modulus ENDP

main PROC
	push  ebx
	push  ecx
	push  edx
	mov  ebx, 1

outer:						;while (ebx < 1400)
	push  ebx
	cmp  ebx, 1400
	jg  done

	mov  eax, ebx			;cout << ebx;
	call WriteInt
	mov  al, OFFSET ","		;cout << ',';
	call WriteChar
	mov  al, OFFSET " "		;cout << ' ';
	call WriteChar

	mov  ecx, 1
	mov  esi, ebx

	cmp  esi, 0				;while (esi > 0) go to loop or stay in outer
	jg  inner

	pop  ebx
	add  ebx, ecx			;ebx += ecx;
	jmp outer
	
inner:						;while (esi > 0)
	cmp  esi, 0
	jle  endOuter
	mov  eax, esi
	mov  ebx, 10
	call Modulus
	mov  edi, eax

	cmp  edi, 0
	jne  condition

	mov  eax, esi
	mov  ebx, 10
	call Division
	mov  esi, eax

	jmp inner

condition:					;if (edi != 0)
	mov  eax, ecx
	mov  ebx, edi
	call Multiplication
	mov  ecx, eax

	mov  eax, esi
	mov  ebx, 10
	call Division
	mov  esi, eax

	jmp inner

endOuter:					;ebx += ecx;
	pop  ebx
	add  ebx, ecx
	jmp  outer

done:
	pop  edx
	pop  ecx
	pop  ebx
	call crlf

	call WaitMsg

	exit
main ENDP
END main