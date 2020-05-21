;ANDREA TOMATIS
;3AROB
;es044: Caricare un vettore con N elementi (N compreso tra 1 e 9) e poi stampare la somma dei
;       valori dei suoi elementi

data segment
    vett db ?
    dim db ?
    string00 db "SOMMARE GLI ELEMENTI DI UN VETTORE$" 
    string01 db "inserisci la dimensione del vettore: $"
    string02 db "inserisci un elemento nel vettore: $"
    string03 db "la somma degli elementi del vettore e': $"
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
    
    
    
    ;----------------------------
    ;CICLO DI CARICAMENTO DEL VETTORE
    ;---------------------------------------
    
    mov cx, 0
    mov cl, dim  
    mov si, 0
    mov di, 0
    ciclo:
    
    inputVet:
    lea dx, string02
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h  
    sub al, 30h
    mov vett[DI], al
   
    lea dx, acapo
    mov ah, 9
    int 21h
    
    cmp vett[si], 0
    jb inputVet 
    cmp vett[si], 9
    ja inputVet     
    
    ;fine ciclo         
    inc di
    mov si, di
    
    loop ciclo 
    
    ;----------------------------------------------   
    ;CALCOLO SOMMA DEGLI ELEMENTI
    ;----------------------------------------------
    
    mov cx, 0
    mov cl, dim
    mov si, 0
    
    mov bl, 0
    
    calcola:
    
    add bl, vett[si]
    
    inc si
    loop calcola
    
    
    ;----------------------------
    ;stampa dei tre vettori  
    ;------------------------------                       
    mov cx, 0
    mov cl, dim
    mov si, 0
    
    lea dx, string03
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    add bl, 30h
    lea dl, bl
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
