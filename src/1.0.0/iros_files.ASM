; IrOS version 1.0.0
; File System
; Released into the public domain under CC0

org 500h

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
jmp not_file

_1:

mov ax,0000h
mov es,ax
mov bx,1000h
mov ch,0
mov cl,03h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc not_file
jmp 0000:1000h

_2:

mov ax,0000h
mov es,ax
mov bx,2000h
mov ch,0
mov cl,05h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc not_file
jmp 0000:2000h

_3:

mov ax,0000h
mov es,ax
mov bx,3000h
mov ch,0
mov cl,07h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc not_file
jmp 0000:3000h

_4:

mov ax,0000h
mov es,ax
mov bx,4000h
mov ch,0
mov cl,09h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc not_file
jmp 0000:4000h

_5:

mov ax,0000h
mov es,ax
mov bx,5000h
mov ch,0
mov cl,11h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc not_file
jmp 0000:5000h

not_file:

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