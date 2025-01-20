@interface NWStatsEntityMapperStaticAssignment
- (NWStatsEntityMapperStaticAssignment)init;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
@end

@implementation NWStatsEntityMapperStaticAssignment

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id result = (id)-[NSMutableDictionary objectForKeyedSubscript:]( self->_staticUUIDToBundleIDMap,  "objectForKeyedSubscript:",  a3);
  if (a4) {
    *a4 = 3;
  }
  return result;
}

- (NWStatsEntityMapperStaticAssignment)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapperStaticAssignment;
  v2 = -[NWStatsEntityMapperStaticAssignment init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    staticUUIDToBundleIDMap = v2->_staticUUIDToBundleIDMap;
    v2->_staticUUIDToBundleIDMap = v3;

    if (v2->_staticUUIDToBundleIDMap)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      objc_msgSend(&unk_18A1C61A8, "allKeys", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
            id v11 = objc_alloc(MEMORY[0x189607AB8]);
            [&unk_18A1C61A8 objectForKeyedSubscript:v10];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)[v11 initWithUUIDString:v12];

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_staticUUIDToBundleIDMap,  "setObject:forKeyedSubscript:",  v10,  v13);
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }

        while (v7);
      }
    }

    else
    {
      v5 = v2;
      v2 = 0LL;
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end