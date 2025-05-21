.global _start
_start:

    MOV R5, #0            @ R5 = 0 = contador/posicion del sprite
    LDR R6, =inputs       @ R6 = dirección base del arreglo de entradas
    MOV R7, #0            @ R7 = índice

loop:
    CMP R7, #5            @ ¿Ya hicimos 5 iteraciones?
    BEQ fin               @ Si sí, terminar

    LDR R1, [R6, R7, LSL #2]  @ Cargar siguiente valor de entrada
    LDR R0, =0x1000           @ Dirección a revisar
    STR R1, [R0]              @ Escribir valor en 0x1000

    LDR R1, [R0]              @ Cargar valor desde 0x1000

    LDR R2, =0xE048           @ Valor para comparar (flecha arriba): 0xE048
    CMP R1, R2
    BEQ incrementar           @ Si es igual, saltar a incrementar

    LDR R2, =0xE050           @ Segundo valor a comparar
    CMP R1, R2
    BEQ decrementar           @ Si es igual, saltar a decrementar

    B continuar               @ Si no es válido, solo continuar

incrementar:
    ADD R5, R5, #1            @ R5 = R5 + 1
    B continuar

decrementar:
    SUB R5, R5, #1            @ R5 = R5 - 1

continuar:
    ADD R7, R7, #1            @ Siguiente iteración
    B loop

fin:
    B fin                     @ Bucle infinito al final

.data
inputs:
    .word 0xE048      @ arriba
    .word 0xE050      @ abajo
    .word 0xE048      @ arriba
    .word 0x1234      @ inválida
    .word 0xE048      @ arriba