@interface SYDTCCHelper
+ (id)sharedHelper;
- (BOOL)isUbiquityDisabledForStoreIdentifier:(id)a3;
- (NSSet)cachedDisabledStoreIdentifiers;
- (OS_dispatch_queue)queue;
- (SYDTCCHelper)init;
- (id)findDisabledStoreIdentifiers;
- (int)notifyToken;
- (void)dealloc;
- (void)enableUbiquityIfNecessaryForAuditToken:(id *)a3;
- (void)setCachedDisabledStoreIdentifiers:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)startListeningToTCCAccessChangedNotifications;
- (void)stopListeningToTCCAccessChangedNotifications;
@end

@implementation SYDTCCHelper

+ (id)sharedHelper
{
  if (qword_100057A18 != -1) {
    dispatch_once(&qword_100057A18, &stru_10004CEE8);
  }
  return (id)qword_100057A10;
}

- (SYDTCCHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SYDTCCHelper;
  v2 = -[SYDTCCHelper init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.kvs.tcc", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_notifyToken = -1;
    -[SYDTCCHelper startListeningToTCCAccessChangedNotifications](v2, "startListeningToTCCAccessChangedNotifications");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SYDTCCHelper;
  -[SYDTCCHelper dealloc](&v3, "dealloc");
}

- (BOOL)isUbiquityDisabledForStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDTCCHelper queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DBB0;
  block[3] = &unk_10004CF10;
  id v9 = v4;
  v10 = self;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (id)findDisabledStoreIdentifiers
{
  id v2 = SYDGetTCCLog();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Finding list of disabled store identifiers",  buf,  2u);
  }

  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v4 = (id)TCCAccessCopyBundleIdentifiersDisabledForService(kTCCServiceUbiquity);
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v35;
    id v9 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
    *(void *)&__int128 v6 = 138412802LL;
    __int128 v30 = v6;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        uint64_t v12 = v9[77];
        id v33 = 0LL;
        v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v11,  0,  &v33,  v30));
        id v14 = v33;
        if (v14)
        {
          id v15 = SYDGetTCCLog();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Error getting bundle record: %@",  buf,  0xCu);
          }
        }

        else if (v13)
        {
          id v17 = v4;
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 entitlements]);
          id v18 = -[os_log_s objectForKey:ofClass:]( v16,  "objectForKey:ofClass:",  @"com.apple.developer.ubiquity-kvstore-identifier",  objc_opt_class(&OBJC_CLASS___NSString));
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
          id v21 = -[os_log_s objectForKey:ofClass:valuesOfClass:]( v16,  "objectForKey:ofClass:valuesOfClass:",  @"com.apple.private.ubiquity-additional-kvstore-identifiers",  v20,  objc_opt_class(&OBJC_CLASS___NSString));
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = v22;
          if (v19 || [v22 count])
          {
            id v24 = SYDGetTCCLog();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v30;
              id v39 = v11;
              __int16 v40 = 2112;
              v41 = v19;
              __int16 v42 = 2112;
              v43 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Bundle %@ has Ubiquity disabled and is entitled to defaultStoreIdentifier=%@ additionalStoreIdentifiers=%@",  buf,  0x20u);
            }

            if (v19) {
              [v32 addObject:v19];
            }
            id v4 = v17;
            if ([v23 count]) {
              [v32 addObjectsFromArray:v23];
            }
          }

          else
          {
            id v27 = SYDGetTCCLog();
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v39 = v11;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Bundle %@ has Ubiquity disabled, but is not entitled to any KVS stores",  buf,  0xCu);
            }

            id v4 = v17;
          }

          uint64_t v8 = v31;
          id v9 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
        }

        else
        {
          id v26 = SYDGetTCCLog();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Couldn't find bundle record for disabled bundle %@",  buf,  0xCu);
          }
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }

    while (v7);
  }

  return v32;
}

- (void)enableUbiquityIfNecessaryForAuditToken:(id *)a3
{
  id v4 = SYDGetTCCLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002D644();
  }

  id v37 = 0LL;
  __int128 v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  __int128 v40 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  buf,  &v37));
  id v8 = v37;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  v10 = (void *)v9;
  if (v9)
  {
    id v32 = v8;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v11 = (id)TCCAccessCopyInformationForBundleId(v9);
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v34;
LABEL_6:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kTCCInfoService]);

        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kTCCInfoGranted]);

      if (!v18) {
        goto LABEL_17;
      }
      unsigned int v19 = [v18 BOOLValue];
      id v20 = SYDGetTCCLog();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v19)
      {
        if (v22) {
          sub_10002D57C((uint64_t)v10, v21, v23, v24, v25, v26, v27, v28);
        }
      }

      else if (v22)
      {
        sub_10002D5E0((uint64_t)v10, v21, v23, v24, v25, v26, v27, v28);
      }
    }

    else
    {
LABEL_12:

LABEL_17:
      id v29 = SYDGetTCCLog();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Enabling TCC for %@", buf, 0xCu);
      }

      TCCAccessSetForBundleId(kTCCServiceUbiquity, v10, 1LL);
    }

    id v8 = v32;
  }

  else
  {
    id v31 = SYDGetTCCLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002D550();
    }
  }
}

- (void)startListeningToTCCAccessChangedNotifications
{
  id v3 = SYDGetTCCLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002D670();
  }

  objc_initWeak(&location, self);
  int out_token = -1;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDTCCHelper queue](self, "queue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000E4EC;
  handler[3] = &unk_10004CF38;
  objc_copyWeak(&v9, &location);
  uint32_t v6 = notify_register_dispatch("com.apple.tcc.access.changed", &out_token, v5, handler);

  if (v6) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = out_token;
  }
  -[SYDTCCHelper setNotifyToken:](self, "setNotifyToken:", v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopListeningToTCCAccessChangedNotifications
{
  if (-[SYDTCCHelper notifyToken](self, "notifyToken") != -1)
  {
    id v3 = SYDGetTCCLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002D6C8();
    }

    notify_cancel(-[SYDTCCHelper notifyToken](self, "notifyToken"));
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSSet)cachedDisabledStoreIdentifiers
{
  return self->_cachedDisabledStoreIdentifiers;
}

- (void)setCachedDisabledStoreIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end