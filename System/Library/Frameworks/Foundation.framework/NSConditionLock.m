@interface NSConditionLock
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (BOOL)tryLockWhenCondition:(NSInteger)condition;
- (NSConditionLock)init;
- (NSConditionLock)initWithCondition:(NSInteger)condition;
- (NSInteger)condition;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)lockWhenCondition:(NSInteger)condition;
- (void)setName:(NSString *)name;
- (void)unlock;
- (void)unlockWithCondition:(NSInteger)condition;
@end

@implementation NSConditionLock

- (NSConditionLock)init
{
  return -[NSConditionLock initWithCondition:](self, "initWithCondition:", 0LL);
}

- (NSConditionLock)initWithCondition:(NSInteger)condition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSConditionLock;
  v4 = -[NSConditionLock init](&v6, sel_init);
  v4->cond = -[NSCondition init]( +[NSCondition allocWithZone:]( &OBJC_CLASS___NSCondition,  "allocWithZone:",  -[NSConditionLock zone](v4, "zone")),  "init");
  v4->t = 0LL;
  v4->v = condition;
  v4->n = 0LL;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConditionLock;
  -[NSConditionLock dealloc](&v3, sel_dealloc);
}

- (NSInteger)condition
{
  return self->v;
}

- (void)lock
{
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  while (1)
  {
    int v5 = pthread_equal(0LL, self->t);
    if (v5) {
      break;
    }
    if (!-[NSCondition waitUntilDate:](self->cond, "waitUntilDate:", limit)) {
      goto LABEL_6;
    }
  }

  self->t = pthread_self();
LABEL_6:
  -[NSCondition unlock](self->cond, "unlock");
  return v5 != 0;
}

- (void)lockWhenCondition:(NSInteger)condition
{
}

- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit
{
  while (!pthread_equal(0LL, self->t) || self->v != condition)
  {
    if (!-[NSCondition waitUntilDate:](self->cond, "waitUntilDate:", limit))
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
  }

  self->t = pthread_self();
  BOOL v7 = 1;
LABEL_7:
  -[NSCondition unlock](self->cond, "unlock");
  return v7;
}

- (BOOL)tryLock
{
  return -[NSConditionLock lockBeforeDate:](self, "lockBeforeDate:", [MEMORY[0x189603F50] distantPast]);
}

- (BOOL)tryLockWhenCondition:(NSInteger)condition
{
  return -[NSConditionLock lockWhenCondition:beforeDate:]( self,  "lockWhenCondition:beforeDate:",  condition,  [MEMORY[0x189603F50] distantPast]);
}

- (void)unlock
{
  self->t = 0LL;
  -[NSCondition broadcast](self->cond, "broadcast");
  -[NSCondition unlock](self->cond, "unlock");
}

- (void)unlockWithCondition:(NSInteger)condition
{
  self->t = 0LL;
  self->v = condition;
  -[NSCondition broadcast](self->cond, "broadcast");
  -[NSCondition unlock](self->cond, "unlock");
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSConditionLock;
  id v3 = -[NSConditionLock description](&v8, sel_description);
  uint64_t v4 = "'";
  n = self->n;
  if (!n) {
    uint64_t v4 = "";
  }
  objc_super v6 = (NSString *)@"nil";
  if (n) {
    objc_super v6 = self->n;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{condition = %ld, name = %s%@%s}",  v3,  self->v,  v4,  v6,  v4);
}

- (void)setName:(NSString *)name
{
  n = self->n;
  if (n != name)
  {

    self->n = (NSString *)-[NSString copy](name, "copy");
  }

- (NSString)name
{
  return self->n;
}

@end