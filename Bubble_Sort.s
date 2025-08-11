.data
.align 3    // Align to 8 bytes (2^3)

my_array:
    .quad 255
    .quad 681
    .quad 626
    .quad 338
    .quad 309
    .quad 754
    .quad 129
    .quad 383

array_len:
    .quad 8

.text
.global _start

_start:
    ADR     X19, my_array     // Load address of my_array into X19 (array base)
    LDR     X23, [X19, #0]    // Load my_array[0] into X23
    ADR     X18, array_len    //Load addr of array_len into X18
    LDR     X22, [X18]        //Load array length in X22
    MOV     X20, #0           //X20--> i=0
    SUB     X17, X22, #1      //X17 --> array_len - 1

loop_i:     // Outer loop label
    CMP     X20, X17          //X17 - X20 --> array_len - 1 - i (break condition if diff==0)
    BGE     done              //Exit the outer loop
    MOV     X21, #0           //X21--> j=0
    SUB     X26, X22, X20       // X26 = array_len - i
    SUB     X26, X26, #1        // X26 = array_len - i - 1

loop_j:     //Inner Loop
    CMP     X21, X26          //X26 - X21 --> array_len - i - 1 - j (break condition if diff==0) 
    BGE     next_i            //Exit inner loop and go to i++

    // Load arr[j] into X23
    LSL     X25, X21, #3        // X25 = j * 8
    LDR     X23, [X19, X25]     // arr[j]

    ADD     X25, X25, #8        // X25 = offset for j+1
    LDR     X24, [X19, X25]     // arr[j+1]

    CMP     X24, X23          //Compare if array[j+1] < array[j]--> swap them
    BGE     skip_swap           // arr[j] <= arr[j+1]

    //SWAP
    STR     X23, [X19, X25]         // arr[j+1] = arr[j]
    SUB     X25, X25, #8            // X25 = offset for arr[j]
    STR     X24, [X19, X25]         // arr[j] = arr[j+1]

skip_swap:
    ADD     X21, X21, #1       // j++
    B       loop_j

next_i:
    ADD     X20, X20, #1       // i++
    B       loop_i
done:
    B       done
