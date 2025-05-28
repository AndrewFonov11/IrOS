; IrOS version 1.5.0
; File System
; Released into the public domain under CC0

org 500h

jmp start_file_system
nop
f1 db 'A'
f2 db 'B'
f3 db 'C'
f4 db 'D'
f5 db 'E'
f6 db 'F'
f7 db 'G'
f8 db 'H'
end_tbl db 0

start_file_system:

cmp si,'A'
jz _1
cmp si,'B'
jz _2
cmp si,'C'
jz _3
cmp si,'D'
jz _4
cmp si,'E'
jz _5
cmp si,'F'
jz _6
cmp si,'G'
jz _7
cmp si,'H'
jz _8
jmp no_file

_1:

mov cl,03h
jmp load_file

_2:

mov cl,05h
jmp load_file

_3:

mov cl,07h
jmp load_file

_4:

mov cl,09h
jmp load_file

_5:

mov cl,0Bh
jmp load_file

_6:

mov cl,0Dh
jmp load_file

_7:

mov cl,0Fh
jmp load_file

_8:

mov cl,11h
jmp load_file

load_file:

cmp di,1
jz jmp_file
cmp di,2
jz del_file

jmp_file:

mov bx,1000h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:1000h

del_file:

mov bx,3000h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc no_file
mov ax,0002h
int 10h
int 19h

no_file:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'N'
int 10h
mov al,'o'
int 10h
mov al,' '
int 10h
mov al,'f'
int 10h
mov al,'i'
int 10h
mov al,'l'
int 10h
mov al,'e'
int 10h
mov ah,10h
int 16h
mov ax,0002h
int 10h
int 19h