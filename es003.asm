;ANDREA TOMATIS
;3AROB
;31/01/20
;ES3 Caricare due variabili Num1 e Num2 con valori a scelta poi salvare nella variabile Min il
;    valore minimo e nella variabile Max il valore massimo.

data segment
    ; add your data here! 
    min db ?
    max db ?
    num1 db 3
    num2 db 4
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
    mov al, num2
    
    CMP al, num1
    jb Num2Max
    
    mov ah, num1
    mov min, ah
    
    mov max, al
    
    jmp fine
    
    Num2Max:
    mov min, al
    mov ah, num1
    mov max, ah
    
    
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
