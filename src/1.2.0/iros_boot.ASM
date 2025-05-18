; IrOS version 1.2.0
; Boot
; Released into the public domain under CC0

org 0x7c00
use16

jmp start
nop
OEMName db 'SYSDSK  '
Sector dw 512
Drive db 00h
OSName db 'IrOS    '
FSName db 'IrFS    '

start:

cli
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0xFFFF
sti

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

start_irfs:

mov si,'A'
mov ax,0000h
mov dl,0
mov es,ax
mov bx,500h
mov ch,0
mov cl,02h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
jmp 0000:0500h

error:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'F'
int 10h
mov al,'S'
int 10h
mov al,' '
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
mov ah,10h
int 16h
int 19h

times 510 - ($ - $$) db 0
db 0x55,0xAA