[ORG 0x7C00]


;;
;; Set up the stack
;;

mov ax, 0x0050  ; Start the stack at 0x0500 = 16 * 0x0500
mov ss, ax
mov sp, 0x7700  ; Gets us all the way to 0x7c00 (where the bootloader is)


main:
  mov word [ADDRESS_VAR], sp
  call print_address

  push 0xff

  mov byte [CHAR_VAR], ' '
  call print_char

  mov word [ADDRESS_VAR], sp
  call print_address

  jmp done


print_address:
  mov byte [CHAR_VAR], '0'
  call print_char
  mov byte [CHAR_VAR], 'x'
  call print_char

  mov ax, [ADDRESS_VAR]   ; Print high byte
  mov byte [BYTE_VAR], ah
  call print_byte_hex

  mov ax, [ADDRESS_VAR]   ; Print low byte
  mov byte [BYTE_VAR], al
  call print_byte_hex

  ret


print_byte_hex:
  mov al, [BYTE_VAR]

  and al, 0xf0  ; Get high nibble
  shr al, 4
  cmp al, 10
  mov dx, print_byte_hex_high_nibble_return
  jl print_digit_wrapper
  jmp print_char_wrapper
print_byte_hex_high_nibble_return:
  mov al, [BYTE_VAR]

  and al, 0x0f  ; Get low nibble
  cmp al, 10
  mov dx, print_byte_hex_low_nibble_return
  jl print_digit_wrapper
  jmp print_char_wrapper
print_byte_hex_low_nibble_return:
  ret


print_digit_wrapper:
  mov byte [DIGIT_VAR], al
  call print_digit
  jmp dx


print_char_wrapper:
  add al, 87              ; 10 -> 97 = a, 11 -> 98 = b, ..., 15 -> 102 = f
  mov byte [CHAR_VAR], al
  call print_char
  jmp dx


print_char:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, [CHAR_VAR]            ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  ret
  

print_word:
  mov ax, [WORD_VAR]
  mov [BYTE_VAR], ah
  call print_byte

  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, ' '                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'

  mov ax, [WORD_VAR]
  mov [BYTE_VAR], al
  call print_byte

  ret


print_byte:
  mov byte [BIT_VAR], 1 ;
  call print_bit        ; Print first bit of [BYTE_VAR]

  mov byte [BIT_VAR], 2 ;
  call print_bit        ; Print second bit of [BYTE_VAR]

  mov byte [BIT_VAR], 3 ;
  call print_bit        ; Print third bit of [BYTE_VAR]

  mov byte [BIT_VAR], 4 ;
  call print_bit        ; Print forth bit of [BYTE_VAR]

  mov ah, 0x0E          ; BIOS Teletype Output function
  mov al, ' '           ; Load '1' ASCII code into AL
  int 0x10              ; Print '1'

  mov byte [BIT_VAR], 5 ;
  call print_bit        ; Print fifth bit of [BYTE_VAR]

  mov byte [BIT_VAR], 6 ;
  call print_bit        ; Print sixth bit of [BYTE_VAR]

  mov byte [BIT_VAR], 7 ;
  call print_bit        ; Print seventh bit of [BYTE_VAR]

  mov byte [BIT_VAR], 8 ;
  call print_bit        ; Print eighth bit of [BYTE_VAR]

  ret


print_bit:
  mov cl, 8
  mov bl, [BIT_VAR]
  sub cl, bl           ; 8 - i
  mov al, [BYTE_VAR]
  shr al, cl           ; Shift by the number of digits to get the bit to the end

  and al, 1
  mov dx, print_bit_return
  mov [DIGIT_VAR], al
  call print_digit
print_bit_return:
  ret


print_digit:
  mov al, [DIGIT_VAR]
  add al, 48
  mov byte [CHAR_VAR], al
  call print_char
  ret


done:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, '.'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'
  jmp $


GLOBAL_VARIABLES:
  BIT_VAR db 0       ; for calling print_bit
  BYTE_VAR db 0xfe   ; for calling print_byte and print_byte_hex
  WORD_VAR dw 0x0000 ; for calling print_word
  CHAR_VAR db 0      ; for calling print_char
  DIGIT_VAR db 0     ; for calling print_digit
  ADDRESS_VAR dw 0   ; for calling print_byte_at_address


;;
;; Bootloader code
;;

times 510-($-$$) db 0           ; Pad the rest of the boot sector with zeros
db 0x55, 0xaa                   ; Boot signature
