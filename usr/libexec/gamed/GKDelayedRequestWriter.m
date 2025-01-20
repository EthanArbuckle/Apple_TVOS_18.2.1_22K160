@interface GKDelayedRequestWriter
+ (id)writerWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6;
- (BOOL)shouldWaitForNetworkError;
- (GKDataWriter)networkWriter;
- (GKDatabaseReader)cacheReader;
- (GKDatabaseWriter)cacheWriter;
- (GKDelayedRequestWriter)initWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6;
- (NSSet)resourcesPending;
- (OS_dispatch_queue)operationQueue;
- (double)intervalInSeconds;
- (void)batchAndPerformInGroup:(id)a3 block:(id)a4;
- (void)deleteSubmittedRequestsWithIDs:(id)a3 onConnection:(id)a4;
- (void)readAndSubmitDelayedRequestsOfResources:(id)a3 handler:(id)a4;
- (void)setCacheReader:(id)a3;
- (void)setCacheWriter:(id)a3;
- (void)setIntervalInSeconds:(double)a3;
- (void)setNetworkWriter:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setResourcesPending:(id)a3;
- (void)setShouldWaitForNetworkError:(BOOL)a3;
- (void)submitDelayedRequestsForPlayer:(id)a3 handler:(id)a4;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeResourcesToCacheOnly:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedRequestWriter

+ (id)writerWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 databaseConnection]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 databaseConnection]);
  unsigned __int8 v15 = [v13 isEqual:v14];

  if ((v15 & 1) != 0)
  {
    id v17 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v16)),  "initWithCacheWriter:cacheReader:networkWriter:batchSubmissionInterval:",  v10,  v11,  v12,  a6);

    return v17;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 databaseConnection]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 databaseConnection]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cacheReader.databaseConnection (%@) is not shared by the cacheWriter.databaseConnection (%@) Exiting to reset",  v19,  v20));

    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v21,  0LL));
    objc_exception_throw(v22);
    __break(1u);
  }

  return result;
}

- (GKDelayedRequestWriter)initWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GKDelayedRequestWriter;
  v13 = -[GKDelayedRequestWriter init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    -[GKDelayedRequestWriter setCacheWriter:](v13, "setCacheWriter:", v10);
    -[GKDelayedRequestWriter setCacheReader:](v14, "setCacheReader:", v11);
    -[GKDelayedRequestWriter setNetworkWriter:](v14, "setNetworkWriter:", v12);
    unsigned __int8 v15 = objc_alloc_init(&OBJC_CLASS___NSSet);
    resourcesPending = v14->_resourcesPending;
    v14->_resourcesPending = v15;

    v14->_shouldWaitForNetworkError = 1;
    v14->_intervalInSeconds = a6;
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.gamed.delayedRequests.batchQueue", 0LL);
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = (OS_dispatch_queue *)v17;
  }

  return v14;
}

- (void)batchAndPerformInGroup:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = v7;
  if (self->_intervalInSeconds <= 0.0)
  {
    v7[2](v7);
  }

  else
  {
    ++qword_1002BB560;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000B3310;
    v9[3] = &unk_100270850;
    v9[4] = self;
    uint64_t v11 = qword_1002BB560;
    id v10 = v7;
    [v6 perform:v9];
  }
}

- (void)submitDelayedRequestsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet _gkSetOfResourcesWithIDs:](&OBJC_CLASS___NSSet, "_gkSetOfResourcesWithIDs:", v8));
  -[GKDelayedRequestWriter readAndSubmitDelayedRequestsOfResources:handler:]( self,  "readAndSubmitDelayedRequestsOfResources:handler:",  v9,  v7);
}

- (void)deleteSubmittedRequestsWithIDs:(id)a3 onConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B3638;
  v9[3] = &unk_100270628;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM requests WHERE request_id = %s;",
                ":request_id"));
  id v7 = v5;
  id v11 = v7;
  id v8 = v10;
  [v6 performAsyncTransaction:v9 handler:&stru_100270870];
}

- (void)readAndSubmitDelayedRequestsOfResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDelayedRequestWriter.mm",  129LL,  "-[GKDelayedRequestWriter readAndSubmitDelayedRequestsOfResources:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  v24[3] = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000B3AA0;
  v20[3] = &unk_100270910;
  v20[4] = self;
  id v10 = v6;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  v23 = v24;
  [v11 perform:v20];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B41D4;
  v16[3] = &unk_100270938;
  id v14 = v7;
  id v18 = v14;
  id v15 = v11;
  id v17 = v15;
  v19 = v24;
  [v15 notifyOnQueue:v13 block:v16];

  _Block_object_dispose(v24, 8);
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[GKDelayedRequestWriter shouldWaitForNetworkError](self, "shouldWaitForNetworkError");
  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B4308;
  v12[3] = &unk_100270AA0;
  v12[4] = self;
  id v13 = v6;
  unsigned __int8 v15 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(operationQueue, v12);
}

- (void)writeResourcesToCacheOnly:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4D68;
  block[3] = &unk_1002709B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(operationQueue, block);
}

- (BOOL)shouldWaitForNetworkError
{
  return self->_shouldWaitForNetworkError;
}

- (void)setShouldWaitForNetworkError:(BOOL)a3
{
  self->_shouldWaitForNetworkError = a3;
}

- (double)intervalInSeconds
{
  return self->_intervalInSeconds;
}

- (void)setIntervalInSeconds:(double)a3
{
  self->_intervalInSeconds = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSSet)resourcesPending
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setResourcesPending:(id)a3
{
}

- (GKDatabaseWriter)cacheWriter
{
  return self->_cacheWriter;
}

- (void)setCacheWriter:(id)a3
{
}

- (GKDatabaseReader)cacheReader
{
  return self->_cacheReader;
}

- (void)setCacheReader:(id)a3
{
}

- (GKDataWriter)networkWriter
{
  return self->_networkWriter;
}

- (void)setNetworkWriter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end