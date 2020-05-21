;ANDREA TOMATIS
;3AROB
;es022: Dare in input un carattere alfanumerico e stamparlo a video per 5 volte.


data segment
    ; add your data here!
    string00 db "stampa 5 volte un numero$"
    string01 db "inserisci un carattere:$"
    string02 db "il carattere inserito e':$"
    acapo db 10, 13, "$"
    num db ?
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
    lea dx, string00    ;stampa la stringa STRING00
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    lea dx, string01    ;stampa la stringa STRING01
    mov ah, 9
    int 21h
    
    lea dx, acapo   
    mov ah, 9
    int 21h
    
    mov ah, 01      ;inserimento numeri da tastiera
    int 21h
    mov num, al 
    
    ;-----CICLO: STAMPA 5 VOLTE IL NUMERO----------
    mov cx, 0
    
    
    ciclo:
    cmp cl, 5  
    je fine
    
    mov dl, num     ;stampa il numero NUM
    mov ah, 02
    int 21h 
    
    lea dx, acapo   
    mov ah, 9
    int 21h
    
    inc cl          ;incrementa il contatore
    jmp ciclo
    
    
    
    
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
