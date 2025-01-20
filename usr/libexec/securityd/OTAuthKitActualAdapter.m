@interface OTAuthKitActualAdapter
- (BOOL)accountIsCDPCapableByAltDSID:(id)a3;
- (BOOL)accountIsDemoAccountByAltDSID:(id)a3 error:(id *)a4;
- (OTAuthKitAdapterNotifier)notifiers;
- (id)machineID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(id *)a7;
- (void)deliverAKDeviceListDeltaMessagePayload:(id)a3;
- (void)fetchCurrentDeviceListByAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 reply:(id)a6;
- (void)notifyAKDeviceList:(id)a3;
- (void)registerNotification:(id)a3;
- (void)setNotifiers:(id)a3;
@end

@implementation OTAuthKitActualAdapter

- (BOOL)accountIsCDPCapableByAltDSID:(id)a3
{
  id v3 = a3;
  if (objc_opt_class(&OBJC_CLASS___ACAccount) && objc_opt_class(&OBJC_CLASS___AKAccountManager))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v16 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccountWithAltDSID:v3 error:&v16]);
    id v6 = v16;
    if (v5)
    {
      unint64_t v7 = (unint64_t)[v4 securityLevelForAccount:v5];
      BOOL v8 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
      v9 = @"Unknown";
      switch(v7)
      {
        case 0uLL:
          break;
        case 1uLL:
          v9 = @"PasswordOnly";
          break;
        case 2uLL:
          v9 = @"Standard";
          break;
        case 3uLL:
          v9 = @"HSA1";
          break;
        case 4uLL:
          v9 = @"HSA2";
          break;
        case 5uLL:
          v9 = @"Managed";
          break;
        default:
          v9 = @"oh no please file a radar to Security | iCloud Keychain security level";
          break;
      }
    }

    else
    {
      v11 = sub_10001267C("authkit");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to get AK account: %@", buf, 0xCu);
      }

      BOOL v8 = 0;
      unint64_t v7 = 0LL;
      v9 = @"Unknown";
    }

    v13 = sub_10001267C("authkit");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v3;
      __int16 v19 = 2048;
      unint64_t v20 = v7;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Security level for altDSID %@ is %lu.  Account type: %@",  buf,  0x20u);
    }
  }

  else
  {
    v10 = sub_10001267C("authkit");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "AuthKit not available", buf, 2u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)accountIsDemoAccountByAltDSID:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authKitAccountWithAltDSID:v4]);
  unsigned int v7 = [v5 demoAccountForAccount:v6];
  BOOL v8 = sub_10001267C("authkit");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Account with altDSID %@ is a demo account: %{BOOL}d",  (uint8_t *)&v11,  0x12u);
  }

  return v7;
}

- (id)machineID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unsigned int v14 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  LOBYTE(v31) = a6;
  v15 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v14,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v13,  v12,  v11,  kSecurityRTCEventNameFetchMachineID,  0LL,  v31,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

  if (objc_opt_class(&OBJC_CLASS___AKAnisetteProvisioningController) && objc_opt_class(&OBJC_CLASS___AKAnisetteData))
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___AKAnisetteProvisioningController);
    id v32 = 0LL;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 anisetteDataWithError:&v32]);
    id v18 = v32;
    if (v17)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 machineID]);
      unint64_t v20 = sub_10001267C("authkit");
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "fetched current machine ID as: %@",  buf,  0xCu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v15,  1LL,  0LL);
        id v23 = v19;
      }

      else
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Anisette data does not have machineID",  buf,  2u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  46LL,  @"Anisette data does not have machineID"));
        if (a7)
        {
          +[SecABC triggerAutoBugCaptureWithType:subType:]( &OBJC_CLASS___SecABC,  "triggerAutoBugCaptureWithType:subType:",  @"AuthKit",  @"missingMID");
          *a7 = v29;
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v15,  0LL,  v29);
      }
    }

    else
    {
      v27 = sub_10001267C("authkit");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v18;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Unable to fetch data: %@", buf, 0xCu);
      }

      if (a7) {
        *a7 = v18;
      }
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v15,  0LL,  v18);
      __int16 v19 = 0LL;
    }
  }

  else
  {
    v24 = sub_10001267C("authkit");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  50LL,  @"AKAnisette not available"));
    id v16 = v26;
    if (a7) {
      *a7 = v26;
    }
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v15,  0LL,  v16);
    __int16 v19 = 0LL;
  }

  return v19;
}

- (void)fetchCurrentDeviceListByAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_class(&OBJC_CLASS___AKDeviceListRequestContext)
    && objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationController))
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
    if (v13)
    {
      unsigned int v14 = v13;
      [v13 setAltDSID:v9];
      [v14 setType:3];
      id v15 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
      if (v15)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_100103154;
        v22[3] = &unk_100286D50;
        id v23 = v9;
        id v24 = v10;
        id v25 = v11;
        id v26 = v12;
        [v15 deviceListWithContext:v14 completion:v22];
      }

      else
      {
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  45LL,  @"can't get authController"));
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
        [v21 logUnrecoverableError:v20 forEvent:@"OctagonEventAuthKitDeviceList" withAttributes:0];

        (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))( v12,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v20);
      }
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  43LL,  @"can't get AKDeviceListRequestContextClass"));
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
      [v19 logUnrecoverableError:v18 forEvent:@"OctagonEventAuthKitDeviceList" withAttributes:0];

      (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))( v12,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v18);
      unsigned int v14 = 0LL;
    }
  }

  else
  {
    id v16 = sub_10001267C("authkit");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AuthKit not available", buf, 2u);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  50LL,  @"AKAnisette not available"));
    (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))( v12,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v14);
  }
}

- (void)registerNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));

  if (!v5)
  {
    id v6 = -[CKKSListenerCollection initWithName:]( objc_alloc(&OBJC_CLASS___CKKSListenerCollection),  "initWithName:",  @"otauthkitadapter-notifiers");
    -[OTAuthKitActualAdapter setNotifiers:](self, "setNotifiers:", v6);

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v7 addObserver:self selector:"notifyAKDeviceList:" name:AKDeviceListChangedNotification object:0];
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));
  [v8 registerListener:v4];
}

- (void)notifyAKDeviceList:(id)a3
{
  id v4 = a3;
  if (objc_opt_class(&OBJC_CLASS___AKDeviceListDeltaMessagePayload))
  {
    if (v4) {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    }
    else {
      v5 = 0LL;
    }
    -[OTAuthKitActualAdapter deliverAKDeviceListDeltaMessagePayload:]( self,  "deliverAKDeviceListDeltaMessagePayload:",  v5);
  }

  else
  {
    id v6 = sub_10001267C("authkit");
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AuthKit not available; dropping device list notification",
        v8,
        2u);
    }
  }
}

- (void)deliverAKDeviceListDeltaMessagePayload:(id)a3
{
  id v4 = sub_10001267C("authkit");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "received notifyAKDeviceListDeltaMessagePayload",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));
  [v6 iterateListeners:&stru_100286D90];
}

- (OTAuthKitAdapterNotifier)notifiers
{
  return (OTAuthKitAdapterNotifier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setNotifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end