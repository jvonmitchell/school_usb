.686p
.model flat,stdcall
.stack 2048

.data


ExitProcess	proto, exitcode:dword

.code
start:
pushf
pop ax
or ax, 0281h
and  ax, 0feefh
push ax
popf
invoke	ExitProcess, 0
end start



