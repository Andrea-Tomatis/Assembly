;ANDREA TOMATIS
;3AROB
;es017Calcolare il prodotto di due numeri scelti a piacere, usando solo istruzioni di somma.

data segment                                                                                
    
    ; add your data here!
    a db 2
    b db 3
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    mov al, a
    mov cx, 0
    ciclo:   
    add al, b
    inc cl
    cmp cl, b
    je fine
    jmp ciclo
    
    fine:
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
