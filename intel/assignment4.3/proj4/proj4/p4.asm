.686p
.model flat,stdcall
.stack 2048

.data
num		sword	100,-100,200,300
maxi	sword	?

ExitProcess	proto, exitcode:dword

.code
start:
mov	esi,offset num+2
mov ecx,(lengthof num) - 1 
mov	ax,num
next:

cmp	ax,[esi]
jl	smaller

jmp	continue

smaller:
mov	ax,[esi]

continue:
add	esi,type num

loop	next

mov	maxi,ax
invoke	ExitProcess, 0
end start



