@interface KTStateTransitionWatcher
+ (id)stripUnexpectedPathError:(id)a3;
- (BOOL)active;
- (BOOL)completed;
- (BOOL)isExpectedFailure:(id)a3 expected:(id)a4;
- (BOOL)onqueueCheckExpectedFailure:(id)a3 attempt:(id)a4;
- (BOOL)timeoutCanOccur;
- (KTResultOperation)initialTimeoutListenerOp;
- (KTResultOperation)result;
- (KTSignalTermHandler)sigTerm;
- (KTStateTransitionPath)intendedPath;
- (KTStateTransitionPathStep)remainingPath;
- (KTStateTransitionRequest)initialRequest;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (id)description;
- (id)initNamed:(id)a3 serialQueue:(id)a4 path:(id)a5 initialRequest:(id)a6;
- (id)timeout:(unint64_t)a3;
- (void)_onqueuePerformTimeoutWithUnderlyingError:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueProcessTransition:(id)a3;
- (void)onqueueStartFinishOperation;
- (void)setActive:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialRequest:(id)a3;
- (void)setInitialTimeoutListenerOp:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingPath:(id)a3;
- (void)setSigTerm:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation KTStateTransitionWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___KTStateTransitionWatcher;
  v15 = -[KTStateTransitionWatcher init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 asPathStep]);
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (KTStateTransitionPathStep *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"watcher-%@", v11));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlock:]( &OBJC_CLASS___KTResultOperation,  "named:withBlock:",  v19,  &stru_100287F10));
    v21 = v16->_result;
    v16->_result = (KTResultOperation *)v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    id location = 0LL;
    objc_initWeak(&location, v16);
    if (v14)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"watcher-timeout-%@",  v11));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_1001A3978;
      v36[3] = &unk_100284540;
      objc_copyWeak(&v38, &location);
      id v25 = v14;
      id v37 = v25;
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](&OBJC_CLASS___KTResultOperation, "named:withBlock:", v24, v36));
      initialTimeoutListenerOp = v16->_initialTimeoutListenerOp;
      v16->_initialTimeoutListenerOp = (KTResultOperation *)v26;

      v28 = v16->_initialTimeoutListenerOp;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v25 transitionOperation]);
      -[KTResultOperation addDependency:](v28, "addDependency:", v29);

      -[NSOperationQueue addOperation:](v16->_operationQueue, "addOperation:", v16->_initialTimeoutListenerOp);
      objc_destroyWeak(&v38);
    }

    v30 = objc_alloc(&OBJC_CLASS___KTSignalTermHandler);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1001A3A94;
    v34[3] = &unk_100276D20;
    objc_copyWeak(&v35, &location);
    v31 = -[KTSignalTermHandler initWithSIGTERMNotification:](v30, "initWithSIGTERMNotification:", v34);
    sigTerm = v16->_sigTerm;
    v16->_sigTerm = v31;

    *(_WORD *)&v16->_active = 0;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTStateTransitionWatcher(%@): remaining: %@, result: %@>",  v3,  v4,  v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v12 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = -[KTStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      if (-[KTStateTransitionWatcher active](self, "active"))
      {
LABEL_6:
        -[KTStateTransitionWatcher onqueueProcessTransition:](self, "onqueueProcessTransition:", v12);
        goto LABEL_7;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue([v12 nextState]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher intendedPath](self, "intendedPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 initialState]);
      unsigned int v11 = [v8 isEqualToString:v10];

      if (v11)
      {
        -[KTStateTransitionWatcher setActive:](self, "setActive:", 1LL);
        goto LABEL_6;
      }
    }
  }

- (void)_onqueuePerformTimeoutWithUnderlyingError:(id)a3
{
  id v12 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  if (v5)
  {
    v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
    dispatch_source_cancel(v6);

    -[KTStateTransitionWatcher setTimer:](self, "setTimer:", 0LL);
  }

  if (-[KTStateTransitionWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation(%@) timed out waiting to start for [%@]",  v7,  v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"KTResultOperationError",  3LL,  v9,  v12));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    [v11 setError:v10];

    -[KTStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
  }
}

- (id)timeout:(unint64_t)a3
{
  id location = 0LL;
  objc_initWeak(&location, self);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
  -[KTStateTransitionWatcher setTimer:](self, "setTimer:", v6);

  unsigned __int8 v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_1001A3FAC;
  v15 = &unk_100276D20;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_event_handler(v7, &v12);

  v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer", v12, v13, v14, v15));
  dispatch_time_t v9 = dispatch_time(0LL, a3);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);

  v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  dispatch_resume(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (BOOL)isExpectedFailure:(id)a3 expected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if (![v8 isEqual:v9])
  {

    goto LABEL_7;
  }

  id v10 = [v7 code];
  id v11 = [v6 code];

  if (v10 != v11)
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_36;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if (v15) {
      BOOL v16 = -[KTStateTransitionWatcher isExpectedFailure:expected:](self, "isExpectedFailure:expected:", v15, v13);
    }
    else {
      BOOL v16 = 0;
    }
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey]);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey]);

      v34 = (void *)v20;
      if (v20)
      {
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id obj = v18;
        id v21 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v33 = *(void *)v40;
          v31 = v18;
          while (1)
          {
            uint64_t v23 = 0LL;
LABEL_13:
            if (*(void *)v40 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * v23);
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            id v25 = v34;
            id v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (!v26) {
              break;
            }
            id v27 = v26;
            uint64_t v28 = *(void *)v36;
LABEL_17:
            uint64_t v29 = 0LL;
            while (1)
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v25);
              }
              if (-[KTStateTransitionWatcher isExpectedFailure:expected:]( self,  "isExpectedFailure:expected:",  *(void *)(*((void *)&v35 + 1) + 8 * v29),  v24))
              {
                break;
              }

              if (v27 == (id)++v29)
              {
                id v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v27) {
                  goto LABEL_17;
                }
                goto LABEL_30;
              }
            }

            if ((id)++v23 != v22) {
              goto LABEL_13;
            }
            id v22 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
            BOOL v16 = 1;
            v18 = v31;
            uint64_t v13 = 0LL;
            if (!v22) {
              goto LABEL_33;
            }
          }

- (BOOL)onqueueCheckExpectedFailure:(id)a3 attempt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (!v6 || (dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 error]), v9, !v9))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 expectedFailure]);
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);

      if (!v18)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"state %@, had unexpected success",  v11));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.transparency",  -4713LL,  v19));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
        [v21 setError:v20];
        goto LABEL_14;
      }
    }

    else
    {
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v11 expectedFailure]);
    if (v22)
    {
      v19 = (void *)v22;
      BOOL v14 = 1;
LABEL_15:

      goto LABEL_16;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);

    if (!v26)
    {
      BOOL v14 = 1;
      goto LABEL_17;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"state %@, had unexpected failure: expected no failure",  v11));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"com.apple.transparency",  -4714LL,  v19,  v20));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    [v27 setError:v21];

LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 expectedFailure]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
  unsigned __int8 v13 = -[KTStateTransitionWatcher isExpectedFailure:expected:](self, "isExpectedFailure:expected:", v12, v6);

  if ((v13 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"state %@, had unexpected error %@, expected %@",  v19,  v20,  v11));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"com.apple.transparency",  -4712LL,  v21,  v23));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    [v25 setError:v24];

    goto LABEL_14;
  }

  BOOL v14 = 1;
LABEL_16:

LABEL_17:
  return v14;
}

+ (id)stripUnexpectedPathError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (([v4 isEqual:@"com.apple.transparency"] & 1) != 0
    || [v3 code] == (id)-4711
    || [v3 code] == (id)-4712
    || [v3 code] == (id)-4713)
  {
  }

  else
  {
    id v12 = [v3 code];

    if (v12 != (id)-4714LL)
    {
      id v10 = v3;
      goto LABEL_10;
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSError, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    dispatch_time_t v9 = v6;
  }
  else {
    dispatch_time_t v9 = v3;
  }
  id v10 = v9;

LABEL_10:
  return v10;
}

- (void)onqueueProcessTransition:(id)a3
{
  id v22 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned __int8 v7 = -[KTStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v22 nextState]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 nextStep:v9]);

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 expectedFailure]);
        unsigned int v13 = -[KTStateTransitionWatcher onqueueCheckExpectedFailure:attempt:]( self,  "onqueueCheckExpectedFailure:attempt:",  v12,  v22);

        if (v13)
        {
          -[KTStateTransitionWatcher setRemainingPath:](self, "setRemainingPath:", v10);
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
          unsigned __int8 v15 = [v14 successState];

          if ((v15 & 1) == 0) {
            goto LABEL_12;
          }
        }
      }

      else
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);

        if (v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
          [v18 setError:v17];
        }

        else
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v22 nextState]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"state became %@, was expecting %@",  v17,  v18));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.transparency",  -4711LL,  v19));
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
          [v21 setError:v20];
        }
      }

      -[KTStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
LABEL_12:
    }
  }
}

- (void)onqueueStartFinishOperation
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[KTStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher sigTerm](self, "sigTerm"));
  [v4 unregister];

  -[KTStateTransitionWatcher setSigTerm:](self, "setSigTerm:", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));

  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
    dispatch_source_cancel(v6);

    -[KTStateTransitionWatcher setTimer:](self, "setTimer:", 0LL);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher operationQueue](self, "operationQueue"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
  [v7 addOperation:v8];

  -[KTStateTransitionWatcher setActive:](self, "setActive:", 0LL);
  -[KTStateTransitionWatcher setCompleted:](self, "setCompleted:", 1LL);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24LL, 1);
}

- (KTStateTransitionPath)intendedPath
{
  return (KTStateTransitionPath *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (KTStateTransitionPathStep)remainingPath
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRemainingPath:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (KTStateTransitionRequest)initialRequest
{
  return (KTStateTransitionRequest *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setInitialRequest:(id)a3
{
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInitialTimeoutListenerOp:(id)a3
{
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSigTerm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end