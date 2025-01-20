@interface MTStoreManifest
+ (BOOL)storePlatformDictionaryHasChildren:(id)a3;
+ (id)_episodeStorePlatformDictionaryFromSiriAssetInfo:(id)a3 episodeAdamId:(id)a4;
+ (id)activityTypeSuffix;
+ (id)episodeCacheForStoreMediaDictionaries:(id)a3;
+ (id)playerItemsFromPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4 restricted:(BOOL *)a5 initiatedByAnotherUser:(BOOL)a6;
+ (id)podcastStorePlatformDictionaryFromSiriAssetInfo:(id)a3 podcastAdamId:(id)a4;
+ (id)storeMediaDictionariesToPlayerItems:(id)a3;
+ (id)storeMediaDictionariesToPlayerItems:(id)a3 initiatedByAnotherUser:(BOOL)a4;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 completion:(id)a4;
+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5;
- (BOOL)initiatedByAnotherUser;
- (BOOL)playerItemsNeedLoading;
- (BOOL)userActivityContainsPlayhead;
- (MTStoreManifest)initWithEpisodeAdamId:(id)a3 siriAssetInfo:(id)a4 initialIndex:(unint64_t)a5 initiatedByAnotherUser:(BOOL)a6;
- (MTStoreManifest)initWithEpisodeAdamIds:(id)a3 initialIndex:(unint64_t)a4;
- (MTStoreManifest)initWithItems:(id)a3;
- (MTStoreManifest)initWithItems:(id)a3 initialIndex:(unint64_t)a4;
- (MTStoreManifest)initWithPodcastAdamId:(id)a3 siriAssetInfo:(id)a4 oldestEpisode:(BOOL)a5 initiatedByAnotherUser:(BOOL)a6;
- (MTStoreManifest)initWithStoreMediaDictionaries:(id)a3 initialIndex:(unint64_t)a4;
- (NSArray)episodeAdamIds;
- (NSNumber)podcastAdamId;
- (double)initialPlayheadPosition;
- (id)_initWithEpisodeAdamIds:(id)a3 playheadPosition:(double)a4 initialIndex:(unint64_t)a5;
- (id)_initWithPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4;
- (id)activity;
- (int64_t)playbackOrder;
- (unint64_t)initialIndex;
- (unint64_t)loadStatus;
- (void)_loadItemsFromEpisodeAdamIdsWithCompletion:(id)a3;
- (void)_updateLoadStatus:(BOOL)a3;
- (void)load:(id)a3;
- (void)setEpisodeAdamIds:(id)a3;
- (void)setInitialIndex:(unint64_t)a3;
- (void)setInitialPlayheadPosition:(double)a3;
- (void)setInitiatedByAnotherUser:(BOOL)a3;
- (void)setLoadStatus:(unint64_t)a3;
- (void)setPlaybackOrder:(int64_t)a3;
- (void)setPlayerItemsNeedLoading:(BOOL)a3;
- (void)setPodcastAdamId:(id)a3;
@end

@implementation MTStoreManifest

- (MTStoreManifest)initWithEpisodeAdamIds:(id)a3 initialIndex:(unint64_t)a4
{
  return (MTStoreManifest *)-[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:]( self,  "_initWithEpisodeAdamIds:playheadPosition:initialIndex:",  a3,  a4,  0.0);
}

- (MTStoreManifest)initWithEpisodeAdamId:(id)a3 siriAssetInfo:(id)a4 initialIndex:(unint64_t)a5 initiatedByAnotherUser:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(id)objc_opt_class(self) _episodeStorePlatformDictionaryFromSiriAssetInfo:v10 episodeAdamId:v9];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12
    || ((unsigned __int8 v24 = 0,
         (uint64_t v13 = objc_claimAutoreleasedReturnValue( +[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:]( &OBJC_CLASS___MTStorePlatformUtil,  "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:",  v12,  &v24,  kMTPreferredArtworkSize))) == 0)
      ? (BOOL v14 = v24 == 0)
      : (BOOL v14 = 0),
        v14))
  {
    id v25 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v20 = -[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:]( self,  "_initWithEpisodeAdamIds:playheadPosition:initialIndex:",  v19,  a5,  0.0);

    v21 = (MTStoreManifest *)v20;
  }

  else
  {
    v15 = (void *)v13;
    if (v13)
    {
      v16 = (void *)objc_opt_class(self);
      v26 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:",  v17,  -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser")));
    }

    else
    {
      v18 = &__NSArray0__struct;
    }

    v22 = -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", v18, a5);
    -[MTStoreManifest _updateLoadStatus:](v22, "_updateLoadStatus:", v24);
    v21 = v22;
  }

  return v21;
}

- (MTStoreManifest)initWithPodcastAdamId:(id)a3 siriAssetInfo:(id)a4 oldestEpisode:(BOOL)a5 initiatedByAnotherUser:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(id)objc_opt_class(self) podcastStorePlatformDictionaryFromSiriAssetInfo:v11 podcastAdamId:v10];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [(id)objc_opt_class(self) storePlatformDictionaryHasChildren:v13];
  int v15 = (int)v14;
  uint64_t v17 = _MTLogCategoryPlayback(v14, v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "assetInfo has children %d", buf, 8u);
  }

  if (v13) {
    uint64_t v19 = v15 ^ 1u;
  }
  else {
    uint64_t v19 = 1LL;
  }
  if ((v19 & 1) != 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
    id v20 = -[MTPlayerManifest init](&v24, "init");
  }

  else
  {
    id v20 = -[MTStoreManifest _initWithPodcastStorePlatformDictionary:oldestEpisode:]( self,  "_initWithPodcastStorePlatformDictionary:oldestEpisode:",  v13,  v7);
  }

  v21 = v20;
  if (v20)
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v20, "setPlayerItemsNeedLoading:", v19);
    if (v7) {
      uint64_t v22 = 2LL;
    }
    else {
      uint64_t v22 = 1LL;
    }
    -[MTStoreManifest setPlaybackOrder:](v21, "setPlaybackOrder:", v22);
    -[MTStoreManifest setPodcastAdamId:](v21, "setPodcastAdamId:", v10);
    -[MTStoreManifest setInitiatedByAnotherUser:](v21, "setInitiatedByAnotherUser:", v6);
  }

  return v21;
}

- (id)_initWithEpisodeAdamIds:(id)a3 playheadPosition:(double)a4 initialIndex:(unint64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
  id v9 = -[MTPlayerManifest init](&v12, "init");
  id v10 = v9;
  if (v9)
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v9, "setPlayerItemsNeedLoading:", 1LL);
    -[MTStoreManifest setInitialPlayheadPosition:](v10, "setInitialPlayheadPosition:", a4);
    -[MTStoreManifest setInitialIndex:](v10, "setInitialIndex:", a5);
    -[MTStoreManifest setEpisodeAdamIds:](v10, "setEpisodeAdamIds:", v8);
  }

  return v10;
}

- (id)_initWithPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v12 = 0;
  id v6 = a3;
  id v7 = objc_msgSend( (id)objc_opt_class(self),  "playerItemsFromPodcastStorePlatformDictionary:oldestEpisode:restricted:initiatedByAnotherUser:",  v6,  v4,  &v12,  -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = -[MTStoreManifest initWithItems:](self, "initWithItems:", v8);
  id v10 = v9;
  if (v9) {
    -[MTStoreManifest _updateLoadStatus:](v9, "_updateLoadStatus:", v12);
  }

  return v10;
}

- (void)load:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[MTStoreManifest playerItemsNeedLoading](v5, "playerItemsNeedLoading"))
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v5, "setPlayerItemsNeedLoading:", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](v5, "episodeAdamIds"));
    id v7 = [v6 count];

    if (v7)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100023864;
      v28[3] = &unk_100240B48;
      v28[4] = v5;
      id v29 = v4;
      -[MTStoreManifest _loadItemsFromEpisodeAdamIdsWithCompletion:]( v5,  "_loadItemsFromEpisodeAdamIdsWithCompletion:",  v28);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest podcastAdamId](v5, "podcastAdamId"));
      unsigned int v9 = +[MTStoreIdentifier isNotEmptyNumber:]( &OBJC_CLASS___MTStoreIdentifier,  "isNotEmptyNumber:",  v8);

      objc_initWeak(&location, v5);
      if (v9)
      {
        id v10 = objc_alloc(&OBJC_CLASS___IMContentLookupService);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest podcastAdamId](v5, "podcastAdamId"));
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
        v30 = v12;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
        id v14 = [v10 initWithIds:v13];

        int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v14 setProfile:kMTStoreLookupPodcastProductProfile];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000239A8;
        v22[3] = &unk_100240B70;
        id v16 = v15;
        id v23 = v16;
        objc_copyWeak(&v26, &location);
        objc_super v24 = v5;
        id v25 = v4;
        [v14 request:v22];

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }

      else
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100023C3C;
        v19[3] = &unk_100240B98;
        objc_copyWeak(&v21, &location);
        id v20 = v4;
        v18.receiver = v5;
        v18.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
        -[MTStoreManifest load:](&v18, "load:", v19);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
    }
  }

  else
  {
    v17.receiver = v5;
    v17.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
    -[MTStoreManifest load:](&v17, "load:", v4);
  }

  objc_sync_exit(v5);
}

- (MTStoreManifest)initWithStoreMediaDictionaries:(id)a3 initialIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class(self) storeMediaDictionariesToPlayerItems:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  unsigned int v9 = -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", v8, a4);
  return v9;
}

- (MTStoreManifest)initWithItems:(id)a3
{
  return -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", a3, 0LL);
}

- (MTStoreManifest)initWithItems:(id)a3 initialIndex:(unint64_t)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
  id v7 = -[MTItemListManifest initWithItems:](&v27, "initWithItems:", v6);
  id v8 = v7;
  if (v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](v7, "items"));
    else {
      unint64_t v10 = a4;
    }
    -[MTStoreManifest setCurrentIndex:](v8, "setCurrentIndex:", v10);

    id v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_super v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ((uint64_t)objc_msgSend(v17, "episodeStoreId", (void)v23) >= 1)
          {
            objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 episodeStoreId]));
            -[NSMutableArray addObject:](v11, "addObject:", v18);
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v14);
    }

    id v19 = -[NSMutableArray copy](v11, "copy");
    -[MTStoreManifest setEpisodeAdamIds:](v8, "setEpisodeAdamIds:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"Directory" value:&stru_100248948 table:0]);
    -[MTStoreManifest setTitle:](v8, "setTitle:", v21);
  }

  return v8;
}

- (void)_updateLoadStatus:(BOOL)a3
{
  unsigned int v5 = -[MTStoreManifest isLoaded](self, "isLoaded");
  if (v5) {
    uint64_t v6 = 2LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  if (v5 && !a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](self, "items", v6));
    id v8 = [v7 count];

    if (v8) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 3LL;
    }
  }

  -[MTStoreManifest setLoadStatus:](self, "setLoadStatus:", v6);
}

- (void)_loadItemsFromEpisodeAdamIdsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  -[MTStoreManifest initialPlayheadPosition](self, "initialPlayheadPosition");
  v15[3] = v5;
  uint64_t v6 = -[MTStoreManifest initialIndex](self, "initialIndex");
  id v7 = (void *)objc_opt_class(self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](self, "episodeAdamIds"));
  BOOL v9 = -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100024100;
  v11[3] = &unk_100240BE8;
  objc_copyWeak(v14, &location);
  v14[1] = v6;
  id v13 = v15;
  id v10 = v4;
  id v12 = v10;
  [v7 fetchPlayerItemsForStoreTrackIDs:v8 initiatedByAnotherUser:v9 completion:v11];

  objc_destroyWeak(v14);
  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&location);
}

- (id)activity
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTStoreManifest;
  id v3 = -[MTPlayerManifest activity](&v8, "activity");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MTStoreManifest currentIndex](self, "currentIndex")));
  [v4 setValue:v5 forKey:@"MTStoreManifestCurrentIndex"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](self, "episodeAdamIds"));
  [v4 setValue:v6 forKey:@"MTStoreManifestAdamIdList"];

  return v4;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v15 = a3;
  uint64_t v5 = (void (**)(id, id))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  unsigned __int8 v7 = [v6 isReachable];

  if ((v7 & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"MTStoreManifestAdamIdList"]);

    if ([v9 count])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:@"MTStoreManifestCurrentIndex"]);

      id v12 = objc_alloc(&OBJC_CLASS___MTStoreManifest);
      [v15 currentTime];
      id v14 = -[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:]( v12,  "_initWithEpisodeAdamIds:playheadPosition:initialIndex:",  v9,  [v11 unsignedIntegerValue],  v13);
      v5[2](v5, v14);
    }

    else
    {
      v5[2](v5, 0LL);
    }
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

+ (id)activityTypeSuffix
{
  return @"store";
}

- (BOOL)userActivityContainsPlayhead
{
  return 1;
}

+ (BOOL)storePlatformDictionaryHasChildren:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"childrenIds"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(v4);
  BOOL v6 = (objc_opt_isKindOfClass(v3, v5) & 1) != 0 && [v3 count] != 0;

  return v6;
}

+ (id)playerItemsFromPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4 restricted:(BOOL *)a5 initiatedByAnotherUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"childrenIds"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"children"]);
  if (a4) {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);
  }
  else {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  }
  id v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v15]);

  if (v16)
  {
    BOOL v23 = 0;
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"isNotSubscribeable"]);
    id v18 = [v17 BOOLValue];

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:]( &OBJC_CLASS___MTStorePlatformUtil,  "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:",  v16,  &v23,  v18,  kMTPreferredArtworkSize));
    if (+[MTStorePlatformUtil isExplicitForStorePlatformDictionary:]( &OBJC_CLASS___MTStorePlatformUtil,  "isExplicitForStorePlatformDictionary:",  v10)
      && (+[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed") & 1) == 0)
    {
      BOOL v23 = 1;
    }

    if (a5) {
      *a5 = v23;
    }
    if (v19)
    {
      __int128 v24 = v19;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([a1 storeMediaDictionariesToPlayerItems:v20 initiatedByAnotherUser:v6]);
    }

    else
    {
      id v21 = &__NSArray0__struct;
    }
  }

  else
  {
    id v21 = &__NSArray0__struct;
  }

  return v21;
}

+ (id)podcastStorePlatformDictionaryFromSiriAssetInfo:(id)a3 podcastAdamId:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
    uint64_t v18 = 0LL;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v18));
    objc_super v8 = v7;
    id v9 = 0LL;
    if (!v18)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"results"]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 stringValue]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"firstAndLastChildrenIds"]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"firstAndLastChildren"]);
      uint64_t v15 = sub_100024954((uint64_t)v14, v12);
      if ((v15 & 1) != 0 || (uint64_t v16 = sub_100024954(v15, v13), (v16 & 1) != 0) || (sub_100024954(v16, v14) & 1) != 0)
      {
        id v9 = 0LL;
      }

      else
      {
        id v9 = [v12 mutableCopy];
        [v9 removeObjectForKey:@"firstAndLastChildrenIds"];
        [v9 removeObjectForKey:@"firstAndLastChildren"];
        [v9 setObject:v13 forKey:@"childrenIds"];
        [v9 setObject:v14 forKey:@"children"];
      }
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)_episodeStorePlatformDictionaryFromSiriAssetInfo:(id)a3 episodeAdamId:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  unsigned __int8 v7 = 0LL;
  if (a3 && v5)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
    uint64_t v14 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  0LL,  &v14));
    id v10 = v9;
    unsigned __int8 v7 = 0LL;
    if (!v14)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"results"]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);
    }
  }

  return v7;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3
{
  return [a1 storeMediaDictionariesToPlayerItems:a3 initiatedByAnotherUser:0];
}

+ (id)episodeCacheForStoreMediaDictionaries:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v5 = kEpisodeEnclosureUrl;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:kEpisodeAssetURL]);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K in %@",  v5,  v6));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertiesToFetchAssetURL](&OBJC_CLASS___MTEpisode, "propertiesToFetchAssetURL"));
  v24[0] = v5;
  v24[1] = kEpisodeUuid;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainOrPrivateContext]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100024C80;
  v19[3] = &unk_100240C10;
  id v20 = v12;
  id v21 = v7;
  id v22 = v10;
  id v23 = v4;
  id v13 = v4;
  id v14 = v10;
  id v15 = v7;
  id v16 = v12;
  [v16 performBlockAndWait:v19];
  id v17 = [v13 copy];

  return v17;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3 initiatedByAnotherUser:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  BOOL v63 = v4;
  if (v4) {
    v64 = 0LL;
  }
  else {
    v64 = (void *)objc_claimAutoreleasedReturnValue([a1 episodeCacheForStoreMediaDictionaries:v6]);
  }
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obj = v6;
  id v66 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v72;
    uint64_t v8 = kEpisodeAssetURL;
    uint64_t v60 = kEpisodeUuid;
    unint64_t v57 = vcvtpd_s64_f64(kMTPreferredArtworkSize);
    uint64_t v59 = kEpisodePubDate;
    uint64_t v61 = kEpisodeAssetURL;
    v62 = v7;
    do
    {
      for (i = 0LL; i != v66; i = (char *)i + 1)
      {
        if (*(void *)v72 != v65) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
        if ([v11 length]) {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:v11]);
        }
        else {
          id v12 = 0LL;
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v8]);
        if ([v13 length])
        {
          id v14 = v13;

          id v11 = v14;
        }

        if ([v11 length])
        {
          v68 = v13;
          id v16 = objc_alloc(&OBJC_CLASS___MTPlayerItem);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
          uint64_t v18 = -[MTPlayerItem initWithUrl:](v16, "initWithUrl:", v17);

          -[MTPlayerItem setManifestIndex:](v18, "setManifestIndex:", [v7 count]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v60]);
          if ([v19 length]) {
            -[MTPlayerItem setEpisodeUuid:](v18, "setEpisodeUuid:", v19);
          }
          v67 = v19;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"episodeId"]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier validatedIdNumberFromStoreId:]( MTStoreIdentifier,  "validatedIdNumberFromStoreId:",  [v20 longLongValue]));
          -[MTPlayerItem setEpisodeStoreId:](v18, "setEpisodeStoreId:", [v21 longLongValue]);

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"episodeGuid"]);
          -[MTPlayerItem setEpisodeGuid:](v18, "setEpisodeGuid:", v22);

          -[MTPlayerItem setEnqueuedByAnotherUser:](v18, "setEnqueuedByAnotherUser:", v63);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"feedURL"]);
          -[MTPlayerItem setPodcastFeedUrl:](v18, "setPodcastFeedUrl:", v23);

          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"podcastId"]);
          -[MTPlayerItem setPodcastStoreId:](v18, "setPodcastStoreId:", [v24 longLongValue]);

          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"isNotSubscribeable"]);
          -[MTPlayerItem setIsNotSubscribeable:](v18, "setIsNotSubscribeable:", [v25 BOOLValue]);

          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"episodeTitle"]);
          -[MTPlayerItem setTitle:](v18, "setTitle:", v26);

          objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"episodeDescription"]);
          -[MTPlayerItem setItemDescription:](v18, "setItemDescription:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"episodeShareUrl"]);
          -[MTPlayerItem setEpisodeShareUrl:](v18, "setEpisodeShareUrl:", v28);

          id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"podcastTitle"]);
          -[MTPlayerItem setAuthor:](v18, "setAuthor:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue( +[MTStorePlatformUtil pubDateFromStoreMediaDictionary:]( &OBJC_CLASS___MTStorePlatformUtil,  "pubDateFromStoreMediaDictionary:",  v10));
          -[MTPlayerItem setPubDate:](v18, "setPubDate:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v59]);
          if (v31)
          {
            -[MTPlayerItem setAlbum:](v18, "setAlbum:", v31);
          }

          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem pubDate](v18, "pubDate"));
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 verboseDisplayString]);
            -[MTPlayerItem setAlbum:](v18, "setAlbum:", v34);
          }

          v35 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"explicit"]);
          -[MTPlayerItem setIsExplicit:](v18, "setIsExplicit:", [v35 BOOLValue]);

          v36 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"duration"]);
          if ((objc_opt_respondsToSelector(v36, "longLongValue") & 1) != 0)
          {
            -[MTPlayerItem setDuration:](v18, "setDuration:", (double)(uint64_t)[v36 longLongValue]);
          }

          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
            objc_msgSend( v37,  "logFile:lineNumber:format:",  "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/Support/MTStoreManifest.m",  480,  @"Store item %lld is missing a duration",  -[MTPlayerItem episodeStoreId](v18, "episodeStoreId"));
          }

          v69 = v12;
          v38 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"reportParams"]);
          if (v38) {
            -[MTPlayerItem setStoreReportingParams:](v18, "setStoreReportingParams:", v38);
          }
          v70 = v11;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"artworkURL"]);
          if ([v39 count])
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lastObject]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"url"]);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v41));
            -[MTPlayerItem setArtworkUrl:](v18, "setArtworkUrl:", v42);
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](v18, "artworkUrl"));
          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 absoluteString]);
          id v45 = [v44 length];

          if (!v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"artwork"]);
            v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"url"]);
            if ([v47 length])
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lix%li",  v57,  v57));
              v49 = (void *)objc_claimAutoreleasedReturnValue( [v47 stringByReplacingOccurrencesOfString:@"{w}x{h}" withString:v48]);
              v50 = (void *)objc_claimAutoreleasedReturnValue( [v49 stringByReplacingOccurrencesOfString:@".{f}" withString:@".jpg"]);

              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v50));
              -[MTPlayerItem setArtworkUrl:](v18, "setArtworkUrl:", v51);
            }
          }

          id v11 = v70;
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v70));
          v53 = (void *)objc_claimAutoreleasedReturnValue([v52 pathExtension]);
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMUTITypes UTIByExtension:](&OBJC_CLASS___IMUTITypes, "UTIByExtension:", v53));

          if (v54) {
            -[MTPlayerItem setIsVideo:]( v18,  "setIsVideo:",  +[MTUTIUtil isVideo:](&OBJC_CLASS___MTUTIUtil, "isVideo:", v54));
          }
          unsigned __int8 v7 = v62;
          [v62 addObject:v18];

          uint64_t v8 = v61;
          id v13 = v68;
          id v12 = v69;
        }

        else
        {
          uint64_t v32 = _MTLogCategoryPlayback(0LL, v15);
          uint64_t v18 = (MTPlayerItem *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "Skipping player item creation for item %@ because we couldn't play locally or stream",  buf,  0xCu);
          }
        }
      }

      id v66 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    }

    while (v66);
  }

  id v55 = [v7 copy];
  return v55;
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 completion:(id)a4
{
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mt_compactMap:", &stru_100240C50));
    id v11 = [[IMContentLookupService alloc] initWithIds:v10];
    [v11 setProfile:kMTStoreLookupPodcastProductProfile];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002583C;
    v15[3] = &unk_100240C78;
    id v16 = v10;
    id v18 = a1;
    BOOL v19 = a4;
    id v17 = v9;
    id v12 = v10;
    [v11 request:v15];
  }

  else
  {
    uint64_t v13 = _MTLogCategoryMediaRemote(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = a1;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ Found 0 store track IDs", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    }
  }
}

- (unint64_t)loadStatus
{
  return self->_loadStatus;
}

- (void)setLoadStatus:(unint64_t)a3
{
  self->_loadStatus = a3;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (void)setPlaybackOrder:(int64_t)a3
{
  self->_playbackOrder = a3;
}

- (NSArray)episodeAdamIds
{
  return self->_episodeAdamIds;
}

- (void)setEpisodeAdamIds:(id)a3
{
}

- (NSNumber)podcastAdamId
{
  return self->_podcastAdamId;
}

- (void)setPodcastAdamId:(id)a3
{
}

- (double)initialPlayheadPosition
{
  return self->_initialPlayheadPosition;
}

- (void)setInitialPlayheadPosition:(double)a3
{
  self->_initialPlayheadPosition = a3;
}

- (unint64_t)initialIndex
{
  return self->_initialIndex;
}

- (void)setInitialIndex:(unint64_t)a3
{
  self->_initialIndex = a3;
}

- (BOOL)playerItemsNeedLoading
{
  return self->_playerItemsNeedLoading;
}

- (void)setPlayerItemsNeedLoading:(BOOL)a3
{
  self->_playerItemsNeedLoading = a3;
}

- (BOOL)initiatedByAnotherUser
{
  return self->_initiatedByAnotherUser;
}

- (void)setInitiatedByAnotherUser:(BOOL)a3
{
  self->_initiatedByAnotherUser = a3;
}

- (void).cxx_destruct
{
}

@end