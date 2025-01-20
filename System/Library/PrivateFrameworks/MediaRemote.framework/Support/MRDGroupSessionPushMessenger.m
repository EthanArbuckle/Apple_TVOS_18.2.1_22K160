@interface MRDGroupSessionPushMessenger
- (IDSFirewall)firewall;
- (IDSService)service;
- (MRDGroupSessionPushMessenger)initWithService:(id)a3 handle:(id)a4 queue:(id)a5 messageHandler:(id)a6 errorHandler:(id)a7;
- (NSArray)allowedDestinations;
- (NSString)handle;
- (OS_dispatch_queue)queue;
- (id)errorHandler;
- (id)messageHandler;
- (void)_updateAllowedDestinations:(id)a3;
- (void)sendMessage:(id)a3 toDestinations:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setAllowedDestinations:(id)a3;
- (void)setFirewall:(id)a3;
- (void)updateAllowedDestinations:(id)a3;
@end

@implementation MRDGroupSessionPushMessenger

- (MRDGroupSessionPushMessenger)initWithService:(id)a3 handle:(id)a4 queue:(id)a5 messageHandler:(id)a6 errorHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MRDGroupSessionPushMessenger;
  v18 = -[MRDGroupSessionPushMessenger init](&v30, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_service, a3);
    objc_storeStrong((id *)&v19->_handle, a4);
    objc_storeStrong((id *)&v19->_queue, a5);
    id v20 = objc_retainBlock(v16);
    id messageHandler = v19->_messageHandler;
    v19->_id messageHandler = v20;

    id v22 = objc_retainBlock(v17);
    id errorHandler = v19->_errorHandler;
    v19->_id errorHandler = v22;

    id v24 = objc_alloc_init(&OBJC_CLASS___IDSServiceDelegateProperties);
    [v24 setWantsCrossAccountMessaging:1];
    [v13 addDelegate:v19 withDelegateProperties:v24 queue:v15];
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v26 = [v25 supportGroupSessionOfframp];

    if (v26)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10011EBC8;
      v28[3] = &unk_1003A1790;
      v29 = v19;
      [v13 retrieveFirewallWithQueue:v15 completion:v28];
    }
  }

  return v19;
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger service](self, "service"));
  uint64_t v27 = IDSSendMessageOptionFromIDKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger handle](self, "handle"));
  v28 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v17 = 0LL;
  id v18 = 0LL;
  [v8 sendMessage:v6 toDestinations:v7 priority:300 options:v10 identifier:&v18 error:&v17];
  id v11 = v18;
  id v12 = v17;

  uint64_t v14 = _MRLogForCategory(12LL, v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionPushMessenger] Sent push message: %@ with identifier: %@, to: %@. Error: %@",  buf,  0x2Au);
  }

  if (v12)
  {
    id v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger errorHandler](self, "errorHandler"));
    ((void (**)(void, id))v16)[2](v16, v12);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v14 = _MRLogForCategory(12LL, v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412802;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionPushMessenger] Receive push message: %@ with context: %@, from: %@",  (uint8_t *)&v17,  0x20u);
  }

  id v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MRDGroupSessionPushMessenger messageHandler]( self,  "messageHandler"));
  ((void (**)(void, id, id))v16)[2](v16, v11, v10);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  uint64_t v16 = _MRLogForCategory(12LL, v15);
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 138413058;
    id v20 = v12;
    __int16 v21 = 1024;
    BOOL v22 = v10;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionPushMessenger] Sending of: %@ success: %{BOOL}u, error: %@, context: %@",  (uint8_t *)&v19,  0x26u);
  }

  if (v13)
  {
    id v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger errorHandler](self, "errorHandler"));
    ((void (**)(void, id))v18)[2](v18, v13);
  }
}

- (void)updateAllowedDestinations:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011F110;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateAllowedDestinations:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[MRDGroupSessionPushMessenger setAllowedDestinations:](self, "setAllowedDestinations:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger firewall](self, "firewall"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_compactMap:", &stru_1003A17D0));
    uint64_t v9 = _MRLogForCategory(12LL, v8);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionPushMessenger] Update firewall entries: %{public}@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionPushMessenger firewall](self, "firewall"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10011F2E8;
    v12[3] = &unk_100399508;
    v12[4] = self;
    [v11 replaceDonatedEntriesWithEntries:v7 withCompletion:v12];
  }
}

- (IDSService)service
{
  return self->_service;
}

- (NSString)handle
{
  return self->_handle;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (IDSFirewall)firewall
{
  return self->_firewall;
}

- (void)setFirewall:(id)a3
{
}

- (NSArray)allowedDestinations
{
  return self->_allowedDestinations;
}

- (void)setAllowedDestinations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end