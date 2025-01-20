@interface ADRemoraLanguageCache
- (ADRemoraLanguageCache)init;
- (void)_languageCodeDidChange:(id)a3 forEndpointUUID:(id)a4;
- (void)accessoryLanguageSettingsChanged:(id)a3;
- (void)getActiveLanguageCodesWithCompletion:(id)a3;
- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4;
@end

@implementation ADRemoraLanguageCache

- (ADRemoraLanguageCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADRemoraLanguageCache;
  v2 = -[ADRemoraLanguageCache init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("languageCacheQueue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    languageToUUIDMap = v2->_languageToUUIDMap;
    v2->_languageToUUIDMap = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uuidToLanguageMap = v2->_uuidToLanguageMap;
    v2->_uuidToLanguageMap = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    [v11 registerObserverForEndpointLifeCycleChanges:v2];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"accessoryLanguageSettingsChanged:" name:@"RemoraHomeKitSettingsLanguageChangeNotification" object:0];
  }

  return v2;
}

- (void)getActiveLanguageCodesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100178B84;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)accessoryLanguageSettingsChanged:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADRemoraLanguageCache accessoryLanguageSettingsChanged:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"accessoryUniqueIdentifier"]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"siriInputLanguage"]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v13 = v11;
  }
  else {
    id v13 = 0LL;
  }

  objc_super v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADRemoraLanguageCache accessoryLanguageSettingsChanged:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s endpointUUID = %@, inputSiriLanguage = %@",  buf,  0x20u);
  }

  if (v9 && v13)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100178B48;
    block[3] = &unk_1004FD4C0;
    block[4] = self;
    id v17 = v13;
    id v18 = v9;
    dispatch_async(queue, block);
  }
}

- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100178AB4;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_languageCodeDidChange:(id)a3 forEndpointUUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uuidToLanguageMap, "objectForKey:", v6));
    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_languageToUUIDMap, "objectForKey:", v7));
      [v8 removeObject:v6];
    }

    id v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_languageToUUIDMap, "objectForKey:", v10));
    if (!v9) {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    }
    -[NSMutableSet addObject:](v9, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_languageToUUIDMap, "setObject:forKey:", v9, v10);
    -[NSMutableDictionary setObject:forKey:](self->_uuidToLanguageMap, "setObject:forKey:", v10, v6);
  }
}

- (void).cxx_destruct
{
}

@end