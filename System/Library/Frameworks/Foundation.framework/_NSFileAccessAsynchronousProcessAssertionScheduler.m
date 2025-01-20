@interface _NSFileAccessAsynchronousProcessAssertionScheduler
+ (id)sharedInstance;
- (_NSFileAccessAsynchronousProcessAssertionScheduler)init;
- (id)addAssertionWithName:(id)a3 forPID:(int)a4;
- (void)removeAssertionWithToken:(id)a3;
@end

@implementation _NSFileAccessAsynchronousProcessAssertionScheduler

+ (id)sharedInstance
{
  if (qword_18C496E18 != -1) {
    dispatch_once(&qword_18C496E18, &__block_literal_global_61_0);
  }
  return (id)qword_18C496E20;
}

- (_NSFileAccessAsynchronousProcessAssertionScheduler)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSFileAccessAsynchronousProcessAssertionScheduler;
  v2 = -[_NSFileAccessAsynchronousProcessAssertionScheduler init](&v4, sel_init);
  if (v2)
  {
    v2->_assertionsPerPID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (id)addAssertionWithName:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = (id)-[NSMutableDictionary objectForKey:]( self->_assertionsPerPID,  "objectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NSMutableDictionary setObject:forKey:]( self->_assertionsPerPID,  "setObject:forKey:",  v8,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  }

  unint64_t v9 = [v8 count];
  v10 = -[_NSFileAccessAsynchronousProcessAssertion initWithPID:name:]( objc_alloc(&OBJC_CLASS____NSFileAccessAsynchronousProcessAssertion),  "initWithPID:name:",  v4,  a3);
  [v8 addObject:v10];
  os_unfair_lock_unlock(p_lock);
  if (v9 <= 1) {
    -[_NSFileAccessAsynchronousProcessAssertion beginAssertion](v10, "beginAssertion");
  }
  return v10;
}

- (void)removeAssertionWithToken:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:]( self->_assertionsPerPID,  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 PID]));
  uint64_t v7 = [v6 indexOfObjectIdenticalTo:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    unint64_t v8 = v7;
    unint64_t v9 = [v6 count];
    if (v8 <= 1 && v9 >= 3) {
      v11 = (void *)[v6 objectAtIndex:2];
    }
    else {
      v11 = 0LL;
    }
    [a3 invalidate];
    [v6 removeObjectAtIndex:v8];
    os_unfair_lock_unlock(p_lock);
    if (v11) {
      [v11 beginAssertion];
    }
  }

@end