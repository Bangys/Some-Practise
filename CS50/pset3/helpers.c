/**
 * helpers.c
 *
 * Helper functions for Problem Set 3.
 */
 
#include <cs50.h>

#include "helpers.h"

/**
 * Returns true if value is in array of n values, else false.
 */
bool search(int value, int values[], int n)
{
    // TODO: implement a searching algorithm
    if (n<1)
        return false;
    for (int i=0;i<n;i++)
        if (values[i]==value)
            return true;
    return false;
}

/**
 * Sorts array of n values.
 */
void sort(int values[], int n)
{    
    for (int i=0;i<n-1;i++)
        for (int j=i+1, temp;j<n;j++)
        if (values[i]>values[j])
            {
                temp = values[j];
                values[j] = values[i];
                values[i] = temp;
            }
    // TODO: implement an O(n^2) sorting algorithm
    
    return;
}
