@interface TBTileFetchRequestDescriptor
- (Class)remoteRequestClass;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)tileItems;
- (PBCodable)remoteRequest;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3;
- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3 maxCacheAge:(id)a4;
- (id)_preferLocalCacheFetchRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setTileItems:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBTileFetchRequestDescriptor

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3
{
  return -[TBTileFetchRequestDescriptor initWithTileItems:maxCacheAge:](self, "initWithTileItems:maxCacheAge:", a3, 0LL);
}

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3 maxCacheAge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TBTileFetchRequestDescriptor;
  v9 = -[TBTileFetchRequestDescriptor init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tileItems, a3);
    objc_storeStrong((id *)&v10->_maxCacheAge, a4);
    v10->_type = 3LL;
    id v11 = objc_alloc(MEMORY[0x1896024E8]);
    v12 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
    v13 = (void *)[v11 initWithEntityName:v12];

    v14 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v13);
    localFetchDescriptor = v10->_localFetchDescriptor;
    v10->_localFetchDescriptor = v14;
    v16 = -[TBTileFetchRequestDescriptor localFetchPredicate](v10, "localFetchPredicate");
    [v13 setPredicate:v16];

    v17 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
    v18 = -[TBTileFetchRequestDescriptor _preferLocalCacheFetchRequest](v10, "_preferLocalCacheFetchRequest");
    uint64_t v19 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v17, "initWithFetchRequest:", v18);
    preferLocalFetchDescriptor = v10->_preferLocalFetchDescriptor;
    v10->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v19;
  }

  return v10;
}

- (NSPredicate)localFetchPredicate
{
  v15[2] = *MEMORY[0x1895F89C0];
  if (!self->_localFetchPredicate)
  {
    v3 = -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
    if (v3)
    {
      v4 = -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
      [v4 tilePredicate];
      v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      v6 = -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      if (v6)
      {
        id v7 = (void *)MEMORY[0x189607820];
        id v8 = (void *)MEMORY[0x1896079C8];
        v9 = -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
        [v8 predicateWithFormat:@"created >= %@", v9];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v10;
        v15[1] = v5;
        [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v7 andPredicateWithSubpredicates:v11];

        v5 = (NSPredicate *)v12;
      }

      localFetchPredicate = self->_localFetchPredicate;
      self->_localFetchPredicate = v5;
    }
  }

  return self->_localFetchPredicate;
}

- (id)_preferLocalCacheFetchRequest
{
  v16[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1896024E8];
  v4 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
  [v3 fetchRequestWithEntityName:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
  [v6 tilePredicate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x189607820];
    v10 = (void *)MEMORY[0x1896079C8];
    -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 predicateWithFormat:@"created > %@", v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = v7;
    [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 andPredicateWithSubpredicates:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setPredicate:v14];
  }

  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_18A1B5750];

  return v5;
}

- (PBCodable)remoteRequest
{
  return 0LL;
}

- (Class)remoteRequestClass
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTileItems:v7];

  objc_msgSend(v5, "setType:", -[TBTileFetchRequestDescriptor type](self, "type"));
  id v8 = objc_alloc(MEMORY[0x1896024E8]);
  v9 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
  v10 = (void *)[v8 initWithEntityName:v9];

  id v11 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor),  "initWithFetchRequest:",  v10);
  [v5 setLocalFetchDescriptor:v11];

  uint64_t v12 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
  v13 = -[TBTileFetchRequestDescriptor _preferLocalCacheFetchRequest](self, "_preferLocalCacheFetchRequest");
  v14 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v12, "initWithFetchRequest:", v13);
  [v5 setPreferLocalFetchDescriptor:v14];
  v15 = -[TBTileFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  v16 = (void *)[v15 copyWithZone:a3];
  [v10 setPredicate:v16];

  return v5;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (void)setLocalFetchDescriptor:(id)a3
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

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (void)setTileItems:(id)a3
{
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
}

- (void)setLocalFetchPredicate:(id)a3
{
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (void)setMaxCacheAge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end