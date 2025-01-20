@interface GKExpiringCacheObject
+ (id)fetchSortDescriptors;
+ (void)expireObjectsMatchingPredicate:(id)a3 context:(id)a4;
+ (void)invalidateObjectsMatchingPredicate:(id)a3 context:(id)a4;
- (BOOL)expired;
- (BOOL)isValid;
- (void)awakeFromInsert;
- (void)expire;
- (void)invalidate;
- (void)updateWithServerRepresentation:(id)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKExpiringCacheObject

+ (id)fetchSortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"timeStamp",  0LL));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)invalidate
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKExpiringCacheObject invalidate]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKExpiringCacheObject invalidate]",  [v8 UTF8String],  612));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", 0LL);
}

- (void)expire
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKExpiringCacheObject expire]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKExpiringCacheObject expire]",  [v8 UTF8String],  618));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if (-[GKExpiringCacheObject isValid](self, "isValid"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -1.0));
    -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", v10);

    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v11);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000D7D9C();
    }
  }

- (BOOL)expired
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKExpiringCacheObject expired]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKExpiringCacheObject expired]",  [v8 UTF8String],  627));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if (!-[GKExpiringCacheObject isValid](self, "isValid")) {
    return 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
  [v10 timeIntervalSinceNow];
  BOOL v12 = v11 <= 0.0;

  return v12;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( self,  "updateWithServerRepresentation:expirationDate:",  v4,  v5);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7DFC();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]",  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]",  [v15 UTF8String],  645));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKExpiringCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v18, "updateWithServerRepresentation:", v6);
  if (!v8)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
    if (!v8) {
      id v8 = v17;
    }
  }

  -[GKExpiringCacheObject setTimeStamp:](self, "setTimeStamp:", v17);
  -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", v8);
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKExpiringCacheObject;
  -[GKExpiringCacheObject awakeFromInsert](&v4, "awakeFromInsert");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKExpiringCacheObject setTimeStamp:](self, "setTimeStamp:", v3);
}

+ (void)expireObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7E28();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]",  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]",  [v15 UTF8String],  665));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 objectsMatchingPredicate:v6 context:v8]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v21) expire];
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v19);
  }
}

+ (void)invalidateObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]",  v10));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]",  [v13 UTF8String],  674));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 objectsMatchingPredicate:v6 context:v7]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) setExpirationDate:0];
        id v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v17);
  }
}

@end