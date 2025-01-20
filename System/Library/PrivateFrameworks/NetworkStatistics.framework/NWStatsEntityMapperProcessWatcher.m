@interface NWStatsEntityMapperProcessWatcher
- (BOOL)canonicalizedNames;
- (NWStatsEntityMapperProcessWatcher)init;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (void)_uuidProcessNameMapPrune;
- (void)noteUUID:(id)a3 forProcessName:(id)a4;
- (void)setCanonicalizedNames:(BOOL)a3;
@end

@implementation NWStatsEntityMapperProcessWatcher

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v6)
  {
    if (!v7->_niluuidProcessName)
    {
      v12 = 0LL;
      goto LABEL_12;
    }

    objc_msgSend(NSString, "stringWithString:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v8 = -[NSMutableDictionary objectForKeyedSubscript:](v7->_uuidProcessNameMap, "objectForKeyedSubscript:", v6);
  if (v8)
  {
    [MEMORY[0x189603F50] date];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v9 forKeyedSubscript:@"timestamp"];

    v10 = (void *)NSString;
    [v8 objectForKeyedSubscript:@"procName"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stringWithString:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v12 = 0LL;
  }

  if (a4)
  {
LABEL_9:
    if (v12) {
      *a4 = 6;
    }
  }

- (NWStatsEntityMapperProcessWatcher)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapperProcessWatcher;
  v2 = -[NWStatsEntityMapperProcessWatcher init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uuidProcessNameMap = v2->_uuidProcessNameMap;
    v2->_uuidProcessNameMap = v3;

    if (!v2->_uuidProcessNameMap)
    {

      v2 = 0LL;
    }

    uint64_t v5 = [objc_alloc(MEMORY[0x189604010]) initWithArray:&unk_18A1C6178];
    daemonsWithStandardPrefixSet = v2->_daemonsWithStandardPrefixSet;
    v2->_daemonsWithStandardPrefixSet = (NSSet *)v5;

    daemonsWithNonStandardMappings = v2->_daemonsWithNonStandardMappings;
    v2->_daemonsWithNonStandardMappings = (NSDictionary *)&unk_18A1C61D0;
  }

  return v2;
}

- (void)noteUUID:(id)a3 forProcessName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_uuidProcessNameMap, "objectForKeyedSubscript:", v6);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
      if (!v10)
      {
        NStatGetLog();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v7;
          _os_log_impl(&dword_187FF5000, v13, OS_LOG_TYPE_ERROR, "Memory allocation failed for %@", buf, 0xCu);
        }

        goto LABEL_20;
      }

      id v11 = v7;
      if (v8->_canonicalizedNames)
      {
        v12 = -[NSSet member:](v8->_daemonsWithStandardPrefixSet, "member:", v11);
        if (v12)
        {
          v13 = (os_log_s *)[objc_alloc(NSString) initWithFormat:@"com.apple.%@", v11];

          NStatGetLog();
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v19 = v11;
            __int16 v20 = 2112;
            id v21 = v6;
            __int16 v22 = 2112;
            v23 = v13;
            v15 = "Create canonical mapping for process %@, %@ -> %@";
LABEL_16:
            _os_log_impl(&dword_187FF5000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x20u);
            goto LABEL_17;
          }

          goto LABEL_17;
        }
        v16 = -[NSDictionary objectForKeyedSubscript:](v8->_daemonsWithNonStandardMappings, "objectForKeyedSubscript:", v11);
        if (v16)
        {
          -[NSDictionary objectForKeyedSubscript:](v8->_daemonsWithNonStandardMappings, "objectForKeyedSubscript:", v11);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          NStatGetLog();
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v19 = v11;
            __int16 v20 = 2112;
            id v21 = v6;
            __int16 v22 = 2112;
            v23 = v13;
            v15 = "Create non-standard mapping for process %@, %@ -> %@";
            goto LABEL_16;
          }

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v4->_uuidProcessNameMap];
  [v3 setObject:v5 forKeyedSubscript:@"ProcessNameMap"];

  objc_sync_exit(v4);
  return v3;
}

- (void)_uuidProcessNameMapPrune
{
  if ((unint64_t)-[NSMutableDictionary count](self->_uuidProcessNameMap, "count") >= 0x65)
  {
    -[NSMutableDictionary keysSortedByValueUsingComparator:]( self->_uuidProcessNameMap,  "keysSortedByValueUsingComparator:",  &__block_literal_global_538);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 0, 10);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary count](self->_uuidProcessNameMap, "count");
    -[NSMutableDictionary removeObjectsForKeys:](self->_uuidProcessNameMap, "removeObjectsForKeys:", v3);
  }

uint64_t __61__NWStatsEntityMapperProcessWatcher__uuidProcessNameMapPrune__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 objectForKeyedSubscript:@"timestamp"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"timestamp"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)canonicalizedNames
{
  return self->_canonicalizedNames;
}

- (void)setCanonicalizedNames:(BOOL)a3
{
  self->_canonicalizedNames = a3;
}

- (void).cxx_destruct
{
}

@end