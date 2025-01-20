@interface HTFixedSizeQueue
- (HTFixedSizeQueue)initWithSize:(unint64_t)a3;
- (NSDateFormatter)dateFormatter;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (id)getDescription:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)insert:(id)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation HTFixedSizeQueue

- (HTFixedSizeQueue)initWithSize:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HTFixedSizeQueue;
  id v4 = -[HTFixedSizeQueue init](&v13, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    v7 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 2) = a3;
    *((void *)v4 + 3) = 0LL;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    v9 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v8;

    dispatch_source_set_event_handler_f(*((dispatch_source_t *)v4 + 4), (dispatch_function_t)sub_10001A938);
    dispatch_activate(*((dispatch_object_t *)v4 + 4));
    v10 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
    v11 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v10;

    [*((id *)v4 + 5) setDateFormat:@"yyyy-MM-dd-HH:mm:ss.SSS"];
  }

  return (HTFixedSizeQueue *)v4;
}

- (void)insert:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    -[NSMutableArray addObject:](self->array, "addObject:", v5);
    id v4 = v5;
  }
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->array, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->array, "objectAtIndex:", a3);
}

- (void)removeObjectsAtIndexes:(id)a3
{
}

- (id)getDescription:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->array, "objectAtIndex:", a3));
  v9[0] = @"processName";
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 processName]);
  v10[0] = v4;
  v9[1] = @"processID";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 pid]));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);

  return v7;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end