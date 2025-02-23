@interface NSURLQueue
+ (id)newNode;
- (BOOL)isEmpty;
- (BOOL)remove:(id)a3;
- (BOOL)waitOnTake;
- (NSURLQueue)init;
- (id)peek;
- (id)peekAt:(unint64_t)a3;
- (id)take;
- (int64_t)indexOf:(id)a3;
- (unint64_t)count;
- (void)clear;
- (void)dealloc;
- (void)put:(id)a3;
- (void)setWaitOnTake:(BOOL)a3;
@end

@implementation NSURLQueue

+ (id)newNode
{
  return objc_alloc_init(&OBJC_CLASS___NSURLQueueNode);
}

- (NSURLQueue)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSURLQueue;
  v2 = -[NSURLQueue init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    v2->tail = 0LL;
    v2->monitor = v3;
    v2->count = 0LL;
    v2->head = 0LL;
    v2->waitOnTake = 1;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSURLQueue clear](self, "clear");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLQueue;
  -[NSURLQueue dealloc](&v3, sel_dealloc);
}

- (void)put:(id)a3
{
  tail = self->tail;
  uint64_t v6 = +[NSURLQueue newNode](&OBJC_CLASS___NSURLQueue, "newNode");
  self->tail = v6;
  v6->next = 0LL;
  self->tail->object = a3;
  if (tail) {
    tail->next = self->tail;
  }
  if (!self->head) {
    self->head = self->tail;
  }
  ++self->count;
  [self->monitor signal];
  [self->monitor unlock];
}

- (id)take
{
  while (!self->count && self->waitOnTake)
    [self->monitor wait];
  head = self->head;
  if (head)
  {
    id v4 = head->object;
    --self->count;
    next = head->next;
    self->head = next;
    if (!next) {
      self->tail = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  [self->monitor unlock];
  return v4;
}

- (id)peek
{
  head = self->head;
  if (head) {
    id object = head->object;
  }
  else {
    id object = 0LL;
  }
  [self->monitor unlock];
  return object;
}

- (id)peekAt:(unint64_t)a3
{
  if (self->count <= a3)
  {
    count = 0LL;
  }

  else
  {
    unint64_t v5 = a3 + 1;
    uint64_t v6 = self;
    do
    {
      uint64_t v6 = (NSURLQueue *)v6->head;
      --v5;
    }

    while (v5);
    count = (void *)v6->count;
  }

  [self->monitor unlock];
  return count;
}

- (BOOL)remove:(id)a3
{
  p_head = &self->head;
  head = self->head;
  if (!head)
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_14;
  }

  if (head->object != a3)
  {
    v7 = self->head;
    while (1)
    {
      v8 = v7;
      v7 = v7->next;
      if (!v7) {
        goto LABEL_9;
      }
      if (v7->object == a3)
      {
        if (head != v7) {
          p_head = &v8->next;
        }
        head = v7;
        goto LABEL_11;
      }
    }
  }

  v8 = 0LL;
LABEL_11:
  *p_head = head->next;
  if (self->tail == head) {
    self->tail = v8;
  }

  --self->count;
  BOOL v9 = 1;
LABEL_14:
  [self->monitor unlock];
  return v9;
}

- (void)clear
{
  head = self->head;
  if (head)
  {
    do
    {
      next = head->next;

      head = next;
    }

    while (next);
  }

  self->count = 0LL;
  self->head = 0LL;
  self->tail = 0LL;
  [self->monitor unlock];
}

- (int64_t)indexOf:(id)a3
{
  head = self->head;
  if (head)
  {
    int64_t v6 = 0LL;
    while (head->object != a3)
    {
      ++v6;
      head = head->next;
      if (!head) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    int64_t v6 = -1LL;
  }

  [self->monitor unlock];
  return v6;
}

- (BOOL)isEmpty
{
  return self->count == 0;
}

- (unint64_t)count
{
  return self->count;
}

- (BOOL)waitOnTake
{
  return self->waitOnTake;
}

- (void)setWaitOnTake:(BOOL)a3
{
  self->waitOnTake = a3;
}

@end