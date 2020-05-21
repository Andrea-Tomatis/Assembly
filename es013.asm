;ANDREA TOMATIS
;3AROB
;es013:Assegnare due valori a scelta a 2 variabili A e B,incrementare la minore di uno finché non
;diventa uguale alla maggiore.

data segment
    ; add your data here!   
    a db 3
    b db 10
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
    mov al, a
    cmp al,b
    jb bMaggiore
    mov cl, a 
    mov ch, b
    jmp ciclo
    
    bMaggiore:
    mov cl, b
    mov ch, a   
    
    ciclo:
    cmp cl, ch
    je fine
    dec cl
    jmp ciclo
    
    
    fine:   
    mov a, cl
    mov b, ch
            
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
