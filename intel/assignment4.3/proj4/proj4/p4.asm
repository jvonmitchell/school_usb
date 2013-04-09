.686p
.model flat,stdcall
.stack 2048

.data
input byte "IV"
input2 dword 2 dup (?)


ExitProcess	proto, exitcode:dword

.code
start:
mov ecx,lengthof input
mov edi,offset input
mov esi,offset input2

transitionloop:
	mov al,[edi]
	.if al=='M'
		mov eax,1000
	.elseif al=='D'
		mov eax,500
	.elseif al=='C'
		mov eax,100
	.elseif al=='L'
		mov eax,50
	.elseif al=='X'
		mov eax,10
	.elseif al=='V'
		mov eax,5
	.elseif al=='I'
		mov eax,1
	.else	
		mov eax,0
	.endif
	mov [esi],eax	
	add edi, type input
	add esi, type input2
loop transitionloop

mov ecx,lengthof input2
sub esi,type input2
mov eax,[esi]
mov ebx,eax
sub esi,type input2
dec ecx

additionloop:
	mov edx,[esi]
	.if edx >= ebx
		mov ebx,edx
		add eax,edx
	.else
		sub eax,edx
	.endif
	sub esi,type input2
loop additionloop

invoke	ExitProcess, 0
end start



