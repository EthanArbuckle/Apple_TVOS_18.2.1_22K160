@interface IDSNRDevicePreferencesHandler
- (BOOL)areThereFreshQuickRelayRequests;
- (IDSDeviceOnlineMonitor)deviceOnlineMonitor;
- (IDSNRDevicePreferencesHandler)initWithDeviceIdentifier:(id)a3;
- (NRDevicePreferences)nrDevicePreferences;
- (NSMutableSet)servicesPreferringInfraWiFi;
- (id)announcePresenceBlock;
- (unsigned)announcePresenceDelayInSeconds;
- (unsigned)copyOfQuickRelayRequestsCountOnTheLastRequest;
- (unsigned)presenceOperationMode;
- (unsigned)quickRelayRequestsCount;
- (void)_annouceAvailabilityForCloudMessaging;
- (void)_reportPreferInfraWiFiToPowerLogs:(BOOL)a3;
- (void)annouceAvailabilityForCloudMessaging;
- (void)cancel;
- (void)idsDeviceOnlineMonitor:(id)a3 statusChanged:(unsigned int)a4;
- (void)localSetUpCompleted;
- (void)localSetUpStarted;
- (void)releaseQuickRelay;
- (void)requestQuickRelay;
- (void)revokeAvailabilityForCloudMessaging;
- (void)setAllowedTrafficClasses:(id)a3;
- (void)setAnnouncePresenceBlock:(id)a3;
- (void)setAnnouncePresenceDelayInSeconds:(unsigned int)a3;
- (void)setBluetoothLinkPreferences:(id)a3 inputbps:(id)a4 outputbps:(id)a5;
- (void)setCopyOfQuickRelayRequestsCountOnTheLastRequest:(unsigned int)a3;
- (void)setDeviceOnlineMonitor:(id)a3;
- (void)setNrDevicePreferences:(id)a3;
- (void)setPreferInfraWiFiRequest:(BOOL)a3 services:(id)a4;
- (void)setPresenceOperationMode:(unsigned int)a3;
- (void)setQuickRelayRequest:(BOOL)a3;
- (void)setQuickRelayRequestsCount:(unsigned int)a3;
- (void)setServicesPreferringInfraWiFi:(id)a3;
@end

@implementation IDSNRDevicePreferencesHandler

- (IDSNRDevicePreferencesHandler)initWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___IDSNRDevicePreferencesHandler;
  v5 = -[IDSNRDevicePreferencesHandler init](&v42, "init");
  if (v5)
  {
    if (v4)
    {
      v6 = (os_log_s *)+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]( &OBJC_CLASS___NRDeviceIdentifier,  "newDeviceIdentifierWithBluetoothUUID:",  v4);
      if (v6)
      {
        v7 = -[NRDevicePreferences initWithDeviceIdentifier:]( objc_alloc(&OBJC_CLASS___NRDevicePreferences),  "initWithDeviceIdentifier:",  v6);
        nrDevicePreferences = v5->_nrDevicePreferences;
        v5->_nrDevicePreferences = v7;

        v9 = v5->_nrDevicePreferences;
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
        v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v44 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NRDevicePreferences created with NRDeviceIdentifier %@.",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          sub_1006A6B48((uint64_t)v4, (uint64_t)v6, v11);
        }

        v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        servicesPreferringInfraWiFi = v5->_servicesPreferringInfraWiFi;
        v5->_servicesPreferringInfraWiFi = v13;

        *(void *)&v5->_quickRelayRequestsCount = 0LL;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 pairedDeviceUniqueID]);

        BOOL v16 = sub_1002B0090();
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"cloud-messaging-presence-operation-mode"]);

        if (v18)
        {
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
          int v21 = 2;
          if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
          {
            unsigned int v22 = [v18 unsignedIntValue];
            if (v22 >= 2) {
              int v21 = 2;
            }
            else {
              int v21 = v22;
            }
          }
        }

        else
        {
          int v21 = 2;
        }

        v5->_unsigned int presenceOperationMode = v21;
        if (v21) {
          BOOL v23 = v16;
        }
        else {
          BOOL v23 = 0;
        }
        if (v23)
        {
          dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
          dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_USER_INITIATED, 0);
          v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
          dispatch_queue_t v28 = dispatch_queue_create("SKPresenceQueue", v27);

          v29 = -[IDSDeviceOnlineMonitor initWithDelegate:uniqueIdentifier:queue:]( objc_alloc(&OBJC_CLASS___IDSDeviceOnlineMonitor),  "initWithDelegate:uniqueIdentifier:queue:",  v5,  v12,  v28);
          deviceOnlineMonitor = v5->_deviceOnlineMonitor;
          v5->_deviceOnlineMonitor = v29;
        }

        int v31 = _os_feature_enabled_impl("IDS", "OnlineMonitoringForCloudMessaging");
        if ((v31 & 1) == 0) {
          v5->_unsigned int presenceOperationMode = 0;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"cloud-messaging-presence-announce-delay"]);

        if (v33 && (uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber, v34), (objc_opt_isKindOfClass(v33, v35) & 1) != 0)) {
          unsigned int v36 = [v33 unsignedIntValue];
        }
        else {
          unsigned int v36 = 665;
        }

        v5->_announcePresenceDelayInSeconds = v36;
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = @"NO";
          unsigned int presenceOperationMode = v5->_presenceOperationMode;
          if (v31) {
            v40 = @"YES";
          }
          else {
            v40 = @"NO";
          }
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v44 = presenceOperationMode;
          *(_WORD *)&v44[4] = 2112;
          if (v16) {
            v38 = @"YES";
          }
          *(void *)&v44[6] = v40;
          __int16 v45 = 2112;
          v46 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "IDSNRDevicePreferencesHandler: CloudMessagingPrsenceOperationMode: %d, feature flag:%@, remoteSupportOnlineMonitoring:%@",  buf,  0x1Cu);
        }
      }

      else
      {
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1006A6AD4((uint64_t)v4, v12);
        }
      }
    }

    else
    {
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A6A94(v6);
      }
    }
  }

  return v5;
}

- (void)setBluetoothLinkPreferences:(id)a3 inputbps:(id)a4 outputbps:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___NRBluetoothLinkPreferences);
  [v12 setPacketsPerSecond:v10];

  [v12 setInputBytesPerSecond:v9];
  [v12 setOutputBytesPerSecond:v8];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v11 setBluetoothLinkPreferences:v12];
}

- (void)setPreferInfraWiFiRequest:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = v6;
  if (v4)
  {
    __int128 v32 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi]( self,  "servicesPreferringInfraWiFi"));
          unsigned __int8 v14 = [v13 containsObject:v12];

          if ((v14 & 1) == 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi]( self,  "servicesPreferringInfraWiFi"));
            [v15 addObject:v12];

            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
            [v16 addPreferWiFiRequest];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v9);
    }
  }

  else
  {
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    id v17 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v7);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)j);
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi]( self,  "servicesPreferringInfraWiFi"));
          unsigned int v23 = [v22 containsObject:v21];

          if (v23)
          {
            dispatch_queue_attr_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi]( self,  "servicesPreferringInfraWiFi"));
            [v24 removeObject:v21];

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
            [v25 removePreferWiFiRequest];
          }
        }

        id v18 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v18);
    }
  }

  -[IDSNRDevicePreferencesHandler _reportPreferInfraWiFiToPowerLogs:](self, "_reportPreferInfraWiFiToPowerLogs:", v4);
}

- (void)localSetUpStarted
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Calling [NRDevicePreferences deviceSetupStarted:]",  v5,  2u);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v4 deviceSetupStarted];
}

- (void)localSetUpCompleted
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Calling [NRDevicePreferences deviceSetupCompleted:]",  v5,  2u);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v4 deviceSetupCompleted];
}

- (void)_reportPreferInfraWiFiToPowerLogs:(BOOL)a3
{
  BOOL v3 = a3;
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi](self, "servicesPreferringInfraWiFi"));
  if (v5) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"IDSServicePrefersInfraWifi", v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"InfraWiFiState", v6);
  }

  IDSPowerLogDictionary(@"IDS Local InfraWiFi Request", theDict);
}

- (void)setAllowedTrafficClasses:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v5 setPolicyTrafficClassifiers:v4];
}

- (void)setQuickRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    -[IDSNRDevicePreferencesHandler setQuickRelayRequestsCount:]( self,  "setQuickRelayRequestsCount:",  -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount") + 1);
    -[IDSNRDevicePreferencesHandler requestQuickRelay](self, "requestQuickRelay");
  }

  else
  {
    -[IDSNRDevicePreferencesHandler setQuickRelayRequestsCount:](self, "setQuickRelayRequestsCount:");
    -[IDSNRDevicePreferencesHandler releaseQuickRelay](self, "releaseQuickRelay");
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    int v7 = [v6 status];
  }

  else
  {
    int v7 = 0;
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    uint64_t v10 = -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount");
    v11 = sub_1001FB014(v7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    unsigned __int8 v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Called [NRDevicePreferences setQuickRelayRequest:] {wantsQuickRelay: %@}, {quickRelayRequestsCount: %lu}, {remoteStatus:%@}",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)cancel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v3 cancel];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v4 removePreferWiFiRequest];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi](self, "servicesPreferringInfraWiFi"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi](self, "servicesPreferringInfraWiFi"));
    [v6 removeAllObjects];

    -[IDSNRDevicePreferencesHandler _reportPreferInfraWiFiToPowerLogs:](self, "_reportPreferInfraWiFiToPowerLogs:", 0LL);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler servicesPreferringInfraWiFi](self, "servicesPreferringInfraWiFi"));
    id v8 = [v7 count];

    if (!v8) {
      -[IDSNRDevicePreferencesHandler setServicesPreferringInfraWiFi:](self, "setServicesPreferringInfraWiFi:", 0LL);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v10 releasePresence];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v11 stopMonitoring];

    -[IDSNRDevicePreferencesHandler setDeviceOnlineMonitor:](self, "setDeviceOnlineMonitor:", 0LL);
  }

- (void)requestQuickRelay
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (!v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
    [v5 addQuickRelayRequest];

    -[IDSNRDevicePreferencesHandler setCopyOfQuickRelayRequestsCountOnTheLastRequest:]( self,  "setCopyOfQuickRelayRequestsCountOnTheLastRequest:",  -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount"));
    return;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
  if ([v4 status] == 3)
  {
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    unsigned int v7 = [v6 status];

    if (v7 != 1) {
      goto LABEL_7;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v8 addQuickRelayRequest];

  -[IDSNRDevicePreferencesHandler setCopyOfQuickRelayRequestsCountOnTheLastRequest:]( self,  "setCopyOfQuickRelayRequestsCountOnTheLastRequest:",  -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount"));
LABEL_7:
  if (self->_presenceOperationMode == 1)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v9 startMonitoring];
  }

- (void)releaseQuickRelay
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler nrDevicePreferences](self, "nrDevicePreferences"));
  [v3 removeAllQuickRelayRequests];

  -[IDSNRDevicePreferencesHandler setCopyOfQuickRelayRequestsCountOnTheLastRequest:]( self,  "setCopyOfQuickRelayRequestsCountOnTheLastRequest:",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (v4)
  {
    if (self->_presenceOperationMode == 1)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
      [v5 stopMonitoring];
    }
  }

- (BOOL)areThereFreshQuickRelayRequests
{
  unsigned int v3 = -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount");
  return v3 > -[IDSNRDevicePreferencesHandler copyOfQuickRelayRequestsCountOnTheLastRequest]( self,  "copyOfQuickRelayRequestsCountOnTheLastRequest");
}

- (void)annouceAvailabilityForCloudMessaging
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));

  if (v3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));
      id v6 = objc_retainBlock(v5);
      *(_DWORD *)buf = 134217984;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already have scheduled {block:%p}", buf, 0xCu);
    }
  }

  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_1002B0CE8;
    uint64_t v19 = &unk_1008F8A78;
    objc_copyWeak(&v20, &location);
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v16);
    -[IDSNRDevicePreferencesHandler setAnnouncePresenceBlock:]( self,  "setAnnouncePresenceBlock:",  v7,  v16,  v17,  v18,  v19);

    dispatch_time_t v8 = dispatch_time( 0LL,  1000000000LL * -[IDSNRDevicePreferencesHandler announcePresenceDelayInSeconds](self, "announcePresenceDelayInSeconds"));
    uint64_t v9 = im_primary_base_queue(v8);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));
    dispatch_after(v8, v10, v11);

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));
      id v14 = objc_retainBlock(v13);
      unsigned int v15 = -[IDSNRDevicePreferencesHandler announcePresenceDelayInSeconds](self, "announcePresenceDelayInSeconds");
      *(_DWORD *)buf = 134218240;
      id v23 = v14;
      __int16 v24 = 1024;
      unsigned int v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Scheduled to announce presence {block:%p} in %d seconds",  buf,  0x12u);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

- (void)_annouceAvailabilityForCloudMessaging
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (!v3 && self->_presenceOperationMode && sub_1002B0090())
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_time_t v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("SKPresenceQueue", v10);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pairedDeviceUniqueID]);

    id v14 = -[IDSDeviceOnlineMonitor initWithDelegate:uniqueIdentifier:queue:]( objc_alloc(&OBJC_CLASS___IDSDeviceOnlineMonitor),  "initWithDelegate:uniqueIdentifier:queue:",  self,  v13,  v11);
    deviceOnlineMonitor = self->_deviceOnlineMonitor;
    self->_deviceOnlineMonitor = v14;

    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int presenceOperationMode = self->_presenceOperationMode;
      v18[0] = 67109120;
      v18[1] = presenceOperationMode;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Starting IDSDeviceOnlineMonitor {presenceOperationMode:%d}",  (uint8_t *)v18,  8u);
    }
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v5 assertPresence];

    if (self->_presenceOperationMode == 2)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
      [v6 startMonitoring];
    }
  }

- (void)revokeAvailabilityForCloudMessaging
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));

  if (v3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));
      id v6 = objc_retainBlock(v5);
      int v11 = 134217984;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cancelling scheduled {block:%p}",  (uint8_t *)&v11,  0xCu);
    }

    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler announcePresenceBlock](self, "announcePresenceBlock"));
    dispatch_block_cancel(v7);

    -[IDSNRDevicePreferencesHandler setAnnouncePresenceBlock:](self, "setAnnouncePresenceBlock:", 0LL);
  }

  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));

  if (v8)
  {
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v9 releasePresence];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDevicePreferencesHandler deviceOnlineMonitor](self, "deviceOnlineMonitor"));
    [v10 stopMonitoring];
  }

- (void)idsDeviceOnlineMonitor:(id)a3 statusChanged:(unsigned int)a4
{
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_attr_t v7 = sub_1001FB014(a4);
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = -[IDSNRDevicePreferencesHandler quickRelayRequestsCount](self, "quickRelayRequestsCount");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "idsDeviceOnlineMonitor status changed: {newStatus:%@}, {quickRelayRequestsCount: %lu}",  (uint8_t *)&v9,  0x16u);
  }

  if (a4 == 3)
  {
    if (-[IDSNRDevicePreferencesHandler areThereFreshQuickRelayRequests](self, "areThereFreshQuickRelayRequests")) {
      -[IDSNRDevicePreferencesHandler requestQuickRelay](self, "requestQuickRelay");
    }
  }

- (NRDevicePreferences)nrDevicePreferences
{
  return self->_nrDevicePreferences;
}

- (void)setNrDevicePreferences:(id)a3
{
}

- (NSMutableSet)servicesPreferringInfraWiFi
{
  return self->_servicesPreferringInfraWiFi;
}

- (void)setServicesPreferringInfraWiFi:(id)a3
{
}

- (IDSDeviceOnlineMonitor)deviceOnlineMonitor
{
  return self->_deviceOnlineMonitor;
}

- (void)setDeviceOnlineMonitor:(id)a3
{
}

- (unsigned)quickRelayRequestsCount
{
  return self->_quickRelayRequestsCount;
}

- (void)setQuickRelayRequestsCount:(unsigned int)a3
{
  self->_quickRelayRequestsCount = a3;
}

- (unsigned)copyOfQuickRelayRequestsCountOnTheLastRequest
{
  return self->_copyOfQuickRelayRequestsCountOnTheLastRequest;
}

- (void)setCopyOfQuickRelayRequestsCountOnTheLastRequest:(unsigned int)a3
{
  self->_copyOfQuickRelayRequestsCountOnTheLastRequest = a3;
}

- (unsigned)presenceOperationMode
{
  return self->_presenceOperationMode;
}

- (void)setPresenceOperationMode:(unsigned int)a3
{
  self->_unsigned int presenceOperationMode = a3;
}

- (id)announcePresenceBlock
{
  return self->_announcePresenceBlock;
}

- (void)setAnnouncePresenceBlock:(id)a3
{
}

- (unsigned)announcePresenceDelayInSeconds
{
  return self->_announcePresenceDelayInSeconds;
}

- (void)setAnnouncePresenceDelayInSeconds:(unsigned int)a3
{
  self->_announcePresenceDelayInSeconds = a3;
}

- (void).cxx_destruct
{
}

@end