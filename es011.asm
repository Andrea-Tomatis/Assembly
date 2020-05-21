;ANDREA TOMATIS
;3AROB
;es011:Dopo avere inizializzato la variabile N con un valore a piacere, caricare nella variabile NUM
;i primi N numeri pari.

data segment
    ; add your data here! 
    n db 5
    num db ?
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
    mov cx, 0
    mov cl, n
    mov bh, 1
    
    ciclo:
    
    mov ax, cx
    mov bl, 2
    
    div bl
    
    cmp ah, 0
    jne dispari
    mov num, bh
    dispari:
    jmp cond
    
    cond:
    
    inc bh
    loop ciclo
            
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
