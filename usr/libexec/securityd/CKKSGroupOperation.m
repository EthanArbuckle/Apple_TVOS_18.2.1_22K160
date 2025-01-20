@interface CKKSGroupOperation
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
+ (id)operationWithBlock:(id)a3;
- (BOOL)fillInError;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isPending;
- (CKKSGroupOperation)init;
- (NSBlockOperation)finishOperation;
- (NSBlockOperation)startOperation;
- (NSMutableArray)internalSuccesses;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (id)description;
- (void)addDependency:(id)a3;
- (void)cancel;
- (void)completeOperation;
- (void)dealloc;
- (void)dependOnBeforeGroupFinished:(id)a3;
- (void)runBeforeGroupFinished:(id)a3;
- (void)setFillInError:(BOOL)a3;
- (void)setFinishOperation:(id)a3;
- (void)setInternalSuccesses:(id)a3;
- (void)setName:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartOperation:(id)a3;
- (void)start;
@end

@implementation CKKSGroupOperation

- (CKKSGroupOperation)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
  v2 = -[CKKSResultOperation init](&v29, "init");
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    BYTE2(v2->super._descriptionUnderlyingError) = 1;
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    successDependencies = v2->super._successDependencies;
    v2->super._successDependencies = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("CKKSGroupOperationDispatchQueue", v8);
    v10 = *(void **)&v2->executing;
    *(void *)&v2->executing = v9;

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100050F00;
    v26[3] = &unk_100291A38;
    objc_copyWeak(&v27, &location);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v26));
    timeoutQueue = v2->super._timeoutQueue;
    v2->super._timeoutQueue = (OS_dispatch_queue *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](v2, "startOperation"));
    [v13 removeDependenciesUponCompletion];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100051050;
    v24[3] = &unk_100291A38;
    objc_copyWeak(&v25, &location);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v24));
    id finishingBlock = v2->super._finishingBlock;
    v2->super._id finishingBlock = (id)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](v2, "finishOperation"));
    [v16 removeDependenciesUponCompletion];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](v2, "finishOperation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](v2, "startOperation"));
    [v17 addDependency:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](v2, "operationQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](v2, "finishOperation"));
    [v19 addOperation:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](v2, "startOperation"));
    [v21 setName:@"group-start"];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](v2, "finishOperation"));
    [v22 setName:@"group-finish"];

    LOBYTE(v2->super._descriptionUnderlyingError) = 0;
    BYTE1(v2->super._descriptionUnderlyingError) = 0;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  if (-[CKKSGroupOperation isPending](self, "isPending"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
    [v3 cancelAllOperations];

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
    [v4 cancel];

    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
    -[CKKSGroupOperation cancel](&v6, "cancel");
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
  -[CKKSGroupOperation dealloc](&v5, "dealloc");
}

- (BOOL)isPending
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"group-queue:%@", v4));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  [v6 setName:v5];

  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"group-start:%@", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
  [v8 setName:v7];

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"group-finish:%@",  v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
  [v10 setName:v9];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
  -[CKKSGroupOperation setName:](&v11, "setName:", v4);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation operationStateString](self, "operationStateString"));
  off_1002DE5A0();
  objc_super v5 = v4;
  unsigned int v6 = *v4 + 1;
  unsigned int *v4 = v6;
  if (v6 >= 0xB)
  {
    dispatch_queue_attr_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation selfname](self, "selfname"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ recursion>",  v7,  v3));
LABEL_29:

    goto LABEL_30;
  }

  if (!-[CKKSGroupOperation isFinished](self, "isFinished"))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
    v15 = (char *)[v14 operationCount];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dependencies]);
    v18 = &v15[(void)[v17 count]];

    if ((unint64_t)v18 <= 0x14)
    {
      v38 = v3;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 operations]);
      id v21 = [v20 mutableCopy];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
      [v21 removeObject:v22];

      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dependencies]);

      id v25 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v40;
        while (2)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_super v29 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
            if ((unint64_t)[v21 count] > 0x14)
            {

              dispatch_queue_attr_t v7 = @"Potentially more than 20 operations";
              goto LABEL_24;
            }

            uint64_t v30 = objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
            if (v29 == (void *)v30)
            {
            }

            else
            {
              v31 = (void *)v30;
              id v32 = [v21 indexOfObject:v29];

              if (v32 == (id)0x7FFFFFFFFFFFFFFFLL) {
                [v21 addObject:v29];
              }
            }
          }

          id v26 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }

      dispatch_queue_attr_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));
LABEL_24:

      v3 = v38;
    }

    else
    {
      dispatch_queue_attr_t v7 = @"Potentially more than 20 operations";
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation selfname](self, "selfname"));
    if (v33)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v36 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ [%@] error:%@>",  v34,  v3,  v7,  v35);
    }

    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSGroupOperation pendingDependenciesString:]( self,  "pendingDependenciesString:",  @" dep:"));
      v36 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ [%@]%@>",  v34,  v3,  v7,  v35);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(v36);

    goto LABEL_29;
  }

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation selfname](self, "selfname"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation finishDate](self, "finishDate"));
  v12 = (void *)v11;
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ %@ - %@>",  v10,  v3,  v12,  v13));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ %@>",  v10,  v3,  v11));
  }

LABEL_30:
  --*v5;

  return v8;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050EE4;
  v5[3] = &unk_1002916D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isFinished
{
  v2 = self;
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050EC8;
  v5[3] = &unk_1002916D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)start
{
  if (-[CKKSGroupOperation isCancelled](self, "isCancelled"))
  {
    v3 = @"isFinished";
    -[CKKSGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isFinished");
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation queue](self, "queue"));
    objc_super v5 = v4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100050E98;
    v10[3] = &unk_1002927F0;
    v10[4] = self;
    uint64_t v6 = v10;
  }

  else
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
    [v7 addOperation:v8];

    v3 = @"isExecuting";
    -[CKKSGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation queue](self, "queue"));
    objc_super v5 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100050EB0;
    v9[3] = &unk_1002927F0;
    v9[4] = self;
    uint64_t v6 = v9;
  }

  dispatch_sync(v4, v6);

  -[CKKSGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", v3);
}

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &stru_100284188));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
  [v4 addDependency:v3];

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
  -[CKKSGroupOperation cancel](&v39, "cancel");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 operations]);
  id v7 = [v6 copy];

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
        unsigned __int8 v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0) {
          [v13 cancel];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dependencies]);
  id v18 = [v17 copy];

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        if ((objc_msgSend(v8, "containsObject:", v24, (void)v31) & 1) == 0)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
          unsigned __int8 v26 = [v24 isEqual:v25];

          if ((v26 & 1) == 0)
          {
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
            [v27 removeDependency:v24];
          }
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v21);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
  unsigned int v29 = [v28 isPending];

  if (v29) {
    -[CKKSGroupOperation setFillInError:](self, "setFillInError:", 0LL);
  }
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue", (void)v31));
  [v30 addOperation:v3];
}

- (void)completeOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050E1C;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);

  -[CKKSGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  -[CKKSGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
}

- (void)addDependency:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CKKSGroupOperation;
  id v4 = a3;
  -[CKKSGroupOperation addDependency:](&v6, "addDependency:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation", v6.receiver, v6.super_class));
  [v5 addDependency:v4];
}

- (void)runBeforeGroupFinished:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
  [v4 addDependency:v5];

  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  [v6 addOperation:v4];
}

- (void)dependOnBeforeGroupFinished:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[CKKSGroupOperation isCancelled](self, "isCancelled"))
    {
      id v5 = sub_1000AA6AC(@"ckksgroup", 0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Can't add operation dependency to cancelled group",  buf,  2u);
      }

      goto LABEL_8;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
    [v7 addDependency:v4];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation finishOperation](self, "finishOperation"));
    unsigned int v9 = [v8 isFinished];

    if (v9)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to add operation(%@) to completed group(%@)",  v4,  self));
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

      objc_exception_throw(v15);
      v17 = v16;
      objc_sync_exit(v15);
      _Unwind_Resume(v17);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation startOperation](self, "startOperation"));
    [v4 addDependency:v10];

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___CKKSResultOperation, v11);
    if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0)
    {
      id v6 = self;
      objc_sync_enter(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s internalSuccesses](v6, "internalSuccesses"));
      [v13 addObject:v4];

      objc_sync_exit(v6);
LABEL_8:
    }
  }
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (BOOL)fillInError
{
  return BYTE2(self->super._descriptionUnderlyingError) & 1;
}

- (void)setFillInError:(BOOL)a3
{
  BYTE2(self->super._descriptionUnderlyingError) = a3;
}

- (NSBlockOperation)startOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setStartOperation:(id)a3
{
}

- (NSBlockOperation)finishOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setFinishOperation:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)internalSuccesses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setInternalSuccesses:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v4));

  [v5 runBeforeGroupFinished:v6];
  return v5;
}

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 operationWithBlock:a4]);
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
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000512CC;
  v12[3] = &unk_100290F30;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v12));
  [v8 runBeforeGroupFinished:v10];

  [v8 setName:v6];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

@end