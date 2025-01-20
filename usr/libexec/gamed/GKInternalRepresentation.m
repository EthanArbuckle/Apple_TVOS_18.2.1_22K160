@interface GKInternalRepresentation
+ (id)internalRepresentationForCacheObject:(id)a3;
- (id)initWithCacheObject:(id)a3;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKInternalRepresentation

+ (id)internalRepresentationForCacheObject:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCacheObject:v4];

  return v5;
}

- (id)initWithCacheObject:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKInternalRepresentation(Cache) initWithCacheObject:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKInternalRepresentation(Cache) initWithCacheObject:]",  [v10 UTF8String],  35));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GKInternalRepresentation;
  v12 = -[GKInternalRepresentation init](&v15, "init");
  v13 = v12;
  if (v12) {
    -[GKInternalRepresentation updateWithCacheObject:](v12, "updateWithCacheObject:", v4);
  }

  return v13;
}

- (void)updateWithCacheObject:(id)a3
{
  id v25 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKInternalRepresentation(Cache) updateWithCacheObject:]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKInternalRepresentation(Cache) updateWithCacheObject:]",  [v8 UTF8String],  46));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "secureCodedPropertyKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v18]);
        else {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v25 valueForKey:v18]);
        }
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNull, v21);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
        {
          if (!v22) {
            goto LABEL_15;
          }
          -[GKInternalRepresentation setValue:forKey:](self, "setValue:forKey:", v22, v18);
        }

LABEL_15:
      }

      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }
}

@end