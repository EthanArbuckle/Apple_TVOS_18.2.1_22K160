@interface ADRemoraCleanupManager
- (ADRemoraCleanupManager)init;
- (void)_deleteLanguagePreferenceForInstanceContext:(id)a3;
- (void)_deletePreferencesForInstanceContext:(id)a3;
- (void)_removeUserSupportDirectoryOfInactiveAcccessories:(id)a3;
- (void)cleanupUntilDate:(id)a3;
- (void)homehubManager:(id)a3 didDeleteEndpointWithContext:(id)a4;
@end

@implementation ADRemoraCleanupManager

- (ADRemoraCleanupManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADRemoraCleanupManager;
  v2 = -[ADRemoraCleanupManager init](&v17, "init");
  if (v2)
  {
    id v3 = sub_100259E8C();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = sub_100259ECC("com.apple.assistant.remora-cleanup.manager", v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc(&OBJC_CLASS___ADRemoraEndpointAssistantDeletionManager);
    id v9 = sub_100259E8C();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = sub_100259ECC("com.apple.assistant.remora-cleanup.endpoint-assistant-deletion", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = -[ADRemoraEndpointAssistantDeletionManager initWithQueue:](v8, "initWithQueue:", v12);
    endpointAssistantDeletionManager = v2->_endpointAssistantDeletionManager;
    v2->_endpointAssistantDeletionManager = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    [v15 registerObserverForEndpointLifeCycleChanges:v2];
  }

  return v2;
}

- (void)homehubManager:(id)a3 didDeleteEndpointWithContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ADRemoraCleanupManager homehubManager:didDeleteEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100259E60;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_deletePreferencesForInstanceContext:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ADRemoraCleanupManager _deletePreferencesForInstanceContext:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s instanceContext = %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADAccount activeAccountForInstanceContext:]( &OBJC_CLASS___ADAccount,  "activeAccountForInstanceContext:",  v4));
  if (v6)
  {
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315395;
      v12 = "-[ADRemoraCleanupManager _deletePreferencesForInstanceContext:]";
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s activeAccount = %{private}@",  (uint8_t *)&v11,  0x16u);
    }

    endpointAssistantDeletionManager = self->_endpointAssistantDeletionManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 endpointUUID]);
    -[ADRemoraEndpointAssistantDeletionManager addAccount:forEndpointUUID:]( endpointAssistantDeletionManager,  "addAccount:forEndpointUUID:",  v6,  v9);
  }

  id v10 = -[AFPreferences initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___AFPreferences),  "initWithInstanceContext:",  v4);
  -[AFPreferences erasePreferences](v10, "erasePreferences");
}

- (void)_deleteLanguagePreferenceForInstanceContext:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ADRemoraCleanupManager _deleteLanguagePreferenceForInstanceContext:]";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s instanceContext = %@", (uint8_t *)&v11, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 endpointUUID]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessoriesLanguages]);
    id v9 = [v8 mutableCopy];

    [v9 removeObjectForKey:v6];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v10 setAccessoriesLangauges:v9];
  }
}

- (void)_removeUserSupportDirectoryOfInactiveAcccessories:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[ADRemoraCleanupManager _removeUserSupportDirectoryOfInactiveAcccessories:]";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s activeAccessoriesUUIDs = %@", buf, 0x16u);
  }

  uint64_t v6 = AFUserSupportDirectoryPath(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"Endpoints/"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v17 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:v8 error:&v17]);
  id v11 = v17;

  if (v11)
  {
    v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADRemoraCleanupManager _removeUserSupportDirectoryOfInactiveAcccessories:]";
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to determine User Support Directories of Endpoints due to error: %@",  buf,  0x16u);
    }
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100259C7C;
    v13[3] = &unk_1004F7AE8;
    id v14 = v3;
    id v15 = v8;
    id v16 = 0LL;
    [v10 enumerateObjectsUsingBlock:v13];
  }
}

- (void)cleanupUntilDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    [v4 timeIntervalSinceNow];
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[ADRemoraCleanupManager cleanupUntilDate:]";
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s limitDate = %@ (%f seconds)", buf, 0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100259918;
  v10[3] = &unk_1004F7B10;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchActiveEndpointUUIDsWithCompletion:v10];
}

- (void).cxx_destruct
{
}

@end