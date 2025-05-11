.global _start
_start:

    MOV R0, #5        @ R0 = factorial_a_calcular = 2
    MOV R1, #1        @ R1 = resultado (inicialmente 1)
    CMP R0, #0        @ if n == 0
    BEQ end_factorial @ Si n == 0 break

loop:
    MUL R1, R1, R0    @ R1 = R1 * R0
    SUB R0, R0, #1    @ R0 = R0 - 1
    CMP R0, #1        @ ¿R0 > 1?
    BGT loop          @ Si R0 > 1, sigue el loop

end_factorial:
    B end_factorial