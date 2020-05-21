
;ANDREA TOMATIS
;3AROB
;es038: Dopo avere dato in input N, stampare la somma dei primi N numeri naturali.


data segment
    ; add your data here! 
    string00 db "DATO N, STAMPARE LA SOMMA DEI PRIMI N NUMERI NATURALI$"
    string01 db "inserisci il numero di naturali: $"
    string02 db "la somma e': $"
    n db ? 
    somma db 0
    acapo db 10, 13 , "$"
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
    lea dx, string00    ;stampa il titolo e va a capo
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    ;----------INSERIMENTO N DA TASTIERA------
    lea dx, string01
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov n, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
             
             
    ;------CICLO DI STAMPA NUMERI INTERI-------
    mov cx, 0
    
    ciclo:
    cmp cl, n
    je fine
    
    inc cl
    add somma, cl
    
    
    jmp ciclo
    
    fine:
    
    ;-------STAMPA SOMMA------------------ 
    lea dx, string02
    mov ah, 9
    int 21h
    
    mov al, somma 
    add al, 30h
    mov dl, al
    mov ah, 02
    int 21h    
    
            
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
