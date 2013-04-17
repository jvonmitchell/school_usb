.686p
.model flat,stdcall
.stack 2048

.data
X   sdword   1000,2000,-3000
ExitProcess	proto, exitcode:dword

.code
start:

mov esi,offset X
mov ecx,sizeof X
theloop:
 or byte ptr [esi],01010101b
 inc esi
loop theloop



invoke	ExitProcess, 0
end start



