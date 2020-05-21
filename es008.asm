;ANDREA TOMATIS
;31/01/20
;3AROB
;ES008 Dopo aver caricato due valori nelle variabili Num1 e Num2 (con Num1 maggiore di Num2),
;      mettere nella variabile Ris il valore 1 se Num1 è multiplo di Num2 oppure 0 se non è
;      multiplo.

data segment
    ; add your data here! 
    num db 4
    num2 db 2
    Ris db ?
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
    mov al, num
    mov ah, 0
    mov bl, num2
    div bl
    cmp ah, 0
    je Multiplo
    mov Ris, 0
    jmp fine
    
    Multiplo:
    mov Ris, 1
    
    fine :
            
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
