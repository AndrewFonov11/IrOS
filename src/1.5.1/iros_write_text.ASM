; IrOS version 1.5.1
; Write Text
; Released into the public domain under CC0

use16

mov ax,0002h
int 10h

mov ah,0x0e
mov al,'-'
int 10h
int 10h
int 10h
mov al,' '
int 10h
mov al,'W'
int 10h
mov al,'r'
int 10h
mov al,'i'
int 10h
mov al,'t'
int 10h
mov al,'e'
int 10h
mov al,' '
int 10h
mov al,'T'
int 10h
mov al,'e'
int 10h
mov al,'x'
int 10h
mov al,'t'
int 10h
mov al,' '
int 10h
mov al,'-'
int 10h
int 10h
int 10h

mov al,0x0A
int 10h
mov al,0x0D
int 10h

aa:
        xor ax, ax
        int 16h
        mov ah,0x0e
        int 10h
        cmp al,1Bh
        jz exit_prog
        cmp al,0Dh
        jz enter_

jmp aa

exit_prog:
        mov ax,0002h
        int 10h
        mov si,'B'
        mov di,1
        jmp 0000:0500h

enter_:
        mov ah,0x0e
        mov al,0x0A
        int 10h
        mov al,0x0D
        int 10h
        jmp aa

jmp $