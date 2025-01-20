@interface MTTVMusicPlayQueue
+ ($0AC6E346AE4835514AAA8AC86D8F4844)_tracklistRangeForRadioPlayback:(BOOL)a3;
+ (BOOL)_isTracklist:(id)a3 equalToTrackList:(id)a4;
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (AVPlayer)avPlayer;
- (BOOL)_isUserSubscribed;
- (BOOL)canAddToPlayQueueAtEndWithPlaybackIntent:(id)a3;
- (BOOL)canAddToPlayQueueNextWithPlaybackIntent:(id)a3;
- (BOOL)canMoveItemAtIndexToPlayNext:(int64_t)a3;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)externalEndpointsAvailable;
- (BOOL)isLocalDeviceQueue;
- (BOOL)isMediaItem:(id)a3 matchingResponseItem:(id)a4;
- (BOOL)isMusicAppQueue;
- (BOOL)isPendingElapsedTimeChange;
- (BOOL)isRadioPlayback;
- (BOOL)isUpdating;
- (BOOL)isVideoPlayback;
- (BOOL)shuffleEnabled;
- (BOOL)supportsRepeat;
- (BOOL)supportsShuffle;
- (MPAVRoute)audioRoute;
- (MPCPlayerPath)playerPath;
- (MPCPlayerResponse)playerResponse;
- (MPCPlayerResponseItem)currentPlayingItem;
- (MPCPlayerResponseItem)lastPlayingItem;
- (MPRequestResponseController)requestResponseController;
- (MTTVMusicPlayQueue)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5;
- (MTTVMusicPlayQueueDelegate)delegate;
- (NSArray)mediaItems;
- (NSDictionary)mediaItemIndexes;
- (NSString)audioRouteName;
- (NSString)radioStationName;
- (double)currentPlayingDuration;
- (double)currentPlayingElapsedTime;
- (double)pendingElapsedTime;
- (id)_createGlobalPlayerPathWithRoute:(id)a3;
- (id)_mediaItemForMPCPlayerResponseItem:(id)a3 section:(id)a4 atIndexPath:(id)a5;
- (id)_playEventFromGenericObject:(id)a3;
- (id)_podcastsPlayerPathWithRoute:(id)a3;
- (id)currentMediaItem;
- (id)nowPlayingProperties;
- (id)queueSectionProperties;
- (id)responseTrackList;
- (int64_t)_repeatModeFromRepeatType:(int64_t)a3;
- (int64_t)_tracklistRepeatMode;
- (int64_t)playerState;
- (int64_t)repeatMode;
- (unint64_t)activeListIndex;
- (unint64_t)count;
- (void)_activeSystemRouteDidChange:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_mediaServicesDidReset;
- (void)_performInternalPlayerCommand:(int64_t)a3;
- (void)_performPlayerCommand:(int64_t)a3 name:(id)a4;
- (void)_performPlayerCommandRequest:(id)a3 name:(id)a4;
- (void)_repeatModeSettingDidChange:(id)a3;
- (void)_setRepeatMode:(int64_t)a3;
- (void)_setRepeatType:(int64_t)a3;
- (void)_setShuffleEnabled:(BOOL)a3;
- (void)_updateMediaItemsWithTrackList:(id)a3;
- (void)_updatePlayQueue;
- (void)_updatePlayerPathWithRoute:(id)a3;
- (void)addToPlayQueueWithPlaybackIntent:(id)a3 playNext:(BOOL)a4;
- (void)airplayDetectorAirplayEnded:(id)a3;
- (void)airplayDetectorAirplayStarted:(id)a3;
- (void)changeToItemAtIndex:(int64_t)a3;
- (void)changeToNextItem;
- (void)changeToPreviousItem;
- (void)clearPlayQueueWithCompletionHandler:(id)a3;
- (void)configureRequestResponseController;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)fastForward;
- (void)moveItemAtIndexToPlayNext:(int64_t)a3;
- (void)pause;
- (void)play;
- (void)rewind;
- (void)setAvPlayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationSnapshot:(id *)a3;
- (void)setElapsedTime:(double)a3;
- (void)setExternalEndpointsAvailable:(BOOL)a3;
- (void)setIsRadioPlayback:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setIsVideoPlayback:(BOOL)a3;
- (void)setLastPlayingItem:(id)a3;
- (void)setMediaItemIndexes:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setPendingElapsedTime:(double)a3;
- (void)setPendingElapsedTimeChange:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPlayerResponse:(id)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setRequestResponseController:(id)a3;
- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4;
- (void)setSupportsRepeat:(BOOL)a3;
- (void)setSupportsShuffle:(BOOL)a3;
- (void)startUpdating;
- (void)stop;
- (void)stopUpdating;
- (void)updatePlayerPath;
@end

@implementation MTTVMusicPlayQueue

- (MTTVMusicPlayQueue)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MTTVMusicPlayQueue;
  v5 = -[MTTVMusicPlayQueue initWithMediaItems:index:isCollection:]( &v21,  "initWithMediaItems:index:isCollection:",  a3,  a4,  a5);
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.podcasts", "MTTVMusicPlayQueue");
    v7 = (void *)qword_1002B6A00;
    qword_1002B6A00 = (uint64_t)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
    requestResponseController = v5->_requestResponseController;
    v5->_requestResponseController = v8;

    -[MPRequestResponseController setDelegate:](v5->_requestResponseController, "setDelegate:", v5);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TVMusic.TVMusicPlayQueue.invalidation", 0LL);
    invalidationQueue = v5->_invalidationQueue;
    v5->_invalidationQueue = (OS_dispatch_queue *)v10;

    v12 = -[MTTVMusicAirplayDetector initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVMusicAirplayDetector),  "initWithDelegate:",  v5);
    airplayDetector = v5->_airplayDetector;
    v5->_airplayDetector = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v15 = MTApplicationDidBecomeActiveNotification;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v14 addObserver:v5 selector:"_applicationDidBecomeActive:" name:v15 object:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v5 selector:"_repeatModeSettingDidChange:" name:MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification object:0];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v5 selector:"_activeSystemRouteDidChange:" name:MPAVRoutingControllerActiveSystemRouteDidChangeNotification object:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v5 selector:"_mediaServicesDidReset" name:IMAVPlayerNotification_MediaServicesDidReset object:0];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVMusicPlayQueue;
  -[MTTVMusicPlayQueue dealloc](&v4, "dealloc");
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue mediaItems](self, "mediaItems"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)activeListIndex
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C374();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue mediaItemIndexes](self, "mediaItemIndexes"));
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  id v7 = [v6 unsignedIntegerValue];

  return (unint64_t)v7;
}

- (id)currentMediaItem
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C39C();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);

  if (!v4
    || (unint64_t v5 = -[MTTVMusicPlayQueue activeListIndex](self, "activeListIndex"), (v5 & 0x8000000000000000LL) != 0)
    || (unint64_t v6 = v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue activeList](self, "activeList")),
        id v8 = [v7 count],
        v7,
        v6 >= (unint64_t)v8))
  {
    dispatch_queue_t v10 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue activeList](self, "activeList"));
    dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v6]);
  }

  return v10;
}

- (BOOL)isMediaItem:(id)a3 matchingResponseItem:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPIdentifierSet"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 metadataObject]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 song]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
  unsigned __int8 v10 = [v6 hasCommonIdentifierWithIdentifierSet:v9];

  return v10;
}

- (NSString)audioRouteName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue audioRoute](self, "audioRoute"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 routeName]);

  if (![v3 length])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[TVSDevice userDeviceName](&OBJC_CLASS___TVSDevice, "userDeviceName"));

    id v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (MPAVRoute)audioRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 request]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPath]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 route]);

  return (MPAVRoute *)v5;
}

- (BOOL)canMoveItemAtIndexToPlayNext:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTTVMusicPlayQueue;
  if (!-[MTTVMusicPlayQueue canMoveItemAtIndexToPlayNext:](&v14, "canMoveItemAtIndexToPlayNext:")) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reorderCommand]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForGlobalIndex:a3]);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemAtIndexPath:v9]);

  unsigned __int8 v12 = [v6 canMoveItem:v11];
  return v12;
}

- (void)moveItemAtIndexToPlayNext:(int64_t)a3
{
  if (-[MTTVMusicPlayQueue canMoveItemAtIndexToPlayNext:](self, "canMoveItemAtIndexToPlayNext:"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reorderCommand]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForGlobalIndex:a3]);

      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemAtIndexPath:v9]);

      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 playingItemIndexPath]);
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v12 itemAtIndexPath:v13]);

      if (v11 && v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 moveItem:v11 afterItem:v14]);
        -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v15,  @"move item");
      }

      else
      {
        v16 = (void *)qword_1002B6A00;
        if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue([v7 playingItemIndexPath]);
          int v19 = 138412546;
          v20 = v9;
          __int16 v21 = 2112;
          v22 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to move item at indexPath %@ to after indexPath %@",  (uint8_t *)&v19,  0x16u);
        }
      }
    }
  }

- (void)updatePlayerPath
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100074800;
  v2[3] = &unk_100242728;
  v2[4] = self;
  +[MPAVRoutingController getActiveRouteWithCompletion:]( &OBJC_CLASS___MPAVRoutingController,  "getActiveRouteWithCompletion:",  v2);
}

- (void)startUpdating
{
  if (!-[MTTVMusicPlayQueue isUpdating](self, "isUpdating"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
    [v3 beginAutomaticResponseLoading];

    -[MTTVMusicPlayQueue setIsUpdating:](self, "setIsUpdating:", 1LL);
  }

- (void)stopUpdating
{
  if (-[MTTVMusicPlayQueue isUpdating](self, "isUpdating"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
    [v3 endAutomaticResponseLoading];

    -[MTTVMusicPlayQueue setIsUpdating:](self, "setIsUpdating:", 0LL);
  }

- (MPCPlayerResponseItem)currentPlayingItem
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C3C4();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v6]);
  }

  return (MPCPlayerResponseItem *)v4;
}

- (int64_t)playerState
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C3EC();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);

  if (!v4) {
    return 1LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v6 = [v5 state];

  return (int64_t)v6;
}

- (id)responseTrackList
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C414();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tracklist]);

  return v4;
}

- (void)play
{
  if ((id)-[MTTVMusicPlayQueue playerState](self, "playerState") == (id)5
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem")),
        v3,
        v3))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 seekCommand]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 endSeek]);
    -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"end seek");
  }

  else
  {
    -[MTTVMusicPlayQueue _performPlayerCommand:name:](self, "_performPlayerCommand:name:", 1LL, @"play");
  }

- (void)pause
{
}

- (void)stop
{
}

- (void)fastForward
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 seekCommand]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginSeekWithDirection:1]);
    -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"fast-forward");

    id v3 = v6;
  }
}

- (void)rewind
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 seekCommand]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginSeekWithDirection:-1]);
    -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"rewind");

    id v3 = v6;
  }
}

- (void)changeToNextItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changeItemCommand]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 nextItem]);

  -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"nextItem");
}

- (void)changeToPreviousItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changeItemCommand]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 previousItem]);

  -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"previousItem");
}

- (void)changeToItemAtIndex:(int64_t)a3
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C43C();
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForGlobalIndex:a3]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 changeItemCommand]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 changeToItem:v8]);

    if (v11)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100074EC4;
      v14[3] = &unk_100242748;
      v14[4] = a3;
      +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v11,  v14);
    }

    else
    {
      v13 = (os_log_s *)qword_1002B6A00;
      if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v16 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unable to perform change to item (%ld) command: No command request is available.",  buf,  0xCu);
      }
    }
  }

  else
  {
    unsigned __int8 v12 = (os_log_s *)qword_1002B6A00;
    if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to perform change to item (%ld) command: No item is available.",  buf,  0xCu);
    }
  }
}

- (void)setElapsedTime:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 seekCommand]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 changePositionToElapsedInterval:a3]);

  if (v7)
  {
    -[MTTVMusicPlayQueue setPendingElapsedTimeChange:](self, "setPendingElapsedTimeChange:", 1LL);
    -[MTTVMusicPlayQueue setPendingElapsedTime:](self, "setPendingElapsedTime:", a3);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10007509C;
    v10[3] = &unk_100242770;
    *(double *)&v10[5] = a3;
    v10[4] = self;
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v7,  v10);
  }

  else
  {
    id v8 = (os_log_s *)qword_1002B6A00;
    if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unable to perform set elapsed time command: No command request is available.",  v9,  2u);
    }
  }
}

- (double)currentPlayingElapsedTime
{
  if (-[MTTVMusicPlayQueue isPendingElapsedTimeChange](self, "isPendingElapsedTimeChange"))
  {
    -[MTTVMusicPlayQueue pendingElapsedTime](self, "pendingElapsedTime");
  }

  else
  {
    -[MTTVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v4 = v8 + (v3 - v6) * v9;
    if (v4 >= v7) {
      double v4 = v7;
    }
    return fmax(v4, 0.0);
  }

  return result;
}

- (double)currentPlayingDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  double v3 = v2;
  if (v2)
  {
    [v2 duration];
    double v4 = v6;
  }

  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4
{
  BOOL v4 = a3;
  double v6 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Attempt to set shuffle enabled %d",  (uint8_t *)v11,  8u);
  }

  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C464();
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 shuffleCommand]);

  if (v8)
  {
    float v9 = (void *)objc_claimAutoreleasedReturnValue([v8 setShuffleType:v4]);
    if (v9)
    {
      +[MPCPlayerChangeRequest performRequest:options:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:options:completion:",  v9,  0x10000LL,  &stru_100242790);
    }

    else
    {
      unsigned __int8 v10 = (os_log_s *)qword_1002B6A00;
      if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Shuffle command not available",  (uint8_t *)v11,  2u);
      }
    }
  }
}

- (void)_setShuffleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
  {
    BOOL shuffleEnabled = self->_shuffleEnabled;
    v7[0] = 67109376;
    v7[1] = shuffleEnabled;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_shuffleEnabled set %d to %d", (uint8_t *)v7, 0xEu);
  }

  if (self->_shuffleEnabled != v3)
  {
    -[MTTVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"shuffleEnabled");
    self->_BOOL shuffleEnabled = v3;
    -[MTTVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"shuffleEnabled");
  }

- (BOOL)shuffleEnabled
{
  return self->_shuffleEnabled;
}

- (void)setRepeatMode:(int64_t)a3
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C48C();
  }
  if (a3 == 1) {
    uint64_t v5 = 2LL;
  }
  else {
    uint64_t v5 = a3 == 2;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
  [v6 setMusicRepeatType:v5];

  -[MTTVMusicPlayQueue _setRepeatType:](self, "_setRepeatType:", v5);
}

- (void)_setRepeatType:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    int64_t v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Attempt to set repeat type %li",  (uint8_t *)&v14,  0xCu);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tracklist]);
  id v8 = [v7 repeatType];

  if (v8 != (id)a3)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 repeatCommand]);

    if (v10 && (uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 setRepeatType:a3])) != 0)
    {
      unsigned __int8 v12 = (void *)v11;
      +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v11,  &stru_1002427B0);
    }

    else
    {
      v13 = (os_log_s *)qword_1002B6A00;
      if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Repeat command not available",  (uint8_t *)&v14,  2u);
      }
    }
  }

- (void)_setRepeatMode:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
  {
    int64_t repeatMode = self->_repeatMode;
    int v7 = 134218240;
    int64_t v8 = repeatMode;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_repeatMode set %li to %li", (uint8_t *)&v7, 0x16u);
  }

  if (self->_repeatMode != a3)
  {
    -[MTTVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"repeatMode");
    self->_int64_t repeatMode = a3;
    -[MTTVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"repeatMode");
  }

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)clearPlayQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 resetCommand]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clear]);

  if (v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100075AA8;
    v14[3] = &unk_100241DD8;
    id v15 = v4;
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v7,  v14);
    int64_t v8 = v15;
  }

  else
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));

    int64_t v10 = (os_log_s *)qword_1002B6A00;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Queue reset command (clear) not available",  v13,  2u);
      }

      uint64_t v12 = 3LL;
    }

    else if (v11)
    {
      *(_WORD *)v13 = 0;
      uint64_t v12 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to replace queue; tracklist is nil",
        v13,
        2u);
    }

    else
    {
      uint64_t v12 = 2LL;
    }

    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVMusicPlayQueueErrorDomain",  v12,  0LL));
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v8);
    }
  }
}

- (BOOL)canAddToPlayQueueNextWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[MTTVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[MTTVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAfterPlayingItemWithPlaybackIntent:v4]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canAddToPlayQueueAtEndWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[MTTVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[MTTVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAtEndOfTracklistWithPlaybackIntent:v4]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)addToPlayQueueWithPlaybackIntent:(id)a3 playNext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 insertCommand]);

  if (!v8)
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));

    BOOL v11 = (os_log_s *)qword_1002B6A00;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v12) {
        goto LABEL_16;
      }
      *(_WORD *)int v19 = 0;
      v13 = "Queue insert command not found on tracklist!";
    }

    else
    {
      if (!v12) {
        goto LABEL_16;
      }
      *(_WORD *)int v19 = 0;
      v13 = "Unable to insert into queue; tracklist is nil";
    }

    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, v19, 2u);
    goto LABEL_16;
  }

  if (v4) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 insertAfterPlayingItemWithPlaybackIntent:v6]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 insertAtEndOfTracklistWithPlaybackIntent:v6]);
  }
  int v14 = (void *)v9;
  if (v9)
  {
    v22 = @"TVMusicPlayQueueWillAddToQueueNotificationUserInfoKeyPlayNext";
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v23 = v15;
    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 postNotificationName:@"TVMusicPlayQueueWillAddToQueueNotification" object:self userInfo:v16];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100075F20;
    v20[3] = &unk_100241DB0;
    id v21 = v6;
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v14,  v20);
  }

  else
  {
    v18 = (os_log_s *)qword_1002B6A00;
    if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Queue insert command not available", v19, 2u);
    }
  }

LABEL_16:
}

- (BOOL)isLocalDeviceQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerPath]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 route]);
  unsigned __int8 v5 = [v4 isDeviceRoute];

  return v5;
}

- (BOOL)isMusicAppQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerPath]);
  unsigned __int8 v4 = [v3 isSystemMusicPath];

  return v4;
}

- (void)_mediaServicesDidReset
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue lastAVPlayer](self, "lastAVPlayer"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localAVPlayer]);

  if (v3 != v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
    char v7 = objc_opt_respondsToSelector(v6, "playQueue:didChangeAVPlayer:");

    if ((v7 & 1) != 0)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localAVPlayer]);
      [v10 playQueue:self didChangeAVPlayer:v9];
    }
  }

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5 = a4;
  invalidationQueue = (dispatch_queue_s *)self->_invalidationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007623C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(invalidationQueue, block);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000762D8;
  v8[3] = &unk_1002405F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(&_dispatch_main_q, v8);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  if (objc_msgSend(a4, "isInvalidRouteError", a3))
  {
    invalidationQueue = (dispatch_queue_s *)self->_invalidationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007637C;
    block[3] = &unk_10023FF98;
    block[4] = self;
    dispatch_async(invalidationQueue, block);
  }

  return 1;
}

- (void)airplayDetectorAirplayStarted:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007664C;
  v3[3] = &unk_10023FF98;
  v3[4] = self;
  +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v3);
}

- (void)airplayDetectorAirplayEnded:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000767CC;
  v3[3] = &unk_10023FF98;
  v3[4] = self;
  +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v3);
}

- (void)_updatePlayerPathWithRoute:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007696C;
  v4[3] = &unk_100240240;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v4);
}

- (id)_createGlobalPlayerPathWithRoute:(id)a3
{
  id v4 = a3;
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[MPCPlayerPath pathWithRoute:bundleID:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "pathWithRoute:bundleID:playerID:",  v4,  0LL,  0LL));
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)_podcastsPlayerPathWithRoute:(id)a3
{
  return +[MPCPlayerPath pathWithRoute:bundleID:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "pathWithRoute:bundleID:playerID:",  a3,  kMTApplicationBundleIdentifier,  kPodcastsPlayerID);
}

- (void)_performInternalPlayerCommand:(int64_t)a3
{
  switch(a3)
  {
    case 3LL:
      -[MTTVMusicPlayQueue stop](self, "stop");
      break;
    case 2LL:
      -[MTTVMusicPlayQueue pause](self, "pause");
      break;
    case 1LL:
      -[MTTVMusicPlayQueue play](self, "play");
      break;
  }

- (void)_performPlayerCommand:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v8 = v7;
  if (v7)
  {
    switch(a3)
    {
      case 3LL:
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 stop]);
        break;
      case 2LL:
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 pause]);
        break;
      case 1LL:
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 play]);
        break;
      default:
        BOOL v11 = 0LL;
        goto LABEL_12;
    }

    BOOL v11 = (void *)v9;
LABEL_12:
    -[MTTVMusicPlayQueue _performPlayerCommandRequest:name:](self, "_performPlayerCommandRequest:name:", v11, v6);

    goto LABEL_13;
  }

  id v10 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to perform command %{public}@ because no player response is available.",  (uint8_t *)&v12,  0xCu);
  }

- (void)_performPlayerCommandRequest:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)qword_1002B6A00;
  if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Performing player command \"%{public}@\"",  buf,  0xCu);
  }

  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100076D80;
    v9[3] = &unk_100241DB0;
    id v10 = v6;
    +[MPCPlayerChangeRequest performRequest:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:completion:",  v5,  v9);
  }

  else
  {
    BOOL v8 = (os_log_s *)qword_1002B6A00;
    if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unable to perform %{public}@ request: No queue command is available.",  buf,  0xCu);
    }
  }
}

- (void)_updateMediaItemsWithTrackList:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 totalItemCount]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 totalItemCount]));
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_100076FE4;
  v11[3] = &unk_100242820;
  id v8 = v5;
  id v12 = v8;
  id v13 = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  int64_t v16 = v17;
  objc_msgSend(v8, "tvm_enumerateSectionsUsingBlock:", v11);
  -[MTTVMusicPlayQueue setMediaItems:](self, "setMediaItems:", v9);
  -[MTTVMusicPlayQueue setMediaItemIndexes:](self, "setMediaItemIndexes:", v10);

  _Block_object_dispose(v17, 8);
}

- (id)_mediaItemForMPCPlayerResponseItem:(id)a3 section:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 metadataObject]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 podcastEpisode]);

  if (v10)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (-[MTTVMusicPlayQueue isRadioPlayback](self, "isRadioPlayback")
      && (id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue radioStationName](self, "radioStationName")),
          v12,
          v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue radioStationName](self, "radioStationName"));
      [v11 setObject:v13 forKeyedSubscript:TVPMediaItemMetadataRadioStationName];
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tracklist]);
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 items]);
      uint64_t v17 = (uint64_t)[v16 totalItemCount];

      if (v17 >= 2) {
        [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TVMusicMediaItemMetadataShouldSkipVideo"];
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataObject]);

    if (v18)
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataObject]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue _playEventFromGenericObject:](self, "_playEventFromGenericObject:", v19));
      [v11 setObject:v20 forKeyedSubscript:@"TVMusicMediaItemMetadataMPModelPlayEvent"];
    }

    id v21 = -[MTTVMusicMPPodcastEpisodeMediaItem initWithPlayerResponseItem:mediaItemMetadata:]( objc_alloc(&OBJC_CLASS___MTTVMusicMPPodcastEpisodeMediaItem),  "initWithPlayerResponseItem:mediaItemMetadata:",  v7,  v11);
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (id)_playEventFromGenericObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___MPModelPlayEvent);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000773F8;
  v9[3] = &unk_100242848;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v4 initWithIdentifiers:v5 block:v9];

  return v7;
}

- (int64_t)_tracklistRepeatMode
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10017C4B4();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v4 = [v3 repeatType];

  return -[MTTVMusicPlayQueue _repeatModeFromRepeatType:](self, "_repeatModeFromRepeatType:", v4);
}

- (int64_t)_repeatModeFromRepeatType:(int64_t)a3
{
  if (a3 == 2) {
    return 1LL;
  }
  else {
    return 2LL * (a3 == 1);
  }
}

- (void)_updatePlayQueue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 response]);

  if (v4)
  {
    v133 = (void *)objc_claimAutoreleasedReturnValue([v4 tracklist]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v133 playingItemIndexPath]);
    if (v5
      && (id v6 = (void *)v5,
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v133 items]),
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v133 playingItemIndexPath]),
          id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", objc_msgSend(v8, "section"))),
          v8,
          v7,
          v6,
          v9))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 metadataObject]);
      BOOL v11 = [v10 type] == (id)13;
    }

    else
    {
      BOOL v11 = 0LL;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    id v13 = [v12 tracklistRange];
    uint64_t v15 = v14;

    id v17 = +[MTTVMusicPlayQueue _tracklistRangeForRadioPlayback:]( &OBJC_CLASS___MTTVMusicPlayQueue,  "_tracklistRangeForRadioPlayback:",  v11);
    uint64_t v18 = v16;
    if (v13 != v17 || v15 != v16)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 request]);
      objc_msgSend(v35, "setTracklistRange:", v17, v18);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
      [v36 setNeedsReloadForSignificantRequestChange];

LABEL_72:
      goto LABEL_73;
    }

    v131 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    int v19 = -[MTTVMusicPlayQueue playerState](self, "playerState");
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v129 contentItemIdentifier]);
    -[MTTVMusicPlayQueue currentPlayingElapsedTime](self, "currentPlayingElapsedTime");
    double v22 = v21;
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue lastAVPlayer](self, "lastAVPlayer"));
    -[MTTVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    -[MTTVMusicPlayQueue setLastPlayingItem:](self, "setLastPlayingItem:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
    v128 = (void *)objc_claimAutoreleasedReturnValue([v24 playerPath]);

    unint64_t v25 = -[MTTVMusicPlayQueue activeListIndex](self, "activeListIndex");
    -[MTTVMusicPlayQueue setPlayerResponse:](self, "setPlayerResponse:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 localAVPlayer]);
    -[MTTVMusicPlayQueue setAvPlayer:](self, "setAvPlayer:", v26);

    -[MTTVMusicPlayQueue _updateMediaItemsWithTrackList:](self, "_updateMediaItemsWithTrackList:", v133);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 metadataObject]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 flattenedGenericObject]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 anyObject]);

    uint64_t v31 = objc_opt_class(&OBJC_CLASS___MPModelPodcastEpisode);
    uint64_t v32 = objc_opt_class(v31);
    unint64_t v126 = v25;
    v127 = v30;
    if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0) {
      id v132 = v30;
    }
    else {
      id v132 = 0LL;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    v38 = v37;
    if (v37)
    {
      [v37 duration];
    }

    else
    {
      uint64_t v140 = 0LL;
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      __int128 v137 = 0u;
    }

    v135[0] = v137;
    v135[1] = v138;
    v135[2] = v139;
    uint64_t v136 = v140;
    -[MTTVMusicPlayQueue setDurationSnapshot:](self, "setDurationSnapshot:", v135);

    -[MTTVMusicPlayQueue setIsRadioPlayback:](self, "setIsRadioPlayback:", v11);
    -[MTTVMusicPlayQueue setIsVideoPlayback:](self, "setIsVideoPlayback:", [v132 hasVideo]);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 tracklist]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 shuffleCommand]);
    -[MTTVMusicPlayQueue setSupportsShuffle:](self, "setSupportsShuffle:", v41 != 0LL);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 tracklist]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 repeatCommand]);
    -[MTTVMusicPlayQueue setSupportsRepeat:](self, "setSupportsRepeat:", v44 != 0LL);

    -[MTTVMusicPlayQueue _setRepeatMode:]( self,  "_setRepeatMode:",  -[MTTVMusicPlayQueue _tracklistRepeatMode](self, "_tracklistRepeatMode"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    -[MTTVMusicPlayQueue _setShuffleEnabled:](self, "_setShuffleEnabled:", [v45 shuffleType] != 0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 playerPath]);

    v48 = (void *)qword_1002B6A00;
    if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
    {
      log = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue mediaItems](self, "mediaItems"));
      id v50 = [v49 count];
      v51 = v20;
      unint64_t v52 = -[MTTVMusicPlayQueue activeListIndex](self, "activeListIndex");
      double v53 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentMediaItem](self, "currentMediaItem")));
      -[MTTVMusicPlayQueue currentPlayingElapsedTime](self, "currentPlayingElapsedTime");
      *(_DWORD *)v149 = 134218754;
      *(void *)&v149[4] = v50;
      *(_WORD *)&v149[12] = 2048;
      *(void *)&v149[14] = v52;
      v20 = v51;
      *(_WORD *)&v149[22] = 2114;
      double v150 = v53;
      *(_WORD *)v151 = 2048;
      *(void *)&v151[2] = v54;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Got response with %ld items, index = %ld, elapsed time for %{public}@ is %g",  v149,  0x2Au);
    }

    if (([v47 isSystemPodcastsPath] & 1) == 0)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue mediaItems](self, "mediaItems"));
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 firstObject]);

      uint64_t v57 = objc_opt_class(&OBJC_CLASS___MTTVMusicMPPodcastEpisodeMediaItem);
      if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
      {
        id v58 = v56;
        [v58 setUnknownItemType:1];
        v59 = (void *)objc_claimAutoreleasedReturnValue([v47 representedBundleDisplayName]);
        [v58 setUnknownItemDescription:v59];

        v60 = (void *)qword_1002B6A00;
        if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
        {
          v61 = v60;
          uint64_t v62 = objc_claimAutoreleasedReturnValue([v47 representedBundleDisplayName]);
          v63 = v19;
          v64 = v47;
          v65 = v20;
          v66 = (void *)v62;
          *(_DWORD *)v149 = 138543362;
          *(void *)&v149[4] = v62;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "Showing Currently Playing status for audio app [%{public}@]",  v149,  0xCu);

          v20 = v65;
          v47 = v64;
          int v19 = v63;
        }
      }

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue requestResponseController](self, "requestResponseController"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v67 request]);
      objc_msgSend(v68, "setTracklistRange:", 0, 1);
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));

    if (!v69)
    {
      v86 = (os_log_s *)qword_1002B6A00;
      if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v149 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "Got a valid player response, but there is no play queue delegate!.",  v149,  2u);
      }

      goto LABEL_66;
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    unsigned __int8 v71 = +[MTTVMusicPlayQueue _isTracklist:equalToTrackList:]( &OBJC_CLASS___MTTVMusicPlayQueue,  "_isTracklist:equalToTrackList:",  v70,  v131);

    if ((v71 & 1) == 0)
    {
      v72 = (void *)qword_1002B6A00;
      if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
      {
        v73 = v72;
        v74 = (void *)objc_claimAutoreleasedReturnValue([v131 items]);
        id v75 = [v74 totalItemCount];
        os_log_t loga = v20;
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue responseTrackList](self, "responseTrackList"));
        v77 = (void *)objc_claimAutoreleasedReturnValue([v76 items]);
        id v78 = [v77 totalItemCount];
        *(_DWORD *)v149 = 134349312;
        *(void *)&v149[4] = v75;
        *(_WORD *)&v149[12] = 2050;
        *(void *)&v149[14] = v78;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "   > Tracklist changed from %{public}ld items to %{public}ld items",  v149,  0x16u);

        v20 = loga;
      }

      v79 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
      char v80 = objc_opt_respondsToSelector(v79, "playQueue:didUpdateQueue:");

      if ((v80 & 1) != 0)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue mediaItems](self, "mediaItems"));
        [v81 playQueue:self didUpdateQueue:v82];
      }
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    v84 = (void *)objc_claimAutoreleasedReturnValue([v83 contentItemIdentifier]);
    if (-[os_log_s isEqualToString:](v20, "isEqualToString:", v84))
    {
      unint64_t v85 = -[MTTVMusicPlayQueue activeListIndex](self, "activeListIndex");

      if (v126 == v85)
      {
LABEL_41:
        if ((void *)-[MTTVMusicPlayQueue playerState](self, "playerState") != v19 || self->_isNewPlayQueue)
        {
          v99 = (void *)qword_1002B6A00;
          if (os_log_type_enabled((os_log_t)qword_1002B6A00, OS_LOG_TYPE_INFO))
          {
            v100 = v99;
            int64_t v101 = -[MTTVMusicPlayQueue playerState](self, "playerState");
            *(_DWORD *)v149 = 134349312;
            *(void *)&v149[4] = v19;
            *(_WORD *)&v149[12] = 2050;
            *(void *)&v149[14] = v101;
            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_INFO,  "   > Changed play state from %{public}ld to %{public}ld",  v149,  0x16u);
          }

          v102 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
          char v103 = objc_opt_respondsToSelector(v102, "playQueue:didChangeFromPlayState:toPlayState:");

          if ((v103 & 1) != 0)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
            objc_msgSend( v104,  "playQueue:didChangeFromPlayState:toPlayState:",  self,  v19,  -[MTTVMusicPlayQueue playerState](self, "playerState"));
          }

          if ((id)-[MTTVMusicPlayQueue playerState](self, "playerState") == (id)1
            && -[MTTVMusicPlayQueue isRadioPlayback](self, "isRadioPlayback"))
          {
            -[MTTVMusicPlayQueue setRadioStationName:](self, "setRadioStationName:", 0LL);
          }
        }

        v105 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
        char v106 = objc_opt_respondsToSelector(v105, "playQueue:didChangeElapsedTime:forItem:atIndex:");

        if ((v106 & 1) != 0)
        {
          -[MTTVMusicPlayQueue currentPlayingElapsedTime](self, "currentPlayingElapsedTime");
          if (v107 != v22)
          {
            double v108 = v107;
            v109 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue currentMediaItem](self, "currentMediaItem"));
            objc_msgSend( v109,  "playQueue:didChangeElapsedTime:forItem:atIndex:",  self,  v110,  -[MTTVMusicPlayQueue activeListIndex](self, "activeListIndex"),  v108);
          }
        }

        v111 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
        v112 = (void *)objc_claimAutoreleasedReturnValue([v111 localAVPlayer]);

        if (v130 != v112)
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
          char v114 = objc_opt_respondsToSelector(v113, "playQueue:didChangeAVPlayer:");

          if ((v114 & 1) != 0)
          {
            v115 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
            v116 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue playerResponse](self, "playerResponse"));
            v117 = (void *)objc_claimAutoreleasedReturnValue([v116 localAVPlayer]);
            [v115 playQueue:self didChangeAVPlayer:v117];
          }
        }

        -[MTTVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
        double v118 = *(double *)buf;
        if (*(double *)buf != *(double *)v149
          || (double v118 = v142, v142 != *(double *)&v149[8])
          || (double v118 = v143, v143 != *(double *)&v149[16])
          || (double v118 = v144, v144 != v150)
          || (double v118 = v145, v145 != *(double *)v151)
          || (*(float *)&double v118 = v146, v146 != *(float *)&v151[8])
          || v147 != v152
          || v148 != v153)
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate", v118));
          char v120 = objc_opt_respondsToSelector(v119, "playQueue:didChangeDurationSnapshot:");

          if ((v120 & 1) != 0)
          {
            v121 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue delegate](self, "delegate"));
            -[MTTVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
            [v121 playQueue:self didChangeDurationSnapshot:v134];
          }
        }

- (BOOL)_isUserSubscribed
{
  return 1;
}

+ (BOOL)_isTracklist:(id)a3 equalToTrackList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);
  id v9 = [v7 totalItemCount];
  if (v9 == [v8 totalItemCount])
  {
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    v16[3] = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100078564;
    v12[3] = &unk_100242870;
    id v13 = v8;
    uint64_t v14 = v16;
    uint64_t v15 = &v17;
    objc_msgSend(v7, "tvm_enumerateItemsUsingBlock:", v12);

    _Block_object_dispose(v16, 8);
    BOOL v10 = *((_BYTE *)v18 + 24) != 0;
  }

  else
  {
    BOOL v10 = 0;
    *((_BYTE *)v18 + 24) = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)_tracklistRangeForRadioPlayback:(BOOL)a3
{
  if (a3) {
    int64_t v3 = 0LL;
  }
  else {
    int64_t v3 = 49LL;
  }
  if (a3) {
    int64_t v4 = 1LL;
  }
  else {
    int64_t v4 = 99LL;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)configureRequestResponseController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue nowPlayingProperties](self, "nowPlayingProperties"));
  [v3 setQueueItemProperties:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue nowPlayingProperties](self, "nowPlayingProperties"));
  [v3 setPlayingItemProperties:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayQueue queueSectionProperties](self, "queueSectionProperties"));
  [v3 setQueueSectionProperties:v6];

  objc_msgSend(v3, "setTracklistRange:", 49, 99);
  [v3 setDisablePlaybackStateValidation:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100078784;
  v8[3] = &unk_100242898;
  id v9 = v3;
  BOOL v10 = self;
  id v7 = v3;
  +[MPAVRoutingController getActiveRouteWithCompletion:]( &OBJC_CLASS___MPAVRoutingController,  "getActiveRouteWithCompletion:",  v8);
}

- (void)_repeatModeSettingDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100078864;
  v3[3] = &unk_10023FF98;
  v3[4] = self;
  +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v3);
}

- (void)_activeSystemRouteDidChange:(id)a3
{
}

- (id)nowPlayingProperties
{
  id v20 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v31[0] = MPModelPropertyPodcastEpisodeArtwork;
  v31[1] = MPModelPropertyPodcastEpisodeDuration;
  v31[2] = MPModelPropertyPodcastEpisodeExplicit;
  v31[3] = MPModelPropertyPodcastEpisodeDescriptionText;
  v31[4] = MPModelPropertyPodcastEpisodeStreamURL;
  v31[5] = MPModelPropertyPodcastEpisodeTitle;
  v31[6] = MPModelPropertyPodcastEpisodeHasVideo;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 7LL));
  v29[0] = MPModelRelationshipPodcastEpisodeAuthor;
  uint64_t v3 = MPModelPropertyPodcastAuthorName;
  uint64_t v28 = MPModelPropertyPodcastAuthorName;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v19));
  v30[0] = v18;
  v29[1] = MPModelRelationshipPodcastEpisodePodcast;
  id v4 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v27[0] = MPModelPropertyPodcastTitle;
  v27[1] = MPModelPropertyPodcastFeedURL;
  v27[2] = MPModelPropertyPodcastSupportsSubscription;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 3LL));
  uint64_t v24 = v3;
  uint64_t v25 = MPModelRelationshipPodcastAuthor;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  v26 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  id v9 = [v4 initWithProperties:v5 relationships:v8];
  v30[1] = v9;
  v29[2] = MPModelRelationshipPodcastEpisodePlaybackPosition;
  uint64_t v23 = MPModelPropertyPlaybackPositionShouldRememberBookmarkTime;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
  v30[2] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
  id v13 = [v20 initWithProperties:v2 relationships:v12];

  id v14 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v21 = MPModelRelationshipGenericPodcastEpisode;
  id v22 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  id v16 = [v14 initWithProperties:0 relationships:v15];

  return v16;
}

- (id)queueSectionProperties
{
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v18[0] = MPModelRelationshipGenericAlbum;
  uint64_t v17 = MPModelPropertyAlbumTitle;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v3));
  v19[0] = v4;
  v18[1] = MPModelRelationshipGenericTVSeason;
  uint64_t v16 = MPModelPropertyTVSeasonNumber;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v5));
  v19[1] = v6;
  v18[2] = MPModelRelationshipGenericPlaylist;
  v15[0] = MPModelPropertyPlaylistName;
  v15[1] = MPModelPropertyPlaylistLibraryAdded;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v7));
  v19[2] = v8;
  v18[3] = MPModelRelationshipGenericRadioStation;
  uint64_t v14 = MPModelPropertyRadioStationName;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v9));
  v19[3] = v10;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
  id v12 = [v2 initWithProperties:0 relationships:v11];

  return v12;
}

- (BOOL)supportsShuffle
{
  return self->_supportsShuffle;
}

- (void)setSupportsShuffle:(BOOL)a3
{
  self->_supportsShuffle = a3;
}

- (BOOL)supportsRepeat
{
  return self->_supportsRepeat;
}

- (void)setSupportsRepeat:(BOOL)a3
{
  self->_supportsRepeat = a3;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MTTVMusicPlayQueueDelegate)delegate
{
  return (MTTVMusicPlayQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MPCPlayerResponseItem)lastPlayingItem
{
  return self->_lastPlayingItem;
}

- (void)setLastPlayingItem:(id)a3
{
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var1;
  *(double *)&retstr->var7 = self[3].var3;
  return self;
}

- (void)setDurationSnapshot:(id *)a3
{
  __int128 v4 = *(_OWORD *)&a3->var2;
  __int128 v3 = *(_OWORD *)&a3->var4;
  __int128 v5 = *(_OWORD *)&a3->var0;
  *(void *)&self->_durationSnapshot.isLiveContent = *(void *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v4;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v3;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v5;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (void)setRadioStationName:(id)a3
{
}

- (BOOL)isRadioPlayback
{
  return self->_isRadioPlayback;
}

- (void)setIsRadioPlayback:(BOOL)a3
{
  self->_isRadioPlayback = a3;
}

- (BOOL)isVideoPlayback
{
  return self->_isVideoPlayback;
}

- (void)setIsVideoPlayback:(BOOL)a3
{
  self->_isVideoPlayback = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)externalEndpointsAvailable
{
  return self->_externalEndpointsAvailable;
}

- (void)setExternalEndpointsAvailable:(BOOL)a3
{
  self->_externalEndpointsAvailable = a3;
}

- (double)pendingElapsedTime
{
  return self->_pendingElapsedTime;
}

- (void)setPendingElapsedTime:(double)a3
{
  self->_pendingElapsedTime = a3;
}

- (BOOL)isPendingElapsedTimeChange
{
  return self->_pendingElapsedTimeChange;
}

- (void)setPendingElapsedTimeChange:(BOOL)a3
{
  self->_pendingElapsedTimeChange = a3;
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void)setRequestResponseController:(id)a3
{
}

- (MPCPlayerResponse)playerResponse
{
  return self->_playerResponse;
}

- (void)setPlayerResponse:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (NSDictionary)mediaItemIndexes
{
  return self->_mediaItemIndexes;
}

- (void)setMediaItemIndexes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end