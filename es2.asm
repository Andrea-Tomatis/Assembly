;ANDREA TOMATIS
;3AROB
;24/01/20
;ES2: dichiarare le variabili num1, num2, num3, num4, r1 e r2.
;     Le prime due vengono inizializzate in fase di dichiarazione;
;     num3 e num4 vengono inizializzate nel codice.
;     Le variabili r1 e r2 possono contenere un byte e non sono inizializzate.
;     calcolare la differenza tra num1 e num2 e salvare il risultato nella variabile r1.
;     calcolare il prodotto tra num3 e num4 e salvare il risultato in r2.
 

data segment
    ; add your data here!
    num1 db 3
    num2 db 1
    num3 db ?
    num4 db ?
    r1 db ?
    r2 db ?
    pkey db "premi un tasto per continuare...$"
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
    
    ;INIZIALIZZAZIONE
    mov num3, 4
    mov num4, 2
    
    ;SOTTRAZIONE
    mov al, num1
    sub al, num2 ;esegue la sottrazione tra il contenuto del registro al e l'operando num2. Il risultato viene salvato il al.
    mov r1, al
    
    ;MOLTIPLICAZIONE
    mov al, num3
    mov ah, 0
    mul num4    ;esegue la moltiplicazione tra il contenuto del registro al e l'operando num2. Il risultato viene salvato il al.
    mov r2, al 
    
    
            
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
