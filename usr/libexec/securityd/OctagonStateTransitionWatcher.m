@interface OctagonStateTransitionWatcher
- (BOOL)active;
- (BOOL)completed;
- (BOOL)timeoutCanOccur;
- (CKKSResultOperation)result;
- (NSDictionary)stateNumberMap;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (NSString)unexpectedStateErrorDomain;
- (OS_dispatch_queue)queue;
- (OctagonStateTransitionPath)intendedPath;
- (OctagonStateTransitionPathStep)remainingPath;
- (OctagonStateTransitionRequest)initialRequest;
- (id)description;
- (id)initNamed:(id)a3 stateMachine:(id)a4 path:(id)a5 initialRequest:(id)a6;
- (void)onqueueHandleStartTimeout:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueProcessTransition:(id)a3;
- (void)onqueueStartFinishOperation;
- (void)setActive:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialRequest:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingPath:(id)a3;
- (void)setStateNumberMap:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setUnexpectedStateErrorDomain:(id)a3;
@end

@implementation OctagonStateTransitionWatcher

- (id)initNamed:(id)a3 stateMachine:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionWatcher;
  v15 = -[OctagonStateTransitionWatcher init](&v31, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 asPathStep]);
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (OctagonStateTransitionPathStep *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"watcher-%@", v11));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  v19,  &stru_100284EA8));
    v21 = v16->_result;
    v16->_result = (CKKSResultOperation *)v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v12 queue]);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v12 stateNumberMap]);
    stateNumberMap = v16->_stateNumberMap;
    v16->_stateNumberMap = (NSDictionary *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v12 unexpectedStateErrorDomain]);
    unexpectedStateErrorDomain = v16->_unexpectedStateErrorDomain;
    v16->_unexpectedStateErrorDomain = (NSString *)v28;

    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    *(_WORD *)&v16->_active = 0;
  }

  return v16;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OctagonStateTransitionWatcher(%@): remaining: %@, result: %@>",  v3,  v4,  v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v12 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = -[OctagonStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      if (-[OctagonStateTransitionWatcher active](self, "active"))
      {
LABEL_6:
        -[OctagonStateTransitionWatcher onqueueProcessTransition:](self, "onqueueProcessTransition:", v12);
        goto LABEL_7;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue([v12 nextState]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher intendedPath](self, "intendedPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 initialState]);
      unsigned int v11 = [v8 isEqualToString:v10];

      if (v11)
      {
        -[OctagonStateTransitionWatcher setActive:](self, "setActive:", 1LL);
        goto LABEL_6;
      }
    }
  }

- (void)onqueueHandleStartTimeout:(id)a3
{
  id v10 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateTransitionWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation(%@) timed out waiting to start for [%@]",  v5,  v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSResultOperationError",  3LL,  v7,  v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
    [v9 setError:v8];

    -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
  }
}

- (void)onqueueProcessTransition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v6)
  {
    unsigned __int8 v7 = (void *)v6;
    unsigned __int8 v8 = -[OctagonStateTransitionWatcher completed](self, "completed");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 nextState]);
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 nextStep:v10]);

      if (v11)
      {
        -[OctagonStateTransitionWatcher setRemainingPath:](self, "setRemainingPath:", v11);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
        unsigned int v13 = [v12 successState];

        if (v13) {
          -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
        }
      }

      else
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
          [v16 setError:v15];
        }

        else
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher stateNumberMap](self, "stateNumberMap"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v4 nextState]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);

          v19 = &AAAccountClassPrimary_ptr;
          if (v15)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[OctagonStateTransitionWatcher unexpectedStateErrorDomain]( self,  "unexpectedStateErrorDomain"));
            id v21 = [v15 integerValue];
            v22 = (void *)objc_claimAutoreleasedReturnValue([v4 nextState]);
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unexpected state '%@'",  v22));
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  v20,  v21,  v23));

            v19 = &AAAccountClassPrimary_ptr;
          }

          else
          {
            v16 = 0LL;
          }

          uint64_t v24 = v19[265];
          v25 = (void *)objc_claimAutoreleasedReturnValue([v4 nextState]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"state became %@, was expecting %@",  v25,  v26));
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( [v24 errorWithDomain:@"com.apple.security.octagon" code:30 description:v27 underlying:v16]);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
          [v29 setError:v28];
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
        objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v38 error]);
        v39[0] = @"name";
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
        v40[0] = v32;
        v39[1] = @"intended";
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 followStates]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allKeys]);
        v40[1] = v35;
        v39[2] = @"became";
        v36 = (void *)objc_claimAutoreleasedReturnValue([v4 nextState]);
        v40[2] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  3LL));
        [v30 logUnrecoverableError:v31 forEvent:@"OctagonEventStateTransition" withAttributes:v37];

        -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
        unsigned int v11 = 0LL;
      }
    }
  }
}

- (void)onqueueStartFinishOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[OctagonStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher operationQueue](self, "operationQueue"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
  [v4 addOperation:v5];

  -[OctagonStateTransitionWatcher setActive:](self, "setActive:", 0LL);
  -[OctagonStateTransitionWatcher setCompleted:](self, "setCompleted:", 1LL);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (CKKSResultOperation)result
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24LL, 1);
}

- (OctagonStateTransitionPath)intendedPath
{
  return (OctagonStateTransitionPath *)objc_getProperty(self, a2, 32LL, 1);
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

- (OctagonStateTransitionPathStep)remainingPath
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 40LL, 1);
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

- (OctagonStateTransitionRequest)initialRequest
{
  return (OctagonStateTransitionRequest *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setInitialRequest:(id)a3
{
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setStateNumberMap:(id)a3
{
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setUnexpectedStateErrorDomain:(id)a3
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end