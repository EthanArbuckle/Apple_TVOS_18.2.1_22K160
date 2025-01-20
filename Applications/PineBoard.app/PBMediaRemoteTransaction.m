@interface PBMediaRemoteTransaction
+ (id)_defaultClient;
- (BSWatchdog)watchdog;
- (NSError)mediaRemoteError;
- (PBMediaRemoteClient)client;
- (PBMediaRemoteTransaction)init;
- (PBMediaRemoteTransaction)initWithClient:(id)a3;
- (double)watchdogTimeout;
- (id)queue;
- (void)_begin;
- (void)_didComplete;
- (void)_failWithMediaRemoteError:(id)a3;
@end

@implementation PBMediaRemoteTransaction

- (PBMediaRemoteTransaction)initWithClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBMediaRemoteTransaction;
  v6 = -[PBMediaRemoteTransaction init](&v10, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 queue]);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v6;
}

- (PBMediaRemoteTransaction)init
{
  id v3 = [(id)objc_opt_class(self) _defaultClient];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[PBMediaRemoteTransaction initWithClient:](self, "initWithClient:", v4);

  return v5;
}

- (NSError)mediaRemoteError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction error](self, "error"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:BSTransactionErrorPrecipitatingErrorKey]);

  return (NSError *)v4;
}

- (id)queue
{
  return self->_queue;
}

- (void)_begin
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBMediaRemoteTransaction;
  -[PBMediaRemoteTransaction _begin](&v13, "_begin");
  objc_initWeak(&location, self);
  id v3 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](self, "queue"));
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1001C2C80;
  objc_super v10 = &unk_1003D1228;
  objc_copyWeak(&v11, &location);
  id v5 = -[BSWatchdog initWithProvider:queue:completion:](v3, "initWithProvider:queue:completion:", self, v4, &v7);
  watchdog = self->_watchdog;
  self->_watchdog = v5;

  -[BSWatchdog start](self->_watchdog, "start", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMediaRemoteTransaction;
  -[PBMediaRemoteTransaction _didComplete](&v3, "_didComplete");
  -[BSWatchdog invalidate](self->_watchdog, "invalidate");
}

- (double)watchdogTimeout
{
  return 2.0;
}

+ (id)_defaultClient
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBMediaRemoteClient defaultClient]( &OBJC_CLASS___PBMediaRemoteClient,  "defaultClient"));
}

- (void)_failWithMediaRemoteError:(id)a3
{
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (PBMediaRemoteClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end