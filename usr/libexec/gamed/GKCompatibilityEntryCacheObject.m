@interface GKCompatibilityEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKCompatibilityEntryCacheObject

+ (id)entityName
{
  return @"CompatibilityMatrixEntry";
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCompatibilityEntryCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKCompatibilityEntryCacheObject internalRepresentation]",  [v8 UTF8String],  2678));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKCompatibilityEntryInternal internalRepresentation]( &OBJC_CLASS___GKCompatibilityEntryInternal,  "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject bundleID](self, "bundleID"));
  [v10 setBundleID:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject adamID](self, "adamID"));
  [v10 setAdamID:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject platform](self, "platform"));
  objc_msgSend(v10, "setPlatform:", objc_msgSend(v13, "integerValue"));

  v14 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  v16 = -[NSMutableSet initWithCapacity:](v14, "initWithCapacity:", [v15 count]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  id v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v37 + 1) + 8 * (void)v21) version]);
        -[NSMutableSet addObject:](v16, "addObject:", v22);

        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v19);
  }

  [v10 setVersions:v16];
  v23 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  v25 = -[NSMutableSet initWithCapacity:](v23, "initWithCapacity:", [v24 count]);

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  id v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      v30 = 0LL;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)v30) shortVersion]);
        -[NSMutableSet addObject:](v25, "addObject:", v31);

        v30 = (char *)v30 + 1;
      }

      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v28);
  }

  [v10 setShortVersions:v25];
  return v10;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  2701));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___GKCompatibilityEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v65, "updateWithServerRepresentation:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  [v12 _gkDeleteObjects:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"bundle-id"]);
  -[GKCompatibilityEntryCacheObject setBundleID:](self, "setBundleID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adam-id"]);
  -[GKCompatibilityEntryCacheObject setAdamID:](self, "setAdamID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"platform"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:]( &OBJC_CLASS___GKGameDescriptor,  "gamePlatformFromServerGameDescriptorString:",  v16)));
  -[GKCompatibilityEntryCacheObject setPlatform:](self, "setPlatform:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"versions"]);
  id v19 = v18;
  if (v14 && [v18 count])
  {
    v50 = v16;
    v53 = self;
    id v55 = v4;
    uint64_t v20 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v19 count]);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v48 = v19;
    id v21 = v19;
    id v22 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v22)
    {
      id v24 = v22;
      uint64_t v25 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(v21);
          }
          id v27 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDictionary, v23);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
            id v29 = (id)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"bundle-version"]);
          }
          else {
            id v29 = v27;
          }
          v30 = v29;
          if (v29)
          {
            v31 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKCompatibilityVersionCacheObject),  "initWithManagedObjectContext:",  v12);
            -[GKCompatibilityVersionCacheObject setVersion:](v31, "setVersion:", v30);
            -[NSMutableOrderedSet addObject:](v20, "addObject:", v31);
          }
        }

        id v24 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
      }

      while (v24);
    }

    self = v53;
    -[GKCompatibilityEntryCacheObject setVersions:](v53, "setVersions:", v20);

    id v4 = v55;
    id v19 = v48;
    v16 = v50;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  [v12 _gkDeleteObjects:v32];

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"short-versions"]);
  __int128 v34 = v33;
  if (v14 && [v33 count])
  {
    v49 = v19;
    v51 = v16;
    v52 = v14;
    v54 = self;
    id v56 = v4;
    __int128 v35 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v34 count]);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    v47 = v34;
    id v36 = v34;
    id v37 = [v36 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v37)
    {
      id v39 = v37;
      uint64_t v40 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v58 != v40) {
            objc_enumerationMutation(v36);
          }
          v42 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
          uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSDictionary, v38);
          if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0) {
            id v44 = (id)objc_claimAutoreleasedReturnValue([v42 objectForKey:@"short-bundle-version"]);
          }
          else {
            id v44 = v42;
          }
          v45 = v44;
          if (v44)
          {
            v46 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKCompatibilityShortVersionCacheObject),  "initWithManagedObjectContext:",  v12);
            -[GKCompatibilityShortVersionCacheObject setShortVersion:](v46, "setShortVersion:", v45);
            -[NSMutableOrderedSet addObject:](v35, "addObject:", v46);
          }
        }

        id v39 = [v36 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }

      while (v39);
    }

    -[GKCompatibilityEntryCacheObject setShortVersions:](v54, "setShortVersions:", v35);
    id v4 = v56;
    v14 = v52;
    id v19 = v49;
    v16 = v51;
    __int128 v34 = v47;
  }
}

@end