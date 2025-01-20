@interface SKMultiSerialQueue
- (NSMutableArray)queues;
- (SKMultiSerialQueue)initWithName:(id)a3;
- (unsigned)counter;
- (void)dispatchWithBlock:(id)a3;
- (void)dispatchWithGroup:(id)a3 block:(id)a4;
- (void)setCounter:(unsigned int)a3;
- (void)setQueues:(id)a3;
@end

@implementation SKMultiSerialQueue

- (SKMultiSerialQueue)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKMultiSerialQueue;
  v5 = -[SKMultiSerialQueue init](&v11, "init");
  if (v5)
  {
    if (qword_100051B60 != -1) {
      dispatch_once(&qword_100051B60, &stru_1000450B0);
    }
    int v6 = dword_100051B68;
    v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  dword_100051B68);
    queues = v5->_queues;
    v5->_queues = v7;

    for (; v6; --v6)
    {
      dispatch_queue_t v9 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
      -[NSMutableArray addObject:](v5->_queues, "addObject:", v9);
    }

    v5->_counter = 0;
  }

  return v5;
}

- (void)dispatchWithBlock:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v4, "queues"));
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[SKMultiSerialQueue counter](v4, "counter")));
  dispatch_async(v6, block);

  LODWORD(v6) = -[SKMultiSerialQueue counter](v4, "counter");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v4, "queues"));
  -[SKMultiSerialQueue setCounter:]( v4,  "setCounter:",  ((_DWORD)v6 + 1) % (unint64_t)[v7 count]);

  objc_sync_exit(v4);
}

- (void)dispatchWithGroup:(id)a3 block:(id)a4
{
  group = (dispatch_group_s *)a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v7, "queues"));
  dispatch_queue_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", -[SKMultiSerialQueue counter](v7, "counter")));
  dispatch_group_async(group, v9, v6);

  LODWORD(v9) = -[SKMultiSerialQueue counter](v7, "counter");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v7, "queues"));
  -[SKMultiSerialQueue setCounter:]( v7,  "setCounter:",  ((_DWORD)v9 + 1) % (unint64_t)[v10 count]);

  objc_sync_exit(v7);
}

- (NSMutableArray)queues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueues:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
}

@end