;; 
;; Read the first bit at memory address 0
;;

mov cl, 0xaa                    ; Load 0xaa into CL


;;
;; Check and see if the rightmost bit in CL is 1
;;

print_1:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x80                  ; Mask to get the first bit
  cmp bl, 0x80                  ; Compare BL to 1
  je print_one_1                ; Jump if equal (bit is 1)
  jne print_zero_1              ; Jump if it's zero


print_one_1:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_2                   ; Jump to end


print_zero_1:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_2                   ; Jump to end


print_2:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x40                  ; Mask to get the second bit (BL = 0 or 1)
  cmp bl, 0x40                  ; Compare BL to 1
  je print_one_2                ; Jump if equal (bit is 1)
  jne print_zero_2              ; Jump if it's zero


print_one_2:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_3                   ; Jump to end


print_zero_2:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_3                   ; Jump to end


print_3:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x20                  ; Mask to get the third bit (BL = 0 or 1)
  cmp bl, 0x20                  ; Compare BL to 1
  je print_one_3                ; Jump if equal (bit is 1)
  jne print_zero_3              ; Jump if it's zero


print_one_3:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_4                   ; Jump to end


print_zero_3:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_4                   ; Jump to end


print_4:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x10                  ; Mask to get the forth bit (BL = 0 or 1)
  cmp bl, 0x10                  ; Compare BL to 1
  je print_one_4                ; Jump if equal (bit is 1)
  jne print_zero_4              ; Jump if it's zero


print_one_4:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_5                   ; Jump to end


print_zero_4:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_5                   ; Jump to end


print_5:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x08                  ; Mask to get the fifth bit (BL = 0 or 1)
  cmp bl, 0x08                  ; Compare BL to 1
  je print_one_5                ; Jump if equal (bit is 1)
  jne print_zero_5              ; Jump if it's zero


print_one_5:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_6                   ; Jump to end


print_zero_5:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_6                   ; Jump to end


print_6:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x04                  ; Mask to get the sixth bit (BL = 0 or 1)
  cmp bl, 0x04                  ; Compare BL to 1
  je print_one_6                ; Jump if equal (bit is 1)
  jne print_zero_6              ; Jump if it's zero


print_one_6:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_7                   ; Jump to end


print_zero_6:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_7                   ; Jump to end


print_7:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x02                  ; Mask to get the seventh bit (BL = 0 or 1)
  cmp bl, 0x02                  ; Compare BL to 1
  je print_one_7                ; Jump if equal (bit is 1)
  jne print_zero_7              ; Jump if it's zero


print_one_7:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_8                   ; Jump to end


print_zero_7:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '0'                   ; Load '0' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp print_8                   ; Jump to end


print_8:
  mov bl, cl                    ; Copy CL to BL
  and bl, 0x01                  ; Mask to get the last bit (BL = 0 or 1)
  cmp bl, 0x01                  ; Compare BL to 1
  je print_one_8                ; Jump if equal (bit is 1)
  jne print_zero_8              ; Jump if it's zero


print_one_8:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '1'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp done                      ; Jump to end


print_zero_8:
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

