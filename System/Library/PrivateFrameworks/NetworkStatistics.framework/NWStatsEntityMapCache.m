@interface NWStatsEntityMapCache
- (NWStatsEntityMapCache)init;
- (double)hitRetainTime;
- (double)missRetainTime;
- (id)description;
- (id)entryForUUID:(id)a3;
- (id)stateDictionary;
- (unsigned)capacityLimit;
- (unsigned)pruneSize;
- (void)pruneCache;
- (void)setCapacityLimit:(unsigned int)a3;
- (void)setEntry:(id)a3 forUUID:(id)a4;
- (void)setHitRetainTime:(double)a3;
- (void)setMissRetainTime:(double)a3;
- (void)setPruneSize:(unsigned int)a3;
@end

@implementation NWStatsEntityMapCache

- (NWStatsEntityMapCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapCache;
  v2 = -[NWStatsEntityMapCache init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *(_OWORD *)(v2 + 24) = xmmword_188024E90;
    *((void *)v2 + 2) = 0xA00000064LL;
  }

  return (NWStatsEntityMapCache *)v2;
}

- (void)pruneCache
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v4 = self->_uuidMap;
  uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v9);
        [v10 expiryTime];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 timeIntervalSinceNow];
        double v13 = v12;

        if (v13 < 0.0) {
          [v3 addObject:v9];
        }
      }

      uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
    }

    while (v6);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0LL; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMutableDictionary removeObjectForKey:]( self->_uuidMap,  "removeObjectForKey:",  *(void *)(*((void *)&v29 + 1) + 8 * j));
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }

    while (v16);
  }

  if (-[NSMutableDictionary count](self->_uuidMap, "count") > (unint64_t)self->_capacityLimit)
  {
    v19 = -[NSMutableDictionary keysSortedByValueUsingComparator:]( self->_uuidMap,  "keysSortedByValueUsingComparator:",  &__block_literal_global_1);
    objc_msgSend(v19, "subarrayWithRange:", 0, self->_pruneSize);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t k = 0LL; k != v22; ++k)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          -[NSMutableDictionary removeObjectForKey:]( self->_uuidMap,  "removeObjectForKey:",  *(void *)(*((void *)&v25 + 1) + 8 * k));
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }

      while (v22);
    }
  }
}

uint64_t __35__NWStatsEntityMapCache_pruneCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 expiryTime];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 expiryTime];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)entryForUUID:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  [v5 entityName];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:self->_hitRetainTime];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setExpiryTime:v8];

      goto LABEL_13;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v6 expiryTime];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      if (v11 >= 0.0) {
        goto LABEL_13;
      }
      -[NSMutableDictionary removeObjectForKey:](self->_uuidMap, "removeObjectForKey:", v4);

      -[NWStatsEntityMapCache pruneCache](self, "pruneCache");
    }

    else
    {
      NStatGetLog();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_187FF5000, v12, OS_LOG_TYPE_ERROR, "Unexpected class in UUID map", v14, 2u);
      }
    }

- (void)setEntry:(id)a3 forUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v7);
    if (v8)
    {
      NStatGetLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v7);
        double v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = 138543874;
        id v16 = v7;
        __int16 v17 = 2114;
        v18 = v10;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_ERROR,  "Attempted overwrite of entry for UUID %{public}@, was %{public}@ new %{public}@",  (uint8_t *)&v15,  0x20u);
      }
    }

    double v11 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapCacheEntry);
    -[NWStatsEntityMapCacheEntry setEntityName:](v11, "setEntityName:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v12 = 3LL;
    }

    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v12 = 4LL;
      if ((isKindOfClass & 1) != 0) {
        uint64_t v12 = 3LL;
      }
    }

    [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:*(double *)&(&self->super.isa)[v12]];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapCacheEntry setExpiryTime:](v11, "setExpiryTime:", v14);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uuidMap, "setObject:forKeyedSubscript:", v11, v7);
  }

  else
  {
    NStatGetLog();
    double v11 = (NWStatsEntityMapCacheEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl( &dword_187FF5000,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Attempted to setEntry other than to a string or NSNull",  (uint8_t *)&v15,  2u);
    }
  }
}

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"NWStatsEntityMapCache %@", self->_uuidMap];
}

- (id)stateDictionary
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = self->_uuidMap;
  uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v10, (void)v15);
        double v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 description];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v12 forKeyedSubscript:v10];
      }

      uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"Cache"];
  [MEMORY[0x189603F50] date];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKeyedSubscript:@"TimeNow"];

  return v3;
}

- (double)hitRetainTime
{
  return self->_hitRetainTime;
}

- (void)setHitRetainTime:(double)a3
{
  self->_hitRetainTime = a3;
}

- (double)missRetainTime
{
  return self->_missRetainTime;
}

- (void)setMissRetainTime:(double)a3
{
  self->_missRetainTime = a3;
}

- (unsigned)capacityLimit
{
  return self->_capacityLimit;
}

- (void)setCapacityLimit:(unsigned int)a3
{
  self->_capacityLimit = a3;
}

- (unsigned)pruneSize
{
  return self->_pruneSize;
}

- (void)setPruneSize:(unsigned int)a3
{
  self->_pruneSize = a3;
}

- (void).cxx_destruct
{
}

@end