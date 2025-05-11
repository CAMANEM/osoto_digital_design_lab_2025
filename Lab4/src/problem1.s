.global _start
_start:

    LDR R0, =array      @ R0 = dirección base del array
    MOV R1, #2          @ R1 = constante y
    MOV R2, #0          @ R2 = i = 0

for:
    CMP R2, #10         @ for (i <= 10)
    BGT end_for

    MOV R3, R2
    LSL R3, R3, #2      @ R3 = i * 4 (desplazamiento en bytes)
    ADD R4, R0, R3      @ R4 = &array[i]
    LDR R5, [R4]        @ R5 = array[i]

    CMP R5, R1          @ if (array[i] >= y)
    BLT else

if:
    MUL R6, R5, R1      @ R6 = array[i] * y
    STR R6, [R4]        @ array[i] = R6
    B continue_for

else:
    ADD R6, R5, R1      @ R6 = array[i] + y
    STR R6, [R4]        @ array[i] = R6

continue_for:
    ADD R2, R2, #1      @ i++
    B for

end_for:
    B end_for

.data
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
