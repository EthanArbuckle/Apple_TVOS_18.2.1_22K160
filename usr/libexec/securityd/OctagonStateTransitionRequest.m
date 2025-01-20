@interface OctagonStateTransitionRequest
- (BOOL)timeoutCanOccur;
- (NSSet)sourceStates;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OctagonStateTransitionOperationProtocol)transitionOperation;
- (id)_onqueueStart;
- (id)description;
- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 transitionOp:(id)a6;
- (void)onqueueHandleStartTimeout:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation OctagonStateTransitionRequest

- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 transitionOp:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionRequest;
  v15 = -[OctagonStateTransitionRequest init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_sourceStates, a4);
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_transitionOperation, a6);
  }

  return v16;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest sourceStates](self, "sourceStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<OctagonStateTransitionRequest: %@ %@ sources:%d>",  v3,  v4,  [v5 count]));

  return v6;
}

- (id)_onqueueStart
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (void)onqueueHandleStartTimeout:(id)a3
{
  id v11 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    [v5 setDescriptionUnderlyingError:v11];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    [v6 setDescriptionErrorCode:2000];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    id v8 = [v7 timeout:0];

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    -[NSOperationQueue addOperation:](v9, "addOperation:", v10);
  }
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSSet)sourceStates
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (OctagonStateTransitionOperationProtocol)transitionOperation
{
  return (OctagonStateTransitionOperationProtocol *)objc_getProperty(self, a2, 32LL, 1);
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