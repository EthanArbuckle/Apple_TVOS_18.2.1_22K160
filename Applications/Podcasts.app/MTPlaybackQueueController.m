@interface MTPlaybackQueueController
- (BOOL)playItemWithContentID:(id)a3;
- (BOOL)removeItemWithContentID:(id)a3;
- (BOOL)reorderItemWithContentId:(id)a3 afterItemWithContentID:(id)a4;
- (MPNowPlayingInfoCenter)metadataInfoCenter;
- (MTCompositeManifest)compositeManifest;
- (MTNowPlayingArtworkProvider)artworkProvider;
- (MTPlaybackQueueController)initWithPlayerController:(id)a3;
- (MTPlaybackQueueControllerSessionDelegate)sessionDelegate;
- (MTPlayerController)playerController;
- (MTPlayerItem)magicMomentPlayerItem;
- (MTResultsController)upNextResultsController;
- (NSMutableSet)artworkRequests;
- (NSString)sessionIdentifier;
- (id)_contentItemForChapter:(id)a3 playerItem:(id)a4;
- (id)_playerItemForContentItemId:(id)a3;
- (id)_playerItemForContentItemId:(id)a3 infoCenter:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4;
- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5;
- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3;
- (void)artworkDidChange:(id)a3;
- (void)clearUpNextManifest;
- (void)fetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7;
- (void)legacyFetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7;
- (void)manifestDidChange;
- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationWithCompletion:(id)a4;
- (void)setArtworkProvider:(id)a3;
- (void)setArtworkRequests:(id)a3;
- (void)setCompositeManifest:(id)a3;
- (void)setMagicMomentPlayerItem:(id)a3;
- (void)setMetadataInfoCenter:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setUpNextResultsController:(id)a3;
@end

@implementation MTPlaybackQueueController

- (MTPlaybackQueueController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTPlaybackQueueController;
  v5 = -[MTPlaybackQueueController init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    -[MTPlaybackQueueController setPlayerController:](v5, "setPlayerController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 infoCenter]);
    [v7 setPlaybackQueueDataSource:v5];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
    if (v6 == v8)
    {
      v9 = objc_alloc(&OBJC_CLASS___MPNowPlayingInfoCenter);
      v10 = -[MPNowPlayingInfoCenter initWithPlayerID:](v9, "initWithPlayerID:", kMTPodcastsMagicMomentsPlayerID);
      -[MTPlaybackQueueController setMetadataInfoCenter:](v5, "setMetadataInfoCenter:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](v5, "metadataInfoCenter"));
      [v11 setPlaybackQueueDataSource:v5];

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](v5, "metadataInfoCenter"));
      [v12 invalidatePlaybackQueue];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v5 selector:"manifestDidChange" name:IMAVPlayerNotification_MediaItemDidChange object:v6];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v5 selector:"didLoadAdditionalItems" name:IMPlayerManifestDidLoadAdditionalItems object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v5 selector:"artworkDidChange:" name:kMTImageDownloaderArtworkDidLoadNotification object:0];

    v16 = -[MTUpNextResultsController initWithPlayerController:]( objc_alloc(&OBJC_CLASS___MTUpNextResultsController),  "initWithPlayerController:",  v4);
    -[MTPlaybackQueueController setUpNextResultsController:](v5, "setUpNextResultsController:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController upNextResultsController](v5, "upNextResultsController"));
    [v17 setDelegate:v5];

    v18 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    -[MTPlaybackQueueController setArtworkRequests:](v5, "setArtworkRequests:", v18);

    -[MTPlaybackQueueController manifestDidChange](v5, "manifestDidChange");
  }

  return v5;
}

- (MTCompositeManifest)compositeManifest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 player]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manifest]);

  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTCompositeManifest),
        uint64_t v7 = objc_opt_class(v6),
        (objc_opt_isKindOfClass(v5, v7) & 1) == 0))
  {
    v10 = 0LL;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 player]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 manifest]);
  }

  return (MTCompositeManifest *)v10;
}

- (void)manifestDidChange
{
  uint64_t v3 = _MTLogCategoryPlayback(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidating playback queue", v14, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 player]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 infoCenter]);
  [v7 invalidatePlaybackQueue];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 player]);
  [v9 updateNowPlayingDurationSnapshot];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  -[MTPlaybackQueueController setSessionIdentifier:](self, "setSessionIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController sessionDelegate](self, "sessionDelegate"));
  LOBYTE(v11) = objc_opt_respondsToSelector(v12, "sessionIdentifierDidChange");

  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController sessionDelegate](self, "sessionDelegate"));
    [v13 sessionIdentifierDidChange];
  }

- (void)artworkDidChange:(id)a3
{
  uint64_t CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(a3, a2);
  id v15 = (id)objc_claimAutoreleasedReturnValue(CacheKeys);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0LL;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v7]);

      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 artworkIdentifier]);
      unsigned int v11 = [v15 containsObject:v10];

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 contentItem]);
        [v12 invalidateArtwork];
      }

      ++v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      id v14 = [v13 count];
    }

    while ((unint64_t)v14 > v7);
  }
}

- (BOOL)playItemWithContentID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 manifest]);
  if (os_feature_enabled_red_sun())
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTUpNextManifest);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentItem]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentItemIdentifier]);

      -[MTPlaybackQueueController reorderItemWithContentId:afterItemWithContentID:]( self,  "reorderItemWithContentId:afterItemWithContentID:",  v4,  v10);
    }
  }

  id v11 = [v5 manifestIndex];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  id v13 = [v12 determineCompositeIndexWithIndex:v11 fromManifest:v6];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  [v14 setCurrentIndex:v13];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  [v15 playWithReason:7];

  return 1;
}

- (BOOL)removeItemWithContentID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manifest]);
  id v6 = [v4 manifestIndex];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTUpNextManifest);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  char v9 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 upNextController]);
    [v11 removeEpisodeAtIndex:v6];
  }

  else
  {
    uint64_t v12 = _MTLogCategoryMediaRemote(isKindOfClass);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Can't remove an item that isn't in the up next manifest",  v14,  2u);
    }
  }

  return v9 & 1;
}

- (void)clearUpNextManifest
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 upNextController]);
  [v2 clearQueueItems];
}

- (BOOL)reorderItemWithContentId:(id)a3 afterItemWithContentID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 upNextController]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 manifest]);
  id v12 = [v10 manifestIndex];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MTUpNextManifest);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v11, v13);
  if ((isKindOfClass & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 manifest]);
    v17 = (char *)[v15 manifestIndex];
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___MTUpNextManifest);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
    {
      unsigned __int8 v19 = [v9 moveEpisodeFrom:v12 to:v17 + 1];
LABEL_14:

      goto LABEL_15;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 currentManifest]);
    if (v22 == v16)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v28 = (char *)[v24 currentIndex];

      if (v28 == v17)
      {
        [v9 moveEpisodeFrom:v12 to:0];
        unsigned __int8 v19 = 1;
        goto LABEL_14;
      }
    }

    else
    {
    }

    uint64_t v25 = _MTLogCategoryMediaRemote(v23);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Can't reorder an item to a destination outside of the up next queue",  v29,  2u);
    }

    unsigned __int8 v19 = 0;
    goto LABEL_14;
  }

  uint64_t v20 = _MTLogCategoryMediaRemote(isKindOfClass);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Can't reorder an item that isn't in the up next manifest",  buf,  2u);
  }

  unsigned __int8 v19 = 0;
LABEL_15:

  return v19;
}

- (void)setMagicMomentPlayerItem:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](self, "metadataInfoCenter"));
  [v4 invalidatePlaybackQueue];
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 player]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manifest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = kdebug_trace(723518092LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v9 = _MTLogCategoryMediaRemote(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138543362;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "[InfoCenter] Will fetch content item for ID %{public}@",  (uint8_t *)&v19,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:]( self,  "_playerItemForContentItemId:infoCenter:",  v6,  v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentItem]);

  uint64_t v14 = _MTLogCategoryMediaRemote(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 albumName]);
    int v19 = 138543874;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[InfoCenter] Did fetch content item for ID %{public}@ - %@ - %@",  (uint8_t *)&v19,  0x20u);
  }

  kdebug_trace(723518096LL, 0LL, 0LL, 0LL, 0LL);
  return v12;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = kdebug_trace(723518100LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v8 = _MTLogCategoryMediaRemote(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134217984;
    int64_t v34 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[InfoCenter] Will fetch content item ID for offset %ld",  (uint8_t *)&v33,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
  unsigned int v11 = [v10 isEqualToString:kMTPodcastsMagicMomentsPlayerID];

  if (v11)
  {
    if (a4)
    {
      uint64_t v13 = 0LL;
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController magicMomentPlayerItem](self, "magicMomentPlayerItem"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 contentItem]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
    }

    uint64_t v31 = _MTLogCategoryMediaRemote(v12);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 134218242;
      int64_t v34 = a4;
      __int16 v35 = 2114;
      id v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[InfoCenter] Did fetch content item ID for Magic Moments player for offset %ld - %{public}@",  (uint8_t *)&v33,  0x16u);
    }

    kdebug_trace(723518104LL, 0LL, 0LL, 0LL, 0LL);
    return v13;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  id v15 = (char *)[v14 currentIndex];

  v16 = &v15[a4];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  uint64_t v18 = (char *)[v17 count];

  if (v16 < v18)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v16]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v21 contentItemIdentifier]);
    uint64_t v22 = _MTLogCategoryMediaRemote(v13);
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 134218242;
      int64_t v34 = a4;
      __int16 v35 = 2114;
      id v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[InfoCenter] Did fetch content item ID for offset %ld - %{public}@",  (uint8_t *)&v33,  0x16u);
    }

    kdebug_trace(723518104LL, 0LL, 0LL, 0LL, 0LL);
    return v13;
  }

  uint64_t v24 = _MTLogCategoryMediaRemote(v19);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    id v27 = [v26 count];
    int v33 = 134218240;
    int64_t v34 = a4;
    __int16 v35 = 2048;
    id v36 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[InfoCenter] Attempting to fetch content item ID for offset %ld outside of manifest range %lu",  (uint8_t *)&v33,  0x16u);
  }

  kdebug_trace(723518104LL, 0LL, 0LL, 0LL, 0LL);
  return 0LL;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = kdebug_trace(723518108LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v15 = _MTLogCategoryMediaRemote(v14);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    *(_DWORD *)buf = 138543362;
    v38 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[InfoCenter] Will fetch artwork for content item ID %{public}@",  buf,  0xCu);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 player]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:]( self,  "_playerItemForContentItemId:infoCenter:",  v20,  v13));

  if (v21)
  {
    [v19 currentTime];
    double v24 = v23;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 currentChapter]);

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v19 currentChapter]);
      id v27 = v26;
      if (v26)
      {
        [v26 assetTimeRange];
      }

      else
      {
        __int128 v35 = 0u;
        memset(v34, 0, sizeof(v34));
      }

      CMTime time = *(CMTime *)v34;
      double v24 = CMTimeGetSeconds(&time) + 0.00000011920929;

      [v19 currentTime];
      if (v32 >= v24) {
        double v24 = v32;
      }
    }

    -[MTPlaybackQueueController legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:]( self,  "legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:",  v21,  v11,  v12,  v24,  width,  height,  *(_OWORD *)v34,  *(_OWORD *)&v34[16],  v35);
  }

  else
  {
    uint64_t v28 = _MTLogCategoryMediaRemote(v22);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      __int16 v39 = 2112;
      v40 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[InfoCenter] Attempting to fetch artwork for content item %{public}@ - %@ but player item is nil",  buf,  0x16u);
    }

    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
    kdebug_trace(723518112LL, 0LL, 0LL, 0LL, 0LL);
  }

  return 0LL;
}

- (void)fetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkProvider](self, "artworkProvider"));

  if (v16)
  {
    *(void *)buf = 0LL;
    int64_t v34 = buf;
    uint64_t v35 = 0x3032000000LL;
    id v36 = sub_10002969C;
    v37 = sub_1000296AC;
    id v38 = 0LL;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkProvider](self, "artworkProvider"));
    uint64_t v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    id v27 = sub_1000296B4;
    uint64_t v28 = &unk_100240DB0;
    id v29 = v14;
    v30 = self;
    id v31 = v15;
    double v32 = buf;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fetchInfoCenterArtworkWith:at:of:completion:", v13, &v25, a5, width, height));
    id v20 = (void *)*((void *)v34 + 5);
    *((void *)v34 + 5) = v19;

    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkRequests](self, "artworkRequests", v25, v26, v27, v28));
    [v21 addObject:*((void *)v34 + 5)];

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v22 = _MTLogCategoryMediaRemote(v17);
    double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    double v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MTPlaybackQueueControllerErrorDomain",  2LL,  0LL));
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v24);

    kdebug_trace(723518112LL, 0LL, 0LL, 0LL, 0LL);
  }
}

- (void)legacyFetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000298D0;
  v14[3] = &unk_100240DD8;
  id v15 = a4;
  id v16 = a7;
  id v12 = v16;
  id v13 = v15;
  objc_msgSend(a3, "retrieveArtwork:withSize:atTime:", v14, width, height, a5);
}

- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _MTLogCategoryMediaRemote(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    *(_DWORD *)buf = 138543362;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[InfoCenter] Will fetch info for content item ID %{public}@",  buf,  0xCu);
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 privateQueueContext]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:]( self,  "_playerItemForContentItemId:infoCenter:",  v16,  v8));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100029BB8;
    v21[3] = &unk_100240E00;
    id v22 = v15;
    id v23 = v17;
    id v24 = v9;
    id v25 = v10;
    id v18 = v17;
    id v19 = v15;
    [v19 performBlock:v21];
  }

  return 0LL;
}

- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationWithCompletion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeDsid]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifiersForManifest:v9 queueStatus:0]);

  uint64_t v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
  if ([v10 count])
  {
    id v27 = v5;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil sharedInstance]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "sharedInstance",  v27));
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playbackRequestURLWithDSID:v7 baseRequestURLString:v17]);

          -[NSMutableArray addObject:](v11, "addObject:", v19);
        }

        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }

      while (v14);
    }

    id v28 = 0LL;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  0LL,  &v28));
    id v21 = v28;
    id v22 = v21;
    v5 = v27;
    if (v21)
    {
      uint64_t v23 = _MTLogCategoryMediaRemote(v21);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v34 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Could not archive playback session: %@",  buf,  0xCu);
      }
    }

    if (v27) {
      ((void (**)(id, void *, void *))v27)[2](v27, v20, v22);
    }
  }

  else
  {
    uint64_t v25 = _MTLogCategoryMediaRemote(0LL);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "No playback identifiers found in current manifest",  buf,  2u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MTPlaybackQueueControllerErrorDomain",  1LL,  0LL));
    v5[2](v5, 0LL, v22);
  }
}

- (id)_playerItemForContentItemId:(id)a3
{
  return -[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:]( self,  "_playerItemForContentItemId:infoCenter:",  a3,  0LL);
}

- (id)_playerItemForContentItemId:(id)a3 infoCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerID]);
  unsigned int v9 = [v8 isEqualToString:kMTPodcastsMagicMomentsPlayerID];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController magicMomentPlayerItem](self, "magicMomentPlayerItem"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 contentItem]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    else {
      id v13 = 0LL;
    }
  }

  else
  {
    uint64_t v34 = 0LL;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    v37 = sub_10002969C;
    id v38 = sub_1000296AC;
    id v39 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10002A314;
    v31[3] = &unk_100240E28;
    id v15 = v6;
    id v32 = v15;
    int v33 = &v34;
    [v14 enumerateObjectsUsingBlock:v31];

    id v16 = (void *)v35[5];
    if (!v16)
    {
      uint64_t v25 = 0LL;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x3032000000LL;
      id v28 = sub_10002969C;
      __int128 v29 = sub_1000296AC;
      __int128 v30 = &stru_100248948;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10002A3A8;
      v24[3] = &unk_100240E50;
      v24[4] = &v25;
      [v17 enumerateObjectsUsingBlock:v24];

      uint64_t v20 = _MTLogCategoryPlayback(v18, v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = v26[5];
        *(_DWORD *)buf = 138543618;
        id v41 = v15;
        __int16 v42 = 2114;
        uint64_t v43 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "We couldn't find a player item for content item %{public}@.  All player items in the queue %{public}@",  buf,  0x16u);
      }

      _Block_object_dispose(&v25, 8);
      id v16 = (void *)v35[5];
    }

    id v13 = v16;

    _Block_object_dispose(&v34, 8);
  }

  return v13;
}

- (id)_contentItemForChapter:(id)a3 playerItem:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0LL;
  if (a3 && v5)
  {
    id v8 = a3;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeUuid]);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 episodeStoreId]));
      id v11 = (id)objc_claimAutoreleasedReturnValue([v12 stringValue]);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 podcastUuid]);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 podcastStoreId]));
      id v15 = (id)objc_claimAutoreleasedReturnValue([v16 stringValue]);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingFormat:@"-%@", v17]);
    id v7 = [[MPNowPlayingContentItem alloc] initWithIdentifier:v18];
    [v7 setCollectionIdentifier:v15];
    [v7 setContainer:0];
    [v7 setPlayable:1];
    [v7 setTitle:v17];
    [v8 duration];
    double v20 = v19;

    [v7 setDuration:v20];
  }

  return v7;
}

- (MTPlaybackQueueControllerSessionDelegate)sessionDelegate
{
  return (MTPlaybackQueueControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (MTPlayerItem)magicMomentPlayerItem
{
  return self->_magicMomentPlayerItem;
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
}

- (MPNowPlayingInfoCenter)metadataInfoCenter
{
  return self->_metadataInfoCenter;
}

- (void)setMetadataInfoCenter:(id)a3
{
}

- (void)setCompositeManifest:(id)a3
{
}

- (MTResultsController)upNextResultsController
{
  return self->_upNextResultsController;
}

- (void)setUpNextResultsController:(id)a3
{
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
}

- (NSMutableSet)artworkRequests
{
  return self->_artworkRequests;
}

- (void)setArtworkRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end