@interface NWStatsEntityMapperCoalitionWatcher
- (BOOL)noteUUID:(id)a3 forPid:(int)a4;
- (NWStatsEntityMapperCoalitionWatcher)init;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (void)_uuidCoalitionNameMapPrune;
@end

@implementation NWStatsEntityMapperCoalitionWatcher

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](v7->_uuidCoalitionNameMap, "objectForKeyedSubscript:", v6);
    if (v8)
    {
      [MEMORY[0x189603F50] date];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v9 forKeyedSubscript:@"timestamp"];

      v10 = (void *)NSString;
      [v8 objectForKeyedSubscript:@"coalitionName"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 stringWithString:v11];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }

    objc_sync_exit(v7);
    if (a4 && v12) {
      *a4 = 5;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (NWStatsEntityMapperCoalitionWatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapperCoalitionWatcher;
  v2 = -[NWStatsEntityMapperCoalitionWatcher init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uuidCoalitionNameMap = v2->_uuidCoalitionNameMap;
    v2->_uuidCoalitionNameMap = v3;

    if (!v2->_uuidCoalitionNameMap)
    {

      return 0LL;
    }
  }

  return v2;
}

- (BOOL)noteUUID:(id)a3 forPid:(int)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    pid_to_coalitionID(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NStatGetLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( &dword_187FF5000,  v8,  OS_LOG_TYPE_DEFAULT,  "Note coalition name %@ for uuid %@",  (uint8_t *)&v17,  0x16u);
    }

    if (v7)
    {
      v9 = self;
      objc_sync_enter(v9);
      v10 = -[NSMutableDictionary objectForKeyedSubscript:](v9->_uuidCoalitionNameMap, "objectForKeyedSubscript:", v6);
      if (v10)
      {
        LOBYTE(v11) = 0;
      }

      else
      {
        id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
        BOOL v11 = v12 != 0LL;
        if (v12)
        {
          [NSString stringWithString:v7];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 setObject:v13 forKeyedSubscript:@"coalitionName"];

          [MEMORY[0x189603F50] date];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 setObject:v14 forKeyedSubscript:@"timestamp"];

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v9->_uuidCoalitionNameMap,  "setObject:forKeyedSubscript:",  v12,  v6);
        }

        else
        {
          NStatGetLog();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v17 = 138412290;
            v18 = v7;
            _os_log_impl( &dword_187FF5000,  v15,  OS_LOG_TYPE_ERROR,  "Memory allocation failed for %@",  (uint8_t *)&v17,  0xCu);
          }
        }
      }

      objc_sync_exit(v9);
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_uuidCoalitionNameMapPrune
{
  if ((unint64_t)-[NSMutableDictionary count](self->_uuidCoalitionNameMap, "count") >= 0x65)
  {
    -[NSMutableDictionary keysSortedByValueUsingComparator:]( self->_uuidCoalitionNameMap,  "keysSortedByValueUsingComparator:",  &__block_literal_global_114);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 0, 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary count](self->_uuidCoalitionNameMap, "count");
    -[NSMutableDictionary removeObjectsForKeys:](self->_uuidCoalitionNameMap, "removeObjectsForKeys:", v3);
  }

uint64_t __65__NWStatsEntityMapperCoalitionWatcher__uuidCoalitionNameMapPrune__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 objectForKeyedSubscript:@"timestamp"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"timestamp"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void).cxx_destruct
{
}

@end