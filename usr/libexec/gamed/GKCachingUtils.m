@interface GKCachingUtils
+ (id)compatiblePlatforms:(id)a3 platformLookup:(id)a4 moc:(id)a5;
+ (id)constructCompatiblePlatforms:(id)a3 moc:(id)a4;
+ (id)constructSupportedTransports:(id)a3 moc:(id)a4;
+ (id)ensureGamesPlayedList:(id)a3 playerID:(id)a4;
+ (id)existingGamePlatforms:(id)a3;
+ (id)existingSupportedTransports:(id)a3;
+ (id)supportedTransports:(id)a3 transportLookup:(id)a4 moc:(id)a5;
+ (void)ensureGameInGamesPlayed:(id)a3 playerID:(id)a4 bundleID:(id)a5 gameDescriptor:(id)a6 updateWidget:(BOOL)a7;
@end

@implementation GKCachingUtils

+ (id)compatiblePlatforms:(id)a3 platformLookup:(id)a4 moc:(id)a5
{
  id v7 = a4;
  id v23 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"platforms"]);
  if ([v8 count])
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v22 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if (objc_msgSend(v15, "length", v22))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);

            if (!v16)
            {
              v17 = objc_alloc(&OBJC_CLASS___GamePlatform);
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[GamePlatform entity](&OBJC_CLASS___GamePlatform, "entity"));
              v19 = -[GamePlatform initWithEntity:insertIntoManagedObjectContext:]( v17,  "initWithEntity:insertIntoManagedObjectContext:",  v18,  v23);

              -[GamePlatform setName:](v19, "setName:", v15);
              [v7 setObject:v19 forKeyedSubscript:v15];
            }

            v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
            -[NSMutableSet addObject:](v9, "addObject:", v20);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v12);
    }

    v8 = v22;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)constructCompatiblePlatforms:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils existingGamePlatforms:](&OBJC_CLASS___GKCachingUtils, "existingGamePlatforms:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils compatiblePlatforms:platformLookup:moc:]( &OBJC_CLASS___GKCachingUtils,  "compatiblePlatforms:platformLookup:moc:",  v6,  v7,  v5));

  return v8;
}

+ (id)constructSupportedTransports:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils existingSupportedTransports:]( &OBJC_CLASS___GKCachingUtils,  "existingSupportedTransports:",  v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils supportedTransports:transportLookup:moc:]( &OBJC_CLASS___GKCachingUtils,  "supportedTransports:transportLookup:moc:",  v6,  v7,  v5));

  return v8;
}

+ (void)ensureGameInGamesPlayed:(id)a3 playerID:(id)a4 bundleID:(id)a5 gameDescriptor:(id)a6 updateWidget:(BOOL)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers(v13);
  }
  v16 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2112;
    v49 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Attempting to add game to games played: %@, %@, %@",  buf,  0x20u);
  }

  if (v11 && v12 && v14)
  {
    id v38 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils ensureGamesPlayedList:playerID:]( &OBJC_CLASS___GKCachingUtils,  "ensureGamesPlayedList:playerID:",  v10,  v11));
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    v37 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 entries]);
    id v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          __int128 v24 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleID]);

          if (v25)
          {
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleID]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v24, v26);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }

      while (v21);
    }

    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v12));
    if (v27)
    {
      v28 = (GameSummary *)v27;
      v29 = v37;
      [v37 removeEntriesObject:v27];
      id v10 = v38;
    }

    else
    {
      v30 = objc_alloc(&OBJC_CLASS___GameSummary);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[GameSummary entity](&OBJC_CLASS___GameSummary, "entity"));
      id v10 = v38;
      v28 = -[GameSummary initWithEntity:insertIntoManagedObjectContext:]( v30,  "initWithEntity:insertIntoManagedObjectContext:",  v31,  v38);

      v29 = v37;
    }

    [v29 insertObject:v28 inEntriesAtIndex:0];
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils constructCompatiblePlatforms:moc:]( &OBJC_CLASS___GKCachingUtils,  "constructCompatiblePlatforms:moc:",  v14,  v10));
    -[GameSummary setCompatiblePlatforms:](v28, "setCompatiblePlatforms:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"adam-id"]);
    -[GameSummary setAdamID:](v28, "setAdamID:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"bundle-id"]);
    -[GameSummary setBundleID:](v28, "setBundleID:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"is-arcade-game"]);
    -[GameSummary setIsArcade:](v28, "setIsArcade:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[GameSummary setPlayedAt:](v28, "setPlayedAt:", v36);

    +[GKClientProxy enumerateClientsUsingBlock:]( &OBJC_CLASS___GKClientProxy,  "enumerateClientsUsingBlock:",  &stru_100273140);
  }
}

+ (id)ensureGamesPlayedList:(id)a3 playerID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayedSummaryList _gkFetchRequest](&OBJC_CLASS___GamesPlayedSummaryList, "_gkFetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"playerID == %@",  v6));
  [v7 setPredicate:v8];

  v9 = (GamesPlayedSummaryList *)objc_claimAutoreleasedReturnValue( +[NSManagedObject _gkRetrieveCleanEntry:request:]( &OBJC_CLASS___NSManagedObject,  "_gkRetrieveCleanEntry:request:",  v5,  v7));
  if (!v9)
  {
    id v10 = objc_alloc(&OBJC_CLASS___GamesPlayedSummaryList);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayedSummaryList entity](&OBJC_CLASS___GamesPlayedSummaryList, "entity"));
    v9 = -[GamesPlayedSummaryList initWithEntity:insertIntoManagedObjectContext:]( v10,  "initWithEntity:insertIntoManagedObjectContext:",  v11,  v5);

    -[GamesPlayedSummaryList setPlayerID:](v9, "setPlayerID:", v6);
  }

  return v9;
}

+ (id)existingGamePlatforms:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GamePlatform _gkFetchRequest](&OBJC_CLASS___GamePlatform, "_gkFetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v5 error:0]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        id v13 = [v12 length];

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, v14);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v4;
}

+ (id)existingSupportedTransports:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKSupportedTransportVersionCacheObject _gkFetchRequest]( &OBJC_CLASS___GKSupportedTransportVersionCacheObject,  "_gkFetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v5 error:0]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 version]);
        [v4 setObject:v11 forKeyedSubscript:v12];
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  return v4;
}

+ (id)supportedTransports:(id)a3 transportLookup:(id)a4 moc:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"supported-transports"]);
  if ([v9 count])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
          __int128 v16 = objc_alloc(&OBJC_CLASS___GKSupportedTransportVersionCacheObject);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKSupportedTransportVersionCacheObject entity]( &OBJC_CLASS___GKSupportedTransportVersionCacheObject,  "entity"));
          __int128 v18 = -[GKSupportedTransportVersionCacheObject initWithEntity:insertIntoManagedObjectContext:]( v16,  "initWithEntity:insertIntoManagedObjectContext:",  v17,  v8);

          -[GKSupportedTransportVersionCacheObject setVersion:](v18, "setVersion:", v15);
          [v7 setObject:v18 forKeyedSubscript:v15];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
          [v10 addObject:v19];
        }

        id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v12);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

@end