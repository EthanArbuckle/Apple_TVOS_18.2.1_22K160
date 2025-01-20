@interface TVRDCompanionEventManager
@end

@implementation TVRDCompanionEventManager

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = _TVRDXPCLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __38__TVRDCompanionEventManager_tvOS_init__block_invoke_cold_1();
      }
    }

    else
    {
      [WeakRetained _startMonitoringTVStatus];
    }
  }
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _TVRDXPCLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "companionLinkClient invalidationHandler",  v4,  2u);
    }

    [WeakRetained tearDown];
  }
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _TVRDXPCLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "companionLinkClient interruptionHandler",  v4,  2u);
    }
  }
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendSupportedActions];
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _sendNowPlayingInfo:v3];
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained nowPlayingMonitor]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentNowPlayingInfo]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 canonicalID]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 appServicesUpNextController]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_4;
    v14[3] = &unk_100020E68;
    id v15 = v6;
    [v13 fetchUpNextWithPaginationToken:v5 playerContentId:v12 completion:v14];
  }
}

uint64_t __38__TVRDCompanionEventManager_tvOS_init__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 siriInfo]);
    id v6 = _TVRDXPCLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "siriInfo Dict: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained siriStatusDict]);
    unsigned __int8 v9 = [v8 isEqualToDictionary:v5];

    if ((v9 & 1) == 0)
    {
      [WeakRetained setSiriStatusDict:v5];
      [WeakRetained _sendSiriStatus:v5];
    }
  }
}

void __68__TVRDCompanionEventManager_tvOS_broadcastEventToInterestedDevices___block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRDXPCLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__TVRDCompanionEventManager_tvOS_broadcastEventToInterestedDevices___block_invoke_cold_1();
    }
  }
}

void __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_2;
  block[3] = &unk_100020BA0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

void __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tvSystemMonitor]);
  id v3 = [v2 attentionState];

  v8 = @"state";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
  unsigned __int8 v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  id v6 = *(void **)(*(void *)(a1 + 32) + 24LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_3;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = v3;
  [v6 sendEventID:TVRCSystemStatus event:v5 destinationID:RPDestinationIdentifierInterestedPeers options:0 completion:v7];
}

void __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _TVRDXPCLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_3_cold_1();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = *(void *)(a1 + 32) - 1LL;
    if (v7 >= 3) {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  *(void *)(a1 + 32)));
    }
    else {
      v8 = *(&off_100021110 + v7);
    }
    *(_DWORD *)buf = 138412290;
    int v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sent %@ state to interested peers", buf, 0xCu);
  }
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke( id a1,  NSDictionary *a2,  NSDictionary *a3,  id a4)
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRDXPCLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = TVRCSessionStart;
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", RPOptionSenderID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", RPOptionSenderDeviceName));
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v12,  0x20u);
  }

  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
  +[TVRDKeepAlive enable](&OBJC_CLASS____TtC9tvremoted13TVRDKeepAlive, "enable");
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_118( id a1,  NSDictionary *a2,  NSDictionary *a3,  id a4)
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRDXPCLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = TVRCSessionStop;
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", RPOptionSenderID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", RPOptionSenderDeviceName));
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v12,  0x20u);
  }

  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
  +[TVRDKeepAlive disable](&OBJC_CLASS____TtC9tvremoted13TVRDKeepAlive, "disable");
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_120( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = TVRCFetchLaunchableApplicationsEvent;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v15,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _fetchLaunchableApplications]);
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v14, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_121( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = TVRCFetchUserAccountsEvent;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v15,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _fetchUserAccounts]);
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v14, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_122( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = _TVRDXPCLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TVRCSwitchUserAccountEvent;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:TVRCSwitchAccountID]);
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _switchToUserAccountWithID:v15];
  }

  else
  {
    id v17 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_122_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_123( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = _TVRDXPCLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TVRCToggleCaptions;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v23 = 138543874;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    v26 = v13;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v23,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:TVRCCaptionsEnabled]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
  id v17 = v15;
  int v18 = v17;
  if (v16)
  {
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  id v20 = v19;

  if (v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_toggleCaptionsIfNeeded:", objc_msgSend(v20, "BOOLValue"));
  }

  else
  {
    id v22 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_123_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_125( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = _TVRDXPCLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TVRCToggleReduceLoudSounds;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    int v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:TVRCReduceLoundSoundsEnabled]);
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_enableReduceLoudSounds:", objc_msgSend(v15, "BOOLValue"));
  }

  else
  {
    id v17 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_125_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_126( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = _TVRDXPCLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TVRCToggleSystemAppearance;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    int v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:TVRCSystemAppearanceLight]);
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_switchSystemAppearenceMode:", objc_msgSend(v15, "BOOLValue"));
  }

  else
  {
    id v17 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_125_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_127( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)TVRCFetchAttentionState;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    *(_DWORD *)buf = 138543874;
    int v23 = v10;
    __int16 v24 = 2114;
    __int16 v25 = v11;
    __int16 v26 = 2112;
    __int16 v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  buf,  0x20u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tvSystemMonitor]);
  __int16 v14 = (char *)[v13 attentionState];

  __int16 v20 = @"state";
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
  v21 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v16, 0LL, 0LL);
  id v17 = _TVRDXPCLog();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(v14 - 1) >= 3) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v14));
    }
    else {
      uint64_t v19 = *(&off_100021110 + (void)(v14 - 1));
    }
    *(_DWORD *)buf = 138412290;
    int v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sent %@ attention state", buf, 0xCu);
  }
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_128( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = _TVRDXPCLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TVRCSwitchActiveUserAccountEvent;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    int v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:TVRCiCloudAltDSID]);
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _switchToUserAccountWithAltDSID:v15];
  }

  else
  {
    id v17 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_128_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_129( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)TVRCFetchSiriRemoteInfo;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v11;
    __int16 v22 = 2112;
    int v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _currentSiriRemoteInfoDictionary]);

  id v15 = _TVRDXPCLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending remoteInfo :%@", (uint8_t *)&v18, 0xCu);
  }

  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = &__NSDictionary0__struct;
  }
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v17, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_130( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  uint64_t v8 = TVRCFindingModeEnabledKey;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:v8]);
  id v11 = _TVRDXPCLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = TVRCToggleFindingMode;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138544130;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    v21 = v14;
    __int16 v22 = 2112;
    int v23 = v15;
    __int16 v24 = 2114;
    __int16 v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@) - enable: %{public}@",  (uint8_t *)&v18,  0x2Au);
  }

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_enableFindingMode:", objc_msgSend(v10, "BOOLValue"));
  }

  else
  {
    id v17 = _TVRDXPCLog();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_130_cold_1();
    }
  }

  (*((void (**)(id, void *, void, void))v9 + 2))(v9, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_131( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)TVRCFetchSiriStatus;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v18 = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v11;
    __int16 v22 = 2112;
    int v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v18,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained siriStatusDict]);

  id v15 = _TVRDXPCLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Sending siri status dict :%@",  (uint8_t *)&v18,  0xCu);
  }

  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = &__NSDictionary0__struct;
  }
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v17, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_132( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = TVRCFetchCurrentNowPlayingInfoEvent;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    int v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v15,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _sendNowPlayingInfo];
  }
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_133( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = TVRCFetchSupportedActionsEvent;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RPOptionSenderDeviceName]);
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    int v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %{public}@ request from %{public}@ (%@)",  (uint8_t *)&v15,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v14 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _sendSupportedActions];
  }
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_134( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVRCPaginationTokenKey]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNull);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {

      id v9 = 0LL;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upNextController]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2;
    v12[3] = &unk_100020E68;
    id v13 = v7;
    [v11 fetchUpNextInfosWithPaginationToken:v9 completion:v12];
  }
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2( uint64_t a1,  void *a2,  void *a3,  uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v24 = a1;
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v25 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v26 = 0LL;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v15,  1LL,  &v26));
          id v17 = v26;
          int v18 = v17;
          if (v16) {
            BOOL v19 = v17 == 0LL;
          }
          else {
            BOOL v19 = 0;
          }
          if (v19)
          {
            -[NSMutableArray addObject:](v9, "addObject:", v16);
          }

          else
          {
            id v20 = _TVRDXPCLog();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v34 = v18;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to archive upNext info: %{public}@",  buf,  0xCu);
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v12);
    }

    v31[0] = TVRCPaginationTokenKey;
    __int16 v22 = v7;
    if (!v7) {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v31[1] = TVRCUpNextInfosKey;
    v32[0] = v22;
    v32[1] = v9;
    int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
    if (!v7) {

    }
    (*(void (**)(void))(*(void *)(v24 + 32) + 16LL))();
    id v8 = v25;
  }
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_138( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVRCIdentifierKey]);
    if ([v9 length])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upNextController]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_139;
      v14[3] = &unk_100020FF8;
      id v15 = v7;
      [v10 addItemWithMediaIdentifier:v9 completion:v14];
    }

    else
    {
      id v11 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: addToUpNext was sent without a mediaIdentifier.",  v13,  2u);
      }

      (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
    }
  }
}

uint64_t __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_139(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_140( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVRCIdentifierKey]);
    if ([v9 length])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upNextController]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_141;
      v14[3] = &unk_100020FF8;
      id v15 = v7;
      [v10 removeItemWithMediaIdentifier:v9 completion:v14];
    }

    else
    {
      id v11 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: removeFromUpNext was sent without a mediaIdentifier.",  v13,  2u);
      }

      (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
    }
  }
}

uint64_t __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_142( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVRCIdentifierKey]);
    if ([v9 length])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upNextController]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_143;
      v14[3] = &unk_100020FF8;
      id v15 = v7;
      [v10 markAsWatchedWithMediaIdentifier:v9 completion:v14];
    }

    else
    {
      id v11 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: markAsWatched was sent without a mediaIdentifier.",  v13,  2u);
      }

      (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
    }
  }
}

uint64_t __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_144( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVRCPlayItemInfo playItemWithDictionary:]( &OBJC_CLASS___TVRCPlayItemInfo,  "playItemWithDictionary:",  v6));
    if ([v9 isValid])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upNextController]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_146;
      v14[3] = &unk_100020FF8;
      id v15 = v7;
      [v10 playItem:v9 completion:v14];
    }

    else
    {
      id v11 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: playMedia was sent an invalid item...",  v13,  2u);
      }

      (*((void (**)(id, void *, void, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL, 0LL);
    }
  }
}

uint64_t __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_2_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __53__TVRDCompanionEventManager_tvOS__pushSiriRemoteInfo__block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRDXPCLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__TVRDCompanionEventManager_tvOS__pushSiriRemoteInfo__block_invoke_cold_1();
    }
  }
}

void __53__TVRDCompanionEventManager_tvOS__sendNowPlayingInfo__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) currentNowPlayingInfo]);
  [*(id *)(a1 + 32) _sendNowPlayingInfo:v2];
}

void __54__TVRDCompanionEventManager_tvOS__sendNowPlayingInfo___block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRDXPCLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__TVRDCompanionEventManager_tvOS__sendNowPlayingInfo___block_invoke_cold_1();
    }
  }
}

void __55__TVRDCompanionEventManager_tvOS__sendSupportedActions__block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRDXPCLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__TVRDCompanionEventManager_tvOS__sendSupportedActions__block_invoke_cold_1();
    }
  }
}

void __50__TVRDCompanionEventManager_tvOS__sendSiriStatus___block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRDXPCLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__TVRDCompanionEventManager_tvOS__sendSiriStatus___block_invoke_cold_1();
    }
  }
}

id __81__TVRDCompanionEventManager_tvOS_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushSiriRemoteInfo];
}

void __52__TVRDCompanionEventManager_tvOS__fetchUserAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [[PBSUserProfileAccountInfo alloc] initWithAccountStore:*(void *)(a1 + 32) userProfile:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formattedFullName]);
  if (v8)
  {
    [*(id *)(a1 + 40) setObject:v8 forKey:v5];
  }

  else
  {
    id v9 = _TVRDXPCLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__TVRDCompanionEventManager_tvOS__fetchUserAccounts__block_invoke_cold_1();
    }
  }
}

void __61__TVRDCompanionEventManager_tvOS__switchToUserAccountWithID___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  id v6 = _TVRDXPCLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finished selecting user profile. {identifier=%@}",  (uint8_t *)&v10,  0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __61__TVRDCompanionEventManager_tvOS__switchToUserAccountWithID___block_invoke_cold_1(a1, (uint64_t)v5, v8);
  }
}

void __66__TVRDCompanionEventManager_tvOS__switchToUserAccountWithAltDSID___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAltDSID]);
  unsigned int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    id v10 = _TVRDXPCLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      int v13 = 138412290;
      __int16 v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Found userProfile with id:%@",  (uint8_t *)&v13,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    *a4 = 1;
  }
}

void __38__TVRDCompanionEventManager_tvOS_init__block_invoke_cold_1()
{
}

void __68__TVRDCompanionEventManager_tvOS_broadcastEventToInterestedDevices___block_invoke_cold_1()
{
}

void __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke_3_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_122_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_123_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_125_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_128_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_130_cold_1()
{
}

void __53__TVRDCompanionEventManager_tvOS__pushSiriRemoteInfo__block_invoke_cold_1()
{
}

void __54__TVRDCompanionEventManager_tvOS__sendNowPlayingInfo___block_invoke_cold_1()
{
}

void __55__TVRDCompanionEventManager_tvOS__sendSupportedActions__block_invoke_cold_1()
{
}

void __50__TVRDCompanionEventManager_tvOS__sendSiriStatus___block_invoke_cold_1()
{
}

void __52__TVRDCompanionEventManager_tvOS__fetchUserAccounts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to fetch user profile display name. {identifier=%@}",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void __61__TVRDCompanionEventManager_tvOS__switchToUserAccountWithID___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_6( (void *)&_mh_execute_header,  a2,  a3,  "Failed to select user profile. {identifier=%@, error=%@}",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end