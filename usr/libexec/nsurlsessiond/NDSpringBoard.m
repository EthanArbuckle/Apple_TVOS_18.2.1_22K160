@interface NDSpringBoard
+ (id)sharedSpringBoard;
- (BOOL)application:(id)a3 hasAssertionWithName:(id)a4;
- (BOOL)application:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5;
- (BOOL)applicationBackgroundUpdatesEnabled:(id)a3;
- (BOOL)applicationHasBackgroundTaskCompletion:(id)a3;
- (BOOL)applicationIsForeground:(id)a3;
- (BOOL)identifierIsForSpringBoardApplication:(id)a3;
- (BOOL)isValidAssertion:(id)a3 withName:(id)a4;
- (BOOL)takeAssertionForBundleID:(id)a3 sessionID:(id)a4 sessionUUID:(id)a5 pid:(int)a6;
- (BOOL)wakeUpApp:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5;
- (NDSpringBoard)init;
- (id)assertionNameForSessionUUID:(id)a3;
- (id)getBackgroundSettingsAppList;
- (void)_onqueue_releaseAssertionForBundleID:(id)a3 sessionID:(id)a4;
- (void)addObserver:(id)a3 forApplication:(id)a4;
- (void)dealloc;
- (void)handleBackgroundSettingsChange;
- (void)handleStateUpdate:(id)a3 forProcess:(id)a4;
- (void)monitoredBundleIDsUpdated;
- (void)releaseAssertionForBundleID:(id)a3 sessionID:(id)a4;
- (void)removeObserver:(id)a3 forApplication:(id)a4;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
@end

@implementation NDSpringBoard

- (NDSpringBoard)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NDSpringBoard;
  v2 = -[NDSpringBoard init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10003BC18;
    v26[3] = &unk_1000798D8;
    v4 = v2;
    v27 = v4;
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v26));
    monitor = v4->_monitor;
    v4->_monitor = (RBSProcessMonitor *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    assertions = v4->_assertions;
    v4->_assertions = (NSMutableDictionary *)v7;

    v4->_assertion_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    observers = v4->_observers;
    v4->_observers = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    appIsForeground = v4->_appIsForeground;
    v4->_appIsForeground = (NSMutableDictionary *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v4->_backgroundUpdatesAllowed = [v13 isAutomaticAppUpdatesAllowed];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v4,  (CFNotificationCallback)sub_10003BD10,  @"kKeepAppsUpToDateEnabledChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    observedBackgroundSettings = v4->_observedBackgroundSettings;
    v4->_observedBackgroundSettings = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    monitoredBundleIDs = v4->_monitoredBundleIDs;
    v4->_monitoredBundleIDs = (NSMutableSet *)v17;

    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.nsnetwork.SpringBoard-queue", v22);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v23;
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NDSpringBoard;
  -[NDSpringBoard dealloc](&v4, "dealloc");
}

- (id)getBackgroundSettingsAppList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentDomainForName:@"com.apple.mt"]);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"KeepAppsUpToDateAppList"]);
  return v4;
}

- (void)handleBackgroundSettingsChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B5F8;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AD48;
  block[3] = &unk_100079968;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)addObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003ABE0;
  block[3] = &unk_100079968;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)removeObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AAC0;
  block[3] = &unk_100079968;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)monitoredBundleIDsUpdated
{
  monitor = self->_monitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003A9D8;
  v3[3] = &unk_1000798D8;
  v3[4] = self;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v3);
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003A840;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003A724;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (BOOL)applicationIsForeground:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10003A4D0;
  uint64_t v15 = sub_10003A4E0;
  id v16 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A5C4;
  block[3] = &unk_100079990;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = [(id)v12[5] BOOLValue];

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)isValidAssertion:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "validating assertion %@",  (uint8_t *)&v10,  0xCu);
    if (!v6) {
      goto LABEL_6;
    }
  }

  else if (!v6)
  {
    goto LABEL_6;
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 explanation]);
  if (!-[os_log_s isEqualToString:](v7, "isEqualToString:", v6))
  {
    unsigned __int8 v8 = 0;
LABEL_7:

    goto LABEL_8;
  }

- (BOOL)application:(id)a3 hasAssertionWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  os_unfair_lock_lock(&self->_assertion_lock);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
  os_unfair_lock_unlock(&self->_assertion_lock);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003A580;
  v14[3] = &unk_1000799B8;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  id v16 = &v17;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  int v10 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v18 + 24)) {
      id v11 = "found";
    }
    else {
      id v11 = "could not find";
    }
    *(_DWORD *)buf = 136315650;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s assertion with name %@ for bundle id %@",  buf,  0x20u);
  }

  BOOL v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (BOOL)applicationHasBackgroundTaskCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "looking for background task completion for bundle id %@",  buf,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v5,  0LL));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState", 0));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assertions]);

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) reason] == (id)4)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (BOOL)application:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDSpringBoard assertionNameForSessionUUID:](self, "assertionNameForSessionUUID:", v10));
  BOOL v12 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "looking for background session %@ for bundle id %@",  (uint8_t *)&v17,  0x16u);
  }

  if (v9)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v8));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v9]);

    os_unfair_lock_unlock(&self->_assertion_lock);
    if (v14) {
      BOOL v15 = -[NDSpringBoard isValidAssertion:withName:](self, "isValidAssertion:withName:", v14, v11);
    }
    else {
      BOOL v15 = 0;
    }
  }

  else
  {
    BOOL v15 = -[NDSpringBoard application:hasAssertionWithName:](self, "application:hasAssertionWithName:", v8, v11);
  }

  return v15;
}

- (BOOL)applicationBackgroundUpdatesEnabled:(id)a3
{
  id v4 = a3;
  if (self->_backgroundUpdatesAllowed)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observedBackgroundSettings,  "objectForKeyedSubscript:",  v4));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_onqueue_releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_assertion_lock = &self->_assertion_lock;
  os_unfair_lock_lock(&self->_assertion_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
    [v11 removeObjectForKey:v7];

    os_unfair_lock_unlock(p_assertion_lock);
    BOOL v12 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Invalidating assertion for bundleID: %@. sessionID: %@",  (uint8_t *)&v13,  0x16u);
    }

    [v10 invalidate];
  }

  else
  {
    os_unfair_lock_unlock(&self->_assertion_lock);
  }
}

- (void)releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A570;
  block[3] = &unk_100079968;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)assertionNameForSessionUUID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.nsurlsessiond.handlesession %@",  a3));
}

- (BOOL)takeAssertionForBundleID:(id)a3 sessionID:(id)a4 sessionUUID:(id)a5 pid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v32 = a5;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDSpringBoard assertionNameForSessionUUID:](self, "assertionNameForSessionUUID:"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.cfnetwork",  @"BackgroundDownload"));
  id v13 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v6));
  v41 = v12;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
  id v16 = [v13 initWithExplanation:v33 target:v14 attributes:v15];

  id v34 = 0LL;
  unsigned __int8 v17 = [v16 acquireWithError:&v34];
  id v18 = v34;
  if ((v17 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    BOOL v20 = v19 == 0LL;

    if (v20)
    {
      dispatch_queue_attr_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertions, "setObject:forKeyedSubscript:", v21, v10);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v11]);
    BOOL v24 = v23 == 0LL;

    if (!v24)
    {
      __int16 v25 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v10;
        __int16 v37 = 2112;
        id v38 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "We already have an assertion for bundleID: %@, sessionID: %@",  buf,  0x16u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertions,  "objectForKeyedSubscript:",  v10));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v11]);
      [v27 invalidate];
    }

    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    [v28 setObject:v16 forKeyedSubscript:v11];

    os_unfair_lock_unlock(&self->_assertion_lock);
    v29 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "took assertion for %@, session %@, uuid %@",  buf,  0x20u);
    }
  }

  else
  {
    v30 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Couldn't create process assertion for %@ (%@)",  buf,  0x16u);
    }
  }

  return v17;
}

- (BOOL)wakeUpApp:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v29 = a5;
  id v10 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2112;
    v48 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Will request wake of app %@ for NDSession <%{public}@> with identifier %@",  buf,  0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v9,  @"UIApplicationLaunchOptionsURLSessionKey",  v29));
  v51[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v51[1] = FBSOpenApplicationOptionKeyPayloadOptions;
  v52[0] = &__kCFBooleanTrue;
  v52[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v48 = sub_10003A4D0;
  v49 = sub_10003A4E0;
  id v50 = 0LL;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = sub_10003A4D0;
  __int16 v39 = sub_10003A4E0;
  id v40 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  __int16 v15 = self;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v12));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10003A4E8;
  v31[3] = &unk_1000799E0;
  v33 = buf;
  id v34 = &v35;
  unsigned __int8 v17 = v13;
  id v32 = v17;
  [v14 openApplication:v8 withOptions:v16 completion:v31];

  dispatch_time_t v18 = dispatch_time(0LL, 10000000000LL);
  uint64_t v19 = dispatch_semaphore_wait(v17, v18);
  uint64_t v20 = v36[5];
  if (v20 || (__int16 v23 = *(void **)(*(void *)&buf[8] + 40LL)) == 0LL)
  {
    uint64_t v21 = qword_100083990;
    if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)v41 = 138412802;
    id v42 = v8;
    __int16 v43 = 2112;
    uint64_t v44 = v20;
    __int16 v45 = 1024;
    BOOL v46 = v19 != 0;
    id v26 = "Failed to open application %@, error: %@ timeout: %{BOOL}d";
    v27 = (os_log_s *)v21;
    uint32_t v28 = 28;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, v41, v28);
    goto LABEL_5;
  }

  unsigned __int8 v24 = -[NDSpringBoard takeAssertionForBundleID:sessionID:sessionUUID:pid:]( v15,  "takeAssertionForBundleID:sessionID:sessionUUID:pid:",  v8,  v9,  v30,  [v23 pid]);
  __int16 v25 = (os_log_s *)qword_100083990;
  if ((v24 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)v41 = 138412290;
    id v42 = v8;
    id v26 = "Failed to take process assertion for %@";
    v27 = v25;
    uint32_t v28 = 12;
    goto LABEL_13;
  }

  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v41 = 138412290;
    id v42 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Successfully woke application %@ and took process assertion",  v41,  0xCu);
  }

- (BOOL)identifierIsForSpringBoardApplication:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  unsigned __int8 v5 = [v4 applicationIsInstalled:v3];

  return v5;
}

- (void).cxx_destruct
{
}

+ (id)sharedSpringBoard
{
  if (qword_100083980 != -1) {
    dispatch_once(&qword_100083980, &stru_100079888);
  }
  return (id)qword_100083988;
}

@end