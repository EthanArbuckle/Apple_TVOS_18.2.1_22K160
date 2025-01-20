@interface TVMusicPlayer
- (BOOL)currentMediaItemHasDates;
- (BOOL)currentMediaItemHasVideoContent;
- (BOOL)currentMediaItemInitialLoadingComplete;
- (BOOL)currentMediaItemIsStreaming;
- (BOOL)currentMediaItemPreparedForLoading;
- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer;
- (BOOL)elapsedTimeJumpInProgress;
- (BOOL)interactive;
- (BOOL)isLive;
- (BOOL)isLoading;
- (BOOL)limitReadAhead;
- (BOOL)muted;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)updatesMediaRemoteInfoAutomatically;
- (BOOL)waitsAfterPreparingMediaItems;
- (CGSize)currentMediaItemPresentationSize;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackIntent)fallbackPlaybackIntent;
- (MPCVideoView)videoView;
- (NSArray)audioOptions;
- (NSArray)chapterCollections;
- (NSArray)subtitleOptions;
- (NSDate)playbackDate;
- (NSMutableArray)elapsedTimeObservers;
- (NSString)name;
- (TVMusicPlayQueue)playQueue;
- (TVMusicPlayer)init;
- (TVMusicPlayer)initWithAgeGateInfo:(id)a3;
- (TVMusicPlayer)initWithName:(id)a3;
- (TVMusicPlayerPlaybackEngineQueueEndedObserver)playbackQueueEndedObserver;
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
- (id)_mpGenericObjectFromMPAVItem:(id)a3;
- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4;
- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4;
- (id)addElapsedTimeObserver:(id)a3;
- (int64_t)errorBehavior;
- (int64_t)mediaItemEndAction;
- (void)_sendNotificationForError:(id)a3 avItem:(id)a4 isFirstItem:(BOOL)a5;
- (void)_setCurrentMediaItem:(id)a3;
- (void)_setCurrentState:(id)a3;
- (void)_updateElapsedTimeObserversWithDurationSnapshot:(id *)a3;
- (void)addWeakReferenceToVideoView:(id)a3;
- (void)changeMediaInDirection:(int64_t)a3;
- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4;
- (void)continueLoadingCurrentItem;
- (void)dealloc;
- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 didPauseForLeaseEndWithError:(id)a4;
- (void)engine:(id)a3 requiresAuthorizationToPlayItem:(id)a4 reason:(int64_t)a5 authorizationHandler:(id)a6;
- (void)engineDidPauseForLeaseEnd:(id)a3;
- (void)invalidate;
- (void)pause;
- (void)pauseIgnoringDelegate:(BOOL)a3;
- (void)pauseWithVolumeRampDuration:(double)a3;
- (void)play;
- (void)playIgnoringDelegate:(BOOL)a3;
- (void)playQueue:(id)a3 didChangeCurrentPlayingSection:(id)a4;
- (void)playQueue:(id)a3 didChangeDurationSnapshot:(id *)a4;
- (void)playQueue:(id)a3 didChangeFromPlayState:(int64_t)a4 toPlayState:(int64_t)a5;
- (void)playQueue:(id)a3 didChangePlayingItem:(id)a4;
- (void)playQueue:(id)a3 didChangeVideoView:(id)a4;
- (void)playQueue:(id)a3 didUpdateQueue:(id)a4;
- (void)removeElapsedTimeObserverWithToken:(id)a3;
- (void)removeWeakReferenceToVideoView:(id)a3;
- (void)scanWithRate:(double)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setBufferedTimeRange:(id)a3;
- (void)setCurrentChapterCollection:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5;
- (void)setElapsedTimeJumpInProgress:(BOOL)a3;
- (void)setElapsedTimeObservers:(id)a3;
- (void)setErrorBehavior:(int64_t)a3;
- (void)setFallbackPlaybackIntent:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setMaximumBitRate:(double)a3;
- (void)setMediaItemEndAction:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlayQueue:(id)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPlaybackQueueEndedObserver:(id)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setSelectedAudioOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4;
- (void)setState:(id)a3;
- (void)setTargetElapsedTime:(double)a3;
- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3;
- (void)setVideoView:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3;
- (void)stop;
- (void)stopAndClearPlayQueue:(BOOL)a3;
- (void)stopWithVolumeRampDuration:(double)a3;
- (void)togglePlayPause;
@end

@implementation TVMusicPlayer

- (TVMusicPlayer)init
{
  return -[TVMusicPlayer initWithAgeGateInfo:](self, "initWithAgeGateInfo:", 0LL);
}

- (TVMusicPlayer)initWithName:(id)a3
{
  id v5 = a3;
  v6 = -[TVMusicPlayer init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (TVMusicPlayer)initWithAgeGateInfo:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVMusicPlayer;
  v6 = -[TVMusicPlayer init](&v28, "init");
  if (v6)
  {
    id v7 = sub_100079F6C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[TVMusicPlayer initWithAgeGateInfo:]";
      __int16 v31 = 2080;
      v32 = "-[TVMusicPlayer initWithAgeGateInfo:]";
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %s: %@", buf, 0x20u);
    }

    p_ageGateInfo = (id *)&v6->_ageGateInfo;
    objc_storeStrong((id *)&v6->_ageGateInfo, a3);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TVMusicPlayer._mediaItemObservationQueue", 0LL);
    mediaItemObservationQueue = v6->_mediaItemObservationQueue;
    v6->_mediaItemObservationQueue = (OS_dispatch_queue *)v10;

    ageGateInfo = v6->_ageGateInfo;
    if (ageGateInfo && -[TVMusicAgeGateInfo isAgeGateEnabled](ageGateInfo, "isAgeGateEnabled"))
    {
      id v13 = [*p_ageGateInfo ratingThreshold];
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[MPRestrictionsMonitor sharedRestrictionsMonitor]( &OBJC_CLASS___MPRestrictionsMonitor,  "sharedRestrictionsMonitor"));
      [v14 setMaximumTVShowRatingForAgeGate:v13];

      id v15 = [*p_ageGateInfo ratingThreshold];
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[MPRestrictionsMonitor sharedRestrictionsMonitor]( &OBJC_CLASS___MPRestrictionsMonitor,  "sharedRestrictionsMonitor"));
      [v16 setMaximumMovieRatingForAgeGate:v15];
    }

    if ((_os_feature_enabled_impl("Sonic", "SonicMusic") & 1) == 0)
    {
      v17 = -[MPCPlaybackEngine initWithPlayerID:]( objc_alloc(&OBJC_CLASS___MPCPlaybackEngine),  "initWithPlayerID:",  @"Music");
      playbackEngine = v6->_playbackEngine;
      v6->_playbackEngine = v17;

      -[MPCPlaybackEngine setAudioAnalyzerEnabled:](v6->_playbackEngine, "setAudioAnalyzerEnabled:", 1LL);
      -[MPCPlaybackEngine setVideoSupported:](v6->_playbackEngine, "setVideoSupported:", 1LL);
      -[MPCPlaybackEngine setSystemMusicApplication:](v6->_playbackEngine, "setSystemMusicApplication:", 1LL);
      -[MPCPlaybackEngine setDelegate:](v6->_playbackEngine, "setDelegate:", v6);
      v19 = objc_alloc_init(&OBJC_CLASS___TVMusicPlayerPlaybackEngineQueueEndedObserver);
      playbackQueueEndedObserver = v6->_playbackQueueEndedObserver;
      v6->_playbackQueueEndedObserver = v19;

      -[MPCPlaybackEngine addEngineObserver:]( v6->_playbackEngine,  "addEngineObserver:",  v6->_playbackQueueEndedObserver);
      -[MPCPlaybackEngine start](v6->_playbackEngine, "start");
      -[MPCPlaybackEngine becomeActive](v6->_playbackEngine, "becomeActive");
    }

    v21 = objc_alloc_init(&OBJC_CLASS___TVMusicPlayQueue);
    playQueue = v6->_playQueue;
    v6->_playQueue = v21;

    -[TVMusicPlayQueue setDelegate:](v6->_playQueue, "setDelegate:", v6);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
    state = v6->_state;
    v6->_state = (TVPPlaybackState *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    elapsedTimeObservers = v6->_elapsedTimeObservers;
    v6->_elapsedTimeObservers = (NSMutableArray *)v25;
  }

  return v6;
}

- (void)dealloc
{
  id v3 = sub_100079F6C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[TVMusicPlayer dealloc]";
    __int16 v9 = 2080;
    dispatch_queue_t v10 = "-[TVMusicPlayer dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  if (self->_playbackQueueEndedObserver) {
    -[MPCPlaybackEngine removeEngineObserver:](self->_playbackEngine, "removeEngineObserver:");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicPlayer;
  -[TVMusicPlayer dealloc](&v6, "dealloc");
}

- (void)setFallbackPlaybackIntent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100079F6C();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[TVMusicPlayer setFallbackPlaybackIntent:]";
    __int16 v10 = 2080;
    v11 = "-[TVMusicPlayer setFallbackPlaybackIntent:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: %@", (uint8_t *)&v8, 0x20u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playbackEngine](self, "playbackEngine"));
  [v7 setFallbackPlaybackIntent:v4];
}

- (MPCPlaybackIntent)fallbackPlaybackIntent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playbackEngine](self, "playbackEngine"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fallbackPlaybackIntent]);

  return (MPCPlaybackIntent *)v3;
}

- (BOOL)currentMediaItemHasVideoContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPlayerResponse]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 videoView]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (BOOL)currentMediaItemPreparedForLoading
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer currentMediaItem](self, "currentMediaItem"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)currentMediaItemIsStreaming
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer currentMediaItem](self, "currentMediaItem"));
  unsigned __int8 v3 = [v2 hasTrait:TVPMediaItemTraitIsStreaming];

  return v3;
}

- (CGSize)currentMediaItemPresentationSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)currentMediaItemHasDates
{
  return 0;
}

- (id)addElapsedTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_100079F6C();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[TVMusicPlayer addElapsedTimeObserver:]";
    __int16 v13 = 2080;
    v14 = "-[TVMusicPlayer addElapsedTimeObserver:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v11, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers"));
  id v8 = objc_retainBlock(v4);
  [v7 addObject:v8];

  id v9 = objc_retainBlock(v4);
  return v9;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  id v4 = a3;
  id v5 = sub_100079F6C();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[TVMusicPlayer removeElapsedTimeObserverWithToken:]";
    __int16 v11 = 2080;
    __int16 v12 = "-[TVMusicPlayer removeElapsedTimeObserverWithToken:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v9, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers"));
  id v8 = objc_retainBlock(v4);

  [v7 removeObject:v8];
}

- (double)rate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  unsigned __int8 v3 = v2;
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
  id v3 = sub_100079F6C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[TVMusicPlayer pause]";
    __int16 v8 = 2080;
    int v9 = "-[TVMusicPlayer pause]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: Pause", (uint8_t *)&v6, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  [v5 pause];
}

- (void)scanWithRate:(double)a3
{
  id v5 = sub_100079F6C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[TVMusicPlayer scanWithRate:]";
    __int16 v10 = 2080;
    __int16 v11 = "-[TVMusicPlayer scanWithRate:]";
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Scan with rate: %g",  (uint8_t *)&v8,  0x20u);
  }

  if (a3 <= 1.0)
  {
    if (a3 >= -1.0)
    {
      if (a3 != 1.0) {
        return;
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
      [v7 play];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
      [v7 rewind];
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    [v7 fastForward];
  }
}

- (void)togglePlayPause
{
  id v3 = sub_100079F6C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[TVMusicPlayer togglePlayPause]";
    __int16 v9 = 2080;
    __int16 v10 = "-[TVMusicPlayer togglePlayPause]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Toggle Play/Pause",  (uint8_t *)&v7,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  id v6 = [v5 playerState];

  if (v6 == (id)2) {
    -[TVMusicPlayer pause](self, "pause");
  }
  else {
    -[TVMusicPlayer play](self, "play");
  }
}

- (void)play
{
  id v3 = sub_100079F6C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[TVMusicPlayer play]";
    __int16 v8 = 2080;
    __int16 v9 = "-[TVMusicPlayer play]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: Play", (uint8_t *)&v6, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  [v5 play];
}

- (void)stop
{
  id v3 = sub_100079F6C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[TVMusicPlayer stop]";
    __int16 v11 = 2080;
    __int16 v12 = "-[TVMusicPlayer stop]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: Stop", (uint8_t *)&v9, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer currentMediaItem](self, "currentMediaItem"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);

  BOOL v8 = v6 == (void *)TVPMediaTypeMovie || v6 == (void *)TVPMediaTypeVideo || v6 == (void *)TVPMediaTypeTVEpisode;
  -[TVMusicPlayer stopAndClearPlayQueue:](self, "stopAndClearPlayQueue:", v8);
}

- (void)stopAndClearPlayQueue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100079F6C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[TVMusicPlayer stopAndClearPlayQueue:]";
    __int16 v11 = 2080;
    __int16 v12 = "-[TVMusicPlayer stopAndClearPlayQueue:]";
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: clearPlayQueue: %{BOOL}d",  (uint8_t *)&v9,  0x1Cu);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  [v7 pause];

  if (v3)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    [v8 clearPlayQueueWithCompletionHandler:0];
  }

- (TVPMediaItem)currentMediaItem
{
  if (self->_currentMediaItem)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMediaItem]);
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return (TVPMediaItem *)v3;
}

- (void)_setCurrentState:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self, "state"));

  if (v5 != v4)
  {
    id v6 = sub_100079F6C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v14 = "-[TVMusicPlayer _setCurrentState:]";
      __int16 v15 = 2080;
      v16 = "-[TVMusicPlayer _setCurrentState:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: state: %@", buf, 0x20u);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self, "state", TVPPlaybackStateOldStateKey));
    v11[1] = TVPPlaybackStateNewStateKey;
    v12[0] = v8;
    v12[1] = v4;
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

    -[TVMusicPlayer setState:](self, "setState:", v4);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 postNotificationName:TVPPlaybackStateDidChangeNotification object:self userInfo:v9];
  }
}

- (void)_setCurrentMediaItem:(id)a3
{
  id v5 = (TVPMediaItem *)a3;
  if (self->_currentMediaItem != v5)
  {
    objc_storeStrong((id *)&self->_currentMediaItem, a3);
    if (v5)
    {
      id v6 = sub_100079F6C();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        __int16 v10 = "-[TVMusicPlayer _setCurrentMediaItem:]";
        __int16 v11 = 2080;
        __int16 v12 = "-[TVMusicPlayer _setCurrentMediaItem:]";
        __int16 v13 = 2112;
        BOOL v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %s: media item: %@",  (uint8_t *)&v9,  0x20u);
      }

      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 postNotificationName:TVPPlaybackCurrentMediaItemDidChangeNotification object:self userInfo:0];
    }
  }
}

- (double)elapsedTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  [v2 currentPlayingElapsedTime];
  double v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
  [v5 setElapsedTime:a3];
}

- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  BOOL v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1LL, 0LL, 0LL);
  }
  if (!v10)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playbackEngine](self, "playbackEngine"));
    -[TVMusicPlayer elapsedTime](self, "elapsedTime");
    objc_msgSend(v9, "reportUserSeekFromTime:toTime:");
  }
}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue", a3, a4));
  [v5 changeToItemAtIndex:a3];
}

- (void)changeMediaInDirection:(int64_t)a3
{
  if (a3 == 1)
  {
    id v7 = sub_100079F6C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[TVMusicPlayer changeMediaInDirection:]";
      __int16 v11 = 2080;
      __int16 v12 = "-[TVMusicPlayer changeMediaInDirection:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %s: Backward", (uint8_t *)&v9, 0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    [v6 changeToPreviousItem];
  }

  else
  {
    if (a3) {
      return;
    }
    id v4 = sub_100079F6C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[TVMusicPlayer changeMediaInDirection:]";
      __int16 v11 = 2080;
      __int16 v12 = "-[TVMusicPlayer changeMediaInDirection:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: Forward", (uint8_t *)&v9, 0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    [v6 changeToNextItem];
  }
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  id v4 = sub_100079F6C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[TVMusicPlayer addBoundaryTimeObserverForTimes:withHandler:]";
    __int16 v9 = 2080;
    id v10 = "-[TVMusicPlayer addBoundaryTimeObserverForTimes:withHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v7, 0x16u);
  }

  return 0LL;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  id v4 = sub_100079F6C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[TVMusicPlayer addBoundaryTimeObserverForDates:withHandler:]";
    __int16 v9 = 2080;
    id v10 = "-[TVMusicPlayer addBoundaryTimeObserverForDates:withHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v7, 0x16u);
  }

  return 0LL;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    int v8 = 136315650;
    __int16 v9 = "-[TVMusicPlayer setWaitsAfterPreparingMediaItems:]";
    if (v3) {
      int v7 = @"YES";
    }
    __int16 v10 = 2080;
    __int16 v11 = "-[TVMusicPlayer setWaitsAfterPreparingMediaItems:]";
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: waitsAfterPreparingMediaItems: %@",  (uint8_t *)&v8,  0x20u);
  }

  if (self->_waitsAfterPreparingMediaItems != v3)
  {
    -[TVMusicPlayer willChangeValueForKey:](self, "willChangeValueForKey:", @"waitsAfterPreparingMediaItems");
    self->_waitsAfterPreparingMediaItems = v3;
    -[TVMusicPlayer didChangeValueForKey:](self, "didChangeValueForKey:", @"waitsAfterPreparingMediaItems");
  }

- (void)playIgnoringDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[TVMusicPlayer playIgnoringDelegate:]";
    __int16 v9 = 2080;
    __int16 v10 = "-[TVMusicPlayer playIgnoringDelegate:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: ignoreDelegate: %d",  (uint8_t *)&v7,  0x1Cu);
  }

  -[TVMusicPlayer play](self, "play");
}

- (void)pauseIgnoringDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[TVMusicPlayer pauseIgnoringDelegate:]";
    __int16 v9 = 2080;
    __int16 v10 = "-[TVMusicPlayer pauseIgnoringDelegate:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: ignoreDelegate: %d",  (uint8_t *)&v7,  0x1Cu);
  }

  -[TVMusicPlayer pause](self, "pause");
}

- (void)pauseWithVolumeRampDuration:(double)a3
{
  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[TVMusicPlayer pauseWithVolumeRampDuration:]";
    __int16 v9 = 2080;
    __int16 v10 = "-[TVMusicPlayer pauseWithVolumeRampDuration:]";
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: volumeRampDuration: %g",  (uint8_t *)&v7,  0x20u);
  }

  -[TVMusicPlayer pause](self, "pause");
}

- (void)stopWithVolumeRampDuration:(double)a3
{
  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[TVMusicPlayer stopWithVolumeRampDuration:]";
    __int16 v9 = 2080;
    __int16 v10 = "-[TVMusicPlayer stopWithVolumeRampDuration:]";
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: volumeRampDuration: %g",  (uint8_t *)&v7,  0x20u);
  }

  -[TVMusicPlayer stop](self, "stop");
}

- (void)continueLoadingCurrentItem
{
  id v2 = sub_100079F6C();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[TVMusicPlayer continueLoadingCurrentItem]";
    __int16 v6 = 2080;
    int v7 = "-[TVMusicPlayer continueLoadingCurrentItem]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v4, 0x16u);
  }
}

- (void)addWeakReferenceToVideoView:(id)a3
{
  id v3 = sub_100079F6C();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[TVMusicPlayer addWeakReferenceToVideoView:]";
    __int16 v7 = 2080;
    int v8 = "-[TVMusicPlayer addWeakReferenceToVideoView:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v5, 0x16u);
  }
}

- (void)removeWeakReferenceToVideoView:(id)a3
{
  id v3 = sub_100079F6C();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[TVMusicPlayer removeWeakReferenceToVideoView:]";
    __int16 v7 = 2080;
    int v8 = "-[TVMusicPlayer removeWeakReferenceToVideoView:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v5, 0x16u);
  }
}

- (void)invalidate
{
  id v2 = sub_100079F6C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[TVMusicPlayer invalidate]";
    __int16 v6 = 2080;
    __int16 v7 = "-[TVMusicPlayer invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v4, 0x16u);
  }
}

- (NSArray)audioOptions
{
  return 0LL;
}

- (TVPTimeRange)seekableTimeRange
{
  id v3 = objc_alloc(&OBJC_CLASS___TVPTimeRange);
  -[TVMusicPlayer duration](self, "duration");
  return -[TVPTimeRange initWithStartTime:endTime:](v3, "initWithStartTime:endTime:", 0.0, v4);
}

- (TVPDateRange)seekableDateRange
{
  return 0LL;
}

- (void)setSelectedSubtitleOption:(id)a3
{
  id v3 = sub_100079F6C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[TVMusicPlayer setSelectedSubtitleOption:]";
    __int16 v7 = 2080;
    int v8 = "-[TVMusicPlayer setSelectedSubtitleOption:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v5, 0x16u);
  }
}

- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4
{
  id v4 = sub_100079F6C();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    __int16 v7 = "-[TVMusicPlayer setSelectedSubtitleOption:setGlobalPreference:]";
    __int16 v8 = 2080;
    __int16 v9 = "-[TVMusicPlayer setSelectedSubtitleOption:setGlobalPreference:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  return 1;
}

- (void)playQueue:(id)a3 didUpdateQueue:(id)a4
{
  id v5 = a4;
  id v6 = sub_100079F6C();
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[TVMusicPlayer playQueue:didUpdateQueue:]";
    __int16 v11 = 2080;
    double v12 = "-[TVMusicPlayer playQueue:didUpdateQueue:]";
    __int16 v13 = 2048;
    id v14 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: %ld items", (uint8_t *)&v9, 0x20u);
  }

  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"TVMusicPlayQueueChangedNotification" object:self];
}

- (void)playQueue:(id)a3 didChangePlayingItem:(id)a4
{
  id v5 = a4;
  id v6 = sub_100079F6C();
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[TVMusicPlayer playQueue:didChangePlayingItem:]";
    __int16 v10 = 2080;
    __int16 v11 = "-[TVMusicPlayer playQueue:didChangePlayingItem:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: media item: %@", (uint8_t *)&v8, 0x20u);
  }

  -[TVMusicPlayer _setCurrentMediaItem:](self, "_setCurrentMediaItem:", v5);
}

- (void)playQueue:(id)a3 didChangeFromPlayState:(int64_t)a4 toPlayState:(int64_t)a5
{
  id v10 = a3;
  if (a5 == 2 && !self->_currentMediaItem)
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentMediaItem]);
    -[TVMusicPlayer _setCurrentMediaItem:](self, "_setCurrentMediaItem:", v8);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer _TVPPlaybackStateFromMCPPlayerState:](self, "_TVPPlaybackStateFromMCPPlayerState:", a5));
  -[TVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v9);
}

- (void)playQueue:(id)a3 didChangeVideoView:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer videoView](self, "videoView"));

  if (v6 != v5)
  {
    id v7 = sub_100079F6C();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer videoView](self, "videoView"));
      int v12 = 136315906;
      id v13 = "-[TVMusicPlayer playQueue:didChangeVideoView:]";
      __int16 v14 = 2080;
      __int16 v15 = "-[TVMusicPlayer playQueue:didChangeVideoView:]";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %s: old=%@, new=%@",  (uint8_t *)&v12,  0x2Au);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer videoView](self, "videoView"));
    -[TVMusicPlayer setVideoView:](self, "setVideoView:", v5);
    if (!v10)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v11 postNotificationName:TVPPlaybackCurrentMediaItemDidChangeNotification object:self];
    }
  }
}

- (void)playQueue:(id)a3 didChangeDurationSnapshot:(id *)a4
{
  id v6 = a3;
  -[TVMusicPlayer setIsLive:](self, "setIsLive:", a4->var7);
  -[TVMusicPlayer setDuration:](self, "setDuration:", a4->var3);
  if (a4->var8 != -[TVMusicPlayer isLoading](self, "isLoading"))
  {
    id v7 = sub_100079F6C();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var8 = a4->var8;
      *(_DWORD *)buf = 136315650;
      v20 = "-[TVMusicPlayer playQueue:didChangeDurationSnapshot:]";
      __int16 v21 = 2080;
      v22 = "-[TVMusicPlayer playQueue:didChangeDurationSnapshot:]";
      __int16 v23 = 1024;
      BOOL v24 = var8;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %s: isLoading: %{BOOL}d", buf, 0x1Cu);
    }

    -[TVMusicPlayer setIsLoading:](self, "setIsLoading:", a4->var8);
    if (a4->var8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState loading](&OBJC_CLASS___TVPPlaybackState, "loading"));
      -[TVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v10);
LABEL_6:

      goto LABEL_8;
    }

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self, "state"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState loading](&OBJC_CLASS___TVPPlaybackState, "loading"));

    if (v11 == v12)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue"));
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayer _TVPPlaybackStateFromMCPPlayerState:]( self,  "_TVPPlaybackStateFromMCPPlayerState:",  [v10 playerState]));
      -[TVMusicPlayer _setCurrentState:](self, "_setCurrentState:", v16);

      goto LABEL_6;
    }
  }

- (void)playQueue:(id)a3 didChangeCurrentPlayingSection:(id)a4
{
  int v9 = @"localPlayback";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self, "playQueue", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isLocalDeviceQueue]));
  id v10 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"TVMusicPlaybackContainerChangedNotification" object:self userInfo:v7];
}

- (void)_updateElapsedTimeObserversWithDurationSnapshot:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->var0));
  -[TVMusicPlayer elapsedTime](self, "elapsedTime");
  double v7 = v6;
  if (-[TVMusicPlayer elapsedTimeJumpInProgress](self, "elapsedTimeJumpInProgress"))
  {
    -[TVMusicPlayer targetElapsedTime](self, "targetElapsedTime");
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
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer elapsedTimeObservers](self, "elapsedTimeObservers", 0LL));
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
    -[TVMusicPlayer setElapsedTimeJumpInProgress:](self, "setElapsedTimeJumpInProgress:", 0LL);
  }
}

- (void)engineDidPauseForLeaseEnd:(id)a3
{
  id v4 = sub_100079F6C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[TVMusicPlayer engineDidPauseForLeaseEnd:]";
    __int16 v9 = 2080;
    id v10 = "-[TVMusicPlayer engineDidPauseForLeaseEnd:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v7, 0x16u);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"TVMusicPlayerLeaseDidEndNotification" object:self];
}

- (void)engine:(id)a3 didPauseForLeaseEndWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100079F6C();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v18 = "-[TVMusicPlayer engine:didPauseForLeaseEndWithError:]";
    __int16 v19 = 2080;
    v20 = "-[TVMusicPlayer engine:didPauseForLeaseEndWithError:]";
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: %@", buf, 0x20u);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MPCErrorUserInfoKeyLeaseStatus]);

  if (v9
    && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___ICMusicSubscriptionLeaseStatus, v10),
        (objc_opt_isKindOfClass(v9, v11) & 1) != 0))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateReasonDialog", @"TVMusicPlayerStoreDialogResponseKey"));
    __int128 v16 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 postNotificationName:@"TVMusicPlayerLeaseDidEndNotification" object:self userInfo:v13];
}

- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100079F6C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    uint64_t v15 = "-[TVMusicPlayer engine:didFailToPlayItem:withError:]";
    __int16 v16 = 2080;
    __int128 v17 = "-[TVMusicPlayer engine:didFailToPlayItem:withError:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %s: item: %@, error: %@",  (uint8_t *)&v14,  0x2Au);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 itemError]);
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (id)v11;
  }
  else {
    id v13 = v8;
  }
  -[TVMusicPlayer _sendNotificationForError:avItem:isFirstItem:]( self,  "_sendNotificationForError:avItem:isFirstItem:",  v13,  v7,  0LL);
}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100079F6C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[TVMusicPlayer engine:didFailToPlayFirstItem:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicPlayer engine:didFailToPlayFirstItem:withError:]";
    *(_WORD *)&buf[22] = 2112;
    v51 = v7;
    LOWORD(v52[0]) = 2112;
    *(id *)((char *)v52 + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %s: item: %@, error: %@", buf, 0x2Au);
  }

  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPRestrictionsMonitor sharedRestrictionsMonitor]( &OBJC_CLASS___MPRestrictionsMonitor,  "sharedRestrictionsMonitor"));
    unsigned __int8 v14 = [v13 allowsExplicitContent];

    if ((v14 & 1) == 0 && v12)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
      if ([v15 isEqualToString:ICRadioServerErrorDomain])
      {
        id v16 = [v12 code];

        if (v16 == (id)125)
        {
          BOOL v17 = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
          if (v17)
          {
            sub_10007CD60((id)v17);
LABEL_38:

            goto LABEL_39;
          }

          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_10007DE6C;
          v51 = &unk_100268D60;
          v35 = &stru_10026BBE8;
          goto LABEL_37;
        }
      }

      else
      {
      }
    }

    if (+[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted"))
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      unsigned int v19 = [v18 isEqualToString:@"MPAVControllerErrorDomain"];

      if (v19)
      {
        BOOL v20 = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
        if (v20)
        {
          sub_10007CDB0((id)v20);
          goto LABEL_38;
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_10007DE6C;
        v51 = &unk_100268D60;
        v35 = &stru_10026BC28;
LABEL_37:
        v52[0] = v35;
        dispatch_async(&_dispatch_main_q, buf);

        goto LABEL_38;
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
    if ([v21 isEqualToString:ICRadioServerErrorDomain])
    {
      id v22 = [v12 code];

      if (v22 != (id)141)
      {
LABEL_21:
        v26 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
        uint64_t v27 = MPAVItemUserInfoKeyStoreDialogDictionary;
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:MPAVItemUserInfoKeyStoreDialogDictionary]);
        if (v28)
        {
          v29 = (void *)v28;
        }

        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v27]);

          if (!v29)
          {
            if (((unint64_t)[v7 mediaType] & 0xFF00) == 0
              || !+[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted"))
            {
              goto LABEL_38;
            }

            BOOL v36 = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
            if (v36)
            {
              sub_10007CF94((id)v36);
              goto LABEL_38;
            }

            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = sub_10007DE6C;
            v51 = &unk_100268D60;
            v35 = &stru_10026BC88;
            goto LABEL_37;
          }
        }

        id v31 = sub_100079F6C();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Showing store dialog: %@", buf, 0xCu);
        }

        v41 = _NSConcreteStackBlock;
        uint64_t v42 = 3221225472LL;
        v43 = sub_10007CE9C;
        v44 = &unk_100268CF0;
        id v24 = v29;
        id v45 = v24;
        __int16 v33 = &v41;
        if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v41, v42))
        {
          v43((uint64_t)v33);
        }

        else
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_10007DE6C;
          v51 = &unk_100268D60;
          v52[0] = v33;
          dispatch_async(&_dispatch_main_q, buf);
        }

        id v34 = v45;
LABEL_30:

        goto LABEL_38;
      }

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"MPAVControllerErrorUserInfoKeyAlertTitle"]);

      if ([v21 length])
      {
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v47 = sub_10007CDFC;
        v48 = &unk_100268CF0;
        id v24 = v21;
        id v49 = v24;
        uint64_t v25 = v46;
        if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
        {
          v47((uint64_t)v25);
        }

        else
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_10007DE6C;
          v51 = &unk_100268D60;
          v52[0] = v25;
          dispatch_async(&_dispatch_main_q, buf);
        }

        id v34 = v49;
        goto LABEL_30;
      }
    }

    goto LABEL_21;
  }

- (void)engine:(id)a3 requiresAuthorizationToPlayItem:(id)a4 reason:(int64_t)a5 authorizationHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = sub_100079F6C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[TVMusicPlayer engine:requiresAuthorizationToPlayItem:reason:authorizationHandler:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicPlayer engine:requiresAuthorizationToPlayItem:reason:authorizationHandler:]";
    *(_WORD *)&buf[22] = 2112;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %s: item: %@", buf, 0x20u);
  }

  if (a5 == 2)
  {
    id v14 = sub_100079F6C();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Got age verification authorization request; showing verification dialog.",
        buf,
        2u);
    }

    BOOL v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    id v22 = sub_10007D500;
    __int16 v23 = &unk_100268D60;
    id v24 = v10;
    id v16 = &v20;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v20, v21))
    {
      v22((uint64_t)v16);
    }

    else
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10007DE6C;
      v32 = &unk_100268D60;
      __int16 v33 = v16;
      dispatch_async(&_dispatch_main_q, buf);
    }

    unsigned int v19 = v24;
    goto LABEL_18;
  }

  if (a5 == 1)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v26 = sub_10007D2F0;
    uint64_t v27 = &unk_100268BE8;
    uint64_t v28 = self;
    id v29 = v9;
    id v30 = v10;
    id v13 = v25;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v26((uint64_t)v13);
    }

    else
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10007DE6C;
      v32 = &unk_100268D60;
      __int16 v33 = v13;
      dispatch_async(&_dispatch_main_q, buf);
    }

    unsigned int v19 = v29;
LABEL_18:

    goto LABEL_19;
  }

  id v17 = sub_100079F6C();
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Authorization reason not handled: %ld",  buf,  0xCu);
  }

  (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1LL, 0LL);
LABEL_19:
}

- (id)_mpGenericObjectFromMPAVItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  [v3 storeItemInt64ID],  objc_msgSend(v3, "storeSubscriptionAdamID")));
  if (([v3 mediaType] & 0x100) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___MPModelMovie);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007D788;
    v19[3] = &unk_10026BD20;
    id v20 = v3;
    id v9 = -[MPModelMovie initWithIdentifiers:block:](v8, "initWithIdentifiers:block:", v4, v19);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v9));

    id v10 = v20;
LABEL_8:

    goto LABEL_9;
  }

  if (([v3 mediaType] & 0x200) != 0)
  {
    id v11 = objc_alloc(&OBJC_CLASS___MPModelTVEpisode);
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    id v16 = sub_10007D7D8;
    id v17 = &unk_10026BD48;
    id v18 = v3;
    id v12 = -[MPModelTVEpisode initWithIdentifiers:block:](v11, "initWithIdentifiers:block:", v4, &v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v12,  v14,  v15,  v16,  v17));

    id v10 = v18;
    goto LABEL_8;
  }

  id v5 = sub_100079F6C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v22 = [v3 mediaType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unhandled MPMediaType: %ld", buf, 0xCu);
  }

  id v7 = 0LL;
LABEL_9:

  return v7;
}

- (void)_sendNotificationForError:(id)a3 avItem:(id)a4 isFirstItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
    [v10 setObject:v8 forKeyedSubscript:TVPPlaybackErrorKey];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    [v10 setObject:v11 forKeyedSubscript:TVPPlaybackWillStopDueToErrorKey];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 modelGenericObject]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 flattenedGenericObject]);

    if (v13) {
      [v10 setObject:v13 forKeyedSubscript:@"TVMusicPlayerErrorNotificationGenericObjectKey"];
    }
    id v14 = sub_100079F6C();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Playback error: %{public}@ for item: %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v17 = TVPPlaybackErrorNotification;
    id v18 = [v10 copy];
    [v16 postNotificationName:v17 object:self userInfo:v18];
  }
}

- (id)_TVPPlaybackStateFromMCPPlayerState:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self, "state"));
      goto LABEL_9;
    case 1LL:
    case 4LL:
    case 6LL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
      goto LABEL_9;
    case 2LL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
      goto LABEL_9;
    case 5LL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning"));
LABEL_9:
      id result = v4;
      break;
    default:
      id v5 = sub_100079F6C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        int64_t v9 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unknown MPCPlayerState: %ld",  (uint8_t *)&v8,  0xCu);
      }

      id result = 0LL;
      break;
  }

  return result;
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

- (MPCPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (TVMusicPlayQueue)playQueue
{
  return self->_playQueue;
}

- (void)setPlayQueue:(id)a3
{
}

- (TVMusicPlayerPlaybackEngineQueueEndedObserver)playbackQueueEndedObserver
{
  return self->_playbackQueueEndedObserver;
}

- (void)setPlaybackQueueEndedObserver:(id)a3
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

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (TVPTimeRange)bufferedTimeRange
{
  return self->_bufferedTimeRange;
}

- (void)setBufferedTimeRange:(id)a3
{
}

- (MPCVideoView)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end