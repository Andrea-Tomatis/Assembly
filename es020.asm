;ANDREA TOMATIS
;3AROB
;es020:

data segment
    ; add your data here!    
    a db 3
    b db 9
    cont db ?
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
    mov bl, 2
    mov ax, 0
    mov cx, 0
    mov cl, a
    
    ciclo:
    
    cmp cl, b
    je fine
    mov al, cl
    div bl
    cmp ah, 0
    jne dispari
    inc cl
    jmp ciclo
    
    dispari:
    add ch, cl
    inc cl
    jmp ciclo
    
    fine:
    mov cont, ch
            
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
