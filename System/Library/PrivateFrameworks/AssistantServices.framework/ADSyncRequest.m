@interface ADSyncRequest
- (ADSyncRequest)init;
- (BOOL)timedout;
- (NSUUID)uuid;
- (id)syncChunkHandler;
- (void)dealloc;
- (void)invalidateTimer;
- (void)setSyncChunkHandler:(id)a3;
- (void)startTimerOnQueue:(id)a3 withTimeoutHandler:(id)a4;
@end

@implementation ADSyncRequest

- (ADSyncRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADSyncRequest;
  v2 = -[ADSyncRequest init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v2->_timedout = 0;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADSyncRequest;
  -[ADSyncRequest dealloc](&v3, "dealloc");
}

- (void)startTimerOnQueue:(id)a3 withTimeoutHandler:(id)a4
{
  id v6 = a4;
  self->_timedout = 0;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100088148;
  v15 = &unk_1004FD990;
  v16 = self;
  id v17 = v6;
  id v9 = v6;
  v10 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v8,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v7,  &v12,  60.0);

  timer = self->_timer;
  self->_timer = v10;

  -[AFWatchdogTimer start](self->_timer, "start", v12, v13, v14, v15, v16);
}

- (void)invalidateTimer
{
  timer = self->_timer;
  self->_timer = 0LL;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)timedout
{
  return self->_timedout;
}

- (id)syncChunkHandler
{
  return self->_syncChunkHandler;
}

- (void)setSyncChunkHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end