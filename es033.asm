;ANDREA TOMATIS
;3AROB
;es033: Dare in input un numero N senza echo; eseguire la ricerca del numero N, dando indicazioni
;(il numero inserito e' piu' piccolo o piu' grande di N?) e contando i tentativi.


data segment
    ; add your data here!  
    string00 db "DATO UN NUMERO N, CONTARE I TENTATIVI DI RICERCA DANDO SUGGERIMENTI$"
    string01 db "inserisci un numero n: $"
    string02 db "inserisci un altro numero: $"
    string03 db "il numero e' piu' piccolo$"
    string04 db "il numero e' piu' grande$"
    string05 db "Indovinato! numero tentativi: $"
    n db ?
    acapo db 10, 13, "$"
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
    lea dx, string00   ;stampa il titolo e va a capo
    mov ah, 9
    int 21h
 
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    ;-----INSERIMENTO NUMERO N----------
    lea dx, string01
    mov ah, 9
    int 21h
    
    mov ah, 07
    int 21h
    mov n, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
 
    ;-----PROVA A INDOVINARE IL NUMERO-----
    mov cl, 0
    
    ciclo:
    
    
    ;inserimento numero
    lea dx, string02
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h 
    mov bl, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    inc cl
    
    ;condizione ciclo
    cmp bl, n
    je fine 
    
    
    cmp bl, n
    jb Piccolo
    
    lea dx, string04
    mov ah, 9
    int 21h 
    lea dx, acapo
    mov ah, 9
    int 21h
    jmp continua
    
    Piccolo:
    lea dx, string03
    mov ah, 9
    int 21h 
    lea dx, acapo
    mov ah, 9
    int 21h 
     
    continua:
    jmp ciclo
    
    fine:
    ;-----STAMPA IL CONTATORE---------
    lea dx, string05
    mov ah, 9
    int 21h
         
    add cl, 30h
    mov dl, cl
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
