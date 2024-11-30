;
; A simple boot sector that prints a message to the screen using a BIOS routine.
;

main:
  mov ah, 0x0e              ; int 10/ah = 0eh -> scrolling teletype BIOS routine
  mov al, 'E'
  int 0x10

  jmp done

done:
  mov ah, 0x0e              ; int 10/ah = 0eh -> scrolling teletype BIOS routine
  mov al, '.'
  int 0x10
  jmp $

;
; Padding and magic BIOS number.
;

times 510-($-$$) db 0   ; When compiled, our program must fit into 512 bytes,                    
                        ; with the last two bytes being the magic number,                        
                        ; so here, tell our assembly compiler to pad out our                     
                        ; program with enough zero bytes (db 0) to bring us
                        ; to the 510th byte. 

dw 0xaa55               ; Last two bytes (one word) form the magic number,
                        ; so BIOS knows we are a boot sector.
