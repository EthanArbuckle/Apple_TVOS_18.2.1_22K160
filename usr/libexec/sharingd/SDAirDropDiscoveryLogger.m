@interface SDAirDropDiscoveryLogger
+ (id)discoverabilityMetricsForNode:(__SFNode *)a3;
+ (id)updateMetrics:(id)a3 withNode:(__SFNode *)a4;
- (NSMutableDictionary)realNameToMetricsMap;
- (SDAirDropDiscoveryLogger)init;
- (void)logMetricsWithSessionTime:(double)a3;
- (void)setRealNameToMetricsMap:(id)a3;
- (void)updateWithAirDropNodes:(id)a3;
@end

@implementation SDAirDropDiscoveryLogger

- (SDAirDropDiscoveryLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropDiscoveryLogger;
  v2 = -[SDAirDropDiscoveryLogger init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    realNameToMetricsMap = v2->_realNameToMetricsMap;
    v2->_realNameToMetricsMap = v3;
  }

  return v2;
}

- (void)updateWithAirDropNodes:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)SFNodeCopyRealName(v10, v6);
        v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_realNameToMetricsMap,  "objectForKeyedSubscript:",  v11));
        if (!v12) {
          v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropDiscoveryLogger updateMetrics:withNode:]( &OBJC_CLASS___SDAirDropDiscoveryLogger,  "updateMetrics:withNode:",  v12,  v10));

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_realNameToMetricsMap,  "setObject:forKeyedSubscript:",  v13,  v11);
      }

      id v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (void)logMetricsWithSessionTime:(double)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_realNameToMetricsMap, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v9);
        __int128 v17 = @"sessionTime";
        if (a3 == 0.0)
        {
          v11 = &off_1005F78A0;
        }

        else
        {
          v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
          v11 = v3;
        }

        v18 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
        [v10 addEntriesFromDictionary:v12];

        if (a3 != 0.0) {
        SFMetricsLog(@"com.apple.sharing.Airdrop.CoalescedNodes.Discovery", v10);
        }
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v7);
  }
}

+ (id)updateMetrics:(id)a3 withNode:(__SFNode *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"contactLevel"]);
  if (v6) {
    uint64_t v7 = (uint64_t)v6;
  }
  else {
    uint64_t v7 = -1LL;
  }
  uint64_t v52 = v7;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"foundBonjour"]);
  unsigned int v55 = [v8 BOOLValueSafe];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"foundRapport"]);
  unsigned int v56 = [v9 BOOLValueSafe];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rpFlagMyiCloud"]);
  id v11 = [v10 BOOLValueSafe];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rpFlagFriend"]);
  id v13 = [v12 BOOLValueSafe];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rpFlagFamily"]);
  id v15 = [v14 BOOLValueSafe];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rpFlagSharedHome"]);
  id v17 = [v16 BOOLValueSafe];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rpFlagStranger"]);
  id v19 = [v18 BOOLValueSafe];

  v20 = (void *)SFNodeCopySiblingNodes(a4);
  v21 = (NSArray *)[v20 mutableCopy];

  if (!v21) {
    v21 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a4, 0LL);
  }
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  obj = v21;
  id v53 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v57,  v61,  16LL);
  if (v53)
  {
    id v47 = v5;
    v22 = 0LL;
    v23 = 0LL;
    uint64_t v51 = *(void *)v58;
    uint64_t v50 = kSFNodeKindBonjour;
    uint64_t v49 = kSFNodeKindRapport;
    do
    {
      v24 = 0LL;
      v25 = v22;
      v26 = v23;
      do
      {
        if (*(void *)v58 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)v24);
        if (v27)
        {
          char v54 = (char)v11;
          char v28 = (char)v13;
          char v29 = (char)v15;
          char v30 = (char)v17;
          char v31 = (char)v19;
          char v32 = sub_100034824(*(void *)(*((void *)&v57 + 1) + 8LL * (void)v24));
          v33 = (void *)SFNodeCopyContactIdentifier(v27);
          v34 = (void *)SFNodeCopyUserName(v27);
          uint64_t v35 = 2LL;
          if (!v34) {
            uint64_t v35 = 3LL;
          }
          if (v33) {
            uint64_t v35 = 1LL;
          }
          BOOL v36 = (v32 & 1) == 0;
          LOBYTE(v19) = v31;
          LOBYTE(v17) = v30;
          LOBYTE(v15) = v29;
          LOBYTE(v13) = v28;
          LOBYTE(v11) = v54;
          if (!v36) {
            uint64_t v35 = 0LL;
          }
          uint64_t v52 = v35;
        }

        else
        {
          uint64_t v52 = -1LL;
        }

        v23 = (void *)SFNodeCopyKinds(v27);

        v55 |= [v23 containsObject:v50];
        v56 |= [v23 containsObject:v49];
        v22 = (void *)SFNodeCopyRapportFlags(v27);

        unsigned __int16 v37 = (unsigned __int16)[v22 unsignedIntegerValue];
        id v11 = (id)((v37 | v11) & 1);
        id v13 = (id)(v13 & 1u | ((v37 & 4) != 0));
        id v15 = (id)(v15 & 1u | ((v37 & 8) != 0));
        id v17 = (id)(v17 & 1u | ((v37 & 0x40) != 0));
        id v19 = (id)((v19 | HIBYTE(v37)) & 1);
        v24 = (char *)v24 + 1;
        v25 = v22;
        v26 = v23;
      }

      while (v53 != v24);
      id v53 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v57,  v61,  16LL);
    }

    while (v53);

    id v5 = v47;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v52));
  [v5 setObject:v38 forKeyedSubscript:@"contactLevel"];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v55 & 1));
  [v5 setObject:v39 forKeyedSubscript:@"foundBonjour"];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v56 & 1));
  [v5 setObject:v40 forKeyedSubscript:@"foundRapport"];

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  [v5 setObject:v41 forKeyedSubscript:@"rpFlagMyiCloud"];

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  [v5 setObject:v42 forKeyedSubscript:@"rpFlagFriend"];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
  [v5 setObject:v43 forKeyedSubscript:@"rpFlagFamily"];

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
  [v5 setObject:v44 forKeyedSubscript:@"rpFlagSharedHome"];

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  [v5 setObject:v45 forKeyedSubscript:@"rpFlagStranger"];

  return v5;
}

+ (id)discoverabilityMetricsForNode:(__SFNode *)a3
{
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropDiscoveryLogger updateMetrics:withNode:]( &OBJC_CLASS___SDAirDropDiscoveryLogger,  "updateMetrics:withNode:",  v4,  a3));

  return v5;
}

- (NSMutableDictionary)realNameToMetricsMap
{
  return self->_realNameToMetricsMap;
}

- (void)setRealNameToMetricsMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end