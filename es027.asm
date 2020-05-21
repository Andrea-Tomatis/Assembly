;ANDREA TOMATIS
;3AROB
;es027: Leggere una lettera minuscola da tastiera e visualizzarla in maiuscolo. Ripetere N volte.


data segment
    ; add your data here! 
    string00 db "VISUALIZZA UN CARATTERE MAIUSCOLO N VOLTE$"
    string01 db "inserisci un carattere: $"
    string02 db "inserisci in numero di volte: $"
    string03 db "il carattere inserito e': $"
    acapo db 10, 13, "$"
    n db ?
    lettera db ?
    
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
    
    ;chiede N in input
    lea dx, string02    ;richiesta di inserimento
    mov ah, 9
    int 21h 
    
    mov ah, 01       ;inserimento
    int 21h 
    sub al, 30h
    mov n, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
   
    
    ;-----------CICLO DI STAMPA------------
    
    mov cx, 0
    mov cl, n
   
    ciclo:
    cmp cl, 0
    je fine
    dec cl
          
          
    ;chiede il carattere in input
    lea dx, string01    ;richiesta di inserimento
    mov ah, 9
    int 21h 
    
    mov ah, 01       ;inserimento
    int 21h 
    mov lettera, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
  
    
    ;----TRASFORMAZIONE MINUSCOLO-MAIUSCOLO---
    sub lettera, 20h      
    
    lea dx, string03
    mov ah, 9
    int 21h 
    
    mov dl, lettera   ;stampa il numero NUM
    mov ah, 02
    int 21h
    
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
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
