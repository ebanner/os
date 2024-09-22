[ORG 0x7C00]

main:
  call read_first_sector_from_disk
  mov byte [READ_INDEX], 0
loop:
  mov bx, buffer
  mov ax, 0
  mov al, [READ_INDEX] ; i
  add bx, ax   ; buffer + i
  mov al, [bx] ; *(buffer+i)

  cmp al, 0 ; finish if null byte
  je done

  mov [CHAR_VAR], al
  call print_char

  mov al, [READ_INDEX]
  add al, 1
  mov [READ_INDEX], al

  jmp loop


read_first_sector_from_disk:
  mov ah, 0x02   ; BIOS function for reading from disk
  mov al, 1      ; Read 1 sector (512 byte chunk)
  mov ch, 0      ; Cylinder number (which 3D ring)
  mov cl, 1      ; Sector number (which slice of the pie [ring])
  mov dh, 0      ; Head number (which level of the 3D ring [depth])
  mov dl, 0x81   ; Drive number (0x80 refers to the first block device)
  mov bx, buffer ; Buffer to store read data
  int 0x13       ; BIOS interrupt for disk operations
  ret


print_char:
  mov ah, 0x0E       ; BIOS Teletype Output function
  mov al, [CHAR_VAR] ; Load '1' ASCII code into AL
  int 0x10           ; Print '1'
  ret
  

done:
  mov ah, 0x0E ; BIOS Teletype Output function
  mov al, '.'  ; Load '1' ASCII code into AL
  int 0x10     ; Print '1'
  jmp $


times 510-($-$$) db 0 ; Pad the rest of the boot sector with zeros
db 0x55, 0xaa         ; Boot signature


GLOBAL_VARIABLES:
  CHAR_VAR db 0      ; for calling print_char
  READ_INDEX db 0    ; for calling print_byte_at_address


buffer:
  times 512 db 0 ; Define a buffer of 512 bytes AFTER the bootloader

