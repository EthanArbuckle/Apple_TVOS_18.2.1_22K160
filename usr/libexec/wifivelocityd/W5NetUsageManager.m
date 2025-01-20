@interface W5NetUsageManager
+ (void)copyPeriodicNetUsageToDir:(id)a3 uuid:(id)a4;
+ (void)writeProcNetUsage:(id)a3 ToFile:(id)a4;
- (W5NetUsageManager)init;
- (id)_getCurrentUsage;
- (id)_getProcNetUsageWithName:(id)a3 inUsageData:(id)a4;
- (id)calculateUsageDelta:(id)a3;
- (void)recordUsageToDate:(id)a3;
- (void)startPeriodicUsageMonitor:(double)a3 maxEntries:(unint64_t)a4 uuid:(id)a5;
- (void)stopPeriodicUsageMonitor:(id)a3;
@end

@implementation W5NetUsageManager

- (W5NetUsageManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___W5NetUsageManager;
  v2 = -[W5NetUsageManager init](&v22, "init");
  if (objc_opt_class(&OBJC_CLASS___AnalyticsWorkspace, v3) && objc_opt_class(&OBJC_CLASS___UsageFeed, v4))
  {
    id v5 = objc_alloc(&OBJC_CLASS___AnalyticsWorkspace);
    v6 = (W5NetUsageManager *)[v5 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
    if (v6
      && (v7 = -[UsageFeed initWithWorkspace:](objc_alloc(&OBJC_CLASS___UsageFeed), "initWithWorkspace:", v6),
          usageFeed = v2->_usageFeed,
          v2->_usageFeed = v7,
          usageFeed,
          v2->_usageFeed))
    {
      v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
      usageSnaphots = v2->_usageSnaphots;
      v2->_usageSnaphots = v9;

      v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
      periodicUsageFiles = v2->_periodicUsageFiles;
      v2->_periodicUsageFiles = v11;

      v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
      periodicBufferHead = v2->_periodicBufferHead;
      v2->_periodicBufferHead = v13;

      v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
      netUsageTimer = v2->_netUsageTimer;
      v2->_netUsageTimer = v15;

      uint64_t v17 = sub_10008C90C();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        v24 = "-[W5NetUsageManager init]";
        __int16 v25 = 2080;
        v26 = "W5NetUsageManager.m";
        __int16 v27 = 1024;
        int v28 = 72;
        LODWORD(v21) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Init Success: Symptoms Framework Client",  (const char *)&v23,  v21,  LODWORD(v22.receiver));
      }
    }

    else
    {
      v18 = (os_log_s *)v6;
      v6 = v2;
      v2 = 0LL;
    }

    v19 = v2;

    v2 = v6;
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

- (id)_getCurrentUsage
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10000FE80;
  v21 = sub_10000FE90;
  id v22 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  usageFeed = self->_usageFeed;
  v29[0] = kSymptomAnalyticsServiceRefreshUsage;
  v29[1] = kSymptomAnalyticsServiceExtensionUsage;
  v30[0] = &__kCFBooleanTrue;
  v30[1] = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  uint64_t v6 = kUsageProcessProcName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000FE98;
  v14[3] = &unk_1000D1320;
  v16 = &v17;
  v7 = v3;
  v15 = v7;
  LOBYTE(usageFeed) = -[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:]( usageFeed,  "usageToDateWithOptionsFor:nameKind:options:reply:",  0LL,  v6,  v5,  v14);

  if ((usageFeed & 1) == 0)
  {
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = (uint64_t)"-[W5NetUsageManager _getCurrentUsage]";
      __int16 v25 = 2080;
      v26 = "W5NetUsageManager.m";
      __int16 v27 = 1024;
      int v28 = 104;
      LODWORD(v13) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Failed to issue usageToDate request",  (const char *)buf,  v13,  LODWORD(v14[0]));
    }
  }

  dispatch_time_t v10 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v7, v10) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)recordUsageToDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_usageSnaphots, "objectForKey:", v4));

  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_usageSnaphots, "setObject:forKeyedSubscript:", v6, v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  id v8 = [v7 count];

  if ((unint64_t)v8 <= 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5NetUsageManager _getCurrentUsage](self, "_getCurrentUsage"));
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = -[W5WiFiNetUsageRecord init:usageData:]( objc_alloc(&OBJC_CLASS___W5WiFiNetUsageRecord),  "init:usageData:",  v10,  v9);
    if (v9)
    {
      uint64_t v12 = sub_10008C90C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136316418;
        uint64_t v17 = "-[W5NetUsageManager recordUsageToDate:]";
        __int16 v18 = 2080;
        uint64_t v19 = "W5NetUsageManager.m";
        __int16 v20 = 1024;
        int v21 = 124;
        __int16 v22 = 2048;
        id v23 = [v9 count];
        __int16 v24 = 2114;
        __int16 v25 = v10;
        __int16 v26 = 2112;
        id v27 = v4;
        int v15 = 58;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Recording Network Usage for %ld entries, at: %{public}@, for UUID: %@",  &v16,  v15);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_usageSnaphots,  "objectForKeyedSubscript:",  v4));
      [v14 addObject:v11];
    }
  }
}

- (void)startPeriodicUsageMonitor:(double)a3 maxEntries:(unint64_t)a4 uuid:(id)a5
{
  id v8 = (NSURL *)a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_netUsageTimer, "objectForKey:", v8));

  if (v9)
  {
    uint64_t v10 = sub_10008C90C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136315906;
      v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
      __int16 v38 = 2080;
      v39 = "W5NetUsageManager.m";
      __int16 v40 = 1024;
      int v41 = 133;
      __int16 v42 = 2112;
      v43 = v8;
      int v29 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) WARN: Starting a new periodic collection for UUID:%@ when one is already active. Will cancel the last one",  &v36,  v29);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_netUsageTimer,  "objectForKeyedSubscript:",  v8));
    [v12 invalidate];
  }

  v13 = objc_alloc(&OBJC_CLASS___NSURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL UUIDString](v8, "UUIDString"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.wifivelocity/%@/netusage",  v14));
  int v16 = -[NSURL initFileURLWithPath:](v13, "initFileURLWithPath:", v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v35 = 0LL;
  unsigned int v18 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v35];
  id v19 = v35;

  uint64_t v20 = sub_10008C90C();
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 136316418;
    v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    __int16 v38 = 2080;
    v39 = "W5NetUsageManager.m";
    __int16 v40 = 1024;
    int v41 = 144;
    __int16 v42 = 2112;
    v43 = v16;
    __int16 v44 = 1024;
    unsigned int v45 = v18;
    __int16 v46 = 2112;
    id v47 = v19;
    LODWORD(v28) = 54;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) Create Directory: %@, success: %d, error: %@",  &v36,  v28);
  }

  __int16 v22 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_periodicUsageFiles,  "setObject:forKeyedSubscript:",  v22,  v8);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_periodicBufferHead,  "setObject:forKeyedSubscript:",  v23,  v8);

  uint64_t v24 = sub_10008C90C();
  __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 136315906;
    v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    __int16 v38 = 2080;
    v39 = "W5NetUsageManager.m";
    __int16 v40 = 1024;
    int v41 = 149;
    __int16 v42 = 2112;
    v43 = v8;
    LODWORD(v28) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] %s (%s:%u) Starting Periodic Netusage data collection for UUID: %@",  &v36,  v28);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010668;
  block[3] = &unk_1000D1370;
  block[4] = self;
  v31 = v8;
  double v33 = a3;
  v32 = v16;
  unint64_t v34 = a4;
  __int16 v26 = v16;
  id v27 = v8;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)stopPeriodicUsageMonitor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_netUsageTimer, "objectForKey:", v4));

  if (v5)
  {
    uint64_t v6 = sub_10008C90C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = "-[W5NetUsageManager stopPeriodicUsageMonitor:]";
      __int16 v13 = 2080;
      v14 = "W5NetUsageManager.m";
      __int16 v15 = 1024;
      int v16 = 189;
      __int16 v17 = 2112;
      id v18 = v4;
      int v10 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) Stopping Periodic Netusage data collection for UUID: %@",  &v11,  v10);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_netUsageTimer, "objectForKeyedSubscript:", v4));
    [v8 invalidate];

    -[NSMutableDictionary removeObjectForKey:](self->_netUsageTimer, "removeObjectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_periodicUsageFiles,  "objectForKeyedSubscript:",  v4));
    [v9 removeAllObjects];

    -[NSMutableDictionary removeObjectForKey:](self->_periodicUsageFiles, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_periodicBufferHead, "removeObjectForKey:", v4);
  }
}

- (id)_getProcNetUsageWithName:(id)a3 inUsageData:(id)a4
{
  id v5 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", @"procName", (void)v16));
        unsigned __int8 v13 = [v12 isEqualToString:v5];

        if ((v13 & 1) != 0)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_11:

  return v14;
}

- (id)calculateUsageDelta:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_usageSnaphots, "objectForKey:", v4));

  if (!v5)
  {
    uint64_t v29 = sub_10008C90C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = 136315906;
      v48 = "-[W5NetUsageManager calculateUsageDelta:]";
      __int16 v49 = 2080;
      v50 = "W5NetUsageManager.m";
      __int16 v51 = 1024;
      int v52 = 214;
      __int16 v53 = 2112;
      id v54 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "[wifivelocity] %s (%s:%u) No usage snaphots found for UUID: %@",  &v47,  38);
    }

    goto LABEL_21;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  id v7 = [v6 count];

  if (v7 != (id)2)
  {
    uint64_t v32 = sub_10008C90C();
    double v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_usageSnaphots,  "objectForKeyedSubscript:",  v4));
      v48 = "-[W5NetUsageManager calculateUsageDelta:]";
      __int16 v49 = 2080;
      int v47 = 136316162;
      v50 = "W5NetUsageManager.m";
      __int16 v51 = 1024;
      int v52 = 220;
      __int16 v53 = 2048;
      id v54 = [v34 count];
      __int16 v55 = 2112;
      id v56 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) Unable to calclulate NetUsage Delta: Incorrect numer of entires: %ld for UUID: %@",  &v47,  48);
    }

LABEL_21:
    __int16 v38 = 0LL;
    goto LABEL_22;
  }

  __int16 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_usageSnaphots, "objectForKeyedSubscript:", v4));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 usageData]);

  id obj = v10;
  id v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v37 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"procName"]);
        id v16 = v4;
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_usageSnaphots,  "objectForKeyedSubscript:",  v4));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:0]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 usageData]);
        uint64_t v20 = self;
        int v21 = (void *)objc_claimAutoreleasedReturnValue( -[W5NetUsageManager _getProcNetUsageWithName:inUsageData:]( self,  "_getProcNetUsageWithName:inUsageData:",  v15,  v19));

        if (v21)
        {
          __int16 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = sub_100011440;
          v39[3] = &unk_1000D1398;
          v39[4] = v14;
          id v40 = v21;
          int v41 = v22;
          id v23 = v22;
          [v14 enumerateKeysAndObjectsUsingBlock:v39];
          -[NSMutableArray addObject:](v38, "addObject:", v23);
        }

        else
        {
          id v23 = (NSMutableDictionary *)[v14 copy];
          -[NSMutableArray addObject:](v38, "addObject:", v23);
        }

        id v4 = v16;
        self = v20;
      }

      id v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v12);
  }

  uint64_t v24 = sub_10008C90C();
  __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = -[NSMutableArray count](v38, "count");
    v48 = "-[W5NetUsageManager calculateUsageDelta:]";
    __int16 v49 = 2080;
    int v47 = 136316162;
    v50 = "W5NetUsageManager.m";
    __int16 v51 = 1024;
    int v52 = 249;
    __int16 v53 = 2048;
    id v54 = v26;
    __int16 v55 = 2112;
    id v56 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] %s (%s:%u) Calculated Network Usage Delta for %ld entries, UUID: %@",  &v47,  48);
  }

  uint64_t v27 = sub_10008C90C();
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v47 = 136315906;
    v48 = "-[W5NetUsageManager calculateUsageDelta:]";
    __int16 v49 = 2080;
    v50 = "W5NetUsageManager.m";
    __int16 v51 = 1024;
    int v52 = 251;
    __int16 v53 = 2112;
    id v54 = v4;
    LODWORD(v35) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) Clearing NetUsage records for UUID: %@",  &v47,  v35);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_usageSnaphots, "removeObjectForKey:", v4);
LABEL_22:

  return v38;
}

+ (void)copyPeriodicNetUsageToDir:(id)a3 uuid:(id)a4
{
  id v39 = a3;
  id v5 = a4;
  id v6 = objc_alloc(&OBJC_CLASS___NSURL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.wifivelocity/%@/netusage",  v7));
  uint64_t v9 = -[NSURL initFileURLWithPath:](v6, "initFileURLWithPath:", v8);

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v46 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:4 error:&v46]);
  id v12 = v46;

  uint64_t v13 = sub_10008C90C();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = (NSURL *)[v11 count];
    int v47 = 136315906;
    v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
    __int16 v49 = 2080;
    v50 = "W5NetUsageManager.m";
    __int16 v51 = 1024;
    int v52 = 268;
    __int16 v53 = 2048;
    id v54 = v15;
    LODWORD(v33) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Copying %ld netusage files",  (const char *)&v47,  v33,  v34,  v36);
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v11;
  id v16 = [obj countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v35 = v9;
    id v37 = v5;
    __int128 v18 = 0LL;
    uint64_t v19 = *(void *)v43;
    do
    {
      uint64_t v20 = 0LL;
      int v21 = v12;
      do
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v22 = *(NSURL **)(*((void *)&v42 + 1) + 8LL * (void)v20);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v22, "lastPathComponent"));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v39 URLByAppendingPathComponent:v23]);

        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v41 = v21;
        unsigned int v26 = [v25 copyItemAtURL:v22 toURL:v24 error:&v41];
        id v12 = v41;

        uint64_t v27 = sub_10008C90C();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v47 = 136316674;
          v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
          __int16 v49 = 2080;
          v50 = "W5NetUsageManager.m";
          __int16 v51 = 1024;
          int v52 = 274;
          __int16 v53 = 2112;
          id v54 = v22;
          __int16 v55 = 2112;
          *(void *)id v56 = v24;
          *(_WORD *)&v56[8] = 1024;
          *(_DWORD *)&v56[10] = v26;
          __int16 v57 = 2112;
          id v58 = v12;
          LODWORD(v33) = 64;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) Copy: %@ -> %@, success: %d, error: %@",  &v47,  v33);
        }

        v18 += v26;
        uint64_t v20 = (char *)v20 + 1;
        int v21 = v12;
      }

      while (v17 != v20);
      id v17 = [obj countByEnumeratingWithState:&v42 objects:v59 count:16];
    }

    while (v17);
    uint64_t v9 = v35;
    id v5 = v37;
  }

  else
  {
    __int128 v18 = 0LL;
    unsigned int v26 = 0;
  }

  if (v18 == [obj count])
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v40 = v12;
    [v29 removeItemAtURL:v9 error:&v40];
    id v30 = v40;

    uint64_t v31 = sub_10008C90C();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = 136316418;
      v48 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
      __int16 v49 = 2080;
      v50 = "W5NetUsageManager.m";
      __int16 v51 = 1024;
      int v52 = 281;
      __int16 v53 = 2112;
      id v54 = v9;
      __int16 v55 = 1024;
      *(_DWORD *)id v56 = v26;
      *(_WORD *)&v56[4] = 2112;
      *(void *)&v56[6] = v30;
      LODWORD(v33) = 54;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[wifivelocity] %s (%s:%u) Delete: %@, success: %d, error: %@",  &v47,  v33);
    }
  }

  else
  {
    id v30 = v12;
  }
}

+ (void)writeProcNetUsage:(id)a3 ToFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_10008C90C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
    __int16 v22 = 2080;
    int v20 = 136316162;
    id v23 = "W5NetUsageManager.m";
    __int16 v24 = 1024;
    int v25 = 287;
    __int16 v26 = 2048;
    id v27 = [v5 count];
    __int16 v28 = 2114;
    id v29 = v6;
    int v17 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) Writing %ld Network Usage entries to: %{public}@",  &v20,  v17);
  }

  if ([v5 count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100011C98;
    v18[3] = &unk_1000D13C0;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    id v19 = v9;
    [v5 enumerateObjectsUsingBlock:v18];
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
    unsigned int v13 = [v10 createFileAtPath:v11 contents:v12 attributes:0];

    if (v13)
    {
      uint64_t v14 = sub_10008C90C();
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        int v21 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
        __int16 v22 = 2080;
        id v23 = "W5NetUsageManager.m";
        __int16 v24 = 1024;
        int v25 = 303;
        __int16 v26 = 2114;
        id v27 = v6;
        LODWORD(v16) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Generated Network Usage File at: %{public}@",  &v20,  v16);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end