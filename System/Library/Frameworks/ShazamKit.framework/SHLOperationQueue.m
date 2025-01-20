@interface SHLOperationQueue
+ (id)defaultQueue;
- (NSOperation)tailOperation;
- (NSOperationQueue)operationQueue;
- (id)initOperationQueue;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllOperations;
- (void)setOperationQueue:(id)a3;
- (void)setTailOperation:(id)a3;
@end

@implementation SHLOperationQueue

+ (id)defaultQueue
{
  if (qword_100088990 != -1) {
    dispatch_once(&qword_100088990, &stru_10006D5C0);
  }
  return (id)qword_100088988;
}

- (id)initOperationQueue
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SHLOperationQueue;
  v2 = -[SHLOperationQueue init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", @"com.shazam.ShazamLibrary.operation-queue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
  }

  return v2;
}

- (void)addOperation:(id)a3
{
}

- (void)addOperation:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue tailOperation](self, "tailOperation"));
  if ([v7 isFinished])
  {
    unsigned int v8 = 0;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue tailOperation](self, "tailOperation"));
    unsigned int v8 = [v9 isCancelled] ^ 1;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue tailOperation](self, "tailOperation"));
  if (v10 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue tailOperation](self, "tailOperation"));
    [v6 addDependency:v11];
  }

  -[SHLOperationQueue setTailOperation:](self, "setTailOperation:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue operationQueue](self, "operationQueue"));
  id v14 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v12 addOperations:v13 waitUntilFinished:v4];
}

- (void)cancelAllOperations
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SHLOperationQueue operationQueue](self, "operationQueue"));
  [v3 cancelAllOperations];
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperation)tailOperation
{
  return (NSOperation *)objc_loadWeakRetained((id *)&self->_tailOperation);
}

- (void)setTailOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end