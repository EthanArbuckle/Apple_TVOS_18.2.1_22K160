@interface DATestQueue
+ (id)testQueueWithDelegate:(id)a3;
- (BOOL)suspended;
- (DATestQueue)initWithDelegate:(id)a3;
- (DATestQueueDelegate)delegate;
- (NSMutableArray)testQueue;
- (id)_dequeueTest;
- (void)_enqueueTestWithQueueEntry:(id)a3;
- (void)_tickleTestQueue;
- (void)enqueueTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTestQueue:(id)a3;
@end

@implementation DATestQueue

+ (id)testQueueWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDelegate:v4];

  return v5;
}

- (void)enqueueTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[DATestQueueEntry queueEntryWithAttributes:parameters:completion:]( &OBJC_CLASS___DATestQueueEntry,  "queueEntryWithAttributes:parameters:completion:",  a3,  a4,  a5));
  -[DATestQueue _enqueueTestWithQueueEntry:](self, "_enqueueTestWithQueueEntry:", v6);
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (!a3) {
      -[DATestQueue _tickleTestQueue](self, "_tickleTestQueue");
    }
  }

- (DATestQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DATestQueue;
  id v5 = -[DATestQueue init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    testQueue = v5->_testQueue;
    v5->_testQueue = (NSMutableArray *)v6;

    v5->_suspended = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)_tickleTestQueue
{
  if (!-[DATestQueue suspended](self, "suspended"))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DATestQueue _dequeueTest](self, "_dequeueTest"));
    if (v7)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue delegate](self, "delegate"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 attributes]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 parameters]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 completion]);
      [v3 executeTestWithTestAttributes:v4 parameters:v5 completion:v6];
    }
  }

- (void)_enqueueTestWithQueueEntry:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  [v5 addObject:v6];

  objc_sync_exit(v4);
  -[DATestQueue _tickleTestQueue](self, "_tickleTestQueue");
}

- (id)_dequeueTest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
    [v8 removeObjectAtIndex:0];
  }

  else
  {
    id v7 = 0LL;
  }

  objc_sync_exit(v3);

  return v7;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NSMutableArray)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (DATestQueueDelegate)delegate
{
  return (DATestQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end