;ANDREA TOMATIS
;3AROB
;es024: Visualizzare la somma e la differenza di due numeri minori di 5 dati in input (la differenza
;       deve essere fatta tra il numero maggiore e quello minore).

data segment
    ; add your data here!  
    string00 db "DIFFERENZA E SOMMA TRA DUE NUMERI$"
    string01 db "inserisci il primo numero $"
    string02 db "inserisci il secondo numero $"
    string03 db "la somma e': $"
    string04 db "la differenza e': $"
    acapo db 10, 13, "$"
    num1 db ?
    num2 db ?
    somma db ?
    diff db ?
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
    
    lea dx, string01    ;stampa la richiesta del primo numero
    mov ah, 9
    int 21h  
    
    
    mov ah, 01      ;primo numero inserito da tastiera
    int 21h
    sub al, 30h
    mov num1, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    lea dx, string02    ;stampa la richiesta del secondo numero
    mov ah, 9
    int 21h  
    
    
    mov ah, 01      ;secondo numero inserito da tastiera
    int 21h
    sub al, 30h
    mov num2, al
    
    lea dx, acapo
    mov ah, 9
    int 21h   
    
    
    ;----------ESEGUIRE LA SOMMA-----------
    mov al, num2
    add al, num1
    add al, 30h
    mov somma, al
    
    lea dx, string03    ;stampa la stringa STRING03
    mov ah, 9
    int 21h
    
    mov dl, somma       ;stampa la somma
    mov ah, 02
    int 21h 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    
    ;---------ESEGUIRE LA SOTTRAZIONE--------- 
    mov al, num1
    cmp al, num2
    jb Num2Max
    
    mov al, num1
    sub al, num2
    add al, 30h
    mov diff, al
    
    jmp Stampa
    
    Num2Max:
    mov al, num2
    sub al, num1
    add al, 30h
    mov diff, al
    
    Stampa:
    lea dx, string04    ;stampa la stringa STRING04
    mov ah, 9
    int 21h
    
    mov dl, diff       ;stampa la somma
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
