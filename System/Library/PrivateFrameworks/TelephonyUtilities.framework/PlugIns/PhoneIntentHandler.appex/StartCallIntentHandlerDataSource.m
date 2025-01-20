@interface StartCallIntentHandlerDataSource
- (BOOL)callRinging;
- (BOOL)callsInProgress;
- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection;
- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection;
- (BOOL)expectFoundInAppsContacts;
- (BOOL)expectUpstreamContactRecommendation;
- (BOOL)hasCamera;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable;
- (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable;
- (BOOL)isFaceTimeAudioBlocked;
- (BOOL)isFaceTimeVideoBlocked;
- (BOOL)isMMIOrUSSDNumber:(id)a3;
- (BOOL)supportsDisplayingFaceTimeAudioCalls;
- (BOOL)supportsDisplayingFaceTimeVideoCalls;
- (BOOL)supportsFaceTimeAudioCalls;
- (BOOL)supportsFaceTimeVideoCalls;
- (BOOL)supportsPrimaryCalling;
- (BOOL)supportsTelephonyCalls;
- (BOOL)useLegacyContactResolution;
- (BOOL)useLegacyHandleResolution;
- (CallHistoryDataSource)callHistoryDataSource;
- (CoreTelephonyClient)coreTelephonyClient;
- (CoreTelephonyDataSource)coreTelephonyDataSource;
- (EmergencyServicesOverrideProvider)emergencyServicesOverrideProvider;
- (FavoritesDataSource)favoritesDataSource;
- (IntentHandlerFeatureFlags)featureFlags;
- (NSArray)siriEmergencyServices;
- (NSDate)now;
- (NSString)siriLanguageCode;
- (OS_dispatch_queue)dispatchQueue;
- (RadiosPreferences)radiosPreferences;
- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4;
- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4 emergencyProvider:(id)a5 emergencyServicesOverrideProvider:(id)a6;
- (TUCallCenter)callCenter;
- (TUCallProvider)emergencyProvider;
- (TUCallProviderManager)providerManager;
- (TUContactsDataSource)contactsDataSource;
- (TUSenderIdentityClient)senderIdentityClient;
- (id)fetchSPIHandlesForGroupID:(id)a3;
- (id)restrictedContacts:(id)a3 callProvider:(id)a4;
- (unint64_t)callFilterStatusForDialRequest:(id)a3;
- (void)logOutgoingCallToHandle:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFeatureFlags:(id)a3;
@end

@implementation StartCallIntentHandlerDataSource

- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4
{
  return -[StartCallIntentHandlerDataSource initWithDispatchQueue:featureFlags:emergencyProvider:emergencyServicesOverrideProvider:]( self,  "initWithDispatchQueue:featureFlags:emergencyProvider:emergencyServicesOverrideProvider:",  a3,  a4,  self->_emergencyProvider,  self->_emergencyServicesOverrideProvider);
}

- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4 emergencyProvider:(id)a5 emergencyServicesOverrideProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___StartCallIntentHandlerDataSource;
  v15 = -[StartCallIntentHandlerDataSource init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dispatchQueue, a3);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  v16->_dispatchQueue));
    callCenter = v16->_callCenter;
    v16->_callCenter = (TUCallCenter *)v17;

    objc_storeStrong((id *)&v16->_featureFlags, a4);
    objc_storeStrong((id *)&v16->_emergencyProvider, a5);
    objc_storeStrong((id *)&v16->_emergencyServicesOverrideProvider, a6);
  }

  return v16;
}

- (TUCallProviderManager)providerManager
{
  providerManager = self->_providerManager;
  if (!providerManager)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }

  return providerManager;
}

- (TUCallProvider)emergencyProvider
{
  emergencyProvider = self->_emergencyProvider;
  if (!emergencyProvider)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource providerManager](self, "providerManager"));
    v5 = (TUCallProvider *)objc_claimAutoreleasedReturnValue([v4 emergencyProvider]);
    v6 = self->_emergencyProvider;
    self->_emergencyProvider = v5;

    emergencyProvider = self->_emergencyProvider;
  }

  return emergencyProvider;
}

- (EmergencyServicesOverrideProvider)emergencyServicesOverrideProvider
{
  emergencyServicesOverrideProvider = self->_emergencyServicesOverrideProvider;
  if (!emergencyServicesOverrideProvider)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___EmergencyServicesOverrideProvider);
    v5 = self->_emergencyServicesOverrideProvider;
    self->_emergencyServicesOverrideProvider = v4;

    emergencyServicesOverrideProvider = self->_emergencyServicesOverrideProvider;
  }

  return emergencyServicesOverrideProvider;
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (FavoritesDataSource)favoritesDataSource
{
  favoritesDataSource = self->_favoritesDataSource;
  if (!favoritesDataSource)
  {
    v4 = -[StartCallDefaultFavoritesDataSource initWithCallCenter:]( objc_alloc(&OBJC_CLASS___StartCallDefaultFavoritesDataSource),  "initWithCallCenter:",  self->_callCenter);
    v5 = self->_favoritesDataSource;
    self->_favoritesDataSource = (FavoritesDataSource *)v4;

    favoritesDataSource = self->_favoritesDataSource;
  }

  return favoritesDataSource;
}

- (CallHistoryDataSource)callHistoryDataSource
{
  callHistoryDataSource = self->_callHistoryDataSource;
  if (!callHistoryDataSource)
  {
    id v4 = +[CHManager siriManagerForIntentType:]( &OBJC_CLASS___CHManager,  "siriManagerForIntentType:",  objc_opt_class(&OBJC_CLASS___INStartCallIntent));
    v5 = (CallHistoryDataSource *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_callHistoryDataSource;
    self->_callHistoryDataSource = v5;

    callHistoryDataSource = self->_callHistoryDataSource;
  }

  return callHistoryDataSource;
}

- (RadiosPreferences)radiosPreferences
{
  radiosPreferences = self->_radiosPreferences;
  if (!radiosPreferences)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___RadiosPreferences);
    v5 = self->_radiosPreferences;
    self->_radiosPreferences = v4;

    radiosPreferences = self->_radiosPreferences;
  }

  return radiosPreferences;
}

- (BOOL)supportsFaceTimeAudioCalls
{
  return +[TUCallCapabilities supportsFaceTimeAudioCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsFaceTimeAudioCalls");
}

- (BOOL)supportsFaceTimeVideoCalls
{
  return +[TUCallCapabilities supportsFaceTimeVideoCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsFaceTimeVideoCalls");
}

- (BOOL)isAirplaneModeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource radiosPreferences](self, "radiosPreferences"));
  unsigned __int8 v3 = [v2 airplaneMode];

  return v3;
}

- (unint64_t)callFilterStatusForDialRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B394;
  block[3] = &unk_100034858;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)restrictedContacts:(id)a3 callProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  objc_super v20 = sub_10001B520;
  v21 = sub_10001B530;
  id v22 = 0LL;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource dispatchQueue](self, "dispatchQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001B538;
  v13[3] = &unk_100034880;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (BOOL)supportsPrimaryCalling
{
  return +[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling");
}

- (BOOL)callRinging
{
  id v3 = IntentHandlerDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking if there is any call ringing currently",  buf,  2u);
  }

  *(void *)buf = 0LL;
  id v13 = buf;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001B73C;
  v11[3] = &unk_1000348A8;
  v11[4] = self;
  v11[5] = buf;
  dispatch_sync(dispatchQueue, v11);
  id v6 = IntentHandlerDefaultLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v13[24]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    *(_DWORD *)v16 = 138412290;
    uint64_t v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "is there any call ringing currently? %@",  v16,  0xCu);
  }

  uint8_t v9 = v13[24];
  _Block_object_dispose(buf, 8);
  return v9;
}

- (BOOL)callsInProgress
{
  id v3 = IntentHandlerDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking if there is any call in progress.",  buf,  2u);
  }

  *(void *)buf = 0LL;
  id v13 = buf;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001B948;
  v11[3] = &unk_1000348A8;
  v11[4] = self;
  v11[5] = buf;
  dispatch_sync(dispatchQueue, v11);
  id v6 = IntentHandlerDefaultLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v13[24]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    *(_DWORD *)v16 = 138412290;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "is there any call in progress? %@", v16, 0xCu);
  }

  uint8_t v9 = v13[24];
  _Block_object_dispose(buf, 8);
  return v9;
}

- (BOOL)hasCamera
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BA0C;
  v5[3] = &unk_1000348D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsTelephonyCalls
{
  return +[TUCallCapabilities supportsTelephonyCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsTelephonyCalls");
}

- (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable
{
  return +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable]( &OBJC_CLASS___TUCallCapabilities,  "isDirectFaceTimeAudioCallingCurrentlyAvailable");
}

- (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable
{
  return +[TUCallCapabilities isDirectFaceTimeVideoCallingCurrentlyAvailable]( &OBJC_CLASS___TUCallCapabilities,  "isDirectFaceTimeVideoCallingCurrentlyAvailable");
}

- (BOOL)isFaceTimeAudioBlocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v3 = [v2 callingBlocked];

  return v3;
}

- (BOOL)isFaceTimeVideoBlocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v3 = [v2 faceTimeBlocked];

  return v3;
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeAudioCalls");
}

- (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeVideoCalls");
}

- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  return +[TUCallCapabilities canAttemptTelephonyCallsWithoutCellularConnection]( &OBJC_CLASS___TUCallCapabilities,  "canAttemptTelephonyCallsWithoutCellularConnection");
}

- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  return +[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnection]( &OBJC_CLASS___TUCallCapabilities,  "canAttemptEmergencyCallsWithoutCellularConnection");
}

- (void)logOutgoingCallToHandle:(id)a3
{
}

- (NSString)siriLanguageCode
{
  return +[INPreferences siriLanguageCode](&OBJC_CLASS___INPreferences, "siriLanguageCode");
}

- (TUContactsDataSource)contactsDataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource callCenter](self, "callCenter"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contactStore]);

  return (TUContactsDataSource *)v3;
}

- (CoreTelephonyDataSource)coreTelephonyDataSource
{
  return (CoreTelephonyDataSource *)+[DefaultCoreTelephonyDataSource sharedInstance]( &OBJC_CLASS___DefaultCoreTelephonyDataSource,  "sharedInstance");
}

- (NSDate)now
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

- (BOOL)useLegacyContactResolution
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"UseLegacyContactResolution"];

  return v3;
}

- (BOOL)useLegacyHandleResolution
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"UseLegacyHandleResolution"];

  return v3;
}

- (NSArray)siriEmergencyServices
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource featureFlags](self, "featureFlags"));
  unsigned __int8 v4 = [v3 emergencyServicesOverrideEnabled];

  if ((v4 & 1) == 0)
  {
    id v11 = IntentHandlerDefaultLog();
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100020B08();
    }
    goto LABEL_7;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource emergencyProvider](self, "emergencyProvider"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 emergencyLabeledHandles]);
  id v7 = [v6 count];

  id v8 = IntentHandlerDefaultLog();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10) {
      sub_100020AA8();
    }
LABEL_7:

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandlerDataSource emergencyProvider](self, "emergencyProvider"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 emergencyLabeledHandles]);
    goto LABEL_8;
  }

  if (v10) {
    sub_100020A7C();
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandlerDataSource emergencyServicesOverrideProvider]( self,  "emergencyServicesOverrideProvider"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 emergencyServicesOverrides]);
LABEL_8:
  uint64_t v14 = (void *)v13;

  return (NSArray *)v14;
}

- (BOOL)expectUpstreamContactRecommendation
{
  id v2 = IntentHandlerDefaultLog();
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = _os_feature_enabled_impl("SiriInference", "native_flow_contact_resolution");
    v5 = @"OFF";
    if (v4) {
      v5 = @"ON";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SiriInference/native_flow_contact_resolution: %@",  (uint8_t *)&v7,  0xCu);
  }

  return _os_feature_enabled_impl("SiriInference", "native_flow_contact_resolution");
}

- (BOOL)expectFoundInAppsContacts
{
  id v2 = IntentHandlerDefaultLog();
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = _os_feature_enabled_impl("SiriInference", "found_in_app_contacts");
    v5 = @"OFF";
    if (v4) {
      v5 = @"ON";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SiriInference/found_in_app_contacts: %@",  (uint8_t *)&v7,  0xCu);
  }

  return _os_feature_enabled_impl("SiriInference", "found_in_app_contacts");
}

- (BOOL)isMMIOrUSSDNumber:(id)a3
{
  return TUIsMMIOrUSSDNumber(a3, a2);
}

- (id)fetchSPIHandlesForGroupID:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.messages.imcore.spi.qos-unspecified", v6);

  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10001B520;
  v26 = sub_10001B530;
  id v27 = 0LL;
  if ([v3 length])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001C170;
    v19[3] = &unk_1000348F8;
    v21 = &v22;
    id v8 = dispatch_semaphore_create(0LL);
    objc_super v20 = v8;
    IMSPIQueryChatWithGuid(v3, 0LL, v7, v19);
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait(v8, v9);
  }

  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v23[5] handles]);
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "spiChat person handles: %@", buf, 0xCu);
  }

  uint64_t v13 = (void *)v23[5];
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handles]);
    BOOL v15 = [v14 count] == 0;

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([(id)v23[5] handles]);
      uint64_t v17 = (NSMutableArray *)[v16 copy];

      int v4 = v17;
    }
  }

  _Block_object_dispose(&v22, 8);

  return v4;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (IntentHandlerFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end