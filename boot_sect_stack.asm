mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

; x86 is a little-endian system so we are taking 0x80000 - 0x2
; as push puts runes as 16-bit values where the MSB is 0x00
mov al, [0x7ffe]
int 0x10

jmp $

times 510 - ($-$$) db 0
dw 0xaa55
