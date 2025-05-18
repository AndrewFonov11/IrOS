; IrOS version 1.2.0
; Copy File
; Released into the public domain under CC0

use16

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov al,':'
int 10h

mov ah,10h
int 16h

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

copy_1:

mov bx,1000h
mov cl,03h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,1000h
mov cl,03h
mov dl,0
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

copy_2:

mov bx,2000h
mov cl,05h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,2000h
mov cl,05h
mov dl,0
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

copy_3:

mov bx,3000h
mov cl,07h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,3000h
mov cl,07h
mov dl,0
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

copy_4:

mov bx,4000h
mov cl,09h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,4000h
mov cl,09h
mov dl,0
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

copy_5:

mov bx,5000h
mov cl,11h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,5000h
mov cl,11h
mov dl,0
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
jmp done

copy_6:

mov bx,6000h
mov cl,13h
mov ax,0000h
mov es,ax
mov dl,1
mov ch,0
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov bx,6000h
mov cl,13h
mov ax,0000h
mov dl,0
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