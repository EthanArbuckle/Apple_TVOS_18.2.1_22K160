@interface NSManagedObjectContext
- (unint64_t)_gkCountObjectsFromRequest:(id)a3;
- (void)_gkClearAllEntriesOfEntity:(id)a3;
- (void)_gkDeleteObjects:(id)a3;
- (void)_gkSafeSave;
@end

@implementation NSManagedObjectContext

- (void)_gkDeleteObjects:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
      || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet, v7), (objc_opt_isKindOfClass(v5, v8) & 1) != 0)
      || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSOrderedSet, v9), (objc_opt_isKindOfClass(v5, v10) & 1) != 0))
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v11 = v5;
      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          v15 = 0LL;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            -[NSManagedObjectContext deleteObject:]( self,  "deleteObject:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v15),  (void)v16);
            v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v13);
      }
    }

    else
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GKInvalidParameter",  @"objects parameter must be of kind NSSet, NSOrderedSet or NSArray");
    }
  }
}

- (void)_gkSafeSave
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]",  v5));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSManagedObj ectContext+GKAdditions.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]",  [v8 UTF8String],  32));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v17[0] = 0LL;
  unsigned __int8 v10 = -[NSManagedObjectContext save:](self, "save:", v17);
  id v11 = v17[0];
  id v12 = v11;
  id v13 = (os_log_s *)os_log_GKGeneral;
  if ((v10 & 1) != 0)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v11);
    }
    v15 = (os_log_s *)os_log_GKCache;
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_100101978((uint64_t)self, v15);
    }
  }

  else
  {
    if (!os_log_GKGeneral)
    {
      id v16 = (id)GKOSLoggers(v11);
      id v13 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1001019EC((uint64_t)self, (uint64_t)v12, v13);
    }
    -[NSManagedObjectContext rollback](self, "rollback");
  }
}

- (void)_gkClearAllEntriesOfEntity:(id)a3
{
  id v4 = a3;
  id v5 = -[NSFetchRequest initWithEntityName:](objc_alloc(&OBJC_CLASS___NSFetchRequest), "initWithEntityName:", v4);

  uint64_t v6 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v5);
  id v22 = 0LL;
  id v7 = -[NSManagedObjectContext executeRequest:error:](self, "executeRequest:error:", v6, &v22);
  id v8 = v22;
  uint64_t v9 = v8;
  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v8);
    }
    id v11 = (os_log_s *)os_log_GKError;
    BOOL v12 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_100101A70(v11, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v21 = (id)GKOSLoggers(v12);
      v20 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Clear entries error: %@", buf, 0xCu);
    }
  }
}

- (unint64_t)_gkCountObjectsFromRequest:(id)a3
{
  id v19 = 0LL;
  unint64_t v3 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", a3, &v19);
  id v4 = v19;
  id v5 = v4;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers(v4);
    }
    id v7 = (os_log_s *)os_log_GKError;
    BOOL v8 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_100101AA4(v7, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v17 = (id)GKOSLoggers(v8);
      uint64_t v16 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Count for objects: %@", buf, 0xCu);
    }
  }

  return v3;
}

@end