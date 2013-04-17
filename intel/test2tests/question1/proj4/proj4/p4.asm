.686p
.model flat,stdcall
.stack 2048

.data
X   dword   6
Y   dword   9
Z   dword	?


ExitProcess	proto, exitcode:dword

.code

loop3swap:
mov ecx,eax
mov eax,ebx
mov ebx,ecx
jmp loop3continue


start:
 mov eax, X
mov ebx, Y
xor edx,edx ;set to zero because its a count
loop1:
mov ecx,eax ;ecx to do destructive opperations
or ecx,ebx
and ecx,1
jcxz inloop1    ;Stay around.  We have a common multiple of two.
jmp outloop1  ;At least one is odd now so we have exhausted our common multiples of two.
inloop1:
shr eax,1        ; divide them by two and increment our counter
shr ebx,1
inc edx
jmp loop1      ; Do again.
outloop1: ;at least eax or ebx are odd.  Common muliples of two taken out and recorded in edx.
loop2:              ;shift right until eax is odd.
mov ecx,eax
and ecx,1
jcxz inloop2
jmp outloop2
inloop2:
shr eax,1
jmp loop2
outloop2: ;from hear on eax will always be odd
loop3:             ;This is really a label for two loops.  First we make ebx odd by shifting left.  Then we and going to subtract the lesser from the greater and store into the greater.
mov ecx,ebx
and ecx,1
jcxz inloop3
jmp subloop3
inloop3:
shr ebx,1
jmp loop3
subloop3: ;at this point both eax, and ebx are odd.  ebx will become even in a bit though because odd-odd is even.
cmp eax,ebx  ;swap eax and ebx if needed.
jg loop3swap
loop3continue:
sub ebx,eax
mov ecx,ebx
jcxz leaveloop3
jmp loop3

leaveloop3:
mov ecx,edx
jcxz donotmultiplybytwo
shiftloop:  ;multiply common multiples of two since we took those out.
shl eax,1
loop shiftloop
donotmultiplybytwo:
mov Z,eax   ;Store the value into Z


invoke	ExitProcess, 0
end start








