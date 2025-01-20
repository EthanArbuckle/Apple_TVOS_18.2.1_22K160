@interface GKCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)allObjectsInContext:(id)a3;
+ (id)attributesDescriptionsForAttributesWithKeys:(id)a3;
+ (id)entityInManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)fetchRequestForContext:(id)a3;
+ (id)fetchSortDescriptors;
+ (id)firstObjectMatchingPredicate:(id)a3 context:(id)a4;
+ (id)objectsMatchingPredicate:(id)a3 context:(id)a4;
+ (id)relationshipKeyPathsForPrefetch;
+ (id)uniqueAttributeName;
+ (id)uniqueObjectIDLookupWithContext:(id)a3;
+ (unint64_t)countObjectsMatchingPredicate:(id)a3 context:(id)a4;
+ (void)deleteObjectsMatchingPredicate:(id)a3 context:(id)a4;
- (BOOL)hasImages;
- (BOOL)isValid;
- (GKCacheObject)initWithManagedObjectContext:(id)a3;
- (id)imageCacheKeyPathsByKey;
- (id)imageURLDictionary;
- (id)internalRepresentation;
- (id)updateImagesWithImageURLs:(id)a3;
- (void)clearImages;
- (void)deleteCachedImage:(id)a3;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject updateWithServerRepresentation:]",  v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v5,  "-[GKCacheObject updateWithServerRepresentation:]",  [v7 UTF8String],  279));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }
}

- (id)internalRepresentation
{
  return 0LL;
}

+ (id)entityName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses must provide a valid entityName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v2,  "+[GKCacheObject entityName]",  [v4 UTF8String],  291));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v5);
  return 0LL;
}

+ (id)entityInManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  BOOL v7 = os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    sub_1000D7A98();
    if (v5) {
      goto LABEL_5;
    }
  }

  else if (v5)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 entityName]);
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses must provide a valid entityName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
      id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (entityName != nil)\n[%s (%s:%d)]",  v9,  "+[GKCacheObject entityInManagedObjectContext:]",  [v11 UTF8String],  304));

      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v8,  v5));

    goto LABEL_14;
  }

  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7A6C();
  }
  v13 = 0LL;
LABEL_14:

  return v13;
}

- (GKCacheObject)initWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7AC4();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject initWithManagedObjectContext:]",  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKCacheObject initWithManagedObjectContext:]",  [v12 UTF8String],  313));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  id v15 = objc_msgSend((id)objc_opt_class(self, v14), "entityInManagedObjectContext:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___GKCacheObject;
    self =  -[GKCacheObject initWithEntity:insertIntoManagedObjectContext:]( &v19,  "initWithEntity:insertIntoManagedObjectContext:",  v16,  v5);
    v17 = self;
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

+ (id)fetchRequestForContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7AF0();
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([a1 entityName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v7));

  [v8 setIncludesSubentities:1];
  [v8 setIncludesPropertyValues:1];
  [v8 setIncludesPendingChanges:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchSortDescriptors]);
  [v8 setSortDescriptors:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 relationshipKeyPathsForPrefetch]);
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  [v8 setReturnsObjectsAsFaults:0];
  return v8;
}

+ (id)relationshipKeyPathsForPrefetch
{
  return 0LL;
}

+ (id)fetchSortDescriptors
{
  return 0LL;
}

+ (id)allObjectsInContext:(id)a3
{
  return [a1 objectsMatchingPredicate:0 context:a3];
}

+ (id)objectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKCacheObject objectsMatchingPredicate:context:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKCacheObject objectsMatchingPredicate:context:]",  [v13 UTF8String],  357));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForContext:v7]);
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }
  [v15 setPredicate:v6];
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _gkObjectsFromFetchRequest:v15 withContext:v7]);

  return v16;
}

+ (unint64_t)countObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKCacheObject countObjectsMatchingPredicate:context:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKCacheObject countObjectsMatchingPredicate:context:]",  [v13 UTF8String],  370));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForContext:v7]);
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }
  [v15 setPredicate:v6];
  id v16 = [v7 _gkCountObjectsFromRequest:v15];

  return (unint64_t)v16;
}

+ (id)firstObjectMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKCacheObject firstObjectMatchingPredicate:context:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKCacheObject firstObjectMatchingPredicate:context:]",  [v13 UTF8String],  383));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForContext:v7]);
  [v15 setFetchLimit:1];
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }
  [v15 setPredicate:v6];
  id v21 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v15 error:&v21]);
  id v17 = v21;
  if ([v16 count])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);
  }

  else
  {
    v18 = 0LL;
    if (!v16 && v17)
    {
      if (!os_log_GKGeneral) {
        id v19 = (id)GKOSLoggers(0LL);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000D7920();
      }
      v18 = 0LL;
    }
  }

  return v18;
}

+ (void)deleteObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKCacheObject deleteObjectsMatchingPredicate:context:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKCacheObject deleteObjectsMatchingPredicate:context:]",  [v13 UTF8String],  405));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue([a1 objectsMatchingPredicate:v6 context:v7]);
  id v16 = (void *)v15;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v15);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7B1C();
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [v7 deleteObject:*(void *)(*((void *)&v23 + 1) + 8 * (void)v22)];
        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v20);
  }
}

- (BOOL)isValid
{
  return 1;
}

+ (id)uniqueAttributeName
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override uniqueAttributeName",  objc_opt_class(a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v3,  "+[GKCacheObject uniqueAttributeName]",  [v5 UTF8String],  426));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v6);
  return 0LL;
}

+ (const)uniqueObjectIDLookupKey
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override uniqueObjectIDLookupKey",  objc_opt_class(a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v3,  "+[GKCacheObject uniqueObjectIDLookupKey]",  [v5 UTF8String],  433));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v6);
  return 0LL;
}

+ (id)uniqueObjectIDLookupWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7B7C();
  }
  id v7 = [a1 uniqueObjectIDLookupKey];
  id AssociatedObject = objc_getAssociatedObject(v5, v7);
  v9 = (GKUniqueObjectIDLookup *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v9)
  {
    v9 = -[GKUniqueObjectIDLookup initWithObjectClass:context:]( objc_alloc(&OBJC_CLASS___GKUniqueObjectIDLookup),  "initWithObjectClass:context:",  a1,  v5);
    objc_setAssociatedObject(v5, v7, v9, (void *)1);
  }

  return v9;
}

+ (id)attributesDescriptionsForAttributesWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 entityName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy managedObjectModel](&OBJC_CLASS___GKClientProxy, "managedObjectModel"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 entitiesByName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BF454;
  v12[3] = &unk_10026D958;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v8 attributesByName]);
  id v9 = v13;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkMapWithBlock:v12]);

  return v10;
}

- (id)imageCacheKeyPathsByKey
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v5,  "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]",  [v7 UTF8String],  468));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }

  if (qword_1002BB5B0 != -1) {
    dispatch_once(&qword_1002BB5B0, &stru_100271078);
  }
  return (id)qword_1002BB5A8;
}

- (id)updateImagesWithImageURLs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7BA8();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v9 = &OBJC_CLASS___GKAnonymousPlayerInternal_ptr;
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]",  [v13 UTF8String],  485));

    id v9 = &OBJC_CLASS___GKAnonymousPlayerInternal_ptr;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  if ((-[GKCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v17 = objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v15,  "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]",  [v17 UTF8String],  486));

    [v9[132] raise:@"GameKit Exception", @"%@", v18 format];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000BF8A8;
  v26[3] = &unk_1002710A0;
  id v27 = v5;
  v28 = self;
  id v21 = v19;
  id v29 = v21;
  id v22 = v5;
  [v20 enumerateKeysAndObjectsUsingBlock:v26];

  __int128 v23 = v29;
  id v24 = v21;

  return v24;
}

- (id)imageURLDictionary
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]",  [v8 UTF8String],  504));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if ((-[GKCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v10,  "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]",  [v12 UTF8String],  505));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_1000BFBF4;
  id v22 = sub_1000BFC04;
  id v23 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000BFC0C;
  v17[3] = &unk_1002710C8;
  v17[4] = self;
  v17[5] = &v18;
  [v14 enumerateKeysAndObjectsUsingBlock:v17];

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (void)deleteCachedImage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
  {
    sub_1000D7D10();
    if (!v4) {
      goto LABEL_21;
    }
LABEL_5:
    uint64_t v6 = GKImageCacheRoot(v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)v7;
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v7);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    {
      sub_1000D7CB0();
      if (!v8) {
        goto LABEL_20;
      }
    }

    else if (!v8)
    {
      goto LABEL_20;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v11 = [v10 fileExistsAtPath:v8];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v18 = 0LL;
      unsigned int v13 = [v12 removeItemAtPath:v8 error:&v18];
      id v14 = v18;

      if (!v13) {
        goto LABEL_14;
      }
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v15);
      }
      BOOL v15 = os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        sub_1000D7C50();
        if (v14) {
          goto LABEL_15;
        }
      }

      else
      {
LABEL_14:
        if (v14)
        {
LABEL_15:
          if (!os_log_GKGeneral) {
            id v17 = (id)GKOSLoggers(v15);
          }
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
            sub_1000D7BD4();
          }
        }
      }
    }

- (void)clearImages
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]",  v5));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]",  [v8 UTF8String],  547));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if ((-[GKCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v10,  "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]",  [v12 UTF8String],  548));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C00A0;
  v15[3] = &unk_1002710F0;
  v15[4] = self;
  [v14 enumerateKeysAndObjectsUsingBlock:v15];
}

- (BOOL)hasImages
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]",  v5));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]",  [v8 UTF8String],  559));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if ((-[GKCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v10,  "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]",  [v12 UTF8String],  560));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000C0380;
  v17[3] = &unk_1002710C8;
  v17[4] = self;
  v17[5] = &v18;
  [v14 enumerateKeysAndObjectsUsingBlock:v17];

  char v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v15;
}

@end