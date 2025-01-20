@interface KTStateTransitionRequest
- (BOOL)timeoutCanOccur;
- (KTStateTransitionOperationProtocol)transitionOperation;
- (NSSet)sourceStates;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)_onqueueStart;
- (id)description;
- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 timeout:(unint64_t)a6 transitionOp:(id)a7;
- (id)timeout:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation KTStateTransitionRequest

- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 timeout:(unint64_t)a6 transitionOp:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTStateTransitionRequest;
  v17 = -[KTStateTransitionRequest init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_sourceStates, a4);
    objc_storeStrong((id *)&v18->_queue, a5);
    v18->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v18->_transitionOperation, a7);
  }

  id v19 = -[KTStateTransitionRequest timeout:](v18, "timeout:", a6);

  return v18;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest transitionOperation](self, "transitionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest sourceStates](self, "sourceStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<KTStateTransitionRequest: %@ %@ sources:%d>",  v3,  v4,  [v5 count]));

  return v6;
}

- (id)_onqueueStart
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest transitionOperation](self, "transitionOperation"));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)timeout:(unint64_t)a3
{
  id location = 0LL;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100141B94;
  v8[3] = &unk_100276D20;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSSet)sourceStates
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (KTStateTransitionOperationProtocol)transitionOperation
{
  return (KTStateTransitionOperationProtocol *)objc_getProperty(self, a2, 32LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
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

- (void).cxx_destruct
{
}

@end