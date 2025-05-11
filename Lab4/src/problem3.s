.global _start
_start:

    MOV R5, #0            @ R5 = 0 = contador/posicion del sprite

loop:
    LDR R0, =0x1000       @ Dirección  a revisar
    LDR R1, [R0]          @ Cargar valor desde 0x1000

    LDR R2, =0xE048       @ Valor para comparar (flecha arriba): 0xE048
    CMP R1, R2
    BEQ incrementar       @ Si es igual, saltar a incrementar

    LDR R2, =0xE050       @ Segundo valor a comparar
    CMP R1, R2
    BEQ decrementar       @ Si es igual, saltar a decrementar

    B loop                @ equivalente else no hacer nada y repetir

incrementar:
    ADD R5, R5, #1        @ R5 = R5 + 1
    B loop

decrementar:
    SUB R5, R5, #1        @ R5 = R5 - 1
    B loop
