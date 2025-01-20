@interface IDSPersistentMap
+ (id)defaultPersisterForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4;
- (BOOL)allowBackup;
- (BOOL)isLoaded;
- (BOOL)loadAndCheckStatus;
- (IDSPersistentMap)init;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 dataProtectionClass:(int64_t)a6 mergePolicy:(id)a7 migrationBlock:(id)a8;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 mergePolicy:(id)a6 writeCoalescingDelay:(double)a7 writeCoalescingLeeway:(double)a8 persister:(id)a9 migrationBlock:(id)a10 allowBackup:(BOOL)a11;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 migrationBlock:(id)a6;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7 allowBackup:(BOOL)a8;
- (IDSPersistentMapDelegate)delegate;
- (IDSPersistentMapMergePolicy)mergePolicy;
- (IDSPersistentMapPersister)persister;
- (NSMutableDictionary)cachedMap;
- (NSSet)decodableClasses;
- (NSString)identifier;
- (OS_dispatch_queue)serialPersistQueue;
- (OS_dispatch_source)saveTimer;
- (double)writeCoalescingDelay;
- (double)writeCoalescingLeeway;
- (id)_decodeMapData:(id)a3;
- (id)_encodeMap:(id)a3;
- (id)_mapByAddingMetadataToMap:(id)a3;
- (id)_mapByStrippingMetadataFromMap:(id)a3;
- (id)_timerIdentifierFromBaseIdentifier:(id)a3;
- (id)allKeys;
- (id)allValues;
- (id)copyDictionaryRepresentation;
- (id)debugDescription;
- (id)initMemoryOnlyWithIdentifier:(id)a3;
- (id)migrationBlock;
- (id)objectForKey:(id)a3;
- (int64_t)_versionNumberForPersistedMap:(id)a3;
- (int64_t)versionNumber;
- (os_unfair_lock_s)lock;
- (unint64_t)mergePolicyType;
- (void)_performCacheModifyingBlock:(id)a3;
- (void)_performCacheReadingBlock:(id)a3;
- (void)_performLockedBlock:(id)a3;
- (void)_save;
- (void)delayedSave;
- (void)persistImmediately;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDecodableClasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMergePolicy:(id)a3;
- (void)setMergePolicyType:(unint64_t)a3;
- (void)setMigrationBlock:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setPersister:(id)a3;
- (void)setSaveTimer:(id)a3;
- (void)setSerialPersistQueue:(id)a3;
- (void)setWriteCoalescingDelay:(double)a3;
- (void)setWriteCoalescingLeeway:(double)a3;
@end

@implementation IDSPersistentMap

+ (id)defaultPersisterForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  v8 = -[IDSPersistentMapKeychainPersister initWithIdentifier:keychainWrapper:systemMonitor:]( objc_alloc(&OBJC_CLASS___IDSPersistentMapKeychainPersister),  "initWithIdentifier:keychainWrapper:systemMonitor:",  v5,  v6,  v7);
  v9 = -[IDSPersistentMapDiskPersister initWithIdentifier:dataProtectionClass:keychainWrapper:systemMonitor:]( objc_alloc(&OBJC_CLASS___IDSPersistentMapDiskPersister),  "initWithIdentifier:dataProtectionClass:keychainWrapper:systemMonitor:",  v5,  a4,  v6,  v7);

  v10 = -[IDSPersistentMigratingPersister initWithOriginPersister:destinationPersister:]( objc_alloc(&OBJC_CLASS___IDSPersistentMigratingPersister),  "initWithOriginPersister:destinationPersister:",  v8,  v9);
  return v10;
}

- (IDSPersistentMap)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v4 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:]( self,  "initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:",  &stru_100912B50,  0LL,  v3,  0LL,  0LL,  &stru_1008F9390);

  return v4;
}

- (id)initMemoryOnlyWithIdentifier:(id)a3
{
  LOBYTE(v4) = 0;
  return -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persister:migrationBlock:allowBackup:]( self,  "initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:pers ister:migrationBlock:allowBackup:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  0.0,  v4);
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 migrationBlock:(id)a6
{
  return -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:]( self,  "initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:",  a3,  a4,  a5,  0LL,  0LL,  a6);
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7 allowBackup:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persister:migrationBlock:allowBackup:]( self,  "initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:pers ister:migrationBlock:allowBackup:",  a3,  a4,  a5,  0LL,  a6,  a7,  5.0,  1.0,  v9);
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7
{
  LOBYTE(v8) = 1;
  return -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persister:migrationBlock:allowBackup:]( self,  "initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:pers ister:migrationBlock:allowBackup:",  a3,  a4,  a5,  0LL,  a6,  a7,  5.0,  1.0,  v8);
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 dataProtectionClass:(int64_t)a6 mergePolicy:(id)a7 migrationBlock:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a3;
  id v19 = objc_msgSend((id)objc_opt_class(self, v18), "defaultPersisterForIdentifier:dataProtectionClass:", v17, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  LOBYTE(v23) = 1;
  v21 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persister:migrationBlock:allowBackup:]( self,  "initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persi ster:migrationBlock:allowBackup:",  v17,  a4,  v16,  v15,  v20,  v14,  5.0,  1.0,  v23);

  return v21;
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 mergePolicy:(id)a6 writeCoalescingDelay:(double)a7 writeCoalescingLeeway:(double)a8 persister:(id)a9 migrationBlock:(id)a10 allowBackup:(BOOL)a11
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  id v23 = a10;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___IDSPersistentMap;
  v24 = -[IDSPersistentMap init](&v45, "init");
  if (v24)
  {
    v25 = (NSString *)[v19 copy];
    identifier = v24->_identifier;
    v24->_identifier = v25;

    v24->_versionNumber = a4;
    v46[0] = objc_opt_class(&OBJC_CLASS___NSDictionary, v27);
    v46[1] = objc_opt_class(&OBJC_CLASS___NSString, v28);
    v46[2] = objc_opt_class(&OBJC_CLASS___IDSPersistentMapMetadata, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 3LL));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v20 setByAddingObjectsFromArray:v30]);
    decodableClasses = v24->_decodableClasses;
    v24->_decodableClasses = (NSSet *)v31;

    v24->_writeCoalescingDelay = a7;
    v24->_writeCoalescingLeeway = a8;
    id v33 = [v23 copy];
    id migrationBlock = v24->_migrationBlock;
    v24->_id migrationBlock = v33;

    objc_storeStrong((id *)&v24->_persister, a9);
    if (v21)
    {
      if ([v21 policy] == (id)2) {
        objc_storeStrong((id *)&v24->_mergePolicy, a6);
      }
      id v35 = [v21 policy];
    }

    else
    {
      id v35 = 0LL;
    }

    v24->_mergePolicyType = (unint64_t)v35;
    v24->_lock._os_unfair_lock_opaque = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ids.persistent-map.%@.persist",  v19));
    dispatch_queue_attr_t v37 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v37);
    dispatch_queue_attr_t v39 = dispatch_queue_attr_make_with_qos_class(v38, QOS_CLASS_BACKGROUND, 0);
    v40 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v39);

    id v41 = v36;
    dispatch_queue_t v42 = dispatch_queue_create((const char *)[v41 UTF8String], v40);
    serialPersistQueue = v24->_serialPersistQueue;
    v24->_serialPersistQueue = (OS_dispatch_queue *)v42;

    v24->_isLoaded = 0;
    v24->_allowBackup = a11;
  }

  return v24;
}

- (id)debugDescription
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1000C0CCC;
  id v14 = sub_1000C0CDC;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000C0CE4;
  v9[3] = &unk_1008F7E80;
  v9[4] = self;
  v9[5] = &v10;
  -[IDSPersistentMap _performLockedBlock:](self, "_performLockedBlock:", v9);
  uint64_t v4 = (objc_class *)objc_opt_class(self, v3);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; identifier = %@; cachedMap = %@; persister = %@>",
                   v6,
                   self,
                   self->_identifier,
                   v11[5],
                   self->_persister));

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)objectForKey:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1000C0CCC;
  id v14 = sub_1000C0CDC;
  id v15 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C0E08;
  v6[3] = &unk_1008F93B8;
  uint64_t v9 = &v10;
  v7 = self;
  id v3 = a3;
  id v8 = v3;
  -[IDSPersistentMap _performCacheReadingBlock:](v7, "_performCacheReadingBlock:", v6);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || !v7) {
    sub_1006996F8();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C0EF4;
  v10[3] = &unk_1008F5F58;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[IDSPersistentMap _performCacheModifyingBlock:](self, "_performCacheModifyingBlock:", v10);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100699720();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C0F88;
  v6[3] = &unk_1008F5F80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[IDSPersistentMap _performCacheModifyingBlock:](self, "_performCacheModifyingBlock:", v6);
}

- (void)_performCacheModifyingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C100C;
  v4[3] = &unk_1008F8F70;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[IDSPersistentMap _performLockedBlock:](v5, "_performLockedBlock:", v4);
}

- (void)_performCacheReadingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C1204;
  v4[3] = &unk_1008F8F70;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[IDSPersistentMap _performLockedBlock:](v5, "_performLockedBlock:", v4);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v6) {
    sub_100699748();
  }
  id v7 = v6;
  if (v8) {
    -[IDSPersistentMap setObject:forKey:](self, "setObject:forKey:", v8, v6);
  }
  else {
    -[IDSPersistentMap removeObjectForKey:](self, "removeObjectForKey:", v6);
  }
}

- (id)allKeys
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000C0CCC;
  id v9 = sub_1000C0CDC;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C1368;
  v4[3] = &unk_1008F7E80;
  void v4[4] = self;
  v4[5] = &v5;
  -[IDSPersistentMap _performCacheReadingBlock:](self, "_performCacheReadingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)allValues
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000C0CCC;
  id v9 = sub_1000C0CDC;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C1468;
  v4[3] = &unk_1008F7E80;
  void v4[4] = self;
  v4[5] = &v5;
  -[IDSPersistentMap _performCacheReadingBlock:](self, "_performCacheReadingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)removeAllObjects
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000C14F4;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSPersistentMap _performCacheModifyingBlock:](self, "_performCacheModifyingBlock:", v2);
}

- (id)copyDictionaryRepresentation
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000C0CCC;
  id v9 = sub_1000C0CDC;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C15C4;
  v4[3] = &unk_1008F7E80;
  void v4[4] = self;
  v4[5] = &v5;
  -[IDSPersistentMap _performCacheReadingBlock:](self, "_performCacheReadingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)loadAndCheckStatus
{
  if (self->_isLoaded)
  {
    LOBYTE(v3) = 1;
    return v3;
  }

  uint64_t v4 = OSLogHandleForIDSCategory("IDSPersistentMap");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = identifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading cache with identifier %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSPersistentMap"))
  {
    v40 = self->_identifier;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"Loading cache with identifier %@");
  }

  if ((-[IDSPersistentMapPersister isAvailable](self->_persister, "isAvailable", v40) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapPersister data](self->_persister, "data"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap _decodeMapData:](self, "_decodeMapData:", v8));
    int64_t v10 = -[IDSPersistentMap _versionNumberForPersistedMap:](self, "_versionNumberForPersistedMap:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap _mapByStrippingMetadataFromMap:](self, "_mapByStrippingMetadataFromMap:", v9));
    uint64_t v12 = OSLogHandleForIDSCategory("IDSPersistentMap");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v11 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Loaded cache has %ld keys", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"IDSPersistentMap"))
    {
      id v41 = [v11 count];
      _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"  => Loaded cache has %ld keys");
    }

    if (v10 < self->_versionNumber
      && (id v16 = (uint64_t (**)(id, void *, int64_t))self->_migrationBlock) != 0LL)
    {
      uint64_t v17 = v16[2](v16, v11, v10);
      id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
      id migrationBlock = self->_migrationBlock;
      self->_id migrationBlock = 0LL;
    }

    else
    {
      id v18 = objc_msgSend(v11, "mutableCopy", v41);
    }

    unint64_t mergePolicyType = self->_mergePolicyType;
    cachedMap = self->_cachedMap;
    v26 = self->_mergePolicy;
    uint64_t v27 = cachedMap;
    id v28 = v18;
    uint64_t v29 = v28;
    if (mergePolicyType == 2)
    {
      v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[IDSPersistentMapMergePolicy processedDictionaryForDisk:andMemory:]( v26,  "processedDictionaryForDisk:andMemory:",  v28,  v27));
    }

    else
    {
      if (mergePolicyType == 1)
      {
        uint64_t v31 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v28);
        v32 = v31;
        if (v27) {
          -[NSMutableDictionary addEntriesFromDictionary:](v31, "addEntriesFromDictionary:", v27);
        }
        goto LABEL_34;
      }

      if (mergePolicyType)
      {
        v32 = 0LL;
LABEL_34:

        id v33 = self->_cachedMap;
        self->_cachedMap = v32;

        mergePolicy = self->_mergePolicy;
        self->_mergePolicy = 0LL;

        if (!self->_cachedMap)
        {
          id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v36 = self->_cachedMap;
          self->_cachedMap = v35;
        }

        -[IDSPersistentMap delayedSave](self, "delayedSave", v41);
        self->_isLoaded = 1;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

        if (WeakRetained)
        {
          *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
          objc_initWeak((id *)buf, self);
          serialPersistQueue = (dispatch_queue_s *)self->_serialPersistQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000C1AE8;
          block[3] = &unk_1008F93E0;
          objc_copyWeak(&v43, (id *)buf);
          block[4] = self;
          dispatch_async(serialPersistQueue, block);
          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)buf);
        }

        LOBYTE(v3) = self->_isLoaded;
        return v3;
      }

      if (v28) {
        v30 = (NSMutableDictionary *)[v28 mutableCopy];
      }
      else {
        v30 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v27, "mutableCopy");
      }
    }

    v32 = v30;
    goto LABEL_34;
  }

  uint64_t v20 = OSLogHandleForIDSCategory("IDSPersistentMap");
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    persister = self->_persister;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = persister;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "  => Underlying persister %@ is unavailable; not loading!",
      buf,
      0xCu);
  }

  int v3 = os_log_shim_legacy_logging_enabled(v23);
  if (v3)
  {
    int v3 = _IDSShouldLog(0LL, @"IDSPersistentMap");
    if (v3)
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"  => Underlying persister %@ is unavailable; not loading!");
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)persistImmediately
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000C1B8C;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSPersistentMap _performLockedBlock:](self, "_performLockedBlock:", v2);
}

- (void)delayedSave
{
  saveTimer = self->_saveTimer;
  if (saveTimer)
  {
    dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(self->_writeCoalescingDelay * 1000000000.0));
    dispatch_source_set_timer( (dispatch_source_t)saveTimer,  v4,  0xFFFFFFFFFFFFFFFFLL,  (unint64_t)(self->_writeCoalescingLeeway * 1000000000.0));
  }

  else
  {
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_serialPersistQueue);
    id v6 = self->_saveTimer;
    self->_saveTimer = v5;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, self->_saveTimer);
    uint64_t v7 = self->_saveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000C1FA8;
    handler[3] = &unk_1008F9408;
    objc_copyWeak(&v11, &from);
    handler[4] = self;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    id v8 = self->_saveTimer;
    dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(self->_writeCoalescingDelay * 1000000000.0));
    dispatch_source_set_timer( (dispatch_source_t)v8,  v9,  0xFFFFFFFFFFFFFFFFLL,  (unint64_t)(self->_writeCoalescingLeeway * 1000000000.0));
    dispatch_activate((dispatch_object_t)self->_saveTimer);
  }

- (void)_save
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSPersistentMap");
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    id v6 = -[NSMutableDictionary count](self->_cachedMap, "count");
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = identifier;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Saving cache with identifier %@ => Will save cache to disk with %ld keys",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSPersistentMap"))
  {
    id v19 = self->_identifier;
    id v21 = -[NSMutableDictionary count](self->_cachedMap, "count");
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Saving cache with identifier %@ => Will save cache to disk with %ld keys");
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v32 = sub_1000C0CCC;
  id v33 = sub_1000C0CDC;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1000C0CCC;
  uint64_t v27 = sub_1000C0CDC;
  id v28 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000C24C0;
  v22[3] = &unk_1008F9430;
  v22[4] = self;
  v22[5] = buf;
  v22[6] = &v23;
  -[IDSPersistentMap _performLockedBlock:](self, "_performLockedBlock:", v22, v19, v21);
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    uint64_t v8 = OSLogHandleForIDSCategory("IDSPersistentMap");
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  => Encoding...", v29, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v10)
      && _IDSShouldLog(0LL, @"IDSPersistentMap"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"  => Encoding...");
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap _encodeMap:](self, "_encodeMap:", v24[5]));
    uint64_t v12 = OSLogHandleForIDSCategory("IDSPersistentMap");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v11 length];
      *(_DWORD *)uint64_t v29 = 134217984;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Done encoding: %ld bytes", v29, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"IDSPersistentMap"))
    {
      id v20 = [v11 length];
      _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"  => Done encoding: %ld bytes");
    }
  }

  else
  {
    uint64_t v16 = OSLogHandleForIDSCategory("IDSPersistentMap");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  => Skipping encoding, empty", v29, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v18)
      && _IDSShouldLog(0LL, @"IDSPersistentMap"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"  => Skipping encoding, empty");
    }

    id v11 = 0LL;
  }

  -[IDSPersistentMapPersister saveData:allowBackup:]( self->_persister,  "saveData:allowBackup:",  v11,  self->_allowBackup,  v20);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);
}

- (id)_decodeMapData:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    goto LABEL_5;
  }
  decodableClasses = self->_decodableClasses;
  v11[0] = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  decodableClasses,  v4,  v11));
  id v7 = v11[0];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {

LABEL_5:
    id v6 = 0LL;
    goto LABEL_6;
  }

LABEL_6:
  return v6;
}

- (id)_encodeMap:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v10 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  0LL,  &v10));
    id v5 = v10;
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIDSCategory("IDSPersistentMap");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error during Decoding %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v8)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"Error during Decoding %@");
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_timerIdentifierFromBaseIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.identityservices.%@",  a3);
}

- (id)_mapByAddingMetadataToMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, @"ids-persistent-map");

  uint64_t v6 = -[IDSPersistentMapMetadata initWithVersionNumber:]( objc_alloc(&OBJC_CLASS___IDSPersistentMapMetadata),  "initWithVersionNumber:",  self->_versionNumber);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, @"ids-persistent-map-metadata");

  return v5;
}

- (id)_mapByStrippingMetadataFromMap:(id)a3
{
  return [a3 objectForKey:@"ids-persistent-map"];
}

- (int64_t)_versionNumberForPersistedMap:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"ids-persistent-map-metadata"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSPersistentMapMetadata, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = [v3 versionNumber];
  }
  else {
    id v6 = 0LL;
  }

  return (int64_t)v6;
}

- (void)_performLockedBlock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (IDSPersistentMapDelegate)delegate
{
  return (IDSPersistentMapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_dispatch_queue)serialPersistQueue
{
  return self->_serialPersistQueue;
}

- (void)setSerialPersistQueue:(id)a3
{
}

- (OS_dispatch_source)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
}

- (double)writeCoalescingDelay
{
  return self->_writeCoalescingDelay;
}

- (void)setWriteCoalescingDelay:(double)a3
{
  self->_writeCoalescingDelay = a3;
}

- (double)writeCoalescingLeeway
{
  return self->_writeCoalescingLeeway;
}

- (void)setWriteCoalescingLeeway:(double)a3
{
  self->_writeCoalescingLeeway = a3;
}

- (id)migrationBlock
{
  return self->_migrationBlock;
}

- (void)setMigrationBlock:(id)a3
{
}

- (IDSPersistentMapPersister)persister
{
  return self->_persister;
}

- (void)setPersister:(id)a3
{
}

- (NSSet)decodableClasses
{
  return self->_decodableClasses;
}

- (void)setDecodableClasses:(id)a3
{
}

- (NSMutableDictionary)cachedMap
{
  return self->_cachedMap;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (unint64_t)mergePolicyType
{
  return self->_mergePolicyType;
}

- (void)setMergePolicyType:(unint64_t)a3
{
  self->_unint64_t mergePolicyType = a3;
}

- (IDSPersistentMapMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (void)setMergePolicy:(id)a3
{
}

- (BOOL)allowBackup
{
  return self->_allowBackup;
}

- (void).cxx_destruct
{
}

@end