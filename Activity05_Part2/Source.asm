TITLE Mark Bucaro/Stern's diatomic series

INCLUDE Irvine32.inc

.data
	sequence  DWORD 100 dup (0)
	arrPosition  DWORD OFFSET sequence
	
.code
main PROC
	mov  edi, 0							;possition in array

	mov  eax, 0							;a(0) = 0
	mov  esi, [arrPosition]
	mov  [esi], eax
	add  arrPosition, TYPE sequence
	inc  edi

	mov  eax, 1							;a(1) = 1
	mov  esi, [arrPosition]
	mov  [esi], eax
	add  arrPosition, TYPE sequence
	inc  edi

	mov  ecx, 99
	mov  ebx, arrPosition

isZero:
	push  edi							
		
	mov  ebx, edi												
	test  ebx, 1							
	jnz  isNotZero

	mov  eax, [arrPosition]					

	mov  edx, edi						
	add  edx, edi
	add  edx, edi
	
	mov  edx, arrPosition						
	sub  edx, edi
	mov  esi, edx
	mov  ebx, [arrPosition]
	mov  ebx, esi 
	
	pop  edi								 
	inc  edi
	add  arrPosition, TYPE sequence
	dec  ecx
	jnz  isZero
	
	
	mov  ebx, [OFFSET sequence]


isNotZero:
	push  edx							
	push  edi

	mov  eax, edi						
	dec  edi
	mov  edx, edi
	add  edx, edi
	add  edx, 1
	mov  ebx, arrPosition
	sub  ebx, eax

	pop  edi								
	mov  eax, edi
	inc  edi
	sub  eax, edi

	mov  edx, arrPosition
	sub  edx, eax

	mov  eax, ebx						
	mov  ebx, edx

	add  eax, ebx						
	mov  ebx, [arrPosition]
	mov  ebx, eax 

	pop  edx								
	pop  edi
	inc  edi								
	add  arrPosition, TYPE sequence
	dec  ecx
	jnz  isZero

again:
	mov  eax, ebx
	call writeDec
	add  ebx, TYPE sequence
	cmp  ecx, 1
	mov  al, ','
	call writeChar

	loop again

	call CrLf

	call WaitMsg

	exit
main ENDP
END main