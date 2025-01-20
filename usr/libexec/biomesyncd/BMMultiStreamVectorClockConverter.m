@interface BMMultiStreamVectorClockConverter
+ (id)_reinitializeSiteIdentifier:(id)a3;
+ (id)multiStreamRangeClockVectorFromIndexClockVectors:(id)a3;
+ (id)multiStreamTimestampClockVectorToVectorClock:(id)a3;
+ (id)multiStreamVectorClockToTimestampVectorClock:(id)a3;
+ (id)rangeTimestampClockVectorFromIndexClockVector:(id)a3;
+ (id)timestampClockVectorToTimeStampVector:(id)a3;
+ (id)timestampVectorToTimeStampClockVector:(id)a3;
- (BMMultiStreamVectorClockConverter)init;
@end

@implementation BMMultiStreamVectorClockConverter

- (BMMultiStreamVectorClockConverter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BMMultiStreamVectorClockConverter;
  return -[BMMultiStreamVectorClockConverter init](&v3, "init");
}

+ (id)_reinitializeSiteIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modifier]);

  if (!v4)
  {
    uint64_t v5 = __biome_log_for_category(11LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100040230((uint64_t)v3, v6);
    }
  }

  id v7 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 modifier]);
  id v10 = [v7 initWithIdentifier:v8 modifier:v9];

  return v10;
}

+ (id)timestampVectorToTimeStampClockVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampClockVector);
  v16 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamps]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 siteIdentifierObject]);
        v13 = -[NSIndexSet initWithIndex:]( [NSIndexSet alloc],  "initWithIndex:",  [v11 clockValue]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _reinitializeSiteIdentifier:v12]);
        [v5 addClockValuesInIndexSet:v13 forSiteIdentifier:v14];
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  return v5;
}

+ (id)timestampClockVectorToTimeStampVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allSiteIdentifiers]);
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 _reinitializeSiteIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * (void)v10)]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 clockValuesForSiteIdentifier:v11]);
        v13 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( [CKDistributedTimestamp alloc],  "initWithSiteIdentifierObject:clockValue:",  v11,  [v12 lastIndex]);
        -[NSMutableArray addObject:](v6, "addObject:", v13);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  id v14 = [[CKDistributedTimestampVector alloc] initWithTimestamps:v6];
  return v14;
}

+ (id)multiStreamTimestampClockVectorToVectorClock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___BMMultiStreamVectorClock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 timestampClockVectorForStreamIdentifier:v9]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClockConverter timestampClockVectorToTimeStampVector:]( &OBJC_CLASS___BMMultiStreamVectorClockConverter,  "timestampClockVectorToTimeStampVector:",  v11));
        -[BMMultiStreamVectorClock setVectorClockTo:forStreamIdentifier:]( v4,  "setVectorClockTo:forStreamIdentifier:",  v12,  v9);

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (id)multiStreamVectorClockToTimestampVectorClock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___BMMultiStreamTimestampClockVector);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 vectorClockForStreamIdentifier:v9]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClockConverter timestampVectorToTimeStampClockVector:]( &OBJC_CLASS___BMMultiStreamVectorClockConverter,  "timestampVectorToTimeStampClockVector:",  v11));
        -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:]( v4,  "setVectorClockTo:forStreamIdentifier:",  v12,  v9);

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (id)rangeTimestampClockVectorFromIndexClockVector:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampClockVector);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allSiteIdentifiers]);
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _reinitializeSiteIdentifier:v10]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 clockValuesForSiteIdentifier:v11]);
        if ([v12 count] == (id)1)
        {
          id v13 = sub_100005454((uint64_t)[v12 firstIndex]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          [v5 addClockValuesInIndexSet:v14 forSiteIdentifier:v10];
        }

        else
        {
          [v5 addClockValuesInIndexSet:v12 forSiteIdentifier:v11];
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  return v5;
}

+ (id)multiStreamRangeClockVectorFromIndexClockVectors:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___BMMultiStreamTimestampClockVector);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 timestampClockVectorForStreamIdentifier:v10]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 rangeTimestampClockVectorFromIndexClockVector:v12]);
        -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:]( v5,  "setVectorClockTo:forStreamIdentifier:",  v13,  v10);

        objc_autoreleasePoolPop(v11);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v5;
}

@end