@interface ADSessionBarrier
- (ADSessionBarrier)initWithThunk:(id)a3 barrier:(id)a4;
- (BOOL)bufferingAllowedDuringActiveSession;
- (BOOL)isProvisional;
- (BOOL)isRestartable;
- (BOOL)isRetryable;
- (BOOL)siriCore_bufferingAllowedDuringActiveSession;
- (BOOL)siriCore_isProvisional;
- (BOOL)siriCore_isRestartable;
- (BOOL)siriCore_isRetryable;
- (BOOL)siriCore_supportedByLocalSession;
- (BOOL)siriCore_supportedByRemoteLimitedSession;
- (BOOL)supportedByLocalSession;
- (BOOL)supportedByRemoteLimitedSession;
- (NSString)aceId;
- (NSString)refId;
- (id)serializedAceDataError:(id *)a3;
- (id)sessionRequestId;
- (id)siriCore_requestId;
- (id)siriCore_serializedAceDataError:(id *)a3;
- (void)barrierResultReturnedWithSuccess:(BOOL)a3;
- (void)dealloc;
- (void)setAceId:(id)a3;
- (void)siriCore_invokeThunk;
- (void)siriNetwork_invokeThunk;
@end

@implementation ADSessionBarrier

- (ADSessionBarrier)initWithThunk:(id)a3 barrier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADSessionBarrier;
  v8 = -[ADSessionBarrier init](&v18, "init");
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id thunkBlock = v8->_thunkBlock;
    v8->_id thunkBlock = v9;

    id v11 = objc_retainBlock(v7);
    id barrierBlock = v8->_barrierBlock;
    v8->_id barrierBlock = v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create(0LL, v14);

    barrierQueue = v8->_barrierQueue;
    v8->_barrierQueue = (OS_dispatch_queue *)v15;
  }

  return v8;
}

- (void)dealloc
{
  id barrierBlock = (void (**)(id, void))self->_barrierBlock;
  if (barrierBlock) {
    barrierBlock[2](barrierBlock, 0LL);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSessionBarrier;
  -[ADSessionBarrier dealloc](&v4, "dealloc");
}

- (void)barrierResultReturnedWithSuccess:(BOOL)a3
{
  barrierQueue = (dispatch_queue_s *)self->_barrierQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002DE63C;
  v4[3] = &unk_1004FC4D0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(barrierQueue, v4);
}

- (void)siriCore_invokeThunk
{
  id thunkBlock = (void (**)(id, ADSessionBarrier *))self->_thunkBlock;
  if (thunkBlock) {
    thunkBlock[2](thunkBlock, self);
  }
}

- (NSString)refId
{
  return 0LL;
}

- (BOOL)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)siriCore_isRetryable
{
  return 1;
}

- (BOOL)siriCore_isRestartable
{
  return 1;
}

- (BOOL)siriCore_isProvisional
{
  return 0;
}

- (id)siriCore_serializedAceDataError:(id *)a3
{
  return 0LL;
}

- (id)siriCore_requestId
{
  return 0LL;
}

- (BOOL)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)isProvisional
{
  return 0;
}

- (BOOL)isRestartable
{
  return 1;
}

- (BOOL)isRetryable
{
  return 1;
}

- (id)serializedAceDataError:(id *)a3
{
  return 0LL;
}

- (id)sessionRequestId
{
  return 0LL;
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (void)siriNetwork_invokeThunk
{
  id thunkBlock = (void (**)(id, ADSessionBarrier *))self->_thunkBlock;
  if (thunkBlock) {
    thunkBlock[2](thunkBlock, self);
  }
}

- (NSString)aceId
{
  return self->aceId;
}

- (void)setAceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end