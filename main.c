#include <stdio.h>

extern void scramble(char * input, char * output, int input_size, int output_size);

int main(int argc, char * argv[])
{
    char mesaj[] = "HELLO";
    char modif[64];
    scramble(mesaj, modif, sizeof(mesaj), sizeof(modif));
    printf("%s\n", mesaj);
    printf("%s\n", modif);
    //getchar();
    return 0;
}