@interface ADLocalContextStore
- (ADLocalContextStore)initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6;
- (id)_builtInProviders;
- (id)_contextLinkMessageOptions;
- (id)_deviceContextToVendForPrivacyClass:(int64_t)a3;
- (id)_initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6 deviceCircleManager:(id)a7;
- (id)_localContextWithPrivacyClass:(int64_t)a3;
- (id)localContextWithPrivacyClass:(int64_t)a3;
- (void)_didUpdateContext;
- (void)_initializeBuiltInContextProviders;
- (void)_pushContextToCollector:(id)a3 forReason:(id)a4 includingKeys:(id)a5 excludingMandatoryKeys:(id)a6 includingKeysInResponse:(id)a7 excludingMandatoryKeysInResponse:(id)a8 completion:(id)a9;
- (void)_pushContextToCollectorsForReason:(id)a3 completion:(id)a4;
- (void)_updateLocalPeerInfo:(id)a3;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5;
- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7;
- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4;
- (void)localPeerInfoUpdatedFrom:(id)a3 to:(id)a4;
- (void)pushContextToContextCollectorIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 expectingResponseIncludingKeys:(id)a5 excludingMandatoryKeys:(id)a6 completion:(id)a7;
- (void)registerContextTransformer:(id)a3 forType:(id)a4;
- (void)setMyriadAdvertisementContext:(id)a3 completion:(id)a4;
- (void)updateRapportLink:(id)a3;
@end

@implementation ADLocalContextStore

- (ADLocalContextStore)initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  v15 = -[ADLocalContextStore _initWithInstanceContext:rapportLink:queue:delegate:deviceCircleManager:]( self,  "_initWithInstanceContext:rapportLink:queue:delegate:deviceCircleManager:",  v13,  v12,  v11,  v10,  v14);

  return v15;
}

- (id)_initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6 deviceCircleManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___ADLocalContextStore;
  v17 = -[ADLocalContextStore init](&v37, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a5);
    if (v12) {
      v19 = (AFInstanceContext *)v12;
    }
    else {
      v19 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v18->_instanceContext;
    v18->_instanceContext = v19;

    objc_storeWeak((id *)&v18->_delegate, v15);
    objc_storeStrong((id *)&v18->_deviceCircleManager, a7);
    v21 = objc_alloc_init(&OBJC_CLASS___AFMutableDeviceContext);
    localContext = v18->_localContext;
    v18->_localContext = v21;

    -[AFMutableDeviceContext setFromLocalDevice:](v18->_localContext, "setFromLocalDevice:", 1LL);
    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    redactedContextByPrivacyClass = v18->_redactedContextByPrivacyClass;
    v18->_redactedContextByPrivacyClass = v23;

    v25 = v18->_redactedContextByPrivacyClass;
    v26 = objc_alloc_init(&OBJC_CLASS___AFMutableDeviceContext);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, &off_1005133F0);

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    contextTransformersByType = v18->_contextTransformersByType;
    v18->_contextTransformersByType = (NSMapTable *)v27;

    queue = (dispatch_queue_s *)v18->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018E5EC;
    block[3] = &unk_1004FD940;
    v30 = v18;
    v36 = v30;
    dispatch_async(queue, block);
    objc_storeStrong(v30 + 5, a4);
    [v30[5] addListener:v30];
    -[ADDeviceCircleManager addListener:](v18->_deviceCircleManager, "addListener:", v30);
    v31 = (dispatch_queue_s *)v18->_queue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10018E634;
    v33[3] = &unk_1004FD940;
    v34 = v30;
    dispatch_async(v31, v33);
  }

  return v18;
}

- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018E5A0;
    block[3] = &unk_1004FB930;
    void block[4] = self;
    id v10 = v6;
    int64_t v11 = a3;
    dispatch_async(queue, block);
  }
}

- (id)localContextWithPrivacyClass:(int64_t)a3
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10018DE18;
  int64_t v11 = sub_10018DE28;
  id v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E564;
  block[3] = &unk_1004F41C8;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_localContextWithPrivacyClass:(int64_t)a3
{
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v5;
    uint64_t StringDescription = AFDeviceContextPrivacyClassGetStringDescription(a3);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(StringDescription);
    int v12 = 136315394;
    id v13 = "-[ADLocalContextStore _localContextWithPrivacyClass:]";
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v12, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADLocalContextStore _deviceContextToVendForPrivacyClass:]( self,  "_deviceContextToVendForPrivacyClass:",  a3));
  if (([v6 isValid] & 1) == 0)
  {
    uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[ADLocalContextStore _localContextWithPrivacyClass:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s #hal Invalid local device context %@",  (uint8_t *)&v12,  0x16u);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (void)updateRapportLink:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E528;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)pushContextToContextCollectorIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 expectingResponseIncludingKeys:(id)a5 excludingMandatoryKeys:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10018E360;
  v23[3] = &unk_1004F7960;
  id v24 = v12;
  v25 = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)_initializeBuiltInContextProviders
{
  if (!self->_builtInProviders)
  {
    id v13 = -[ADAlarmContextProvider initWithDonationService:instanceContext:]( objc_alloc(&OBJC_CLASS___ADAlarmContextProvider),  "initWithDonationService:instanceContext:",  self,  self->_instanceContext);
    v3 = -[ADTimerContextProvider initWithDonationService:instanceContext:]( objc_alloc(&OBJC_CLASS___ADTimerContextProvider),  "initWithDonationService:instanceContext:",  self,  self->_instanceContext);
    id v4 = -[ADMediaPlaybackContextProvider initWithDonationService:instanceContext:queue:]( objc_alloc(&OBJC_CLASS___ADMediaPlaybackContextProvider),  "initWithDonationService:instanceContext:queue:",  self,  self->_instanceContext,  self->_queue);
    v5 = -[ADHomeAnnouncementContextProvider initWithDonationService:instanceContext:]( objc_alloc(&OBJC_CLASS___ADHomeAnnouncementContextProvider),  "initWithDonationService:instanceContext:",  self,  self->_instanceContext);
    id v6 = -[ADMultiUserStateContextProvider initWithDonationService:instanceContext:]( objc_alloc(&OBJC_CLASS___ADMultiUserStateContextProvider),  "initWithDonationService:instanceContext:",  self,  self->_instanceContext);
    uint64_t v7 = -[ADCallStateContextProvider initWithDonationService:instanceContext:]( objc_alloc(&OBJC_CLASS___ADCallStateContextProvider),  "initWithDonationService:instanceContext:",  self,  self->_instanceContext);
    id v8 = -[ADSiriClientStateContextProvider initWithDonationService:instanceContext:queue:]( objc_alloc(&OBJC_CLASS___ADSiriClientStateContextProvider),  "initWithDonationService:instanceContext:queue:",  self,  self->_instanceContext,  self->_queue);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  v13,  v3,  v4,  v5,  v6,  v7,  v8,  0LL));
    if (AFIsATV(v9, v10))
    {
      int64_t v11 = -[ADSystemStateContextProvider initWithDonationService:]( objc_alloc(&OBJC_CLASS___ADSystemStateContextProvider),  "initWithDonationService:",  self);
      -[NSArray addObject:](v9, "addObject:", v11);
    }

    builtInProviders = self->_builtInProviders;
    self->_builtInProviders = v9;
  }

- (void)_updateLocalPeerInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADLocalContextStore _updateLocalPeerInfo:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  -[AFMutableDeviceContext setDeviceInfo:](self->_localContext, "setDeviceInfo:", v4);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_redactedContextByPrivacyClass, "allValues", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setDeviceInfo:v4];
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

  -[ADLocalContextStore _didUpdateContext](self, "_didUpdateContext");
}

- (void)_pushContextToCollectorsForReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADLocalContextStore _deviceContextToVendForPrivacyClass:]( self,  "_deviceContextToVendForPrivacyClass:",  50LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serializedBackingStore]);
  uint64_t v11 = AFDeviceContextKeyAll;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  -[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysInResponse:excludingMandatoryKeysInResponse:completion:]( self,  "_pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysInResponse:excludingMandatoryKey sInResponse:completion:",  v9,  v7,  v10,  0LL,  0LL,  0LL,  v6);
}

- (void)_didUpdateContext
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "localContextStore:didUpdateDeviceContext:");

  if ((v5 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADLocalContextStore _localContextWithPrivacyClass:](self, "_localContextWithPrivacyClass:", 10LL));
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 localContextStore:self didUpdateDeviceContext:v7];
  }

- (id)_contextLinkMessageOptions
{
  uint64_t v3 = RPOptionStatusFlags;
  id v4 = &off_100513408;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (void)_pushContextToCollector:(id)a3 forReason:(id)a4 includingKeys:(id)a5 excludingMandatoryKeys:(id)a6 includingKeysInResponse:(id)a7 excludingMandatoryKeysInResponse:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void (**)(id, void, id))a9;
  if ((AFSupportsHALContextDonation() & 1) == 0)
  {
    id v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysIn"
            "Response:excludingMandatoryKeysInResponse:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s #hal context donation not supported on this platform",  buf,  0xCu);
      if (!v21) {
        goto LABEL_23;
      }
    }

    else if (!v21)
    {
      goto LABEL_23;
    }

    uint64_t v30 = 13LL;
LABEL_21:
    id v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v30));
    v21[2](v21, 0LL, v28);
LABEL_22:

    goto LABEL_23;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v23 = [v22 assistantIsEnabled];

  if ((v23 & 1) != 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysIn"
            "Response:excludingMandatoryKeysInResponse:completion:]";
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s #hal reason: %@", buf, 0x16u);
    }

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v26 = v25;
    if (v15) {
      -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v15);
    }
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v17, @"included_context_types_in_request");
    if ([v18 count]) {
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v18, @"excluded_context_keys_in_request");
    }
    if ([v19 count]) {
      -[NSMutableDictionary setObject:forKey:]( v26,  "setObject:forKey:",  v19,  @"included_context_types_in_response");
    }
    if ([v20 count]) {
      -[NSMutableDictionary setObject:forKey:]( v26,  "setObject:forKey:",  v20,  @"excluded_context_keys_in_response");
    }
    -[NSMutableDictionary setObject:forKey:]( v26,  "setObject:forKey:",  &__kCFBooleanTrue,  @"prefers_assistant_identifiers");
    deviceCircleManager = self->_deviceCircleManager;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10018D9C8;
    v32[3] = &unk_1004F4268;
    v33 = v26;
    v34 = v21;
    v32[4] = self;
    id v28 = v26;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v32);

    goto LABEL_22;
  }

  v31 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysInRe"
          "sponse:excludingMandatoryKeysInResponse:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s #hal skip pushing context to remote because Siri is disabled on this device",  buf,  0xCu);
  }

  if (v21)
  {
    uint64_t v30 = 18LL;
    goto LABEL_21;
  }

- (id)_deviceContextToVendForPrivacyClass:(int64_t)a3
{
  if (!a3 || a3 == 50)
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_redactedContextByPrivacyClass,  "objectForKey:",  &off_1005133F0));
    id v4 = [v5 mutableCopy];
  }

  else if (a3 == 10)
  {
    id v4 = -[AFMutableDeviceContext mutableCopy](self->_localContext, "mutableCopy");
  }

  else
  {
    id v4 = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v4 setIdentifier:v6];

  [v4 setPrivacyClass:a3];
  id v7 = [v4 copy];

  return v7;
}

- (void)registerContextTransformer:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D9B4;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315651;
    id v20 = "-[ADLocalContextStore donateContext:withMetadata:pushToRemote:]";
    __int16 v21 = 2113;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %{private}@ %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10018D594;
  v14[3] = &unk_1004FC250;
  id v15 = v9;
  id v16 = v8;
  id v17 = self;
  BOOL v18 = a5;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "-[ADLocalContextStore donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:]";
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
    if (!v14) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v14)
  {
LABEL_3:
    queue = (dispatch_queue_s *)self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10018D3C8;
    v18[3] = &unk_1004F5B98;
    id v19 = v14;
    id v20 = v12;
    __int16 v21 = self;
    id v22 = v13;
    BOOL v24 = a6;
    id v23 = v15;
    dispatch_async(queue, v18);
  }

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D150;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)localPeerInfoUpdatedFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018CFF4;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_builtInProviders
{
  return self->_builtInProviders;
}

- (void).cxx_destruct
{
}

- (void)setMyriadAdvertisementContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E768;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

@end