; IrOS version 1.3.1
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
jz num_drive

cmp al,'i'
jz sys_info

cmp al,'c'
jz clear

cmp al,'l'
jz l_file

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
mov al,'3'
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

l_file:

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
jz l_drive_A
cmp al,'B'
jz l_drive_B
cmp al,'C'
jz l_drive_C
cmp al,'D'
jz l_drive_D
jmp error

l_drive_A:

mov dl,0
jmp l_file_strt

l_drive_B:

mov dl,1
jmp l_file_strt

l_drive_C:

mov dl,2
jmp l_file_strt

l_drive_D:

mov dl,80h
jmp l_file_strt

l_file_strt:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov bx,7c00h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov cl,01h
mov al,01h
mov ah,02h
int 13h
jc error
mov si,7c03h
mov di,1
jmp print_type_data

files:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov bx,500h
mov ax,0000h
mov es,ax
mov ch,0
mov dh,0
mov cl,02h
mov al,02h
mov ah,02h
int 13h
jc error
mov si,503h
jmp print_type_data

print_type_data:
lodsb
mov ah,0x0e
int 10h
cmp al,0
jz cmp_di
jmp print_type_data
cmp_di:
cmp di,0
jz command
mov di,0
jmp files

num_drive:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
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
jc n_d_3
inc si
n_d_3:
mov ax,0000h
mov es,ax
mov dl,81h
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc end_
inc si
end_:
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