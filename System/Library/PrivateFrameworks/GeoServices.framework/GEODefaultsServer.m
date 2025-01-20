@interface GEODefaultsServer
+ (id)_acceptableKeys;
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)_validatePeer:(id)a3 canSetKey:(id)a4 error:(id *)a5;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEODefaultsServer)initWithDaemon:(id)a3;
- (void)_configKeysChanged:(id)a3;
- (void)_experimentChanged:(id)a3;
- (void)_expiringKeysChanged:(id)a3;
- (void)_networkDefaultsChanged:(id)a3;
- (void)_notifyChangedKeys:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5 triggerWatchSync:(BOOL)a6;
- (void)_notifyListenersOfKeysChange:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5;
- (void)addChangeListenerForWithRequest:(id)a3;
- (void)clearExpiredKeyWithRequest:(id)a3;
- (void)dealloc;
- (void)getAllExpiringKeysWithRequest:(id)a3;
- (void)getAllValuesInStoreWithRequest:(id)a3;
- (void)getConfigValueForKeyWithRequest:(id)a3;
- (void)migrageEntitledKeyWithRequest:(id)a3;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)removeChangeListenerForWithRequest:(id)a3;
- (void)resetAllDefaultsWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setAllValuesInStoreWithRequest:(id)a3;
- (void)setConfigValueForKeyWithRequest:(id)a3;
- (void)setExpiringKeyWithRequest:(id)a3;
- (void)updateNetworkDefaultsWithMessage:(id)a3;
@end

@implementation GEODefaultsServer

+ (id)identifier
{
  return @"defaults";
}

+ (unint64_t)launchMode
{
  return 2LL;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_10005E448;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 > 1944)
  {
    if (v13 > 2030)
    {
      switch(v13)
      {
        case 2031:
          uint64_t v44 = objc_opt_class(&OBJC_CLASS___GEOConfigStorageSetValueForKeyRequest, v14, v15);
          id v45 = sub_100012270(@"defaults", v10, v11, v44, v12);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          v18 = v46;
          BOOL v16 = v46 != 0LL;
          if (v46)
          {
            [v46 setSignpostId:a6];
            -[GEODefaultsServer setConfigValueForKeyWithRequest:](self, "setConfigValueForKeyWithRequest:", v18);
            goto LABEL_40;
          }

          goto LABEL_41;
        case 2369:
          uint64_t v47 = objc_opt_class(&OBJC_CLASS___GEOConfigRemoveChangeListenerRequest, v14, v15);
          id v48 = sub_100012270(@"defaults", v10, v11, v47, v12);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          v18 = v49;
          BOOL v16 = v49 != 0LL;
          if (v49)
          {
            [v49 setSignpostId:a6];
            -[GEODefaultsServer removeChangeListenerForWithRequest:](self, "removeChangeListenerForWithRequest:", v18);
            goto LABEL_40;
          }

          goto LABEL_41;
        case 2213:
          id v25 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          v18 = v25;
          BOOL v16 = v25 != 0LL;
          if (v25)
          {
            [v25 setSignpostId:a6];
            -[GEODefaultsServer updateNetworkDefaultsWithMessage:](self, "updateNetworkDefaultsWithMessage:", v18);
            goto LABEL_40;
          }

          goto LABEL_41;
      }
    }

    else
    {
      switch(v13)
      {
        case 1945:
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___GEOConfigSetAllValueInStoreRequest, v14, v15);
          id v33 = sub_100012270(@"defaults", v10, v11, v32, v12);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v18 = v34;
          BOOL v16 = v34 != 0LL;
          if (v34)
          {
            [v34 setSignpostId:a6];
            -[GEODefaultsServer setAllValuesInStoreWithRequest:](self, "setAllValuesInStoreWithRequest:", v18);
            goto LABEL_40;
          }

          goto LABEL_41;
        case 2012:
          uint64_t v35 = objc_opt_class(&OBJC_CLASS___GEOConfigAddChangeListenerRequest, v14, v15);
          id v36 = sub_100012270(@"defaults", v10, v11, v35, v12);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          v18 = v37;
          BOOL v16 = v37 != 0LL;
          if (v37)
          {
            [v37 setSignpostId:a6];
            -[GEODefaultsServer addChangeListenerForWithRequest:](self, "addChangeListenerForWithRequest:", v18);
            goto LABEL_40;
          }

          goto LABEL_41;
        case 2019:
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___GEOConfigStorageGetValueForKeyRequest, v14, v15);
          id v20 = sub_100012270(@"defaults", v10, v11, v19, v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v18 = v21;
          BOOL v16 = v21 != 0LL;
          if (v21)
          {
            [v21 setSignpostId:a6];
            -[GEODefaultsServer getConfigValueForKeyWithRequest:](self, "getConfigValueForKeyWithRequest:", v18);
            goto LABEL_40;
          }

+ (id)_acceptableKeys
{
  if (qword_10006B018 != -1) {
    dispatch_once(&qword_10006B018, &stru_100059E80);
  }
  return (id)qword_10006B010;
}

- (GEODefaultsServer)initWithDaemon:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GEODefaultsServer;
  v3 = -[GEODefaultsServer initWithDaemon:](&v20, "initWithDaemon:", a3);
  if (v3)
  {
    uint64_t v4 = geo_isolater_create("DefaultsServer");
    peersIsolater = v3->_peersIsolater;
    v3->_peersIsolater = (geo_isolater *)v4;

    v6 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  517LL,  0LL,  10LL);
    peerHelpers = v3->_peerHelpers;
    v3->_peerHelpers = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v3 selector:"_networkDefaultsChanged:" name:GEONetworkDefaultsDidChangeInternalNotificationName object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v3 selector:"_experimentChanged:" name:@"GEOExperimentInfoChangedInternalNotification" object:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v3 selector:"_configKeysChanged:" name:_GEOConfigKeysChangedNotification object:0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v3 selector:"_expiringKeysChanged:" name:_GEOConfigExpireChangedNotification object:0];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEODefaultsServer daemon](v3, "daemon"));
    int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 serverQueue]);
    notify_register_dispatch("com.apple.GeoServices.PreferencesSync.SettingsChanged", &out_token, v13, &stru_100059EC0);

    global_queue = (void *)geo_get_global_queue(21LL);
    uint64_t v15 = GEORegisterPListStateCaptureAtFrequency(1LL, global_queue, v3, @"Defaults+Configs");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    stateCaptureHandle = v3->_stateCaptureHandle;
    v3->_stateCaptureHandle = (geo_state_capture_handle *)v16;
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEODefaultsServer;
  -[GEODefaultsServer dealloc](&v4, "dealloc");
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  if (sub_100017C50(0LL))
  {
    id v2 = [sub_100017D6C() sharedScheduler];
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    objc_super v4 = (const __CFString *)GEOUpdateNetworkDefaultsTaskIdentifier;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 taskRequestForIdentifier:GEOUpdateNetworkDefaultsTaskIdentifier]);
    if (v5)
    {
      uint64_t v6 = GEOGetUserDefaultsLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "NetworkDefaults background task is already scheduled (%{public}@)",  buf,  0xCu);
      }
    }

    else
    {
      v7 = (os_log_s *)[objc_alloc((Class)sub_100017F7C()) initWithIdentifier:v4];
      -[os_log_s setPriority:](v7, "setPriority:", 2LL);
      -[os_log_s setRequiresExternalPower:](v7, "setRequiresExternalPower:", 0LL);
      -[os_log_s setRequiresNetworkConnectivity:](v7, "setRequiresNetworkConnectivity:", 1LL);
      -[os_log_s setNetworkDownloadSize:](v7, "setNetworkDownloadSize:", 10240LL);
      -[os_log_s setPreventsDeviceSleep:](v7, "setPreventsDeviceSleep:", 1LL);
      -[os_log_s setPowerBudgeted:](v7, "setPowerBudgeted:", 1LL);
      -[os_log_s setInterval:](v7, "setInterval:", 21600.0);
      id v13 = 0LL;
      unsigned __int8 v8 = [v3 submitTaskRequest:v7 error:&v13];
      v9 = (__CFString *)v13;
      if ((v8 & 1) == 0)
      {
        uint64_t v10 = GEOGetUserDefaultsLog();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = @"Unknown";
          if (v9) {
            id v12 = v9;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to submit repeating task with error: %@",  buf,  0xCu);
        }
      }
    }
  }

- (BOOL)_validatePeer:(id)a3 canSetKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![v8 length])
  {
    unsigned __int8 v10 = 0;
    goto LABEL_6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEODefaultsServer _acceptableKeys](&OBJC_CLASS___GEODefaultsServer, "_acceptableKeys"));
  unsigned __int8 v10 = [v9 containsObject:v8];
  if ((v10 & 1) == 0)
  {
    unsigned __int8 v11 = [v7 hasEntitlement:@"com.apple.geoservices.setanydefault"];

    if ((v11 & 1) != 0
      || [v8 isEqualToString:GEOAddressCorrectionAuthorizationStatusKey]
      && ([v7 hasEntitlement:@"com.apple.CoreRoutine.preferences"] & 1) != 0
      || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"application-identifier"]),
          unsigned int v14 = [v13 isEqualToString:@"com.apple.TVSettings"],
          v13,
          v14)
      && (([v8 isEqualToString:GEOResourceManifestEnvironmentKey] & 1) != 0
       || ([v8 isEqualToString:GEOResourceManifestURLKey] & 1) != 0
       || ([v8 isEqualToString:GEODisableUpdatingActiveTileGroupKey] & 1) != 0
       || ([v8 isEqualToString:GEOCustomEnvironmentConfigurationKey] & 1) != 0
       || ([v8 isEqualToString:@"GEOUseProductionURLs"] & 1) != 0
       || ([v8 isEqualToString:@"ShouldOverrideCountryCode"] & 1) != 0
       || ([v8 isEqualToString:@"OverrideCountryCode"] & 1) != 0))
    {
      unsigned __int8 v10 = 1;
      goto LABEL_6;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot set value for invalid key: %@, missing entitlement?",  v8));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  v9));
  }

LABEL_6:
  return v10;
}

- (void)updateNetworkDefaultsWithMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = GEOGetUserDefaultsLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating network defaults", buf, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"reason"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    uint64_t v10 = (uint64_t)[v7 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = 4LL;
  }
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkDefaults sharedNetworkDefaults](&OBJC_CLASS___GEONetworkDefaults, "sharedNetworkDefaults"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100020154;
  v13[3] = &unk_100059168;
  id v14 = v3;
  id v12 = v3;
  [v11 updateNetworkDefaultsWithReason:v10 completionHandler:v13];
}

- (void)resetAllDefaultsWithMessage:(id)a3
{
  id v3 = a3;
  _GEOResetAllDefaults(1LL);
  [v3 sendReply:&__NSDictionary0__struct];
}

- (void)_networkDefaultsChanged:(id)a3
{
}

- (void)_experimentChanged:(id)a3
{
}

- (void)_configKeysChanged:(id)a3
{
  id v4 = a3;
  v5 = (GEODefaultsServer *)objc_claimAutoreleasedReturnValue([v4 object]);

  if (v5 != self)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"options"]);

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0 && (id v10 = [v7 integerValue]) != 0)
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"keys"]);
      -[GEODefaultsServer _notifyListenersOfKeysChange:options:postInternalNotification:]( self,  "_notifyListenersOfKeysChange:options:postInternalNotification:",  v13,  v11,  0LL);
    }

    else
    {
      BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v14) {
        sub_10003ADA0(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
}

- (void)_expiringKeysChanged:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"keys"]);

  if ([v6 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"options"]);
    id v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x3032000000LL;
      id v39 = sub_10002056C;
      v40 = sub_10002057C;
      id v41 = 0LL;
      peersIsolater = self->_peersIsolater;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100020584;
      v35[3] = &unk_1000591B8;
      v35[4] = self;
      v35[5] = &v36;
      geo_isolate_sync(peersIsolater, v35);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v11 = (id)v37[5];
      id v12 = [v11 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v32;
        do
        {
          BOOL v14 = 0LL;
          do
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v11);
            }
            sub_1000205E4(*(void **)(*((void *)&v31 + 1) + 8LL * (void)v14), v6, (int)v9);
            BOOL v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }

        while (v12);
      }

      _Block_object_dispose(&v36, 8);
    }

    else
    {
      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v23) {
        sub_10003ADA0(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }

  else
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v15) {
      sub_10003ADD4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (void)_notifyChangedKeys:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5 triggerWatchSync:(BOOL)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v18 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSKeyValueChangeOldKey]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSKeyValueChangeNewKey]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 countryCode]);
  uint64_t v15 = GEOCalculateChangedKeys(v18, v12, v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
  -[GEODefaultsServer _notifyListenersOfKeysChange:options:postInternalNotification:]( self,  "_notifyListenersOfKeysChange:options:postInternalNotification:",  v17,  a4,  v6);
}

- (void)_notifyListenersOfKeysChange:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 count])
  {
    if (v5) {
      _GEOConfigPostKeysChangedNotification(v8, a4);
    }
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = sub_10002056C;
    BOOL v23 = sub_10002057C;
    id v24 = 0LL;
    peersIsolater = self->_peersIsolater;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100020948;
    v18[3] = &unk_1000591B8;
    v18[4] = self;
    v18[5] = &v19;
    geo_isolate_sync(peersIsolater, v18);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v10 = (id)v20[5];
    id v11 = [v10 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          sub_1000209A8(*(void **)(*((void *)&v14 + 1) + 8LL * (void)v13), v8, a4);
          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }

      while (v11);
    }

    _Block_object_dispose(&v19, 8);
  }
}

- (void)clearExpiredKeyWithRequest:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 keyString]);
  id v4 = [v3 keyOptions];

  _GEOConfigClearExpiredKey(v5, v4);
}

- (void)getAllValuesInStoreWithRequest:(id)a3
{
  id v3 = a3;
  id v9 = [[GEOConfigGetAllValueInStoreReply alloc] initWithRequest:v3];
  uint64_t v4 = _GEOGetAllValuesInStore([v3 keyOptions]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);

  uint64_t v7 = GEOConfig_pruneEntitledKeysForAuditToken(v5, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 setKeyStringsAndValues:v8];

  [v9 send];
}

- (void)setAllValuesInStoreWithRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peer]);
  unsigned __int8 v5 = [v4 hasEntitlement:@"com.apple.geoservices.setanydefault"];

  if ((v5 & 1) != 0)
  {
    id v6 = [v3 keyOptions];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 keyStringsAndValues]);
    _GEOSetAllValuesInStore(v6, v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManager]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManager"));
    [v8 updateManifestIfNecessary:0];
  }

  else
  {
    uint64_t v9 = GEOGetUserDefaultsLog();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = @"com.apple.geoservices.setanydefault";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Missing entitlement: %@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)getAllExpiringKeysWithRequest:(id)a3
{
  id v3 = a3;
  id v9 = [[GEOConfigGetExpiringKeysReply alloc] initWithRequest:v3];
  uint64_t v4 = _GEOConfigProxy();
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 keyOptions];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 configExpiryForOptions:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getAllExpiringKeys]);
  [v9 setExpiringKeys:v8];

  [v9 send];
}

- (void)setExpiringKeyWithRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyString]);
  uint64_t v13 = 0LL;
  LODWORD(self) = -[GEODefaultsServer _validatePeer:canSetKey:error:]( self,  "_validatePeer:canSetKey:error:",  v5,  v6,  &v13);

  if ((_DWORD)self)
  {
    uint64_t v7 = _GEOConfigProxy();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configExpiryForOptions:", objc_msgSend(v4, "keyOptions")));

    int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 keyString]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 expireTime]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 expireOSVersion]);
    [v9 setConfigKeyExpiry:v10 date:v11 osVersion:v12];
  }
}

- (void)runBackgroundTask:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  GEOBackgroundTaskReportReportTaskInitiated();

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  unsigned int v6 = [v5 isEqual:GEOMapsAuthBackgroundTaskIdentifier];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[GEOMapsAuthServiceHelper sharedAuthHelper]( &OBJC_CLASS___GEOMapsAuthServiceHelper,  "sharedAuthHelper"));
    [v7 refreshFromTask:v3];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    unsigned int v9 = [v8 isEqual:GEOUpdateNetworkDefaultsTaskIdentifier];

    if (v9)
    {
      v21[0] = 0LL;
      v21[1] = v21;
      v21[2] = 0x2810000000LL;
      v21[3] = &unk_100054C22;
      v21[4] = 0LL;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100020FD8;
      v18[3] = &unk_1000591B8;
      uint64_t v20 = v21;
      id v10 = v3;
      id v19 = v10;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100021050;
      v16[3] = &unk_1000591E0;
      id v11 = objc_retainBlock(v18);
      id v17 = v11;
      [v10 setExpirationHandler:v16];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[GEONetworkDefaults sharedNetworkDefaults]( &OBJC_CLASS___GEONetworkDefaults,  "sharedNetworkDefaults"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10002108C;
      v14[3] = &unk_100059EE8;
      uint64_t v13 = v11;
      id v15 = v13;
      [v12 updateIfNecessary:v14];

      _Block_object_dispose(v21, 8);
    }
  }
}

- (void)peerDidConnect:(id)a3
{
  id v4 = a3;
  peersIsolater = self->_peersIsolater;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002111C;
  v7[3] = &unk_100059520;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  geo_isolate_sync(peersIsolater, v7);
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  peersIsolater = self->_peersIsolater;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000212D4;
  v7[3] = &unk_100059520;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  geo_isolate_sync(peersIsolater, v7);
}

- (void)addChangeListenerForWithRequest:(id)a3
{
  id v4 = a3;
  peersIsolater = self->_peersIsolater;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002136C;
  v7[3] = &unk_100059520;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  geo_isolate_sync(peersIsolater, v7);
}

- (void)removeChangeListenerForWithRequest:(id)a3
{
  id v4 = a3;
  peersIsolater = self->_peersIsolater;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000215CC;
  v7[3] = &unk_100059520;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  geo_isolate_sync(peersIsolater, v7);
}

- (void)getConfigValueForKeyWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOConfigStorageGetValueForKeyReply alloc] initWithRequest:v3];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 keyString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
  id v17 = 0LL;
  char v7 = GEOConfig_validateEntitlementForKey(v5, v6, &v17);
  id v8 = v17;

  if ((v7 & 1) != 0)
  {
    id v9 = [v3 keyOptions];
    uint64_t v10 = _GEOConfigProxy();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configStoreForOptions:v9]);

    *(void *)buf = 0LL;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 getConfigValueForKey:v5 countryCode:v13 options:v9 source:buf]);
    [v4 setKeyValue:v14];

    [v4 setKeySource:*(void *)buf];
    [v4 send];
  }

  else
  {
    uint64_t v15 = GEOGetUserDefaultsLog();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Not allowing access (read): %@", buf, 0xCu);
    }

    [v4 setError:v8];
    [v4 send];
  }
}

- (void)setConfigValueForKeyWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOConfigStorageSetValueForKeyReply alloc] initWithRequest:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyString]);
  int v7 = GEOConfig_keyRequiresEntitlement();
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
    id v32 = 0LL;
    char v9 = GEOConfig_validateEntitlementForKey(v6, v8, &v32);
    id v10 = v32;

    if ((v9 & 1) == 0)
    {
      uint64_t v12 = GEOGetUserDefaultsLog(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        __int128 v14 = "Not allowing access (write): %@";
        uint64_t v15 = v13;
        uint32_t v16 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_19;
      }

      goto LABEL_19;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  id v17 = v10;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  id v31 = v10;
  unsigned __int8 v19 = -[GEODefaultsServer _validatePeer:canSetKey:error:](self, "_validatePeer:canSetKey:error:", v18, v6, &v31);
  id v10 = v31;

  if ((v19 & 1) == 0)
  {
    uint64_t v30 = ((uint64_t (*)(void))GEOGetUserDefaultsLog)();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v6;
      __int16 v35 = 2114;
      v36[0] = v10;
      __int128 v14 = "Could not validate peer's ability to set key: %{public}@ - %{public}@";
      uint64_t v15 = v13;
      uint32_t v16 = 22;
      goto LABEL_18;
    }

- (void)migrageEntitledKeyWithRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _GEOConfigProxy();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configStoreForOptions:", objc_msgSend(v3, "keyOptions")));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 keyString]);
  id v7 = [v3 keyOptions];

  id v8 = (id)GEOConfig_migrateEntitledKey(v6, v7, v9, 0LL);
}

- (void).cxx_destruct
{
}

@end