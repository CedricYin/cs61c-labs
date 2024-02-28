#include <string.h>
#include "ex1.h"

/* Returns the number of times LETTER appears in STR.
There are two different ways to iterate through a string.
1st way hint: strlen() may be useful
2nd way hint: all strings end in a null terminator */
int num_occurrences(char *str, char letter) {
    int i, count = 0;
    for (i = 0; i < strlen(str); i++) {
        if (str[i] == letter) count++;
    }
    return count;
}

/* Populates DNA_SEQ with the number of times each nucleotide appears.
Each sequence will end with a NULL terminator and will have up to 20 nucleotides.
All letters will be upper case. */
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    // dna_seq->A_count = num_occurrences(dna_seq->sequence, 'A');
    // dna_seq->C_count = num_occurrences(dna_seq->sequence, 'C');
    // dna_seq->G_count = num_occurrences(dna_seq->sequence, 'G');
    // dna_seq->T_count = num_occurrences(dna_seq->sequence, 'T');
    int i;
    int a = 0, c = 0, g = 0, t = 0;
    for (i = 0; dna_seq->sequence[i] != 0; i++) {
        switch (dna_seq->sequence[i]) {
            case 'A': a++; break;
            case 'C': c++; break;
            case 'G': g++; break;
            case 'T': t++; break;
            default: break;
        }
    }
    dna_seq->A_count = a;
    dna_seq->C_count = c;
    dna_seq->G_count = g;
    dna_seq->T_count = t;
    
    return;
}
