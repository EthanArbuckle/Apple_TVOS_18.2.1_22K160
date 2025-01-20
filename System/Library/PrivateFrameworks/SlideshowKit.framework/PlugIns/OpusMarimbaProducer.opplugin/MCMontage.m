@interface MCMontage
- (MCMontage)init;
- (MCMontage)initWithData:(id)a3 error:(id *)a4;
- (MCPlug)rootPlug;
- (NSArray)layouts;
- (NSString)basePath;
- (double)audioFadeOutDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (id)assetForObjectID:(id)a3;
- (id)assets;
- (id)audioAssetForFileAtPath:(id)a3;
- (id)audioAssetForObjectID:(id)a3;
- (id)audioAssets;
- (id)containerForObjectID:(id)a3;
- (id)createEffectContainer;
- (id)createNavigatorContainer;
- (id)createParallelizerContainer;
- (id)createSerializerContainer;
- (id)data;
- (id)imprint;
- (id)initFromScratch;
- (id)videoAssetForFileAtPath:(id)a3;
- (id)videoAssetForObjectID:(id)a3;
- (id)videoAssets;
- (unint64_t)uuidSeed;
- (unsigned)styleHint;
- (void)dealloc;
- (void)demolish;
- (void)forgetAboutContainer:(id)a3;
- (void)lock;
- (void)registerContainer:(id)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setBasePath:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setLayouts:(id)a3;
- (void)setStyleHint:(unsigned __int8)a3;
- (void)unlock;
@end

@implementation MCMontage

- (MCMontage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMontage;
  v2 = -[MCMontage init](&v5, "init");
  if (v2)
  {
    v2->mVideoAssetsForFilePaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mVideoAssetsForObjectIDs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mAudioAssetsForFilePaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mAudioAssetsForObjectIDs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mContainersForObjectIDs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v2->mLock = v3;
    -[NSRecursiveLock setName:](v3, "setName:", @"MCMontage.lock");
  }

  return v2;
}

- (id)initFromScratch
{
  v2 = -[MCMontage init](self, "init");
  if (v2)
  {
    v2->mRootPlug = (MCPlug *)-[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlug),  "initFromScratchWithMontage:",  v2);
    -[MCPlug setContainer:]( v2->mRootPlug,  "setContainer:",  -[MCMontage createParallelizerContainer](v2, "createParallelizerContainer"));
  }

  return v2;
}

- (MCMontage)initWithData:(id)a3 error:(id *)a4
{
  v6 = -[MCMontage init](self, "init");
  if (v6)
  {
    v7 = v6;
    v8 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  a4);
    v7->mImprintWhileLoading = v8;
    if (v8)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id obj = -[NSDictionary objectForKey:](v8, "objectForKey:", @"videoAssets");
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)i),  v7);
            v14 = -[NSBundle pathForResource:ofType:]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "pathForResource:ofType:",  @"Assets",  0LL);
            if (dword_2AC880 <= 34) {
              uint64_t v15 = (dword_2AC880 + 1);
            }
            else {
              uint64_t v15 = 1LL;
            }
            dword_2AC880 = v15;
            else {
              v16 = @"LARGE_PIC_0%d.jpg";
            }
            -[MCObject setPath:]( v13,  "setPath:",  -[NSString stringByAppendingPathComponent:]( v14,  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v15)));
            -[NSMutableDictionary setObject:forKey:]( v7->mVideoAssetsForFilePaths,  "setObject:forKey:",  v13,  -[MCObject path](v13, "path"));
            -[NSMutableDictionary setObject:forKey:]( v7->mVideoAssetsForObjectIDs,  "setObject:forKey:",  v13,  -[MCObject objectID](v13, "objectID"));
          }

          id v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }

        while (v10);
      }

      id v17 = -[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"audioAssets");
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v29;
        do
        {
          for (j = 0LL; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)j),  v7);
            -[NSMutableDictionary setObject:forKey:]( v7->mAudioAssetsForFilePaths,  "setObject:forKey:",  v22,  -[MCObject path](v22, "path"));
            -[NSMutableDictionary setObject:forKey:]( v7->mAudioAssetsForObjectIDs,  "setObject:forKey:",  v22,  -[MCObject objectID](v22, "objectID"));
          }

          id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }

        while (v19);
      }

      v7->mRootPlug = (MCPlug *) +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  -[NSDictionary objectForKey:]( v7->mImprintWhileLoading,  "objectForKey:",  @"rootPlug"),  v7);
      objc_msgSend( -[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"fadeInDuration"),  "doubleValue");
      v7->mFadeInDuration = v23;
      objc_msgSend( -[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"fadeOutDuration"),  "doubleValue");
      v7->mFadeOutDuration = v24;
      objc_msgSend( -[NSDictionary objectForKey:](v7->mImprintWhileLoading, "objectForKey:", @"audioFadeOutDuration"),  "doubleValue");
      v7->mAudioFadeOutDuration = v25;
      v7->mUUIDSeed = (unint64_t)objc_msgSend( -[NSDictionary objectForKey:]( v7->mImprintWhileLoading,  "objectForKey:",  @"uuidSeed"),  "unsignedIntegerValue");
      v7->_styleHint = objc_msgSend( -[NSDictionary objectForKey:]( v7->mImprintWhileLoading,  "objectForKey:",  @"styleHint"),  "intValue");
      v7->mImprintWhileLoading = 0LL;
    }

    if (!v7->mRootPlug) {
  }
    }

  return 0LL;
}

- (void)dealloc
{
  if (self->mRootPlug) {
    -[MCMontage demolish](self, "demolish");
  }

  self->mLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMontage;
  -[MCMontage dealloc](&v3, "dealloc");
}

- (void)demolish
{
  objc_super v3 = objc_autoreleasePoolPush();
  -[MCPlug demolish](self->mRootPlug, "demolish");
  -[MCMontage willChangeValueForKey:](self, "willChangeValueForKey:", @"rootPlug");

  self->mRootPlug = 0LL;
  -[MCMontage didChangeValueForKey:](self, "didChangeValueForKey:", @"rootPlug");

  self->mRootPlug = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  mVideoAssetsForObjectIDs = self->mVideoAssetsForObjectIDs;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForObjectIDs,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(mVideoAssetsForObjectIDs);
        }
        objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mVideoAssetsForObjectIDs,  "objectForKey:",  *(void *)(*((void *)&v25 + 1) + 8 * (void)i)),  "demolish");
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForObjectIDs,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
    }

    while (v5);
  }

  self->mVideoAssetsForFilePaths = 0LL;
  self->mVideoAssetsForObjectIDs = 0LL;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  mAudioAssetsForObjectIDs = self->mAudioAssetsForObjectIDs;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForObjectIDs,  "countByEnumeratingWithState:objects:count:",  &v21,  v30,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (j = 0LL; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(mAudioAssetsForObjectIDs);
        }
        objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mAudioAssetsForObjectIDs,  "objectForKey:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)j)),  "demolish");
      }

      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForObjectIDs,  "countByEnumeratingWithState:objects:count:",  &v21,  v30,  16LL);
    }

    while (v9);
  }

  self->mAudioAssetsForFilePaths = 0LL;
  self->mAudioAssetsForObjectIDs = 0LL;
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v13 = -[NSMutableDictionary allKeys](self->mContainersForObjectIDs, "allKeys", 0LL);
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      for (k = 0LL; k != v14; k = (char *)k + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mContainersForObjectIDs,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)k)),  "demolish");
      }

      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }

    while (v14);
  }

  self->mContainersForObjectIDs = 0LL;
  objc_sync_exit(mContainersForObjectIDs);
  objc_autoreleasePoolPop(v3);
}

- (id)imprint
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprint](self->mRootPlug, "imprint"), @"rootPlug");
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v5 = -[NSMutableDictionary objectEnumerator](self->mVideoAssetsForObjectIDs, "objectEnumerator");
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
      }

      id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v6);
  }

  [v3 setObject:v4 forKey:@"videoAssets"];
  id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = -[NSMutableDictionary objectEnumerator](self->mAudioAssetsForObjectIDs, "objectEnumerator");
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
      }

      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }

    while (v12);
  }

  [v3 setObject:v10 forKey:@"audioAssets"];
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  id v17 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v18 = -[NSMutableDictionary objectEnumerator](self->mContainersForObjectIDs, "objectEnumerator", 0LL);
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (k = 0LL; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        __int128 v22 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)k);
        if ([v22 referencingPlug]) {
          objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v22, "imprint"), objc_msgSend(v22, "objectID"));
        }
      }

      id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }

    while (v19);
  }

  [v3 setObject:v17 forKey:@"containers"];
  objc_sync_exit(mContainersForObjectIDs);
  if (self->mFadeInDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"fadeInDuration");
  }
  if (self->mFadeOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"fadeOutDuration");
  }
  if (self->mAudioFadeOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"audioFadeOutDuration");
  }
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->mUUIDSeed),  @"uuidSeed");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_styleHint),  @"styleHint");
  return v3;
}

- (id)data
{
  uint64_t v4 = 0LL;
  v2 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  -[MCMontage imprint](self, "imprint"),  200LL,  0LL,  &v4);
  if (!v2) {
    NSLog(@"Error converting MCMontage imprint to NSData, '%@'\n", v4);
  }
  return v2;
}

- (void)lock
{
}

- (void)unlock
{
}

- (unint64_t)uuidSeed
{
  unint64_t v2 = self->mUUIDSeed + 1;
  self->mUUIDSeed = v2;
  return v2;
}

- (id)createSerializerContainer
{
  id v3 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCContainerSerializer),  "initFromScratchWithMontage:",  self);
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  v3,  [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createParallelizerContainer
{
  id v3 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCContainerParallelizer),  "initFromScratchWithMontage:",  self);
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  v3,  [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createEffectContainer
{
  id v3 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCContainerEffect),  "initFromScratchWithMontage:",  self);
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  v3,  [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)createNavigatorContainer
{
  id v3 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCContainerNavigator),  "initFromScratchWithMontage:",  self);
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  v3,  [v3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
  return v3;
}

- (id)videoAssetForFileAtPath:(id)a3
{
  if (a3) {
    id v5 = (const __CFString *)a3;
  }
  else {
    id v5 = @"DummyVideoAsset";
  }
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  objc_sync_enter(mVideoAssetsForFilePaths);
  id v7 = -[NSMutableDictionary objectForKey:](self->mVideoAssetsForFilePaths, "objectForKey:", v5);
  if (!v7)
  {
    id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCAssetVideo),  "initFromScratchWithMontage:",  self);
    [v7 setPath:a3];
    -[NSMutableDictionary setObject:forKey:](self->mVideoAssetsForFilePaths, "setObject:forKey:", v7, v5);
    -[NSMutableDictionary setObject:forKey:]( self->mVideoAssetsForObjectIDs,  "setObject:forKey:",  v7,  [v7 objectID]);
  }

  objc_sync_exit(mVideoAssetsForFilePaths);
  return v7;
}

- (id)audioAssetForFileAtPath:(id)a3
{
  if (a3) {
    id v5 = (const __CFString *)a3;
  }
  else {
    id v5 = @"DummyAudioAsset";
  }
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  objc_sync_enter(mAudioAssetsForFilePaths);
  id v7 = -[NSMutableDictionary objectForKey:](self->mAudioAssetsForFilePaths, "objectForKey:", v5);
  if (!v7)
  {
    id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCAssetAudio),  "initFromScratchWithMontage:",  self);
    [v7 setPath:a3];
    -[NSMutableDictionary setObject:forKey:](self->mAudioAssetsForFilePaths, "setObject:forKey:", v7, v5);
    -[NSMutableDictionary setObject:forKey:]( self->mAudioAssetsForObjectIDs,  "setObject:forKey:",  v7,  [v7 objectID]);
  }

  objc_sync_exit(mAudioAssetsForFilePaths);
  return v7;
}

- (id)assetForObjectID:(id)a3
{
  id result = -[MCMontage videoAssetForObjectID:](self, "videoAssetForObjectID:");
  if (!result) {
    return -[MCMontage audioAssetForObjectID:](self, "audioAssetForObjectID:", a3);
  }
  return result;
}

- (id)videoAssetForObjectID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mVideoAssetsForObjectIDs, "objectForKey:", a3);
}

- (id)audioAssetForObjectID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mAudioAssetsForObjectIDs, "objectForKey:", a3);
}

- (id)assets
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(mVideoAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v10 = -[NSMutableDictionary objectForKey:](self->mVideoAssetsForFilePaths, "objectForKey:", v9);
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v6);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(mAudioAssetsForFilePaths);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
        id v17 = -[NSMutableDictionary objectForKey:](self->mAudioAssetsForFilePaths, "objectForKey:", v16);
        if (([v16 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v17 isInUse])
        {
          [v3 addObject:v17];
        }
      }

      id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    }

    while (v13);
  }

  return v3;
}

- (id)videoAssets
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  mVideoAssetsForFilePaths = self->mVideoAssetsForFilePaths;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mVideoAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = -[NSMutableDictionary objectForKey:](self->mVideoAssetsForFilePaths, "objectForKey:", v9);
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mVideoAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)audioAssets
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  mAudioAssetsForFilePaths = self->mAudioAssetsForFilePaths;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mAudioAssetsForFilePaths);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = -[NSMutableDictionary objectForKey:](self->mAudioAssetsForFilePaths, "objectForKey:", v9);
        if (([v9 isEqualToString:@"DummyVideoAsset"] & 1) == 0
          && [v10 isInUse])
        {
          [v3 addObject:v10];
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mAudioAssetsForFilePaths,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)containerForObjectID:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  id v6 = (MCObject *)-[NSMutableDictionary objectForKey:](self->mContainersForObjectIDs, "objectForKey:", a3);
  if (!v6)
  {
    mImprintWhileLoading = self->mImprintWhileLoading;
    if (mImprintWhileLoading
      && (id v8 = objc_msgSend( -[NSDictionary objectForKey:](mImprintWhileLoading, "objectForKey:", @"containers"),  "objectForKey:",  a3)) != 0)
    {
      id v6 = +[MCObject objectWithImprint:andMontage:](&OBJC_CLASS___MCObject, "objectWithImprint:andMontage:", v8, self);
      -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  v6,  -[MCObject objectID](v6, "objectID"));
    }

    else
    {
      id v6 = 0LL;
    }
  }

  id v9 = v6;
  objc_sync_exit(mContainersForObjectIDs);
  return v6;
}

- (void)registerContainer:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary setObject:forKey:]( self->mContainersForObjectIDs,  "setObject:forKey:",  a3,  [a3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
}

- (void)forgetAboutContainer:(id)a3
{
  mContainersForObjectIDs = self->mContainersForObjectIDs;
  objc_sync_enter(mContainersForObjectIDs);
  -[NSMutableDictionary removeObjectForKey:]( self->mContainersForObjectIDs,  "removeObjectForKey:",  [a3 objectID]);
  objc_sync_exit(mContainersForObjectIDs);
}

- (MCPlug)rootPlug
{
  return self->mRootPlug;
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

- (double)audioFadeOutDuration
{
  return self->mAudioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->mAudioFadeOutDuration = a3;
}

- (NSString)basePath
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setBasePath:(id)a3
{
}

- (NSArray)layouts
{
  return (NSArray *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setLayouts:(id)a3
{
}

- (unsigned)styleHint
{
  return self->_styleHint;
}

- (void)setStyleHint:(unsigned __int8)a3
{
  self->_styleHint = a3;
}

@end