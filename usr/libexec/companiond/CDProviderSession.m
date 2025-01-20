@interface CDProviderSession
- (CDProviderSession)initWithDeviceIdentifier:(id)a3 discoveryType:(int64_t)a4;
- (CDProviderSession)initWithLocalAuthenticationRequest:(id)a3;
- (NSString)deviceIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)sessionFailedHandler;
- (id)sessionFinishedHandler;
- (int64_t)discoveryType;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSessionFailedHandler:(id)a3;
- (void)setSessionFinishedHandler:(id)a3;
@end

@implementation CDProviderSession

- (CDProviderSession)initWithDeviceIdentifier:(id)a3 discoveryType:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CDProviderSession;
  v7 = -[CDProviderSession init](&v15, "init");
  if (v7)
  {
    uint64_t v8 = os_transaction_create("companion authentication session");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    objc_storeStrong((id *)&v7->_dispatchQueue, &_dispatch_main_q);
    v7->_activateCalledAtomic = 0;
    v10 = (NSString *)[v6 copy];
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = v10;

    v7->_discoveryType = a4;
    uint64_t v16 = RPOptionBTHighPriority;
    v17 = &__kCFBooleanTrue;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    rapportOptions = v7->_rapportOptions;
    v7->_rapportOptions = (NSDictionary *)v12;
  }

  return v7;
}

- (CDProviderSession)initWithLocalAuthenticationRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDProviderSession;
  id v6 = -[CDProviderSession init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localAuthenticationRequest, a3);
    uint64_t v8 = os_transaction_create("companion authentication session");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    objc_storeStrong((id *)&v7->_dispatchQueue, &_dispatch_main_q);
    v7->_activateCalledAtomic = 0;
  }

  return v7;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008A30;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008B0C;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end