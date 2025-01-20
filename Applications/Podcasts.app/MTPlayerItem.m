@interface MTPlayerItem
+ (id)subtitleStringForArtist:(id)a3 album:(id)a4;
+ (id)subtitleStringForEpisode:(id)a3;
- (BOOL)isPlayable;
- (BOOL)needsNetworkToPlayButNoNetwork;
- (BOOL)notifyUserIsNotPlayable;
- (BOOL)supportsArtworkUrl;
- (BOOL)supportsChapterArtwork;
- (BOOL)supportsEpisodeArtwork;
- (BOOL)upgradeToAlternatePaidVersionIfNeeded;
- (MTEpisodeIdentifier)episodeIdentifier;
- (MTPlayerItem)init;
- (MTPlayerItem)initWithPodcastEpisode:(id)a3 podcast:(id)a4;
- (NSObject)streamCacheObserverToken;
- (NSString)storeReportingParams;
- (PFAnalyticsChannel)analyticsChannel;
- (PFFairPlayKeyLoading)fairPlayKeyLoader;
- (PFFairPlayKeySession)fairPlayKeySession;
- (_TtC10PodcastsUI23UIStoreResponseDelegate)storeResponseDelegate;
- (id)_episodeArtworkIdentifier;
- (id)_podcastArtworkIdentifier;
- (id)artworkIdentifier;
- (id)assetForLocalFile:(id)a3;
- (id)assetForRemoteFile:(id)a3;
- (id)contentItemIdentifier;
- (id)createAssetForUrl:(id)a3;
- (id)defaultAssetOptions;
- (id)episode;
- (id)externalMetadata;
- (id)fetchArtworkItemProviderForSize:(CGSize)a3;
- (id)metricsContentIdentifier;
- (id)podcastShareUrl;
- (id)subtitle;
- (int64_t)mpItemType;
- (void)addServiceIdentifier:(id)a3;
- (void)addUserAgent:(id)a3;
- (void)cleanupItem;
- (void)contentKeyRequestDidFailWithError:(id)a3;
- (void)dealloc;
- (void)invalidateAsset;
- (void)prepareAssetForFairPlayPlayback:(id)a3;
- (void)prepareAssetForFairPlayPlayback_legacy:(id)a3;
- (void)reportIfLocalAssetHasiPodLibraryURL:(id)a3;
- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4;
- (void)setAnalyticsChannel:(id)a3;
- (void)setAreChaptersLoaded:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setFairPlayKeyLoader:(id)a3;
- (void)setFairPlayKeySession:(id)a3;
- (void)setManifestIndex:(unint64_t)a3;
- (void)setStoreReportingParams:(id)a3;
- (void)setStoreResponseDelegate:(id)a3;
- (void)setStreamCacheObserverToken:(id)a3;
- (void)updateActivity:(id)a3;
- (void)upgradeToLocalEpisodeBackedItemWithEpisodeUUID:(id)a3 podcastUUID:(id)a4;
@end

@implementation MTPlayerItem

- (MTPlayerItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  v2 = -[MTPlayerItem init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"cleanupItem" name:MTApplicationWillTerminateNotification object:0];

    v4 = objc_alloc_init(&OBJC_CLASS____TtC10PodcastsUI23UIStoreResponseDelegate);
    -[MTPlayerItem setStoreResponseDelegate:](v2, "setStoreResponseDelegate:", v4);

    id v5 = objc_alloc_init(&OBJC_CLASS___PFCoreAnalyticsChannel);
    -[MTPlayerItem setAnalyticsChannel:](v2, "setAnalyticsChannel:", v5);

    v6 = (void *)objc_opt_new(&OBJC_CLASS___PFFairPlayKeyLoader);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFDispatchingFairPlayKeyLoader receiveOn:loader:]( &OBJC_CLASS___PFDispatchingFairPlayKeyLoader,  "receiveOn:loader:",  &_dispatch_main_q,  v6));
    -[MTPlayerItem setFairPlayKeyLoader:](v2, "setFairPlayKeyLoader:", v7);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));

  if (v3)
  {
    uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing observer for token: %@", buf, 0xCu);
    }

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));
    [v9 removeObserver:v10];

    -[MTPlayerItem setStreamCacheObserverToken:](self, "setStreamCacheObserverToken:", 0LL);
  }

  -[MTPlayerItem cleanupItem](self, "cleanupItem");
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  -[MTPlayerItem dealloc](&v11, "dealloc");
}

- (void)cleanupItem
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PFFairPlayRolloutController sharedInstance]( &OBJC_CLASS___PFFairPlayRolloutController,  "sharedInstance"));
  unsigned int v4 = [v3 isEnabled];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
      [v6 deregister];

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 asset]);
      unsigned __int8 v9 = [v8 isOfflineAsset];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = _MTLogCategoryDRM();
        objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MTPlayerItem/cleanupItem]: Stopping existing session.",  buf,  2u);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeyLoader](self, "fairPlayKeyLoader"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
        [v12 stopKeyRequestWithSession:v13 completion:0];
      }

      -[MTPlayerItem setFairPlayKeySession:](self, "setFairPlayKeySession:", 0LL);
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
    [v14 sendStopRequestForStreamingLicenseIfNecessary];
  }

- (void)addUserAgent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CFNetworkCopyDefaultUserAgentString();
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  v7 = v5;
  if (v5 && (id v5 = [v5 length]) != 0)
  {
    [v3 setObject:v7 forKey:AVURLAssetHTTPUserAgentKey];
  }

  else
  {
    uint64_t v8 = _MTLogCategoryPlayback(v5, v6);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No or empty user agent received from CFNetwork",  v10,  2u);
    }
  }
}

- (void)addServiceIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem priceType](self, "priceType"));
    uint64_t v6 = MTEpisodePriceTypeFromPersistentString();

    v7 = @".external";
    if (v6 == 3) {
      v7 = @".hosted";
    }
    if (v6 == 2) {
      uint64_t v8 = @".hosted.subscription";
    }
    else {
      uint64_t v8 = v7;
    }
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([@"app.podcasts.episode" stringByAppendingString:v8]);
    -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  v9,  AVURLAssetAlternativeConfigurationServiceIdentifierKey);
    [v4 setObject:v10 forKey:AVURLAssetAlternativeConfigurationOptionsKey];
  }

- (id)defaultAssetOptions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAVAssetCache sharedInstance](&OBJC_CLASS___MTAVAssetCache, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetCache]);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, AVURLAssetCacheKey);

  -[MTPlayerItem addServiceIdentifier:](self, "addServiceIdentifier:", v3);
  -[MTPlayerItem addUserAgent:](self, "addUserAgent:", v3);
  return v3;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  -[MTPlayerItem setAsset:](&v22, "setAsset:", v4);
  id v5 = -[MTPlayerItem cleanupItem](self, "cleanupItem");
  if (v4)
  {
    uint64_t v7 = _MTLogCategoryPlayback(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set asset URL to: %@", buf, 0xCu);
    }

    if (+[MTStoreIdentifier isNotEmpty:]( &OBJC_CLASS___MTStoreIdentifier,  "isNotEmpty:",  -[MTPlayerItem episodeStoreId](self, "episodeStoreId")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
      if ([v13 isHLSPlaylist])
      {
      }

      else
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URL]);
        unsigned int v16 = [v15 isPackagedMedia];

        if (!v16) {
          goto LABEL_15;
        }
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[PFFairPlayRolloutController sharedInstance]( &OBJC_CLASS___PFFairPlayRolloutController,  "sharedInstance"));
      unsigned int v18 = [v17 isEnabled];

      uint64_t v19 = _MTLogCategoryDRM();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Fetching keys using ICContentKeySession",  buf,  2u);
        }

        -[MTPlayerItem prepareAssetForFairPlayPlayback:](self, "prepareAssetForFairPlayPlayback:", v4);
      }

      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Fetching keys using IMAVSecureKeyLoader",  buf,  2u);
        }

        -[MTPlayerItem prepareAssetForFairPlayPlayback_legacy:](self, "prepareAssetForFairPlayPlayback_legacy:", v4);
      }
    }
  }

- (void)prepareAssetForFairPlayPlayback:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend( [PFFairPlayAsset alloc],  "initWithAdamID:avAsset:",  -[MTPlayerItem episodeStoreId](self, "episodeStoreId"),  v4);
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeyLoader](self, "fairPlayKeyLoader"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011D90;
  v8[3] = &unk_100240468;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 createSessionWithAsset:v5 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prepareAssetForFairPlayPlayback_legacy:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = -[MTPlayerItem episodeStoreId](self, "episodeStoreId");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
    *(_DWORD *)buf = 134218242;
    id v27 = v8;
    __int16 v28 = 2112;
    v29 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Creating secure key loader for episode %lld asset URL: %@",  buf,  0x16u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___IMAVSecureKeyLoader);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeAccount]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem storeResponseDelegate](self, "storeResponseDelegate"));
  id v16 = [v12 initWithRecipient:v4 useCase:0 account:v14 urlProtocolDelegate:v15];

  -[MTPlayerItem setSecureKeyLoader:](self, "setSecureKeyLoader:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  [v17 setDelegate:self];

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  -[MTPlayerItem episodeStoreId](self, "episodeStoreId")));
  uint64_t v19 = _MTLogCategoryDRM();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = -[MTPlayerItem episodeStoreId](self, "episodeStoreId");
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 URL]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 absoluteString]);
    *(_DWORD *)buf = 134218242;
    id v27 = v21;
    __int16 v28 = 2112;
    v29 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[Key Loading] Starting from MTPlayerItem for episode adam id %lld, asset URL: %@",  buf,  0x16u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  [v25 startKeyLoadingProcessWithKeyIdentifier:0 contentAdamId:v18 isRenewal:0 completion:0];
}

- (id)createAssetForUrl:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Creating asset for url: %@",  (uint8_t *)&v11,  0xCu);
  }

  if (v4)
  {
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MTPlayerItem assetForRemoteFile:](self, "assetForRemoteFile:", v4));
    }
    id v9 = (void *)v8;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)assetForLocalFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AVURLAsset);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem defaultAssetOptions](self, "defaultAssetOptions"));
  id v7 = -[AVURLAsset initWithURL:options:](v5, "initWithURL:options:", v4, v6);

  return v7;
}

- (id)assetForRemoteFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem defaultAssetOptions](self, "defaultAssetOptions"));
  id v6 = [v5 mutableCopy];

  id v7 = [[PFMediaStreamedAssetCache alloc] initWithSourceURL:v4];
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 cachedAssetURL]);
  id v10 = (void *)v8;
  if (v8)
  {
    uint64_t v11 = _MTLogCategoryPlayback(v8, v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Found media in stream cache", buf, 2u);
    }

    v13 = (AVURLAsset *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem assetForLocalFile:](self, "assetForLocalFile:", v10));
    id v14 = 0LL;
  }

  else
  {
    id v28 = 0LL;
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 streamCacheURLAndReturnError:&v28]);
    id v14 = v28;
    uint64_t v17 = _MTLogCategoryPlayback(v14, v16);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    v25 = (void *)v15;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Setting stream cache location to %@",  buf,  0xCu);
      }

      [v6 setObject:v15 forKey:AVURLAssetDownloadDestinationURLKey];
    }

    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = (uint64_t)v14;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Error retrieving file url for stream cache: %@",  buf,  0xCu);
      }
    }

    v13 = -[AVURLAsset initWithURL:options:](objc_alloc(&OBJC_CLASS___AVURLAsset), "initWithURL:options:", v4, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v21 = AVURLAssetDownloadCompleteSuccessNotification;
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100012644;
    v26[3] = &unk_100240490;
    id v27 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 addObserverForName:v21 object:v13 queue:v22 usingBlock:v26]);
    -[MTPlayerItem setStreamCacheObserverToken:](self, "setStreamCacheObserverToken:", v23);
  }

  return v13;
}

- (id)episode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  if ([v3 length])
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeObjectID](self, "episodeObjectID"));

    if (!v4) {
      return 0LL;
    }
  }

  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100012898;
  unsigned int v18 = sub_1000128A8;
  id v19 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000128B0;
  v10[3] = &unk_1002404B8;
  v13 = &v14;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)isPlayable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetURL]);
    -[MTPlayerItem reportIfLocalAssetHasiPodLibraryURL:](self, "reportIfLocalAssetHasiPodLibraryURL:", v5);

    id v6 = [v4 reasonForNotPlayable];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = _MTLogCategoryPlayback(v6, v7);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        int v20 = 138413058;
        uint64_t v21 = v11;
        __int16 v22 = 2114;
        v23 = v12;
        __int16 v24 = 2048;
        id v25 = [v4 storeTrackId];
        __int16 v26 = 2050;
        id v27 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "MTPlayerItem not playable %@ - %{public}@ - %lld with reason %{public}lu",  (uint8_t *)&v20,  0x2Au);
      }

- (void)reportIfLocalAssetHasiPodLibraryURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v9 = v4;
    unsigned int v6 = [v4 hasPrefix:@"ipod-library"];
    uint64_t v5 = v9;
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:]( &OBJC_CLASS___PFAnalyticsEvent,  "downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:",  @"PlaybackValidation",  v9,  0LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem analyticsChannel](self, "analyticsChannel"));
      [v8 sendEvent:v7];

      uint64_t v5 = v9;
    }
  }
}

- (BOOL)needsNetworkToPlayButNoNetwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  id v3 = v2;
  if (v2 && [v2 reasonForNotPlayable] != (id)2)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    unsigned int v5 = [v4 isReachable] ^ 1;
  }

  return v5;
}

- (id)podcastShareUrl
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  id v3 = -[MTPlayerItem podcastShareUrl](&v18, "podcastShareUrl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
    id v5 = -[MTPlayerItem podcastShareUrl](&v17, "podcastShareUrl");
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v11 = 0LL;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    unsigned __int8 v14 = sub_100012898;
    uint64_t v15 = sub_1000128A8;
    id v16 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100012CF8;
    v10[3] = &unk_1002404E0;
    void v10[4] = self;
    v10[5] = &v11;
    [v8 performBlockAndWait:v10];

    id v9 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    return v9;
  }

- (BOOL)supportsArtworkUrl
{
  return 0;
}

- (void)setManifestIndex:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  -[MTPlayerItem setManifestIndex:](&v3, "setManifestIndex:", a3);
}

- (BOOL)notifyUserIsNotPlayable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = [v2 reasonForNotPlayable];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](&OBJC_CLASS___MTEpisodeUnavailableUtil, "sharedInstance"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 podcast]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    unsigned __int8 v8 = [v5 showDialogForReason:v4 podcastTitle:v7 completion:0];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    unsigned __int8 v8 = [v5 showInternetUnreachableDialog];
  }

  return v8;
}

- (id)subtitle
{
  objc_super v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem album](self, "album"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitleStringForArtist:v4 album:v5]);

  return v6;
}

- (void)setAreChaptersLoaded:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  -[MTPlayerItem setAreChaptersLoaded:](&v3, "setAreChaptersLoaded:", a3);
}

- (int64_t)mpItemType
{
  else {
    return 1LL;
  }
}

- (void)invalidateAsset
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 debugDescription]);

  uint64_t v7 = _MTLogCategoryPlayback(v5, v6);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "invalidate asset start: %@",  (uint8_t *)&buf,  0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  -[MTPlayerItem invalidateAsset](&v25, "invalidateAsset");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  unsigned int v10 = -[MTPlayerItem isLocal](self, "isLocal");
  char v11 = v10;
  if (v10 && (id v12 = [v9 isDownloaded], (_DWORD)v12))
  {
    uint64_t v14 = _MTLogCategoryPlayback(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "invalidate asset is local and still downloaded. invalidate asset finished: %@",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = sub_100012898;
    v31 = sub_1000128A8;
    id v32 = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000131DC;
    v21[3] = &unk_100240508;
    char v24 = v11;
    id v22 = v9;
    p___int128 buf = &buf;
    -[os_log_s performBlockAndWait:](v15, "performBlockAndWait:", v21);
    if ([*(id *)(*((void *)&buf + 1) + 40) length])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  *(void *)(*((void *)&buf + 1) + 40LL)));
      id v17 = -[MTPlayerItem setUrl:](self, "setUrl:", v16);
      uint64_t v19 = _MTLogCategoryPlayback(v17, v18);
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v26 = 138412290;
        id v27 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "invalidate asset in theory we invalidated asset: %@.",  v26,  0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
}

- (BOOL)upgradeToAlternatePaidVersionIfNeeded
{
  uint64_t v3 = (uint64_t)-[MTPlayerItem channelStoreId](self, "channelStoreId");
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000135E8;
  v36[3] = &unk_100240530;
  id v7 = v6;
  id v37 = v7;
  v38 = &v40;
  uint64_t v39 = v4;
  [v7 performBlockAndWait:v36];
  if (*((_BYTE *)v41 + 24))
  {
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_100012898;
    v34 = sub_1000128A8;
    id v35 = 0LL;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem alternatePaidURL](self, "alternatePaidURL"));

    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MTPlayerItem alternatePaidURL](self, "alternatePaidURL"));
      unsigned int v10 = (void *)v31[5];
      v31[5] = v9;
    }

    if (!v31[5])
    {
      char v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
      id v12 = [v11 length];

      if (v12)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainOrPrivateContext]);

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100013634;
        v26[3] = &unk_100240558;
        id v15 = v14;
        id v27 = v15;
        id v28 = self;
        uint64_t v29 = &v30;
        [v15 performBlockAndWait:v26];
      }
    }

    id v16 = (void *)v31[5];
    if (v16
      && (id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem url](self, "url")),
          unsigned __int8 v18 = [v16 isEqual:v17],
          v17,
          (v18 & 1) == 0))
    {
      uint64_t v22 = _MTLogCategoryPlayback(v19, v20);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "We have found an alternate paid version and have upgraded the player item",  (uint8_t *)v25,  2u);
      }

      -[MTPlayerItem setUrl:](self, "setUrl:", v31[5]);
      BOOL v21 = 1;
    }

    else
    {
      BOOL v21 = 0;
    }

    _Block_object_dispose(&v30, 8);
  }

  else
  {
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v40, 8);
  return v21;
}

- (void)upgradeToLocalEpisodeBackedItemWithEpisodeUUID:(id)a3 podcastUUID:(id)a4
{
  id v6 = a3;
  -[MTPlayerItem setPodcastUuid:](self, "setPodcastUuid:", a4);
  -[MTPlayerItem setEpisodeUuid:](self, "setEpisodeUuid:", v6);

  -[MTPlayerItem updateContentItem](self, "updateContentItem");
}

- (id)fetchArtworkItemProviderForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSItemProvider);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([UTTypePNG identifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000137AC;
  v9[3] = &unk_1002405D0;
  v9[4] = self;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  -[NSItemProvider registerItemForTypeIdentifier:loadHandler:](v6, "registerItemForTypeIdentifier:loadHandler:", v7, v9);

  return v6;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](&OBJC_CLASS___PUIObjCArtworkProvider, "shared"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100013B08;
    v24[3] = &unk_100240620;
    id v25 = v7;
    objc_msgSend(v8, "artworkForShow:size:completionHandler:", v10, v24, width, height);

    char v11 = v25;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100013BA8;
      v22[3] = &unk_100240620;
      id v23 = v7;
      objc_msgSend(v8, "artworkForURL:withSize:completionHandler:", v14, v22, width, height);

      char v11 = v23;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkCatalog](self, "artworkCatalog"));

      if (!v15)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](&OBJC_CLASS___UIImage, "defaultPodcastArtwork"));
        (*((void (**)(id, void *))v7 + 2))(v7, v17);

        goto LABEL_8;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkCatalog](self, "artworkCatalog"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100013C48;
      v18[3] = &unk_100240648;
      id v19 = v7;
      double v20 = width;
      double v21 = height;
      [v16 requestImageWithCompletionHandler:v18];

      char v11 = v19;
    }
  }

LABEL_8:
}

- (id)externalMetadata
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  id v3 = -[MTPlayerItem externalMetadata](&v39, "externalMetadata");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100012898;
  id v37 = sub_1000128A8;
  id v38 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem itemDescription](self, "itemDescription"));
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_100012898;
  v31 = sub_1000128A8;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  char v24 = sub_100012898;
  id v25 = sub_1000128A8;
  id v26 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100013F9C;
    v15[3] = &unk_100240670;
    id v9 = v8;
    id v16 = v9;
    id v17 = self;
    unsigned __int8 v18 = &v33;
    id v19 = &v27;
    double v20 = &v21;
    [v9 performBlockAndWait:v15];
  }

  if ([(id)v34[5] length])
  {
    unsigned int v10 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
    -[AVMutableMetadataItem setIdentifier:](v10, "setIdentifier:", AVMetadataCommonIdentifierDescription);
    -[AVMutableMetadataItem setExtendedLanguageTag:]( v10,  "setExtendedLanguageTag:",  IMAVMetadataItemExtendedLanguageTag);
    -[AVMutableMetadataItem setValue:](v10, "setValue:", v34[5]);
    [v4 addObject:v10];
  }

  if (v28[5])
  {
    char v11 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
    -[AVMutableMetadataItem setIdentifier:](v11, "setIdentifier:", AVKitMetadataIdentifierReleaseDate);
    -[AVMutableMetadataItem setExtendedLanguageTag:]( v11,  "setExtendedLanguageTag:",  IMAVMetadataItemExtendedLanguageTag);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v28[5] verboseDisplayString]);
    -[AVMutableMetadataItem setValue:](v11, "setValue:", v12);

    [v4 addObject:v11];
  }

  if ([(id)v22[5] length])
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
    -[AVMutableMetadataItem setIdentifier:](v13, "setIdentifier:", AVMetadataIdentifieriTunesMetadataContentRating);
    -[AVMutableMetadataItem setExtendedLanguageTag:]( v13,  "setExtendedLanguageTag:",  IMAVMetadataItemExtendedLanguageTag);
    -[AVMutableMetadataItem setValue:](v13, "setValue:", v22[5]);
    [v4 addObject:v13];
  }

  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v4;
}

- (id)contentItemIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem instanceIdentifier](self, "instanceIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (id)artworkIdentifier
{
  if (-[MTPlayerItem supportsChapterArtwork](self, "supportsChapterArtwork")
    || -[MTPlayerItem supportsEpisodeArtwork](self, "supportsEpisodeArtwork"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _episodeArtworkIdentifier](self, "_episodeArtworkIdentifier"));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _podcastArtworkIdentifier](self, "_podcastArtworkIdentifier"));
  }

  return v3;
}

- (BOOL)supportsChapterArtwork
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem metadataChapters](self, "metadataChapters"));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)supportsEpisodeArtwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeArtworkProperties](self, "episodeArtworkProperties"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)_podcastArtworkIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 absoluteString]);
    unsigned __int8 v8 = (void *)v7;
    id v9 = (void *)kMTLibraryDefaultImageKey;
    if (v7) {
      id v9 = (void *)v7;
    }
    id v5 = v9;
  }

  return v5;
}

- (id)_episodeArtworkIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _podcastArtworkIdentifier](self, "_podcastArtworkIdentifier"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));
  }
  uint64_t v7 = v6;

  if ([v7 length]) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v7));
  }
  else {
    id v8 = v3;
  }
  id v9 = v8;

  return v9;
}

- (void)updateActivity:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTPlayerItem;
  id v4 = a3;
  -[MTPlayerItem updateActivity:](&v7, "updateActivity:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid", v7.receiver, v7.super_class));
  [v4 setItemIdentifier:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastFeedUrl](self, "podcastFeedUrl"));
  [v4 setContainerIdentifier:v6];
}

+ (id)subtitleStringForArtist:(id)a3 album:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 length];
  id v8 = [v6 length];
  if (v7 && v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"NOWPLAYING_PODCAST_ARTIST_FORMAT" value:&stru_100248948 table:0]);
    char v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v5, v6));
  }

  else
  {
    if (v7)
    {
      id v12 = (__CFString *)v5;
    }

    else
    {
      if (!v8)
      {
        char v11 = &stru_100248948;
        goto LABEL_9;
      }

      id v12 = (__CFString *)v6;
    }

    char v11 = v12;
  }

+ (id)subtitleStringForEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100012898;
  uint64_t v23 = sub_1000128A8;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100012898;
  id v17 = sub_1000128A8;
  id v18 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000145B4;
  v9[3] = &unk_100240698;
  char v11 = &v19;
  id v6 = v4;
  id v10 = v6;
  id v12 = &v13;
  [v5 performBlockAndWait:v9];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 subtitleStringForArtist:v20[5] album:v14[5]]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)contentKeyRequestDidFailWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
    int v10 = 138412546;
    char v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Content Key Request failed for episode %@ with error: %@",  (uint8_t *)&v10,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  [v9 invalidateAndCancel];

  -[MTPlayerItem setSecureKeyLoader:](self, "setSecureKeyLoader:", 0LL);
  -[MTPlayerItem invalidateAsset](self, "invalidateAsset");
}

- (id)metricsContentIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (+[MTStoreIdentifier isNotEmpty:]( &OBJC_CLASS___MTStoreIdentifier,  "isNotEmpty:",  -[MTPlayerItem episodeStoreId](self, "episodeStoreId")))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  -[MTPlayerItem episodeStoreId](self, "episodeStoreId")));
    [v3 setObject:v4 forKeyedSubscript:@"adamId"];
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));
    [v3 setObject:v6 forKeyedSubscript:@"guid"];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem title](self, "title"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem title](self, "title"));
    [v3 setObject:v8 forKeyedSubscript:@"title"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));
    [v3 setObject:v10 forKeyedSubscript:@"podcast"];
  }

  return v3;
}

- (NSString)storeReportingParams
{
  return self->_storeReportingParams;
}

- (void)setStoreReportingParams:(id)a3
{
}

- (_TtC10PodcastsUI23UIStoreResponseDelegate)storeResponseDelegate
{
  return self->_storeResponseDelegate;
}

- (void)setStoreResponseDelegate:(id)a3
{
}

- (PFAnalyticsChannel)analyticsChannel
{
  return self->_analyticsChannel;
}

- (void)setAnalyticsChannel:(id)a3
{
}

- (PFFairPlayKeyLoading)fairPlayKeyLoader
{
  return self->_fairPlayKeyLoader;
}

- (void)setFairPlayKeyLoader:(id)a3
{
}

- (PFFairPlayKeySession)fairPlayKeySession
{
  return self->_fairPlayKeySession;
}

- (void)setFairPlayKeySession:(id)a3
{
}

- (NSObject)streamCacheObserverToken
{
  return self->_streamCacheObserverToken;
}

- (void)setStreamCacheObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithPlayerItem:]( &OBJC_CLASS___MTEpisodeIdentifier,  "identifierWithPlayerItem:",  self);
}

- (MTPlayerItem)initWithPodcastEpisode:(id)a3 podcast:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  MTPlayerItem.init(podcastEpisode:podcast:)(v5, a4);
  return result;
}

@end