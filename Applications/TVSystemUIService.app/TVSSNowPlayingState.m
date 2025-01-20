@interface TVSSNowPlayingState
+ (id)_makeMediaItemMetadataWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)nowPlayingAppBundleIdentifier;
- (TVSSNowPlayingMediaItem)currentMediaItem;
- (TVSSNowPlayingState)init;
- (double)playbackRate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)playbackState;
- (void)_updateWithPlayerResponse:(id)a3 playerResponseItem:(id)a4 isPodcast:(BOOL)a5;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSNowPlayingState

- (TVSSNowPlayingState)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingState;
  v8 = -[TVSSNowPlayingState init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    +[MPArtworkCatalog setCacheLimit:forCacheIdentifier:cacheReference:]( &OBJC_CLASS___MPArtworkCatalog,  "setCacheLimit:forCacheIdentifier:cacheReference:");
    v2 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v8->_observers;
    v8->_observers = v2;

    v8->_playbackState = 1LL;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)addObserver:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingStateObserverUserInfo);
  if ((objc_opt_respondsToSelector(location[0], "nowPlayingState:currentMediaItemDidChange:") & 1) != 0) {
    -[TVSSNowPlayingStateObserverUserInfo setRespondsToCurrentMediaItemDidChange:]( v5,  "setRespondsToCurrentMediaItemDidChange:",  1LL);
  }
  if ((objc_opt_respondsToSelector(location[0], "nowPlayingState:playbackRateDidChange:") & 1) != 0) {
    -[TVSSNowPlayingStateObserverUserInfo setRespondsToPlaybackRateDidChange:]( v5,  "setRespondsToPlaybackRateDidChange:",  1LL);
  }
  if ((objc_opt_respondsToSelector(location[0], "nowPlayingState:playbackStateDidChange:") & 1) != 0) {
    -[TVSSNowPlayingStateObserverUserInfo setRespondsToPlaybackStateDidChange:]( v5,  "setRespondsToPlaybackStateDidChange:",  1LL);
  }
  if ((objc_opt_respondsToSelector(location[0], "syncTimingForNowPlayingState:") & 1) != 0) {
    -[TVSSNowPlayingStateObserverUserInfo setRespondsToSyncTiming:](v5, "setRespondsToSyncTiming:", 1LL);
  }
  id v3 = -[TVSObserverSet addObserver:userInfo:](v7->_observers, "addObserver:userInfo:", location[0], v5, &v5);
  objc_storeStrong(v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSObserverSet removeObserver:](v4->_observers, "removeObserver:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_updateWithPlayerResponse:(id)a3 playerResponseItem:(id)a4 isPodcast:(BOOL)a5
{
  v72 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v70 = 0LL;
  objc_storeStrong(&v70, a4);
  BOOL v69 = a5;
  BOOL v66 = 0;
  id v65 = 0LL;
  id v64 = 0LL;
  if (location[0] && v70)
  {
    uint64_t v68 = TVSSPlaybackStateFromMPCPlayerState((unint64_t)[location[0] state]);
    if (v70) {
      [v70 duration];
    }
    else {
      memset(&v63[1], 0, 0x38uLL);
    }
    double v67 = *(float *)&v63[6];
    v5 = (void *)objc_opt_class(v72);
    v63[0] = [v5 _makeMediaItemMetadataWithPlayerResponseItem:v70 isPodcast:v69];
    id v62 = [v63[0] identifier];
    objc_storeStrong(&v65, v72->_currentMediaItem);
    BOOL v6 = v72->_currentMediaItem == 0LL;
    char v60 = 0;
    LOBYTE(v23) = 1;
    if (!v6)
    {
      v61 = -[TVSSNowPlayingMediaItem identifier](v72->_currentMediaItem, "identifier");
      char v60 = 1;
      unsigned int v23 = objc_msgSend(v62, "isEqualToString:") ^ 1;
    }

    if ((v60 & 1) != 0) {

    }
    if ((v23 & 1) != 0)
    {
      SEL v7 = objc_alloc(&OBJC_CLASS___TVSSNowPlayingMediaItem);
      id v8 = -[TVSSNowPlayingMediaItem _initWithMetadata:artworkCacheIdentifier:artworkCacheReference:]( v7,  "_initWithMetadata:artworkCacheIdentifier:artworkCacheReference:",  v63[0],  off_10021EDC8,  v72);
      id v9 = v65;
      id v65 = v8;

      id v59 = NowPlayingStateLog();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v59;
        os_log_type_t v21 = type;
        id v22 = [v65 succinctDescription];
        id v57 = v22;
        sub_100025AE4( (uint64_t)v75,  (uint64_t)"-[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]",  (uint64_t)v57);
        _os_log_impl( (void *)&_mh_execute_header,  log,  v21,  "%s: Current media item has changed. currentMediaItem=%@",  v75,  0x16u);

        objc_storeStrong(&v57, 0LL);
      }

      objc_storeStrong(&v59, 0LL);
    }

    else
    {
      -[TVSSNowPlayingMediaItem elapsedTime](v72->_currentMediaItem, "elapsedTime");
      unint64_t v56 = llround(v10);
      [v63[0] elapsedTime];
      unint64_t v55 = llround(v11);
      BOOL v66 = v56 != v55;
      -[TVSSNowPlayingMediaItem _updateWithMetadata:](v72->_currentMediaItem, "_updateWithMetadata:", v63[0]);
    }

    id v19 = [location[0] playerPath];
    id v12 = [v19 bundleID];
    id v13 = v64;
    id v64 = v12;

    objc_storeStrong(&v62, 0LL);
    objc_storeStrong(v63, 0LL);
  }

  else
  {
    objc_storeStrong(&v65, 0LL);
    uint64_t v68 = 1LL;
    double v67 = 0.0;
  }

  id v54 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (v72->_playbackState != v68) {
    [v54 addObject:@"playbackState"];
  }
  if (v72->_playbackRate != v67) {
    [v54 addObject:@"playbackRate"];
  }
  if (v72->_currentMediaItem != v65) {
    [v54 addObject:@"currentMediaItem"];
  }
  if (v72->_nowPlayingAppBundleIdentifier != v64
    && (-[NSString isEqual:](v72->_nowPlayingAppBundleIdentifier, "isEqual:", v64) & 1) == 0)
  {
    [v54 addObject:@"nowPlayingAppBundleIdentifier"];
  }

  v72->_playbackState = v68;
  v72->_playbackRate = v67;
  objc_storeStrong((id *)&v72->_currentMediaItem, v65);
  objc_storeStrong((id *)&v72->_nowPlayingAppBundleIdentifier, v64);
  if ([v54 count])
  {
    id v53 = NowPlayingStateLog();
    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
    {
      sub_100025B38( (uint64_t)v74,  (uint64_t)"-[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]",  (uint64_t)v54,  (uint64_t)v72);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v53,  v52,  "%s: Now playing state has changed. changedKeys=%{public}@, state=%@",  v74,  0x20u);
    }

    objc_storeStrong(&v53, 0LL);
    if ([v54 containsObject:@"playbackState"])
    {
      observers = v72->_observers;
      v46 = _NSConcreteStackBlock;
      int v47 = -1073741824;
      int v48 = 0;
      v49 = sub_100025BA8;
      v50 = &unk_1001B6738;
      v51[0] = v72;
      v51[1] = (id)v68;
      -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v46);
      objc_storeStrong(v51, 0LL);
    }

    if ([v54 containsObject:@"playbackRate"])
    {
      v17 = v72->_observers;
      v40 = _NSConcreteStackBlock;
      int v41 = -1073741824;
      int v42 = 0;
      v43 = sub_100025D68;
      v44 = &unk_1001B6738;
      v45[0] = v72;
      v45[1] = *(id *)&v67;
      -[TVSObserverSet enumerateObserversUsingBlock:](v17, "enumerateObserversUsingBlock:", &v40);
      objc_storeStrong(v45, 0LL);
    }

    unsigned __int8 v16 = 1;
    if ((v16 & 1) != 0)
    {
      v15 = v72->_observers;
      v33 = _NSConcreteStackBlock;
      int v34 = -1073741824;
      int v35 = 0;
      v36 = sub_100025E68;
      v37 = &unk_1001B6760;
      v38 = v72;
      id v39 = v65;
      -[TVSObserverSet enumerateObserversUsingBlock:](v15, "enumerateObserversUsingBlock:", &v33);
      objc_storeStrong(&v39, 0LL);
      objc_storeStrong((id *)&v38, 0LL);
    }
  }

  else if (v66)
  {
    v14 = v72->_observers;
    v27 = _NSConcreteStackBlock;
    int v28 = -1073741824;
    int v29 = 0;
    v30 = sub_100025F68;
    v31 = &unk_1001B6788;
    v32 = v72;
    -[TVSObserverSet enumerateObserversUsingBlock:](v14, "enumerateObserversUsingBlock:", &v27);
    objc_storeStrong((id *)&v32, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)NowPlayingStateLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100025AE4( (uint64_t)v73,  (uint64_t)"-[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]",  (uint64_t)v72);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Now playing state is unchanged. state=%@",  v73,  0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(&v65, 0LL);
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_makeMediaItemMetadataWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = objc_alloc(&OBJC_CLASS___TVSSNowPlayingMediaItemMetadata);
  SEL v7 = -[TVSSNowPlayingMediaItemMetadata initWithPlayerResponseItem:isPodcast:]( v4,  "initWithPlayerResponseItem:isPodcast:",  location[0],  a4);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)succinctDescription
{
  id v3 = -[TVSSNowPlayingState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v8[0];
  id v4 = TVSSPlabackStateDescription(v9->_playbackState);
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v8[0];
  id v6 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v9->_currentMediaItem);
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSNowPlayingState descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v11);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v9, "setActiveMultilinePrefix:", location[0]);
  id v6 = v9;
  id v7 = TVSSPlabackStateDescription(v11->_playbackState);
  -[BSDescriptionBuilder appendString:withName:](v6, "appendString:withName:");

  id v3 =  -[BSDescriptionBuilder appendObject:withName:]( v9,  "appendObject:withName:",  v11->_currentMediaItem,  @"currentMediaItem");
  id v4 =  -[BSDescriptionBuilder appendFloat:withName:decimalPrecision:]( v9,  "appendFloat:withName:decimalPrecision:",  @"playbackRate",  2LL,  v11->_playbackRate);
  id v8 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (NSString)description
{
  return (NSString *)-[TVSSNowPlayingState succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSNowPlayingState descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (TVSSNowPlayingMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (NSString)nowPlayingAppBundleIdentifier
{
  return self->_nowPlayingAppBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end