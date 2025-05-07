; IrOS version 1.1.0
; Kernel
; Released into the public domain under CC0

org 1000h
use16

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,'I'
int 10h
mov al,'r'
int 10h
mov al,'O'
int 10h
mov al,'S'
int 10h
mov al,' '
int 10h
mov al,'1'
int 10h
mov al,'.'
int 10h
mov al,'1'
int 10h
mov al,'.'
int 10h
mov al,'0'
int 10h

load_command:

mov si,'B'
jmp 0000:0500h

jmp $

db 'Public Domain Software'