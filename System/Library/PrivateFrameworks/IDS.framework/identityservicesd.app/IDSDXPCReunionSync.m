@interface IDSDXPCReunionSync
- (BOOL)_isEntitledForPreferInfraWiFiForServices:(id)a3 error:(id *)a4;
- (IDSDXPCReunionSync)initWithConnection:(id)a3 clientProcessName:(id)a4 UTunDeliveryController:(id)a5 duetInterface:(id)a6;
- (IDSDuetInterface)duetInterface;
- (IDSUTunDeliveryController)utunDeliveryController;
- (IDSXPCConnection)connection;
- (NSString)clientProcessName;
- (void)_defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)reunionSyncCompletedForServices:(id)a3 withCompletion:(id)a4;
- (void)reunionSyncStartedForServices:(id)a3 withCompletion:(id)a4;
- (void)setClientProcessName:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDuetInterface:(id)a3;
- (void)setUtunDeliveryController:(id)a3;
@end

@implementation IDSDXPCReunionSync

- (IDSDXPCReunionSync)initWithConnection:(id)a3 clientProcessName:(id)a4 UTunDeliveryController:(id)a5 duetInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSDXPCReunionSync;
  v15 = -[IDSDXPCReunionSync init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientProcessName, a4);
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_utunDeliveryController, a5);
    objc_storeStrong((id *)&v16->_duetInterface, a6);
  }

  return v16;
}

- (void)reunionSyncStartedForServices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LocalSetup");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reunion: %s services: %@", buf, 0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      v16 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
      id v17 = v6;
      _IDSLogTransport(@"LocalSetup", @"IDS", @"Reunion: %s services: %@");
      if (_IDSShouldLog(0LL, @"LocalSetup"))
      {
        v16 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
        id v17 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"LocalSetup", @"Reunion: %s services: %@");
      }
    }
  }

  id v18 = 0LL;
  unsigned int v12 = -[IDSDXPCReunionSync _isEntitledForPreferInfraWiFiForServices:error:]( self,  "_isEntitledForPreferInfraWiFiForServices:error:",  v6,  &v18,  v16,  v17);
  id v13 = v18;
  if (v12)
  {
    -[IDSDXPCReunionSync _defaultPeerSetPreferInfraWiFi:services:]( self,  "_defaultPeerSetPreferInfraWiFi:services:",  1LL,  v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync duetInterface](self, "duetInterface"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync clientProcessName](self, "clientProcessName"));
    [v14 setReunionSyncInProgress:1 forClientID:v15];
  }

  v7[2](v7, v13);
}

- (void)reunionSyncCompletedForServices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LocalSetup");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reunion: %s services: %@", buf, 0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      v16 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
      id v17 = v6;
      _IDSLogTransport(@"LocalSetup", @"IDS", @"Reunion: %s services: %@");
      if (_IDSShouldLog(0LL, @"LocalSetup"))
      {
        v16 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
        id v17 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"LocalSetup", @"Reunion: %s services: %@");
      }
    }
  }

  id v18 = 0LL;
  unsigned int v12 = -[IDSDXPCReunionSync _isEntitledForPreferInfraWiFiForServices:error:]( self,  "_isEntitledForPreferInfraWiFiForServices:error:",  v6,  &v18,  v16,  v17);
  id v13 = v18;
  if (v12)
  {
    -[IDSDXPCReunionSync _defaultPeerSetPreferInfraWiFi:services:]( self,  "_defaultPeerSetPreferInfraWiFi:services:",  0LL,  v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync duetInterface](self, "duetInterface"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync clientProcessName](self, "clientProcessName"));
    [v14 setReunionSyncInProgress:0 forClientID:v15];
  }

  v7[2](v7, v13);
}

- (void)_defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync utunDeliveryController](self, "utunDeliveryController"));
    [v6 defaultPeerSetPreferInfraWiFi:v4 services:v7];
  }
}

- (BOOL)_isEntitledForPreferInfraWiFiForServices:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCReunionSync connection](self, "connection"));
    unsigned int v7 = [v6 hasEntitlement:kIDSPreferInfraWiFiEntitlement];

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ReunionSync has entitlemnt for non-empty service list {entitlement: com.apple.private.ids.prefer-infrawifi, se rvices: %{public}@}",  (uint8_t *)&v11,  0xCu);
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_10069C924((uint64_t)v5, v9);
    }
  }

  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSUTunDeliveryController)utunDeliveryController
{
  return self->_utunDeliveryController;
}

- (void)setUtunDeliveryController:(id)a3
{
}

- (IDSDuetInterface)duetInterface
{
  return self->_duetInterface;
}

- (void)setDuetInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end