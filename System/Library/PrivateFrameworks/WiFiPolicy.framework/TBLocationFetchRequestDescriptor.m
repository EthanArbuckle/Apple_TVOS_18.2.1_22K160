@interface TBLocationFetchRequestDescriptor
- (Class)remoteRequestClass;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)tileItems;
- (PBCodable)remoteRequest;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 maxCacheAge:(id)a5;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 maxCacheAge:(id)a6;
- (double)latitude;
- (double)longitude;
- (id)_localFetchRequest;
- (id)_preferLocalCacheFetchRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)primaryTileKey;
- (unint64_t)type;
- (void)setLatitude:(double)a3;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setPrimaryTileKey:(unint64_t)a3;
- (void)setTileItems:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBLocationFetchRequestDescriptor

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 maxCacheAge:(id)a5
{
  id v8 = a5;
  +[TBDefaults tileSearchRadius](&OBJC_CLASS___TBDefaults, "tileSearchRadius");
  v10 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]( self,  "initWithLatitude:longitude:radius:maxCacheAge:",  v8,  a3,  a4,  v9);

  return v10;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4
{
  return -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]( self,  "initWithLatitude:longitude:radius:maxCacheAge:",  0LL,  a3,  a4,  v7);
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 maxCacheAge:(id)a6
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TBLocationFetchRequestDescriptor;
  v12 = -[TBLocationFetchRequestDescriptor init](&v37, sel_init);
  v12->_latitude = a3;
  v12->_longitude = a4;
  v12->_type = 2LL;
  objc_storeStrong((id *)&v12->_maxCacheAge, a6);
  v13 = -[TBGloriaTile initWithLat:lng:zoom:]( objc_alloc(&OBJC_CLASS___TBGloriaTile),  "initWithLat:lng:zoom:",  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"),  a3,  a4);
  v14 = v13;
  if (v13)
  {
    v12->_primaryTileKey = -[TBGloriaTile key](v13, "key");
    NSLog( @"%s: search radius %f",  "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]",  *(void *)&a5);
    v15 = -[TBGloriaTile neighborTileKeysWithRadius:](v14, "neighborTileKeysWithRadius:", a5);
    [MEMORY[0x189603FE0] set];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = +[TBTileItemDescriptor tileItemDescriptorWithKey:]( &OBJC_CLASS___TBTileItemDescriptor,  "tileItemDescriptorWithKey:",  *(void *)(*((void *)&v33 + 1) + 8 * i));
          [v16 addObject:v22];
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v19);
    }

    objc_storeStrong((id *)&v12->_tileItems, v16);
    v23 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
    v24 = -[TBLocationFetchRequestDescriptor _localFetchRequest](v12, "_localFetchRequest");
    uint64_t v25 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v23, "initWithFetchRequest:", v24);
    localFetchDescriptor = v12->_localFetchDescriptor;
    v12->_localFetchDescriptor = (TBLocalFetchRequestDescriptor *)v25;

    v27 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
    v28 = -[TBLocationFetchRequestDescriptor _preferLocalCacheFetchRequest](v12, "_preferLocalCacheFetchRequest");
    uint64_t v29 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v27, "initWithFetchRequest:", v28);
    preferLocalFetchDescriptor = v12->_preferLocalFetchDescriptor;
    v12->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v29;
  }

  else
  {
    NSLog( @"%s: failed to create gloria tile",  "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]");
    id v17 = 0LL;
    v16 = 0LL;
    v28 = v12;
    v12 = 0LL;
  }

  v31 = v12;
  return v31;
}

- (PBCodable)remoteRequest
{
  return 0LL;
}

- (Class)remoteRequestClass
{
  return 0LL;
}

- (NSPredicate)localFetchPredicate
{
  v15[2] = *MEMORY[0x1895F89C0];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    v4 = -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
    [v4 tilePredicate];
    v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    v6 = -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    if (v6)
    {
      double v7 = (void *)MEMORY[0x189607820];
      id v8 = (void *)MEMORY[0x1896079C8];
      -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      double v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 predicateWithFormat:@"created >= %@", v9];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = v5;
      [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v7 andPredicateWithSubpredicates:v11];

      v5 = (NSPredicate *)v12;
    }

    v13 = self->_localFetchPredicate;
    self->_localFetchPredicate = v5;

    localFetchPredicate = self->_localFetchPredicate;
  }

  return localFetchPredicate;
}

- (id)_localFetchRequest
{
  v3 = (void *)MEMORY[0x1896024E8];
  v4 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
  [v3 fetchRequestWithEntityName:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TBLocationFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  [v5 setPredicate:v6];

  return v5;
}

- (id)_preferLocalCacheFetchRequest
{
  v16[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1896024E8];
  v4 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
  [v3 fetchRequestWithEntityName:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
  [v6 tilePredicate];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    double v9 = (void *)MEMORY[0x189607820];
    v10 = (void *)MEMORY[0x1896079C8];
    -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
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
  [v5 setPropertiesToFetch:&unk_18A1B5738];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBLocationFetchRequestDescriptor latitude](self, "latitude");
  objc_msgSend(v5, "setLatitude:");
  -[TBLocationFetchRequestDescriptor longitude](self, "longitude");
  objc_msgSend(v5, "setLongitude:");
  objc_msgSend(v5, "setType:", -[TBLocationFetchRequestDescriptor type](self, "type"));
  [v5 maxCacheAge];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (void *)[v7 copyWithZone:a3];
    [v5 setMaxCacheAge:v8];
  }

  objc_msgSend(v5, "setPrimaryTileKey:", -[TBLocationFetchRequestDescriptor primaryTileKey](self, "primaryTileKey"));
  -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[v9 copyWithZone:a3];
  [v5 setTileItems:v10];

  id v11 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
  -[TBLocationFetchRequestDescriptor _localFetchRequest](self, "_localFetchRequest");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v11, "initWithFetchRequest:", v12);
  [v5 setLocalFetchDescriptor:v13];

  v14 = objc_alloc(&OBJC_CLASS___TBLocalFetchRequestDescriptor);
  v15 = -[TBLocationFetchRequestDescriptor _preferLocalCacheFetchRequest](self, "_preferLocalCacheFetchRequest");
  v16 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v14, "initWithFetchRequest:", v15);
  [v5 setPreferLocalFetchDescriptor:v16];

  return v5;
}

- (void)setLocalFetchPredicate:(id)a3
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

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (void)setTileItems:(id)a3
{
}

- (unint64_t)primaryTileKey
{
  return self->_primaryTileKey;
}

- (void)setPrimaryTileKey:(unint64_t)a3
{
  self->_primaryTileKey = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void).cxx_destruct
{
}

@end