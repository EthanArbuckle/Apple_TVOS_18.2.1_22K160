@interface TVSSAudioNowPlayingController
+ (TVSSAudioNowPlayingController)sharedInstance;
+ (id)_nowPlayingItemFromPlayerResponse:(id)a3;
- (MRPlayerPath)nowPlayingPlayerPath;
- (NSString)contentText1;
- (NSString)contentTitle;
- (TVSSNowPlayingState)nowPlayingState;
- (UIImage)contentImage;
- (UIImage)contentImage1;
- (id)_init;
- (id)_mediaPlayerRequestResponseController;
- (id)_mediaRemoteNowPlayingController;
- (id)_observersCopyForSelector:(SEL)a3;
- (void)_activate;
- (void)_handleMediaRemoteNowPlayingPlayerResponse:(id)a3 playerResponse:(id)a4;
- (void)_invalidate;
- (void)_mediaRemoteNowPlayingControllerRequestDidComplete;
- (void)_mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:(id)a3 mediaRemoteResponse:(id)a4 error:(id)a5 playerResponse:(id)a6;
- (void)_update;
- (void)_updateWithResponse:(id)a3;
- (void)addActivationReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeActivationReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sendNextTrack;
- (void)sendPause;
- (void)sendPlay;
- (void)sendPreviousTrack;
- (void)sendSkipBackward;
- (void)sendSkipForward;
- (void)sendStop;
- (void)togglePlayPause;
@end

@implementation TVSSAudioNowPlayingController

+ (TVSSAudioNowPlayingController)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000142E4;
  v7 = &unk_1001B6430;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_1002218F8;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (TVSSAudioNowPlayingController *)(id)qword_1002218F0;
}

- (id)_init
{
  SEL v13 = a2;
  v14 = 0LL;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSSAudioNowPlayingController;
  v14 = -[TVSSAudioNowPlayingController init](&v12, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingState);
    nowPlayingState = v14->_nowPlayingState;
    v14->_nowPlayingState = v2;

    int v4 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
    observers = v14->_observers;
    v14->_observers = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activationReasons = v14->_activationReasons;
    v14->_activationReasons = v6;

    id v8 = (MRNowPlayingController *) +[MRNowPlayingController localRouteController]( &OBJC_CLASS___MRNowPlayingController,  "localRouteController");
    mrNowPlayingController = v14->_mrNowPlayingController;
    v14->_mrNowPlayingController = v8;

    -[MRNowPlayingController setDelegate:](v14->_mrNowPlayingController, "setDelegate:", v14);
  }

  v11 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  return v11;
}

- (void)dealloc
{
  int v4 = self;
  SEL v3 = a2;
  -[TVSSAudioNowPlayingController _invalidate](self, "_invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSAudioNowPlayingController;
  -[TVSSAudioNowPlayingController dealloc](&v2, "dealloc");
}

- (void)addActivationReason:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  activationReasons = v6->_activationReasons;
  id v4 = [location[0] copy];
  -[NSMutableSet addObject:](activationReasons, "addObject:");

  -[TVSSAudioNowPlayingController _activate](v6, "_activate");
  objc_storeStrong(location, 0LL);
}

- (void)removeActivationReason:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  -[NSMutableSet removeObject:](v4->_activationReasons, "removeObject:", location[0]);
  if (!-[NSMutableSet count](v4->_activationReasons, "count")) {
    -[TVSSAudioNowPlayingController _invalidate](v4, "_invalidate");
  }
  objc_storeStrong(location, 0LL);
}

- (void)_activate
{
  v18 = self;
  location[1] = (id)a2;
  BSDispatchQueueAssertMain();
  if (!v18->_requestController)
  {
    location[0] = NowPlayingControllerLog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v30, (uint64_t)"-[TVSSAudioNowPlayingController _activate]");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v16, "%s: Activating controller", v30, 0xCu);
    }

    objc_storeStrong(location, 0LL);
    id v5 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    uint64_t v28 = MPModelRelationshipGenericSong;
    id v4 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v27[0] = MPModelPropertySongTitle;
    v27[1] = MPModelPropertySongArtwork;
    v27[2] = MPModelPropertySongDuration;
    SEL v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 3LL);
    v25[0] = MPModelRelationshipSongAlbum;
    uint64_t v24 = MPModelPropertyAlbumTitle;
    objc_super v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24);
    v11 = +[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:");
    v26[0] = v11;
    v25[1] = MPModelRelationshipSongArtist;
    uint64_t v23 = MPModelPropertyArtistName;
    id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL);
    SEL v9 = +[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:");
    v26[1] = v9;
    id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL);
    id v7 = objc_msgSend(v4, "initWithProperties:relationships:", v13);
    id v29 = v7;
    v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    id v15 = objc_msgSend(v5, "initWithProperties:relationships:", 0);

    id v14 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
    [v14 setPlayingItemProperties:v15];
    uint64_t v20 = 0LL;
    uint64_t v19 = 1LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = 1LL;
    objc_msgSend(v14, "setTracklistRange:", 0, 1);
    objc_super v2 = (MPRequestResponseController *) -[TVSSAudioNowPlayingController _mediaPlayerRequestResponseController]( v18,  "_mediaPlayerRequestResponseController");
    requestController = v18->_requestController;
    v18->_requestController = v2;

    -[MPRequestResponseController setDelegate:](v18->_requestController, "setDelegate:", v18);
    -[MPRequestResponseController setRequest:](v18->_requestController, "setRequest:", v14);
    -[MPRequestResponseController beginAutomaticResponseLoading]( v18->_requestController,  "beginAutomaticResponseLoading");
    -[MRNowPlayingController beginLoadingUpdates](v18->_mrNowPlayingController, "beginLoadingUpdates");
    -[TVSSAudioNowPlayingController _update](v18, "_update");
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

- (void)sendPlay
{
  id location[2] = self;
  location[1] = (id)a2;
  id v2 = -[MPRequestResponseController response](self->_requestController, "response");
  location[0] = [v2 play];

  if (location[0]) {
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  location[0],  0LL);
  }
  else {
    MRMediaRemoteSendCommand(0LL, 0LL);
  }
  objc_storeStrong(location, 0LL);
}

- (void)sendPause
{
  id location[2] = self;
  location[1] = (id)a2;
  id v2 = -[MPRequestResponseController response](self->_requestController, "response");
  location[0] = [v2 pause];

  if (location[0]) {
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  location[0],  0LL);
  }
  else {
    MRMediaRemoteSendCommand(1LL, 0LL);
  }
  objc_storeStrong(location, 0LL);
}

- (void)sendPreviousTrack
{
}

- (void)sendNextTrack
{
}

- (void)sendSkipForward
{
  v2[2] = self;
  v2[1] = (id)a2;
  uint64_t v3 = kMRMediaRemoteOptionSkipInterval;
  id v4 = &off_1001C8E40;
  v2[0] =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  MRMediaRemoteSendCommand(17LL, v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)sendSkipBackward
{
  v2[2] = self;
  v2[1] = (id)a2;
  uint64_t v3 = kMRMediaRemoteOptionSkipInterval;
  id v4 = &off_1001C8E50;
  v2[0] =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  MRMediaRemoteSendCommand(18LL, v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)sendStop
{
}

- (void)togglePlayPause
{
  id v5 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
  BOOL v6 = (id)-[TVSSNowPlayingState playbackState](v5, "playbackState") != (id)2;

  if (v6)
  {
    -[TVSSAudioNowPlayingController sendPlay](self, "sendPlay");
  }

  else
  {
    uint64_t v3 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
    id v2 = -[TVSSNowPlayingState currentMediaItem](v3, "currentMediaItem");
    unsigned __int8 v4 = -[TVSSNowPlayingMediaItem isLiveContent](v2, "isLiveContent");

    if ((v4 & 1) != 0) {
      -[TVSSAudioNowPlayingController sendStop](self, "sendStop");
    }
    else {
      -[TVSSAudioNowPlayingController sendPause](self, "sendPause");
    }
  }

- (void)addObserver:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  -[NSHashTable addObject:](v4->_observers, "addObject:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)invalidate
{
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  objc_initWeak(&v12, v15);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000150E8;
  SEL v9 = &unk_1001B6458;
  id v10 = v13;
  objc_copyWeak(&v11, &v12);
  BSDispatchMain(&v5);
  objc_destroyWeak(&v11);
  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(&v12);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_mediaPlayerRequestResponseController
{
  return objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
}

- (id)_mediaRemoteNowPlayingController
{
  return self->_mrNowPlayingController;
}

- (void)_mediaRemoteNowPlayingControllerRequestDidComplete
{
}

- (void)_invalidate
{
  uint64_t v3 = self;
  oslog[1]  = (os_log_t)a2;
  if (self->_requestController)
  {
    oslog[0]  = (os_log_t)NowPlayingControllerLog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v4, (uint64_t)"-[TVSSAudioNowPlayingController _invalidate]");
      _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Invalidating controller", v4, 0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
    -[MRNowPlayingController endLoadingUpdates](v3->_mrNowPlayingController, "endLoadingUpdates");
    -[MPRequestResponseController endAutomaticResponseLoading](v3->_requestController, "endAutomaticResponseLoading");
    objc_storeStrong((id *)&v3->_requestController, 0LL);
    -[TVSSAudioNowPlayingController _updateWithResponse:](v3, "_updateWithResponse:", 0LL);
  }

+ (id)_nowPlayingItemFromPlayerResponse:(id)a3
{
  id location[2] = a1;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  id v9 = [location[0] tracklist];
  id v10 = [v9 playingItemIndexPath];

  if (v10)
  {
    id v8 = [location[0] tracklist];
    id v7 = [v8 items];
    id v3 = [v7 itemAtIndexPath:v10];
    id v4 = v11;
    id v11 = v3;
  }

  id v6 = v11;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)_update
{
  id v3 = self;
  v2[1]  = (id)a2;
  v2[0]  = -[MPRequestResponseController response](self->_requestController, "response");
  -[TVSSAudioNowPlayingController _updateWithResponse:](v3, "_updateWithResponse:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)_updateWithResponse:(id)a3
{
  v38  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  v36  = [(id)objc_opt_class(v38) _nowPlayingItemFromPlayerResponse:location[0]];
  if (v36)
  {
    v35  = [v36 contentItemIdentifier];
    v34  = -[TVSSNowPlayingState currentMediaItem](v38->_nowPlayingState, "currentMediaItem");
    id v13 = [v34 identifier];
    unsigned __int8 v14 = [v13 isEqualToString:v35];

    if ((v14 & 1) != 0)
    {
      v33  = NowPlayingControllerLog();
      v32  = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        log  = (os_log_s *)v33;
        type  = v32;
        id v12 = v35;
        id v8 = [v34 identifier];
        id v9 = v8;
        v31  = v9;
        id v7 = -[TVSSNowPlayingState succinctDescription](v38->_nowPlayingState, "succinctDescription");
        v30  = v7;
        sub_100015BB8( (uint64_t)v41,  (uint64_t)"-[TVSSAudioNowPlayingController _updateWithResponse:]",  (uint64_t)v12,  (uint64_t)v9,  (uint64_t)v30);
        _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "%s: Received player response for the currently playing item. Will update the now playing state. contentItemIde ntifier=%{public}@, currentItemIdentifier=%{public}@, playerState=%@",  v41,  0x2Au);

        objc_storeStrong(&v30, 0LL);
        objc_storeStrong(&v31, 0LL);
      }

      objc_storeStrong(&v33, 0LL);
      -[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]( v38->_nowPlayingState,  "_updateWithPlayerResponse:playerResponseItem:isPodcast:",  location[0],  v36,  (unint64_t)[v34 isPodcast] & 1);
      objc_storeStrong((id *)&v38->_currentMediaRemoteRequestIdentifier, 0LL);
    }

    else
    {
      id v29 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
      objc_storeStrong((id *)&v38->_currentMediaRemoteRequestIdentifier, v29);
      id v28 = NowPlayingControllerLog();
      v27  = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v35;
        id v5 = -[TVSSNowPlayingState currentMediaItem](v38->_nowPlayingState, "currentMediaItem");
        id v4 = -[TVSSNowPlayingMediaItem identifier](v5, "identifier");
        v26  = v4;
        sub_100015C3C( (uint64_t)v40,  (uint64_t)"-[TVSSAudioNowPlayingController _updateWithResponse:]",  (uint64_t)v6,  (uint64_t)v26,  (uint64_t)v38->_currentMediaRemoteRequestIdentifier);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  v27,  "%s: Received player response for a new playing item. Starting MediaRemote request to determine content type. c ontentItemIdentifier=%{public}@, currentItemIdentifier=%{public}@, currentMediaRemoteRequestIdentifier=%{public}@",  v40,  0x2Au);

        objc_storeStrong(&v26, 0LL);
      }

      objc_storeStrong(&v28, 0LL);
      v25  = v38->_mrNowPlayingController;
      objc_initWeak(&from, v38);
      id v3 = v25;
      os_log_type_t v16 = _NSConcreteStackBlock;
      v17  = -1073741824;
      v18  = 0;
      uint64_t v19 = sub_100015CBC;
      uint64_t v20 = &unk_1001B64A8;
      objc_copyWeak(&v23, &from);
      id v21 = v29;
      id v22 = location[0];
      [v3 performRequestWithCompletion:&v16];
      objc_storeStrong(&v22, 0LL);
      objc_storeStrong(&v21, 0LL);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&from);
      objc_storeStrong(&v25, 0LL);
      objc_storeStrong(&v29, 0LL);
    }

    objc_storeStrong(&v34, 0LL);
    objc_storeStrong(&v35, 0LL);
  }

  else
  {
    oslog  = (os_log_t)NowPlayingControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v39, (uint64_t)"-[TVSSAudioNowPlayingController _updateWithResponse:]");
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: There is no now playing item. Will reset now playing state.",  v39,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]( v38->_nowPlayingState,  "_updateWithPlayerResponse:playerResponseItem:isPodcast:",  0LL,  0LL,  0LL);
  }

  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:(id)a3 mediaRemoteResponse:(id)a4 error:(id)a5 playerResponse:(id)a6
{
  v18  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = 0LL;
  objc_storeStrong(&v14, a6);
  if ((-[NSUUID isEqual:](v18->_currentMediaRemoteRequestIdentifier, "isEqual:", location[0]) & 1) != 0)
  {
    objc_storeStrong((id *)&v18->_currentMediaRemoteRequestIdentifier, 0LL);
    if (v15)
    {
      oslog  = (os_log_t)NowPlayingControllerLog();
      type  = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100016194( (uint64_t)v21,  (uint64_t)"-[TVSSAudioNowPlayingController _mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:mediaRemoteRes ponse:error:playerResponse:]",  (uint64_t)location[0],  (uint64_t)v15);
        _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  type,  "%s: Error fetching MediaRemote now playing information. requestIdentifier=%{public}@, error=%{public}@",  v21,  0x20u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    else
    {
      os_log_t v11 = (os_log_t)NowPlayingControllerLog();
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        sub_100016200( (uint64_t)v20,  (uint64_t)"-[TVSSAudioNowPlayingController _mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:mediaRemoteRes ponse:error:playerResponse:]",  (uint64_t)location[0]);
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v10,  "%s: MediaRemote now playing request completed. requestIdentifier=%{public}@",  v20,  0x16u);
      }

      objc_storeStrong((id *)&v11, 0LL);
      -[TVSSAudioNowPlayingController _handleMediaRemoteNowPlayingPlayerResponse:playerResponse:]( v18,  "_handleMediaRemoteNowPlayingPlayerResponse:playerResponse:",  v16,  v14);
    }
  }

  else
  {
    os_log_t v9 = (os_log_t)NowPlayingControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_100016194( (uint64_t)v19,  (uint64_t)"-[TVSSAudioNowPlayingController _mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:mediaRemoteRespo nse:error:playerResponse:]",  (uint64_t)location[0],  (uint64_t)v18->_currentMediaRemoteRequestIdentifier);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: MediaRemote now playing request completed but request identifiers do not match. Will ignore. requestIdentifi er=%{public}@, currentMediaRemoteRequestIdentifier=%{public}@",  v19,  0x20u);
    }

    objc_storeStrong((id *)&v9, 0LL);
  }

  -[TVSSAudioNowPlayingController _mediaRemoteNowPlayingControllerRequestDidComplete]( v18,  "_mediaRemoteNowPlayingControllerRequestDidComplete");
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_handleMediaRemoteNowPlayingPlayerResponse:(id)a3 playerResponse:(id)a4
{
  v44  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  v42  = 0LL;
  objc_storeStrong(&v42, a4);
  v41  = [location[0] playbackQueue];
  v40  = [v41 contentItems];
  v39  = [v40 firstObject];
  id v4 = (void *)objc_opt_class(v44);
  v38  = [v4 _nowPlayingItemFromPlayerResponse:v42];
  id v24 = [v39 identifier];
  id v23 = [v38 contentItemIdentifier];
  v25  = objc_msgSend(v24, "isEqualToString:");

  if ((v25 & 1) == 0)
  {
    v37  = NowPlayingControllerLog();
    v36  = 16;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
      log  = (os_log_s *)v37;
      type  = v36;
      id v21 = [v39 identifier];
      v17  = v21;
      v35  = v17;
      id v20 = [v38 contentItemIdentifier];
      v34  = v20;
      sub_100016194( (uint64_t)v46,  (uint64_t)"-[TVSSAudioNowPlayingController _handleMediaRemoteNowPlayingPlayerResponse:playerResponse:]",  (uint64_t)v17,  (uint64_t)v34);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "%s: Mismatch between MediaRemote now playing item and the MPCPlayerResponse now playing item. mediaRemoteContent ItemIdentifier=%{public}@, playerItemIdentifier=%{public}@",  v46,  0x20u);

      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v35, 0LL);
    }

    objc_storeStrong(&v37, 0LL);
    v33  = 1;
    goto LABEL_29;
  }

  v32  = [v39 metadata];
  v31  = 0;
  if ([v32 hasMediaType])
  {
    id v16 = [v32 mediaType];
    if (!v16)
    {
LABEL_11:
      v31  = 0;
      goto LABEL_12;
    }

    if (v16 != (id)1)
    {
      if (v16 != (id)2) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }

    v31  = 1;
  }

- (id)_observersCopyForSelector:(SEL)a3
{
  id v16 = self;
  SEL v15 = a2;
  SEL v14 = a3;
  id v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSHashTable count](self->_observers, "count"));
  memset(__b, 0, sizeof(__b));
  obj  = v16->_observers;
  id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      if ((objc_opt_respondsToSelector(v12, v14) & 1) != 0) {
        [v13 addObject:v12];
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v13;
  objc_storeStrong(&v13, 0LL);
  return v4;
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  SEL v15 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  objc_storeStrong((id *)&v15->_nowPlayingPlayerPath, v13);
  memset(__b, 0, sizeof(__b));
  id v9 =  -[TVSSAudioNowPlayingController _observersCopyForSelector:]( v15,  "_observersCopyForSelector:",  "nowPlayingController:didUpdateNowPlayingPlayerPath:");
  id v10 = [v9 countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(v9);
      }
      id v12 = *(id *)(__b[1] + 8 * v6);
      [v12 nowPlayingController:v15 didUpdateNowPlayingPlayerPath:v15->_nowPlayingPlayerPath];
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [v9 countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSNowPlayingState)nowPlayingState
{
  return self->_nowPlayingState;
}

- (MRPlayerPath)nowPlayingPlayerPath
{
  return self->_nowPlayingPlayerPath;
}

- (void).cxx_destruct
{
}

- (NSString)contentTitle
{
  uint64_t v4 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
  id v3 = -[TVSSNowPlayingState currentMediaItem](v4, "currentMediaItem");
  uint64_t v5 = -[TVSSNowPlayingMediaItem title](v3, "title");

  return v5;
}

- (NSString)contentText1
{
  uint64_t v4 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
  id v3 = -[TVSSNowPlayingState currentMediaItem](v4, "currentMediaItem");
  uint64_t v5 = -[TVSSNowPlayingMediaItem artistTitle](v3, "artistTitle");

  return v5;
}

- (UIImage)contentImage
{
  uint64_t v4 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
  id v3 = -[TVSSNowPlayingState currentMediaItem](v4, "currentMediaItem");
  uint64_t v5 = -[TVSSNowPlayingMediaItem platterArtworkImage](v3, "platterArtworkImage");

  return v5;
}

- (UIImage)contentImage1
{
  id location[2] = self;
  location[1]  = (id)a2;
  id v9 = -[TVSSAudioNowPlayingController nowPlayingState](self, "nowPlayingState");
  location[0]  = -[TVSSNowPlayingState nowPlayingAppBundleIdentifier](v9, "nowPlayingAppBundleIdentifier");

  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  BOOL v8 = 0;
  if ([location[0] length])
  {
    v17  = +[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance");
    char v16 = 1;
    id v15 = -[PBSAppInfoController appInfos](v17, "appInfos");
    char v14 = 1;
    id v13 = [v15 objectForKeyedSubscript:location[0]];
    char v12 = 1;
    BOOL v8 = v13 != 0LL;
  }

  if ((v12 & 1) != 0) {

  }
  if ((v14 & 1) != 0) {
  if ((v16 & 1) != 0)
  }

  if (v8)
  {
    id v2 = objc_alloc(&OBJC_CLASS___ISIcon);
    id v11 = [v2 initWithBundleIdentifier:location[0]];
    id v7 = objc_alloc(&OBJC_CLASS___ISImageDescriptor);
    sub_1000D31F4();
    id v10 = [v7 initWithSize:v3 scale:v4];
    id v5 = [v11 prepareImageForDescriptor:v10];
    uint64_t v19 = -[UIImage initWithCGImage:scale:orientation:]( [UIImage alloc],  "initWithCGImage:scale:orientation:",  [v11 CGImageForDescriptor:v10],  0,  2.0);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v19;
}

@end