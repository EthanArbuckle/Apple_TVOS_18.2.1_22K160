@interface CSDCoreTelephonyClient
+ (BOOL)_isCTErrorFatal:(id)a3;
+ (BOOL)_isNSErrorFatal:(id)a3;
- (BOOL)isEmergencyCallbackModeEnabled;
- (BOOL)isInHomeCountryForSubscriptionUUID:(id)a3;
- (CSDCarrierBundleProviderController)carrierBundleProviderController;
- (CSDCoreTelephonyClient)initWithQueue:(id)a3 shouldRegisterForECBMNotification:(BOOL)a4;
- (CSDCoreTelephonyClientDelegate)delegate;
- (CTXPCContexts)activeContexts;
- (CoreTelephonyClient)client;
- (NSDictionary)thumperDeviceInfo;
- (NSMutableDictionary)mobileCodesToISOCountryCode;
- (NSSet)subscriptions;
- (NSSet)telephonySubscriptions;
- (NSUUID)preferredVoiceSubscriptionUUID;
- (OS_dispatch_queue)queue;
- (id)ISOCountryCodeForMobileCountryCode:(id)a3 mobileNetworkCode:(id)a4;
- (id)ISOCountryCodeForSubscriptionUUID:(id)a3;
- (id)_subscriptionWithUUID:(id)a3;
- (id)accountISOCountryCodeForSubscriptionUUID:(id)a3;
- (id)callCapabilitiesForSubscription:(id)a3;
- (id)capabilityInfoForSubscription:(id)a3 capability:(id)a4;
- (id)legacySystemCapabilities;
- (id)mobileCountryCodeForSubscription:(id)a3 error:(id *)a4;
- (id)mobileNetworkCodeForSubscription:(id)a3 error:(id *)a4;
- (id)systemCapabilitiesForSubscription:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)addSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 toSubscription:(id)a4;
- (void)callCapabilitiesChanged:(id)a3 capabilities:(id)a4;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)ctEmergencyCallbackModeStatusChangedWithUserInfo:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)legacyAddSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3;
- (void)legacyRecheckAccountStatusForCapability:(id)a3;
- (void)legacyRemoveSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3;
- (void)phoneServicesCapabilitiesChanged:(id)a3;
- (void)recheckAccountStatusForSubscription:(id)a3 capability:(id)a4;
- (void)removeSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 fromSubscription:(id)a4;
- (void)setActiveContexts:(id)a3;
- (void)setCarrierBundleProviderController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyCapability:(id)a3 enabled:(BOOL)a4 capabilityInformation:(id)a5;
- (void)setSubscription:(id)a3 capability:(id)a4 enabled:(BOOL)a5 info:(id)a6;
@end

@implementation CSDCoreTelephonyClient

- (CSDCoreTelephonyClient)initWithQueue:(id)a3 shouldRegisterForECBMNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDCoreTelephonyClient;
  v8 = -[CSDCoreTelephonyClient init](&v24, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", v7);
    client = v9->_client;
    v9->_client = v10;

    -[CoreTelephonyClient setDelegate:](v9->_client, "setDelegate:", v9);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mobileCodesToISOCountryCode = v9->_mobileCodesToISOCountryCode;
    v9->_mobileCodesToISOCountryCode = v12;

    v14 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  @"01",  @"gp",  @"02",  @"gp",  @"03",  @"gp",  @"08",  @"gp",  @"09",  @"gf",  @"10",  @"mq",  @"12",  @"gp",  @"20",  0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9->_mobileCodesToISOCountryCode,  "setObject:forKeyedSubscript:",  v14,  @"340");

    id inited = objc_initWeak(&location, v9);
    if (v4)
    {
      uint64_t v16 = TUCTServerConnection(inited);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100174550;
      v21[3] = &unk_1003DBC20;
      objc_copyWeak(&v22, &location);
      int v17 = (unint64_t)_CTServerConnectionRegisterBlockForNotification( v16,  kCTEmergencyCallBackModeStatusNotification,  v21) >> 32;
      id v18 = sub_1001704C4();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Registered for kCTEmergencyCallBackModeStatusNotification with error: %d",  buf,  8u);
      }

      objc_destroyWeak(&v22);
    }

    objc_destroyWeak(&location);
  }

  return v9;
}

- (CTXPCContexts)activeContexts
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  activeContexts = self->_activeContexts;
  if (!activeContexts)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v13 = 0LL;
    v6 = (CTXPCContexts *)objc_claimAutoreleasedReturnValue([v5 getActiveContexts:&v13]);
    id v7 = v13;
    v8 = self->_activeContexts;
    self->_activeContexts = v6;

    if (!self->_activeContexts && objc_msgSend((id)objc_opt_class(self, v9), "_isNSErrorFatal:", v7))
    {
      id v10 = sub_1001704C4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002B94D0(self, (uint64_t)v7, v11);
      }
    }

    activeContexts = self->_activeContexts;
  }

  return activeContexts;
}

- (CSDCarrierBundleProviderController)carrierBundleProviderController
{
  carrierBundleProviderController = self->_carrierBundleProviderController;
  if (!carrierBundleProviderController)
  {
    BOOL v4 = objc_alloc_init(&OBJC_CLASS___CSDCarrierBundleProviderController);
    v5 = self->_carrierBundleProviderController;
    self->_carrierBundleProviderController = v4;

    carrierBundleProviderController = self->_carrierBundleProviderController;
  }

  return carrierBundleProviderController;
}

- (NSUUID)preferredVoiceSubscriptionUUID
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient activeContexts](self, "activeContexts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 voicePreferred]);

  return (NSUUID *)v5;
}

- (NSSet)subscriptions
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient activeContexts](self, "activeContexts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subscriptions]);

  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  }
  else {
    v6 = 0LL;
  }

  return (NSSet *)v6;
}

- (NSSet)telephonySubscriptions
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient subscriptions](self, "subscriptions"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];

  return (NSSet *)v11;
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  char v9 = 0;
  uint64_t v3 = TUCTServerConnection(self);
  uint64_t v4 = _CTServerConnectionGetEmergencyCallBackMode(v3, &v9);
  if (objc_msgSend((id)objc_opt_class(self, v5), "_isCTErrorFatal:", v4))
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002B957C();
    }
  }

  return v9 != 0;
}

- (NSDictionary)thumperDeviceInfo
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
  id v11 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getPhoneServicesDeviceInfo:&v11]);
  id v6 = v11;

  if (!v5 && objc_msgSend((id)objc_opt_class(self, v7), "_isNSErrorFatal:", v6))
  {
    id v8 = sub_1001704C4();
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B95DC();
    }
  }

  return (NSDictionary *)v5;
}

- (id)callCapabilitiesForSubscription:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "csd_isUnknown") & 1) != 0
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client")),
        char v6 = objc_opt_respondsToSelector(v5, "getCallCapabilities:error:"),
        v5,
        (v6 & 1) == 0))
  {
    v12 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    id v16 = 0LL;
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getCallCapabilities:v8 error:&v16]);
    id v10 = v16;

    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDCTCallCapabilities callCapabilitiesForCTCallCapabilities:]( &OBJC_CLASS___CSDCTCallCapabilities,  "callCapabilitiesForCTCallCapabilities:",  v9));
    }

    else
    {
      if (objc_msgSend((id)objc_opt_class(self, v11), "_isNSErrorFatal:", v10))
      {
        id v13 = sub_1001704C4();
        __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1002B963C();
        }
      }

      v12 = 0LL;
    }
  }

  return v12;
}

- (id)capabilityInfoForSubscription:(id)a3 capability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v9 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v17 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 context:v11 getCapability:v7 status:&v18 with:&v17]);
    id v9 = v17;

    if (!v9 && objc_msgSend((id)objc_opt_class(self, v13), "_isNSErrorFatal:", v12))
    {
      id v14 = sub_1001704C4();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1002B969C();
      }
    }
  }

  return v9;
}

- (id)systemCapabilitiesForSubscription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "csd_isUnknown"))
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    id v14 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 context:v8 getSystemCapabilities:&v14]);
    id v9 = v14;

    if (!v6 && objc_msgSend((id)objc_opt_class(self, v10), "_isNSErrorFatal:", v9))
    {
      id v11 = sub_1001704C4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1002B96FC();
      }
    }
  }

  return v6;
}

- (void)setSubscription:(id)a3 capability:(id)a4 enabled:(BOOL)a5 info:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  if (objc_msgSend(v10, "csd_isUnknown"))
  {
    -[CSDCoreTelephonyClient setLegacyCapability:enabled:capabilityInformation:]( self,  "setLegacyCapability:enabled:capabilityInformation:",  v11,  v7,  v12);
  }

  else
  {
    id v14 = sub_1001704C4();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412802;
      *(void *)id v22 = v11;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v7;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Calling -[CoreTelephonyClient context:setCapability:enabled:with:completion:] with capability: %@ enabled: %d info: %@",  (uint8_t *)&v21,  0x1Cu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    char v18 = (void *)objc_claimAutoreleasedReturnValue([v16 context:v17 setCapability:v11 enabled:v7 with:v12]);

    if (v18)
    {
      id v19 = sub_1001704C4();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 67109890;
        *(_DWORD *)id v22 = v7;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v11;
        __int16 v23 = 2112;
        id v24 = v12;
        __int16 v25 = 2112;
        int v26 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to set enabled=%d for capability %@ with info %@: %@",  (uint8_t *)&v21,  0x26u);
      }
    }
  }
}

- (void)addSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 toSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v7, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Calling -[CoreTelephonyClient context:addPhoneServicesDevice:withCompletion:] with idsDeviceIdentifier: %@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001750D8;
    v13[3] = &unk_1003D8600;
    id v14 = v6;
    [v11 context:v12 addPhoneServicesDevice:v14 withCompletion:v13];
  }
}

- (void)removeSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 fromSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v7, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Calling -[CoreTelephonyClient context:removePhoneServicesDevice:withCompletion:] with idsDeviceIdentifier: %@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10017529C;
    v13[3] = &unk_1003D8600;
    id v14 = v6;
    [v11 context:v12 removePhoneServicesDevice:v14 withCompletion:v13];
  }
}

- (void)recheckAccountStatusForSubscription:(id)a3 capability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v6, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Calling -[CoreTelephonyClient context:recheckPhoneServicesAccountStatus:] with capability: %@",  (uint8_t *)&v14,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v13 = [v11 context:v12 recheckPhoneServicesAccountStatus:v7];
  }
}

- (void)endEmergencyCallbackMode
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = @"NO";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Calling _CTServerConnectionEnableEmergencyCallBackMode() with %@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v7 = TUCTServerConnection(v6);
  uint64_t v8 = _CTServerConnectionEnableEmergencyCallBackMode(v7, 0LL);
  if (objc_msgSend((id)objc_opt_class(self, v9), "_isCTErrorFatal:", v8))
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B957C();
    }
  }

- (void)setLegacyCapability:(id)a3 enabled:(BOOL)a4 capabilityInformation:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Calling _CTServerConnectionSetCapabilityExtended() with capability: %@ value: %d capabilityInformation: %@",  (uint8_t *)&v18,  0x1Cu);
  }

  uint64_t v13 = TUCTServerConnection(v12);
  uint64_t v14 = _CTServerConnectionSetCapabilityExtended(v13, v8, v6, v9);
  if (objc_msgSend((id)objc_opt_class(self, v15), "_isCTErrorFatal:", v14))
  {
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 1024;
      int v21 = v14;
      __int16 v22 = 1024;
      LODWORD(v23) = HIDWORD(v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Error setting capability for %@ calling (domain=%d, code=%d)",  (uint8_t *)&v18,  0x18u);
    }
  }
}

- (id)legacySystemCapabilities
{
  id v10 = 0LL;
  char v9 = 0;
  uint64_t v3 = TUCTServerConnection(self);
  uint64_t v4 = _CTServerConnectionCopySystemCapabilities(v3, &v10, &v9);
  if (objc_msgSend((id)objc_opt_class(self, v5), "_isCTErrorFatal:", v4))
  {
    id v6 = sub_1001704C4();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002B9824();
    }
  }

  return v10;
}

- (void)legacyAddSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCTCapabilityPhoneServices;
  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    *(void *)id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Calling _CTServerConnectionPhoneServicesAddDevice() with capability: %@ idsDeviceIdentifier: %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v9 = TUCTServerConnection(v8);
  uint64_t v10 = _CTServerConnectionPhoneServicesAddDevice(v9, v5, 0LL, v4);
  if (objc_msgSend((id)objc_opt_class(self, v11), "_isCTErrorFatal:", v10))
  {
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 1024;
      *(_DWORD *)id v17 = v10;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = HIDWORD(v10);
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error adding device for %@ calling (domain=%d, code=%d)",  (uint8_t *)&v14,  0x18u);
    }
  }
}

- (void)legacyRemoveSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCTCapabilityPhoneServices;
  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    *(void *)id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Calling _CTServerConnectionPhoneServicesRemoveDevice() with capability: %@ idsDeviceIdentifier: %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v9 = TUCTServerConnection(v8);
  uint64_t v10 = _CTServerConnectionPhoneServicesRemoveDevice(v9, v5, 0LL, v4);
  if (objc_msgSend((id)objc_opt_class(self, v11), "_isCTErrorFatal:", v10))
  {
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 1024;
      *(_DWORD *)id v17 = v10;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = HIDWORD(v10);
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error removing device for %@ calling (domain=%d, code=%d)",  (uint8_t *)&v14,  0x18u);
    }
  }
}

- (void)legacyRecheckAccountStatusForCapability:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Calling _CTServerConnectionPhoneServicesAccountStatusChanged() and _CTServerConnectionSendBarrier() with capability: %@",  buf,  0xCu);
  }

  uint64_t v7 = TUCTServerConnection(v6);
  id v10 = v3;
  uint64_t v11 = &__kCFBooleanTrue;
  uint64_t v8 = _CTServerConnectionPhoneServicesAccountStatusChanged( v7,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  uint64_t v9 = TUCTServerConnection(v8);
  _CTServerConnectionSendBarrier(v9, 0LL);
}

- (id)accountISOCountryCodeForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v22 = 0LL;
    id v9 = [v7 copyMobileSubscriberCountryCode:v8 error:&v22];
    id v10 = v22;

    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
      id v21 = v10;
      id v13 = [v12 copyMobileSubscriberIsoCountryCode:v9 error:&v21];
      id v14 = v21;

      if ([v13 length]
        || !objc_msgSend((id)objc_opt_class(self, v15), "_isNSErrorFatal:", v14))
      {
        goto LABEL_15;
      }

      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1002B9944();
      }
    }

    else
    {
      if (!objc_msgSend((id)objc_opt_class(self, v11), "_isNSErrorFatal:", v10))
      {
        id v13 = 0LL;
        goto LABEL_16;
      }

      id v19 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1002B98E4();
      }
      id v13 = 0LL;
      id v14 = v10;
    }

LABEL_15:
    id v10 = v14;
LABEL_16:

    goto LABEL_17;
  }

  id v18 = sub_1001704C4();
  id v10 = (id)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_1002B9884();
  }
  id v13 = 0LL;
LABEL_17:

  return v13;
}

- (BOOL)isInHomeCountryForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CTXPCServiceSubscriptionContext contextWithSlot:]( CTXPCServiceSubscriptionContext,  "contextWithSlot:",  [v6 slotID]));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v16 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getRoamingStatus:v7 error:&v16]);
    id v10 = v16;

    if (v10)
    {
      _IMWarn(@"Error getting registration status: %@");
      unsigned int v11 = 0;
    }

    else
    {
      unsigned int v11 = [v9 isVoiceRoaming] ^ 1;
    }

    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = @"NO";
      if (v11) {
        id v14 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "isInHomeCountryForSubscriptionUUID: %@ for subscription context - %@.",  buf,  0x16u);
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)ISOCountryCodeForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  if (v6)
  {
    id v23 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCoreTelephonyClient mobileCountryCodeForSubscription:error:]( self,  "mobileCountryCodeForSubscription:error:",  v6,  &v23));
    id v8 = v23;
    id v10 = v8;
    if (v7)
    {
      id v22 = v8;
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDCoreTelephonyClient mobileNetworkCodeForSubscription:error:]( self,  "mobileNetworkCodeForSubscription:error:",  v6,  &v22));
      id v12 = v22;

      if (v11)
      {
        id v14 = sub_1001704C4();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          __int16 v25 = v7;
          __int16 v26 = 2112;
          v27 = v11;
          __int16 v28 = 2112;
          v29 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Retrieved mobile country code %@ and mobile network code %@ for subscription %@",  buf,  0x20u);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCoreTelephonyClient ISOCountryCodeForMobileCountryCode:mobileNetworkCode:]( self,  "ISOCountryCodeForMobileCountryCode:mobileNetworkCode:",  v7,  v11));
      }

      else
      {
        if (objc_msgSend((id)objc_opt_class(self, v13), "_isNSErrorFatal:", v12))
        {
          id v19 = sub_1001704C4();
          __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1002B99A4();
          }
        }

        id v16 = 0LL;
      }
    }

    else
    {
      if (!objc_msgSend((id)objc_opt_class(self, v9), "_isNSErrorFatal:", v8))
      {
        id v16 = 0LL;
        goto LABEL_20;
      }

      id v18 = sub_1001704C4();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002B98E4();
      }
      id v16 = 0LL;
      id v12 = v10;
    }

    id v10 = v12;
LABEL_20:

    goto LABEL_21;
  }

  id v17 = sub_1001704C4();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_1002B9884();
  }
  id v16 = 0LL;
LABEL_21:

  return v16;
}

- (id)ISOCountryCodeForMobileCountryCode:(id)a3 mobileNetworkCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient mobileCodesToISOCountryCode](self, "mobileCodesToISOCountryCode"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

  if ([v11 length])
  {
    id v12 = v11;
  }

  else
  {
    *(void *)buf = 0LL;
    uint64_t v13 = TUCTServerConnection(0LL);
    uint64_t v15 = _CTServerConnectionCopyISOForMCC(v13, v6, buf);
    id v12 = *(void **)buf;
    if (*(void *)buf)
    {

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient mobileCodesToISOCountryCode](self, "mobileCodesToISOCountryCode"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v6]);

      if (v17)
      {
        [v17 setObject:v12 forKeyedSubscript:v7];
      }

      else
      {
        id v18 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  v12,  v7,  0LL);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient mobileCodesToISOCountryCode](self, "mobileCodesToISOCountryCode"));
        [v19 setObject:v18 forKeyedSubscript:v6];
      }
    }

    else
    {
      id v12 = v11;
    }

    if (objc_msgSend((id)objc_opt_class(self, v14), "_isCTErrorFatal:", v15))
    {
      id v20 = sub_1001704C4();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1002B9A04();
      }
    }
  }

  id v22 = sub_1001704C4();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Retrieved ISO country code %@ for mobile country code %@ and mobile network code %@",  buf,  0x20u);
  }

  return v12;
}

- (id)mobileCountryCodeForSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v8 = 0LL;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v8 = [v9 copyMobileCountryCode:v10 error:a4];
  }

  return v8;
}

- (id)mobileNetworkCodeForSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v8 = 0LL;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient client](self, "client"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v8 = [v9 copyMobileNetworkCode:v10 error:a4];
  }

  return v8;
}

+ (BOOL)_isCTErrorFatal:(id)a3
{
  return a3 != 0x2300000001LL && a3.var0 != 0;
}

+ (BOOL)_isNSErrorFatal:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3 != 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v5 isEqualToString:NSPOSIXErrorDomain])
  {
    id v6 = [v3 code];

    if (v3) {
      BOOL v7 = v6 == (id)35;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v4 = !v7;
  }

  else
  {
  }

  return v4;
}

- (id)_subscriptionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient subscriptions](self, "subscriptions", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)activeSubscriptionsDidChange
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDCoreTelephonyClient setActiveContexts:](self, "setActiveContexts:", 0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient delegate](self, "delegate"));
  [v4 subscriptionsDidChangeForClient:self];
}

- (void)callCapabilitiesChanged:(id)a3 capabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v9));

  if (v10)
  {
    id v11 = sub_1001704C4();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      __int128 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received delegate callback callCapabilitiesChanged: with context: %@ info: %@",  (uint8_t *)&v15,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSDCTCallCapabilities callCapabilitiesForCTCallCapabilities:]( &OBJC_CLASS___CSDCTCallCapabilities,  "callCapabilitiesForCTCallCapabilities:",  v6));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient delegate](self, "delegate"));
    [v14 client:self subscription:v10 callCapabilitiesDidChange:v13];
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v9));

  if (v10)
  {
    id v11 = sub_1001704C4();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      int v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received context:capabilitiesChanged: with context: %@ info: %@",  (uint8_t *)&v14,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient delegate](self, "delegate"));
    [v13 client:self subscription:v10 capabilitiesDidChange:v6];
  }
}

- (void)phoneServicesCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = (id)objc_opt_class(self, v7);
    __int16 v15 = 2112;
    id v16 = v4;
    id v8 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ is handling phoneServicesCapabilitiesChanged: with userInfo %@",  buf,  0x16u);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100176A8C;
  v11[3] = &unk_1003D7758;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)ctEmergencyCallbackModeStatusChangedWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received kCTEmergencyCallBackModeStatusNotification with userInfo %@",  buf,  0xCu);
  }

  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCoreTelephonyClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100176BCC;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v7, block);
}

- (CSDCoreTelephonyClientDelegate)delegate
{
  return (CSDCoreTelephonyClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setCarrierBundleProviderController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setActiveContexts:(id)a3
{
}

- (NSMutableDictionary)mobileCodesToISOCountryCode
{
  return self->_mobileCodesToISOCountryCode;
}

- (void).cxx_destruct
{
}

@end