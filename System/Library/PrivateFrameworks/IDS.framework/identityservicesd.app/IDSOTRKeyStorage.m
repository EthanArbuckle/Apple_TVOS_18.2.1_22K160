@interface IDSOTRKeyStorage
+ (id)sharedInstance;
- (BOOL)__saveStoreForDataProtectionClass:(unsigned int)a3;
- (BOOL)_isUnderFirstDataProtectionLock;
- (BOOL)isSessionStoreAvailableForDataProtectionClass:(unsigned int)a3;
- (BOOL)isUnderLock;
- (IDSOTRKeyStorage)init;
- (id)_objectForKey:(id)a3;
- (id)sessionKeyForToken:(id)a3;
- (void)_daemonWillShutdown:(id)a3;
- (void)_loadIfNeeded;
- (void)_purgeMap;
- (void)_purgeTimerFiredOnMain;
- (void)_removeObjectForKey:(id)a3;
- (void)_save;
- (void)_saveNow;
- (void)_saveTimerFiredOnMain;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_setPurgeTimer;
- (void)_setSaveTimer;
- (void)dealloc;
- (void)loadStoreForDataProtectionClass:(unsigned int)a3;
- (void)lock;
- (void)removeSessionKeyForAllTokenFromMainQueue;
- (void)removeSessionKeyForToken:(id)a3;
- (void)storeSessionKey:(id)a3 token:(id)a4;
- (void)systemDidEnterDataProtectionLock;
- (void)systemDidLeaveDataProtectionLock;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)unlock;
@end

@implementation IDSOTRKeyStorage

+ (id)sharedInstance
{
  if (qword_1009C07F0 != -1) {
    dispatch_once(&qword_1009C07F0, &stru_1008FF260);
  }
  return (id)qword_1009C07F8;
}

- (BOOL)_isUnderFirstDataProtectionLock
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (BOOL)isUnderLock
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v3 = [v2 isUnderDataProtectionLock];

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device first unlocked", v6, 2u);
  }

  -[IDSOTRKeyStorage loadStoreForDataProtectionClass:](self, "loadStoreForDataProtectionClass:", 0LL);
}

- (void)systemDidLeaveDataProtectionLock
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device unlocked", buf, 2u);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_isClassAStoreAvailable)
  {
    if (self->_changedSinceLastSave)
    {
      -[IDSOTRKeyStorage _saveNow](self, "_saveNow");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v7 = IDSDataProtectionClassStringFromDataProtectionClass(1LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  @"__kIDSOTRKeyStorageClassKey",  0LL));
      [v6 postNotificationName:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:self userInfo:v9];
    }
  }

  else
  {
    -[IDSOTRKeyStorage loadStoreForDataProtectionClass:](self, "loadStoreForDataProtectionClass:", 1LL);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)systemDidEnterDataProtectionLock
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device locked", v6, 2u);
  }

  -[IDSOTRKeyStorage _saveNow](self, "_saveNow");
}

- (void)_save
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving OTR session key store", buf, 2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessionKeyStorage, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (!v7)
  {

LABEL_16:
    self->_changedSinceLastSave = 0;
    goto LABEL_17;
  }

  uint64_t v8 = *(void *)v12;
  int v9 = 1;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v6);
      }
      v9 &= -[IDSOTRKeyStorage __saveStoreForDataProtectionClass:]( self,  "__saveStoreForDataProtectionClass:",  IDSDataProtectionClassFromDataProtectionClassString(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i)));
    }

    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  }

  while (v7);

  if ((v9 & 1) != 0) {
    goto LABEL_16;
  }
LABEL_17:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)__saveStoreForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionKeyStorage, "objectForKey:", v7));
  int v9 = (NSMutableDictionary *)[v8 count];
  if (v9) {
    int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002734F4;
  v21[3] = &unk_1008FF288;
  v10 = v9;
  v22 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v21];
  if (-[NSMutableDictionary count](v10, "count"))
  {
    uint64_t v11 = JWEncodeDictionary(v10);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    __int128 v12 = 0LL;
  }

  int v20 = 0;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"ids-otr-key-storage",  v7));
  if (v12) {
    int v14 = IMSetKeychainDataWithProtection(v12, IDSKeychainServiceName, v13, 0LL, 0LL, 1LL, v5, &v20, v19);
  }
  else {
    int v14 = IMRemoveKeychainData(IDSKeychainServiceName, v13, &v20);
  }
  BOOL v15 = v14;
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog OTRStore](&OBJC_CLASS___IMRGLog, "OTRStore"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = @"NO";
    if (v15) {
      v17 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    __int16 v25 = 2112;
    v26 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Saving OTR session class %@ store (Success: %@)",  buf,  0x16u);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v15;
}

- (void)_loadIfNeeded
{
  if (!self->_sessionKeyStorage)
  {
    uint64_t v3 = 0LL;
    do
    {
      -[IDSOTRKeyStorage loadStoreForDataProtectionClass:](self, "loadStoreForDataProtectionClass:", v3);
      uint64_t v3 = (v3 + 1);
    }

    while ((_DWORD)v3 != 3);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)loadStoreForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  int v48 = 0;
  if ((_DWORD)v3 == 1)
  {
    if (-[IDSOTRKeyStorage isUnderLock](self, "isUnderLock"))
    {
      uint64_t v5 = OSLogHandleForIDSCategory("OTRStore");
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device is under data protection lock, not loading class A session keys",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v7))
      {
        if (_IDSShouldLog(0LL, @"OTRStore")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRStore",  @"Device is under data protection lock, not loading class A session keys");
        }
      }

      self->_isClassAStoreAvailable = 0;
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      return;
    }

    if (self->_isClassAStoreAvailable)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("OTRStore");
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Class A store is already loaded ignoring...",  buf,  2u);
      }

LABEL_67:
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      return;
    }

    goto LABEL_25;
  }

  if ((_DWORD)v3 == 2)
  {
    if (self->_isClassDStoreAvailable)
    {
      uint64_t v28 = OSLogHandleForIDSCategory("OTRStore");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Class D store is already loaded ignoring...",  buf,  2u);
      }

      goto LABEL_67;
    }

    int v15 = 0;
    int v14 = 1;
    goto LABEL_26;
  }

  if ((_DWORD)v3)
  {
LABEL_25:
    int v14 = 0;
    int v15 = 0;
LABEL_26:
    uint64_t v16 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v16);
    id v47 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"ids-otr-key-storage",  v17));
    IMGetKeychainData(&v47, IDSKeychainServiceName, v18, 0LL, &v48);
    id v19 = v47;

    uint64_t v20 = JWDecodeDictionary(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ([v21 count])
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100273DDC;
      v45[3] = &unk_1008FF288;
      v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v46 = v22;
      [v21 enumerateKeysAndObjectsUsingBlock:v45];
      if (!self->_sessionKeyStorage)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        sessionKeyStorage = self->_sessionKeyStorage;
        self->_sessionKeyStorage = Mutable;
      }

      if (v17 && v22)
      {
        -[NSMutableDictionary setObject:forKey:](self->_sessionKeyStorage, "setObject:forKey:", v22, v17);
        uint64_t v25 = OSLogHandleForIDSCategory("OTRStore");
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Loaded stored class %@ session store",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v27)
          && _IDSShouldLog(0LL, @"OTRStore"))
        {
          v43 = v17;
          _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Loaded stored class %@ session store");
        }
      }

      else
      {
        uint64_t v34 = OSLogHandleForIDSCategory("Warning");
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v22;
          __int16 v51 = 2112;
          v52 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Missing session key dictionary %@ or data protection string %@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v36))
        {
          _IDSWarnV(@"IDSFoundation", @"Missing session key dictionary %@ or data protection string %@");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Missing session key dictionary %@ or data protection string %@");
          v43 = v22;
          v44 = v17;
          _IDSLogTransport( @"Warning",  @"IDS",  @"Missing session key dictionary %@ or data protection string %@");
        }
      }
    }

    else
    {
      uint64_t v31 = OSLogHandleForIDSCategory("OTRStore");
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Did not find class %@ store to load",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v33) && _IDSShouldLog(0LL, @"OTRStore"))
      {
        v43 = v17;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Did not find class %@ store to load");
      }
    }

    if (((v15 | v14) & 1) != 0 || (_DWORD)v3 == 1)
    {
      uint64_t v37 = 72LL;
      if (v15) {
        uint64_t v37 = 73LL;
      }
      if ((_DWORD)v3 == 1) {
        uint64_t v37 = 74LL;
      }
      *((_BYTE *)&self->super.isa + v37) = 1;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v43, v44));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  @"__kIDSOTRKeyStorageClassKey",  0LL));
    [v38 postNotificationName:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:self userInfo:v39];

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    return;
  }

  if (!-[IDSOTRKeyStorage _isUnderFirstDataProtectionLock](self, "_isUnderFirstDataProtectionLock"))
  {
    if (self->_isClassCStoreAvailable)
    {
      uint64_t v40 = OSLogHandleForIDSCategory("OTRStore");
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Class C store is already loaded ignoring...",  buf,  2u);
      }

      goto LABEL_67;
    }

    int v14 = 0;
    int v15 = 1;
    goto LABEL_26;
  }

  uint64_t v8 = OSLogHandleForIDSCategory("OTRStore");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Device is under first data protection lock, not loading class C session keys",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"OTRStore")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRStore",  @"Device is under first data protection lock, not loading class C session keys");
  }
  self->_isClassCStoreAvailable = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isSessionStoreAvailableForDataProtectionClass:(unsigned int)a3
{
  BOOL v5 = a3 <= 2 && *((_BYTE *)&self->super.isa + qword_100717E78[a3]) != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_sessionKeyStorage)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionKeyStorage = self->_sessionKeyStorage;
    self->_sessionKeyStorage = Mutable;
  }

  id v10 = sub_100274120(v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ([v11 length])
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceWithPushTopic:v11]);
    id v14 = [v13 dataProtectionClass];

    uint64_t v15 = IDSDataProtectionClassStringFromDataProtectionClass(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    CFMutableDictionaryRef v17 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionKeyStorage, "objectForKey:", v16));
    if (!v17) {
      CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    -[__CFDictionary setObject:forKey:](v17, "setObject:forKey:", v6, v7);
    -[NSMutableDictionary setObject:forKey:](self->_sessionKeyStorage, "setObject:forKey:", v17, v16);
    self->_changedSinceLastSave = 1;
  }

  else
  {
    uint64_t v19 = OSLogHandleForIDSCategory("Warning");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = @"OTRStore";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@ - Missing service in token, can't store session key",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v21))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ - Missing service in token, can't store session key");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - Missing service in token, can't store session key");
      v22 = @"OTRStore";
      *(void *)&double v18 = _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - Missing service in token, can't store session key").n128_u64[0];
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock", v18, v22);
}

- (id)_objectForKey:(id)a3
{
  id v4 = a3;
  if (-[NSMutableDictionary count](self->_sessionKeyStorage, "count"))
  {
    id v5 = sub_100274120(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ([v6 length])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithPushTopic:v6]);
      id v9 = [v8 dataProtectionClass];

      uint64_t v10 = IDSDataProtectionClassStringFromDataProtectionClass(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionKeyStorage, "objectForKey:", v11));
      uint64_t v13 = OSLogHandleForIDSCategory("OTRStore");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);
        *(_DWORD *)buf = 134218242;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found session key %p for topic %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v16) && _IDSShouldLog(0LL, @"OTRStore"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);
        v23 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Found session key %p for topic %@");
      }

      CFMutableDictionaryRef v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v4, v22, v23));
    }

    else
    {
      uint64_t v18 = OSLogHandleForIDSCategory("Warning");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = @"OTRStore";
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%@ - Missing service in token, can't retrieve session key",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v20))
      {
        _IDSWarnV(@"IDSFoundation", @"%@ - Missing service in token, can't retrieve session key");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - Missing service in token, can't retrieve session key");
        _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - Missing service in token, can't retrieve session key");
      }

      CFMutableDictionaryRef v17 = 0LL;
    }
  }

  else
  {
    CFMutableDictionaryRef v17 = 0LL;
  }

  return v17;
}

- (void)_removeObjectForKey:(id)a3
{
  id v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSMutableDictionary count](self->_sessionKeyStorage, "count"))
  {
    id v5 = sub_100274120(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ([v6 length])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithPushTopic:v6]);
      id v9 = [v8 dataProtectionClass];

      uint64_t v10 = IDSDataProtectionClassStringFromDataProtectionClass(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionKeyStorage, "objectForKey:", v11));
      [v12 removeObjectForKey:v4];
      if (![v12 count]) {
        -[NSMutableDictionary removeObjectForKey:](self->_sessionKeyStorage, "removeObjectForKey:", v11);
      }
      self->_changedSinceLastSave = 1;
      -[NSRecursiveLock unlock](self->_lock, "unlock");
    }

    else
    {
      uint64_t v13 = OSLogHandleForIDSCategory("Warning");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = @"OTRStore";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@ - Missing service in token, can't remove session key",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v15))
      {
        _IDSWarnV(@"IDSFoundation", @"%@ - Missing service in token, can't remove session key");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - Missing service in token, can't remove session key");
        CFMutableDictionaryRef v17 = @"OTRStore";
        *(void *)&double v16 = _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - Missing service in token, can't remove session key").n128_u64[0];
      }

      -[NSRecursiveLock unlock](self->_lock, "unlock", v16, v17);
    }
  }

  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (IDSOTRKeyStorage)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___IDSOTRKeyStorage;
  v2 = -[IDSOTRKeyStorage init](&v30, "init");
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v3 setActive:1];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v4 setWatchesDataProtectionLockState:1];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v5 addListener:v2];

    id v6 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v6;

    v2->_isClassAStoreAvailable = 0;
    *(_WORD *)&v2->_isClassDStoreAvailable = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100274A4C;
    v27[3] = &unk_1008F8A78;
    objc_copyWeak(&v28, &location);
    id v8 = [v27 copy];
    id saveCancelBlock = v2->_saveCancelBlock;
    v2->_id saveCancelBlock = v8;

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100274A8C;
    v24[3] = &unk_1008F93E0;
    objc_copyWeak(&v26, &location);
    uint64_t v10 = v2;
    uint64_t v25 = v10;
    id v11 = [v24 copy];
    id saveEnqueueBlock = v10->_saveEnqueueBlock;
    v10->_id saveEnqueueBlock = v11;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100274B40;
    v22[3] = &unk_1008F8A78;
    objc_copyWeak(&v23, &location);
    id v13 = [v22 copy];
    id purgeCancelBlock = v10->_purgeCancelBlock;
    v10->_id purgeCancelBlock = v13;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100274B80;
    v19[3] = &unk_1008F93E0;
    objc_copyWeak(&v21, &location);
    uint64_t v15 = v10;
    uint64_t v20 = v15;
    id v16 = [v19 copy];
    id purgeEnqueueBlock = v15->_purgeEnqueueBlock;
    v15->_id purgeEnqueueBlock = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_saveTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100274CA8;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_purgeTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100274D1C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSOTRKeyStorage;
  -[IDSOTRKeyStorage dealloc](&v4, "dealloc");
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)_daemonWillShutdown:(id)a3
{
  if (self->_saveTimer) {
    -[IDSOTRKeyStorage _save](self, "_save", a3);
  }
}

- (id)sessionKeyForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[IDSOTRKeyStorage _loadIfNeeded](self, "_loadIfNeeded");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTRKeyStorage _objectForKey:](self, "_objectForKey:", v4));
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIDSCategory("OTRStore");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found session key for token: %@", buf, 0xCu);
      }

      id v9 = @"Found session key for token: %@";
    }

    else
    {
      uint64_t v10 = OSLogHandleForIDSCategory("OTRStore");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No session key for token: %@", buf, 0xCu);
      }

      id v9 = @"No session key for token: %@";
    }

    id v14 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", v9);
LABEL_15:
    -[NSRecursiveLock unlock](self->_lock, "unlock", v14);
    goto LABEL_16;
  }

  id v5 = 0LL;
LABEL_16:

  return v5;
}

- (void)_saveNow
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving now", v10, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    uint64_t v6 = _IDSShouldLog(0LL, @"OTRStore");
    if ((_DWORD)v6) {
      uint64_t v6 = _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Saving now");
    }
  }

  uint64_t v8 = im_primary_queue(v6, v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_async(v9, self->_saveCancelBlock);

  -[IDSOTRKeyStorage _save](self, "_save");
}

- (void)_setSaveTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, self->_saveEnqueueBlock);
}

- (void)_purgeMap
{
  uint64_t v2 = OSLogHandleForIDSCategory("OTRStore");
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** Purging OTR session cache", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v4))
  {
  }

- (void)_setPurgeTimer
{
  uint64_t v3 = OSLogHandleForIDSCategory("OTRStore");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = 0x4072C00000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting purge timer for %f seconds from now",  buf,  0xCu);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    uint64_t v6 = _IDSShouldLog(0LL, @"OTRStore");
    if ((_DWORD)v6) {
      uint64_t v6 = _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRStore",  @"Setting purge timer for %f seconds from now");
    }
  }

  uint64_t v8 = im_primary_queue(v6, v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_async(v9, self->_purgeEnqueueBlock);
}

- (void)storeSessionKey:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = OSLogHandleForIDSCategory("OTRStore");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Storing session key for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"OTRStore"))
    {
      id v11 = v7;
      _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Storing session key for %@.");
    }

    if (objc_msgSend(v6, "length", v11))
    {
      -[IDSOTRKeyStorage _loadIfNeeded](self, "_loadIfNeeded");
      -[NSRecursiveLock lock](self->_lock, "lock");
      -[IDSOTRKeyStorage _setObject:forKey:](self, "_setObject:forKey:", v6, v7);
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      -[IDSOTRKeyStorage _setSaveTimer](self, "_setSaveTimer");
    }

    else
    {
      -[IDSOTRKeyStorage removeSessionKeyForToken:](self, "removeSessionKeyForToken:", v7);
    }
  }
}

- (void)removeSessionKeyForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("OTRStore");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing session key for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"OTRStore"))
    {
      id v8 = v4;
      _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Removing session key for %@.");
    }

    -[IDSOTRKeyStorage _loadIfNeeded](self, "_loadIfNeeded", v8);
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[IDSOTRKeyStorage _removeObjectForKey:](self, "_removeObjectForKey:", v4);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[IDSOTRKeyStorage _setSaveTimer](self, "_setSaveTimer");
  }
}

- (void)removeSessionKeyForAllTokenFromMainQueue
{
  uint64_t v3 = OSLogHandleForTransportCategory("OTRStore");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "removeSessionKeyForAllTokenFromMainQueue",  buf,  2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"OTRStore", @"IDS", @"removeSessionKeyForAllTokenFromMainQueue");
    }
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_sessionKeyStorage, "removeAllObjects");
  sessionKeyStorage = self->_sessionKeyStorage;
  self->_sessionKeyStorage = 0LL;

  uint64_t v8 = OSLogHandleForIDSCategory("OTRStore");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cleaning up keychain", v18, 2u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    uint64_t v11 = _IDSShouldLog(0LL, @"OTRStore");
    if ((_DWORD)v11) {
      uint64_t v11 = _IDSLogV(0LL, @"IDSFoundation", @"OTRStore", @"Cleaning up keychain");
    }
  }

  uint64_t v13 = im_primary_queue(v11, v12);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  dispatch_async(v14, self->_saveCancelBlock);

  unsigned int v15 = -[IDSOTRKeyStorage __saveStoreForDataProtectionClass:](self, "__saveStoreForDataProtectionClass:", 1LL);
  unsigned int v16 = -[IDSOTRKeyStorage __saveStoreForDataProtectionClass:](self, "__saveStoreForDataProtectionClass:", 0LL);
  unsigned __int8 v17 = -[IDSOTRKeyStorage __saveStoreForDataProtectionClass:](self, "__saveStoreForDataProtectionClass:", 2LL);
  if (!v15 || !v16 || (v17 & 1) == 0) {
    self->_changedSinceLastSave = 1;
  }
  self->_isClassAStoreAvailable = 0;
  *(_WORD *)&self->_isClassDStoreAvailable = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
}

@end