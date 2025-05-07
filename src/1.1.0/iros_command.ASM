; IrOS version 1.1.0
; Command Interface
; Released into the public domain under CC0

org 2000h
use16

command:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,'>'
int 10h

xor ax, ax
int 16h
mov ah,0x0e
int 10h

cmp al,'f'
jz floppy

cmp al,'h'
jz hdd

cmp al,'r'
jz reboot

movzx si,al
jmp 0000:0500h

floppy:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,':'
int 10h

mov ah,10h
int 16h

movzx si,al
mov ax,0000h
mov es,ax
mov dl,1
mov bx,500h
mov ch,0
mov cl,02h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
jmp 0000:0500h

hdd:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,':'
int 10h

mov ah,10h
int 16h

movzx si,al
mov ax,0000h
mov es,ax
mov dl,80h
mov bx,500h
mov ch,0
mov cl,02h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
jmp 0000:0500h

reboot:

mov ax,0002h
int 10h
int 19h

error:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,'E'
int 10h
mov al,'r'
int 10h
mov al,'r'
int 10h
mov al,'o'
int 10h
mov al,'r'
int 10h

jmp command

jmp $