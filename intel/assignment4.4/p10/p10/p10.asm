

include irvine32.inc
.data
msg1	byte 0ah,0dh,"enter a roman numeral: ", 0
msg2	byte 0ah,0dh,"In aribic numerals that is: ",0
input	byte 30 dup (' ')
outbuff	byte 30 dup (' ')
input2 dword 30 dup (?)
ourlength dword ?

ExitProcess	proto, exitcode:dword

.code
start:

;print a prompt for input
mov		edx,offset msg1
call	WriteString

;read a string from kbd and save it in "inbuff"
mov		edx,offset input		
mov		ecx,sizeof input
call	ReadString


mov ecx, eax
mov ourlength, ecx

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

mov ecx, ourlength
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

mov		edx,offset msg2
call	WriteString

mov		edx,eax
call	WriteInt


mov		edx,offset input		
mov		ecx,1
call	ReadString

invoke	ExitProcess, 0
end start



