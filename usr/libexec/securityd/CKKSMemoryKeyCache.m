@interface CKKSMemoryKeyCache
- (CKKSMemoryKeyCache)init;
- (NSMutableDictionary)keyCache;
- (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (id)loadKeyForItem:(id)a3 error:(id *)a4;
- (id)loadKeyForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (void)addKeyToCache:(id)a3 key:(id)a4;
- (void)populateWithRecords:(id)a3 contextID:(id)a4;
- (void)setKeyCache:(id)a3;
@end

@implementation CKKSMemoryKeyCache

- (CKKSMemoryKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CKKSMemoryKeyCache;
  v2 = -[CKKSMemoryKeyCache init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    keyCache = v2->_keyCache;
    v2->_keyCache = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (id)loadKeyForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);

  if (!v14)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey loadKeyWithUUID:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "loadKeyWithUUID:contextID:zoneID:error:",  v10,  v11,  v12,  a6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
    [v15 setObject:v14 forKeyedSubscript:v10];
  }

  id v16 = v14;

  return v16;
}

- (id)loadKeyForItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 parentKeyUUID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSMemoryKeyCache loadKeyForUUID:contextID:zoneID:error:]( self,  "loadKeyForUUID:contextID:zoneID:error:",  v7,  v8,  v9,  a4));
  return v10;
}

- (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer fromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "fromDatabase:contextID:zoneID:error:",  a3,  v10,  v11,  a6));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 currentKeyUUID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSMemoryKeyCache loadKeyForUUID:contextID:zoneID:error:]( self,  "loadKeyForUUID:contextID:zoneID:error:",  v14,  v10,  v11,  a6));
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (void)addKeyToCache:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)populateWithRecords:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSKey),  "initWithCKRecord:contextID:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v12, "uuid"));
        -[CKKSMemoryKeyCache addKeyToCache:key:](self, "addKeyToCache:key:", v13, v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

- (NSMutableDictionary)keyCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setKeyCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end