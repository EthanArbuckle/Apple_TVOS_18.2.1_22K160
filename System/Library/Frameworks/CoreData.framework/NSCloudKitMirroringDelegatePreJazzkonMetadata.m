@interface NSCloudKitMirroringDelegatePreJazzkonMetadata
+ (uint64_t)allDefaultsKeys;
- (BOOL)isEqual:(id)a3;
- (NSCloudKitMirroringDelegatePreJazzkonMetadata)initWithStore:(id)a3;
- (id)_keyForZoneName:(uint64_t)a1 owner:(uint64_t)a2 databseScope:(uint64_t)a3;
- (id)changeTokenForZoneWithID:(uint64_t)a3 inDatabaseWithScope:;
- (id)ckIdentityRecordName;
- (id)description;
- (uint64_t)_keyForDatabaseScope:(uint64_t)a1;
- (uint64_t)changeTokenForDatabaseScope:(uint64_t)result;
- (uint64_t)hasCheckedCKIdentity;
- (uint64_t)hasInitializedDatabaseSubscription;
- (uint64_t)hasInitializedZoneSubscription;
- (uint64_t)lastHistoryToken;
- (uint64_t)load:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegatePreJazzkonMetadata

+ (uint64_t)allDefaultsKeys
{
  v1[8] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v1[0] = @"NSCloudKitMirroringDelegateInitializedZoneDefaultsKey";
  v1[1] = @"NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey";
  v1[2] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  v1[3] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v1[4] = @"PFCloudKitServerChangeTokenKey";
  v1[5] = @"NSCloudKitMirroringDelegateLastHistoryTokenKey";
  v1[6] = @"NSCloudKitMirroringDelegateServerChangeTokensKey";
  v1[7] = @"NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey";
  return [MEMORY[0x189603F18] arrayWithObjects:v1 count:8];
}

- (NSCloudKitMirroringDelegatePreJazzkonMetadata)initWithStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegatePreJazzkonMetadata;
  v4 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_store, a3);
  }
  return v5;
}

- (void)dealloc
{
  self->_ckIdentityRecordName = 0LL;
  self->_keyToPreviousServerChangeToken = 0LL;

  self->_lastHistoryToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegatePreJazzkonMetadata;
  -[NSCloudKitMirroringDelegatePreJazzkonMetadata dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
    id v6 = objc_loadWeakRetained((id *)a3 + 1);
    if (self->_loaded != *((unsigned __int8 *)a3 + 16)
      || self->_hasInitializedZone != *((unsigned __int8 *)a3 + 18)
      || self->_hasCheckedCKIdentity != *((unsigned __int8 *)a3 + 32)
      || self->_hasInitializedZoneSubscription != *((unsigned __int8 *)a3 + 19)
      || self->_hasInitializedDatabaseSubscription != *((unsigned __int8 *)a3 + 20))
    {
      goto LABEL_25;
    }

    objc_super v7 = (void *)[WeakRetained identifier];
    uint64_t v8 = [v6 identifier];
    if (v7 != (void *)v8)
    {
      BOOL v9 = 0;
      if (!v7 || !v8) {
        goto LABEL_26;
      }
    }

    ckIdentityRecordName = self->_ckIdentityRecordName;
    v11 = (NSString *)*((void *)a3 + 3);
    if (ckIdentityRecordName != v11)
    {
      BOOL v9 = 0;
      if (!ckIdentityRecordName || !v11) {
        goto LABEL_26;
      }
      if (!-[NSString isEqualToString:](ckIdentityRecordName, "isEqualToString:")) {
        goto LABEL_25;
      }
    }

    keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
    v13 = (NSDictionary *)*((void *)a3 + 5);
    if (keyToPreviousServerChangeToken != v13)
    {
      BOOL v9 = 0;
      if (!keyToPreviousServerChangeToken || !v13) {
        goto LABEL_26;
      }
      if (!-[NSDictionary isEqualToDictionary:](keyToPreviousServerChangeToken, "isEqualToDictionary:")) {
        goto LABEL_25;
      }
    }

    lastHistoryToken = self->_lastHistoryToken;
    if (lastHistoryToken == *((NSPersistentHistoryToken **)a3 + 6)
      || -[NSPersistentHistoryToken isEqual:](lastHistoryToken, "isEqual:"))
    {
      BOOL v9 = 1;
    }

    else
    {
LABEL_25:
      BOOL v9 = 0;
    }

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x189607940]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->_loaded) {
    id v6 = @"loaded";
  }
  else {
    id v6 = @"not-loaded";
  }
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@: %p; %@", v5, self, v6];
  uint64_t v8 = v7;
  if (self->_loaded)
  {
    objc_msgSend(v7, "appendFormat:", @",changed:%d", self->_hasChanges);
    objc_msgSend(v8, "appendFormat:", @",initZone:%d", self->_hasInitializedZone);
    objc_msgSend(v8, "appendFormat:", @",initZoneSub:%d", self->_hasInitializedZoneSubscription);
    objc_msgSend(v8, "appendFormat:", @",initDatabaseSub:%d", self->_hasInitializedDatabaseSubscription);
    [v8 appendFormat:@",identity:%@", self->_ckIdentityRecordName];
    objc_msgSend(v8, "appendFormat:", @",checkedIdentity:%d", self->_hasCheckedCKIdentity);
    [v8 appendString:@",changeTokens:"];
    if (-[NSDictionary count](self->_keyToPreviousServerChangeToken, "count"))
    {
      keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke;
      v11[3] = &unk_189EABDA0;
      v11[4] = v8;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( keyToPreviousServerChangeToken,  "enumerateKeysAndObjectsUsingBlock:",  v11);
    }

    else
    {
      [v8 appendString:@"empty"];
    }

    [v8 appendFormat:@"historyToken:%@", self->_lastHistoryToken];
  }

  [v8 appendString:@">"];
  return v8;
}

uint64_t __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@",%@:%@", a2, a3];
}

- (uint64_t)hasInitializedZoneSubscription
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return *(_BYTE *)(result + 19) != 0;
    }

    else
    {
      v1 = (void *)MEMORY[0x189603F70];
      uint64_t v2 = *MEMORY[0x189603A58];
      id v3 = (void *)NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend( v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasInitializedZoneSubscription)), 0 reason userInfo];
      objc_exception_throw(v5);
      return -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedDatabaseSubscription]();
    }
  }

  return result;
}

- (uint64_t)hasInitializedDatabaseSubscription
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return *(_BYTE *)(result + 20) != 0;
    }

    else
    {
      v1 = (void *)MEMORY[0x189603F70];
      uint64_t v2 = *MEMORY[0x189603A58];
      id v3 = (void *)NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend( v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasInitializedDatabaseSubscription)), 0 reason userInfo];
      objc_exception_throw(v5);
      return -[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName]();
    }
  }

  return result;
}

- (id)ckIdentityRecordName
{
  if (result)
  {
    if (*((_BYTE *)result + 16))
    {
      return (id *)result[3];
    }

    else
    {
      v1 = (void *)MEMORY[0x189603F70];
      uint64_t v2 = *MEMORY[0x189603A58];
      id v3 = (void *)NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend( v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_ckIdentityRecordName)), 0 reason userInfo];
      objc_exception_throw(v5);
      return (id *)-[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]();
    }
  }

  return result;
}

- (uint64_t)hasCheckedCKIdentity
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return *(_BYTE *)(result + 32) != 0;
    }

    else
    {
      v1 = (void *)MEMORY[0x189603F70];
      uint64_t v2 = *MEMORY[0x189603A58];
      id v3 = (void *)NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend( v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasCheckedCKIdentity)), 0 reason userInfo];
      objc_exception_throw(v5);
      return -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForZoneWithID:inDatabaseWithScope:]();
    }
  }

  return result;
}

- (id)changeTokenForZoneWithID:(uint64_t)a3 inDatabaseWithScope:
{
  if (result)
  {
    if (*((_BYTE *)result + 16))
    {
      return (id *)objc_msgSend( result[5],  "objectForKey:",  -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:]( objc_msgSend(a2, "zoneName"),  objc_msgSend(a2, "ownerName"),  a3));
    }

    else
    {
      id v3 = (void *)MEMORY[0x189603F70];
      uint64_t v4 = *MEMORY[0x189603A58];
      v5 = (void *)NSString;
      uint64_t v6 = objc_opt_class();
      objc_super v7 = (void *)[v3 exceptionWithName:v4, objc_msgSend( v5, "stringWithFormat:", @"%@:%@ called before load.", v6, NSStringFromSelector(sel_changeTokenForZoneWithID_inDatabaseWithScope_)), 0 reason userInfo];
      objc_exception_throw(v7);
      return (id *)-[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:](v8, v9, v10);
    }
  }

  return result;
}

- (id)_keyForZoneName:(uint64_t)a1 owner:(uint64_t)a2 databseScope:(uint64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:-[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a3)];
  [v5 appendFormat:@".%@.%@", a1, a2];
  id v6 = (id)[v5 copy];

  return v6;
}

- (uint64_t)changeTokenForDatabaseScope:(uint64_t)result
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return [*(id *)(result + 40) objectForKey:-[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a2)];
    }

    else
    {
      uint64_t v2 = (void *)MEMORY[0x189603F70];
      uint64_t v3 = *MEMORY[0x189603A58];
      uint64_t v4 = (void *)NSString;
      uint64_t v5 = objc_opt_class();
      id v6 = (void *)[v2 exceptionWithName:v3, objc_msgSend( v4, "stringWithFormat:", @"%@:%@ called before load.", v5, NSStringFromSelector(sel_changeTokenForDatabaseScope_)), 0 reason userInfo];
      objc_exception_throw(v6);
      return -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](v7);
    }
  }

  return result;
}

- (uint64_t)_keyForDatabaseScope:(uint64_t)a1
{
  return -[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]();
}

- (uint64_t)lastHistoryToken
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return *(void *)(result + 48);
    }

    else
    {
      v1 = (void *)MEMORY[0x189603F70];
      uint64_t v2 = *MEMORY[0x189603A58];
      uint64_t v3 = (void *)NSString;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend( v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_lastHistoryToken)), 0 reason userInfo];
      objc_exception_throw(v5);
      return -[NSCloudKitMirroringDelegatePreJazzkonMetadata load:]();
    }
  }

  return result;
}

- (uint64_t)load:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 16))
  {
    id Weak = objc_loadWeak((id *)(a1 + 8));
    id v47 = (id)[Weak persistentStoreCoordinator];
    uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
    id v46 = Weak;
    id v6 = (void *)[Weak metadata];
    *(_BYTE *)(a1 + 18) = objc_msgSend( (id)objc_msgSend( v6,  "objectForKey:",  @"NSCloudKitMirroringDelegateInitializedZoneDefaultsKey"),  "BOOLValue");
    *(_BYTE *)(a1 + 19) = objc_msgSend( (id)objc_msgSend( v6,  "objectForKey:",  @"NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey"),  "BOOLValue");
    *(_BYTE *)(a1 + 20) = objc_msgSend( (id)objc_msgSend( v6,  "objectForKey:",  @"NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey"),  "BOOLValue");
    *(void *)(a1 + 24) = (id)[v6 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
    *(_BYTE *)(a1 + 32) = objc_msgSend( (id)objc_msgSend( v6,  "objectForKey:",  @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"),  "BOOLValue");
    int v7 = 1;
    uint64_t v8 = [v6 objectForKey:@"PFCloudKitServerChangeTokenKey"];
    if (v8)
    {
      *(void *)buf = 0LL;
      uint64_t v9 = (void *)MEMORY[0x189607908];
      getCloudKitCKServerChangeTokenClass();
      uint64_t v10 = [v9 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:buf];
      if (v10
        || [*(id *)buf code] == 4865
        && (v11 = (void *)[*(id *)buf domain],
            ([v11 isEqualToString:*MEMORY[0x189607460]] & 1) != 0))
      {
        uint64_t v48 = 0LL;
      }

      else
      {
        uint64_t v12 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"PFCloudKitServerChangeTokenKey", v46];
        id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v13 setObject:v12 forKey:*MEMORY[0x1896075F0]];
        if (*(void *)buf) {
          [v13 setObject:*(void *)buf forKey:*MEMORY[0x189607798]];
        }
        id v14 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v15 = [v14 initWithDomain:*MEMORY[0x189607460] code:134402 userInfo:v13];

        uint64_t v48 = v15;
        int v7 = 0;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v48 = 0LL;
    }

    uint64_t v16 = [v6 objectForKey:@"NSCloudKitMirroringDelegateServerChangeTokensKey"];
    if (v16)
    {
      int v44 = v7;
      v17 = v5;
      *(void *)buf = 0LL;
      v18 = (void *)MEMORY[0x189607908];
      v19 = (void *)MEMORY[0x189604010];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      getCloudKitCKServerChangeTokenClass();
      v22 = (void *)objc_msgSend( v18,  "unarchivedObjectOfClasses:fromData:error:",  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0),  v16,  buf);
      if (v22)
      {
        *(void *)(a1 + 40) = v22;
        uint64_t v5 = v17;
        int v7 = v44;
      }

      else
      {
        uint64_t v25 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"NSCloudKitMirroringDelegateServerChangeTokensKey", v46];
        id v26 = objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v5 = v17;
        [v26 setObject:v25 forKey:*MEMORY[0x1896075F0]];
        if (*(void *)buf) {
          [v26 setObject:*(void *)buf forKey:*MEMORY[0x189607798]];
        }
        id v27 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v48 = [v27 initWithDomain:*MEMORY[0x189607460] code:134402 userInfo:v26];

        int v7 = 0;
      }
    }

    else
    {
      if (v10)
      {
        uint64_t CloudKitCKCurrentUserDefaultName = getCloudKitCKCurrentUserDefaultName();
        id v24 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v10,  -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:]( (uint64_t)@"com.apple.coredata.cloudkit.zone",  CloudKitCKCurrentUserDefaultName,  2),  0);
      }

      else
      {
        id v24 = objc_alloc_init(MEMORY[0x189603F68]);
      }

      *(void *)(a1 + 40) = v24;
    }

    uint64_t v28 = [v6 objectForKey:@"NSCloudKitMirroringDelegateLastHistoryTokenKey"];
    if (v28)
    {
      *(void *)buf = 0LL;
      v29 = (void *)v48;
      v30 = (void *)[MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v28 error:buf];
      if (v30)
      {
        *(void *)(a1 + 48) = v30;
      }

      else
      {
        uint64_t v31 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"NSCloudKitMirroringDelegateLastHistoryTokenKey", v46];
        id v32 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v32 setObject:v31 forKey:*MEMORY[0x1896075F0]];
        if (*(void *)buf) {
          [v32 setObject:*(void *)buf forKey:*MEMORY[0x189607798]];
        }
        id v33 = objc_alloc(MEMORY[0x189607870]);
        v29 = (void *)[v33 initWithDomain:*MEMORY[0x189607460] code:134402 userInfo:v32];

        int v7 = 0;
      }
    }

    else
    {
      v29 = (void *)v48;
    }

    objc_autoreleasePoolPop(v5);
    id v34 = 0LL;
    if (!v7 && v29) {
      id v34 = v29;
    }

    if (v7)
    {
      uint64_t v3 = 1LL;
      *(_BYTE *)(a1 + 16) = 1;
LABEL_42:

      return v3;
    }

    if (v34)
    {
      if (a2)
      {
        uint64_t v3 = 0LL;
        *a2 = v34;
        goto LABEL_42;
      }
    }

    else
    {
      uint64_t v35 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m");
      v42 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m";
        __int16 v50 = 1024;
        int v51 = 458;
        _os_log_fault_impl( &dword_186681000,  v42,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    uint64_t v3 = 0LL;
    goto LABEL_42;
  }

  return 1LL;
}

- (void).cxx_destruct
{
}

@end