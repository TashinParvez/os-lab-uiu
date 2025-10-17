#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <wait.h>
#include <pthread.h>

#define N 5

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t empty = PTHREAD_COND_INITIALIZER;
pthread_cond_t full = PTHREAD_COND_INITIALIZER;
int chocolate_count = 0;

void getChocolateFromBox(int id)
{
    printf("child id %d is taking chocolate\n", id);
    chocolate_count--;
}

void refillChocolate()
{
    printf("Mother is refilling chocolate Box\n");
    chocolate_count += N;
}

void *producer(void *arg)
{
    for(int i=0; i<6; i++)
    {
        pthread_mutex_lock(&m);
        if(chocolate_count > 0)
        {
            pthread_cond_wait(&empty, &m);
        }
        refillChocolate();
        pthread_cond_signal(&full);
        pthread_mutex_unlock(&m);
    }
    return NULL;
}

// get the name of the current thread
void *consumer(void *arg)
{   
    int id = *(int *)arg;
    for(int i=0; i<5; i++)
    {
        pthread_mutex_lock(&m);
        while(chocolate_count == 0)
        {
            pthread_cond_signal(&empty);
            pthread_cond_wait(&full, &m);
        }
        getChocolateFromBox(id);
        pthread_mutex_unlock(&m);
    }
    return NULL;
}


int main()
{
    pthread_t mother, child[6];

    pthread_create(&mother, NULL, producer, NULL);
    for(int i=0; i<6; i++)
    {
        int *id = &i;
        pthread_create(&child[i], NULL, consumer, id);
    }

    pthread_join(mother, NULL);
    for(int i=0; i<6; i++)
    {
        pthread_join(child[i], NULL);
    }

    return 0;
}