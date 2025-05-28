; IrOS version 1.5.1
; Type Data
; Released into the public domain under CC0

use16

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,'-'
int 10h
int 10h
int 10h
mov al,' '
int 10h
mov al,'T'
int 10h
mov al,'y'
int 10h
mov al,'p'
int 10h
mov al,'e'
int 10h
mov al,' '
int 10h
mov al,'D'
int 10h
mov al,'a'
int 10h
mov al,'t'
int 10h
mov al,'a'
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

mov al,'D'
int 10h
mov al,':'
int 10h

xor ax, ax
int 16h
mov ah,0x0e
int 10h

cmp al,'A'
jz load_drive_A
cmp al,'B'
jz load_drive_B
cmp al,'C'
jz load_drive_C
cmp al,'D'
jz load_drive_D
cmp al,'E'
jz load_drive_E
jmp error

load_drive_A:

mov dl,0
jmp type_data

load_drive_B:

mov dl,1
jmp type_data

load_drive_C:

mov dl,2
jmp type_data

load_drive_D:

mov dl,80h
jmp type_data

load_drive_E:

mov dl,81h
jmp type_data

type_data:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov bx,2000h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,10h
mov cl,01h
mov ah,02h
int 13h
jc error
mov si,bx
mov di,0
jmp print_type_data

print_type_data:
lodsb
mov ah,0x0e
int 10h
inc di
cmp di,00FFh
jz next
jmp print_type_data

next:

mov ah,10h
int 16h
cmp al,'x'
jz exit_prog
mov di,0
jmp print_type_data

exit_prog:

mov si,'B'
mov di,1
jmp 0000:0500h

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
mov ah,10h
int 16h
mov ax,0002h
int 10h
int 19h