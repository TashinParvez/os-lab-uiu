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

pthread_cond_t cv_guest = PTHREAD_COND_INITIALIZER;
pthread_cond_t cv_host = PTHREAD_COND_INITIALIZER;

int guest_count = 0;


void open_gate()
{
    printf("Host has opened gate\n");
}

void enter_house(int id)
{
    printf("Guest id %d entered house\n", id);
}

// ====================================================================== HOST 
void *host_func(void *arg)
{
    pthread_mutex_lock(&m);
    while(guest_count < N)
    {
        pthread_cond_wait(&cv_host, &m);
    }
    open_gate();
    pthread_cond_broadcast(&cv_guest);
    pthread_mutex_unlock(&m);
    
    return NULL;
}


// ====================================================================== Guest
void *guest_func(void *arg)
{   
    int* id = (int *)arg;

    pthread_mutex_lock(&m);
    guest_count++;
    if(guest_count == N)
        pthread_cond_signal(&cv_host);

    pthread_cond_wait(&cv_guest, &m);
    
    enter_house(*id);
    pthread_mutex_unlock(&m);
    free(id);

    return NULL;
}

// ====================================================================== Main
int main()
{
    pthread_t host, guests[6];

    pthread_create(&host, NULL, host_func, NULL);
    for(int i=0; i<6; i++)
    {
        int *id = (int *)malloc(sizeof(int));
        *id = i;
        pthread_create(&guests[i], NULL, guest_func, id);
    }

    pthread_join(host, NULL);
    for(int i=0; i<6; i++)
    {
        pthread_join(guests[i], NULL);
    }

    return 0;
}

