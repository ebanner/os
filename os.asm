;; 
;; Read the first bit at memory address 0
;;

mov ax, 0x0000                  ; Load 0x0000 into AX
mov ds, ax                      ; Need to set the segment register to zero 
mov al, [0x0000]                ; Offsets are 16 bits (65535 max)


;;
;; Check and see if the rightmost bit in AL is 1
;;

mov bl, al                      ; Copy AL to BL
and bl, 1                       ; Mask to get the rightmost bit (BL = 0 or 1)
cmp bl, 1                       ; Compare BL to 1
je print_one                    ; Jump if equal (bit is 1)
jne print_zero                  ; Jump if it's zero


print_one:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp done                      ; Jump to end


print_zero:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp done                      ; Jump to end


done:
  jmp $                         ; Loop forever


;;
;; Bootloader code
;;

times 510-($-$$) db 0           ; Pad the rest of the boot sector with zeros
db 0x55, 0xaa                   ; Boot signature

