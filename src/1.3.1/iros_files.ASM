; IrOS version 1.3.1
; File System
; Released into the public domain under CC0

org 500h

jmp cmp_file
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

cmp_file:

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

mov bx,1000h
mov cl,03h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:1000h

_2:

mov bx,2000h
mov cl,05h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:2000h

_3:

mov bx,3000h
mov cl,07h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:3000h

_4:

mov bx,4000h
mov cl,09h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:4000h

_5:

mov bx,5000h
mov cl,0Bh
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:5000h

_6:

mov bx,6000h
mov cl,0Dh
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:6000h

_7:

mov bx,7000h
mov cl,0Fh
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:7000h

_8:

mov bx,8000h
mov cl,11h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc no_file
jmp 0000:8000h

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