@interface CDRequesterSession
- (BOOL)_isSandboxPurchase;
- (BOOL)_requireOwnerDevice;
- (CDRequesterSession)initWithClient:(id)a3 request:(id)a4;
- (CDServiceClient)client;
- (OS_dispatch_queue)dispatchQueue;
- (id)_idsMessageRecipientUsernames;
- (id)_notifyDeviceIDSIdentifier;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (id)deviceAcceptedNotificationHandler;
- (id)deviceStartedAuthenticationHandler;
- (id)invalidationHandler;
- (id)request;
- (id)sessionFailedHandler;
- (id)sessionFinishedHandler;
- (unint64_t)_authFlags;
- (unsigned)_deviceActionType;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_notifySessionFailed:(id)a3;
- (void)_notifySessionFinished:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_stopAdvertisingNearbyAction;
- (void)activateWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)setDeviceAcceptedNotificationHandler:(id)a3;
- (void)setDeviceStartedAuthenticationHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSessionFailedHandler:(id)a3;
- (void)setSessionFinishedHandler:(id)a3;
@end

@implementation CDRequesterSession

- (CDRequesterSession)initWithClient:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CDRequesterSession;
  v9 = -[CDRequesterSession init](&v13, "init");
  if (v9)
  {
    uint64_t v10 = os_transaction_create("companion authentication session");
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v10;

    objc_storeStrong((id *)&v9->_dispatchQueue, &_dispatch_main_q);
    v9->_activateCalledAtomic = 0;
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong(&v9->_request, a4);
  }

  return v9;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000128B8;
  v7[3] = &unk_100030AC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012A40;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    -[RPCompanionLinkClient invalidate](self->_rapportClient, "invalidate");
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0LL;

    -[SFService invalidate](self->_sharingService, "invalidate");
    sharingService = self->_sharingService;
    self->_sharingService = 0LL;

    id deviceAcceptedNotificationHandler = self->_deviceAcceptedNotificationHandler;
    self->_id deviceAcceptedNotificationHandler = 0LL;

    id deviceStartedAuthenticationHandler = self->_deviceStartedAuthenticationHandler;
    self->_id deviceStartedAuthenticationHandler = 0LL;

    id sessionFinishedHandler = self->_sessionFinishedHandler;
    self->_id sessionFinishedHandler = 0LL;

    id sessionFailedHandler = self->_sessionFailedHandler;
    self->_id sessionFailedHandler = 0LL;

    if (self->_systemAttentionStateNotificationToken)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 removeObserver:self->_systemAttentionStateNotificationToken];

      id systemAttentionStateNotificationToken = self->_systemAttentionStateNotificationToken;
      self->_id systemAttentionStateNotificationToken = 0LL;
    }

    sub_100012EB8((id *)&self->super.isa);
    -[CDIDSService invalidate](self->_idsService, "invalidate");
    idsService = self->_idsService;
    self->_idsService = 0LL;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v13 = self->_invalidationHandler;
      self->_invalidationHandler = 0LL;
    }

    self->_invalidateDone = 1;
  }

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
}

- (void)_configureRapportClient:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (unsigned)_deviceActionType
{
  return 34;
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = cps_session_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device accepted notification: %@",  (uint8_t *)&v8,  0xCu);
  }

  id deviceAcceptedNotificationHandler = (void (**)(id, id))self->_deviceAcceptedNotificationHandler;
  if (deviceAcceptedNotificationHandler) {
    deviceAcceptedNotificationHandler[2](deviceAcceptedNotificationHandler, v4);
  }
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = cps_session_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device started server authentication: %@",  (uint8_t *)&v8,  0xCu);
  }

  id deviceStartedAuthenticationHandler = (void (**)(id, id))self->_deviceStartedAuthenticationHandler;
  if (deviceStartedAuthenticationHandler) {
    deviceStartedAuthenticationHandler[2](deviceStartedAuthenticationHandler, v4);
  }
}

- (void)_notifySessionFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = cps_session_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Authentication session finished: %@",  (uint8_t *)&v8,  0xCu);
  }

  id sessionFinishedHandler = (void (**)(id, id))self->_sessionFinishedHandler;
  if (sessionFinishedHandler) {
    sessionFinishedHandler[2](sessionFinishedHandler, v4);
  }
}

- (void)_notifySessionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = cps_session_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10001F698((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  id sessionFailedHandler = (void (**)(id, id))self->_sessionFailedHandler;
  if (sessionFailedHandler)
  {
    if (v4)
    {
      sessionFailedHandler[2](sessionFailedHandler, v4);
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  100LL,  0LL));
      sessionFailedHandler[2](sessionFailedHandler, v14);
    }
  }
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  return 0LL;
}

- (BOOL)_isSandboxPurchase
{
  return 0;
}

- (void)_stopAdvertisingNearbyAction
{
  sharingService = self->_sharingService;
  self->_sharingService = 0LL;
}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (unint64_t)_authFlags
{
  return 0LL;
}

- (id)_idsMessageRecipientUsernames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedUserProfile]);
  if (v4)
  {
    id v5 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAccount]);
  }

  else
  {
    id v6 = 0LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)_notifyDeviceIDSIdentifier
{
  return 0LL;
}

- (CDServiceClient)client
{
  return self->_client;
}

- (id)request
{
  return self->_request;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceAcceptedNotificationHandler
{
  return self->_deviceAcceptedNotificationHandler;
}

- (void)setDeviceAcceptedNotificationHandler:(id)a3
{
}

- (id)deviceStartedAuthenticationHandler
{
  return self->_deviceStartedAuthenticationHandler;
}

- (void)setDeviceStartedAuthenticationHandler:(id)a3
{
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