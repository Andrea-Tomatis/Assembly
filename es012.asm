;ANDREA TOMATIS
;3AROB
;es012:Dopo avere inizializzato le variabili N ed A con valori a piacere, caricare nella variabile
;NUM i primi N multipli del numero A.

data segment
    ; add your data here!
    a db 2
    n db 3
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
    mov bl, a   
    
    
    
    ciclo:
    mov ax, 0
    mov al, bl
    div a
    
    cmp ah, 0
    jne NonMultiplo
    mov num, bl
    inc cl    
         
    
    NonMultiplo:
    inc bl
    cmp cl, n
    jne ciclo
            
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
