#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <wait.h>
#include <pthread.h>

#define N 6

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cv_rider = PTHREAD_COND_INITIALIZER;
pthread_cond_t cv_operator1 = PTHREAD_COND_INITIALIZER;
pthread_cond_t cv_operator2 = PTHREAD_COND_INITIALIZER;
int rider_count = 0;
int enter_count = 0;


void open_ride()
{
    printf("operator has opened ride\n");
}

void start_ride()
{
    printf("Operator has started ride\n");
}


void enter_ride(int id)
{
    printf("rider id %d entered the ride\n", id);
}

void *operator_func(void *arg)
{
    pthread_mutex_lock(&m);
    while(rider_count < N)
    {
        pthread_cond_wait(&cv_operator1, &m);
    }
    open_ride();
    for(int i=1; i<=N; i++)
    {
        pthread_cond_signal(&cv_rider);
    }

    while(enter_count < N)
    {
        pthread_cond_wait(&cv_operator2, &m);
    }
    start_ride();
    pthread_mutex_unlock(&m);

    return NULL;
}


void *rider_func(void *arg)
{   
    int* id = (int *)arg;
    pthread_mutex_lock(&m);
    rider_count++;
    if(rider_count == N)
    {
        pthread_cond_signal(&cv_operator1);
    }

    pthread_cond_wait(&cv_rider, &m);

    enter_ride(*id);
    enter_count++;
    if(enter_count == N)
    {
        pthread_cond_signal(&cv_operator2);
    }

    pthread_mutex_unlock(&m);

    free(id);

    return NULL;
}


int main()
{
    pthread_t operator, riders[6];

    pthread_create(&operator, NULL, operator_func, NULL);
    for(int i=0; i<6; i++)
    {
        int *id = (int *)malloc(sizeof(int));
        *id = i;
        pthread_create(&riders[i], NULL, rider_func, id);
    }

    pthread_join(operator, NULL);
    for(int i=0; i<6; i++)
    {
        pthread_join(riders[i], NULL);
    }

    return 0;
}