@interface GKGameSummaryInternal
- (id)initWithGameSummary:(id)a3;
@end

@implementation GKGameSummaryInternal

- (id)initWithGameSummary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = &OBJC_CLASS___GKGameSummaryInternal;
  v5 = -[GKGameSummaryInternal init](&v25, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 adamID]);
    -[GKGameSummaryInternal setAdamID:](v5, "setAdamID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    -[GKGameSummaryInternal setBundleID:](v5, "setBundleID:", v7);

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatiblePlatforms", 0));
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
          id v16 = [v15 length];

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
            -[NSMutableSet addObject:](v8, "addObject:", v17);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v11);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 playedAt]);
    -[GKGameSummaryInternal setPlayedAt:](v5, "setPlayedAt:", v18);

    -[GKGameSummaryInternal setCompatiblePlatforms:](v5, "setCompatiblePlatforms:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 isArcade]);
    -[GKGameSummaryInternal setIsArcade:](v5, "setIsArcade:", [v19 BOOLValue]);
  }

  return v5;
}

@end