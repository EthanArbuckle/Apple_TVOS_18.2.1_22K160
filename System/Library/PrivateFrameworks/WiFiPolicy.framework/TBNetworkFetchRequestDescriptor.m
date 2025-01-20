@interface TBNetworkFetchRequestDescriptor
- (Class)remoteRequestClass;
- (GEOWiFiQualityNetworkSearch)remoteRequest;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)bssids;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBNetworkFetchRequestDescriptor)init;
- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3;
- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3 maxCacheAge:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setBssids:(id)a3;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setRemoteRequest:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBNetworkFetchRequestDescriptor

- (TBNetworkFetchRequestDescriptor)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TBNetworkFetchRequestDescriptor;
  v2 = -[TBNetworkFetchRequestDescriptor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 1LL;
    id v4 = objc_alloc(MEMORY[0x1896024E8]);
    v5 = +[TBAccessPointMO entityName](&OBJC_CLASS___TBAccessPointMO, "entityName");
    v6 = (void *)[v4 initWithEntityName:v5];

    v7 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v6);
    localFetchDescriptor = v3->_localFetchDescriptor;
    v3->_localFetchDescriptor = v7;

    v9 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v6);
    preferLocalFetchDescriptor = v3->_preferLocalFetchDescriptor;
    v3->_preferLocalFetchDescriptor = v9;
  }

  return v3;
}

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3
{
  return -[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:](self, "initWithBSSIDs:maxCacheAge:", a3, 0LL);
}

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3 maxCacheAge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TBNetworkFetchRequestDescriptor;
  v9 = -[TBNetworkFetchRequestDescriptor init](&v20, sel_init);
  objc_storeStrong((id *)&v9->_bssids, a3);
  bssids = v9->_bssids;
  if (bssids && -[NSSet count](bssids, "count"))
  {
    v9->_type = 1LL;
    objc_storeStrong((id *)&v9->_maxCacheAge, a4);
    id v11 = objc_alloc(MEMORY[0x1896024E8]);
    +[TBAccessPointMO entityName](&OBJC_CLASS___TBAccessPointMO, "entityName");
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)[v11 initWithEntityName:v12];
    v14 = -[TBNetworkFetchRequestDescriptor localFetchPredicate](v9, "localFetchPredicate");
    [v13 setPredicate:v14];

    v15 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v13);
    localFetchDescriptor = v9->_localFetchDescriptor;
    v9->_localFetchDescriptor = v15;

    v17 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v13);
    preferLocalFetchDescriptor = v9->_preferLocalFetchDescriptor;
    v9->_preferLocalFetchDescriptor = v17;
  }

  else
  {
    NSLog(@"%s: bssids is nil or empty", "-[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:]");
    v13 = 0LL;
    preferLocalFetchDescriptor = v9;
    v9 = 0LL;
  }

  return v9;
}

- (NSPredicate)localFetchPredicate
{
  v16[2] = *MEMORY[0x1895F89C0];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    id v4 = (void *)MEMORY[0x1896079C8];
    v5 = -[NSSet reformatBSSIDs](self->_bssids, "reformatBSSIDs");
    [v4 predicateWithFormat:@"bssid IN %@", v5];
    v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

    -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      id v8 = (void *)MEMORY[0x189607820];
      v9 = (void *)MEMORY[0x1896079C8];
      v10 = -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      [v9 predicateWithFormat:@"created > %@", v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      v16[1] = v6;
      [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v8 andPredicateWithSubpredicates:v12];

      v6 = (NSPredicate *)v13;
    }

    v14 = self->_localFetchPredicate;
    self->_localFetchPredicate = v6;

    localFetchPredicate = self->_localFetchPredicate;
  }

  return localFetchPredicate;
}

- (GEOWiFiQualityNetworkSearch)remoteRequest
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  remoteRequest = self->_remoteRequest;
  if (!remoteRequest)
  {
    id v4 = objc_alloc_init(MEMORY[0x18960F430]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v5 = -[TBNetworkFetchRequestDescriptor bssids](self, "bssids", 0LL);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
          id v11 = objc_alloc_init(MEMORY[0x18960F400]);
          [v10 reformatBSSID];
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setIdentifier:v12];

          id v13 = objc_alloc_init(MEMORY[0x18960F420]);
          [v13 addBss:v11];
          [v4 addEss:v13];

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }

    v14 = self->_remoteRequest;
    self->_remoteRequest = (GEOWiFiQualityNetworkSearch *)v4;

    remoteRequest = self->_remoteRequest;
  }

  return remoteRequest;
}

- (Class)remoteRequestClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBNetworkFetchRequestDescriptor bssids](self, "bssids");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBssids:v7];

  objc_msgSend(v5, "setType:", -[TBNetworkFetchRequestDescriptor type](self, "type"));
  -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[v9 copyWithZone:a3];
    [v5 setMaxCacheAge:v10];
  }

  id v11 = objc_alloc(MEMORY[0x1896024E8]);
  +[TBAccessPointMO entityName](&OBJC_CLASS___TBAccessPointMO, "entityName");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = (void *)[v11 initWithEntityName:v12];
  v14 = -[TBNetworkFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  v15 = (void *)[v14 copyWithZone:a3];
  [v13 setPredicate:v15];

  __int128 v16 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v13);
  [v5 setLocalFetchDescriptor:v16];

  __int128 v17 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v13);
  [v5 setPreferLocalFetchDescriptor:v17];

  return v5;
}

- (void)setLocalFetchPredicate:(id)a3
{
}

- (void)setRemoteRequest:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (void)setMaxCacheAge:(id)a3
{
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (void)setLocalFetchDescriptor:(id)a3
{
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
}

- (NSSet)bssids
{
  return self->_bssids;
}

- (void)setBssids:(id)a3
{
}

- (void).cxx_destruct
{
}

@end