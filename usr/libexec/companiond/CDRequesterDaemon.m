@interface CDRequesterDaemon
- (CDRequesterDaemon)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_invalidated;
- (void)_startServiceListener;
- (void)activate;
- (void)invalidate;
- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4;
- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6;
- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4;
- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDRequesterDaemon

- (CDRequesterDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterDaemon;
  v2 = -[CDRequesterDaemon init](&v5, "init");
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
  uint64_t v3 = cps_daemon_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "activate called", buf, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007E0C;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  uint64_t v3 = cps_daemon_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "invalidate called", buf, 2u);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007EC4;
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

    -[CDRequesterSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0LL;

    self->_invalidateDone = 1;
  }

- (void)_startServiceListener
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CDServiceListener);
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  -[CDServiceListener setDispatchQueue:](self->_serviceListener, "setDispatchQueue:", self->_dispatchQueue);
  -[CDServiceListener setDelegate:](self->_serviceListener, "setDelegate:", self);
  -[CDServiceListener activate](self->_serviceListener, "activate");
}

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___CPSStorePurchaseRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = off_100030228;
  }

  else
  {
    uint64_t v11 = objc_opt_self(&OBJC_CLASS___CPSAppSignInRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    char v13 = objc_opt_isKindOfClass(v6, v12);

    if ((v13 & 1) != 0)
    {
      v10 = off_100030200;
    }

    else
    {
      uint64_t v14 = objc_opt_self(&OBJC_CLASS___CPSSystemAuthenticationRequest);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      char v16 = objc_opt_isKindOfClass(v6, v15);

      if ((v16 & 1) != 0)
      {
        v10 = off_100030230;
      }

      else
      {
        uint64_t v17 = objc_opt_self(&OBJC_CLASS___CPSSharingRequest);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        char v19 = objc_opt_isKindOfClass(v6, v18);

        if ((v19 & 1) != 0)
        {
          v10 = off_100030218;
        }

        else
        {
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___CPSRestrictedAccessRequest);
          if ((objc_opt_isKindOfClass(v6, v20) & 1) != 0)
          {
            v10 = off_100030210;
          }

          else
          {
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___CPSStoreAuthenticationRequest);
            if ((objc_opt_isKindOfClass(v6, v21) & 1) != 0)
            {
              v10 = off_100030220;
            }

            else
            {
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___CPSTVProviderRequest);
              if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0)
              {
                v10 = &off_100030238;
              }

              else
              {
                uint64_t v23 = objc_opt_class(&OBJC_CLASS___CPSLearnMoreRequest);
                if ((objc_opt_isKindOfClass(v6, v23) & 1) == 0)
                {
                  id v24 = 0LL;
                  goto LABEL_18;
                }

                v10 = off_100030208;
              }
            }
          }
        }
      }
    }
  }

  id v24 = [objc_alloc(*v10) initWithClient:v5 request:v6];
LABEL_18:

  return v24;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000822C;
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
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CDRequesterDaemon descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_currentSession)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  102LL,  0LL));
    v14[2](v14, v15);
  }

  else
  {
    char v16 = (CDRequesterSession *)objc_claimAutoreleasedReturnValue( -[CDRequesterDaemon _authenticationSessionWithClient:request:]( self,  "_authenticationSessionWithClient:request:",  v12,  v13));
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      -[CDRequesterSession setDispatchQueue:](v18, "setDispatchQueue:", self->_dispatchQueue);
      char v19 = self->_currentSession;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100008628;
      v38[3] = &unk_100030960;
      id v20 = v11;
      id v39 = v20;
      -[CDRequesterSession setDeviceAcceptedNotificationHandler:](v19, "setDeviceAcceptedNotificationHandler:", v38);
      uint64_t v21 = self->_currentSession;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_100008634;
      v36[3] = &unk_100030960;
      id v22 = v20;
      id v37 = v22;
      -[CDRequesterSession setDeviceStartedAuthenticationHandler:](v21, "setDeviceStartedAuthenticationHandler:", v36);
      uint64_t v23 = self->_currentSession;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100008640;
      v34[3] = &unk_100030988;
      id v24 = v22;
      id v35 = v24;
      -[CDRequesterSession setSessionFinishedHandler:](v23, "setSessionFinishedHandler:", v34);
      v25 = self->_currentSession;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10000864C;
      v32[3] = &unk_1000309B0;
      id v33 = v24;
      -[CDRequesterSession setSessionFailedHandler:](v25, "setSessionFailedHandler:", v32);
      v26 = self->_currentSession;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100008658;
      v31[3] = &unk_100030910;
      v31[4] = self;
      -[CDRequesterSession setInvalidationHandler:](v26, "setInvalidationHandler:", v31);
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      -[CDRequesterSession activateWithCompletionHandler:](self->_currentSession, "activateWithCompletionHandler:", v14);
    }

    else
    {
      uint64_t v27 = CPSErrorDomain;
      NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid authentication request: %@",  v13));
      v41 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  101LL,  v29));
      v14[2](v14, v30);
    }
  }
}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0LL));
  v6[2](v6, v7, 0LL);
}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  [v6 setDelegate:self];
}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = (CDServiceConnection *)a4;
  dispatch_assert_queue_V2(dispatchQueue);
  currentSessionConnection = self->_currentSessionConnection;

  if (currentSessionConnection == v6)
  {
    -[CDRequesterSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0LL;

    id v9 = self->_currentSessionConnection;
    self->_currentSessionConnection = 0LL;
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end