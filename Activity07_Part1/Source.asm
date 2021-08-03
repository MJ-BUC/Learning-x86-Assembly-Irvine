TITLE Mark Bucaro/Advanced Functions

INCLUDE Irvine32.inc

.data
	
	
.code
Function PROC
	push  ebp
	mov  ebp, esp
	sub  esp, 4
	push  ebx
	push  edx
	mov  DWORD PTR [ebp - 4], 0

again:
	cmp  DWORD PTR [ebp + 8], 6
	jl  done

	mov  eax, DWORD PTR [ebp + 8]
	cdq
	mov  ebx, 3
	idiv  ebx
	sub  eax, 2
	mov  DWORD PTR [ebp + 8], eax

	mov  eax, DWORD PTR [ebp + 8]
	add  DWORD PTR [ebp - 4], eax

	jmp  again
done:
	mov  eax, DWORD PTR [ebp - 4]
	pop  edx
	pop  ebx
	add  esp, 4
	pop  ebp
	ret  4
Function ENDP

main PROC
	push  100756
	call Function
	call WriteInt
	call crlf

	call WaitMsg

	exit
main ENDP
END main