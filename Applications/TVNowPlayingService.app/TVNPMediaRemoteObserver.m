@interface TVNPMediaRemoteObserver
- (TVNPMediaRemoteObserver)init;
- (TVNPMetadataPlayer)player;
- (void)_deregisterAsObserver;
- (void)_nowPlayingInfoDidChange:(id)a3;
- (void)_registerAsObserver;
- (void)_updateMediaItemMetadata:(id)a3 routeConnection:(id)a4;
- (void)_updateTimeStampFromAirtunesd:(id)a3;
- (void)metadataPlayerSentCommand:(unsigned int)a3 withOptions:(id)a4;
- (void)prepareForPlayback;
- (void)prepareForPlaybackWithEndpoint:(id)a3;
- (void)reset;
- (void)setPlayer:(id)a3;
@end

@implementation TVNPMediaRemoteObserver

- (TVNPMediaRemoteObserver)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVNPMediaRemoteObserver;
  v6 = -[TVNPMediaRemoteObserver init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVNPDataImageLoader);
    imageLoader = v9->_imageLoader;
    v9->_imageLoader = v2;
  }

  v5 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)prepareForPlayback
{
  id v3 =  +[MPAVRoutingController systemRouteWithContextUID:]( &OBJC_CLASS___MPAVRoutingController,  "systemRouteWithContextUID:",  0LL);
  -[TVNPMediaRemoteObserver prepareForPlaybackWithEndpoint:](self, "prepareForPlaybackWithEndpoint:");
}

- (void)prepareForPlaybackWithEndpoint:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = -[TVNPMetadataPlayer initWithName:]( objc_alloc(&OBJC_CLASS___TVNPMetadataPlayer),  "initWithName:",  @"TVNPMetadataPlayer");
  [v20 setCommandDelegate:v22];
  id v19 = objc_alloc_init(&OBJC_CLASS___TVNPMediaItem);
  v10 = objc_alloc(&OBJC_CLASS___TVPPlaylist);
  id v23 = v19;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL);
  id v18 = -[TVPPlaylist initWithMediaItems:index:isCollection:](v10, "initWithMediaItems:index:isCollection:");

  [v20 setPlaylist:v18];
  -[TVNPMediaRemoteObserver setPlayer:](v22, "setPlayer:", v20);
  -[TVNPMediaRemoteObserver _registerAsObserver](v22, "_registerAsObserver");
  SEL v8 = objc_alloc(&OBJC_CLASS___TVNPEndpointRouteConnection);
  objc_super v7 = -[TVNPEndpointRouteConnection initWithRoute:](v8, "initWithRoute:", location[0]);
  routeConnection = v22->_routeConnection;
  v22->_routeConnection = v7;

  objc_initWeak(&from, v22);
  v6 = v22->_routeConnection;
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_10003459C;
  v15 = &unk_100058860;
  objc_copyWeak(&v16, &from);
  v4 = (NSCopying *) -[TVNPEndpointRouteConnection registerMetadataUpdateHandler:]( v6,  "registerMetadataUpdateHandler:",  &v11);
  routeConnectionObserverToken = v22->_routeConnectionObserverToken;
  v22->_routeConnectionObserverToken = v4;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)reset
{
}

- (void)setPlayer:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_player)
  {
    -[TVNPMetadataPlayer invalidate](v4->_player, "invalidate");
    objc_storeStrong((id *)&v4->_player, location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)metadataPlayerSentCommand:(unsigned int)a3 withOptions:(id)a4
{
  objc_super v7 = self;
  SEL v6 = a2;
  unsigned int v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  -[TVNPEndpointRouteConnection sendCommand:options:](v7->_routeConnection, "sendCommand:options:", v5, location);
  objc_storeStrong(&location, 0LL);
}

- (void)_nowPlayingInfoDidChange:(id)a3
{
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v45 = v47->_routeConnection;
  id v44 = [v45 contentItemIdentifier];
  *(void *)&v43[1] = 0LL;
  unsigned __int8 v3 = [v44 isEqual:v47->_lastTrackIdentifier];
  *(void *)v43 = (v3 ^ 1) & 1;
  if (((v3 ^ 1) & 1) != 0)
  {
    objc_storeStrong((id *)&v47->_lastTrackIdentifier, v44);
    v4 = objc_alloc_init(&OBJC_CLASS___TVNPMediaItem);
    unsigned int v5 = *(void **)&v43[1];
    *(void *)&v43[1] = v4;

    [*(id *)&v43[1] setImageLoader:v47->_imageLoader];
  }

  else
  {
    SEL v6 = -[TVNPMetadataPlayer currentMediaItem](v47->_player, "currentMediaItem");
    objc_super v7 = *(void **)&v43[1];
    *(void *)&v43[1] = v6;
  }

  id v34 = [v45 bundleID];
  unsigned __int8 v8 = [v34 isEqualToString:@"airtunesd"];
  v47->_airtunesIsPlaying = v8 & 1;

  -[TVNPMediaRemoteObserver _updateMediaItemMetadata:routeConnection:]( v47,  "_updateMediaItemMetadata:routeConnection:",  *(void *)&v43[1],  v45);
  if ((v43[0] & 1) != 0)
  {
    v33 = -[TVNPMediaRemoteObserver player](v47, "player");
    -[TVNPMetadataPlayer setCurrentMediaItem:](v33, "setCurrentMediaItem:", *(void *)&v43[1]);
  }

  [v45 duration];
  double v42 = v9;
  [v45 elapsedTime];
  double v41 = v10;
  [v45 lastUpdate];
  id v40 =  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
  if (v47->_airtunesIsPlaying && v47->_airtunesTimeData)
  {
    v39 = v47->_airtunesTimeData;
    id v31 = -[NSDictionary tvs_numberForKey:](v39, "tvs_numberForKey:", kMRMediaRemoteNowPlayingInfoDuration);
    [v31 doubleValue];
    double v42 = v11;

    id v32 = -[NSDictionary tvs_numberForKey:](v39, "tvs_numberForKey:", kMRMediaRemoteNowPlayingInfoElapsedTime);
    [v32 doubleValue];
    double v41 = v12;

    id v13 = -[NSDictionary tvs_dateForKey:](v39, "tvs_dateForKey:", kMRMediaRemoteNowPlayingInfoTimestamp);
    id v14 = v40;
    id v40 = v13;

    objc_storeStrong((id *)&v39, 0LL);
  }

  v29 = -[TVNPMediaRemoteObserver player](v47, "player");
  -[TVNPMetadataPlayer setDuration:](v29, "setDuration:", v42);

  v30 = -[TVNPMediaRemoteObserver player](v47, "player");
  -[TVNPMetadataPlayer setLastElapsedTime:atTimestamp:](v30, "setLastElapsedTime:atTimestamp:", v40, v41);

  [v45 defaultPlaybackRate];
  float v38 = v15;
  if (v15 <= 0.0) {
    double v28 = 1.0;
  }
  else {
    double v28 = v38;
  }
  float v16 = v28;
  float v38 = v16;
  v27 = -[TVNPMediaRemoteObserver player](v47, "player");
  -[TVNPMetadataPlayer setRateUsedForPlayback:](v27, "setRateUsedForPlayback:", v38);

  id v37 = [v45 playbackState];
  [v45 rate];
  double v36 = v17;
  id v35 = 0LL;
  if ((unint64_t)v37 <= 6) {
    __asm { BR              X8 }
  }

  id v18 = +[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing");
  id v19 = v35;
  id v35 = v18;

  double v20 = v36;
  if (v36 >= 0.0 && (double v20 = v36, v36 <= v38))
  {
    double v23 = v36;
    if (v36 == 0.0)
    {
      id v24 = +[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused", v36);
      id v25 = v35;
      id v35 = v24;
    }
  }

  else
  {
    id v21 = +[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning", v20);
    id v22 = v35;
    id v35 = v21;
  }

  v26 = -[TVNPMediaRemoteObserver player](v47, "player", v23);
  -[TVNPMetadataPlayer setState:](v26, "setState:", v35);

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong((id *)&v43[1], 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_registerAsObserver
{
  if (!self->_isObserving)
  {
    v2 =  +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter");
    -[NSDistributedNotificationCenter addObserver:selector:name:object:]( v2,  "addObserver:selector:name:object:",  self,  "_updateTimeStampFromAirtunesd:",  @"TVAirPlayTimeNotificationName",  0LL);
  }

  self->_isObserving = 1;
}

- (void)_deregisterAsObserver
{
  if (self->_isObserving)
  {
    v2 =  +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter");
    -[NSDistributedNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  self,  @"TVAirPlayTimeNotificationName",  0LL);
  }

  self->_isObserving = 0;
}

- (void)_updateMediaItemMetadata:(id)a3 routeConnection:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v40 = 0LL;
  objc_storeStrong(&v40, a4);
  id v39 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  id v34 = sub_100035214;
  id v35 = &unk_100059528;
  id v36 = location[0];
  id v37 = v39;
  id v38 = objc_retainBlock(&v31);
  objc_super v7 = (void (**)(id, void))v38;
  uint64_t v6 = TVPMediaItemMetadataAlbum;
  id v8 = [v40 album];
  v7[2](v7, v6);

  double v10 = (void (**)(id, void))v38;
  uint64_t v9 = TVPMediaItemMetadataArtist;
  id v11 = [v40 artist];
  v10[2](v10, v9);

  id v13 = (void (**)(id, void))v38;
  uint64_t v12 = TVPMediaItemMetadataTitle;
  id v14 = [v40 title];
  v13[2](v13, v12);

  float v16 = (void (**)(id, void))v38;
  uint64_t v15 = TVPMediaItemMetadataTrackNumber;
  id v17 = [v40 trackNumber];
  v16[2](v16, v15);

  id v19 = (void (**)(id, void))v38;
  uint64_t v18 = TVPMediaItemMetadataTotalTrackCount;
  id v20 = [v40 totalNumberOfTracks];
  v19[2](v19, v18);

  id v22 = (void (**)(id, void))v38;
  uint64_t v21 = TVPMediaItemMetadataMPArtworkCatalog;
  id v23 = [v40 artworkCatalog];
  v22[2](v22, v21);

  if ([v39 count])
  {
    id v4 = location[0];
    id v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    v27 = sub_1000353F4;
    double v28 = &unk_100058D38;
    id v29 = v39;
    id v30 = location[0];
    [v4 performMediaItemMetadataTransactionWithBlock:&v24];
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateTimeStampFromAirtunesd:(id)a3
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] userInfo];
  unsigned __int8 v3 = (NSDictionary *)[v5 copy];
  airtunesTimeData = v9->_airtunesTimeData;
  v9->_airtunesTimeData = v3;

  uint64_t v6 = v9;
  objc_super v7 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"elapsedTime");
  -[TVNPMediaRemoteObserver _nowPlayingInfoDidChange:](v6, "_nowPlayingInfoDidChange:");

  objc_storeStrong(location, 0LL);
}

- (TVNPMetadataPlayer)player
{
  return self->_player;
}

- (void).cxx_destruct
{
}

@end