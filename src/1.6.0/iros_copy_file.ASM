; IrOS version 1.6.0
; Copy File
; Released into the public domain under CC0

use16

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

cmp cl,0
jz start_
jmp copy_file

start_:

mov ah,0x0e
mov al,'-'
int 10h
int 10h
int 10h
mov al,' '
int 10h
mov al,'C'
int 10h
mov al,'o'
int 10h
mov al,'p'
int 10h
mov al,'y'
int 10h
mov al,' '
int 10h
mov al,'F'
int 10h
mov al,'i'
int 10h
mov al,'l'
int 10h
mov al,'e'
int 10h
mov al,' '
int 10h
mov al,'-'
int 10h
int 10h
int 10h

call disks

file_:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,'F'
int 10h
mov al,':'
int 10h

xor ax, ax
int 16h
mov ah,0x0e
int 10h

movzx si,al
mov di,4
mov ax,0000h
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

copy_file:

mov bx,2000h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
call disks
mov bx,2000h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

done:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'D'
int 10h
mov al,'o'
int 10h
mov al,'n'
int 10h
mov al,'e'
int 10h
mov ah,10h
int 16h
mov ax,0002h
int 10h
int 19h

disks:

mov ah,0x0e
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
jmp next

load_drive_B:

mov dl,1
jmp next

load_drive_C:

mov dl,2
jmp next

load_drive_D:

mov dl,80h
jmp next

load_drive_E:

mov dl,81h
jmp next

next:
ret

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