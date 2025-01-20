@interface GKPlayerProfileCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)_familiarityLookup;
+ (id)entityName;
+ (id)filterPlayerIDs:(id)a3 familiarity:(int)a4 includeSelf:(BOOL)a5;
+ (id)localPlayerInManagedObjectContext:(id)a3;
+ (id)playerProfileWithPlayerID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playerProfilesWithPlayerIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playerProfilesWithPlayers:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playersByFamiliarity:(id)a3;
+ (id)profileForPlayer:(id)a3 context:(id)a4;
+ (id)selfPlayerID;
+ (id)uniqueAttributeName;
+ (int)familiarityForPlayerID:(id)a3;
+ (unsigned)piecesToLoadForFamiliarity:(int)a3;
+ (void)addFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
+ (void)buildFamiliarilyLookupForProfile:(id)a3;
+ (void)removeFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
+ (void)setFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
- (BOOL)isFindable;
- (BOOL)isLocalPlayer;
- (BOOL)isUnderage;
- (BOOL)isValid;
- (id)internalRepresentation;
- (id)internalRepresentationWithPieces:(unsigned __int8)a3;
- (id)updateImagesWithImageURLs:(id)a3;
- (int)familiarity;
- (void)clearImages;
- (void)deleteCachedAvatars;
- (void)deleteCachedImage:(id)a3;
- (void)expireRecentMatchesWithGame:(id)a3;
- (void)invalidate;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 pieces:(unsigned __int8)a5;
@end

@implementation GKPlayerProfileCacheObject

+ (id)uniqueAttributeName
{
  return @"playerID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKPlayerProfileCacheObjectUniqueObjectIDLookupKey";
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v6, "isValid")
    || (-[GKPlayerProfileCacheObject availablePieces](self, "availablePieces") & 1) == 0)
  {
    return 0;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject alias](self, "alias"));
  BOOL v3 = v4 != 0LL;

  return v3;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
  -[GKExpiringCacheObject invalidate](&v3, "invalidate");
}

- (BOOL)isUnderage
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
  id v2 = -[GKPlayerProfileCacheObject primitiveValueForKey:](&v6, "primitiveValueForKey:", @"underage");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isFindable
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
  id v2 = -[GKPlayerProfileCacheObject primitiveValueForKey:](&v6, "primitiveValueForKey:", @"findable");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)clearImages
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject clearImages]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKPlayerProfileCacheObject clearImages]",  [v8 UTF8String],  735));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  if ((-[GKPlayerProfileCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v10,  "-[GKPlayerProfileCacheObject clearImages]",  [v12 UTF8String],  736));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C1468;
  v15[3] = &unk_1002710F0;
  v15[4] = self;
  [v14 enumerateKeysAndObjectsUsingBlock:v15];

  -[GKPlayerProfileCacheObject deleteCachedAvatars](self, "deleteCachedAvatars");
}

- (void)deleteCachedAvatars
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7E54();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject deleteCachedAvatars]",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKPlayerProfileCacheObject deleteCachedAvatars]",  [v9 UTF8String],  753));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  uint64_t v12 = GKAvatarSubdirectoryNameForPlayerID();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  -[GKPlayerProfileCacheObject deleteCachedImage:](self, "deleteCachedImage:", v13);
}

- (void)deleteCachedImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7EE0();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject deleteCachedImage:]",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKPlayerProfileCacheObject deleteCachedImage:]",  [v12 UTF8String],  764));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  id v15 = [v14 isFileURL];
  if ((_DWORD)v15)
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(v15);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000D7E80();
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v18 = [v17 removeItemAtURL:v14 error:0];

    if (v18)
    {
      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers(v19);
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000D7C50();
      }
    }
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
    -[GKCacheObject deleteCachedImage:](&v21, "deleteCachedImage:", v5);
  }
}

+ (id)localPlayerInManagedObjectContext:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]",  [v10 UTF8String],  782));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  id AssociatedObject = objc_getAssociatedObject(v4, @"GKLocalPlayerObjectIDKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectRegisteredForID:v13]);
  if (!v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 selfPlayerID]);
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"playerID = %@",  v15));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheObject firstObjectMatchingPredicate:context:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "firstObjectMatchingPredicate:context:",  v16,  v4));

      objc_setAssociatedObject(v4, @"GKLocalPlayerObjectIDKey", v13, (void *)1);
    }

    else
    {
      v14 = 0LL;
    }
  }

  return v14;
}

+ (id)playerProfileWithPlayerID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]",  [v13 UTF8String],  797));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  if (v6
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 selfPlayerID]),
        unsigned int v16 = [v6 isEqualToString:v15],
        v15,
        !v16))
  {
    id v21 = v6;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([a1 playerProfilesWithPlayerIDs:v18 inManagedObjectContext:v7]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v19 lastObject]);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([a1 localPlayerInManagedObjectContext:v7]);
  }

  return v17;
}

+ (id)profileForPlayer:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerID]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v8,  v6));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "localPlayerInManagedObjectContext:",  v6));
  }

  return v9;
}

+ (id)playerProfilesWithPlayers:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 _gkFilterWithBlock:&stru_100271118]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 playerProfilesWithPlayerIDs:v7 inManagedObjectContext:v6]);

  return v8;
}

+ (id)playerProfilesWithPlayerIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7F0C();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]",  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]",  [v15 UTF8String],  826));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueObjectIDLookupWithContext:v8]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C1F98;
  v21[3] = &unk_100271140;
  id v22 = v8;
  id v23 = a1;
  id v18 = v8;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueObjectsForKeys:v6 context:v18 newObject:v21]);

  return v19;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
}

- (id)updateImagesWithImageURLs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D7F38();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v9 = &OBJC_CLASS___GKAnonymousPlayerInternal_ptr;
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]",  [v13 UTF8String],  843));

    id v9 = &OBJC_CLASS___GKAnonymousPlayerInternal_ptr;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  if ((-[GKPlayerProfileCacheObject conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v17 = objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]",  v15,  "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]",  [v17 UTF8String],  844));

    [v9[132] raise:@"GameKit Exception", @"%@", v18 format];
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"template"]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject valueForKeyPath:](self, "valueForKeyPath:", @"imageTemplate"));
  id v22 = v21;
  if (v21 != v20 && ([v21 isEqualToString:v20] & 1) == 0)
  {
    -[GKPlayerProfileCacheObject clearImages](self, "clearImages");
    [v19 addObject:@"template"];
    -[GKPlayerProfileCacheObject setValue:forKeyPath:](self, "setValue:forKeyPath:", v20, @"imageTemplate");
  }

  return v19;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 pieces:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v10, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]",  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v12,  "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]",  [v14 UTF8String],  867));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___GKPlayerProfileCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v73,  "updateWithServerRepresentation:expirationDate:",  v7,  v8);
  if (v7)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v7 objectForKey:GKPlayerIDKey]);
    v69 = (void *)v16;
    if (v16)
    {
      -[GKPlayerProfileCacheObject setPlayerID:](self, "setPlayerID:", v16);
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers(0LL);
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000D7FF0();
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAliasKey]);
    -[GKPlayerProfileCacheObject setAlias:](self, "setAlias:", v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKPlayerStatusKey]);
    -[GKPlayerProfileCacheObject setStatus:](self, "setStatus:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"pb-account"]);
    -[GKPlayerProfileCacheObject setPurpleBuddyAccount:](self, "setPurpleBuddyAccount:", [v20 BOOLValue]);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKUnderageKey]);
    id v22 = v21;
    if (v21) {
      -[GKPlayerProfileCacheObject setUnderage:](self, "setUnderage:", [v21 BOOLValue]);
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKFindableKey]);

    if (v23) {
      -[GKPlayerProfileCacheObject setFindable:](self, "setFindable:", [v23 BOOLValue]);
    }
    if (-[GKPlayerProfileCacheObject isLocalPlayer](self, "isLocalPlayer"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject photoPendingExpirationDate](self, "photoPendingExpirationDate"));
      [v24 timeIntervalSinceNow];
      double v26 = v25;

      if (v26 < 0.0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKPhotoPendingKey]);
        -[GKPlayerProfileCacheObject setPhotoPending:](self, "setPhotoPending:", [v27 BOOLValue]);
      }

      if (-[GKPlayerProfileCacheObject photoPending](self, "photoPending"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
        if ([v28 count])
        {
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472LL;
          v72[2] = sub_1000C2BBC;
          v72[3] = &unk_100271168;
          v72[4] = self;
          [v28 enumerateKeysAndObjectsUsingBlock:v72];
        }

        else
        {
          -[GKPlayerProfileCacheObject setPhotoPending:](self, "setPhotoPending:", 0LL);
        }
      }

      +[GKContactsIntegrationUserSettings applySettingsToObject:fromResults:]( &OBJC_CLASS___GKContactsIntegrationUserSettings,  "applySettingsToObject:fromResults:",  self,  v7);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKPrivacySettingsKey]);
    v30 = v29;
    if (v29)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:GKPrivacySettingsFriendsKey]);
      -[GKPlayerProfileCacheObject setFriendsVisibility:]( self,  "setFriendsVisibility:",  sub_1000C2C60((uint64_t)v31, v31));

      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:GKPrivacySettingsAchievementsKey]);
      -[GKPlayerProfileCacheObject setAchievementsVisibility:]( self,  "setAchievementsVisibility:",  sub_1000C2C60((uint64_t)v32, v32));

      v33 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:GKPrivacySettingsGamesPlayedKey]);
      -[GKPlayerProfileCacheObject setGamesPlayedVisibility:]( self,  "setGamesPlayedVisibility:",  sub_1000C2C60((uint64_t)v33, v33));
    }

    else
    {
      -[GKPlayerProfileCacheObject setFriendsVisibility:](self, "setFriendsVisibility:", 2LL);
      -[GKPlayerProfileCacheObject setAchievementsVisibility:](self, "setAchievementsVisibility:", 2LL);
      -[GKPlayerProfileCacheObject setGamesPlayedVisibility:](self, "setGamesPlayedVisibility:", 2LL);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKGlobalFriendListAccessKey]);
    -[GKPlayerProfileCacheObject setGlobalFriendListAccess:]( self,  "setGlobalFriendListAccess:",  sub_1000C2CD0((uint64_t)v34, v34));

    v35 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKIsArcadeSubscriberKey]);
    v36 = v35;
    if (v35) {
      id v37 = [v35 BOOLValue];
    }
    else {
      id v37 = 0LL;
    }
    id v70 = v8;
    -[GKPlayerProfileCacheObject setIsArcadeSubscriber:](self, "setIsArcadeSubscriber:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKPhotoURLsKey]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:GKAvatarTypeKey]);
    if (v40) {
      -[GKPlayerProfileCacheObject setAvatarType:](self, "setAvatarType:", v40);
    }
    v68 = v23;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKFriendBiDirectionalKey]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKFriendPlayedWithKey]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKFriendPlayedNearbyKey]);
    v67 = v42;
    if (v41)
    {
      v66 = v38;
      v44 = v40;
      v45 = v30;
      v46 = v36;
      v47 = v43;
      unint64_t v48 = (unint64_t)[v41 integerValue];
      uint64_t v49 = v48 | (2 * (void)[v42 integerValue]);
      v43 = v47;
      v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  v49 | (4 * (void)[v47 integerValue])));
      -[GKPlayerProfileCacheObject setFriendLevel:](self, "setFriendLevel:", v50);

      v52 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v53 = (id)GKOSLoggers(v51);
        v52 = (void *)os_log_GKGeneral;
      }

      v36 = v46;
      v30 = v45;
      v40 = v44;
      v38 = v66;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG)) {
        sub_1000D7F64(v52, self);
      }
    }

    else
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject firstName](self, "firstName"));

      if (v54) {
        v55 = &off_100287B20;
      }
      else {
        v55 = &off_100287B08;
      }
      -[GKPlayerProfileCacheObject setFriendLevel:](self, "setFriendLevel:", v55);
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfFriendsKey]);
    id v57 = [v56 integerValue];

    v58 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfGamesPlayedKey]);
    -[GKPlayerProfileCacheObject setNumberOfGames:](self, "setNumberOfGames:", [v58 integerValue]);

    v59 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfAchievementsKey]);
    -[GKPlayerProfileCacheObject setNumberOfAchievements:]( self,  "setNumberOfAchievements:",  [v59 integerValue]);

    v60 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfAchievementPointsKey]);
    -[GKPlayerProfileCacheObject setNumberOfAchievementPoints:]( self,  "setNumberOfAchievementPoints:",  [v60 integerValue]);

    if ((a5 & 0x10) != 0)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfFriendsInCommonKey]);
      -[GKPlayerProfileCacheObject setNumberOfFriendsInCommon:]( self,  "setNumberOfFriendsInCommon:",  [v61 integerValue]);

      v62 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:GKNumberOfGamesInCommonKey]);
      -[GKPlayerProfileCacheObject setNumberOfGamesInCommon:]( self,  "setNumberOfGamesInCommon:",  [v62 integerValue]);
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"allow-friend-invites-from-challenges"]);
    -[GKPlayerProfileCacheObject setAllowChallengeFriendInvites:]( self,  "setAllowChallengeFriendInvites:",  [v63 isEqualToString:@"allowed"]);

    v64 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"allow-friend-invites-from-multiplayer-invites"]);
    -[GKPlayerProfileCacheObject setAllowMultiplayerFriendInvites:]( self,  "setAllowMultiplayerFriendInvites:",  [v64 isEqualToString:@"allowed"]);

    if ((a5 & 0x80) != 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"check-friend-invitation-ability"]);
      -[GKPlayerProfileCacheObject setAllowReceivingFriendInvites:]( self,  "setAllowReceivingFriendInvites:",  [v65 BOOLValue]);
    }

    -[GKPlayerProfileCacheObject setAvailablePieces:](self, "setAvailablePieces:");

    id v8 = v70;
  }
}

- (id)internalRepresentationWithPieces:(unsigned __int8)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]",  [v9 UTF8String],  1030));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  unsigned int v11 = -[GKPlayerProfileCacheObject familiarity](self, "familiarity") - 1;
  if (v11 > 3) {
    id v12 = (Class *)&OBJC_CLASS___GKPlayerInternal_ptr;
  }
  else {
    id v12 = (Class *)off_100271700[v11];
  }
  return [objc_alloc(*v12) initWithCacheObject:self];
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerProfileCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKPlayerProfileCacheObject internalRepresentation]",  [v8 UTF8String],  1056));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return -[GKPlayerProfileCacheObject internalRepresentationWithPieces:]( self,  "internalRepresentationWithPieces:",  (unint64_t)-[GKPlayerProfileCacheObject availablePieces](self, "availablePieces") & 0xDF);
}

+ (id)entityName
{
  return @"PlayerProfile";
}

- (void)expireRecentMatchesWithGame:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject managedObjectContext](self, "managedObjectContext"));
  if (v8)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player = %@ AND game = %@",  self,  v8));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKRecentPlayerListCacheObject,  "expireObjectsMatchingPredicate:context:",  v5,  v4);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player = %@ && game == nil",  self));
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKRecentPlayerListCacheObject,  "expireObjectsMatchingPredicate:context:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player = %@ OR otherPlayer = %@",  self,  self));
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKRecentGameListCacheObject,  "expireObjectsMatchingPredicate:context:",  v7,  v4);
}

+ (id)_familiarityLookup
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v5,  "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]",  [v7 UTF8String],  1091));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }

  dispatch_queue_t v9 = dispatch_get_current_queue();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  specific = dispatch_queue_get_specific(v10, @"com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup");
  id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(specific);
  if (!v12)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dispatch_queue_set_specific( v10,  @"com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup",  v12,  (dispatch_function_t)_GKLookupRelease);
  }

  return v12;
}

+ (void)buildFamiliarilyLookupForProfile:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerID]);

  if (v5)
  {
    v19[0] = &off_100287B38;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 playerID]);
    id v18 = a1;
    v20[0] = v17;
    v19[1] = &off_100287B50;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 friendList]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 playerIDs]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    v20[1] = v7;
    v19[2] = &off_100287B68;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 friendRequestList]);
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerIDs]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    v20[2] = v10;
    v19[3] = &off_100287B80;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 friendRecommendationList]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerIDs]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));
    v20[3] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v18 _familiarityLookup]);
    [v15 addEntriesFromDictionary:v14];
  }
}

+ (id)selfPlayerID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:&off_100287B38]);

  return v3;
}

+ (int)familiarityForPlayerID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_100287B38]);
  if ([v6 isEqualToString:v4])
  {

    int v7 = 1;
    goto LABEL_12;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_100287B50]);
  if ([v8 containsObject:v4])
  {
    int v7 = 2;
    unsigned int v9 = 1;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_100287B68]);
    if ([v10 containsObject:v4])
    {
      int v7 = 3;
      unsigned int v9 = 1;
    }

    else
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_100287B80]);
      unsigned int v9 = [v11 containsObject:v4];

      int v7 = 4;
    }
  }

  if (!v9) {
LABEL_11:
  }
    int v7 = 0;
LABEL_12:

  return v7;
}

- (int)familiarity
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  int v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "familiarityForPlayerID:",  v2);

  return v3;
}

+ (void)addFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v14 = a3;
  if ((_DWORD)v4 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Assertion failed"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]",  v6,  "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) addFamiliarPlayerIDs:familiarity:]",  [v8 UTF8String],  1163));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
  id v13 = [v12 mutableCopy];
  [v13 addObjectsFromArray:v14];
  [v10 setObject:v13 forKeyedSubscript:v11];
}

+ (void)removeFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v14 = a3;
  if ((_DWORD)v4 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Assertion failed"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]",  v6,  "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) removeFamiliarPlayerIDs:familiarity:]",  [v8 UTF8String],  1176));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C3924;
  v15[3] = &unk_100270060;
  id v16 = [v12 mutableCopy];
  id v13 = v16;
  [v14 enumerateObjectsUsingBlock:v15];
  [v10 setObject:v13 forKeyedSubscript:v11];
}

+ (void)setFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  if ((_DWORD)v4 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Assertion failed"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]",  v6,  "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) setFamiliarPlayerIDs:familiarity:]",  [v8 UTF8String],  1197));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
  [v10 setObject:v12 forKeyedSubscript:v11];
}

- (BOOL)isLocalPlayer
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  BOOL v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "familiarityForPlayerID:",  v2) == 1;

  return v3;
}

+ (id)playersByFamiliarity:(id)a3
{
  id v4 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue([a1 _familiarityLookup]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:&off_100287B38]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:&off_100287B50]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:&off_100287B68]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:&off_100287B80]);
  id v8 = [v4 count];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000C3EFC;
  v28[3] = &unk_100271190;
  id v29 = v22;
  id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 1LL));
  id v31 = v5;
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v8));
  id v33 = v6;
  id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v8));
  id v35 = v7;
  id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v8));
  id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v8));
  id v9 = v37;
  id v21 = v36;
  id v26 = v7;
  id v10 = v34;
  id v25 = v6;
  id v11 = v32;
  id v24 = v5;
  id v12 = v30;
  id v23 = v22;
  [v4 enumerateObjectsUsingBlock:v28];

  v38[0] = &off_100287B38;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
  v39[0] = v13;
  v38[1] = &off_100287B50;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  v39[1] = v14;
  v38[2] = &off_100287B68;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  v39[2] = v15;
  v38[3] = &off_100287B80;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);
  v39[3] = v16;
  v38[4] = &off_100287B98;
  id v17 = v9;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
  v39[4] = v18;
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  5LL));

  return v20;
}

+ (unsigned)piecesToLoadForFamiliarity:(int)a3
{
  unint64_t v3 = 0x8183032B01uLL >> (8 * a3);
  return v3;
}

+ (id)filterPlayerIDs:(id)a3 familiarity:(int)a4 includeSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 playersByFamiliarity:v8]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  if (v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_100287B38]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 setByAddingObjectsFromArray:v13]);

    id v12 = (void *)v14;
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C410C;
  v18[3] = &unk_10026EFA8;
  id v19 = v12;
  id v15 = v12;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 _gkFilterWithBlock:v18]);

  return v16;
}

@end