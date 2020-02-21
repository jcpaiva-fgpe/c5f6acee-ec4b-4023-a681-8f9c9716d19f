#include<stdio.h>

/**
 * @author Margarida Mamede
 */


int scoreOfAlex( int seq[],  int seqLen )
{
    int steps = seqLen / 2;
    int left = 0; 
    int right = seqLen - 1; 
    int score = 0;
    int minStep = 1;

    for ( int i = 0; i < steps; i++ ) 
    {
        // Alex selection
        if ( seq[left] > seq[right] ) 
        {
            score += seq[left];
            left++;
        }
        else 
        {
            score += seq[right];
            right--;
        }

        // Bela selection
        if ( minStep ) 
        {
            if ( seq[left] < seq[right] )
                left++;
            else
                right--;
        }
        else 
        {
            if ( seq[left] > seq[right] )
                left++;
            else
                right--;
        }
        minStep = !minStep;
    }
    return score;
}


int main( ) 
{
    int seqLen, elem, sum, scA, scB;

    scanf("%d", &seqLen);
    int seq[seqLen];

    sum = 0;
    for ( int i = 0; i < seqLen; i++ )
    {
        scanf("%d", &elem);
        seq[i] = elem;
        sum += elem;
    }

    scA = scoreOfAlex(seq, seqLen);
    scB = sum - scA;

    if ( scA > scB )
        printf("Alex ganha com %d contra %d\n", scA, scB);
    else if ( scA < scB )
        printf("Bela ganha com %d contra %d\n", scB, scA);
    else
        printf("Alex e Bela empatam a %d\n", scA);
    return 0;
}

