;ANDREA TOMATIS
;3AROB
;es043: Caricare in due vettori paralleli N elementi (controllare che N sia compreso tra 1 e 9 e che i
;valori inseriti siano compresi tra 0 e 9); sommare gli elementi del primo vettore con quelli
;del secondo, caricandoli in un terzo vettore che dovrà essere stampato

data segment
    vett1 db 1,2,3,4,5
    vett2 db 4,3,3,1,2
    vett3 db 5 dup(?)
    dim db ?
    string00 db "SOMMARE DUE VETTORI IN UN TERZO VETTORE$" 
    string01 db "inserisci la dimensione dei vettori: $"
    string02 db "inserisci un elemento nel vettore: $"
    string03 db "i vettori contengono: $"
    acapo db 10, 13, "$"    
    spazio db 32, "$"
    
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
    ;CICLO DI CARICAMENTO DEI VETTORI
    ;---------------------------------------
    
    mov cx, 0
    mov cl, dim  
    mov si, 0
    mov di, 0
    ciclo:
    
    
    ;caricamento vettore 1
    inputVet1:
    lea dx, string02
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h  
    sub al, 30h
    mov vett1[di], al
   
    lea dx, acapo
    mov ah, 9
    int 21h
    
    cmp vett1[si], 0
    jb inputVet1 
    cmp vett1[si], 9
    ja inputVet1
    
    
    ;caricamento vettore 2
    inputVet2:
    lea dx, string02
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h  
    sub al, 30h
    mov vett2[di], al 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    cmp vett2[si], 0
    jb inputVet2
    cmp vett2[si], 9
    ja inputVet2
                   
    
    ;caricamento vettore 3
    mov al, vett1[si]
    add al, vett2[si]
    mov vett3[di], al  
    
    
    ;fine ciclo         
    inc di
    mov si, di
    
    loop ciclo 
    
    
    ;stampa dei tre vettori  
                           
    mov cx, 0
    mov cl, dim
    mov si, 0
    
    lea dx, string01
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    stampa:    
    
    mov dl, vett1[si]  
    add dl, 30h
    mov ah, 2
    int 21h
    
    lea dx, spazio
    mov ah, 9
    int 21h 
    
    mov dl, vett2[si]
    add dl, 30h
    mov ah, 2
    int 21h       
    
    lea dx, spazio
    mov ah, 9
    int 21h 
    
    mov dl, vett3[si]
    add dl, 30h
    mov ah, 2
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
                 
    inc si
    
    loop stampa
            
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
