#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

struct sNode
{
   char *data;
   struct sNode *next;
};

/* structure of queue having two stacks */
struct queue
{
   struct sNode *stack1;
   struct sNode *stack2;
};

/* Function to push an item to stack*/
void push(struct sNode** top_ref, char* new_data);
  
/* Function to pop an item from stack*/
char *pop(struct sNode** top_ref);

  
/* Function to enqueue an item to queue */
void enQueue(struct queue *q, char *x)
{
   push(&q->stack1, x);
}


bool isEmpty(struct queue *q)
{
  bool empty;
  if (q->stack1 == q->stack2)
    empty = true;
  else
    empty = false;
  return empty;
}

  
/* Function to dequeue an item from queue */
char* deQueue(struct queue *q)
{
   char* x; 
  
   /* If both stacks are empty then error */
   if(q->stack1 == NULL && q->stack2 == NULL)
   {
      printf("Q is empty");
      getchar();
      exit(0);
   }
 
   /* Move elements from satck1 to stack 2 only if 
       stack2 is empty */
   if(q->stack2 == NULL)
   {
     while(q->stack1 != NULL)
     {
        x = pop(&q->stack1);
        push(&q->stack2, x);
     }
   } 
 
   x = pop(&q->stack2);
   return x;
}

/* Function to push an item to stack*/
void push(struct sNode** top_ref, char* new_data)
{
  /* allocate node */
  struct sNode* new_node =
            (struct sNode*) malloc(sizeof(struct sNode));
  
  if(new_node == NULL)
  {
     printf("Stack overflow \n");
     getchar();
     exit(0);
  }            
  
  /* put in the data  */
  new_node->data  = new_data;
  
  /* link the old list off the new node */
  new_node->next = (*top_ref);   
  
  /* move the head to point to the new node */
  (*top_ref)    = new_node;
}
  
/* Function to pop an item from stack*/
char* pop(struct sNode** top_ref)
{
  char* res;
  struct sNode *top;
  
  /*If stack is empty then error */
  if(*top_ref == NULL)
  {
     printf("Stack overflow \n");
     getchar();
     exit(0);
  }
  else
  {
     top = *top_ref;
     res = top->data;
     *top_ref = top->next;
     free(top);
     return res;
  }
}


int main()
{
   /* Create a queue with items 1 2 3*/
   struct queue *q = (struct queue*)malloc(sizeof(struct queue));
   q->stack1 = NULL;
   q->stack2 = NULL;

   printf("Is empty : %d\n", isEmpty(q));

   enQueue(q, "123");
   enQueue(q, "123");
   enQueue(q, "zasdf");    
  
   printf("Is empty : %d\n", isEmpty(q));
   /* Dequeue items */
   printf("%s  ", deQueue(q));
   printf("%s  ", deQueue(q));
   printf("%s  ", deQueue(q));  
  
   printf("Is empty : %d\n", isEmpty(q));
   getchar();
}
