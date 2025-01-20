@interface RPStatusUpdatableXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPStatusDaemon)daemon;
- (RPStatusProvider)provider;
- (RPStatusSubscriber)subscriber;
- (RPStatusUpdatableXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (void)connectionInvalidated;
- (void)setDispatchQueue:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)xpcStatusProviderActivate:(id)a3 completion:(id)a4;
- (void)xpcStatusSubscriberActivate:(id)a3 completion:(id)a4;
- (void)xpcStatusUpdatableCancelProvideStatus:(id)a3;
- (void)xpcStatusUpdatableProvideStatus:(id)a3 statusInfo:(id)a4;
- (void)xpcStatusUpdatableSubscribeToStatus:(id)a3;
- (void)xpcStatusUpdatableUnsubscribeToStatus:(id)a3;
@end

@implementation RPStatusUpdatableXPCConnection

- (RPStatusUpdatableXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPStatusUpdatableXPCConnection;
  v9 = -[RPStatusUpdatableXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  if (dword_100132D20 <= 20 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 20LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  provider = self->_provider;
  if (provider)
  {
    -[RPStatusProvider invalidate](provider, "invalidate");
    v4 = self->_provider;
    self->_provider = 0LL;
  }

  subscriber = self->_subscriber;
  if (subscriber)
  {
    -[RPStatusSubscriber invalidate](subscriber, "invalidate");
    v6 = self->_subscriber;
    self->_subscriber = 0LL;
  }

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.StatusUpdates"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100132D20 <= 90
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 90LL)))
    {
      LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection _entitledAndReturnError:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.rapport.StatusUpdates");
    }

    if (a3)
    {
      id v14 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)@"com.apple.rapport.StatusUpdates");
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      BOOL result = 0;
      *a3 = v15;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)xpcStatusUpdatableProvideStatus:(id)a3 statusInfo:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132D20 <= 30 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableProvideStatus:statusInfo:]",  30LL,  "ProvideStatus: %@ with info: %@",  v7,  v6);
  }
}

- (void)xpcStatusUpdatableCancelProvideStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132D20 <= 30 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableCancelProvideStatus:]",  30LL,  "CancelStatus: %@",  v4);
  }
}

- (void)xpcStatusUpdatableSubscribeToStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132D20 <= 30 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableSubscribeToStatus:]",  30LL,  "SubscribeToStatus: %@",  v4);
  }
}

- (void)xpcStatusUpdatableUnsubscribeToStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132D20 <= 30 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableUnsubscribeToStatus:]",  30LL,  "UnsubscribeToStatus: %@",  v4);
  }
}

- (void)xpcStatusProviderActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0LL;
  -[RPStatusUpdatableXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  id v15 = v19;
  if (v15)
  {
    if (v8) {
      v8[2](v8, 0LL, v15);
    }
  }

  else if (self->_provider)
  {
    if (dword_100132D20 <= 90
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 90LL)))
    {
      LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusProviderActivate:completion:]",  90LL,  "### RPStatusProvider activate when already activated");
    }

    if (v8)
    {
      id v16 = RPErrorF(4294960575LL, (uint64_t)"Provider already active", v9, v10, v11, v12, v13, v14, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v17);
    }
  }

  else
  {
    if (dword_100132D20 <= 30
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL)))
    {
      LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusProviderActivate:completion:]",  30LL,  "RPStatusProvider Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_provider, a3);
    if (v8) {
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0LL);
    }
    -[RPStatusDaemon _update](self->_daemon, "_update");
  }
}

- (void)xpcStatusSubscriberActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0LL;
  -[RPStatusUpdatableXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  id v15 = v19;
  if (v15)
  {
    if (v8) {
      v8[2](v8, 0LL, v15);
    }
  }

  else if (self->_subscriber)
  {
    if (dword_100132D20 <= 90
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 90LL)))
    {
      LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusSubscriberActivate:completion:]",  90LL,  "### RPStatusSubscriber activate when already activated");
    }

    if (v8)
    {
      id v16 = RPErrorF(4294960575LL, (uint64_t)"Subscriber already active", v9, v10, v11, v12, v13, v14, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v17);
    }
  }

  else
  {
    if (dword_100132D20 <= 30
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL)))
    {
      LogPrintF( &dword_100132D20,  "-[RPStatusUpdatableXPCConnection xpcStatusSubscriberActivate:completion:]",  30LL,  "RPStatusSubscriber Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    -[RPStatusSubscriber setDispatchQueue:](self->_subscriber, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_subscriber, a3);
    if (v8) {
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0LL);
    }
    -[RPStatusDaemon _update](self->_daemon, "_update");
  }
}

- (RPStatusDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPStatusProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (RPStatusSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
}

@end