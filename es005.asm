;ANDREA TOMATIS.
;3AROB
;31/01/20
;es005: Caricare in AH il maggiore tra Num1 e Num2 utilizzando JB

data segment
    ; add your data here!
    num1 db 3
    num2 db 5
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
    mov al, num1
    
    cmp al, num2
    jb Num2Max
    mov ah, num1
    jmp fine
    
    Num2Max:
    mov ah, num2
    
    fine :
            
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
