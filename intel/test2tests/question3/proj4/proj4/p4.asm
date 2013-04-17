.686p
.model flat,stdcall
.stack 2048

.data
X    byte        'asdf$', '10456791$', 'akak5555$','helloworldhowareyoutoday$', 'jkfjfjfsd$'
Y    dword     ?

ExitProcess	proto, exitcode:dword

.code
start:

mov esi,offset X	;The pointer for traversal 
mov edi,esi			;The pointer to the begining of the word
mov edx,esi			;The pointer to the greatest
mov ecx,sizeof X	;Number of characters to itterate
mov ah,0			;Length of greatest word
mov al,0			;Length of current word
mov bh,0			;current symbol
theloop:
 mov bh,[esi]
 .if bh=='$'
 .if al>ah
 mov ah,al
 mov edx,edi
 .endif
 mov al, 0
 mov edi,esi
 inc edi
 .endif
 inc esi
 inc al
loop theloop
mov Y,edx




invoke	ExitProcess, 0
end start



