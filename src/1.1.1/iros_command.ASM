; IrOS version 1.1.1
; Command Interface
; Released into the public domain under CC0

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

cmp al,'m'
jz memory

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

memory:

mov si,'0'
mov bx,1000h
mov cl,03h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc n_1
inc si
n_1:
mov bx,2000h
mov cl,05h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc n_2
inc si
n_2:
mov bx,3000h
mov cl,07h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc n_3
inc si
n_3:
mov bx,4000h
mov cl,09h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc n_4
inc si
n_4:
mov bx,5000h
mov cl,11h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc n_5
inc si
n_5:
mov bx,6000h
mov cl,13h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc end_
inc si
end_:
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'F'
int 10h
mov al,':'
int 10h
mov al,' '
int 10h
mov ax,si
mov ah,0x0e
int 10h
mov al,' '
int 10h
mov si,'1'
mov ax,0000h
mov es,ax
mov dl,1
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc n_d_1
inc si
n_d_1:
mov ax,0000h
mov es,ax
mov dl,2
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc n_d_2
inc si
n_d_2:
mov ax,0000h
mov es,ax
mov dl,80h
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc end_2
inc si
end_2:
mov ah,0x0e
mov al,'D'
int 10h
mov al,':'
int 10h
mov al,' '
int 10h
mov ax,si
mov ah,0x0e
int 10h
xor si,si
mov ah,10h
int 16h

jmp reboot

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