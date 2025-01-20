@interface MTPromise
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (MTPromise)promiseWithAll:(id)a3;
+ (MTPromise)promiseWithAny:(id)a3;
+ (MTPromise)promiseWithComposition:(id)a3;
+ (MTPromise)promiseWithError:(id)a3;
+ (MTPromise)promiseWithResult:(id)a3;
+ (id)_findUnfinishedPromise:(id)a3;
+ (id)_globalPromiseStorage;
+ (id)_globalPromiseStorageAccessQueue;
+ (id)_resultOfComposition:(id)a3 errors:(id)a4;
+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6;
+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5;
+ (void)_finishPromise:(id)a3 withPromise:(id)a4;
+ (void)_setupCompositePromise:(id)a3 composition:(id)a4;
+ (void)cancelPromisesInComposition:(id)a3;
- (BOOL)_isFinished;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (MTPromise)init;
- (MTPromiseCompletionBlocks)completionBlocks;
- (MTPromiseResult)promiseResult;
- (NSConditionLock)stateLock;
- (id)BOOLCompletionHandlerAdapter;
- (id)catchWithBlock:(id)a3;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)nilValueCompletionHandlerAdapter;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithError:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)thenWithBlock:(id)a3;
- (void)_addBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setPromiseResult:(id)a3;
- (void)setStateLock:(id)a3;
- (void)waitUntilFinished;
- (void)waitUntilFinishedWithTimeout:(double)a3;
@end

@implementation MTPromise

- (MTPromise)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTPromise;
  v2 = -[MTPromise init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MTPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
    stateLock = v2->_stateLock;
    v2->_stateLock = v5;

    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MTPromise _globalPromiseStorageAccessQueue]( &OBJC_CLASS___MTPromise,  "_globalPromiseStorageAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000071DC;
    block[3] = &unk_100020560;
    v10 = v2;
    dispatch_sync(v7, block);
  }

  return v2;
}

+ (MTPromise)promiseWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class(a1));
  [v5 finishWithError:v4];

  return (MTPromise *)v5;
}

+ (MTPromise)promiseWithResult:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class(a1));
  [v5 finishWithResult:v4];

  return (MTPromise *)v5;
}

+ (MTPromise)promiseWithAll:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class(a1));
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  [(id)objc_opt_class(a1) _configureAllPromise:v5 withResults:v6 promises:v4 currentPromiseIndex:0];

  return (MTPromise *)v5;
}

+ (MTPromise)promiseWithAny:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class(a1));
  [(id)objc_opt_class(a1) _configureAnyPromise:v5 withPromises:v4 currentPromiseIndex:0];

  return (MTPromise *)v5;
}

- (BOOL)isCancelled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v3 lock];

  if (-[MTPromise _isFinished](self, "_isFinished"))
  {
    id v4 = (void *)objc_opt_class(self);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise promiseResult](self, "promiseResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    unsigned __int8 v7 = [v4 _errorIsCanceledError:v6];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v8 unlock];

  return v7;
}

- (BOOL)isFinished
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v3 lock];

  LOBYTE(v3) = -[MTPromise _isFinished](self, "_isFinished");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v4 unlock];

  return (char)v3;
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007568;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPromise completionBlocks](self, "completionBlocks"));
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007574;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v10, v7);
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007674;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPromise completionBlocks](self, "completionBlocks"));
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007680;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v10, v7);
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007780;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPromise completionBlocks](self, "completionBlocks"));
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000778C;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v10, v7);
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  unsigned __int8 v8 = [v7 lockWhenCondition:1 beforeDate:v6];

  if ((v8 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise promiseResult](self, "promiseResult"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
    [v16 unlock];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 result]);
    if (a4 && !v17) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v15 error]);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 result]);
  }

  else if (a4)
  {
    id v19 = MTError(400LL, 0LL, v9, v10, v11, v12, v13, v14, 0LL);
    v18 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v19);
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (id)resultWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3));

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4));

  return v7;
}

- (void)waitUntilFinished
{
  id v2 = -[MTPromise resultWithError:](self, "resultWithError:", 0LL);
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3 = -[MTPromise resultWithTimeout:error:](self, "resultWithTimeout:error:", 0LL, a3);
}

- (id)catchWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MTPromise);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007AA4;
  v11[3] = &unk_100020630;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  unsigned __int8 v7 = v5;
  uint64_t v12 = v7;
  -[MTPromise addFinishBlock:](self, "addFinishBlock:", v11);
  unsigned __int8 v8 = v12;
  uint64_t v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MTPromise);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007C4C;
  v11[3] = &unk_100020630;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  unsigned __int8 v7 = v5;
  uint64_t v12 = v7;
  -[MTPromise addFinishBlock:](self, "addFinishBlock:", v11);
  unsigned __int8 v8 = v12;
  uint64_t v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (BOOL)cancel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3072LL,  0LL));
  LOBYTE(self) = -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", 0LL, v3);

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", 0LL, a3);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0LL);
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  unsigned __int8 v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = MTMetricsKitOSLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v31 = v6;
      __int16 v32 = 2112;
      v33 = v8;
      uint64_t v11 = "MetricsKit: Someone is finishing a promise with both a result and an error. This will result in both the suc"
            "cess and error blocks being called. result = %@ error = %@";
      uint64_t v12 = v10;
      uint32_t v13 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v11, buf, v13);
    }
  }

  else
  {
    if (v6 | v7) {
      goto LABEL_10;
    }
    id v14 = MTMetricsKitOSLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "MetricsKit: Someone is finishing a promise with neither a result nor an error. This will result in neither t"
            "he success nor the error blocks being called.";
      uint64_t v12 = v10;
      uint32_t v13 = 2;
      goto LABEL_8;
    }
  }

LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v15 lock];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  id v17 = [v16 condition];

  if (v17 == (id)1)
  {
    v22 = (void *)objc_opt_class(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise promiseResult](self, "promiseResult"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 error]);
    if ([v22 _errorIsCanceledError:v24])
    {
    }

    else
    {
      unsigned __int8 v25 = [(id)objc_opt_class(self) _errorIsCanceledError:v8];

      if ((v25 & 1) != 0) {
        goto LABEL_16;
      }
      id v27 = MTMetricsKitOSLog();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Someone is attempting to finish a finished MTPromise.",  buf,  2u);
      }
    }

LABEL_16:
    v18 = (MTPromiseResult *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
    -[MTPromiseResult unlock](v18, "unlock");
    goto LABEL_17;
  }

  v18 = -[MTPromiseResult initWithResult:error:]( objc_alloc(&OBJC_CLASS___MTPromiseResult),  "initWithResult:error:",  v6,  v8);
  -[MTPromise setPromiseResult:](self, "setPromiseResult:", v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v19 unlockWithCondition:1];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise completionBlocks](self, "completionBlocks"));
  [v20 flushCompletionBlocksWithPromiseResult:v18];

  objc_initWeak((id *)buf, self);
  v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MTPromise _globalPromiseStorageAccessQueue]( &OBJC_CLASS___MTPromise,  "_globalPromiseStorageAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000080A0;
  block[3] = &unk_100020658;
  objc_copyWeak(&v29, (id *)buf);
  dispatch_async(v21, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_17:

  return v17 != (id)1;
}

- (id)BOOLCompletionHandlerAdapter
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  unint64_t v7 = sub_1000081AC;
  unsigned __int8 v8 = &unk_100020680;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (id)completionHandlerAdapter
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  unint64_t v7 = sub_1000082F0;
  unsigned __int8 v8 = &unk_1000206A8;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  unint64_t v7 = sub_100008410;
  unsigned __int8 v8 = &unk_1000206D0;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (id)nilValueCompletionHandlerAdapter
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  unint64_t v7 = sub_100008534;
  unsigned __int8 v8 = &unk_1000206A8;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  uint64_t v11 = (void (**)(void))a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  [v7 lock];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise promiseResult](self, "promiseResult"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
    [v9 unlock];

    v6[2](v6, v8);
  }

  else
  {
    v11[2]();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
    [v10 unlock];
  }
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:a6]);
  objc_initWeak(&location, a1);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008844;
  v23[3] = &unk_1000206F8;
  objc_copyWeak(v27, &location);
  id v14 = v11;
  id v24 = v14;
  v27[1] = (id)a6;
  id v15 = v12;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  [v13 addSuccessBlock:v23];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000088E0;
  v19[3] = &unk_100020720;
  unint64_t v22 = a6;
  id v17 = v15;
  id v20 = v17;
  id v18 = v16;
  id v21 = v18;
  [v13 addErrorBlock:v19];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a5]);
  objc_initWeak(&location, a1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100008ADC;
  v19[3] = &unk_100020748;
  unint64_t v22 = a5;
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v10 addSuccessBlock:v19];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008B5C;
  v15[3] = &unk_100020770;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a5;
  id v13 = v11;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  [v10 addErrorBlock:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100008D1C;
  v10[3] = &unk_100020798;
  id v5 = a3;
  id v11 = v5;
  id v6 = a4;
  [v6 addSuccessBlock:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008D28;
  v8[3] = &unk_1000207C0;
  id v9 = v5;
  id v7 = v5;
  [v6 addErrorBlock:v8];
}

+ (id)_globalPromiseStorage
{
  if (qword_1000284D0 != -1) {
    dispatch_once(&qword_1000284D0, &stru_1000207E0);
  }
  return (id)qword_1000284C8;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (qword_1000284E0 != -1) {
    dispatch_once(&qword_1000284E0, &stru_100020800);
  }
  return (id)qword_1000284D8;
}

- (BOOL)_isFinished
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromise stateLock](self, "stateLock"));
  BOOL v3 = [v2 condition] == (id)1;

  return v3;
}

- (MTPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (MTPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_resultOfComposition:(id)a3 errors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTPromise);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 promiseResult]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 error]);
    id v11 = (void *)v10;
    if (v7 && v10) {
      [v7 addObject:v10];
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 result]);
    id v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v23 = v14;
  }

  else
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id v17 = v6;
      id v18 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [a1 _resultOfComposition:*(void *)(*((void *)&v40 + 1) + 8 * (void)i) errors:v7]);
            [v16 addObject:v22];
          }

          id v19 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }

        while (v19);
      }

      id v23 = [v16 copy];
    }

    else
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v35 = v6;
        id v26 = v6;
        id v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v37;
          do
          {
            for (j = 0LL; j != v28; j = (char *)j + 1)
            {
              if (*(void *)v37 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)j);
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v31]);
              v33 = (void *)objc_claimAutoreleasedReturnValue([a1 _resultOfComposition:v32 errors:v7]);
              [v25 setObject:v33 forKeyedSubscript:v31];
            }

            id v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }

          while (v28);
        }

        id v23 = [v25 copy];
        id v6 = v35;
      }

      else
      {
        id v23 = v6;
      }
    }
  }

  return v23;
}

+ (id)_findUnfinishedPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTPromise);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v9 = v4;
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = objc_claimAutoreleasedReturnValue([a1 _findUnfinishedPromise:*(void *)(*((void *)&v26 + 1) + 8 * (void)i)]);
            if (v14)
            {
              id v7 = (id)v14;
              goto LABEL_28;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v4, v15) & 1) == 0)
      {
LABEL_26:
        id v7 = 0LL;
        goto LABEL_29;
      }

      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v9 = v4;
      id v16 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v23;
        while (2)
        {
          for (j = 0LL; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v9);
            }
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v22 + 1) + 8 * (void)j),  (void)v22));
            id v7 = (id)objc_claimAutoreleasedReturnValue([a1 _findUnfinishedPromise:v20]);

            if (v7)
            {
LABEL_28:

              goto LABEL_29;
            }
          }

          id v17 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }

    goto LABEL_26;
  }

  else {
    id v6 = v4;
  }
  id v7 = v6;
LABEL_29:

  return v7;
}

+ (void)_setupCompositePromise:(id)a3 composition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _findUnfinishedPromise:v7]);
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000C450;
    v10[3] = &unk_100020A50;
    id v13 = a1;
    id v11 = v6;
    id v12 = v7;
    [v8 addFinishBlock:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _resultOfComposition:v7 errors:0]);
    [v6 finishWithResult:v9];
  }
}

+ (MTPromise)promiseWithComposition:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class(a1));
  [a1 _setupCompositePromise:v5 composition:v4];

  return (MTPromise *)v5;
}

+ (void)cancelPromisesInComposition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTPromise);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v6 = v3;
      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * (void)i)]);
            +[MTPromise cancelPromisesInComposition:](&OBJC_CLASS___MTPromise, "cancelPromisesInComposition:", v11);
          }

          id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }

        while (v8);
      }
    }

    else
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v3, v12) & 1) == 0) {
        goto LABEL_21;
      }
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v6 = v3;
      id v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (j = 0LL; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v6);
            }
            +[MTPromise cancelPromisesInComposition:]( &OBJC_CLASS___MTPromise,  "cancelPromisesInComposition:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)j),  (void)v17);
          }

          id v14 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }

        while (v14);
      }
    }

    goto LABEL_21;
  }

  [v3 cancel];
LABEL_21:
}

@end