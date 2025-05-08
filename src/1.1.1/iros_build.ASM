; IrOS bulid
; Released into the public domain under CC0

format binary as 'img'
macro align value { db value-1 - ($ + value-1) mod (value) dup 0 }
HEADS = 1
SPT = 14
Begin:
        file "iros_boot.bin",512
        file "iros_files.bin"
        align 512
        file "iros_kernel.bin"
        align 1024
        file "iros_command.bin"
        align 1024
        file "iros_write_text.bin"
        align 1024
        file "iros_copy_file.bin"
        align 1024
        times 1024
        times 1024