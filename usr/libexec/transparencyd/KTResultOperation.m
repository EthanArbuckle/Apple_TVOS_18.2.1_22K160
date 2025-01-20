@interface KTResultOperation
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
+ (id)operationWithBlock:(id)a3;
- (BOOL)allDependentsSuccessful;
- (BOOL)allSuccessful:(id)a3;
- (BOOL)timeoutCanOccur;
- (KTCondition)completionHandlerDidRunCondition;
- (KTResultOperation)init;
- (NSDate)finishDate;
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
- (void)addSuccessDependency:(id)a3;
- (void)invalidateTimeout;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionHandlerDidRunCondition:(id)a3;
- (void)setDescriptionErrorCode:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setFinishingBlock:(id)a3;
- (void)setSuccessDependencies:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimeoutQueue:(id)a3;
- (void)start;
@end

@implementation KTResultOperation

- (KTResultOperation)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTResultOperation;
  v2 = -[KTResultOperation init](&v21, "init");
  if (v2)
  {
    id location = 0LL;
    objc_initWeak(&location, v2);
    v3 = *(void **)&v2->super.super._private1;
    *(void *)&v2->super.super._private1 = 0LL;

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    error = v2->_error;
    v2->_error = (NSError *)v4;

    LOBYTE(v2->super.super._private) = 1;
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("result-operation-timeout", v7);
    finishDate = v2->_finishDate;
    v2->_finishDate = (NSDate *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    reserved2 = v2->super._reserved2;
    v2->super._reserved2 = v10;

    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1001CBC0C;
    v18 = &unk_100276D20;
    objc_copyWeak(&v19, &location);
    v12 = objc_retainBlock(&v15);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = (KTCondition *)v12;

    -[KTResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_10028A128, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (id)operationStateString
{
  if ((-[KTResultOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation finishDate](self, "finishDate"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"finished %@",  v3));
  }

  else
  {
    if ((-[KTResultOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v5 = @"cancelled";
    }

    else if ((-[KTResultOperation isExecuting](self, "isExecuting") & 1) != 0)
    {
      v5 = @"executing";
    }

    else
    {
      unsigned int v6 = -[KTResultOperation isReady](self, "isReady");
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation operationStateString](self, "operationStateString"));
  off_1002E6340();
  v5 = v4;
  unsigned int v6 = *v4 + 1;
  unsigned int *v4 = v6;
  if (v6 < 0xB)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ error:%@>",  v7,  v3,  v10);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[KTResultOperation pendingDependenciesString:]( self,  "pendingDependenciesString:",  @" dep:"));
      v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@%@>", v7, v3, v10);
    }

    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ recursion>",  v7,  v3));
  }

  --*v5;
  return v8;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001CBF68;
  v7[3] = &unk_10027A860;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KTResultOperation;
  -[KTResultOperation setCompletionBlock:](&v6, "setCompletionBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)start
{
  if (-[KTResultOperation allDependentsSuccessful](self, "allDependentsSuccessful"))
  {
    -[KTResultOperation invalidateTimeout](self, "invalidateTimeout");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
      *(_DWORD *)buf = 138412290;
      objc_super v6 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not running due to some failed dependent: %@",  buf,  0xCu);
    }

    -[KTResultOperation cancel](self, "cancel");
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KTResultOperation;
  -[KTResultOperation start](&v4, "start");
}

- (void)invalidateTimeout
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CC254;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dependenciesDescriptionError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation dependencies](self, "dependencies"));
  id v3 = [v2 copy];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexesOfObjectsPassingTest:&stru_10028A168]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsAtIndexes:v4]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v9 = v7;
    v10 = 0LL;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___KTResultOperation, v8);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          id v15 = v13;
          uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "descriptionError", (void)v21));
          v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = v10;
          }
          id v19 = v18;

          v10 = v19;
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (id)descriptionError
{
  objc_super v4 = v3;
  ++*v3;
  if (-[KTResultOperation descriptionErrorCode](self, "descriptionErrorCode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"KTResultOperationDescriptionError",  -[KTResultOperation descriptionErrorCode](self, "descriptionErrorCode"),  0LL));
  }

  else if (*v4 < 0xBu)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation dependenciesDescriptionError](self, "dependenciesDescriptionError"));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"KTResultOperationDescriptionError",  -1LL,  @"Excess recursion"));
  }

  --*v4;
  return v5;
}

- (id)_onqueueTimeoutError
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  dispatch_assert_queue_V2(v3);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation descriptionError](self, "descriptionError"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", &stru_10028E390));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation(%@) timed out waiting to start for [%@]",  v5,  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"KTResultOperationError",  3LL,  v7,  v4));

  return v8;
}

- (id)timeout:(unint64_t)a3
{
  id location = 0LL;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001CC6D8;
  v8[3] = &unk_100276D20;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)addSuccessDependency:(id)a3
{
}

- (void)addNullableSuccessDependency:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_super v4 = self;
    objc_sync_enter(v4);
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation successDependencies](v4, "successDependencies"));
    [v5 addObject:v6];

    -[KTResultOperation addDependency:](v4, "addDependency:", v6);
    objc_sync_exit(v4);
  }
}

- (BOOL)allDependentsSuccessful
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation successDependencies](self, "successDependencies"));
  LOBYTE(v2) = -[KTResultOperation allSuccessful:](v2, "allSuccessful:", v3);

  return (char)v2;
}

- (BOOL)allSuccessful:(id)a3
{
  id v4 = a3;
  v32 = self;
  objc_sync_enter(v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  BOOL v29 = v6 == 0LL;
  id obj = v5;
  if (!v6) {
    goto LABEL_22;
  }
  char v7 = 0;
  char v8 = 0;
  char v9 = 1;
  uint64_t v33 = *(void *)v38;
  do
  {
    id v34 = v6;
    for (i = 0LL; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v38 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
      unsigned __int8 v36 = [v11 isFinished];
      unsigned __int8 v35 = [v11 isCancelled];
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
      BOOL v13 = v12 != 0LL;

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
      BOOL v15 = v14 == 0LL;

      if (!v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
        if ([v17 isEqual:@"KTResultOperationError"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
          BOOL v19 = [v18 code] == (id)1;

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
            -[KTResultOperation setError:](v32, "setError:", v20);
LABEL_14:

            goto LABEL_15;
          }
        }

        else
        {
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        [v20 setObject:v21 forKeyedSubscript:@"op"];

        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:description:underlying:",  @"KTResultOperationError",  1LL,  v20,  @"Success-dependent operation failed",  v22));
        -[KTResultOperation setError:](v32, "setError:", v23);

        goto LABEL_14;
      }

+ (id)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 addExecutionBlock:v4];

  return v5;
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
  id location = 0LL;
  objc_initWeak(&location, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001CCDA0;
  v11[3] = &unk_10027A860;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 addExecutionBlock:v11];
  [v8 setName:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
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

- (KTCondition)completionHandlerDidRunCondition
{
  return (KTCondition *)objc_getProperty(self, a2, 32LL, 1);
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

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTimeoutQueue:(id)a3
{
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFinishingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end