#!/usr/bin/env python3

__author__ = "Margarida Mamede"


def scoreOfAlex( seq ):
    steps = len(seq) // 2
    left = 0
    right = len(seq) - 1
    score = 0
    minStep = True

    for i in range(steps): 
        # Alex selection
        if seq[left] > seq[right]: 
            score += seq[left]
            left += 1
        else: 
            score += seq[right]
            right -= 1

        # Bela selection
        if minStep: 
            if seq[left] < seq[right]:
                left += 1
            else:
                right -= 1
        else: 
            if seq[left] > seq[right]:
                left += 1
            else:
                right -= 1
        minStep = not minStep

    return score


def main( ): 
    seqLen = int( input() )

    seq = input().split(' ')
    for i in range(seqLen):
        seq[i] = eval( seq[i] )

    scA = scoreOfAlex(seq)
    scB = sum(seq) - scA

    if scA > scB:
        print('Alex ganha com', scA, 'contra', scB)
    elif scA < scB:
        print('Bela ganha com', scB, 'contra', scA)
    else:
        print('Alex e Bela empatam a', scA)


if __name__ == '__main__':
    main()
