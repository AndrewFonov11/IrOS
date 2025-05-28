; IrOS version 1.5.1
; Copy File
; Released into the public domain under CC0

use16

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

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
jmp copy_

load_drive_B:

mov dl,1
jmp copy_

load_drive_C:

mov dl,2
jmp copy_

load_drive_D:

mov dl,80h
jmp copy_

load_drive_E:

mov dl,81h
jmp copy_

copy_:

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

cmp al,'A'
jz copy_1
cmp al,'B'
jz copy_2
cmp al,'C'
jz copy_3
cmp al,'D'
jz copy_4
cmp al,'E'
jz copy_5
cmp al,'F'
jz copy_6
cmp al,'G'
jz copy_7
cmp al,'H'
jz copy_8

copy_1:

mov cl,03h
jmp copy_file

copy_2:

mov cl,05h
jmp copy_file

copy_3:

mov cl,07h
jmp copy_file

copy_4:

mov bx,4000h
mov cl,09h
jmp copy_file

copy_5:

mov cl,0Bh
jmp copy_file

copy_6:

mov cl,0Dh
jmp copy_file

copy_7:

mov cl,0Fh
jmp copy_file

copy_8:

mov cl,11h
jmp copy_file

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
mov dl,0
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