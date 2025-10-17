/* Dining Philosophers Problem Implementation */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/* Constants */
#define NUM_PHILOSOPHERS 5
#define THINKING 0
#define HUNGRY 1
#define EATING 2

/* Global Variables */
pthread_mutex_t mutex;                 // Mutex for mutual exclusion
pthread_cond_t self[NUM_PHILOSOPHERS]; // Condition variable for each philosopher
int state[NUM_PHILOSOPHERS];           // State of each philosopher

/* Function Prototypes */
void *philosopher(void *arg);
void pickup(int i);
void putdown(int i);
void test(int i);
void think(int i);
void eat(int i);

/* Initialize monitor */
void init()
{
    pthread_mutex_init(&mutex, NULL);
    for (int i = 0; i < NUM_PHILOSOPHERS; i++)
    {
        pthread_cond_init(&self[i], NULL);
        state[i] = THINKING;
    }
}

/* Test if philosopher i can eat */
void test(int i)
{
    if (state[i] == HUNGRY &&
        state[(i + NUM_PHILOSOPHERS - 1) % NUM_PHILOSOPHERS] != EATING &&
        state[(i + 1) % NUM_PHILOSOPHERS] != EATING)
    {
        state[i] = EATING;
        pthread_cond_signal(&self[i]); // Signal the philosopher to eat
    }
}

/* Philosopher picks up chopsticks */
void pickup(int i)
{
    pthread_mutex_lock(&mutex);
    state[i] = HUNGRY;
    test(i);
    while (state[i] != EATING)
    {
        pthread_cond_wait(&self[i], &mutex);
    }
    pthread_mutex_unlock(&mutex);
}

/* Philosopher puts down chopsticks */
void putdown(int i)
{
    pthread_mutex_lock(&mutex);
    state[i] = THINKING;

    // Test neighbors
    test((i + NUM_PHILOSOPHERS - 1) % NUM_PHILOSOPHERS);
    test((i + 1) % NUM_PHILOSOPHERS);

    pthread_mutex_unlock(&mutex);
}

/* Simulate thinking */
void think(int i)
{
    printf("Philosopher %d is thinking\n", i);
    sleep(rand() % 3);
}

/* Simulate eating */
void eat(int i)
{
    printf("Philosopher %d is eating\n", i);
    sleep(rand() % 3);
}

/* Philosopher thread function */
void *philosopher(void *arg)
{
    int i = *(int *)arg;
    while (1)
    {
        think(i);
        pickup(i);
        eat(i);
        putdown(i);
    }
    return NULL;
}

/* Main function */
int main()
{
    pthread_t philosophers[NUM_PHILOSOPHERS];
    int ids[NUM_PHILOSOPHERS];

    init(); // Initialize monitor

    for (int i = 0; i < NUM_PHILOSOPHERS; i++)
    {
        ids[i] = i;
        pthread_create(&philosophers[i], NULL, philosopher, &ids[i]);
    }

    for (int i = 0; i < NUM_PHILOSOPHERS; i++)
    {
        pthread_join(philosophers[i], NULL);
    }

    return 0;
}
