;ANDREA TOMATIS
;3AROB
;es029: Dati in input N numeri, contare e visualizzare quanti sono pari e quanti sono dispari.

data segment
    ; add your data here! 
    string00 db "CONTARE QUANTI SONO PARI E QUANTI NO TRA N NUMERI$"
    string01 db "inserisci il numero di input: $"
    string02 db "inserisci un numero: $"
    string03 db "i pari sono: $"
    string04 db "i dispari sono: $"
    acapo db 10, 13, "$"
    num db ?
    n db ?
    cntPari db 0
    cntDisp db 0
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
    
    
    ;----------INSERIMENTO N---------------
    
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
    
    ;-----------CICLO DI STAMPA-------------
    mov cx, 0
    mov cl, n
    
    ciclo:
    
    cmp cl, 0
    je fine
    dec cl
    
    ;-----INSERIMENTO NUMERI--------------  
    lea dx, string02
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov num, al 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    ;controlla se il numero e' pari o meno
    mov ax, 0
    mov al, num
    mov bl, 2
    
    div bl
    
    cmp ah, 0
    je pari
    
    dispari:
    inc cntDisp  ;incremento contatore dispari
    jmp continua
    
    pari:
    inc cntPari  ;incremento contatore pari 
    
    continua:
    jmp ciclo
    
    
    
    fine:    
    ;---------STAMPA I CONTATORI-----------
    lea dx, string03
    mov ah, 9
    int 21h
    
    mov al, cntPari
    add al, 30h
    mov dl, al
    mov ah, 02
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    lea dx, string04
    mov ah, 9
    int 21h
    
    mov al, cntDisp
    add al, 30h
    mov dl, al
    mov ah, 02
    int 21h  
    
    lea dx, acapo
    mov ah, 9
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
