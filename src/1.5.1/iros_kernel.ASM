; IrOS version 1.5.1
; Kernel
; Released into the public domain under CC0

use16

call n_s

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
mov al,'5'
int 10h
mov al,'.'
int 10h
mov al,'1'
int 10h

load_command:

mov si,'B'
mov di,1
jmp 0000:0500h

fatal_error:

mov ax,0002h
int 10h

mov al,'F'
int 10h
mov al,'A'
int 10h
mov al,'T'
int 10h
mov al,'A'
int 10h
mov al,'L'
int 10h
mov al,' '
int 10h
mov al,'E'
int 10h
mov al,'R'
int 10h
mov al,'R'
int 10h
mov al,'O'
int 10h
mov al,'R'
int 10h
mov ah,10h
int 16h
int 19h

n_s:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
ret

jmp $

db 'Public Domain Software'