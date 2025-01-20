@interface CDProviderDaemon
- (CDProviderDaemon)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_foundDeviceWithIdentifier:(id)a3 discoveryType:(int64_t)a4;
- (void)_invalidated;
- (void)_startDeviceDiscovery;
- (void)_startIDSService;
- (void)_startServiceListener;
- (void)activate;
- (void)invalidate;
- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4;
- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6;
- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4;
- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDProviderDaemon

- (CDProviderDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDProviderDaemon;
  v2 = -[CDProviderDaemon init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E348;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E3B4;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activated
{
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    -[CDServiceListener invalidate](self->_serviceListener, "invalidate");
    serviceListener = self->_serviceListener;
    self->_serviceListener = 0LL;

    -[CDProviderSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0LL;

    currentSessionConnection = self->_currentSessionConnection;
    self->_currentSessionConnection = 0LL;

    -[CDDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0LL;

    -[CDIDSService invalidate](self->_idsService, "invalidate");
    idsService = self->_idsService;
    self->_idsService = 0LL;

    self->_invalidateDone = 1;
  }

- (void)_startServiceListener
{
  v3 = objc_alloc_init(&OBJC_CLASS___CDServiceListener);
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  -[CDServiceListener setDispatchQueue:](self->_serviceListener, "setDispatchQueue:", self->_dispatchQueue);
  -[CDServiceListener setDelegate:](self->_serviceListener, "setDelegate:", self);
  -[CDServiceListener activate](self->_serviceListener, "activate");
}

- (void)_foundDeviceWithIdentifier:(id)a3 discoveryType:(int64_t)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"?";
    if (a4 == 2) {
      v7 = @"LegacyAppSignIn";
    }
    if (a4 == 1) {
      v7 = @"CompanionAuthentication";
    }
    v8 = v7;
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "FoundDevice, device=%@, type=%@",  buf,  0x16u);
  }

  if (!self->_currentSession)
  {
    v9 = -[CDProviderSession initWithDeviceIdentifier:discoveryType:]( objc_alloc(&OBJC_CLASS___CDProviderSession),  "initWithDeviceIdentifier:discoveryType:",  v6,  a4);
    currentSession = self->_currentSession;
    self->_currentSession = v9;

    -[CDProviderSession setDispatchQueue:](self->_currentSession, "setDispatchQueue:", self->_dispatchQueue);
    v11 = self->_currentSession;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001E644;
    v12[3] = &unk_100030910;
    v12[4] = self;
    -[CDProviderSession setInvalidationHandler:](v11, "setInvalidationHandler:", v12);
    -[CDProviderSession activate](self->_currentSession, "activate");
  }
}

- (void)_startDeviceDiscovery
{
  v3 = objc_alloc_init(&OBJC_CLASS___CDDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v3;

  -[CDDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  objc_super v5 = self->_deviceDiscovery;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E6E0;
  v6[3] = &unk_100030BE8;
  v6[4] = self;
  -[CDDeviceDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v6);
  -[CDDeviceDiscovery activate](self->_deviceDiscovery, "activate");
}

- (void)_startIDSService
{
  v3 = objc_alloc_init(&OBJC_CLASS___CDIDSService);
  idsService = self->_idsService;
  self->_idsService = v3;

  -[CDIDSService setDispatchQueue:](self->_idsService, "setDispatchQueue:", self->_dispatchQueue);
  objc_super v5 = self->_idsService;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E77C;
  v6[3] = &unk_1000310F8;
  v6[4] = self;
  -[CDIDSService setMessageReceivedHandler:](v5, "setMessageReceivedHandler:", v6);
  -[CDIDSService activate](self->_idsService, "activate");
}

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  return 0LL;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001E868;
  v8[3] = &unk_100030938;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CDProviderDaemon descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_currentSession)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  102LL,  0LL));
    v14[2](v14, v15);
  }

  else
  {
    v16 = (CDProviderSession *)objc_claimAutoreleasedReturnValue( -[CDProviderDaemon _authenticationSessionWithClient:request:]( self,  "_authenticationSessionWithClient:request:",  v12,  v13));
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10001EC04;
      v29[3] = &unk_100030988;
      id v19 = v11;
      id v30 = v19;
      -[CDProviderSession setSessionFinishedHandler:](v18, "setSessionFinishedHandler:", v29);
      v20 = self->_currentSession;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10001EC10;
      v27[3] = &unk_1000309B0;
      id v28 = v19;
      -[CDProviderSession setSessionFailedHandler:](v20, "setSessionFailedHandler:", v27);
      v21 = self->_currentSession;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10001EC1C;
      v26[3] = &unk_100030910;
      v26[4] = self;
      -[CDProviderSession setInvalidationHandler:](v21, "setInvalidationHandler:", v26);
      -[CDProviderSession setDispatchQueue:](self->_currentSession, "setDispatchQueue:", self->_dispatchQueue);
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      -[CDProviderSession activate](self->_currentSession, "activate");
    }

    else
    {
      uint64_t v22 = CPSErrorDomain;
      NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid authentication request: %@",  v13));
      v32 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  101LL,  v24));
      v14[2](v14, v25);
    }
  }
}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0LL));
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0LL);
}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end