[ORG 0x7C00]                    ; Boot sector starts at memory address 0x7C00


main:
  mov dx, back
  jmp print


back:
  mov dx, done
  jmp print


print:
  mov ah, 0x0E                  ; BIOS Teletype Output function
  mov al, 'b'                   ; Load '1' ASCII code into AL
  int 0x10                      ; Print '1'

  jmp dx


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

