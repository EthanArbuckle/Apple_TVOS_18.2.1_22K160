@interface MTTVPlayback
- (AVPlayer)avPlayer;
- (BOOL)currentMediaItemHasDates;
- (BOOL)currentMediaItemHasVideoContent;
- (BOOL)currentMediaItemInitialLoadingComplete;
- (BOOL)currentMediaItemIsStreaming;
- (BOOL)currentMediaItemPreparedForLoading;
- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer;
- (BOOL)interactive;
- (BOOL)isLive;
- (BOOL)limitReadAhead;
- (BOOL)muted;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)updatesMediaRemoteInfoAutomatically;
- (BOOL)videoViewsNeedPlayerUpdate;
- (BOOL)waitsAfterPreparingMediaItems;
- (CGSize)currentMediaItemPresentationSize;
- (IMAVPlayer)player;
- (MTTVPlayback)initWithName:(id)a3;
- (MTTVPlayback)initWithPlayer:(id)a3;
- (NSArray)audioOptions;
- (NSArray)chapterCollections;
- (NSArray)subtitleOptions;
- (NSDate)playbackDate;
- (NSHashTable)videoViewWeakReferences;
- (NSMutableDictionary)timeObservers;
- (NSNumber)temporarySubtitleOverrideType;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (TVPASyncPlaybackDelegate)asyncDelegate;
- (TVPAudioOption)selectedAudioOption;
- (TVPChapter)currentChapter;
- (TVPChapterCollection)currentChapterCollection;
- (TVPDateRange)seekableDateRange;
- (TVPInterstitial)currentInterstitial;
- (TVPMediaItem)currentMediaItem;
- (TVPPlaybackDelegate)delegate;
- (TVPPlaybackState)oldPlaybackState;
- (TVPPlaybackState)state;
- (TVPPlaylist)playlist;
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
- (float)volume;
- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4;
- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4;
- (id)addElapsedTimeObserver:(id)a3;
- (id)currentPlayingItem;
- (id)fetchSubtitleOptions;
- (id)manifest;
- (id)playerController;
- (int64_t)errorBehavior;
- (int64_t)mediaItemEndAction;
- (void)_durationAvailable;
- (void)_loadedDurationDidChange;
- (void)_mediaItemDidChange;
- (void)_mediaItemPresentationSizeDidChange;
- (void)_mediaItemWillChange;
- (void)_mediaServicesDidReset;
- (void)_mediaServicesWillReset;
- (void)_periodicUpdate;
- (void)_rateDidChange;
- (void)_readyToPlay;
- (void)_setSelectedSubtitleOption:(id)a3 userOverridesSystemSubtitleSettings:(BOOL)a4;
- (void)_stateDidChange;
- (void)_stateWillChange;
- (void)_subtitleSettingsDidChange;
- (void)_updatePlaylist;
- (void)_updateVideoViewsWithAVPlayer:(id)a3;
- (void)addWeakReferenceToVideoView:(id)a3;
- (void)beginLoadingSubtitleOptions;
- (void)changeMediaInDirection:(int64_t)a3;
- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)postPlaybackStateChangeNotificationWithOldState:(id)a3;
- (void)removeElapsedTimeObserverWithToken:(id)a3;
- (void)removeWeakReferenceToVideoView:(id)a3;
- (void)scanWithRate:(double)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setCurrentChapterCollection:(id)a3;
- (void)setCurrentMediaItem:(id)a3;
- (void)setCurrentMediaItemPresentationSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setErrorBehavior:(int64_t)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setMaximumBitRate:(double)a3;
- (void)setMediaItemEndAction:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOldPlaybackState:(id)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setRateUsedForPlayback:(double)a3;
- (void)setSelectedAudioOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4;
- (void)setTemporarySubtitleOverrideType:(id)a3;
- (void)setTimeObservers:(id)a3;
- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3;
- (void)setVideoViewWeakReferences:(id)a3;
- (void)setVideoViewsNeedPlayerUpdate:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3;
- (void)skipToNextChapterInDirection:(int64_t)a3;
- (void)stop;
- (void)togglePlayPause;
- (void)updateSubtitleOptions;
- (void)updateSubtitleOptionsAndSelection;
@end

@implementation MTTVPlayback

- (MTTVPlayback)initWithName:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer", a3));
  v5 = -[MTTVPlayback initWithPlayer:](self, "initWithPlayer:", v4);

  return v5;
}

- (MTTVPlayback)initWithPlayer:(id)a3
{
  id v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___MTTVPlayback;
  v6 = -[MTTVPlayback init](&v54, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MTTVPlayback setTimeObservers:](v7, "setTimeObservers:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    -[MTTVPlayback setVideoViewWeakReferences:](v7, "setVideoViewWeakReferences:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v11 = IMAVPlayerNotification_MediaItemWillChange;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v10 addObserver:v7 selector:"_mediaItemWillChange" name:v11 object:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v14 = IMAVPlayerNotification_MediaItemDidChange;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v13 addObserver:v7 selector:"_mediaItemDidChange" name:v14 object:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v17 = IMAVPlayerNotification_StateWillChange;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v16 addObserver:v7 selector:"_stateWillChange" name:v17 object:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v20 = IMAVPlayerNotification_StateDidChange;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v19 addObserver:v7 selector:"_stateDidChange" name:v20 object:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v23 = IMAVPlayerNotification_ManifestDidChange;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v22 addObserver:v7 selector:"_manifestDidChange" name:v23 object:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v26 = IMAVPlayerNotification_PeriodicUpdate;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v25 addObserver:v7 selector:"_periodicUpdate" name:v26 object:v27];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v29 = IMAVPlayerNotification_PlayerItemReadyToPlay;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v28 addObserver:v7 selector:"_readyToPlay" name:v29 object:v30];

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v32 = IMAVPlayerNotification_MediaItemStatusDidChange;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v31 addObserver:v7 selector:"_mediaItemStatusDidChange" name:v32 object:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v35 = IMAVPlayerNotification_RateChanged;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v34 addObserver:v7 selector:"_rateDidChange" name:v35 object:v36];

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v38 = IMAVPlayerNotification_MediaItemPresentationSizeDidChange;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v37 addObserver:v7 selector:"_mediaItemPresentationSizeDidChange" name:v38 object:v39];

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v41 = IMAVPlayerNotification_LoadedDurationDidChange;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v40 addObserver:v7 selector:"_loadedDurationDidChange" name:v41 object:v42];

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v44 = IMAVPlayerNotification_DurationAvailable;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v43 addObserver:v7 selector:"_durationAvailable" name:v44 object:v45];

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v47 = IMAVPlayerNotification_MediaServicesWillReset;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v46 addObserver:v7 selector:"_mediaServicesWillReset" name:v47 object:v48];

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v50 = IMAVPlayerNotification_MediaServicesDidReset;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](v7, "player"));
    [v49 addObserver:v7 selector:"_mediaServicesDidReset" name:v50 object:v51];

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    [v52 addObserver:v7 forKeyPath:@"subtitleDisplayType" options:0 context:off_1002B31D0];
    [v52 addObserver:v7 forKeyPath:@"preferredSubtitleLanguageCode" options:0 context:off_1002B31D8];
    [v52 addObserver:v7 forKeyPath:@"preferSDHOverRegularSubtitles" options:0 context:off_1002B31E0];
    -[MTTVPlayback _updatePlaylist](v7, "_updatePlaylist");
    -[MTTVPlayback beginLoadingSubtitleOptions](v7, "beginLoadingSubtitleOptions");
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"subtitleDisplayType" context:off_1002B31D0];
  [v4 removeObserver:self forKeyPath:@"preferredSubtitleLanguageCode" context:off_1002B31D8];
  [v4 removeObserver:self forKeyPath:@"preferSDHOverRegularSubtitles" context:off_1002B31E0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPlayback;
  -[MTTVPlayback dealloc](&v5, "dealloc");
}

- (void)_mediaItemWillChange
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTTVPlayback currentPlayingItem](self, "currentPlayingItem"));
  if (v3)
  {
    v4 = (void *)v3;
    unsigned __int8 v5 = -[MTTVPlayback currentMediaItemHasVideoContent](self, "currentMediaItemHasVideoContent");

    if ((v5 & 1) == 0) {
      -[MTTVPlayback setVideoViewsNeedPlayerUpdate:](self, "setVideoViewsNeedPlayerUpdate:", 1LL);
    }
  }

- (void)_mediaItemDidChange
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:TVPPlaybackCurrentMediaItemDidChangeNotification object:self];

  -[MTTVPlayback beginLoadingSubtitleOptions](self, "beginLoadingSubtitleOptions");
  -[MTTVPlayback didChangeValueForKey:](self, "didChangeValueForKey:", @"duration");
  if (-[MTTVPlayback videoViewsNeedPlayerUpdate](self, "videoViewsNeedPlayerUpdate")
    && -[MTTVPlayback currentMediaItemHasVideoContent](self, "currentMediaItemHasVideoContent"))
  {
    -[MTTVPlayback _updateVideoViewsWithAVPlayer:](self, "_updateVideoViewsWithAVPlayer:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback avPlayer](self, "avPlayer"));
    -[MTTVPlayback _updateVideoViewsWithAVPlayer:](self, "_updateVideoViewsWithAVPlayer:", v4);

    -[MTTVPlayback setVideoViewsNeedPlayerUpdate:](self, "setVideoViewsNeedPlayerUpdate:", 0LL);
  }

  +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
}

- (void)_stateWillChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback state](self, "state"));
  -[MTTVPlayback setOldPlaybackState:](self, "setOldPlaybackState:", v3);
}

- (void)_stateDidChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback oldPlaybackState](self, "oldPlaybackState"));
  -[MTTVPlayback postPlaybackStateChangeNotificationWithOldState:]( self,  "postPlaybackStateChangeNotificationWithOldState:",  v3);

  +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
}

- (void)_periodicUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v3 currentTime];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v6 actualRate];
  float v8 = v7;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback timeObservers](self, "timeObservers", 0LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
  id v11 = [v10 copy];

  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    double v15 = v8;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(double, double))(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v16) + 16LL))( v5,  v15);
        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v13);
  }
}

- (void)_readyToPlay
{
}

- (void)_rateDidChange
{
}

- (void)_mediaItemPresentationSizeDidChange
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 playerItem]);
  [v3 presentationSize];
  -[MTTVPlayback setCurrentMediaItemPresentationSize:](self, "setCurrentMediaItemPresentationSize:");
}

- (void)_loadedDurationDidChange
{
}

- (void)_mediaServicesWillReset
{
}

- (void)_mediaServicesDidReset
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  -[MTTVPlayback _updateVideoViewsWithAVPlayer:](self, "_updateVideoViewsWithAVPlayer:", v3);
}

- (void)_durationAvailable
{
}

- (void)_subtitleSettingsDidChange
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if (off_1002B31D0 == a6 || off_1002B31D8 == a6 || off_1002B31E0 == a6) {
    -[MTTVPlayback _subtitleSettingsDidChange](self, "_subtitleSettingsDidChange");
  }
}

- (void)_updatePlaylist
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback playlist](self, "playlist"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 manifest]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback manifest](self, "manifest"));
  unsigned __int8 v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = objc_alloc(&OBJC_CLASS___MTTVPlaylist);
    float v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback manifest](self, "manifest"));
    float v8 = -[MTTVPlaylist initWithManifest:](v6, "initWithManifest:", v7);
    -[MTTVPlayback setPlaylist:](self, "setPlaylist:", v8);
  }
}

- (void)play
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 play];
}

- (void)togglePlayPause
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 togglePlayPause];
}

- (void)pause
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 pause];
}

- (void)stop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 pause];
}

- (void)skipToNextChapterInDirection:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
      [v3 previousChapter];
    }
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
    [v4 nextChapter];
  }

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4
{
}

- (void)changeMediaInDirection:(int64_t)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback playlist](self, "playlist"));
  unsigned int v6 = [v5 moreItemsAvailable:a3];

  if (v6)
  {
    if (!a3)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
      [v7 nextMediaItem];
      goto LABEL_7;
    }

    if (a3 == 1)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
      [v7 previousMediaItem];
LABEL_7:
    }
  }

- (void)scanWithRate:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback state](self, "state"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  *(float *)&double v6 = a3;
  [v5 scanWithRate:v6];

  -[MTTVPlayback postPlaybackStateChangeNotificationWithOldState:]( self,  "postPlaybackStateChangeNotificationWithOldState:",  v7);
}

- (double)rate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 actualRate];
  double v4 = v3;

  return v4;
}

- (double)rateUsedForPlayback
{
  return v2;
}

- (id)addElapsedTimeObserver:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback timeObservers](self, "timeObservers"));
  id v8 = objc_retainBlock(v4);

  [v7 setObject:v8 forKey:v6];
  return v6;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  return 0LL;
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  return 0LL;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback timeObservers](self, "timeObservers"));
  [v5 removeObjectForKey:v4];
}

- (void)setElapsedTime:(double)a3
{
  if (TVPElapsedTimeStart == a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = a3;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v4 setCurrentTime:v3];
}

- (double)elapsedTime
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (double)duration
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (TVPPlaybackState)state
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  unsigned int v4 = [v3 isScanning];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning"));
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
    id v7 = [v6 state];

    if (v7 == (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
      id v9 = [v8 loadState];

      if (v9 == (id)2) {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState loading](&OBJC_CLASS___TVPPlaybackState, "loading"));
      }
      else {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback currentPlayingItem](self, "currentPlayingItem"));

      if (v10) {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
      }
      else {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
      }
    }
  }

  return (TVPPlaybackState *)v5;
}

- (TVPMediaItem)currentMediaItem
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback playlist](self, "playlist"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMediaItem]);

  return (TVPMediaItem *)v3;
}

- (TVPTimeRange)bufferedTimeRange
{
  double v3 = objc_alloc(&OBJC_CLASS___TVPTimeRange);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  [v4 loadedDuration];
  double v6 = -[TVPTimeRange initWithStartTime:duration:](v3, "initWithStartTime:duration:", 0.0, v5);

  return v6;
}

- (void)setLimitReadAhead:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 playerItem]);

  [v5 setLimitReadAhead:v3];
}

- (BOOL)limitReadAhead
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerItem]);

  LOBYTE(v2) = [v3 limitReadAhead];
  return (char)v2;
}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  return 0;
}

- (void)setCurrentMediaItemPresentationSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (self->_currentMediaItemPresentationSize.width != a3.width
    || self->_currentMediaItemPresentationSize.height != a3.height)
  {
    -[MTTVPlayback willChangeValueForKey:](self, "willChangeValueForKey:", @"currentMediaItemPresentationSize");
    self->_currentMediaItemPresentationSize.CGFloat width = width;
    self->_currentMediaItemPresentationSize.CGFloat height = height;
    -[MTTVPlayback didChangeValueForKey:](self, "didChangeValueForKey:", @"currentMediaItemPresentationSize");
  }

- (void)_updateVideoViewsWithAVPlayer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback videoViewWeakReferences](self, "videoViewWeakReferences"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000657C0;
  v12[3] = &unk_100242320;
  v12[4] = &v13;
  [v6 enumerateObjectsUsingBlock:v12];
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:"));
    [v7 setAVPlayer:v4];
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006580C;
  v9[3] = &unk_100242348;
  id v11 = &v13;
  id v8 = v4;
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(&v13, 8);
}

- (void)addWeakReferenceToVideoView:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_videoViewWeakReferences, "addObject:");
  }
}

- (void)removeWeakReferenceToVideoView:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_videoViewWeakReferences, "removeObject:");
  }
}

- (BOOL)currentMediaItemInitialLoadingComplete
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  BOOL v3 = [v2 loadState] != 0;

  return v3;
}

- (BOOL)currentMediaItemIsStreaming
{
  return 0;
}

- (BOOL)currentMediaItemHasVideoContent
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback currentPlayingItem](self, "currentPlayingItem"));
  unsigned __int8 v3 = [v2 isVideo];

  return v3;
}

- (BOOL)updatesMediaRemoteInfoAutomatically
{
  return 0;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return 1;
}

- (AVPlayer)avPlayer
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (AVPlayer *)v3;
}

- (id)manifest
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 manifest]);

  return v3;
}

- (id)playerController
{
  return +[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance");
}

- (id)currentPlayingItem
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentItem]);

  return v3;
}

- (void)postPlaybackStateChangeNotificationWithOldState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    v9[0] = TVPPlaybackStateOldStateKey;
    v9[1] = TVPPlaybackStateNewStateKey;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback state](self, "state"));
    v10[1] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:TVPPlaybackStateDidChangeNotification object:self userInfo:v7];
}

- (void)beginLoadingSubtitleOptions
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerItem]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100065B20;
  v6[3] = &unk_10023FF98;
  v6[4] = self;
  [v5 loadValuesAsynchronouslyForKeys:&off_1002551A0 completionHandler:v6];
}

- (void)updateSubtitleOptions
{
  unsigned __int8 v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback fetchSubtitleOptions](self, "fetchSubtitleOptions"));
  subtitleOptions = self->_subtitleOptions;
  self->_subtitleOptions = v3;

  -[MTTVPlayback didChangeValueForKey:](self, "didChangeValueForKey:", @"subtitleOptions");
}

- (void)updateSubtitleOptionsAndSelection
{
}

- (NSArray)subtitleOptions
{
  subtitleOptions = self->_subtitleOptions;
  if (!subtitleOptions)
  {
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback fetchSubtitleOptions](self, "fetchSubtitleOptions"));
    id v5 = self->_subtitleOptions;
    self->_subtitleOptions = v4;

    subtitleOptions = self->_subtitleOptions;
  }

  return subtitleOptions;
}

- (id)fetchSubtitleOptions
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerItem]);

  if (v5 && [v5 status] == (id)1)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 asset]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvp_sortedSubtitleAVMediaSelectionOptions"));

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPSubtitleOption offSubtitleOption](&OBJC_CLASS___TVPSubtitleOption, "offSubtitleOption"));
    [v3 addObject:v8];

    if ([v7 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPSubtitleOption autoSubtitleOption](&OBJC_CLASS___TVPSubtitleOption, "autoSubtitleOption"));
      [v3 addObject:v9];

      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v10 = v7;
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            uint64_t v16 = objc_alloc(&OBJC_CLASS___TVPSubtitleOption);
            __int128 v17 = -[TVPSubtitleOption initWithAVMediaSelectionOption:]( v16,  "initWithAVMediaSelectionOption:",  v15,  (void)v20);
            [v3 addObject:v17];

            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v12);
      }
    }
  }

  if (objc_msgSend(v3, "count", (void)v20)) {
    id v18 = [v3 copy];
  }
  else {
    id v18 = 0LL;
  }

  return v18;
}

- (TVPSubtitleOption)selectedSubtitleOption
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerItem]);

  if (v4 && [v4 status] == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMediaSelection]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 selectedMediaOptionInMediaSelectionGroup:v6]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    id v10 = [v9 subtitleDisplayType];

    id v11 = [[TVPAutoSubtitleOption alloc] initWithAVMediaSelectionOption:v8];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback temporarySubtitleOverrideType](self, "temporarySubtitleOverrideType"));
    if (v12 || v10 != (id)1)
    {
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback subtitleOptions](self, "subtitleOptions"));
      unsigned int v14 = [v13 containsObject:v11];

      if (v14)
      {
        id v15 = v11;
LABEL_14:
        uint64_t v16 = v15;

        goto LABEL_15;
      }
    }

    if (v8
      && ![v8 hasMediaCharacteristic:AVMediaCharacteristicContainsOnlyForcedSubtitles])
    {
      __int128 v17 = &OBJC_CLASS___TVPSubtitleOption;
    }

    else
    {
      __int128 v17 = (objc_class *)&OBJC_CLASS___TVPOffSubtitleOption;
    }

    id v15 = [[v17 alloc] initWithAVMediaSelectionOption:v8];
    goto LABEL_14;
  }

  uint64_t v16 = 0LL;
LABEL_15:

  return (TVPSubtitleOption *)v16;
}

- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4
{
}

- (void)setSelectedSubtitleOption:(id)a3
{
}

- (void)_setSelectedSubtitleOption:(id)a3 userOverridesSystemSubtitleSettings:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback player](self, "player"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerItem]);

  if ([v8 status] == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible]);

    -[MTTVPlayback willChangeValueForKey:](self, "willChangeValueForKey:", @"selectedSubtitleOption");
    if (v6)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPSubtitleOption offSubtitleOption](&OBJC_CLASS___TVPSubtitleOption, "offSubtitleOption"));
      unsigned int v12 = [v6 isEqual:v11];

      if (v12)
      {
        -[MTTVPlayback setTemporarySubtitleOverrideType:](self, "setTemporarySubtitleOverrideType:", 0LL);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback avPlayer](self, "avPlayer"));
        [v13 setMediaSelectionCriteria:0 forMediaCharacteristic:AVMediaCharacteristicLegible];

        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
        id v15 = v14;
        uint64_t v16 = 0LL;
      }

      else
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPSubtitleOption autoSubtitleOption](&OBJC_CLASS___TVPSubtitleOption, "autoSubtitleOption"));
        unsigned int v18 = [v6 isEqual:v17];

        if (!v18)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v6 languageCodeFromLocale]);
          __int128 v22 = (void *)v21;
          if (v4)
          {
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVPAudioVideoSettings sharedInstance]( &OBJC_CLASS___TVPAudioVideoSettings,  "sharedInstance"));
            [v23 setSubtitleDisplayType:2];

            v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVPAudioVideoSettings sharedInstance]( &OBJC_CLASS___TVPAudioVideoSettings,  "sharedInstance"));
            [v24 setPreferredSubtitleLanguageCode:v22];

            v25 = 0LL;
            uint64_t v26 = 0LL;
          }

          else
          {
            if (v21)
            {
              v27 = objc_alloc(&OBJC_CLASS___AVPlayerMediaSelectionCriteria);
              v33 = v22;
              v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v33,  1LL));
              AVMediaCharacteristic v32 = AVMediaCharacteristicIsMainProgramContent;
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v32,  1LL));
              uint64_t v26 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:]( v27,  "initWithPreferredLanguages:preferredMediaCharacteristics:",  v28,  v29);
            }

            else
            {
              uint64_t v26 = 0LL;
            }

            v25 = &off_100254818;
          }

          -[MTTVPlayback setTemporarySubtitleOverrideType:](self, "setTemporarySubtitleOverrideType:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback avPlayer](self, "avPlayer"));
          [v30 setMediaSelectionCriteria:v26 forMediaCharacteristic:AVMediaCharacteristicLegible];

          v31 = (void *)objc_claimAutoreleasedReturnValue([v6 avMediaSelectionOption]);
          [v8 selectMediaOption:v31 inMediaSelectionGroup:v10];

          goto LABEL_16;
        }

        -[MTTVPlayback setTemporarySubtitleOverrideType:](self, "setTemporarySubtitleOverrideType:", 0LL);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlayback avPlayer](self, "avPlayer"));
        [v19 setMediaSelectionCriteria:0 forMediaCharacteristic:AVMediaCharacteristicLegible];

        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
        id v15 = v14;
        uint64_t v16 = 1LL;
      }

      [v14 setSubtitleDisplayType:v16];

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
      [v20 setPreferredSubtitleLanguageCode:0];

      [v8 selectMediaOptionAutomaticallyInMediaSelectionGroup:v10];
    }

    else
    {
      [v8 selectMediaOption:0 inMediaSelectionGroup:v10];
    }

- (TVPASyncPlaybackDelegate)asyncDelegate
{
  return (TVPASyncPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_asyncDelegate);
}

- (void)setAsyncDelegate:(id)a3
{
}

- (NSArray)audioOptions
{
  return self->_audioOptions;
}

- (NSArray)chapterCollections
{
  return self->_chapterCollections;
}

- (TVPChapter)currentChapter
{
  return self->_currentChapter;
}

- (TVPChapterCollection)currentChapterCollection
{
  return self->_currentChapterCollection;
}

- (void)setCurrentChapterCollection:(id)a3
{
}

- (TVPInterstitial)currentInterstitial
{
  return self->_currentInterstitial;
}

- (void)setCurrentMediaItem:(id)a3
{
}

- (BOOL)currentMediaItemHasDates
{
  return self->_currentMediaItemHasDates;
}

- (BOOL)currentMediaItemPreparedForLoading
{
  return self->_currentMediaItemPreparedForLoading;
}

- (CGSize)currentMediaItemPresentationSize
{
  double width = self->_currentMediaItemPresentationSize.width;
  double height = self->_currentMediaItemPresentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (TVPPlaybackDelegate)delegate
{
  return (TVPPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (int64_t)errorBehavior
{
  return self->_errorBehavior;
}

- (void)setErrorBehavior:(int64_t)a3
{
  self->_errorBehavior = a3;
}

- (double)forwardPlaybackEndTime
{
  return self->_forwardPlaybackEndTime;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (double)maximumBitRate
{
  return self->_maximumBitRate;
}

- (void)setMaximumBitRate:(double)a3
{
  self->_maximumBitRate = a3;
}

- (int64_t)mediaItemEndAction
{
  return self->_mediaItemEndAction;
}

- (void)setMediaItemEndAction:(int64_t)a3
{
  self->_mediaItemEndAction = a3;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)playbackDate
{
  return self->_playbackDate;
}

- (void)setPlaybackDate:(id)a3
{
}

- (IMAVPlayer)player
{
  return self->_player;
}

- (TVPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  self->_preventsSleepDuringVideoPlayback = a3;
}

- (void)setRateUsedForPlayback:(double)a3
{
  self->_rateUsedForPlayback = a3;
}

- (double)reversePlaybackEndTime
{
  return self->_reversePlaybackEndTime;
}

- (TVPDateRange)seekableDateRange
{
  return self->_seekableDateRange;
}

- (TVPTimeRange)seekableTimeRange
{
  return self->_seekableTimeRange;
}

- (TVPAudioOption)selectedAudioOption
{
  return self->_selectedAudioOption;
}

- (void)setSelectedAudioOption:(id)a3
{
}

- (NSMutableDictionary)timeObservers
{
  return self->_timeObservers;
}

- (void)setTimeObservers:(id)a3
{
}

- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3
{
  self->_updatesMediaRemoteInfoAutomatically = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)waitsAfterPreparingMediaItems
{
  return self->_waitsAfterPreparingMediaItems;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  self->_waitsAfterPreparingMediaItems = a3;
}

- (NSNumber)temporarySubtitleOverrideType
{
  return self->_temporarySubtitleOverrideType;
}

- (void)setTemporarySubtitleOverrideType:(id)a3
{
}

- (TVPPlaybackState)oldPlaybackState
{
  return self->_oldPlaybackState;
}

- (void)setOldPlaybackState:(id)a3
{
}

- (NSHashTable)videoViewWeakReferences
{
  return self->_videoViewWeakReferences;
}

- (void)setVideoViewWeakReferences:(id)a3
{
}

- (BOOL)videoViewsNeedPlayerUpdate
{
  return self->_videoViewsNeedPlayerUpdate;
}

- (void)setVideoViewsNeedPlayerUpdate:(BOOL)a3
{
  self->_videoViewsNeedPlayerUpdate = a3;
}

- (void).cxx_destruct
{
}

@end