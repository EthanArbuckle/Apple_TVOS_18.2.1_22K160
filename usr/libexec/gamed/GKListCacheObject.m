@interface GKListCacheObject
+ (Class)entryClass;
+ (id)relationshipKeyPathsForPrefetch;
- (id)entriesPassingTest:(id)a3;
- (id)entryPassingTest:(id)a3;
- (id)findEntry:(id)a3;
- (id)internalRepresentation;
- (void)removeEntriesMatchingPredicate:(id)a3;
- (void)reorderEntry:(id)a3 toIndex:(int64_t)a4;
- (void)updateEntriesWithRepresentations:(id)a3 entryForRepresentation:(id)a4 reuseEntriesByIndex:(BOOL)a5;
- (void)updateSeed;
@end

@implementation GKListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKListEntryCacheObject, a2);
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"entries", 0LL);
}

- (void)updateSeed
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  -[GKListCacheObject setSeed:](self, "setSeed:", v3);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKListCacheObject internalRepresentation]",  [v8 UTF8String],  2273));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) internalRepresentation]);
        if (v17) {
          [v11 addObject:v17];
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

- (void)reorderEntry:(id)a3 toIndex:(int64_t)a4
{
  id v15 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject reorderEntry:toIndex:]",  v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v9,  "-[GKListCacheObject reorderEntry:toIndex:]",  [v11 UTF8String],  2286));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  id v13 = (GKListCacheObject *)objc_claimAutoreleasedReturnValue([v15 list]);
  if (v13 == self)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GKListCacheObject mutableOrderedSetValueForKey:]( self,  "mutableOrderedSetValueForKey:",  @"entries"));
    [v14 insertObject:v15 atIndex:a4];
    -[GKListCacheObject updateSeed](self, "updateSeed");
  }
}

- (void)removeEntriesMatchingPredicate:(id)a3
{
  id v15 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject removeEntriesMatchingPredicate:]",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKListCacheObject removeEntriesMatchingPredicate:]",  [v9 UTF8String],  2297));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 array]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 filteredArrayUsingPredicate:v15]);

  if ([v13 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject managedObjectContext](self, "managedObjectContext"));
    [v14 _gkDeleteObjects:v13];

    -[GKListCacheObject updateSeed](self, "updateSeed");
  }
}

- (void)updateEntriesWithRepresentations:(id)a3 entryForRepresentation:(id)a4 reuseEntriesByIndex:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (uint64_t (**)(id, void, void *))a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  v47 = v8;
  v48 = self;
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]",  v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]",  [v15 UTF8String],  2310));

    self = v48;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject managedObjectContext](self, "managedObjectContext"));
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithCapacity:]( NSMutableOrderedSet,  "orderedSetWithCapacity:",  [v8 count]));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToWeakObjectsMapTable"));
  if (v5)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    __int128 v20 = (char *)[v19 count];

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id obj = v8;
    id v21 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (!v21) {
      goto LABEL_26;
    }
    id v22 = v21;
    uint64_t v23 = 0LL;
    uint64_t v24 = *(void *)v61;
    v49 = v17;
    while (1)
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v61 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
        if ((char *)i + v23 >= v20)
        {
          uint64_t v29 = v9[2](v9, *(void *)(*((void *)&v60 + 1) + 8LL * (void)i), v49);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if (!v28) {
            goto LABEL_14;
          }
LABEL_13:
          [v51 addObject:v28];
          [v18 setObject:v26 forKey:v28];
          goto LABEL_14;
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](v48, "entries"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndex:(char *)i + v23]);

        if (v28) {
          goto LABEL_13;
        }
LABEL_14:
      }

      id v22 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      v23 += (uint64_t)i;
      v17 = v49;
      if (!v22) {
        goto LABEL_26;
      }
    }
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v30 = v8;
  id v31 = [v30 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v57;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)j);
        uint64_t v36 = v9[2](v9, v35, v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (v37)
        {
          [v51 addObject:v37];
          [v18 setObject:v35 forKey:v37];
        }
      }

      id v32 = [v30 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }

    while (v32);
  }

- (id)findEntry:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject findEntry:]",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKListCacheObject findEntry:]",  [v10 UTF8String],  2366));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C9D80;
  v18[3] = &unk_1002713D8;
  id v13 = v4;
  id v19 = v13;
  id v14 = [v12 indexOfObjectPassingTest:v18];

  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = 0LL;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v14]);
  }

  return v15;
}

- (id)entryPassingTest:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject entryPassingTest:]",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKListCacheObject entryPassingTest:]",  [v10 UTF8String],  2384));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  id v13 = [v12 indexOfObjectPassingTest:v4];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = 0LL;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v13]);
  }

  return v14;
}

- (id)entriesPassingTest:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKListCacheObject entriesPassingTest:]",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKListCacheObject entriesPassingTest:]",  [v10 UTF8String],  2395));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 indexesOfObjectsPassingTest:v4]);

  if ([v13 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectsAtIndexes:v13]);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

@end