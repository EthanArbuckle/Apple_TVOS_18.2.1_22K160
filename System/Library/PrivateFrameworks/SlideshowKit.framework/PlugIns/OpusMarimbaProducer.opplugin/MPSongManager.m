@interface MPSongManager
+ (id)sharedManager;
+ (void)releaseSharedManager;
- (BOOL)hasBeatsForSongAtPath:(id)a3;
- (MPSongManager)init;
- (MPSongManager)initWithPaths:(id)a3;
- (id)beatsForSongAtPath:(id)a3 progressCallback:(void *)a4 context:(void *)a5;
- (id)cachedBeatsForSongAtPath:(id)a3;
- (id)songMetadataForPath:(id)a3;
- (void)dealloc;
- (void)storeBeats:(id)a3 forPath:(id)a4;
@end

@implementation MPSongManager

+ (id)sharedManager
{
  id result = (id)qword_2B04B0;
  if (!qword_2B04B0)
  {
    objc_sync_enter(a1);
    if (!qword_2B04B0) {
      qword_2B04B0 = -[MPSongManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPSongManager), "initWithPaths:", 0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B04B0;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B04B0)
  {
    objc_sync_enter(a1);

    qword_2B04B0 = 0LL;
    objc_sync_exit(a1);
  }

- (MPSongManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MPSongManager;
  v2 = -[MPSongManager init](&v17, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v2->mSongLock = v3;
    -[NSRecursiveLock setName:](v3, "setName:", @"MPSongManager.songLock");
    v2->mSongCacheFilePath = 0LL;
    v2->mDaFunc = 0LL;
    v2->mSongDescriptions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    mSongDescriptions = v2->mSongDescriptions;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mSongDescriptions,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(mSongDescriptions);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
          if (!objc_msgSend(-[NSMutableDictionary objectForKey:](v2->mSongDescriptions, "objectForKey:", v10), "count")) {
            -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  -[NSBundle pathForResource:ofType:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v2, v11)),  "pathForResource:ofType:",  v10,  @"plist")),  v10);
          }
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mSongDescriptions,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v7);
    }

    if (-[NSMutableDictionary count](v4, "count")) {
      -[NSMutableDictionary addEntriesFromDictionary:](v2->mSongDescriptions, "addEntriesFromDictionary:", v4);
    }

    v2->mSongBeats = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  self->mSongLock = 0LL;
  self->mSongDescriptions = 0LL;

  self->mSongBeats = 0LL;
  self->mSongCacheFilePath = 0LL;

  self->mSongMetaData = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPSongManager;
  -[MPSongManager dealloc](&v3, "dealloc");
}

- (id)beatsForSongAtPath:(id)a3 progressCallback:(void *)a4 context:(void *)a5
{
  if (a3) {
    return -[NSMutableDictionary objectForKey:](self->mSongBeats, "objectForKey:", a3, a4, a5);
  }
  else {
    return 0LL;
  }
}

- (BOOL)hasBeatsForSongAtPath:(id)a3
{
  return objc_msgSend( +[MPSongManager sharedManager](MPSongManager, "sharedManager"),  "cachedBeatsForSongAtPath:",  a3) != 0;
}

- (id)songMetadataForPath:(id)a3
{
  return -[NSMutableDictionary objectForKey:]( self->mSongMetaData,  "objectForKey:",  [a3 lastPathComponent]);
}

- (void)storeBeats:(id)a3 forPath:(id)a4
{
}

- (MPSongManager)initWithPaths:(id)a3
{
  v4 = -[MPSongManager init](self, "init");
  if (v4)
  {
    v4->mSongMetaData = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v7 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v5,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPEffectManager, v6)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) stringByAppendingPathComponent:@"Audio/SongDescriptions.plist"]);
          if (v12)
          {
            id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  2LL,  0LL,  0LL);
            if (v13) {
              -[NSMutableDictionary addEntriesFromDictionary:](v4->mSongMetaData, "addEntriesFromDictionary:", v13);
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }

  return v4;
}

- (id)cachedBeatsForSongAtPath:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mSongBeats, "objectForKey:", a3);
}

@end