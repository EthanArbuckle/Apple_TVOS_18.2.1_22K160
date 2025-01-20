@interface MCAudioPlaylist
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCAudioPlaylist)init;
- (MCAudioPlaylist)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCContainer)container;
- (NSArray)orderedSongs;
- (NSSet)songs;
- (double)duckInDuration;
- (double)duckOutDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (float)duckLevel;
- (float)volume;
- (id)addSongForAsset:(id)a3;
- (id)addSongsForAssets:(id)a3;
- (id)imprint;
- (id)insertSongForAsset:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSongsForAssets:(id)a3 atIndex:(unint64_t)a4;
- (id)songAtIndex:(unint64_t)a3;
- (unint64_t)countOfSongs;
- (void)demolish;
- (void)moveSongsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllSongs;
- (void)removeSongsAtIndices:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(float)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setVolume:(float)a3;
@end

@implementation MCAudioPlaylist

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"builtVolume"]) {
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"volume",  @"fadeInDuration",  @"fadeOutDuration",  @"duckLevel",  @"duckInDuration",  @"duckOutDuration",  0LL);
  }
  if ([a3 isEqualToString:@"builtAudio"])
  {
    v6 = @"builtVolume";
    uint64_t v7 = 0LL;
  }

  else
  {
    if (![a3 isEqualToString:@"audioNoVolume"])
    {
      v12.receiver = a1;
      v12.super_class = (Class)&OBJC_METACLASS___MCAudioPlaylist;
      return objc_msgSendSuper2(&v12, "keyPathsForValuesAffectingValueForKey:", a3);
    }

    v6 = 0LL;
  }

  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"orderedSongs",  v6,  v7,  v8,  v9,  v10,  v11);
}

- (MCAudioPlaylist)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCAudioPlaylist;
  v2 = -[MCAudioPlaylist init](&v4, "init");
  if (v2)
  {
    v2->mSongs = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v2->mVolume = 1.0;
    v2->mDuckLevel = 1.0;
  }

  return v2;
}

- (MCAudioPlaylist)initWithImprint:(id)a3 andMontage:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCAudioPlaylist;
  v6 = -[MCObject initWithImprint:andMontage:](&v26, "initWithImprint:andMontage:");
  if (v6)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = [a3 objectForKey:@"songs"];
    id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i),  a4);
          -[NSMutableSet addObject:](v6->mSongs, "addObject:", v11);
          -[MCObject setAudioPlaylistIfAudioPlaylistSong:](v11, "setAudioPlaylistIfAudioPlaylistSong:", v6);
          if (!-[MCObject isSnapshot](v6, "isSnapshot"))
          {
            -[MCObject addObserver:forKeyPath:options:context:]( v11,  "addObserver:forKeyPath:options:context:",  v6,  @"builtVolume",  0LL,  0LL);
            -[MCObject addObserver:forKeyPath:options:context:]( v11,  "addObserver:forKeyPath:options:context:",  v6,  @"builtAudio",  0LL,  0LL);
          }

          id v12 = [a3 objectForKey:@"volume"];
          float v13 = 1.0;
          LODWORD(v14) = 1.0;
          if (v12) {
            objc_msgSend(objc_msgSend(a3, "objectForKey:", @"volume", v14), "floatValue");
          }
          v6->mVolume = *(float *)&v14;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"fadeInDuration"), "doubleValue");
          v6->mFadeInDuration = v15;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"fadeOutDuration"), "doubleValue");
          v6->mFadeOutDuration = v16;
          if ([a3 objectForKey:@"duckLevel"])
          {
            objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckLevel"), "floatValue");
            float v13 = v17;
          }

          v6->mDuckLevel = v13;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckInDuration"), "doubleValue");
          v6->mDuckInDuration = v18;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckOutDuration"), "doubleValue");
          v6->mDuckOutDuration = v19;
        }

        id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v8);
    }
  }

  return v6;
}

- (void)demolish
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_super v4 = self->mSongs;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (!-[MCObject isSnapshot](self, "isSnapshot"))
        {
          [v8 removeObserver:self forKeyPath:@"builtVolume"];
          [v8 removeObserver:self forKeyPath:@"builtAudio"];
        }

        [v8 demolish];
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  self->mSongs = 0LL;
  self->mCachedOrderedSongs = 0LL;
  objc_sync_exit(mSongs);
  self->mContainer = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCAudioPlaylist;
  -[MCObject demolish](&v9, "demolish");
}

- (id)imprint
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCAudioPlaylist;
  id v3 = -[MCObject imprint](&v18, "imprint");
  objc_super v4 = objc_autoreleasePoolPush();
  id v5 = -[MCAudioPlaylist songs](self, "songs");
  if (-[NSSet count](v5, "count"))
  {
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "imprint"));
        }

        id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v6 forKey:@"songs"];
  }

  float mVolume = self->mVolume;
  if (mVolume != 1.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", mVolume),  @"volume");
  }
  if (self->mFadeInDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"fadeInDuration");
  }
  if (self->mFadeOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"fadeOutDuration");
  }
  float mDuckLevel = self->mDuckLevel;
  if (mDuckLevel != 1.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", mDuckLevel),  @"duckLevel");
  }
  if (self->mDuckInDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"duckInDuration");
  }
  if (self->mDuckOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"duckOutDuration");
  }
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCSong, a2);
  if ((objc_opt_isKindOfClass(a4, v9) & 1) != 0)
  {
    -[MCAudioPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", a3);
    -[MCAudioPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", a3);
  }

- (NSSet)songs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  if (-[NSMutableSet count](self->mSongs, "count")) {
    objc_super v4 = -[NSSet initWithSet:](objc_alloc(&OBJC_CLASS___NSSet), "initWithSet:", self->mSongs);
  }
  else {
    objc_super v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mSongs);
  return v4;
}

- (unint64_t)countOfSongs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  id v4 = -[NSMutableSet count](self->mSongs, "count");
  objc_sync_exit(mSongs);
  return (unint64_t)v4;
}

- (id)songAtIndex:(unint64_t)a3
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  mCachedOrderedSongs = self->mCachedOrderedSongs;
  if (mCachedOrderedSongs)
  {
    id v7 = -[NSArray objectAtIndex:](mCachedOrderedSongs, "objectAtIndex:", a3);
LABEL_13:
    __int128 v13 = v7;
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = self->mSongs;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          __int128 v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ([v12 index] == (id)a3)
          {
            id v7 = v12;
            goto LABEL_13;
          }
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        __int128 v13 = 0LL;
        if (v9) {
          continue;
        }
        break;
      }
    }

    else
    {
      __int128 v13 = 0LL;
    }
  }

  objc_sync_exit(mSongs);
  return v13;
}

- (id)addSongForAsset:(id)a3
{
  return objc_msgSend( -[MCAudioPlaylist insertSongsForAssets:atIndex:]( self,  "insertSongsForAssets:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  -[MCAudioPlaylist countOfSongs](self, "countOfSongs")),  "objectAtIndex:",  0);
}

- (id)addSongsForAssets:(id)a3
{
  return -[MCAudioPlaylist insertSongsForAssets:atIndex:]( self,  "insertSongsForAssets:atIndex:",  a3,  -[MCAudioPlaylist countOfSongs](self, "countOfSongs"));
}

- (id)insertSongForAsset:(id)a3 atIndex:(unint64_t)a4
{
  return objc_msgSend( -[MCAudioPlaylist insertSongsForAssets:atIndex:]( self,  "insertSongsForAssets:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  a4),  "objectAtIndex:",  0);
}

- (id)insertSongsForAssets:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = a3;
  id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v12 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSong),  "initFromScratchWithMontage:",  self->super.mMontage);
        [v12 setAsset:v11];
        objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(v7, "count") + a4);
        [v7 addObject:v12];
        [v12 setAudioPlaylistIfAudioPlaylistSong:self];
        [v12 addObserver:self forKeyPath:@"builtVolume" options:0 context:0];
        [v12 addObserver:self forKeyPath:@"builtAudio" options:0 context:0];
      }

      id v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v8);
  }

  if ([v7 count])
  {
    __int128 v13 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v7);
    -[MCAudioPlaylist willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"songs",  1LL,  v13);
    mSongs = self->mSongs;
    objc_sync_enter(mSongs);

    self->mCachedOrderedSongs = 0LL;
    __int128 v14 = (char *)[obj count];
    obja = v13;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v15 = self->mSongs;
    id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          double v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
        }

        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
      }

      while (v16);
    }

    -[NSMutableSet addObjectsFromArray:](self->mSongs, "addObjectsFromArray:", v7, mSongs);
    objc_sync_exit(v22);
    -[MCAudioPlaylist didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"songs",  1LL,  obja);
  }

  return v7;
}

- (void)removeSongsAtIndices:(id)a3
{
  id obj = self->mSongs;
  objc_sync_enter(obj);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  mSongs = self->mSongs;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mSongs,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(mSongs);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v10, "index")))
        {
          -[NSMutableSet addObject:](v5, "addObject:", v10);
          [v10 removeObserver:self forKeyPath:@"builtVolume"];
          [v10 removeObserver:self forKeyPath:@"builtAudio"];
        }

        else
        {
          objc_msgSend( v10,  "setIndex:",  (_BYTE *)objc_msgSend(v10, "index")
          - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v10, "index")));
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mSongs,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  -[MCAudioPlaylist willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"songs",  2LL,  v5);

  self->mCachedOrderedSongs = 0LL;
  -[NSMutableSet minusSet:](self->mSongs, "minusSet:", v5);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)j);
        [v14 setAudioPlaylistIfAudioPlaylistSong:0];
        [v14 demolish];
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v11);
  }

  objc_sync_exit(obj);
  -[MCAudioPlaylist didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"songs",  2LL,  v5);
}

- (void)removeAllSongs
{
}

- (void)moveSongsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);

  self->mCachedOrderedSongs = 0LL;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = self->mSongs;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend( v12,  "setIndex:",  (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }

        else
        {
          __int128 v13 = [v12 index];
          unint64_t v14 = v13 - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  objc_sync_exit(mSongs);
  -[MCAudioPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", @"orderedSongs");
}

- (NSArray)orderedSongs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  mCachedOrderedSongs = self->mCachedOrderedSongs;
  if (!mCachedOrderedSongs)
  {
    id v5 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
    self->mCachedOrderedSongs = (NSArray *) objc_msgSend( -[NSMutableSet allObjects](self->mSongs, "allObjects"),  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObject:]( NSArray,  "arrayWithObject:",  v5));

    mCachedOrderedSongs = self->mCachedOrderedSongs;
  }

  id v6 = mCachedOrderedSongs;
  objc_sync_exit(mSongs);
  return v6;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->float mVolume = a3;
}

- (double)fadeInDuration
{
  return self->mFadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->mFadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->mFadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->mFadeOutDuration = a3;
}

- (float)duckLevel
{
  return self->mDuckLevel;
}

- (void)setDuckLevel:(float)a3
{
  self->float mDuckLevel = a3;
}

- (double)duckInDuration
{
  return self->mDuckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->mDuckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->mDuckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->mDuckOutDuration = a3;
}

- (MCContainer)container
{
  return self->mContainer;
}

- (void)setContainer:(id)a3
{
  self->mContainer = (MCContainer *)a3;
}

@end