;ANDREA TOMATIS
;3AROB
;07/02/2020
;ES009:Caricare tre variabili Num1, Num2 e Num3 con valori a scelta poi salvare nella variabile
;MAX il valore massimo tra i tre numeri.

data segment
    num1 db 2
    num2 db 5
    num3 db 4
    max db ?
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
    
    mov al, num1
    mov max, al
    
    mov ah, num2
    
    cmp max, ah
    jb Num02
    
    mov ah, num3
    
    cmp max, ah
    jb Num03
    
    Num02:             
    
    mov max, ah
    mov ah, num3
    cmp max, ah
    jb Num03
    jmp fine
    
    Num03:
    mov max, ah
    jmp fine 
    
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
