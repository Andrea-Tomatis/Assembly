;ANDREA TOMATIS
;3AROB
;es022: Inserire da tastiera il numero di volte (<10) in cui si vuole stampare un carattere dato in
;   input e poi stamparlo.


data segment
    ; add your data here!
    string00 db "stampa N volte un numero$"
    string01 db "inserisci un carattere:$"
    string02 db "per quante volte lo vuoi visualizzare?$"
    string03 db "il carattere inserito e':$"
    acapo db 10, 13, "$"
    num db ?  
    volte db ?
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
    
    mov ah, 01      ;inserimento numero da tastiera
    int 21h
    mov num, al
     
    
    ;controllo sull'input (volte < 10)
     
    controlloInput:
    
    lea dx, string02    ;stampa la stringa STRING02
    mov ah, 9
    int 21h
    
    lea dx, acapo   
    mov ah, 9
    int 21h
  
    
    mov ah, 01      
    int 21h
    sub al, 30h
    mov volte, al
    cmp volte, 10
    jb continua
    jmp controlloInput
    
    
    continua: 
    
    ;-----CICLO: STAMPA n VOLTE IL NUMERO----------
    mov cx, 0
    
    
    ciclo:
    cmp cl, volte  
    je fine
    
    


    lea dx, string03    ;stampa la stringa STRING03
    mov ah, 9
    int 21h
    
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
