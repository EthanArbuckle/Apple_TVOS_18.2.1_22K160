@interface AFSiriUserNotificationRequestCapabilityManager
+ (BOOL)supportedByApplicationWithBundleID:(id)a3;
+ (Class)_classForPlatform:(int64_t)a3;
+ (id)sharedManager;
- (BOOL)hasEligibleSetup;
- (BOOL)requestCanBeHandled;
- (id)_initWithPlatform:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)fetchEligibleSetupStateWithCompletion:(id)a3;
- (void)fetchRequestCanBeHandledStateWithCompletion:(id)a3;
- (void)notifyObserversOfCurrentEligibleSetupState:(BOOL)a3 onPlatform:(int64_t)a4;
- (void)notifyObserversOfCurrentRequestCanBeHandledState:(BOOL)a3 onPlatform:(int64_t)a4;
- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation AFSiriUserNotificationRequestCapabilityManager

- (id)_initWithPlatform:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AFSiriUserNotificationRequestCapabilityManager;
  v4 = -[AFSiriUserNotificationRequestCapabilityManager init](&v15, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AFSiriUserNotificationRequestCapabilityManager", v6);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v9;

    id v11 = [(id)objc_opt_class(v4) _classForPlatform:a3];
    v4->_platform = (int64_t)[v11 platform];
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 provider]);
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v12;

    -[AFAnnouncementRequestCapabilityProviding addDelegate:](v4->_capabilityProvider, "addDelegate:", v4);
  }

  return v4;
}

- (void)fetchEligibleSetupStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100216F08;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (BOOL)hasEligibleSetup
{
  if (AFIsInternalInstall(self) && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v26) = 136315138;
      *(void *)((char *)&v26 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s Always Opportune so marking as eligible setup. This should only be used for testing.",  (uint8_t *)&v26,  0xCu);
    }

    LOBYTE(v4) = 1;
  }

  else
  {
    dispatch_queue_attr_t v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100216DEC;
    v20[3] = &unk_1004FB890;
    dispatch_queue_t v7 = v5;
    v21 = v7;
    id v8 = -[AFSafetyBlock initWithBlock:](v6, "initWithBlock:", v20);
    unint64_t v4 = (unint64_t)-[AFAnnouncementRequestCapabilityProviding lastKnownEligibleAnnouncementRequestTypes]( self->_capabilityProvider,  "lastKnownEligibleAnnouncementRequestTypes") & 1;
    *(void *)&__int128 v26 = 0LL;
    *((void *)&v26 + 1) = &v26;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100216DF4;
    v15[3] = &unk_1004F6BE0;
    v18 = &v26;
    uint64_t v9 = v8;
    char v19 = v4;
    v16 = v9;
    v17 = self;
    -[AFSiriUserNotificationRequestCapabilityManager fetchEligibleSetupStateWithCompletion:]( self,  "fetchEligibleSetupStateWithCompletion:",  v15);
    dispatch_time_t v10 = dispatch_time(0LL, 2000000000LL);
    uint64_t v11 = dispatch_group_wait(v7, v10);
    -[AFSafetyBlock invoke](v9, "invoke");
    uint64_t v12 = (os_log_s *)AFSiriLogContextConnection;
    if (v11)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Timed out fetching eligible setup",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(unsigned __int8 *)(*((void *)&v26 + 1) + 24LL);
        *(_DWORD *)buf = 136315394;
        v23 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Eligble Setup: %lu", buf, 0x16u);
      }

      LOBYTE(v4) = *(_BYTE *)(*((void *)&v26 + 1) + 24LL) != 0;
    }

    _Block_object_dispose(&v26, 8);
  }

  return v4;
}

- (void)fetchRequestCanBeHandledStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100216D6C;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (BOOL)requestCanBeHandled
{
  if (AFIsInternalInstall(self) && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v25) = 136315138;
      *(void *)((char *)&v25 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s Always Opportune, requests can be handled. This should only be used for testing.",  (uint8_t *)&v25,  0xCu);
    }

    return 1;
  }

  else
  {
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v25) = 136315138;
      *(void *)((char *)&v25 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v25, 0xCu);
    }

    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    dispatch_queue_t v7 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100216D50;
    v19[3] = &unk_1004FB890;
    id v8 = v6;
    v20 = v8;
    uint64_t v9 = -[AFSafetyBlock initWithBlock:](v7, "initWithBlock:", v19);
    *(void *)&__int128 v25 = 0LL;
    *((void *)&v25 + 1) = &v25;
    uint64_t v26 = 0x2020000000LL;
    char v27 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100216D58;
    v16[3] = &unk_1004F88C0;
    v18 = &v25;
    dispatch_time_t v10 = v9;
    v17 = v10;
    -[AFSiriUserNotificationRequestCapabilityManager fetchRequestCanBeHandledStateWithCompletion:]( self,  "fetchRequestCanBeHandledStateWithCompletion:",  v16);
    dispatch_time_t v11 = dispatch_time(0LL, 2000000000LL);
    uint64_t v12 = dispatch_group_wait(v8, v11);
    -[AFSafetyBlock invoke](v10, "invoke");
    v13 = (os_log_s *)AFSiriLogContextConnection;
    if (v12)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Timed out fetching request can be handled",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v15 = *(unsigned __int8 *)(*((void *)&v25 + 1) + 24LL);
      *(_DWORD *)buf = 136315394;
      v22 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      __int16 v23 = 1024;
      int v24 = v15;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Request can be handled: %d",  buf,  0x12u);
    }

    BOOL v4 = *(_BYTE *)(*((void *)&v25 + 1) + 24LL) != 0;

    _Block_object_dispose(&v25, 8);
  }

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObserversOfCurrentEligibleSetupState:(BOOL)a3 onPlatform:(int64_t)a4
{
  BOOL v5 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v6 = self->_observers;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_time_t v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "hasEligibleSetupChanged:onPlatform:") & 1) != 0) {
          objc_msgSend(v11, "hasEligibleSetupChanged:onPlatform:", v5, a4, (void)v12);
        }
        if (a4 == 1) {
          [v11 hasEligibleSetupChanged:v5];
        }
      }

      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }
}

- (void)notifyObserversOfCurrentRequestCanBeHandledState:(BOOL)a3 onPlatform:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    observers = self->_observers;
    __int128 v15 = v7;
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:]";
    __int16 v23 = 2048;
    NSUInteger v24 = -[NSHashTable count](observers, "count");
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Notifying %lu observers, request can be handled? %d",  buf,  0x1Cu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = self->_observers;
  id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "requestCanBeHandledChanged:onPlatform:") & 1) != 0) {
          objc_msgSend(v13, "requestCanBeHandledChanged:onPlatform:", v5, a4, (void)v16);
        }
        if (a4 == 1) {
          [v13 requestCanBeHandledChanged:v5];
        }
      }

      id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v10);
  }
}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  unint64_t v5 = a4 & 1;
  id v6 = [(id)objc_opt_class(a3) platform];
  -[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:]( self,  "notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:",  v5,  v6);
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100217264;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_1005781A8 != -1) {
    dispatch_once(&qword_1005781A8, block);
  }
  return (id)qword_1005781B0;
}

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t IsValid = AFSiriAnnouncementPlatformGetIsValid(a3, a2);
  if ((IsValid & 1) != 0)
  {
    if (((1LL << a3) & 0x1A) == 0)
    {
      unint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    unint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      int v8 = 136315394;
      id v9 = "+[AFSiriUserNotificationRequestCapabilityManager _classForPlatform:]";
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s platform %li is not valid, using headphones provider.",  (uint8_t *)&v8,  0x16u);
    }
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AFHeadphonesAnnouncementRequestCapabilityProvider);
  uint64_t IsValid = objc_claimAutoreleasedReturnValue(v6);
  return (Class)(id)IsValid;
}

+ (BOOL)supportedByApplicationWithBundleID:(id)a3
{
  id v3 = a3;
  if (AFIsInternalInstall(v3)
    && _AFPreferencesSpokenNotificationShouldAnnounceAllNotifications())
  {
    BOOL v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      id v9 = "+[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Allow all notifications to be announced. This should only be used for testing.",  (uint8_t *)&v8,  0xCu);
    }

    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned __int8 v5 = 1;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]( &OBJC_CLASS___AFSiriAnnouncementRequestCapabilityManager,  "supportedAnnouncementTypesForBundleId:onPlatform:",  v3,  1LL));
  }

  return v5;
}

@end