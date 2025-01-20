@interface MTTVMusicPlayer
- (AVPlayer)avPlayer;
- (BOOL)_getStringForTitleLabel:(id *)a3 subtitleLabel:(id *)a4 forMediaItem:(id)a5;
- (BOOL)currentMediaItemHasDates;
- (BOOL)currentMediaItemHasVideoContent;
- (BOOL)currentMediaItemInitialLoadingComplete;
- (BOOL)currentMediaItemIsStreaming;
- (BOOL)currentMediaItemPreparedForLoading;
- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer;
- (BOOL)elapsedTimeJumpInProgress;
- (BOOL)interactive;
- (BOOL)isLive;
- (BOOL)isStopped;
- (BOOL)limitReadAhead;
- (BOOL)muted;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)updatesMediaRemoteInfoAutomatically;
- (BOOL)waitsAfterPreparingMediaItems;
- (CGSize)currentMediaItemPresentationSize;
- (MPAVItem)currentAVItem;
- (MPIdentifierSet)identifiersForLastEndedPlaybackItem;
- (MPIdentifierSet)identifiersForLastPlayedContainer;
- (MTTVMusicPlayQueue)playQueue;
- (MTTVMusicPlayer)init;
- (MTTVMusicPlayer)initWithName:(id)a3;
- (NSArray)audioOptions;
- (NSArray)chapterCollections;
- (NSArray)subtitleOptions;
- (NSDate)playbackDate;
- (NSMutableArray)elapsedTimeObservers;
- (NSString)name;
- (TVPASyncPlaybackDelegate)asyncDelegate;
- (TVPAudioOption)selectedAudioOption;
- (TVPChapter)currentChapter;
- (TVPChapterCollection)currentChapterCollection;
- (TVPDateRange)seekableDateRange;
- (TVPInterstitial)currentInterstitial;
- (TVPMediaItem)currentMediaItem;
- (TVPPlaybackDelegate)delegate;
- (TVPPlaybackState)state;
- (TVPSubtitleOption)selectedSubtitleOption;
- (TVPTimeRange)bufferedTimeRange;
- (TVPTimeRange)seekableTimeRange;
- (double)duration;
- (double)elapsedTime;
- (double)forwardPlaybackEndTime;
- (double)maximumBitRate;
- (double)rate;
- (double)rateUsedForPlayback;
- (double)reversePlaybackEndTime;
- (double)targetElapsedTime;
- (float)volume;
- (id)_TVPPlaybackStateFromMCPPlayerState:(int64_t)a3;
- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4;
- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4;
- (id)addElapsedTimeObserver:(id)a3;
- (int64_t)errorBehavior;
- (int64_t)mediaItemEndAction;
- (void)_itemChanged:(id)a3;
- (void)_itemReadyToPlay:(id)a3;
- (void)_loadedDurationDidChange:(id)a3;
- (void)_playerPathChanged:(id)a3;
- (void)_populatePlayerItem:(id)a3 withMetadataFromMediaItem:(id)a4;
- (void)_sendNotificationForError:(id)a3 avItem:(id)a4;
- (void)_setAVPlayer:(id)a3;
- (void)_setCurrentMediaItem:(id)a3;
- (void)_setCurrentState:(id)a3;
- (void)_updateElapsedTimeObserversWithDurationSnapshot:(id *)a3;
- (void)changeMediaInDirection:(int64_t)a3;
- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4;
- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4;
- (void)dealloc;
- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4;
- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5;
- (void)engineDidPauseForLeaseEnd:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playQueue:(id)a3 didChangeAVPlayer:(id)a4;
- (void)playQueue:(id)a3 didChangeDurationSnapshot:(id *)a4;
- (void)playQueue:(id)a3 didChangeFromPlayState:(int64_t)a4 toPlayState:(int64_t)a5;
- (void)playQueue:(id)a3 didChangePlayingItem:(id)a4;
- (void)playQueue:(id)a3 didUpdateQueue:(id)a4;
- (void)removeElapsedTimeObserverWithToken:(id)a3;
- (void)scanWithRate:(double)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setBufferedTimeRange:(id)a3;
- (void)setCurrentAVItem:(id)a3;
- (void)setCurrentChapterCollection:(id)a3;
- (void)setCurrentMediaItemInitialLoadingComplete:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5;
- (void)setElapsedTimeJumpInProgress:(BOOL)a3;
- (void)setElapsedTimeObservers:(id)a3;
- (void)setErrorBehavior:(int64_t)a3;
- (void)setIdentifiersForLastEndedPlaybackItem:(id)a3;
- (void)setIdentifiersForLastPlayedContainer:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setIsStopped:(BOOL)a3;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setMaximumBitRate:(double)a3;
- (void)setMediaItemEndAction:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlayQueue:(id)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setSelectedAudioOption:(id)a3;
- (void)setState:(id)a3;
- (void)setTargetElapsedTime:(double)a3;
- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3;
- (void)stop;
- (void)togglePlayPause;
@end

@implementation MTTVMusicPlayer

- (MTTVMusicPlayer)initWithName:(id)a3
{
  id v5 = a3;
  v6 = -[MTTVMusicPlayer init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (MTTVMusicPlayer)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTTVMusicPlayer;
  v2 = -[MTTVMusicPlayer init](&v14, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVMusicPlayer._mediaItemObservationQueue", 0LL);
    mediaItemObservationQueue = v2->_mediaItemObservationQueue;
    v2->_mediaItemObservationQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc_init(&OBJC_CLASS___MTTVMusicPlayQueue);
    playQueue = v2->_playQueue;
    v2->_playQueue = v5;

    -[MTTVMusicPlayQueue setDelegate:](v2->_playQueue, "setDelegate:", v2);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
    state = v2->_state;
    v2->_state = (TVPPlaybackState *)v7;

    v2->_isStopped = 1;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    elapsedTimeObservers = v2->_elapsedTimeObservers;
    v2->_elapsedTimeObservers = (NSMutableArray *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_itemReadyToPlay:" name:IMAVPlayerNotification_PlayerItemReadyToPlay object:v11];
    [v12 addObserver:v2 selector:"_loadedDurationDidChange:" name:IMAVPlayerNotification_LoadedDurationDidChange object:v11];
    [v12 addObserver:v2 selector:"_itemChanged:" name:IMAVPlayerNotification_MediaItemDidChange object:0];
    [v12 addObserver:v2 selector:"_playerPathChanged:" name:@"TVMusicPlayQueuePlayerPathChangedNotification" object:v2->_playQueue];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVMusicPlayer;
  -[MTTVMusicPlayer dealloc](&v4, "dealloc");
}

- (void)setPlaylist:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[MTTVMusicPlayer setPlaylist:]", "MTTVMusicPlayer.m", 152, "0");
}

- (BOOL)currentMediaItemHasVideoContent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  if ([v3 isPlayerTargetLocal])
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentItem]);
    unsigned __int8 v5 = [v4 isVideo];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPlayerResponse]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localAVPlayer]);
    if (v8) {
      BOOL v9 = v5;
    }
    else {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)currentMediaItemPreparedForLoading
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentMediaItem](self, "currentMediaItem"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)currentMediaItemIsStreaming
{
  return 0;
}

- (CGSize)currentMediaItemPresentationSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerItem]);
  [v3 presentationSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)currentMediaItemHasDates
{
  return 0;
}

- (id)addElapsedTimeObserver:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers"));
  id v6 = objc_retainBlock(v4);
  [v5 addObject:v6];

  id v7 = objc_retainBlock(v4);
  return v7;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers"));
  id v5 = objc_retainBlock(v4);

  [v6 removeObject:v5];
}

- (double)rate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  BOOL v3 = v2;
  if (v2)
  {
    [v2 durationSnapshot];
    double v4 = v6;
  }

  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (TVPPlaybackDelegate)delegate
{
  return 0LL;
}

- (void)pause
{
  if (-[MTTVMusicPlayer waitsAfterPreparingMediaItems](self, "waitsAfterPreparingMediaItems")
    && (uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentAVItem](self, "currentAVItem"))) != 0
    && (double v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentAVItem](self, "currentAVItem")),
        unsigned __int8 v6 = [v5 isAssetLoaded],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
    -[MTTVMusicPlayer _setCurrentState:](self, "_setCurrentState:");
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    [v7 pause];
  }
}

- (void)scanWithRate:(double)a3
{
  if (a3 <= 1.0)
  {
    if (a3 >= -1.0)
    {
      if (a3 != 1.0) {
        return;
      }
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
      [v5 play];
    }

    else
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
      [v5 rewind];
    }
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    [v5 fastForward];
  }
}

- (void)togglePlayPause
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  unint64_t v4 = (unint64_t)[v3 playerState];

  if (v4 == 2)
  {
    -[MTTVMusicPlayer pause](self, "pause");
  }

  else if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    -[MTTVMusicPlayer play](self, "play");
  }

- (void)play
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  [v3 play];
}

- (void)stop
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  [v3 stop];

  if (-[MTTVMusicPlayer currentMediaItemHasVideoContent](self, "currentMediaItemHasVideoContent"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    [v4 clearPlayQueueWithCompletionHandler:0];
  }

- (TVPMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (void)setIsStopped:(BOOL)a3
{
  if (self->_isStopped != a3)
  {
    self->_isStopped = a3;
    if (a3)
    {
      -[MTTVMusicPlayer _setCurrentMediaItem:](self, "_setCurrentMediaItem:", 0LL);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicPlayer _TVPPlaybackStateFromMCPPlayerState:]( self,  "_TVPPlaybackStateFromMCPPlayerState:",  [v4 playerState]));
      -[MTTVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v5);

      if (-[MTTVMusicPlayer currentMediaItemInitialLoadingComplete](self, "currentMediaItemInitialLoadingComplete")) {
        -[MTTVMusicPlayer setCurrentMediaItemInitialLoadingComplete:]( self,  "setCurrentMediaItemInitialLoadingComplete:",  0LL);
      }
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v6 currentMediaItem]);

      -[MTTVMusicPlayer _setCurrentMediaItem:](self, "_setCurrentMediaItem:", v9);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicPlayer _TVPPlaybackStateFromMCPPlayerState:]( self,  "_TVPPlaybackStateFromMCPPlayerState:",  [v7 playerState]));
      -[MTTVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v8);
    }
  }

- (void)_setCurrentState:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer state](self, "state"));
  if (-[MTTVMusicPlayer isStopped](self, "isStopped")) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;
  if (v6 != v5)
  {
    v26[0] = TVPPlaybackStateOldStateKey;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer state](self, "state"));
    v26[1] = TVPPlaybackStateNewStateKey;
    v27[0] = v8;
    v27[1] = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 postNotificationName:TVPPlaybackStateWillChangeNotification object:self userInfo:v9];

    -[MTTVMusicPlayer setState:](self, "setState:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:TVPPlaybackStateDidChangeNotification object:self userInfo:v9];

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
    if (v7 == (void *)v12)
    {
    }

    else
    {
      v13 = (void *)v12;
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
      if (v5 != (id)v14)
      {
        v15 = (void *)v14;
        goto LABEL_11;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));

      if (v7 != v25) {
        goto LABEL_12;
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentMediaItem]);
    char v18 = objc_opt_respondsToSelector( v17,  "updateBookmarkWithSuggestedTime:forElapsedTime:duration:playbackOfMediaItemIsEnding:");

    if ((v18 & 1) == 0)
    {
LABEL_12:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v24 postNotificationName:@"TVMusicPlayerStateDidChangeNotification" object:self];

      goto LABEL_13;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 currentMediaItem]);
    -[MTTVMusicPlayer elapsedTime](self, "elapsedTime");
    double v20 = v19;
    -[MTTVMusicPlayer elapsedTime](self, "elapsedTime");
    double v22 = v21;
    -[MTTVMusicPlayer duration](self, "duration");
    [v15 updateBookmarkWithSuggestedTime:0 forElapsedTime:v20 duration:v22 playbackOfMediaItemIsEnding:v23];
LABEL_11:

    goto LABEL_12;
  }

- (void)_setCurrentMediaItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentMediaItem, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer identifiersForLastEndedPlaybackItem](self, "identifiersForLastEndedPlaybackItem"));
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPlayingItem]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataObject]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifiers]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer identifiersForLastEndedPlaybackItem](self, "identifiersForLastEndedPlaybackItem"));
  unsigned int v12 = [v10 hasCommonIdentifierWithIdentifierSet:v11];

  if (!v12)
  {
    id v6 = 0LL;
    goto LABEL_6;
  }

  id v13 = TVPPlaybackChangeReasonPlayedToEndOfMediaItem;
  id v6 = v13;
  if (!v13)
  {
LABEL_6:
    uint64_t v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v17 = TVPPlaybackCurrentMediaItemChangeReasonKey;
  id v18 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
LABEL_7:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 postNotificationName:TVPPlaybackCurrentMediaItemDidChangeNotification object:self userInfo:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v16 postNotificationName:@"TVMusicPlayerMediaItemDidChangeNotification" object:self];
}

- (double)elapsedTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  [v2 currentPlayingElapsedTime];
  double v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
  [v5 setElapsedTime:a3];
}

- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t, void, void, double))a5 + 2))(a5, 1LL, 0LL, 0LL, a3);
  }
}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue", a3, a4));
  [v5 changeToItemAtIndex:a3];
}

- (void)changeMediaInDirection:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    [v4 changeToPreviousItem];
  }

  else if (!a3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    [v3 changeToNextItem];
  }

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4
{
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  return 0LL;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  return 0LL;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  if (self->_waitsAfterPreparingMediaItems != a3)
  {
    -[MTTVMusicPlayer willChangeValueForKey:](self, "willChangeValueForKey:", @"waitsAfterPreparingMediaItems");
    self->_waitsAfterPreparingMediaItems = a3;
    -[MTTVMusicPlayer didChangeValueForKey:](self, "didChangeValueForKey:", @"waitsAfterPreparingMediaItems");
  }

- (NSArray)audioOptions
{
  return 0LL;
}

- (TVPTimeRange)seekableTimeRange
{
  id v3 = objc_alloc(&OBJC_CLASS___TVPTimeRange);
  -[MTTVMusicPlayer duration](self, "duration");
  return -[TVPTimeRange initWithStartTime:endTime:](v3, "initWithStartTime:endTime:", 0.0, v4);
}

- (TVPDateRange)seekableDateRange
{
  return 0LL;
}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  return 1;
}

- (void)playQueue:(id)a3 didUpdateQueue:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"TVMusicPlayQueueChangedNotification" object:self];

  LODWORD(v6) = [v5 isRadioPlayback];
  if ((_DWORD)v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentAVItem](self, "currentAVItem"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 timedMetadataIfAvailable]);

    if (v8)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v9 = TVPMediaItemMetadataDidChangeNotification;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentMediaItem](self, "currentMediaItem"));
      [v11 postNotificationName:v9 object:v10];
    }
  }

- (void)playQueue:(id)a3 didChangePlayingItem:(id)a4
{
}

- (void)playQueue:(id)a3 didChangeFromPlayState:(int64_t)a4 toPlayState:(int64_t)a5
{
  id v19 = a3;
  if (a5 == 2 && !self->_currentMediaItem)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer playQueue](self, "playQueue"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentMediaItem]);
    -[MTTVMusicPlayer _setCurrentMediaItem:](self, "_setCurrentMediaItem:", v8);
  }

  if (-[MTTVMusicPlayer isStopped](self, "isStopped") && a5 != 1 && self->_currentMediaItem) {
    -[MTTVMusicPlayer setIsStopped:](self, "setIsStopped:", 0LL);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer state](self, "state"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  id v11 = (void *)v10;
  unsigned int v12 = 0;

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicPlayer _TVPPlaybackStateFromMCPPlayerState:]( self,  "_TVPPlaybackStateFromMCPPlayerState:",  a5));
  -[MTTVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v13);

  if (a5 == 2)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer avPlayer](self, "avPlayer"));
    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPlayerResponse]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localAVPlayer]);

      if (!v16) {
        goto LABEL_16;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPlayerResponse]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 localAVPlayer]);
      -[MTTVMusicPlayer _setAVPlayer:](self, "_setAVPlayer:", v17);
    }
  }

- (void)_setAVPlayer:(id)a3
{
  id v7 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer avPlayer](self, "avPlayer"));

  id v5 = v7;
  if (v4 != v7)
  {
    -[MTTVMusicPlayer setAvPlayer:](self, "setAvPlayer:", v7);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:TVPPlaybackCurrentMediaItemDidChangeNotification object:self userInfo:0];

    id v5 = v7;
  }
}

- (void)setCurrentAVItem:(id)a3
{
  id v5 = (MPAVItem *)a3;
  id v6 = self->_currentAVItem;
  id v7 = v6;
  if (v6 != v5)
  {
    if (v6 && ((unint64_t)-[MPAVItem mediaType](v6, "mediaType") & 0xFF00) != 0)
    {
      mediaItemObservationQueue = (dispatch_queue_s *)self->_mediaItemObservationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000B5030;
      block[3] = &unk_100240240;
      double v22 = v7;
      double v23 = self;
      dispatch_async(mediaItemObservationQueue, block);
    }

    objc_storeStrong((id *)&self->_currentAVItem, a3);
    if (v5 && ((unint64_t)-[MPAVItem mediaType](v5, "mediaType") & 0xFF00) != 0)
    {
      uint64_t v9 = (dispatch_queue_s *)self->_mediaItemObservationQueue;
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = sub_1000B504C;
      id v18 = &unk_100240240;
      id v19 = v5;
      double v20 = self;
      dispatch_async(v9, &v15);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer avPlayer](self, "avPlayer", v15, v16, v17, v18));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentItem]);

    if (v11)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer avPlayer](self, "avPlayer"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentItem]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentMediaItem](self, "currentMediaItem"));
      -[MTTVMusicPlayer _populatePlayerItem:withMetadataFromMediaItem:]( self,  "_populatePlayerItem:withMetadataFromMediaItem:",  v13,  v14);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a5;
  if (off_1002B3D38 == a6)
  {
    id v10 = a4;
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer currentAVItem](self, "currentAVItem"));

    if (v11 == v10)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

      if (v12 == v13)
      {
        v15 = 0LL;
      }

      else
      {
        +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:]( &OBJC_CLASS___TVPTimeRange,  "forwardmostCMTimeRangeInCMTimeRanges:",  v12);
        uint64_t v14 = objc_alloc(&OBJC_CLASS___TVPTimeRange);
        v19[0] = v19[3];
        v19[1] = v19[4];
        v19[2] = v19[5];
        v15 = -[TVPTimeRange initWithCMTimeRange:](v14, "initWithCMTimeRange:", v19);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000B51B8;
      v17[3] = &unk_100240240;
      v17[4] = self;
      id v18 = v15;
      uint64_t v16 = v15;
      +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v17);
    }
  }
}

- (void)playQueue:(id)a3 didChangeAVPlayer:(id)a4
{
}

- (void)playQueue:(id)a3 didChangeDurationSnapshot:(id *)a4
{
  id v6 = a3;
  -[MTTVMusicPlayer setIsLive:](self, "setIsLive:", a4->var7);
  -[MTTVMusicPlayer setDuration:](self, "setDuration:", a4->var3);
  if (([v6 isVideoPlayback] & 1) == 0)
  {
    id v7 = -[TVPTimeRange initWithStartTime:duration:]( objc_alloc(&OBJC_CLASS___TVPTimeRange),  "initWithStartTime:duration:",  0.0,  a4->var3);
    -[MTTVMusicPlayer setBufferedTimeRange:](self, "setBufferedTimeRange:", v7);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers"));
  id v9 = [v8 count];

  if (v9)
  {
    if (v6)
    {
      [v6 durationSnapshot];
    }

    else
    {
      uint64_t v11 = 0LL;
      memset(v10, 0, sizeof(v10));
    }

    -[MTTVMusicPlayer _updateElapsedTimeObserversWithDurationSnapshot:]( self,  "_updateElapsedTimeObserversWithDurationSnapshot:",  v10);
  }
}

- (void)_updateElapsedTimeObserversWithDurationSnapshot:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->var0));
  -[MTTVMusicPlayer elapsedTime](self, "elapsedTime");
  double v7 = v6;
  if (-[MTTVMusicPlayer elapsedTimeJumpInProgress](self, "elapsedTimeJumpInProgress"))
  {
    -[MTTVMusicPlayer targetElapsedTime](self, "targetElapsedTime");
    BOOL v9 = v7 >= v8;
  }

  else
  {
    BOOL v9 = 0;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(double, double))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)i) + 16LL))( v7,  a3->var5);
      }

      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }

  if (v9) {
    -[MTTVMusicPlayer setElapsedTimeJumpInProgress:](self, "setElapsedTimeJumpInProgress:", 0LL);
  }
}

- (void)engineDidPauseForLeaseEnd:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 postNotificationName:@"TVMusicPlayerLeaseDidEndNotification" object:self];
}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 itemError]);
  -[MTTVMusicPlayer _sendNotificationForError:avItem:](self, "_sendNotificationForError:avItem:", v6, v5);
}

- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v10 itemError]);

  if (!v8) {
    [v10 setItemError:v7];
  }
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v10 itemError]);
  -[MTTVMusicPlayer _sendNotificationForError:avItem:](self, "_sendNotificationForError:avItem:", v9, v10);
}

- (void)_sendNotificationForError:(id)a3 avItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 modelGenericObject]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 flattenedGenericObject]);

  if (v6 && v9)
  {
    v16[0] = TVPPlaybackErrorKey;
    v16[1] = @"TVMusicPlayerErrorNotificationGenericObjectKey";
    v17[0] = v6;
    v17[1] = v9;
    v16[2] = TVPPlaybackWillStopDueToErrorKey;
    v17[2] = &__kCFBooleanFalse;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Playback error: %{public}@ for item: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:TVPPlaybackErrorNotification object:self userInfo:v10];
  }
}

- (void)_loadedDurationDidChange:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer", a3));
  id v4 = objc_alloc(&OBJC_CLASS___TVPTimeRange);
  [v7 loadedDuration];
  id v6 = -[TVPTimeRange initWithStartTime:duration:](v4, "initWithStartTime:duration:", 0.0, v5);
  -[MTTVMusicPlayer setBufferedTimeRange:](self, "setBufferedTimeRange:", v6);
}

- (void)_itemReadyToPlay:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B57AC;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_itemChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B5930;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_playerPathChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"TVMusicPlayerMediaItemDidChangeNotification" object:self];
}

- (id)_TVPPlaybackStateFromMCPPlayerState:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicPlayer state](self, "state", v3, v4));
      break;
    case 1LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped", v3, v4));
      break;
    case 2LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing", v3, v4));
      break;
    case 3LL:
    case 6LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState loading](&OBJC_CLASS___TVPPlaybackState, "loading", v3, v4));
      break;
    case 4LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused", v3, v4));
      break;
    case 5LL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning", v3, v4));
      break;
    default:
      double v5 = 0LL;
      break;
  }

  return v5;
}

- (void)_populatePlayerItem:(id)a3 withMetadataFromMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v26 = 0LL;
    id v27 = 0LL;
    unsigned int v10 = -[MTTVMusicPlayer _getStringForTitleLabel:subtitleLabel:forMediaItem:]( self,  "_getStringForTitleLabel:subtitleLabel:forMediaItem:",  &v27,  &v26,  v8);
    id v11 = v27;
    id v12 = v26;
    if (v10)
    {
      if ([v11 length])
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
        -[AVMutableMetadataItem setIdentifier:](v13, "setIdentifier:", AVMetadataCommonIdentifierTitle);
        -[AVMutableMetadataItem setExtendedLanguageTag:](v13, "setExtendedLanguageTag:", @"und");
        -[AVMutableMetadataItem setValue:](v13, "setValue:", v11);
        -[NSMutableArray addObject:](v9, "addObject:", v13);
      }

      if ([v12 length])
      {
        __int16 v14 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
        -[AVMutableMetadataItem setIdentifier:](v14, "setIdentifier:", AVMetadataIdentifieriTunesMetadataTrackSubTitle);
        -[AVMutableMetadataItem setExtendedLanguageTag:](v14, "setExtendedLanguageTag:", @"und");
        -[AVMutableMetadataItem setValue:](v14, "setValue:", v12);
        -[NSMutableArray addObject:](v9, "addObject:", v14);
      }
    }

    v25 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataLongDescription]);
    if ([v15 length])
    {
      __int128 v16 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v16, "setIdentifier:", AVMetadataCommonIdentifierDescription);
      -[AVMutableMetadataItem setExtendedLanguageTag:](v16, "setExtendedLanguageTag:", @"und");
      -[AVMutableMetadataItem setValue:](v16, "setValue:", v15);
      -[NSMutableArray addObject:](v9, "addObject:", v16);
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRating]);
    if ([v17 length])
    {
      __int128 v18 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v18, "setIdentifier:", AVMetadataIdentifieriTunesMetadataContentRating);
      -[AVMutableMetadataItem setExtendedLanguageTag:](v18, "setExtendedLanguageTag:", @"und");
      -[AVMutableMetadataItem setValue:](v18, "setValue:", v17);
      -[NSMutableArray addObject:](v9, "addObject:", v18);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataGenre]);
    if ([v19 length])
    {
      double v20 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v20, "setIdentifier:", AVMetadataIdentifierQuickTimeMetadataGenre);
      -[AVMutableMetadataItem setExtendedLanguageTag:](v20, "setExtendedLanguageTag:", @"und");
      -[AVMutableMetadataItem setValue:](v20, "setValue:", v19);
      -[NSMutableArray addObject:](v9, "addObject:", v20);
    }

    double v21 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataDateReleased]);
    if (v21)
    {
      double v22 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v22, "setIdentifier:", AVMetadataIdentifieriTunesMetadataReleaseDate);
      -[AVMutableMetadataItem setExtendedLanguageTag:](v22, "setExtendedLanguageTag:", @"und");
      -[AVMutableMetadataItem setValue:](v22, "setValue:", v21);
      -[NSMutableArray addObject:](v9, "addObject:", v22);
    }

    double v23 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataAlbum]);
    if ([v23 length])
    {
      v24 = objc_alloc_init(&OBJC_CLASS___AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v24, "setIdentifier:", AVMetadataCommonIdentifierAlbumName);
      -[AVMutableMetadataItem setExtendedLanguageTag:](v24, "setExtendedLanguageTag:", @"und");
      -[AVMutableMetadataItem setValue:](v24, "setValue:", v23);
      -[NSMutableArray addObject:](v9, "addObject:", v24);
    }

    [v6 setExternalMetadata:v9];
  }
}

- (BOOL)_getStringForTitleLabel:(id *)a3 subtitleLabel:(id *)a4 forMediaItem:(id)a5
{
  uint64_t v7 = TVPMediaItemMetadataTitle;
  id v8 = a5;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:v7]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataSeriesTitle]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataSubtitle]);

  if ([v10 length])
  {
    *a3 = v10;
    id v12 = v9;
  }

  else
  {
    if (![v9 length])
    {
      id v15 = v11;
      id v13 = 0LL;
      *a3 = v15;
      goto LABEL_6;
    }

    *a3 = v9;
    id v12 = v11;
  }

  id v13 = v12;
LABEL_6:
  *a4 = v13;

  return 1;
}

- (int64_t)errorBehavior
{
  return self->errorBehavior;
}

- (void)setErrorBehavior:(int64_t)a3
{
  self->errorBehavior = a3;
}

- (BOOL)interactive
{
  return self->interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->interactive = a3;
}

- (TVPChapterCollection)currentChapterCollection
{
  return self->currentChapterCollection;
}

- (void)setCurrentChapterCollection:(id)a3
{
}

- (BOOL)limitReadAhead
{
  return self->limitReadAhead;
}

- (void)setLimitReadAhead:(BOOL)a3
{
  self->limitReadAhead = a3;
}

- (double)rateUsedForPlayback
{
  return self->rateUsedForPlayback;
}

- (BOOL)muted
{
  return self->muted;
}

- (void)setMuted:(BOOL)a3
{
  self->muted = a3;
}

- (BOOL)waitsAfterPreparingMediaItems
{
  return self->_waitsAfterPreparingMediaItems;
}

- (BOOL)updatesMediaRemoteInfoAutomatically
{
  return self->updatesMediaRemoteInfoAutomatically;
}

- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3
{
  self->updatesMediaRemoteInfoAutomatically = a3;
}

- (NSArray)subtitleOptions
{
  return self->subtitleOptions;
}

- (double)maximumBitRate
{
  return self->maximumBitRate;
}

- (void)setMaximumBitRate:(double)a3
{
  self->maximumBitRate = a3;
}

- (TVPASyncPlaybackDelegate)asyncDelegate
{
  return (TVPASyncPlaybackDelegate *)objc_loadWeakRetained((id *)&self->asyncDelegate);
}

- (void)setAsyncDelegate:(id)a3
{
}

- (TVPSubtitleOption)selectedSubtitleOption
{
  return self->selectedSubtitleOption;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return self->preventsSleepDuringVideoPlayback;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  self->preventsSleepDuringVideoPlayback = a3;
}

- (int64_t)mediaItemEndAction
{
  return self->mediaItemEndAction;
}

- (void)setMediaItemEndAction:(int64_t)a3
{
  self->mediaItemEndAction = a3;
}

- (TVPInterstitial)currentInterstitial
{
  return self->currentInterstitial;
}

- (NSArray)chapterCollections
{
  return self->chapterCollections;
}

- (TVPAudioOption)selectedAudioOption
{
  return self->selectedAudioOption;
}

- (void)setSelectedAudioOption:(id)a3
{
}

- (double)forwardPlaybackEndTime
{
  return self->forwardPlaybackEndTime;
}

- (NSDate)playbackDate
{
  return self->playbackDate;
}

- (void)setPlaybackDate:(id)a3
{
}

- (float)volume
{
  return self->volume;
}

- (void)setVolume:(float)a3
{
  self->volume = a3;
}

- (double)reversePlaybackEndTime
{
  return self->reversePlaybackEndTime;
}

- (TVPChapter)currentChapter
{
  return self->currentChapter;
}

- (BOOL)currentMediaItemInitialLoadingComplete
{
  return self->currentMediaItemInitialLoadingComplete;
}

- (void)setCurrentMediaItemInitialLoadingComplete:(BOOL)a3
{
  self->currentMediaItemInitialLoadingComplete = a3;
}

- (MTTVMusicPlayQueue)playQueue
{
  return self->_playQueue;
}

- (void)setPlayQueue:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)elapsedTimeObservers
{
  return self->_elapsedTimeObservers;
}

- (void)setElapsedTimeObservers:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (BOOL)elapsedTimeJumpInProgress
{
  return self->_elapsedTimeJumpInProgress;
}

- (void)setElapsedTimeJumpInProgress:(BOOL)a3
{
  self->_elapsedTimeJumpInProgress = a3;
}

- (double)targetElapsedTime
{
  return self->_targetElapsedTime;
}

- (void)setTargetElapsedTime:(double)a3
{
  self->_targetElapsedTime = a3;
}

- (TVPPlaybackState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (TVPTimeRange)bufferedTimeRange
{
  return self->_bufferedTimeRange;
}

- (void)setBufferedTimeRange:(id)a3
{
}

- (MPAVItem)currentAVItem
{
  return self->_currentAVItem;
}

- (MPIdentifierSet)identifiersForLastPlayedContainer
{
  return self->_identifiersForLastPlayedContainer;
}

- (void)setIdentifiersForLastPlayedContainer:(id)a3
{
}

- (MPIdentifierSet)identifiersForLastEndedPlaybackItem
{
  return self->_identifiersForLastEndedPlaybackItem;
}

- (void)setIdentifiersForLastEndedPlaybackItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end