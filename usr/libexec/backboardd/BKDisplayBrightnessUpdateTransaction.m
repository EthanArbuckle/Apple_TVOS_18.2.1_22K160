@interface BKDisplayBrightnessUpdateTransaction
+ (id)_sharedQueue;
+ (void)beginImplicitTransaction;
- (BKDisplayBrightnessUpdateTransaction)initWithIdentifier:(id)a3 transactionManager:(id)a4;
- (NSString)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_queue_invalidate;
- (void)_queue_setTimerWithTimeIntervalSinceNow:(double)a3;
- (void)_queue_updateExpirationTimeWithIntervalSinceNow:(double)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKDisplayBrightnessUpdateTransaction

- (BKDisplayBrightnessUpdateTransaction)initWithIdentifier:(id)a3 transactionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = [BKDisplayBrightnessUpdateTransaction class];
  BKDisplayBrightnessUpdateTransaction *v8 = [[BKDisplayBrightnessUpdateTransaction alloc] init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    uint64_t v11 = [BKDisplayBrightnessUpdateTransaction _sharedQueue];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v8->_transactionManager = a4;
    [v7 _beginUpdateTransaction:v8];
  }

  return v8;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_invalidated == YES"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      id v6 = v5;
      v8 = [self class];
      v9 = NSStringFromClass(v8);
      v10 = (void *)[v9 autorelease];
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDisplayBrightnessUpdateTransactionManager.m";
      __int16 v20 = 1024;
      int v21 = 56;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x100051A54LL);
  }

  v11.receiver = self;
  v11.super_class = [BKDisplayBrightnessUpdateTransaction class];
  [v11 dealloc];
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051DC0;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_queue_setTimerWithTimeIntervalSinceNow:(double)a3
{
  timer = self->_timer;
  self->_timer = 0LL;

  if (a3 <= 0.0)
  {
    [self _queue_invalidate];
  }

  else
  {
    id v6 = [BSAbsoluteMachTimer initWithIdentifier:@"BKDisplayBrightnessUpdateTransaction"];
    uint64_t v7 = self->_timer;
    self->_timer = v6;

    v8 = self->_timer;
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100051D7C;
    v10[3] = &unk_1000B75C0;
    v10[4] = self;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:]( v8,  "scheduleWithFireInterval:leewayInterval:queue:handler:",  queue,  v10,  a3,  0.0);
  }

- (void)_queue_invalidate
{
  timer = self->_timer;
  self->_timer = 0LL;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [self->_transactionManager _endUpdateTransaction:];
    if ((BKDisplayBrightnessUpdateTransaction *)qword_1000DC1B8 == self)
    {
      qword_1000DC1B8 = 0LL;
    }
  }

- (void)_queue_updateExpirationTimeWithIntervalSinceNow:(double)a3
{
  uint64_t v5 = BSDispatchQueueAssert(self->_queue, a2);
  self->_expirationTime = BSAbsoluteMachTimeNow(v5) + a3;
  if (!self->_timer) {
    [self _queue_setTimerWithTimeIntervalSinceNow:a3];
  }
}

- (NSString)description
{
  return [self descriptionWithMultilinePrefix:0LL];
}

- (id)succinctDescription
{
  v2 = [BKDisplayBrightnessUpdateTransaction succinctDescriptionBuilder];
  v3 = (void *)[v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_identifier withName:@"identifier"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BKDisplayBrightnessUpdateTransactionDescriptionBuilder *v3 = [self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
}

+ (void)beginImplicitTransaction
{
  v2 = [BKDisplayBrightnessUpdateTransaction _sharedQueue];
  dispatch_sync(v2, ^{
    stru_1000B7578;
});
}

+ (id)_sharedQueue
{
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000B7598);
  }
  return (id)qword_1000DC1C0;
}

@end