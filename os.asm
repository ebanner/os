[ORG 0x7C00]                    ; Boot sector starts at memory address 0x7C00


mov cl, 0x12


bit1:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x80                  ; Mask to get the first bit
  cmp bl, 0x80                  ; Compare BL to 1
  mov dx, bit2                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit2:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x40                  ; Mask to get the first bit
  cmp bl, 0x40                  ; Compare BL to 1
  mov dx, bit3                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit3:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x20                  ; Mask to get the first bit
  cmp bl, 0x20                  ; Compare BL to 1
  mov dx, bit4                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit4:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x10                  ; Mask to get the first bit
  cmp bl, 0x10                  ; Compare BL to 1
  mov dx, bit5                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit5:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x08                  ; Mask to get the first bit
  cmp bl, 0x08                  ; Compare BL to 1
  mov dx, bit6                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit6:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x04                  ; Mask to get the first bit
  cmp bl, 0x04                  ; Compare BL to 1
  mov dx, bit7                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit7:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x02                  ; Mask to get the first bit
  cmp bl, 0x02                  ; Compare BL to 1
  mov dx, bit8                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero

bit8:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x01                  ; Mask to get the first bit
  cmp bl, 0x01                  ; Compare BL to 1
  mov dx, done                  ; Say where to jump back to
  je print_one                  ; Jump if equal (bit is 1)
  jne print_zero                ; Jump if it's zero


print_zero:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp dx                        ; Jump to end


print_one:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp dx                        ; Jump to end


done:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '.'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'

  jmp $


;;
;; Bootloader code
;;

times 510-($-$$) db 0           ; Pad the rest of the boot sector with zeros
db 0x55, 0xaa                   ; Boot signature

