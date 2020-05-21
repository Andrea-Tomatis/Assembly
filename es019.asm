;ANDREA TOMATIS
;3AROB
;es019:Dopo avere caricato un numero NUM in una variabile da 1 byte, sommare i numeri pari
;compresi tra 0 e NUM e salare il risultato nella variabile SOMMA.

data segment
    ; add your data here! 
    num db 6
    somma db ?
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
    
    ciclo:
    inc cl
    cmp cl, num
    je fine
    mov al, cl
    div bl
    cmp ah, 0
    je pari
    jmp ciclo
    
    pari:
    add ch, cl
    jmp ciclo
    
    fine:
    mov somma, ch
            
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
