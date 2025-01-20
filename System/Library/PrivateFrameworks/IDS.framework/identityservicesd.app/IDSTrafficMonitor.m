@interface IDSTrafficMonitor
+ (id)sharedInstance;
- (BOOL)_noteActionType:(id)a3 forService:(id)a4 serviceType:(unsigned int)a5 requestor:(id)a6;
- (BOOL)noteOutgoingFallbackMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteOutgoingMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteOutgoingServerMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteQueryForService:(id)a3 requestor:(id)a4;
- (BOOL)noteQueryRequestForService:(id)a3 requestor:(id)a4;
- (IDSTrafficMonitor)init;
- (void)_dailyTimerHandler;
- (void)_setDailyTimer;
- (void)_setHourlyTimer;
- (void)dealloc;
- (void)logState;
- (void)noteIncomingLocalMessageForService:(id)a3;
- (void)noteIncomingMessageForService:(id)a3;
@end

@implementation IDSTrafficMonitor

+ (id)sharedInstance
{
  if (qword_1009BE990 != -1) {
    dispatch_once(&qword_1009BE990, &stru_1008F9A20);
  }
  return (id)qword_1009BE998;
}

- (IDSTrafficMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSTrafficMonitor;
  v2 = -[IDSTrafficMonitor init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    -[IDSTrafficMonitor _setDailyTimer](v2, "_setDailyTimer");
    -[IDSTrafficMonitor _setHourlyTimer](v2, "_setHourlyTimer");
  }

  return v2;
}

- (void)dealloc
{
  hourlyTimer = self->_hourlyTimer;
  if (hourlyTimer)
  {
    -[IMDispatchTimer invalidate](hourlyTimer, "invalidate");
    v4 = self->_hourlyTimer;
    self->_hourlyTimer = 0LL;
  }

  dailyTimer = self->_dailyTimer;
  if (dailyTimer)
  {
    -[IMDispatchTimer invalidate](dailyTimer, "invalidate");
    objc_super v6 = self->_dailyTimer;
    self->_dailyTimer = 0LL;
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  traffic = self->_traffic;
  self->_traffic = 0LL;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSTrafficMonitor;
  -[IDSTrafficMonitor dealloc](&v8, "dealloc");
}

- (void)_dailyTimerHandler
{
  uint64_t v3 = OSLogHandleForIDSCategory("Traffic");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** Clearing traffic ***", v7, 2u);
  }

  traffic = self->_traffic;
  self->_traffic = 0LL;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setDailyTimer
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v5 = im_primary_queue(v3, v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D8A08;
  v9[3] = &unk_1008F8088;
  v9[4] = self;
  v7 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v3,  "initWithQueue:interval:repeats:handlerBlock:",  v6,  86400LL,  1LL,  v9);
  dailyTimer = self->_dailyTimer;
  self->_dailyTimer = v7;
}

- (void)_setHourlyTimer
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v5 = im_primary_queue(v3, v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D8AB0;
  v9[3] = &unk_1008F8088;
  v9[4] = self;
  v7 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v3,  "initWithQueue:interval:repeats:handlerBlock:",  v6,  3600LL,  1LL,  v9);
  hourlyTimer = self->_hourlyTimer;
  self->_hourlyTimer = v7;
}

- (BOOL)_noteActionType:(id)a3 forService:(id)a4 serviceType:(unsigned int)a5 requestor:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a6;
  if (-[__CFString length](v10, "length") && -[__CFString length](v11, "length"))
  {
    v118 = v12;
    -[NSRecursiveLock lock](self->_lock, "lock");
    traffic = self->_traffic;
    if (!traffic)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      v15 = self->_traffic;
      self->_traffic = Mutable;

      traffic = self->_traffic;
    }

    CFMutableDictionaryRef v16 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](traffic, "objectForKey:", v11));
    if (!v16)
    {
      CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      -[NSMutableDictionary setObject:forKey:](self->_traffic, "setObject:forKey:", v16, v11);
    }

    CFMutableDictionaryRef v119 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v16, "objectForKey:", v10));
    v121 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (char *)[v17 longLongValue] + 1));

    -[__CFDictionary setObject:forKey:](v16, "setObject:forKey:", v121, v10);
    if ((_DWORD)v7 == -1)
    {
      v120 = 0LL;
      CFMutableDictionaryRef v19 = 0LL;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"global-%u", v7));
      CFMutableDictionaryRef v19 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_traffic, "objectForKey:", v18));
      if (!v19)
      {
        CFMutableDictionaryRef v19 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        -[NSMutableDictionary setObject:forKey:](self->_traffic, "setObject:forKey:", v19, v18);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v19, "objectForKey:", v18));
      v120 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (char *)[v20 longLongValue] + 1));

      -[__CFDictionary setObject:forKey:](v19, "setObject:forKey:", v120, v18);
    }

    uint64_t v22 = OSLogHandleForIDSCategory("Traffic");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      v123 = v10;
      __int16 v124 = 2112;
      v125 = v11;
      __int16 v126 = 2112;
      v127 = v118;
      __int16 v128 = 1024;
      unsigned int v129 = -[__CFString intValue](v121, "intValue");
      __int16 v130 = 1024;
      int v131 = v7;
      __int16 v132 = 2112;
      v133 = v120;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "  == Incrementing %@ for service: %@   Requestor: %@  (Count: %d, GlobalCountForAdhocType%u: %@)",  buf,  0x36u);
    }

    if (os_log_shim_legacy_logging_enabled(v24) && _IDSShouldLog(0LL, @"Traffic"))
    {
      uint64_t v115 = v7;
      v116 = v120;
      v112 = v118;
      id v114 = -[__CFString intValue](v121, "intValue");
      v106 = v10;
      v109 = v11;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Traffic",  @"  == Incrementing %@ for service: %@   Requestor: %@  (Count: %d, GlobalCountForAdhocType%u: %@)");
    }

    if ((-[__CFString isEqualToIgnoringCase:]( v10,  "isEqualToIgnoringCase:",  @"outgoing-messages",  v106,  v109,  v112,  v114,  v115,  v116) & 1) != 0 || -[__CFString isEqualToIgnoringCase:]( v10,  "isEqualToIgnoringCase:",  @"outgoing-fallback-messages"))
    {
      else {
        v25 = @"-fallback";
      }
      if (v120)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"peer%@-message-budget-global-daily-%u",  v25,  v7));
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v26]);

        if ((int)-[__CFString intValue](v28, "intValue") >= 1)
        {
          uint64_t v29 = OSLogHandleForIDSCategory("Traffic");
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v123 = v25;
            __int16 v124 = 2112;
            v125 = v28;
            __int16 v126 = 2112;
            v127 = v120;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "     Server daily global%@ budget is: %@   Current count is: %@",  buf,  0x20u);
          }

          if (os_log_shim_legacy_logging_enabled(v31)
            && _IDSShouldLog(0LL, @"Traffic"))
          {
            v111 = v28;
            v113 = v120;
            v108 = v25;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Traffic",  @"     Server daily global%@ budget is: %@   Current count is: %@");
          }

          id v32 = -[__CFString unsignedLongLongValue](v120, "unsignedLongLongValue", v108, v111, v113);
          if (v32 > -[__CFString unsignedLongLongValue](v28, "unsignedLongLongValue"))
          {
            uint64_t v33 = OSLogHandleForIDSCategory("Traffic");
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "     **** we are over budget",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v35)
              && _IDSShouldLog(0LL, @"Traffic"))
            {
              _IDSLogV(0LL, @"IDSFoundation", @"Traffic", @"     **** we are over budget");
            }

            uint64_t v36 = OSLogHandleForTransportCategory("Traffic");
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v123 = v28;
              __int16 v124 = 2112;
              v125 = v120;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "     **** We are over budget - Server daily global budget is: %@   Current count is: %@",  buf,  0x16u);
            }

            uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
            if ((_DWORD)v39)
            {
              if (_IDSShouldLogTransport(v39))
              {
                v107 = v28;
                v110 = v120;
                _IDSLogTransport( @"Traffic",  @"IDS",  @"     **** We are over budget - Server daily global budget is: %@   Current count is: %@");
                if (_IDSShouldLog(0LL, @"Traffic"))
                {
                  v107 = v28;
                  v110 = v120;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"Traffic",  @"     **** We are over budget - Server daily global budget is: %@   Current count is: %@");
                }
              }
            }

- (void)logState
{
  uint64_t v2 = OSLogHandleForIDSCategory("Traffic");
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "====== IDS Traffic Usage:", buf, 2u);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_traffic, "allKeys"));
  id v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
        uint64_t v6 = OSLogHandleForIDSCategory("Traffic");
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "   Service: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"Traffic"))
        {
          uint64_t v25 = v5;
          _IDSLogV(0LL, @"IDSFoundation", @"Traffic", @"   Service: %@");
        }

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_traffic, "objectForKey:", v5, v25, v26));
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
        id v11 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v33;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v33 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)j);
              uint64_t v15 = OSLogHandleForIDSCategory("Traffic");
              CFMutableDictionaryRef v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
                *(_DWORD *)buf = 138412546;
                uint64_t v41 = v14;
                __int16 v42 = 2112;
                uint64_t v43 = v17;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "     %@: %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled(v18)
                && _IDSShouldLog(0LL, @"Traffic"))
              {
                uint64_t v25 = v14;
                v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
                _IDSLogV(0LL, @"IDSFoundation", @"Traffic", @"     %@: %@");
              }
            }

            id v11 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
          }

          while (v11);
        }

        uint64_t v19 = OSLogHandleForIDSCategory("Traffic");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
        }
      }

      id v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v30);
  }

  uint64_t v22 = OSLogHandleForIDSCategory("Traffic");
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "====== Done", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v24))
  {
  }

- (BOOL)noteQueryForService:(id)a3 requestor:(id)a4
{
  return -[IDSTrafficMonitor _noteActionType:forService:serviceType:requestor:]( self,  "_noteActionType:forService:serviceType:requestor:",  @"queries",  a3,  0xFFFFFFFFLL,  a4);
}

- (BOOL)noteQueryRequestForService:(id)a3 requestor:(id)a4
{
  return -[IDSTrafficMonitor _noteActionType:forService:serviceType:requestor:]( self,  "_noteActionType:forService:serviceType:requestor:",  @"query-requests",  a3,  0xFFFFFFFFLL,  a4);
}

- (void)noteIncomingMessageForService:(id)a3
{
}

- (void)noteIncomingLocalMessageForService:(id)a3
{
}

- (BOOL)noteOutgoingMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return -[IDSTrafficMonitor _noteActionType:forService:serviceType:requestor:]( self,  "_noteActionType:forService:serviceType:requestor:",  @"outgoing-messages",  a3,  *(void *)&a4,  a5);
}

- (BOOL)noteOutgoingFallbackMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return -[IDSTrafficMonitor _noteActionType:forService:serviceType:requestor:]( self,  "_noteActionType:forService:serviceType:requestor:",  @"outgoing-fallback-messages",  a3,  *(void *)&a4,  a5);
}

- (BOOL)noteOutgoingServerMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return -[IDSTrafficMonitor _noteActionType:forService:serviceType:requestor:]( self,  "_noteActionType:forService:serviceType:requestor:",  @"outgoing-server-messages",  a3,  *(void *)&a4,  a5);
}

- (void).cxx_destruct
{
}

@end