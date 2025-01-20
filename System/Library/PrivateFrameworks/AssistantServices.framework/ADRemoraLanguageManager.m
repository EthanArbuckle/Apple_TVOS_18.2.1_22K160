@interface ADRemoraLanguageManager
- (ADRemoraHomeKitSettingsManager)homeKitSettingsManager;
- (ADRemoraLanguageManager)initWithHomeKitSettingsManager:(id)a3;
- (NSMutableDictionary)endpointUUIDsToInputSiriLanguageCode;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)didChangeInputLanguageCodeForEndpoint:(id)a3 newLanguageCode:(id)a4;
- (void)setEndpointUUIDsToInputSiriLanguageCode:(id)a3;
- (void)setHomeKitSettingsManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)syncCurrentEndpointLanguages;
@end

@implementation ADRemoraLanguageManager

- (ADRemoraLanguageManager)initWithHomeKitSettingsManager:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[ADRemoraLanguageManager initWithHomeKitSettingsManager:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Initializing language manager", buf, 0xCu);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADRemoraLanguageManager;
  v7 = -[ADRemoraLanguageManager init](&v17, "init");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  endpointUUIDsToInputSiriLanguageCode = v7->_endpointUUIDsToInputSiriLanguageCode;
  v7->_endpointUUIDsToInputSiriLanguageCode = (NSMutableDictionary *)v8;

  objc_storeStrong((id *)&v7->_homeKitSettingsManager, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 languagesForEndpoints]);
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ADRemoraLanguageManager initWithHomeKitSettingsManager:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Stored languages exist. Will not immediately call syncCurrentEndpointLanguages",  buf,  0xCu);
    }

    objc_storeStrong((id *)&v7->_endpointUUIDsToInputSiriLanguageCode, v12);
  }

  else
  {
    -[ADRemoraLanguageManager syncCurrentEndpointLanguages](v7, "syncCurrentEndpointLanguages");
  }

  dispatch_queue_t v14 = dispatch_queue_create("ADRemoraLanguageManager", 0LL);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v14;

  -[ADRemoraHomeKitSettingsManager registerObserverForHubLanguageChanges:]( v7->_homeKitSettingsManager,  "registerObserverForHubLanguageChanges:",  v7);
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADRemoraLanguageManager;
  -[ADRemoraLanguageManager dealloc](&v3, "dealloc");
}

- (void)syncCurrentEndpointLanguages
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADRemoraLanguageManager syncCurrentEndpointLanguages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Fetching endpoint languages...", buf, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100200BC4;
  v5[3] = &unk_1004F64E0;
  v5[4] = self;
  [v4 fetchEndpointUUIDsWithCompletion:v5];
}

- (void)didChangeInputLanguageCodeForEndpoint:(id)a3 newLanguageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002007E4;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (NSMutableDictionary)endpointUUIDsToInputSiriLanguageCode
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setEndpointUUIDsToInputSiriLanguageCode:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (ADRemoraHomeKitSettingsManager)homeKitSettingsManager
{
  return (ADRemoraHomeKitSettingsManager *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setHomeKitSettingsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end