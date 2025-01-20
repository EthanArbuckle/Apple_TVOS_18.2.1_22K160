@interface TVNPMetadataPlayer
- (BOOL)currentMediaItemHasDates;
- (BOOL)currentMediaItemHasVideoContent;
- (BOOL)currentMediaItemInitialLoadingComplete;
- (BOOL)currentMediaItemIsStreaming;
- (BOOL)currentMediaItemPreparedForLoading;
- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer;
- (BOOL)initiatedSkip;
- (BOOL)interactive;
- (BOOL)isLive;
- (BOOL)isScanningForward;
- (BOOL)limitReadAhead;
- (BOOL)muted;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)respondsToRemoteControlEvents;
- (BOOL)updatesMediaRemoteInfoAutomatically;
- (BOOL)waitsAfterPreparingMediaItems;
- (CGSize)currentMediaItemPresentationSize;
- (NSArray)audioOptions;
- (NSArray)chapterCollections;
- (NSArray)subtitleOptions;
- (NSDate)playbackDate;
- (NSMutableDictionary)elapsedTimeObserverBlocks;
- (NSString)name;
- (TVNPMetadataPlayer)init;
- (TVNPMetadataPlayer)initWithName:(id)a3;
- (TVNPMetadataPlayerCommandDelegate)commandDelegate;
- (TVPASyncPlaybackDelegate)asyncDelegate;
- (TVPAudioOption)selectedAudioOption;
- (TVPChapter)currentChapter;
- (TVPChapterCollection)currentChapterCollection;
- (TVPDateRange)seekableDateRange;
- (TVPInterstitial)currentInterstitial;
- (TVPMediaItem)currentMediaItem;
- (TVPPlaybackDelegate)delegate;
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
- (float)_rateForState:(id)a3;
- (float)volume;
- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4;
- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4;
- (id)addElapsedTimeObserver:(id)a3;
- (int64_t)errorBehavior;
- (int64_t)lastChangeDirection;
- (int64_t)mediaItemEndAction;
- (void)_callElapsedTimeObserversDueToTimeJump:(BOOL)a3;
- (void)_fireElapsedTimeUpdate:(id)a3;
- (void)_updateElapsedTimeTimer;
- (void)changeMediaInDirection:(int64_t)a3;
- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4;
- (void)invalidate;
- (void)pause;
- (void)pauseIgnoringDelegate:(BOOL)a3;
- (void)pauseWithVolumeRampDuration:(double)a3;
- (void)play;
- (void)playIgnoringDelegate:(BOOL)a3;
- (void)removeBoundaryTimeObserverWithToken:(id)a3;
- (void)removeElapsedTimeObserverWithToken:(id)a3;
- (void)scanWithRate:(double)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setCommandDelegate:(id)a3;
- (void)setCurrentChapterCollection:(id)a3;
- (void)setCurrentMediaItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 precise:(BOOL)a4;
- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4;
- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5;
- (void)setElapsedTimeObserverBlocks:(id)a3;
- (void)setErrorBehavior:(int64_t)a3;
- (void)setInitiatedSkip:(BOOL)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setIsScanningForward:(BOOL)a3;
- (void)setLastChangeDirection:(int64_t)a3;
- (void)setLastElapsedTime:(double)a3 atTimestamp:(id)a4;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setMaximumBitRate:(double)a3;
- (void)setMediaItemEndAction:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setRateUsedForPlayback:(double)a3;
- (void)setRespondsToRemoteControlEvents:(BOOL)a3;
- (void)setSelectedAudioOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4;
- (void)setState:(id)a3;
- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3;
- (void)skipToNextChapterInDirection:(int64_t)a3;
- (void)stop;
- (void)stopWithVolumeRampDuration:(double)a3;
- (void)togglePlayPause;
@end

@implementation TVNPMetadataPlayer

- (TVNPMetadataPlayer)init
{
  v4 = 0LL;
  v4 = -[TVNPMetadataPlayer initWithName:](self, "initWithName:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVNPMetadataPlayer)initWithName:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0LL;
  v12.receiver = v3;
  v12.super_class = (Class)&OBJC_CLASS___TVNPMetadataPlayer;
  v14 = -[TVNPMetadataPlayer init](&v12, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v4 = (NSString *)[location[0] copy];
    name = v14->_name;
    v14->_name = v4;

    v14->_rateUsedForPlayback = 1.0;
    v14->_mediaItemEndAction = 0LL;
    v6 = (TVPPlaybackState *)+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped");
    state = v14->_state;
    v14->_state = v6;

    v8 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    elapsedTimeObserverBlocks = v14->_elapsedTimeObserverBlocks;
    v14->_elapsedTimeObserverBlocks = v8;

    v14->_isScanningForward = 0;
  }

  v11 = v14;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v11;
}

- (void)invalidate
{
}

- (void)setLastElapsedTime:(double)a3 atTimestamp:(id)a4
{
  objc_super v12 = self;
  SEL v11 = a2;
  double v10 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  v12->_lastElapsedTime = v10;
  objc_storeStrong((id *)&v12->_lastUpdateTimestamp, location);
  id v8 = &_os_log_default;
  char v7 = 2;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v8;
    os_log_type_t type = v7;
    sub_100005DD0(v6);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Firing elapsed time observer after setting last elapsed time / timestamp",  v6,  2u);
  }

  objc_storeStrong(&v8, 0LL);
  -[TVNPMetadataPlayer _callElapsedTimeObserversDueToTimeJump:](v12, "_callElapsedTimeObserversDueToTimeJump:", 1LL);
  objc_storeStrong(&location, 0LL);
}

- (void)changeMediaInDirection:(int64_t)a3
{
}

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v4 = -[TVNPMetadataPlayer commandDelegate](v8, "commandDelegate");
  if (v6 == 1) {
    [v4 metadataPlayerSentCommand:5 withOptions:0];
  }
  else {
    [v4 metadataPlayerSentCommand:4 withOptions:0];
  }
  v8->_initiatedSkip = 1;
  v8->_lastChangeDirection = v6;
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(&location, 0LL);
}

  ;
}

- (void)play
{
  SEL v11 = self;
  v10[1] = (id)a2;
  v10[0] = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
  state = v11->_state;
  v2 = (TVPPlaybackState *)+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning");
  BOOL v8 = state != v2;

  if (!v8)
  {
    if (v11->_isScanningForward) {
      unsigned int v9 = 9;
    }
    else {
      unsigned int v9 = 11;
    }
    [v10[0] metadataPlayerSentCommand:v9 withOptions:0];
    v3 = (TVPPlaybackState *)+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing");
    id v4 = v11->_state;
    v11->_state = v3;
  }

  objc_msgSend(v10[0], "metadataPlayerSentCommand:withOptions:", 0, v10, 0);
  objc_storeStrong(location, obj);
}

- (void)playIgnoringDelegate:(BOOL)a3
{
}

- (void)pause
{
  v2 = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
  -[TVNPMetadataPlayerCommandDelegate metadataPlayerSentCommand:withOptions:]( v2,  "metadataPlayerSentCommand:withOptions:",  1LL,  0LL);
}

- (void)pauseWithVolumeRampDuration:(double)a3
{
}

- (void)pauseIgnoringDelegate:(BOOL)a3
{
}

- (void)togglePlayPause
{
  v2 = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
  -[TVNPMetadataPlayerCommandDelegate metadataPlayerSentCommand:withOptions:]( v2,  "metadataPlayerSentCommand:withOptions:",  2LL,  0LL);
}

- (void)scanWithRate:(double)a3
{
  state = self->_state;
  v3 = (TVPPlaybackState *)+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning");
  BOOL v12 = state != v3;

  if (v12 || (a3 <= 0.0 || !self->_isScanningForward) && (a3 >= 0.0 || self->_isScanningForward))
  {
    if (a3 <= 0.0)
    {
      if (a3 >= 0.0)
      {
        unsigned int v13 = 1;
        BOOL v8 = (TVPPlaybackState *)+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused", a3);
        unsigned int v9 = self->_state;
        self->_state = v8;
      }

      else
      {
        unsigned int v13 = 10;
        int64_t v6 = (TVPPlaybackState *)+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning", a3);
        SEL v7 = self->_state;
        self->_state = v6;

        self->_isScanningForward = 0;
      }
    }

    else
    {
      unsigned int v13 = 8;
      id v4 = (TVPPlaybackState *)+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning", a3);
      v5 = self->_state;
      self->_state = v4;

      self->_isScanningForward = 1;
    }

    double v10 = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
    -[TVNPMetadataPlayerCommandDelegate metadataPlayerSentCommand:withOptions:]( v10,  "metadataPlayerSentCommand:withOptions:",  v13,  0LL);
  }

- (void)stop
{
  v2 = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
  -[TVNPMetadataPlayerCommandDelegate metadataPlayerSentCommand:withOptions:]( v2,  "metadataPlayerSentCommand:withOptions:",  3LL,  0LL);

  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:]( v3,  "postNotificationName:object:",  TVPPlaybackPlaylistDidFinishNotification,  self);
}

- (void)stopWithVolumeRampDuration:(double)a3
{
}

- (void)setElapsedTime:(double)a3
{
  int64_t v6 = self;
  v5[2] = (id)a2;
  v5[1] = *(id *)&a3;
  uint64_t v7 = kMRMediaRemoteOptionPlaybackPosition;
  v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  BOOL v8 = v3;
  v5[0] =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL);

  id v4 = -[TVNPMetadataPlayer commandDelegate](v6, "commandDelegate");
  -[TVNPMetadataPlayerCommandDelegate metadataPlayerSentCommand:withOptions:]( v4,  "metadataPlayerSentCommand:withOptions:",  24LL,  v5[0]);

  objc_storeStrong(v5, 0LL);
}

- (void)setElapsedTime:(double)a3 precise:(BOOL)a4
{
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4
{
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5
{
}

- (void)skipToNextChapterInDirection:(int64_t)a3
{
  int64_t v6 = self;
  SEL v5 = a2;
  int64_t v4 = a3;
  id location = -[TVNPMetadataPlayer commandDelegate](self, "commandDelegate");
  if (v4 == 1) {
    [location metadataPlayerSentCommand:18 withOptions:0];
  }
  else {
    [location metadataPlayerSentCommand:17 withOptions:0];
  }
  objc_storeStrong(&location, 0LL);
}

- (id)addElapsedTimeObserver:(id)a3
{
  SEL v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v9 = 0LL;
  if (location[0])
  {
    v3 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    int64_t v4 = v9;
    unsigned int v9 = v3;

    BOOL v8 = -[TVNPMetadataPlayer elapsedTimeObserverBlocks](v11, "elapsedTimeObserverBlocks");
    id v7 = [location[0] copy];
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:");
  }

  int64_t v6 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = -[TVNPMetadataPlayer elapsedTimeObserverBlocks](v5, "elapsedTimeObserverBlocks");
    -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", location[0]);
    objc_storeStrong((id *)&v3, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return 0LL;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return 0LL;
}

- (void)removeBoundaryTimeObserverWithToken:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)setSelectedSubtitleOption:(id)a3 setGlobalPreference:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  return 0;
}

- (void)setCurrentMediaItem:(id)a3
{
  unsigned int v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v5 = 0;
  if (location[0])
  {
    id v10 = location[0];
    id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL);
    char v5 = 1;
    id v3 = v6;
  }

  else
  {
    id v3 = &__NSArray0__struct;
  }

  id v7 = v3;
  if ((v5 & 1) != 0) {

  }
  int64_t v4 = -[TVPPlaylist initWithMediaItems:index:isCollection:]( objc_alloc(&OBJC_CLASS___TVPPlaylist),  "initWithMediaItems:index:isCollection:",  v7,  0LL,  0LL);
  -[TVNPMetadataPlayer setPlaylist:](v9, "setPlaylist:", v4);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVPMediaItem)currentMediaItem
{
  return (TVPMediaItem *)-[TVPPlaylist currentMediaItem](self->_playlist, "currentMediaItem", a2, self);
}

- (void)setPlaylist:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:]( v3,  "postNotificationName:object:",  TVPPlaybackCurrentMediaItemWillChangeNotification,  v7);

  objc_storeStrong((id *)&v7->_playlist, location[0]);
  uint64_t v8 = TVPPlaybackCurrentMediaItemChangeDirectionKey;
  unsigned int v9 = &off_10005B370;
  char v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL);
  int64_t v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:userInfo:]( v4,  "postNotificationName:object:userInfo:",  TVPPlaybackCurrentMediaItemDidChangeNotification,  v7,  v5);

  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)currentMediaItemHasVideoContent
{
  return 0;
}

- (BOOL)currentMediaItemIsStreaming
{
  return 1;
}

- (double)rate
{
  return v2;
}

- (float)_rateForState:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v13 = 0.0;
  id v8 = location[0];
  id v9 = +[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing");
  char v11 = 0;
  BOOL v10 = 1;
  if (v8 != v9)
  {
    id v7 = location[0];
    id v12 = +[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning");
    char v11 = 1;
    BOOL v10 = v7 == v12;
  }

  if ((v11 & 1) != 0) {

  }
  if (v10)
  {
    -[TVNPMetadataPlayer rateUsedForPlayback](v15, "rateUsedForPlayback");
    double v13 = v3;
  }

  float v4 = v13;
  float v6 = v4;
  objc_storeStrong(location, 0LL);
  return v6;
}

- (double)elapsedTime
{
  double v10 = 0.0;
  if (self->_lastUpdateTimestamp)
  {
    id v7 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", self->_lastUpdateTimestamp);
    double v8 = v2;
    -[TVNPMetadataPlayer rate](self, "rate");
    double v9 = v8 * v3;

    if (v9 <= 0.0) {
      double v6 = 0.0;
    }
    else {
      double v6 = v9;
    }
    double v10 = v6 + self->_lastElapsedTime;
  }

  if (v10 >= self->_duration) {
    return self->_duration;
  }
  else {
    return v10;
  }
}

- (void)setState:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v3 = v22->_state == location[0];
  char v19 = 0;
  if (v3 || (BOOL v13 = 1, !location[0]))
  {
    id v12 = location[0];
    id v20 = +[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning");
    char v19 = 1;
    BOOL v13 = v12 == v20;
  }

  if ((v19 & 1) != 0) {

  }
  if (v13)
  {
    -[TVNPMetadataPlayer elapsedTime](v22, "elapsedTime");
    double v18 = v4;
    -[TVNPMetadataPlayer willChangeValueForKey:](v22, "willChangeValueForKey:", @"rate");
    -[TVNPMetadataPlayer _rateForState:](v22, "_rateForState:", location[0]);
    double v17 = v5;
    id v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    char v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17);
    objc_msgSend(v16, "setObject:forKeyedSubscript:");

    if (v22->_state) {
      [v16 setObject:v22->_state forKeyedSubscript:TVPPlaybackStateOldStateKey];
    }
    [v16 setObject:location[0] forKeyedSubscript:TVPPlaybackStateNewStateKey];
    id v15 = [v16 copy];
    double v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:userInfo:]( v9,  "postNotificationName:object:userInfo:",  TVPPlaybackStateWillChangeNotification,  v22,  v15);

    objc_storeStrong((id *)&v22->_state, location[0]);
    double v10 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:userInfo:]( v10,  "postNotificationName:object:userInfo:",  TVPPlaybackStateDidChangeNotification,  v22,  v15);

    -[TVNPMetadataPlayer _updateElapsedTimeTimer](v22, "_updateElapsedTimeTimer");
    -[TVNPMetadataPlayer didChangeValueForKey:](v22, "didChangeValueForKey:", @"rate");
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_100007A94((uint64_t)v23, (uint64_t)v15);
      _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "Firing elapsed time observer after changing state / rate: %{public}@.",  v23,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    id v7 = v22;
    double v6 = v18;
    double v8 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[TVNPMetadataPlayer setLastElapsedTime:atTimestamp:](v7, "setLastElapsedTime:atTimestamp:", v6);

    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateElapsedTimeTimer
{
  float v5 = -[TVNPMetadataPlayer state](self, "state");
  double v2 = (TVPPlaybackState *)+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing");
  BOOL v6 = v5 != v2;

  if (v6)
  {
    -[NSTimer invalidate](self->_elapsedTimeTimer, "invalidate");
    objc_storeStrong((id *)&self->_elapsedTimeTimer, 0LL);
  }

  else if (!self->_elapsedTimeTimer)
  {
    BOOL v3 =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_fireElapsedTimeUpdate:",  0LL,  1LL,  1.0);
    elapsedTimeTimer = self->_elapsedTimeTimer;
    self->_elapsedTimeTimer = v3;
  }

- (void)_fireElapsedTimeUpdate:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPMetadataPlayer _callElapsedTimeObserversDueToTimeJump:](v4, "_callElapsedTimeObserversDueToTimeJump:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_callElapsedTimeObserversDueToTimeJump:(BOOL)a3
{
  double v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v15 = -[TVNPMetadataPlayer elapsedTimeObserverBlocks](self, "elapsedTimeObserverBlocks");
  memset(__b, 0, sizeof(__b));
  id obj = v15;
  id v10 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
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
      uint64_t v14 = *(void *)(__b[1] + 8 * v7);
      id location = [v15 objectForKey:v14];
      if (location)
      {
        -[TVNPMetadataPlayer rate](v18, "rate");
        double v11 = v3;
        -[TVNPMetadataPlayer elapsedTime](v18, "elapsedTime");
        (*((void (**)(id, void, BOOL, __n128, double))location + 2))(location, 0LL, v16, v4, v11);
      }

      objc_storeStrong(&location, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v15, 0LL);
}

- (NSString)name
{
  return self->_name;
}

- (double)rateUsedForPlayback
{
  return self->_rateUsedForPlayback;
}

- (void)setRateUsedForPlayback:(double)a3
{
  self->_rateUsedForPlayback = a3;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (TVPPlaylist)playlist
{
  return self->_playlist;
}

- (TVPPlaybackState)state
{
  return self->_state;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)errorBehavior
{
  return self->_errorBehavior;
}

- (void)setErrorBehavior:(int64_t)a3
{
  self->_errorBehavior = a3;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (NSDate)playbackDate
{
  return self->_playbackDate;
}

- (void)setPlaybackDate:(id)a3
{
}

- (NSArray)chapterCollections
{
  return self->_chapterCollections;
}

- (TVPChapter)currentChapter
{
  return self->_currentChapter;
}

- (TVPTimeRange)bufferedTimeRange
{
  return self->_bufferedTimeRange;
}

- (TVPDateRange)seekableDateRange
{
  return self->_seekableDateRange;
}

- (TVPChapterCollection)currentChapterCollection
{
  return self->_currentChapterCollection;
}

- (void)setCurrentChapterCollection:(id)a3
{
}

- (int64_t)mediaItemEndAction
{
  return self->_mediaItemEndAction;
}

- (void)setMediaItemEndAction:(int64_t)a3
{
  self->_mediaItemEndAction = a3;
}

- (NSArray)audioOptions
{
  return self->_audioOptions;
}

- (TVPAudioOption)selectedAudioOption
{
  return self->_selectedAudioOption;
}

- (void)setSelectedAudioOption:(id)a3
{
}

- (NSArray)subtitleOptions
{
  return self->_subtitleOptions;
}

- (TVPSubtitleOption)selectedSubtitleOption
{
  return self->_selectedSubtitleOption;
}

- (void)setSelectedSubtitleOption:(id)a3
{
}

- (double)maximumBitRate
{
  return self->_maximumBitRate;
}

- (void)setMaximumBitRate:(double)a3
{
  self->_maximumBitRate = a3;
}

- (TVPPlaybackDelegate)delegate
{
  return (TVPPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVPASyncPlaybackDelegate)asyncDelegate
{
  return (TVPASyncPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_asyncDelegate);
}

- (void)setAsyncDelegate:(id)a3
{
}

- (TVPTimeRange)seekableTimeRange
{
  return self->_seekableTimeRange;
}

- (TVPInterstitial)currentInterstitial
{
  return self->_currentInterstitial;
}

- (BOOL)waitsAfterPreparingMediaItems
{
  return self->_waitsAfterPreparingMediaItems;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  self->_waitsAfterPreparingMediaItems = a3;
}

- (CGSize)currentMediaItemPresentationSize
{
  double height = self->_currentMediaItemPresentationSize.height;
  double width = self->_currentMediaItemPresentationSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)currentMediaItemHasDates
{
  return self->_currentMediaItemHasDates;
}

- (BOOL)currentMediaItemInitialLoadingComplete
{
  return self->_currentMediaItemInitialLoadingComplete;
}

- (BOOL)currentMediaItemPreparedForLoading
{
  return self->_currentMediaItemPreparedForLoading;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return self->_preventsSleepDuringVideoPlayback;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  self->_preventsSleepDuringVideoPlayback = a3;
}

- (BOOL)updatesMediaRemoteInfoAutomatically
{
  return self->_updatesMediaRemoteInfoAutomatically;
}

- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3
{
  self->_updatesMediaRemoteInfoAutomatically = a3;
}

- (double)forwardPlaybackEndTime
{
  return self->_forwardPlaybackEndTime;
}

- (double)reversePlaybackEndTime
{
  return self->_reversePlaybackEndTime;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (BOOL)limitReadAhead
{
  return self->_limitReadAhead;
}

- (void)setLimitReadAhead:(BOOL)a3
{
  self->_limitReadAhead = a3;
}

- (BOOL)respondsToRemoteControlEvents
{
  return self->_respondsToRemoteControlEvents;
}

- (void)setRespondsToRemoteControlEvents:(BOOL)a3
{
  self->_respondsToRemoteControlEvents = a3;
}

- (TVNPMetadataPlayerCommandDelegate)commandDelegate
{
  return (TVNPMetadataPlayerCommandDelegate *)objc_loadWeakRetained((id *)&self->_commandDelegate);
}

- (void)setCommandDelegate:(id)a3
{
}

- (int64_t)lastChangeDirection
{
  return self->_lastChangeDirection;
}

- (void)setLastChangeDirection:(int64_t)a3
{
  self->_lastChangeDirection = a3;
}

- (BOOL)initiatedSkip
{
  return self->_initiatedSkip;
}

- (void)setInitiatedSkip:(BOOL)a3
{
  self->_initiatedSkip = a3;
}

- (NSMutableDictionary)elapsedTimeObserverBlocks
{
  return self->_elapsedTimeObserverBlocks;
}

- (void)setElapsedTimeObserverBlocks:(id)a3
{
}

- (BOOL)isScanningForward
{
  return self->_isScanningForward;
}

- (void)setIsScanningForward:(BOOL)a3
{
  self->_isScanningForward = a3;
}

- (void).cxx_destruct
{
}

@end