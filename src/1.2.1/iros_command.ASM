; IrOS version 1.2.1
; Command Interface
; Released into the public domain under CC0

use16

command:

xor dl,dl

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

cmp al,'a'
jz load_file_drive

cmp al,'r'
jz reboot

cmp al,'m'
jz memory

cmp al,'i'
jz sys_info

cmp al,'c'
jz clear

cmp al,'d'
jz disk
jmp load_file

load_file:

movzx si,al
jmp 0000:0500h

load_file_drive:

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
jmp error

load_drive_A:

mov dl,0
jmp load_

load_drive_B:

mov dl,1
jmp load_

load_drive_C:

mov dl,2
jmp load_

load_drive_D:

mov dl,80h
jmp load_

load_:

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

jmp command

sys_info:

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
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'v'
int 10h
mov al,'e'
int 10h
mov al,'r'
int 10h
mov al,' '
int 10h
mov al,'1'
int 10h
mov al,'.'
int 10h
mov al,'2'
int 10h
mov al,'.'
int 10h
mov al,'1'
int 10h
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'P'
int 10h
mov al,'u'
int 10h
mov al,'b'
int 10h
mov al,'l'
int 10h
mov al,'i'
int 10h
mov al,'c'
int 10h
mov al,' '
int 10h
mov al,'D'
int 10h
mov al,'o'
int 10h
mov al,'m'
int 10h
mov al,'a'
int 10h
mov al,'i'
int 10h
mov al,'n'
int 10h
jmp command

clear:

mov ax,0002h
int 10h
jmp command

disk:

cmp dl,0
jz d_a
cmp dl,1
jz d_b
cmp dl,2
jz d_c
cmp dl,80h
jz d_d
d_a:
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'A'
int 10h
mov al,'\'
int 10h
jmp command
d_b:
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'B'
int 10h
mov al,'\'
int 10h
jmp command
d_c:
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'C'
int 10h
mov al,'\'
int 10h
jmp command
d_d:
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'D'
int 10h
mov al,'\'
int 10h
jmp command

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