@interface MZKeyValueStoreSerializer
- (BOOL)_isGetAllSinceDomainVersionRequest;
- (BOOL)_isRemoveAllSinceDomainVersion;
- (MZKeyValueStoreDataVerionPair)objectVersionPairForKey:(id)a3;
- (MZKeyValueStoreSerializer)initWithTransaction:(id)a3;
- (MZKeyValueStoreTransaction)transaction;
- (id)baseDictionary;
- (id)dataWithNodes:(id)a3;
- (id)keys;
- (id)payload;
- (id)sinceDomainVersion;
- (void)setTransaction:(id)a3;
@end

@implementation MZKeyValueStoreSerializer

- (MZKeyValueStoreSerializer)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreSerializer;
  v6 = -[MZKeyValueStoreSerializer init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

- (id)payload
{
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer keys](self, "keys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  unsigned int v4 = [v3 type];

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        objc_super v9 = objc_autoreleasePoolPush();
        id v10 = -[MZKeyValueStoreSerializer objectVersionPairForKey:](self, "objectVersionPairForKey:", v8);
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  @"key",  v11,  @"base-version",  0LL));
        if (v10) {
          BOOL v14 = v4 == 2;
        }
        else {
          BOOL v14 = 0;
        }
        int v15 = v14;
        if (v4 == 3 || v15)
        {
          id v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 MZDataByDeflatingWithGZip]);

          if (v17) {
            [v13 setValue:v17 forKey:@"value"];
          }
          [v21 addObject:v13];
        }

        else if (v4 == 1)
        {
          [v21 addObject:v13];
        }

        objc_autoreleasePoolPop(v9);
      }

      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v5);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer dataWithNodes:](self, "dataWithNodes:", v21));
  return v18;
}

- (id)sinceDomainVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sinceDomainVersion]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processor]);
  char v7 = objc_opt_respondsToSelector(v6, "sinceDomainVersionForTransaction:");

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 processor]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 sinceDomainVersionForTransaction:v10]);

    unsigned int v4 = (void *)v11;
  }

  return v4;
}

- (BOOL)_isGetAllSinceDomainVersionRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  if ([v3 type] == 1)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isRemoveAllSinceDomainVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  if ([v3 type] == 3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)baseDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"domain");

  if (-[MZKeyValueStoreSerializer _isGetAllSinceDomainVersionRequest](self, "_isGetAllSinceDomainVersionRequest")
    || -[MZKeyValueStoreSerializer _isRemoveAllSinceDomainVersion](self, "_isRemoveAllSinceDomainVersion"))
  {
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", @"0"))
    {

      uint64_t v6 = @"0";
    }

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"since-domain-version");
  }

  return v3;
}

- (id)dataWithNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count]
    || -[MZKeyValueStoreSerializer _isGetAllSinceDomainVersionRequest](self, "_isGetAllSinceDomainVersionRequest")
    || -[MZKeyValueStoreSerializer _isRemoveAllSinceDomainVersion](self, "_isRemoveAllSinceDomainVersion"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer baseDictionary](self, "baseDictionary"));
    if (!v4) {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }
    [v5 setValue:v4 forKey:@"keys"];
    if (v5) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  kMZKeyValueStorePlistFormatNetworkData,  0LL,  0LL));
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)keys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keys]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processor]);
  char v7 = objc_opt_respondsToSelector(v6, "keysForTransaction:");

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 processor]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 keysForTransaction:v10]);

    id v4 = (void *)v11;
  }

  return v4;
}

- (MZKeyValueStoreDataVerionPair)objectVersionPairForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  unsigned int v6 = [v5 type];

  if (v6 == 1)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 processor]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 versionForGetTransaction:v9 key:v4]);

    uint64_t v11 = 0LL;
    if (v10) {
      v12 = (const __CFString *)v10;
    }
    else {
      v12 = @"0";
    }
  }

  else if ((v6 & 0xFFFFFFFE) == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 processor]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    id v19 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v14 dataForSetTransaction:v15 key:v4 version:&v19]);
    id v16 = (const __CFString *)v19;

    if (v16) {
      v12 = v16;
    }
    else {
      v12 = @"1";
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    v12 = 0LL;
  }

  v17 = (void *)v11;
  v18 = (__CFString *)v12;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end