@interface IDSFirewallStore
+ (id)sharedInstance;
- (BOOL)addEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6;
- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4;
- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4 isDonated:(BOOL)a5;
- (BOOL)removeAllEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5;
- (BOOL)removeAllEntriesWithCategory:(unsigned int)a3;
- (BOOL)removeEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6;
- (BOOL)removeEntriesWithCategory:(unsigned int)a3 isDonated:(BOOL)a4;
- (IDSFirewallStore)init;
- (IDSFirewallStore)initWithFilePath:(id)a3;
- (NSMutableDictionary)recentlyBlockedHandles;
- (NSString)filePath;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_source)databaseCloseTimer;
- (double)databaseLastUpdateTime;
- (id)_createFirewallRecordsFromSQLRecords:(__CFArray *)a3;
- (id)blockedEntriesForCategory:(unsigned int)a3;
- (id)getAllAllowedEntriesForCategory:(unsigned int)a3;
- (id)getDonatedAllowedEntriesForCategory:(unsigned int)a3;
- (unint64_t)_currentLocalTime;
- (unint64_t)initialProcessTime;
- (unint64_t)initialServerTime;
- (void)_performInitialHousekeeping;
- (void)_registerSysdiagnoseBlock;
- (void)_runCleanupWithExpirationInterval:(double)a3;
- (void)_setDatabaseCloseTimerOnIvarQueue;
- (void)_startCleanupTimer;
- (void)addToBlockedList:(id)a3 forCategory:(unsigned int)a4;
- (void)closeDatabase;
- (void)runCleanupWithExpirationInterval:(double)a3;
- (void)setDatabaseCloseTimer:(id)a3;
- (void)setDatabaseLastUpdateTime:(double)a3;
- (void)setFilePath:(id)a3;
- (void)setInitialProcessTime:(unint64_t)a3;
- (void)setInitialServerTime:(unint64_t)a3;
- (void)setIvarQueue:(id)a3;
- (void)setRecentlyBlockedHandles:(id)a3;
@end

@implementation IDSFirewallStore

+ (id)sharedInstance
{
  if (qword_1009C0CE0 != -1) {
    dispatch_once(&qword_1009C0CE0, &stru_100903DC8);
  }
  return (id)qword_1009C0CE8;
}

- (IDSFirewallStore)init
{
  return -[IDSFirewallStore initWithFilePath:](self, "initWithFilePath:", 0LL);
}

- (IDSFirewallStore)initWithFilePath:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSFirewallStore;
  v5 = -[IDSFirewallStore init](&v21, "init");
  v6 = v5;
  if (v5)
  {
    -[IDSFirewallStore setFilePath:](v5, "setFilePath:", v4);
    uint64_t v7 = OSLogHandleForIDSCategory("IDSFirewallStore");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDS Firewall System Starting Up", v20, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"IDSFirewallStore"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSFirewallStore", @"IDS Firewall System Starting Up");
    }

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);

    dispatch_queue_t v14 = dispatch_queue_create("IDSFirewallStore", v13);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v14;

    v6->_initialProcessTime = mach_continuous_time();
    objc_msgSend((id)IMWeakLinkClass(@"APSConnection", @"ApplePushService"), "serverTime");
    v6->_initialServerTime = (unint64_t)v16;
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    recentlyBlockedHandles = v6->_recentlyBlockedHandles;
    v6->_recentlyBlockedHandles = v17;

    -[IDSFirewallStore _performInitialHousekeeping](v6, "_performInitialHousekeeping");
    -[IDSFirewallStore _startCleanupTimer](v6, "_startCleanupTimer");
    -[IDSFirewallStore _registerSysdiagnoseBlock](v6, "_registerSysdiagnoseBlock");
  }

  return v6;
}

- (BOOL)addEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (-[IDSFirewallStore isAllowed:category:isDonated:](self, "isAllowed:category:isDonated:", v16, v7, v6))
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1003B919C;
          v23[3] = &unk_100903DF0;
          v23[4] = self;
          v23[5] = v16;
          int v24 = v7;
          BOOL v25 = v6;
          sub_1001A354C(v23, self->_filePath);
        }

        else
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_1003B9240;
          v18[3] = &unk_100903E18;
          v18[4] = self;
          id v19 = v11;
          uint64_t v20 = v16;
          int v21 = v7;
          BOOL v22 = v6;
          sub_1001A354C(v18, self->_filePath);
        }
      }

      id v13 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v13);
  }

  return 1;
}

- (BOOL)removeEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10 && [v10 count])
  {
    unsigned int v28 = a5;
    __int128 v29 = self;
    BOOL v30 = a6;
    id v31 = v11;
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uri]);
          int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 prefixedURI]);

          if (v21) {
            -[NSMutableSet addObject:](v12, "addObject:", v21);
          }
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v19 mergeID]);

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 mergeID]);
            -[NSMutableSet addObject:](v13, "addObject:", v23);
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }

      while (v16);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1003B95FC;
    v32[3] = &unk_100903DF0;
    unsigned int v35 = v28;
    BOOL v36 = v30;
    v33 = v12;
    v34 = v13;
    filePath = v29->_filePath;
    BOOL v25 = v13;
    __int128 v26 = v12;
    sub_1001A354C(v32, filePath);

    id v11 = v31;
  }

  return 1;
}

- (BOOL)removeAllEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    __int128 v26 = self;
    unsigned int v27 = a5;
    id v28 = v9;
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uri", v26));
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURI]);

          if (v19) {
            -[NSMutableSet addObject:](v10, "addObject:", v19);
          }
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 mergeID]);

          if (v20)
          {
            int v21 = (void *)objc_claimAutoreleasedReturnValue([v17 mergeID]);
            -[NSMutableSet addObject:](v11, "addObject:", v21);
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v14);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1003B9888;
    v29[3] = &unk_1008F88C0;
    unsigned int v32 = v27;
    BOOL v30 = v10;
    id v31 = v11;
    filePath = v26->_filePath;
    v23 = v11;
    int v24 = v10;
    sub_1001A354C(v29, filePath);

    id v9 = v28;
  }

  return 1;
}

- (BOOL)removeAllEntriesWithCategory:(unsigned int)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003B9930;
  v4[3] = &unk_1008F9268;
  unsigned int v5 = a3;
  sub_1001A354C(v4, self->_filePath);
  return 1;
}

- (BOOL)removeEntriesWithCategory:(unsigned int)a3 isDonated:(BOOL)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003B9994;
  v5[3] = &unk_100903E38;
  unsigned int v6 = a3;
  BOOL v7 = a4;
  sub_1001A354C(v5, self->_filePath);
  return 1;
}

- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4 isDonated:(BOOL)a5
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003B9A80;
  v11[3] = &unk_100903E60;
  id v13 = &v16;
  id v8 = a3;
  id v12 = v8;
  unsigned int v14 = a4;
  BOOL v15 = a5;
  sub_1001A354C(v11, self->_filePath);
  char v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4
{
  uint64_t v18 = 0LL;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003B9C18;
  v14[3] = &unk_100903E88;
  uint64_t v16 = &v18;
  id v6 = a3;
  id v15 = v6;
  unsigned int v17 = a4;
  sub_1001A354C(v14, self->_filePath);
  if (!*((_BYTE *)v19 + 24))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mergeID]);

    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1003B9C68;
      v10[3] = &unk_100903E88;
      id v12 = &v18;
      id v11 = v6;
      unsigned int v13 = a4;
      sub_1001A354C(v10, self->_filePath);
    }
  }

  char v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)getAllAllowedEntriesForCategory:(unsigned int)a3
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1003B9D6C;
  id v11 = sub_1003B9D7C;
  id v12 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003B9D84;
  v5[3] = &unk_100903E88;
  unsigned int v6 = a3;
  void v5[4] = self;
  v5[5] = &v7;
  sub_1001A354C(v5, self->_filePath);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)getDonatedAllowedEntriesForCategory:(unsigned int)a3
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1003B9D6C;
  id v11 = sub_1003B9D7C;
  id v12 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003B9E94;
  v5[3] = &unk_100903E88;
  unsigned int v6 = a3;
  void v5[4] = self;
  v5[5] = &v7;
  sub_1001A354C(v5, self->_filePath);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)blockedEntriesForCategory:(unsigned int)a3
{
  recentlyBlockedHandles = self->_recentlyBlockedHandles;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a3));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](recentlyBlockedHandles, "objectForKey:", v4));
  unsigned int v6 = v5;
  if (!v5) {
    unsigned int v5 = &__NSArray0__struct;
  }
  id v7 = v5;

  return v7;
}

- (id)_createFirewallRecordsFromSQLRecords:(__CFArray *)a3
{
  BOOL v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count << 32 >= 1)
    {
      CFIndex v5 = 0LL;
      uint64_t v23 = (int)Count;
      do
      {
        unsigned int v6 = objc_autoreleasePoolPush();
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a3, v5);
        int v8 = CFArrayGetCount(ValueAtIndex);
        uint64_t v9 = CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = CFArrayGetValueAtIndex(ValueAtIndex, 1LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        unsigned int v13 = CFArrayGetValueAtIndex(ValueAtIndex, 2LL);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        id v15 = 0LL;
        if (v8 == 4)
        {
          uint64_t v16 = CFArrayGetValueAtIndex(ValueAtIndex, 3LL);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
        }

        unsigned int v17 = -[IDSURI initWithPrefixedURI:](objc_alloc(&OBJC_CLASS___IDSURI), "initWithPrefixedURI:", v10);
        id v18 = objc_alloc(&OBJC_CLASS___IDSFirewallEntry);
        [v12 doubleValue];
        char v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
        id v20 = [v18 initWithURI:v17 andLastSeenDate:v19];

        if (v20)
        {
          if (v15) {
            [v20 setMergeID:v15];
          }
          objc_msgSend(v20, "setIsDonated:", objc_msgSend(v14, "BOOLValue", v22));
          -[NSMutableArray addObject:](v22, "addObject:", v20);
        }

        objc_autoreleasePoolPop(v6);
        ++v5;
      }

      while (v23 != v5);
    }

    CFRelease(a3);
  }

  return v22;
}

- (void)addToBlockedList:(id)a3 forCategory:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  recentlyBlockedHandles = self->_recentlyBlockedHandles;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  int v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](recentlyBlockedHandles, "objectForKey:", v7));

  if (!v8) {
    int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  -[NSMutableSet addObject:](v8, "addObject:", v11);
  uint64_t v9 = self->_recentlyBlockedHandles;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, v10);
}

- (void)runCleanupWithExpirationInterval:(double)a3
{
}

- (unint64_t)_currentLocalTime
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v3 timeIntervalSince1970];
    unint64_t v5 = (unint64_t)v4;
  }

  else
  {
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = -[IDSFirewallStore initialProcessTime](self, "initialProcessTime");
    unint64_t v8 = (v6 - v7) * info.numer / info.denom;
    return -[IDSFirewallStore initialServerTime](self, "initialServerTime") + v8 / 0x3B9ACA00;
  }

  return v5;
}

- (void)_performInitialHousekeeping
{
}

- (void)_registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003BA554;
  v6[3] = &unk_1008F97C8;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = im_primary_queue(v2, v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100301AD8(v6, (uint64_t)@"IDS-Firewall-DB", (uint64_t)v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_setDatabaseCloseTimerOnIvarQueue
{
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (!self->_databaseCloseTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_ivarQueue);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v3;

    unint64_t v5 = self->_databaseCloseTimer;
    dispatch_time_t v6 = dispatch_time(0LL, 0x8BB2C90000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    id v7 = self->_databaseCloseTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1003BA994;
    handler[3] = &unk_1008F6010;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
  }

- (void)closeDatabase
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSFirewallStore");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(0LL, @"IDSFirewallStore"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSFirewallStore", @"Closing database.");
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003BAB20;
  v6[3] = &unk_1008F6010;
  void v6[4] = self;
  sub_1001A354C(v6, self->_filePath);
}

- (void)_startCleanupTimer
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSFirewallStore");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Scheduling Cleanup Timer", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(1LL, @"IDSFirewallStore"))
  {
    _IDSLogV(1LL, @"IDSFoundation", @"IDSFirewallStore", @"Scheduling Cleanup Timer");
  }

  dispatch_source_t v6 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_ivarQueue);
  id v7 = (void *)qword_1009C0CF0;
  qword_1009C0CF0 = (uint64_t)v6;

  unint64_t v8 = (dispatch_source_s *)qword_1009C0CF0;
  if (qword_1009C0CF0)
  {
    dispatch_time_t v9 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer(v8, v9, 0x14F46B04000uLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1003BACD0;
    handler[3] = &unk_1008F6010;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1009C0CF0, handler);
    dispatch_resume((dispatch_object_t)qword_1009C0CF0);
  }

- (void)_runCleanupWithExpirationInterval:(double)a3
{
  uint64_t v5 = OSLogHandleForIDSCategory("IDSFirewallStore");
  dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Scheduling timer called", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(1LL, @"IDSFirewallStore"))
  {
    _IDSLogV(1LL, @"IDSFoundation", @"IDSFirewallStore", @"Scheduling timer called");
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003BADF0;
  v8[3] = &unk_1008F68C8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  sub_1001A354C(v8, self->_filePath);
}

- (unint64_t)initialProcessTime
{
  return self->_initialProcessTime;
}

- (void)setInitialProcessTime:(unint64_t)a3
{
  self->_initialProcessTime = a3;
}

- (unint64_t)initialServerTime
{
  return self->_initialServerTime;
}

- (void)setInitialServerTime:(unint64_t)a3
{
  self->_initialServerTime = a3;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (OS_dispatch_source)databaseCloseTimer
{
  return self->_databaseCloseTimer;
}

- (void)setDatabaseCloseTimer:(id)a3
{
}

- (double)databaseLastUpdateTime
{
  return self->_databaseLastUpdateTime;
}

- (void)setDatabaseLastUpdateTime:(double)a3
{
  self->_databaseLastUpdateTime = a3;
}

- (NSMutableDictionary)recentlyBlockedHandles
{
  return self->_recentlyBlockedHandles;
}

- (void)setRecentlyBlockedHandles:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end