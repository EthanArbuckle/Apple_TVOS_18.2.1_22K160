@interface PBMediaRemoteService
+ (BOOL)_connectionHasValidEntitlement:(id)a3;
+ (id)_audioRoutingController;
+ (void)_updateTVAVRPowerControlAvailableState;
+ (void)_updateVolumeControlAvailableState;
+ (void)initialize;
+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (BOOL)_hasValidEntitlement;
- (NSMutableDictionary)presentationInfoByToken;
- (PBMediaRemoteService)init;
- (PBMediaRemoteService)initWithRemoteConnection:(id)a3;
- (PBSystemServiceConnection)remoteConnection;
- (void)__activateSiriWithContext:(id)a3;
- (void)__dismissPinDialogWithToken:(id)a3;
- (void)__dismissPinDialogWithToken:(id)a3 error:(id)a4;
- (void)__noteUserPresenceDetected;
- (void)__showPinDialogWithOptions:(id)a3 completion:(id)a4;
- (void)__startSiriWithContext:(id)a3;
- (void)__stopSiriWithContext:(id)a3;
- (void)__volumeControlTargetDeviceTypeWithCompletion:(id)a3;
@end

@implementation PBMediaRemoteService

- (PBMediaRemoteService)init
{
  return 0LL;
}

- (PBMediaRemoteService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBMediaRemoteService;
  v5 = -[PBMediaRemoteService init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    presentationInfoByToken = v6->_presentationInfoByToken;
    v6->_presentationInfoByToken = v7;
  }

  return v6;
}

+ (void)initialize
{
  if (dword_10046CEA8 == -1)
  {
    if (notify_register_check( (const char *)[PBSMediaRemoteServiceNotificationVolumeControlAvailable UTF8String],  &dword_10046CEA8))
    {
      dword_10046CEA8 = -1;
      id v3 = sub_1000834EC();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#Critical #SYSTEM Could not register for media remote service volume control notification",  buf,  2u);
      }
    }

    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v6 =  [v5 addObserverForName:@"PBExternalControlPolicyDidUpdateNotification" object:0 queue:0 usingBlock:&stru_1003DB218];

      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _audioRoutingController]);
      -[os_log_s fetchAvailableRoutesWithCompletionHandler:](v4, "fetchAvailableRoutesWithCompletionHandler:", 0LL);
    }
  }

  if (dword_10046CEAC == -1)
  {
    if (notify_register_check( (const char *)[PBSMediaRemoteServiceNotificationReliableTVAVRPowerControlAvailable UTF8String],  &dword_10046CEAC))
    {
      dword_10046CEAC = -1;
      id v7 = sub_1000834EC();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#Critical #SYSTEM Could not register for TV/AVR power control notification",  v10,  2u);
      }
    }

    else
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v9 =  -[os_log_s addObserverForName:object:queue:usingBlock:]( v8,  "addObserverForName:object:queue:usingBlock:",  @"PBExternalControlPolicyDidUpdateNotification",  0LL,  0LL,  &stru_1003DB238);
    }
  }

+ (id)_audioRoutingController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A3A94;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471288 != -1) {
    dispatch_once(&qword_100471288, block);
  }
  return (id)qword_100471280;
}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_10046CEB0)
  {
    objc_msgSend(a1, "_updateVolumeControlAvailableState", a3, a4, a5);
    notify_post((const char *)[PBSMediaRemoteServiceNotificationVolumeControlAvailable UTF8String]);
  }

  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___PBMediaRemoteService;
    objc_msgSendSuper2(&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }

+ (void)_updateVolumeControlAvailableState
{
  if (notify_is_valid_token(dword_10046CEA8))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
    uint64_t v3 = [v2 isReadyForUse]

    notify_set_state(dword_10046CEA8, v3);
  }

+ (void)_updateTVAVRPowerControlAvailableState
{
  if (notify_is_valid_token(dword_10046CEAC))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  0LL));
    unsigned int v3 = [v2 isReadyForUse];
    uint64_t v4 = 0LL;
    if (v3) {
      uint64_t v4 = [v2 isConfiguredForUse]
    }
    notify_set_state(dword_10046CEAC, v4);
  }

- (void)__activateSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000834EC();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    *(_DWORD *)buf = 136315394;
    v18 = "-[PBMediaRemoteService __activateSiriWithContext:]";
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_remoteConnection);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientBundleIdentifier]);
      [v4 _setRequestorBundleID:v14];

      [v4 setSourceName:PBSMediaRemoteSiriContextSourceNameMediaRemoteService];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001A3E68;
      block[3] = &unk_1003CFF08;
      v16 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      objc_super v10 = v16;
    }

    else
    {
      id v9 = sub_1000834EC();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_remoteConnection);
        v12 = (char *)objc_claimAutoreleasedReturnValue([v11 clientBundleIdentifier]);
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Activate Siri listening request by %@ ignored - system is asleep.",  buf,  0xCu);
      }
    }
  }
}

- (void)__startSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000834EC();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    *(_DWORD *)buf = 136315394;
    v18 = "-[PBMediaRemoteService __startSiriWithContext:]";
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_remoteConnection);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientBundleIdentifier]);
      [v4 _setRequestorBundleID:v14];

      [v4 setSourceName:PBSMediaRemoteSiriContextSourceNameMediaRemoteService];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001A40F8;
      block[3] = &unk_1003CFF08;
      v16 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      objc_super v10 = v16;
    }

    else
    {
      id v9 = sub_1000834EC();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_remoteConnection);
        v12 = (char *)objc_claimAutoreleasedReturnValue([v11 clientBundleIdentifier]);
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Start Siri listening request by %@ ignored - system is asleep.",  buf,  0xCu);
      }
    }
  }
}

- (void)__stopSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000834EC();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    *(_DWORD *)buf = 136315394;
    v14 = "-[PBMediaRemoteService __stopSiriWithContext:]";
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    id v9 = objc_loadWeakRetained((id *)&self->_remoteConnection);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientBundleIdentifier]);
    [v4 _setRequestorBundleID:v10];

    [v4 setSourceName:PBSMediaRemoteSiriContextSourceNameMediaRemoteService];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A42DC;
    block[3] = &unk_1003CFF08;
    id v12 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)__showPinDialogWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);

  id v10 = sub_1000834EC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[PBMediaRemoteService __showPinDialogWithOptions:completion:]";
    __int16 v22 = 2114;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PBSMediaRemoteServiceDialogOptionTokenKey]);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001A4508;
      block[3] = &unk_1003DB260;
      id v15 = v6;
      v16 = self;
      id v17 = v12;
      id v19 = v7;
      id v18 = v9;
      dispatch_async(&_dispatch_main_q, block);

      id v13 = v15;
    }

    else
    {
      if (!v7)
      {
LABEL_9:

        goto LABEL_10;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
    }

    goto LABEL_9;
  }

- (void)__dismissPinDialogWithToken:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000834EC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    int v9 = 136315394;
    id v10 = "-[PBMediaRemoteService __dismissPinDialogWithToken:]";
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[PBMediaRemoteService __dismissPinDialogWithToken:error:](self, "__dismissPinDialogWithToken:error:", v4, 0LL);
}

- (void)__dismissPinDialogWithToken:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = sub_1000834EC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    *(_DWORD *)buf = 136315394;
    id v13 = "-[PBMediaRemoteService __dismissPinDialogWithToken:error:]";
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001A4B30;
    v10[3] = &unk_1003CFEB8;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(&_dispatch_main_q, v10);
  }
}

- (void)__noteUserPresenceDetected
{
  id v3 = sub_1000834EC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    int v11 = 136315394;
    id v12 = "-[PBMediaRemoteService __noteUserPresenceDetected]";
    __int16 v13 = 2114;
    __int16 v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[PBMediaRemoteService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
    {
      dispatch_async(&_dispatch_main_q, &stru_1003DB280);
    }

    else
    {
      id v7 = sub_1000834EC();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_loadWeakRetained((id *)&self->_remoteConnection);
        id v10 = (char *)objc_claimAutoreleasedReturnValue([v9 clientBundleIdentifier]);
        int v11 = 138412290;
        id v12 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Note presence detected by %@ ignored - system is asleep.",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

- (void)__volumeControlTargetDeviceTypeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
  id v6 = [v5 volumeControlTargetDeviceType];

  id v7 = sub_1000834EC();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    int v11 = 136315650;
    id v12 = "-[PBMediaRemoteService __volumeControlTargetDeviceTypeWithCompletion:]";
    __int16 v13 = 2114;
    __int16 v14 = v10;
    __int16 v15 = 2048;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s from %{public}@ type:%ld",  (uint8_t *)&v11,  0x20u);
  }

  if (v4) {
    v4[2](v4, v6);
  }
}

- (BOOL)_hasValidEntitlement
{
  id v3 = (void *)objc_opt_class(self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  LOBYTE(v3) = [v3 _connectionHasValidEntitlement:WeakRetained];

  return (char)v3;
}

+ (BOOL)_connectionHasValidEntitlement:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteConnection]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.appletv.pbs.mediaremote"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v7 = sub_10008330C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028AF1C(v3, v8);
    }
  }

  return v6;
}

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (NSMutableDictionary)presentationInfoByToken
{
  return self->_presentationInfoByToken;
}

- (void).cxx_destruct
{
}

@end