;ANDREA TOMATIS
;3AROB
;31/01/20
;ES006:Verificare se il contenuto della variabile A è maggiore, minore o uguale a 2. Se è maggiore
;impostare AH a 1, se è minore impostare AL a 1, se è uguale impostare BL a 1.


data segment
    ; add your data here! 
    num db 2
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
    cmp num, 2
    jb Minore
    jz Uguale
    mov ah,1
    jmp fine
    
    Minore:
    mov al, 1
    jmp fine 
    
    Uguale:
    mov bl, 1
    jmp fine
    
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
