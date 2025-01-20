@interface GTFuture_tools_diagnostics
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)logPerformance;
+ (id)future;
+ (id)futureWithResult:(id)a3 error:(id)a4;
- (BOOL)BOOLResult;
- (BOOL)_waitForDependencies_REQUIRESLOCK;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (GTFuture_tools_diagnostics)init;
- (id)_dependencies_NOLOCK;
- (id)completionBlock;
- (id)error;
- (id)result;
- (int)intResult;
- (int64_t)queuePriority;
- (unsigned)uint32Result;
- (void)_addDependency_REQUIRESLOCK:(id)a3;
- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5;
- (void)_start_NOLOCK;
- (void)addDependency:(id)a3;
- (void)addResultHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)notifyGroup:(id)a3;
- (void)notifyOnQueue:(id)a3 handler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestResult:(id)a3;
- (void)resolveWithFuture:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setQueuePriority:(int64_t)a3;
- (void)setResult:(id)a3;
- (void)timeoutAfter:(double)a3 label:(id)a4;
- (void)waitUntilFinished;
- (void)waitUntilResolved;
@end

@implementation GTFuture_tools_diagnostics

- (GTFuture_tools_diagnostics)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTFuture_tools_diagnostics;
  id v2 = -[GTFuture_tools_diagnostics init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    *((void *)v2 + 2) = v3;
    -[NSCondition lock](v3, "lock");
    *((void *)v2 + 6) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 4) = 0LL;
    *((void *)v2 + 5) = 0LL;
    *((_BYTE *)v2 + 24) = 0;
    [*((id *)v2 + 2) unlock];
  }

  return (GTFuture_tools_diagnostics *)v2;
}

- (void)dealloc
{
  id v3 = +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  1028LL,  0LL);
  [*(id *)&self->super._private1 lock];
  if (!LOBYTE(self->_timeout))
  {
    [*(id *)&self->super._private1 unlock];
    -[GTFuture_tools_diagnostics _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0LL, v3, 1LL);
    [*(id *)&self->super._private1 lock];
  }

  LOBYTE(self->_timeout) = 1;
  self->_condition = 0LL;
  *(void *)&self->_resolved = 0LL;
  self->_result = 0LL;
  v4 = *(void **)&self->super._private1;
  *(void *)&self->super._private1 = 0LL;
  [v4 broadcast];
  [v4 unlock];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTFuture_tools_diagnostics;
  -[GTFuture_tools_diagnostics dealloc](&v5, "dealloc");
}

- (BOOL)isCancelled
{
  char v3 = BYTE1(self->_timeout);
  [*(id *)&self->super._private1 unlock];
  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  if (LOBYTE(self->_timeout)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = BYTE1(self->_timeout) == 0;
  }
  [*(id *)&self->super._private1 unlock];
  return v3;
}

- (BOOL)isFinished
{
  if (LOBYTE(self->_timeout)) {
    char v3 = 1;
  }
  else {
    char v3 = BYTE1(self->_timeout) != 0;
  }
  [*(id *)&self->super._private1 unlock];
  return v3;
}

- (int64_t)queuePriority
{
  int64_t v3 = *(void *)&self->_started;
  [*(id *)&self->super._private1 unlock];
  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  *(void *)&self->_started = a3;
  [*(id *)&self->super._private1 unlock];
}

- (id)completionBlock
{
  id v3 = -[NSMutableArray copy](self->_inflightDependencies, "copy");
  [*(id *)&self->super._private1 unlock];
  return v3;
}

- (void)setCompletionBlock:(id)a3
{
  self->_inflightDependencies = (NSMutableArray *)[a3 copy];
  [*(id *)&self->super._private1 unlock];
}

- (void)_start_NOLOCK
{
  if (!LOBYTE(self->_notifyList) && !BYTE1(self->_timeout) && !LOBYTE(self->_timeout)) {
    LOBYTE(self->_notifyList) = 1;
  }
  [*(id *)&self->super._private1 unlock];
  -[GTFuture_tools_diagnostics didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
}

- (void)waitUntilFinished
{
  while (!LOBYTE(self->_timeout))
  {
    if (BYTE1(self->_timeout)) {
      break;
    }
    [*(id *)&self->super._private1 wait];
  }

  [*(id *)&self->super._private1 unlock];
}

- (void)addDependency:(id)a3
{
}

- (void)waitUntilResolved
{
  if (+[GTFuture_tools_diagnostics logPerformance](&OBJC_CLASS___GTFuture_tools_diagnostics, "logPerformance"))
  {
    id v3 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    uint64_t timeout_low = LOBYTE(self->_timeout);
  }

  else
  {
    uint64_t timeout_low = 0LL;
    id v3 = 0LL;
  }

  -[GTFuture_tools_diagnostics _start_NOLOCK](self, "_start_NOLOCK");
  -[GTFuture_tools_diagnostics waitUntilFinished](self, "waitUntilFinished");
  if (+[GTFuture_tools_diagnostics logPerformance](&OBJC_CLASS___GTFuture_tools_diagnostics, "logPerformance"))
  {
    -[NSDate timeIntervalSinceNow](v3, "timeIntervalSinceNow");
    double v6 = -v5;
    v7 = -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  @"GPUDebugger.DYFuture.csv");
    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f, %@, %@, %f, %d, %d\n",  v8,  -[NSThread valueForKeyPath:]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "valueForKeyPath:",  @"private.seqNum"),  -[NSArray componentsJoinedByString:]( +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"),  "componentsJoinedByString:",  @" | "),  *(void *)&v6,  timeout_low,  +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"));
    v10 = +[NSFileHandle fileHandleForWritingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForWritingAtPath:", v7);
    if (v10)
    {
      v11 = v10;
      -[NSFileHandle seekToEndOfFile](v10, "seekToEndOfFile");
      -[NSFileHandle writeData:](v11, "writeData:", -[NSString dataUsingEncoding:](v9, "dataUsingEncoding:", 4LL));
      -[NSFileHandle closeFile](v11, "closeFile");
    }

    else
    {
      uint64_t v12 = 0LL;
      objc_msgSend( objc_msgSend( @"Timestamp, Thread, Symbol, Interval, Resolved, Main Thread\n",  "stringByAppendingString:",  v9),  "writeToFile:atomically:encoding:error:",  v7,  1,  4,  &v12);
    }

    if (!-[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"GPUDebugger.DYFuture.HardAssertMainThread")) {
      -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"GPUDebugger.DYFuture.SoftAssertMainThread");
    }
  }

- (id)result
{
  return self->_condition;
}

- (void)addResultHandler:(id)a3
{
  if (LOBYTE(self->_timeout))
  {
    condition = self->_condition;
    uint64_t v6 = *(void *)&self->_resolved;
    [*(id *)&self->super._private1 unlock];
    id v7 = [a3 copy];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __29__GTFuture_addResultHandler___block_invoke;
    block[3] = &unk_20938;
    block[5] = v6;
    block[6] = v7;
    block[4] = condition;
    dispatch_async(global_queue, block);
  }

  else
  {
    id v9 = [a3 copy];
    id result = self->_result;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __29__GTFuture_addResultHandler___block_invoke_2;
    v11[3] = &unk_20960;
    v11[4] = self;
    v11[5] = v9;
    objc_msgSend( result,  "addObject:",  +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v11));
    [*(id *)&self->super._private1 unlock];
  }

- (void)requestResult:(id)a3
{
}

- (BOOL)BOOLResult
{
  id v2 = -[GTFuture_tools_diagnostics result](self, "result");
  if ((objc_opt_respondsToSelector(v2, "BOOLValue") & 1) != 0) {
    return [v2 BOOLValue];
  }
  else {
    return v2 != 0LL;
  }
}

- (unsigned)uint32Result
{
  id v2 = -[GTFuture_tools_diagnostics result](self, "result");
  if ((objc_opt_respondsToSelector(v2, "unsignedIntValue") & 1) != 0) {
    return [v2 unsignedIntValue];
  }
  else {
    return v2 != 0LL;
  }
}

- (int)intResult
{
  id v2 = -[GTFuture_tools_diagnostics result](self, "result");
  else {
    return v2 != 0LL;
  }
}

- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5
{
  if (LOBYTE(self->_timeout)) {
    goto LABEL_16;
  }
  if (a4)
  {
    id v9 = *(id *)&self->_resolved;
    if (v9 != a4)
    {

      *(void *)&self->_resolved = a4;
    }
  }

  if (!a5)
  {
LABEL_16:
    [*(id *)&self->super._private1 unlock];
  }

  else
  {
    self->_condition = (NSCondition *)a3;
    LOBYTE(self->_timeout) = 1;
    id result = self->_result;
    self->_id result = 0LL;
    inflightDependencies = self->_inflightDependencies;
    self->_inflightDependencies = 0LL;
    [*(id *)&self->super._private1 broadcast];
    [*(id *)&self->super._private1 unlock];
    if (inflightDependencies)
    {
      ((void (*)(NSMutableArray *))inflightDependencies[2].super.super.isa)(inflightDependencies);
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = [result countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(result);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) start];
        }

        id v13 = [result countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v13);
    }
  }

  -[GTFuture_tools_diagnostics didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
  -[GTFuture_tools_diagnostics didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
}

- (void)setResult:(id)a3
{
}

- (id)error
{
  return *(id *)&self->_resolved;
}

- (void)cancel
{
  BYTE1(self->_timeout) = 1;
  id v3 =  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  1027LL,  0LL);

  *(void *)&self->_resolved = v3;
  [*(id *)&self->super._private1 unlock];
  -[GTFuture_tools_diagnostics _setResult:error:notify_NOLOCK:]( self,  "_setResult:error:notify_NOLOCK:",  0LL,  *(void *)&self->_resolved,  1LL);
}

- (void)setError:(id)a3
{
}

- (void)timeoutAfter:(double)a3 label:(id)a4
{
  int timeout_low = LOBYTE(self->_timeout);
  [*(id *)&self->super._private1 unlock];
  if (!timeout_low)
  {
    dispatch_time_t v7 = dispatch_time(0LL, (unint64_t)(a3 * 1000000000.0));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __31__GTFuture_timeoutAfter_label___block_invoke;
    block[3] = &unk_20988;
    block[4] = self;
    dispatch_after(v7, global_queue, block);
  }

- (void)resolveWithFuture:(id)a3
{
  if (*((_BYTE *)a3 + 24))
  {
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v6 = *((void *)a3 + 5);
    [*((id *)a3 + 2) unlock];
    -[GTFuture_tools_diagnostics _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", v5, v6, 1LL);
  }

  else
  {
    id v7 = a3;
    uint64_t v8 = (void *)*((void *)a3 + 6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __30__GTFuture_resolveWithFuture___block_invoke;
    v9[3] = &unk_209B0;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend( v8,  "addObject:",  +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
    [*((id *)a3 + 2) unlock];
  }

- (void)notifyOnQueue:(id)a3 handler:(id)a4
{
  if (LOBYTE(self->_timeout))
  {
    [*(id *)&self->super._private1 unlock];
    dispatch_async((dispatch_queue_t)a3, a4);
  }

  else
  {
    dispatch_retain((dispatch_object_t)a3);
    id result = self->_result;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __34__GTFuture_notifyOnQueue_handler___block_invoke;
    v8[3] = &unk_20960;
    v8[4] = a3;
    v8[5] = a4;
    objc_msgSend( result,  "addObject:",  +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v8));
    [*(id *)&self->super._private1 unlock];
  }

- (void)notifyGroup:(id)a3
{
  if (LOBYTE(self->_timeout))
  {
    [*(id *)&self->super._private1 unlock];
  }

  else
  {
    dispatch_retain((dispatch_object_t)a3);
    dispatch_group_enter((dispatch_group_t)a3);
    id result = self->_result;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __24__GTFuture_notifyGroup___block_invoke;
    v6[3] = &unk_20988;
    v6[4] = a3;
    objc_msgSend( result,  "addObject:",  +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v6));
    [*(id *)&self->super._private1 unlock];
  }

- (void)_addDependency_REQUIRESLOCK:(id)a3
{
  error = (NSMutableArray *)self->_error;
  if (!error)
  {
    error = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_error = (NSError *)error;
  }

  if ((-[NSMutableArray containsObject:](error, "containsObject:", a3) & 1) == 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___GTFuture_tools_diagnostics, v6);
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke;
      v8[3] = &unk_209D8;
      v8[4] = self;
      v8[5] = a3;
      [a3 addResultHandler:v8];
    }

    else
    {
      [a3 addObserver:self forKeyPath:@"isFinished" options:1 context:0];
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSOperation, a2);
  if ((objc_opt_isKindOfClass(a4, v8) & 1) != 0)
  {
    [*(id *)&self->super._private1 lock];
    -[NSError removeObject:](self->_error, "removeObject:", a4);
    [*(id *)&self->super._private1 broadcast];
    [*(id *)&self->super._private1 unlock];
  }

- (BOOL)_waitForDependencies_REQUIRESLOCK
{
  while (-[NSError count](self->_error, "count"))
  {
    if (BYTE1(self->_timeout)) {
      break;
    }
    [*(id *)&self->super._private1 wait];
  }

  return BYTE1(self->_timeout) == 0;
}

- (id)_dependencies_NOLOCK
{
  id v3 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_error);
  [*(id *)&self->super._private1 unlock];
  return v3;
}

+ (id)future
{
  uint64_t v2 = objc_opt_class(a1, a2);
  return (id)objc_opt_new(v2);
}

+ (id)futureWithResult:(id)a3 error:(id)a4
{
  id v6 = [a1 future];
  [v6 setError:a4];
  [v6 setResult:a3];
  return v6;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"isFinished"] & 1) != 0
    || ([a3 isEqualToString:@"isExecuting"] & 1) != 0)
  {
    return 0;
  }

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GTFuture_tools_diagnostics;
  return objc_msgSendSuper2(&v6, "automaticallyNotifiesObserversForKey:", a3);
}

+ (BOOL)logPerformance
{
  if (+[GTFuture logPerformance]::onceToken != -1) {
    dispatch_once(&+[GTFuture logPerformance]::onceToken, &__block_literal_global_50);
  }
  return +[GTFuture logPerformance]::log;
}

@end