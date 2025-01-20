@interface CKKSResultOperation
+ (CKKSResultOperation)operationWithBlock:(id)a3;
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
- (BOOL)allDependentsSuccessful;
- (BOOL)allSuccessful:(id)a3;
- (BOOL)timeoutCanOccur;
- (CKKSCondition)completionHandlerDidRunCondition;
- (CKKSResultOperation)init;
- (NSDate)finishDate;
- (NSError)descriptionUnderlyingError;
- (NSError)error;
- (NSMutableArray)successDependencies;
- (OS_dispatch_queue)timeoutQueue;
- (id)_onqueueTimeoutError;
- (id)dependenciesDescriptionError;
- (id)description;
- (id)descriptionError;
- (id)finishingBlock;
- (id)operationStateString;
- (id)timeout:(unint64_t)a3;
- (int64_t)descriptionErrorCode;
- (void)addNullableSuccessDependency:(id)a3;
- (void)invalidateTimeout;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionHandlerDidRunCondition:(id)a3;
- (void)setDescriptionErrorCode:(int64_t)a3;
- (void)setDescriptionUnderlyingError:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setFinishingBlock:(id)a3;
- (void)setSuccessDependencies:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimeoutQueue:(id)a3;
- (void)start;
@end

@implementation CKKSResultOperation

- (CKKSResultOperation)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CKKSResultOperation;
  v2 = -[CKKSResultOperation init](&v21, "init");
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v3 = *(void **)&v2->super.super._private1;
    *(void *)&v2->super.super._private1 = 0LL;

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    finishDate = v2->_finishDate;
    v2->_finishDate = (NSDate *)v4;

    LOBYTE(v2->super.super._private) = 1;
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("result-operation-timeout", v7);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = (CKKSCondition *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    reserved2 = v2->super._reserved2;
    v2->super._reserved2 = v10;

    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1000FAB90;
    v18 = &unk_100291A38;
    objc_copyWeak(&v19, &location);
    v12 = objc_retainBlock(&v15);
    descriptionErrorCode = (void *)v2->_descriptionErrorCode;
    v2->_descriptionErrorCode = (int64_t)v12;

    -[CKKSResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_1002865C8, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (id)operationStateString
{
  if ((-[CKKSResultOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation finishDate](self, "finishDate"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"finished %@",  v3));
  }

  else
  {
    if ((-[CKKSResultOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v5 = @"cancelled";
    }

    else if ((-[CKKSResultOperation isExecuting](self, "isExecuting") & 1) != 0)
    {
      v5 = @"executing";
    }

    else
    {
      unsigned int v6 = -[CKKSResultOperation isReady](self, "isReady");
      v5 = @"pending";
      if (v6) {
        v5 = @"ready";
      }
    }

    v4 = v5;
  }

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation operationStateString](self, "operationStateString"));
  off_1002DE5E8();
  v5 = v4;
  unsigned int v6 = *v4 + 1;
  unsigned int *v4 = v6;
  if (v6 < 0xB)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ error:%@>",  v7,  v3,  v10);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSResultOperation pendingDependenciesString:]( self,  "pendingDependenciesString:",  @" dep:"));
      v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@%@>", v7, v3, v10);
    }

    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ recursion>",  v7,  v3));
  }

  --*v5;
  return v8;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FA9E8;
  v7[3] = &unk_100290F30;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CKKSResultOperation;
  -[CKKSResultOperation setCompletionBlock:](&v6, "setCompletionBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)start
{
  if (-[CKKSResultOperation allDependentsSuccessful](self, "allDependentsSuccessful")) {
    -[CKKSResultOperation invalidateTimeout](self, "invalidateTimeout");
  }
  else {
    -[CKKSResultOperation cancel](self, "cancel");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSResultOperation;
  -[CKKSResultOperation start](&v3, "start");
}

- (void)invalidateTimeout
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FA9AC;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dependenciesDescriptionError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation dependencies](self, "dependencies"));
  id v3 = [v2 copy];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexesOfObjectsPassingTest:&stru_1002865E8]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsAtIndexes:v4]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKKSResultOperation);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = v12;
          uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "descriptionError", (void)v20));
          uint64_t v16 = (void *)v15;
          if (v15) {
            v17 = (void *)v15;
          }
          else {
            v17 = v9;
          }
          id v18 = v17;

          id v9 = v18;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)descriptionError
{
  id v4 = v3;
  ++*v3;
  if (-[CKKSResultOperation descriptionErrorCode](self, "descriptionErrorCode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionUnderlyingError](self, "descriptionUnderlyingError"));

    if (v5)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionUnderlyingError](self, "descriptionUnderlyingError"));
      [v5 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSResultOperationDescriptionError",  -[CKKSResultOperation descriptionErrorCode](self, "descriptionErrorCode"),  v5));
  }

  else
  {
    if (*v4 < 0xBu) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation dependenciesDescriptionError](self, "dependenciesDescriptionError"));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSResultOperationDescriptionError",  -1LL,  @"Excess recursion"));
    }
    id v7 = (void *)v8;
  }

  --*v4;
  return v7;
}

- (id)_onqueueTimeoutError
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionError](self, "descriptionError"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", &stru_100294B48));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation(%@) timed out waiting to start for [%@]",  v5,  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSResultOperationError",  3LL,  v7,  v4));

  return v8;
}

- (id)timeout:(unint64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000FA924;
  v8[3] = &unk_100291A38;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)addNullableSuccessDependency:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = self;
    objc_sync_enter(v4);
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation successDependencies](v4, "successDependencies"));
    [v5 addObject:v6];

    -[CKKSResultOperation addDependency:](v4, "addDependency:", v6);
    objc_sync_exit(v4);
  }
}

- (BOOL)allDependentsSuccessful
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation successDependencies](self, "successDependencies"));
  LOBYTE(v2) = -[CKKSResultOperation allSuccessful:](v2, "allSuccessful:", v3);

  return (char)v2;
}

- (BOOL)allSuccessful:(id)a3
{
  id v4 = a3;
  v30 = self;
  objc_sync_enter(v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  BOOL v27 = v6 == 0LL;
  id obj = v5;
  if (!v6) {
    goto LABEL_22;
  }
  char v7 = 0;
  char v8 = 0;
  uint64_t v31 = *(void *)v36;
  char v9 = 1;
  do
  {
    id v32 = v6;
    for (i = 0LL; i != v32; i = (char *)i + 1)
    {
      if (*(void *)v36 != v31) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
      unsigned __int8 v34 = [v11 isFinished];
      unsigned __int8 v33 = [v11 isCancelled];
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
      BOOL v13 = v12 != 0LL;

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
      BOOL v15 = v14 == 0LL;

      if (!v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
        if ([v17 isEqual:@"CKKSResultOperationError"])
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
          BOOL v19 = [v18 code] == (id)1;

          if (v19)
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
            -[CKKSResultOperation setError:](v30, "setError:", v20);
LABEL_14:

            goto LABEL_15;
          }
        }

        else
        {
        }

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSResultOperationError",  1LL,  @"Success-dependent operation failed",  v20));
        -[CKKSResultOperation setError:](v30, "setError:", v21);

        goto LABEL_14;
      }

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFinishDate:(id)a3
{
}

- (CKKSCondition)completionHandlerDidRunCondition
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCompletionHandlerDidRunCondition:(id)a3
{
}

- (int64_t)descriptionErrorCode
{
  return *(void *)&self->_timeoutCanOccur;
}

- (void)setDescriptionErrorCode:(int64_t)a3
{
  *(void *)&self->_timeoutCanOccur = a3;
}

- (NSError)descriptionUnderlyingError
{
  return (NSError *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDescriptionUnderlyingError:(id)a3
{
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSuccessDependencies:(id)a3
{
}

- (BOOL)timeoutCanOccur
{
  return (uint64_t)self->super.super._private & 1;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  LOBYTE(self->super.super._private) = a3;
}

- (OS_dispatch_queue)timeoutQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTimeoutQueue:(id)a3
{
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFinishingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CKKSResultOperation)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 addExecutionBlock:v4];

  return (CKKSResultOperation *)v5;
}

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 operationWithBlock:a4]);
  [v7 setName:v6];

  return v7;
}

+ (id)named:(id)a3 withBlockTakingSelf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FAD88;
  v11[3] = &unk_100290F30;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 addExecutionBlock:v11];
  [v8 setName:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

@end