@interface CDServiceConnection
- (CDServiceConnection)initWithConnection:(id)a3;
- (CDServiceConnectionDelegate)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)authenticationSessionDeviceStartedAuthentication:(id)a3;
- (void)authenticationSessionDeviceTappedNotification:(id)a3;
- (void)authenticationSessionDidFailWithError:(id)a3;
- (void)authenticationSessionDidFinishWithResponse:(id)a3;
- (void)fetchDaemonStatusWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startAuthenticationSessionWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation CDServiceConnection

- (CDServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDServiceConnection;
  v6 = -[CDServiceConnection init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000CBA0;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CDServiceConnection descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceConnection succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (void)startAuthenticationSessionWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( (void *)&_mh_execute_header,  "start authentication session",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CDServiceClient currentClient](&OBJC_CLASS___CDServiceClient, "currentClient"));
  uint64_t v10 = cps_service_log();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    *(_DWORD *)buf = 138412546;
    v55 = v12;
    __int16 v56 = 2112;
    id v57 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received start authentication session request. client=%@, request=%@",  buf,  0x16u);
  }

  v46 = _NSConcreteStackBlock;
  uint64_t v47 = 3221225472LL;
  v48 = sub_10000D604;
  v49 = &unk_100030B80;
  id v13 = v7;
  id v50 = v13;
  v14 = objc_retainBlock(&v46);
  uint64_t v15 = objc_opt_self(&OBJC_CLASS___CPSStorePurchaseRequest);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v16);

  if ((isKindOfClass & 1) != 0)
  {
    sub_10000CC50((uint64_t)self, v9, v6, v14);
  }

  else
  {
    uint64_t v18 = objc_opt_self(&OBJC_CLASS___CPSAppSignInRequest);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    char v20 = objc_opt_isKindOfClass(v6, v19);

    if ((v20 & 1) != 0)
    {
      uint64_t v21 = cps_signpost_log();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v24 = (char *)[v23 hash];

      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v24,  "StartAuthentication",  "",  buf,  2u);
      }

      sub_10000CD18((uint64_t)self, v9, v6, v14);
    }

    else
    {
      uint64_t v25 = objc_opt_self(&OBJC_CLASS___CPSSystemAuthenticationRequest);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      char v27 = objc_opt_isKindOfClass(v6, v26);

      if ((v27 & 1) == 0)
      {
        uint64_t v28 = objc_opt_self(&OBJC_CLASS___CPSSharingRequest);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        char v30 = objc_opt_isKindOfClass(v6, v29);

        if ((v30 & 1) == 0)
        {
          uint64_t v31 = objc_opt_self(&OBJC_CLASS___CPSRestrictedAccessRequest);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          char v33 = objc_opt_isKindOfClass(v6, v32);

          if ((v33 & 1) != 0)
          {
            sub_10000CF7C((uint64_t)self, v9, v6, v14);
            goto LABEL_22;
          }

          uint64_t v34 = objc_opt_self(&OBJC_CLASS___CPSStoreAuthenticationRequest);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          char v36 = objc_opt_isKindOfClass(v6, v35);

          if ((v36 & 1) != 0)
          {
            sub_10000D044((uint64_t)self, v9, v6, v14);
            goto LABEL_22;
          }

          uint64_t v37 = objc_opt_self(&OBJC_CLASS___CPSTVProviderRequest);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          char v39 = objc_opt_isKindOfClass(v6, v38);

          if ((v39 & 1) == 0)
          {
            uint64_t v40 = objc_opt_self(&OBJC_CLASS___CPSLearnMoreRequest);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            char v42 = objc_opt_isKindOfClass(v6, v41);

            if ((v42 & 1) == 0)
            {
              NSErrorUserInfoKey v52 = NSDebugDescriptionErrorKey;
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid authentication request: %@",  v6,  v46,  v47,  v48,  v49));
              v53 = v43;
              v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
              v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  101LL,  v44));
              ((void (*)(void ***, void *))v14[2])(v14, v45);

              goto LABEL_22;
            }
          }
        }

        sub_10000CEEC((uint64_t)self, v9, v6, v14);
        goto LABEL_22;
      }

      sub_10000CE24((uint64_t)self, v9, v6, v14);
    }
  }

- (void)fetchDaemonStatusWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "fetch daemon status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v11);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDServiceClient currentClient](&OBJC_CLASS___CDServiceClient, "currentClient"));
  uint64_t v7 = cps_service_log();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received fetch daemon status request. client=%@",  buf,  0xCu);
  }

  if ([v6 hasDaemonStatusEntitlement])
  {
    if ((_BSIsInternalInstall("-[CDServiceConnection fetchDaemonStatusWithCompletionHandler:]") & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained serviceConnection:self fetchDaemonStatusWithCompletionHandler:v4];
    }

    else
    {
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  101LL,  0LL));
      v4[2](v4, 0LL, WeakRetained);
    }
  }

  else
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  103LL,  0LL));
    v4[2](v4, 0LL, WeakRetained);
  }

  os_activity_scope_leave(&v11);
}

- (void)authenticationSessionDeviceTappedNotification:(id)a3
{
  id v4 = a3;
  id v5 = -[CDServiceClient initWithConnection:]( objc_alloc(&OBJC_CLASS___CDServiceClient),  "initWithConnection:",  self->_connection);
  if (-[CDServiceClient shouldReceiveDeviceEvents](v5, "shouldReceiveDeviceEvents"))
  {
    id v6 = _os_activity_create( (void *)&_mh_execute_header,  "send device accepted notification event",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v11);

    uint64_t v7 = cps_service_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceClient bundleIdentifier](v5, "bundleIdentifier"));
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending device accepted notification event to client. client=%@, device=%@",  buf,  0x16u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &stru_100030BA0));
    [v10 authenticationSessionDeviceTappedNotification:v4];

    os_activity_scope_leave(&v11);
  }
}

- (void)authenticationSessionDeviceStartedAuthentication:(id)a3
{
  id v4 = a3;
  id v5 = -[CDServiceClient initWithConnection:]( objc_alloc(&OBJC_CLASS___CDServiceClient),  "initWithConnection:",  self->_connection);
  if (-[CDServiceClient shouldReceiveDeviceEvents](v5, "shouldReceiveDeviceEvents"))
  {
    id v6 = _os_activity_create( (void *)&_mh_execute_header,  "send device started authentication event",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v11);

    uint64_t v7 = cps_service_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceClient bundleIdentifier](v5, "bundleIdentifier"));
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending device accepted notification event to client. client=%@, device=%@",  buf,  0x16u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &stru_100030BC0));
    [v10 authenticationSessionDeviceStartedAuthentication:v4];

    os_activity_scope_leave(&v11);
  }
}

- (void)authenticationSessionDidFinishWithResponse:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  [v5 authenticationSessionDidFinishWithResponse:v4];
}

- (void)authenticationSessionDidFailWithError:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  [v5 authenticationSessionDidFailWithError:v4];
}

- (CDServiceConnectionDelegate)delegate
{
  return (CDServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end