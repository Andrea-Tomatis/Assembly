;ANDREA TOMATIS
;3AROB
;es045: Caricare un vettore con N elementi (N compreso tra 1 e 9) e visualizzare quanti sono gli
;       elementi pari e quanti quelli dispari

data segment
    vett db 10 dup(?)
    dim db ?         
    pari db ?
    dispari db ?
    string00 db "CONTA GLI ELEMENTI PARI E DISPARI DI UN VETTORE$" 
    string01 db "inserisci la dimensione del vettore: $"
    string02 db "inserisci un elemento nel vettore: $"
    string03 db "gli elementi pari sono: $"
    string04 db "gli elementi dispari sono: $"
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
    lea dx, string00    ;stampa il titolo e va a capo
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    
    ;inserimento da tastiera della dimensione (con controllo)
    inputN:
    lea dx, string01
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h  
    sub al, 30h
    mov dim, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    cmp dim, 0
    jb inputN
    cmp dim, 9
    ja inputN
    
    
    ;--------------------------------------
    ;CARICAMENTO DEL VETTORE
    ;--------------------------------------
    mov cx, 0
    mov cl, dim
    mov di, 0
    
    carica:
    
    lea dx, string02
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov vett[di], al  
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    inc di
    loop carica 
    
    ;------------------------------
    ;CICLO DI CALCOLO DELLA SOMMA
    ;---------------------------------
    mov cx, 0
    mov cl, dim
    mov si, 0 
    mov bl, 2
    
    sommaV:
    
    mov ax, 0
    mov al, vett[si]
    
    div bl
    
    cmp ah, 0
    je elemPari
    
    inc dispari
    jmp continua
    
    elemPari:
    inc pari
      
    continua:
    inc si
    loop sommaV  
    
    
    ;---------------------------
    ;STAMPA DEI RISULTATI
    ;---------------------------  
    lea dx, string03
    mov ah, 9
    int 21h
    
    mov dl, pari 
    add dl, 30h
    mov ah, 02
    int 21h      
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    lea dx, string04
    mov ah, 9
    int 21h
    
    mov dl, dispari 
    add dl, 30h
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
