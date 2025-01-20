@interface IDSLinkPreferencesManager
+ (id)sharedInstance;
- (BOOL)_validatePreferences:(id)a3 forService:(id)a4;
- (IDSLinkPreferencesManager)init;
- (id)accumulativePreferencesForAllServices;
- (id)preferencesForService:(id)a3;
- (void)_logRequestInPowerDictionaryForService:(id)a3 preferences:(id)a4;
- (void)dealloc;
- (void)resetPreferencesForAllServices;
- (void)updateService:(id)a3 withPreferences:(id)a4;
@end

@implementation IDSLinkPreferencesManager

+ (id)sharedInstance
{
  if (qword_1009BEB10 != -1) {
    dispatch_once(&qword_1009BEB10, &stru_1008FAFF8);
  }
  return (id)qword_1009BEB18;
}

- (IDSLinkPreferencesManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSLinkPreferencesManager;
  v2 = -[IDSLinkPreferencesManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_preferencesLock, 0LL);
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    servicesWithPreferences = v3->_servicesWithPreferences;
    v3->_servicesWithPreferences = v4;

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("IDSPowerLogQueue", v7);
    power_log_queue = v3->_power_log_queue;
    v3->_power_log_queue = (OS_dispatch_queue *)v8;
  }

  return v3;
}

- (void)dealloc
{
  servicesWithPreferences = self->_servicesWithPreferences;
  self->_servicesWithPreferences = 0LL;

  power_log_queue = self->_power_log_queue;
  self->_power_log_queue = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSLinkPreferencesManager;
  -[IDSLinkPreferencesManager dealloc](&v5, "dealloc");
}

- (void)updateService:(id)a3 withPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IDSLinkPreferencesManager _validatePreferences:forService:](self, "_validatePreferences:forService:", v7, v6))
  {
    id v8 = [v7 mutableCopy];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 setObject:v9 forKey:@"Timestamp"];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v8));

    pthread_mutex_lock(&self->_preferencesLock);
    -[NSMutableDictionary setObject:forKey:](self->_servicesWithPreferences, "setObject:forKey:", v10, v6);
    pthread_mutex_unlock(&self->_preferencesLock);
    uint64_t v11 = OSLogHandleForIDSCategory("LinkPreferencesManager");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "updateService: %{public}@, withPreferences: %{public}@.",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(0LL, @"LinkPreferencesManager"))
    {
      id v14 = v6;
      v15 = v10;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkPreferencesManager",  @"updateService: %{public}@, withPreferences: %{public}@.");
    }

    -[IDSLinkPreferencesManager _logRequestInPowerDictionaryForService:preferences:]( self,  "_logRequestInPowerDictionaryForService:preferences:",  v6,  v8,  v14,  v15);
  }

  else
  {
    v10 = v7;
  }
}

- (void)resetPreferencesForAllServices
{
  p_preferencesLock = &self->_preferencesLock;
  pthread_mutex_lock(&self->_preferencesLock);
  id v3 = -[NSMutableDictionary mutableCopy](self->_servicesWithPreferences, "mutableCopy");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v18) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v7]);
        id v9 = [v8 mutableCopy];
        [v9 setObject:&off_1009472C0 forKey:@"PacketsPerSecond"];
        [v9 setObject:&off_1009472C0 forKey:@"InputBytesPerSecond"];
        [v9 setObject:&off_1009472C0 forKey:@"OutputBytesPerSecond"];
        [v9 removeObjectForKey:@"Intent"];
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v9 setObject:v10 forKey:@"Timestamp"];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v9));

        uint64_t v12 = OSLogHandleForIDSCategory("LinkPreferencesManager");
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v24 = v7;
          __int16 v25 = 2114;
          v26 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Resetting preferences to 0 for service: %{public}@, at time: %{public}@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v14)
          && _IDSShouldLog(0LL, @"LinkPreferencesManager"))
        {
          uint64_t v15 = v7;
          v16 = v10;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkPreferencesManager",  @"Resetting preferences to 0 for service: %{public}@, at time: %{public}@");
        }

        -[NSMutableDictionary setObject:forKey:](self->_servicesWithPreferences, "setObject:forKey:", v11, v7, v15, v16);
        -[IDSLinkPreferencesManager _logRequestInPowerDictionaryForService:preferences:]( self,  "_logRequestInPowerDictionaryForService:preferences:",  v7,  v9);
      }

      id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v5);
  }

  pthread_mutex_unlock(p_preferencesLock);
}

- (BOOL)_validatePreferences:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PacketsPerSecond"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"InputBytesPerSecond"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"OutputBytesPerSecond"]);
    if (([v7 intValue] & 0x80000000) != 0
      || ([v8 intValue] & 0x80000000) != 0
      || ([v9 intValue] & 0x80000000) != 0)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("LinkPreferencesManager");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v6;
        __int16 v17 = 2114;
        id v18 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cannot update preferences for service: %{public}@ with negative values, preferences: %{public}@.",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v13)
        && _IDSShouldLog(0LL, @"LinkPreferencesManager"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkPreferencesManager",  @"Cannot update preferences for service: %{public}@ with negative values, preferences: %{public}@.");
      }

      BOOL v10 = 0;
    }

    else
    {
      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)preferencesForService:(id)a3
{
  p_preferencesLock = &self->_preferencesLock;
  id v5 = a3;
  pthread_mutex_lock(p_preferencesLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_servicesWithPreferences, "objectForKey:", v5));

  pthread_mutex_unlock(p_preferencesLock);
  return v6;
}

- (id)accumulativePreferencesForAllServices
{
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  p_preferencesLock = &self->_preferencesLock;
  pthread_mutex_lock(&self->_preferencesLock);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v30 = self;
  obj = self->_servicesWithPreferences;
  id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
  if (v32)
  {
    v31 = 0LL;
    uint64_t v34 = 0LL;
    unsigned int v33 = 0;
    LODWORD(v3) = 0;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v30->_servicesWithPreferences, "objectForKey:", v5));
        uint64_t v7 = OSLogHandleForIDSCategory("LinkPreferencesManager");
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v5;
          __int16 v41 = 2114;
          v42 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Getting accumulativePreferencesForAllServices. Service: %{public}@, preferences: %{public}@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v9)
          && _IDSShouldLog(0LL, @"LinkPreferencesManager"))
        {
          uint64_t v24 = v5;
          __int16 v25 = v6;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkPreferencesManager",  @"Getting accumulativePreferencesForAllServices. Service: %{public}@, preferences: %{public}@");
        }

        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", @"PacketsPerSecond", v24, v25, p_preferencesLock));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"InputBytesPerSecond"]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"OutputBytesPerSecond"]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Intent"]);
        unsigned int v14 = [v10 unsignedIntValue];
        unsigned int v15 = [v11 unsignedIntValue];
        unsigned int v16 = [v12 unsignedIntValue];
        if ((v34 & 0x100000000LL) != 0)
        {
          BYTE4(v34) = 1;
        }

        else
        {
          HIDWORD(v34) = [v13 isEqualToString:@"forceBTClassic"];
          __int16 v17 = v31;
          if (HIDWORD(v34)) {
            __int16 v17 = @"forceBTClassic";
          }
          v31 = v17;
        }

        uint64_t v3 = v14 + v3;
        v33 += v15;
        LODWORD(v34) = v16 + v34;
      }

      id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
    }

    while (v32);
  }

  else
  {
    v31 = 0LL;
    unsigned int v33 = 0;
    LODWORD(v34) = 0;
    uint64_t v3 = 0LL;
  }

  pthread_mutex_unlock(p_preferencesLock);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v18,  @"PacketsPerSecond");

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v33));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v19,  @"InputBytesPerSecond");

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v34));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v20,  @"OutputBytesPerSecond");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v31, @"Intent");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v21, @"Timestamp");

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v27));
  return v22;
}

- (void)_logRequestInPowerDictionaryForService:(id)a3 preferences:(id)a4
{
  id v6 = a4;
  [v6 setObject:a3 forKey:@"ServiceName"];
  power_log_queue = (dispatch_queue_s *)self->_power_log_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001200F8;
  block[3] = &unk_1008F6010;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(power_log_queue, block);
}

- (void).cxx_destruct
{
}

@end