;ANDREA TOMATIS
;3AROB
;es018:Dopo avere caricato in 2 variabili A e B (di dimensione 1 byte) dei numeri a piacere,
;calcolare la potenza di A elevato a B usando solo operazioni di moltiplicazione.


data segment
    ; add your data here!
    a db 3
    b db 2
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
    mov cl, b
    
    ciclo:
    cmp cl, 1
    je fine
    dec cl 
    mul a
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
