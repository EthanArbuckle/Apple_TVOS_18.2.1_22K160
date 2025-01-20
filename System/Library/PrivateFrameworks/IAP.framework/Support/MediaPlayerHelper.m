@interface MediaPlayerHelper
+ (id)sharedSystemMusicPlayer;
+ (id)sharedSystemMusicPlayerQueue;
- (BOOL)_isCommandSupported:(unsigned int)a3;
- (BOOL)_isSetElapsedTimeAvailable;
- (BOOL)currentNowPlayingInfoArtworkExists;
- (BOOL)currentNowPlayingInfoTrackCountExists;
- (BOOL)fakeStreamTrackIndexSet;
- (BOOL)fakeStreamTrackIndexTimeExpired;
- (BOOL)iBooksAppSelected;
- (BOOL)iTunesUAppSelected;
- (BOOL)isLoadingRadioStation;
- (BOOL)podcastAppSelected;
- (MediaPlayerHelper)init;
- (OS_dispatch_queue)nowPlayingHandlerQueue;
- (double)currentNowPlayingInfoDuration;
- (double)currentPlaybackTime;
- (double)nowPlayingAppPlaybackRate;
- (double)nowPlayingAppPlaybackSpeed;
- (id)_nowPlayingInfoDesc:(id)a3;
- (id)currentNowPlayingInfoArtwork;
- (id)currentNowPlayingInfoString:(id)a3;
- (id)getPBQItemsFromQueueQuery;
- (id)nowPlayingAppName;
- (id)nowPlayingInfoTitleForAudiobookIndex:(unsigned int)a3;
- (int)currentRepeatMode;
- (int)currentShuffleMode;
- (int)nowPlayingAppPlaybackState;
- (int)prepareForPlaybackWithQuery:(id)a3 andFirstItem:(id)a4;
- (int)repeatModeCache;
- (int)shuffleModeCache;
- (unint64_t)currentNowPlayingInfoPID;
- (unsigned)_currentNowPlayingInfoTrack:(BOOL)a3;
- (unsigned)currentNowPlayingInfoAlbumTrack;
- (unsigned)currentNowPlayingInfoAlbumTrackCount;
- (unsigned)currentNowPlayingInfoChapter;
- (unsigned)currentNowPlayingInfoChapterCount;
- (unsigned)currentNowPlayingInfoDisc;
- (unsigned)currentNowPlayingInfoDiscCount;
- (unsigned)currentNowPlayingInfoNumber:(id)a3;
- (unsigned)currentNowPlayingInfoTrack;
- (unsigned)currentNowPlayingInfoTrackCount;
- (unsigned)nowPlayingAppIsIPodApp;
- (unsigned)nowPlayingAppIsPodcastApp;
- (unsigned)nowPlayingAppIsValid;
- (unsigned)nowPlayingAppIsVideosApp;
- (unsigned)nowPlayingAppIsiBooksApp;
- (unsigned)nowPlayingAppIsiTunesRadio;
- (unsigned)nowPlayingAppIsiTunesUApp;
- (void)_calcNewFakeStreamIndexCount;
- (void)_canShowCloudTracksDidChangeNotification:(id)a3;
- (void)_checkShuffleRepeatModeChange;
- (void)_findCommandRefForCommand:(unsigned int)a3;
- (void)_handleNowPlayingAppDidChange:(id)a3;
- (void)_handleNowPlayingAppIsPlayingDidChange:(unsigned __int8)a3;
- (void)_handleNowPlayingInfo:(__CFDictionary *)a3;
- (void)_handlePlaybackQueueDidChange;
- (void)_itemPlaybackDidEnd:(id)a3;
- (void)_mediaLibraryChanged:(id)a3;
- (void)_nowPlayingAppChanged:(id)a3;
- (void)_nowPlayingAppIsPlayingChanged:(id)a3;
- (void)_nowPlayingInfoChanged:(id)a3;
- (void)_nowPlayingItemChanged:(id)a3;
- (void)_playbackQueueDidChangeNotification:(id)a3;
- (void)_printNowPlayingInfo:(id)a3 forName:(id)a4;
- (void)_repeatModeChanged:(id)a3;
- (void)_resetFakeStreamTrackCount;
- (void)_setFakeStreamTrackIndex:(unsigned int)a3 fromPlay:(BOOL)a4;
- (void)_setFakeStreamTrackIndexForSetCurIndex:(unsigned int)a3;
- (void)_setNowPlayingApp:(id)a3;
- (void)_shuffleModeChanged:(id)a3;
- (void)_startMusicPlayerNotifications:(id)a3;
- (void)_stopMusicPlayerNotifications:(id)a3;
- (void)_supportedCommandsDidChange:(__CFArray *)a3;
- (void)_supportedCommandsDidChangeNotification;
- (void)_waitForNowPlayingInfoReceived;
- (void)dealloc;
- (void)initPBQItemsFromQueueQuery;
- (void)notifyExplicitControlOccurred;
- (void)postFakeShuffleModeChanged;
- (void)setExpectedRepeatMode:(int)a3;
- (void)setExpectedShuffleMode:(int)a3;
- (void)setIBooksAppSelected:(BOOL)a3;
- (void)setITunesUAppSelected:(BOOL)a3;
- (void)setPodcastAppSelected:(BOOL)a3;
- (void)setRepeatModeCache:(int)a3;
- (void)setShuffleModeCache:(int)a3;
@end

@implementation MediaPlayerHelper

- (void)_resetFakeStreamTrackCount
{
  if ((((_BYTE)self - 100) & 3) != 0
    || (self->_fakeStreamTrackCount = 0, (((_BYTE)self - 104) & 3) != 0)
    || (self->_fakeStreamTrackIndex = 0, self->_fakeStreamTrackIndexSet = 0, (((_BYTE)self - 92) & 3) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    self->_fakeStreamTrackIndexSetTimestamp = 0;
    self->_fakeStreamTrackIndexNeedChange = 0;
  }

- (void)_setFakeStreamTrackIndexForSetCurIndex:(unsigned int)a3
{
  if ((((_BYTE)self - 104) & 3) != 0
    || (uint64_t v4 = *(void *)&a3,
        self->_fakeStreamTrackIndex = a3,
        self->_BOOL fakeStreamTrackIndexSet = 1,
        v5 = sub_100062E0C(),
        (((_BYTE)self - 92) & 3) != 0))
  {
LABEL_6:
    __break(0x5516u);
    goto LABEL_7;
  }

  self->_fakeStreamTrackIndexSetTimestamp = v5;
  dword_100119850 = 4;
  BOOL fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet < 2)
  {
    if ((((_BYTE)self - 100) & 3) == 0)
    {
      NSLog( @"MR: %s:%d index=%d, _fakeStreamTrackIndexSet=%d _fakeStreamTrackIndex=%d _fakeStreamTrackCount=%d _fakeStreamTr ackIndexSetTimestamp=%u",  "-[MediaPlayerHelper _setFakeStreamTrackIndexForSetCurIndex:]",  384LL,  v4,  fakeStreamTrackIndexSet,  self->_fakeStreamTrackIndex,  self->_fakeStreamTrackCount,  v5);
      dispatch_time_t v7 = dispatch_time(0LL, 105000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036F40;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_after(v7, &_dispatch_main_q, block);
      dispatch_time_t v8 = dispatch_time(0LL, 2005000000LL);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100037030;
      v9[3] = &unk_100101C70;
      v9[4] = self;
      dispatch_after(v8, &_dispatch_main_q, v9);
      return;
    }

    goto LABEL_6;
  }

- (void)_setFakeStreamTrackIndex:(unsigned int)a3 fromPlay:(BOOL)a4
{
  BOOL v4 = a4;
  if (dword_100119854 || a4)
  {
    if ((((_BYTE)self - 104) & 3) != 0) {
      goto LABEL_23;
    }
    self->_fakeStreamTrackIndex = a3;
    self->_BOOL fakeStreamTrackIndexSet = 1;
    dispatch_time_t v7 = sub_100062E0C();
    self->_fakeStreamTrackIndexSetTimestamp = v7;
    if (v4)
    {
      dword_100119850 = dword_10011984C;
      if (!dword_10011984C)
      {
        self->_fakeStreamTrackCount = 2;
        if (a3 == 1 && dword_100119858) {
          dword_100119850 = 2;
        }
      }
    }

    else if (!dword_100119850)
    {
      p_fakeStreamTrackCount = &self->_fakeStreamTrackCount;
      int v9 = *p_fakeStreamTrackCount;
      if (*p_fakeStreamTrackCount <= 1)
      {
        int v9 = 2;
        unsigned int *p_fakeStreamTrackCount = 2;
      }

      BOOL v10 = __CFADD__(v9, 1);
      unsigned int v11 = v9 + 1;
      if (v10) {
        goto LABEL_25;
      }
      unsigned int *p_fakeStreamTrackCount = v11;
    }

    BOOL fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
    if (fakeStreamTrackIndexSet > 1)
    {
LABEL_24:
      __break(0x550Au);
LABEL_25:
      __break(0x5500u);
      return;
    }

    if ((((_BYTE)self - 100) & 3) == 0)
    {
      NSLog( @"MR: %s:%d fromPlay=%d _fakeStreamTrackIndexSet=%d _fakeStreamTrackIndex=%d _fakeStreamTrackCount=%d _fakeStream TrackIndexSetTimestamp=%u",  "-[MediaPlayerHelper _setFakeStreamTrackIndex:fromPlay:]",  450LL,  v4,  fakeStreamTrackIndexSet,  self->_fakeStreamTrackIndex,  self->_fakeStreamTrackCount,  v7);
      if (self->_fakeStreamTrackIndexSet <= 1u)
      {
        if (self->_fakeStreamTrackIndexSet)
        {
          dispatch_time_t v13 = dispatch_time(0LL, 2005000000LL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100037304;
          block[3] = &unk_100101C70;
          block[4] = self;
          dispatch_after(v13, &_dispatch_main_q, block);
        }

        return;
      }

      goto LABEL_24;
    }

- (void)_calcNewFakeStreamIndexCount
{
  if (dword_100119850 != 3) {
    return;
  }
  uint32_t v4 = arc4random_uniform(8u);
  BOOL v5 = __CFADD__(v4, 2);
  unsigned int v6 = v4 + 2;
  if (v5)
  {
LABEL_7:
    __break(0x5500u);
  }

  else
  {
    p_fakeStreamTrackCount = &self->_fakeStreamTrackCount;
    if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0)
    {
LABEL_13:
      __break(0x5516u);
      return;
    }

    while (*p_fakeStreamTrackCount == v6)
    {
      uint32_t v7 = arc4random_uniform(8u);
      BOOL v5 = __CFADD__(v7, 2);
      unsigned int v6 = v7 + 2;
      if (v5) {
        goto LABEL_7;
      }
    }
  }

  self->_fakeStreamTrackCount = v6;
  uint32_t v8 = arc4random_uniform(v6);
  p_fakeStreamTrackIndex = &self->_fakeStreamTrackIndex;
  while (*p_fakeStreamTrackIndex == v8)
    uint32_t v8 = arc4random_uniform(*p_fakeStreamTrackCount);
  unsigned int *p_fakeStreamTrackIndex = v8;
}

- (BOOL)fakeStreamTrackIndexTimeExpired
{
  v3 = sub_100062E0C();
  p_fakeStreamTrackIndexSetTimestamp = &self->_fakeStreamTrackIndexSetTimestamp;
  if (((unint64_t)&self->_fakeStreamTrackIndexSetTimestamp & 3) != 0)
  {
    __break(0x5516u);
    goto LABEL_13;
  }

  BOOL v5 = v3;
  LODWORD(v3) = sub_100063BF0(self->_fakeStreamTrackIndexSetTimestamp, v3, 1);
  unsigned int fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet >= 2)
  {
LABEL_13:
    __break(0x550Au);
    return (char)v3;
  }

  BOOL v7 = v3 > 0x7D0 || fakeStreamTrackIndexSet == 0;
  char v8 = v7;
  if (!v7) {
    NSLog( @"MR: %s:%d curTimeMs=%u _fakeStreamTrackIndexSetTimestamp=%u _fakeStreamTrackIndexSet=%d, Not Expired Yet!",  "-[MediaPlayerHelper fakeStreamTrackIndexTimeExpired]",  501LL,  v5,  *p_fakeStreamTrackIndexSetTimestamp,  1LL);
  }
  LOBYTE(v3) = v8;
  return (char)v3;
}

- (void)_waitForNowPlayingInfoReceived
{
  if (self->_nowPlayingInfoEverReceived) {
    return;
  }
  v2 = "-[MediaPlayerHelper _waitForNowPlayingInfoReceived]";
  NSLog( @"MR: %s:%d wait for _nowPlayingInfoEverReceived, maxWaitTimeMs %d, maxWaitTimePerIterationMs %d, maxNumIterations %d",  a2,  "-[MediaPlayerHelper _waitForNowPlayingInfoReceived]",  518LL,  15000LL,  50LL,  300LL);
  unsigned int nowPlayingInfoEverReceived = self->_nowPlayingInfoEverReceived;
  if (nowPlayingInfoEverReceived > 1)
  {
LABEL_8:
    __break(0x550Au);
  }

  else
  {
    uint64_t v3 = 0LL;
    while (!nowPlayingInfoEverReceived)
    {
      if ((_DWORD)v3 == 300)
      {
        NSLog(@"WARNING timedout waiting for nowPlayingInfo dictionary!, playback information may not be correct");
        unsigned int v6 = self->_nowPlayingInfoEverReceived;
        if (v6 > 1) {
          goto LABEL_8;
        }
        uint64_t v3 = 301LL;
        goto LABEL_12;
      }

      uint64_t v3 = (v3 + 1);
      usleep(0xC350u);
      unsigned int nowPlayingInfoEverReceived = self->_nowPlayingInfoEverReceived;
      if (nowPlayingInfoEverReceived >= 2) {
        goto LABEL_8;
      }
    }
  }

  unsigned int v6 = 1;
LABEL_12:
  NSLog( @"MR: %s:%d after waiting for _nowPlayingInfoEverReceived(%d), iteration %d / %d",  v2,  529LL,  v6,  v3,  300LL);
}

- (void)_startMusicPlayerNotifications:(id)a3
{
  uint32_t v4 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue]( &OBJC_CLASS___MediaPlayerHelper,  "sharedSystemMusicPlayerQueue");
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000376C0;
    block[3] = &unk_100101C70;
    block[4] = self;
    dispatch_sync(v4, block);
  }

  else
  {
    __break(0x5510u);
  }

- (void)_stopMusicPlayerNotifications:(id)a3
{
  uint64_t v3 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue]( &OBJC_CLASS___MediaPlayerHelper,  "sharedSystemMusicPlayerQueue");
  if (v3) {
    dispatch_sync(v3, &stru_100104580);
  }
  else {
    __break(0x5510u);
  }
}

- (MediaPlayerHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MediaPlayerHelper;
  v2 = -[MediaPlayerHelper init](&v6, "init");
  if (!v2) {
    return (MediaPlayerHelper *)v2;
  }
  result = (MediaPlayerHelper *)dispatch_queue_create("com.apple.iapd.nowPlayingQueue", 0LL);
  uint32_t v4 = (MediaPlayerHelper **)(v2 + 104);
  *((void *)v2 + 13) = result;
  pthread_mutex_init((pthread_mutex_t *)(v2 + 16), 0LL);
  sub_1000CEA98(6u, @"MP: initing observers");
  sub_1000CEA98(7u, @"MR: initing observers");
  if ((((_BYTE)v2 + 8) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 1) = 0LL;
  if ((((_BYTE)v2 + 80) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 10) = 0LL;
  if ((((_BYTE)v2 + 88) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 11) = 0LL;
  *(_DWORD *)(v2 + 97) = 0;
  if ((((_BYTE)v2 + 112) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 28) = 1;
  if ((((_BYTE)v2 + 116) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 29) = 1;
  if ((((_BYTE)v2 + 120) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 30) = 1;
  if ((((_BYTE)v2 + 124) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 31) = 1;
  if ((((_BYTE)v2 + 0x80) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 32) = 0;
  if ((((_BYTE)v2 - 124) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 33) = 0;
  if ((((_BYTE)v2 - 120) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 17) = 0LL;
  if ((((_BYTE)v2 - 100) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 39) = 0;
  if ((((_BYTE)v2 - 104) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 38) = 0;
  v2[160] = 0;
  if ((((_BYTE)v2 - 92) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 41) = 0;
  v2[168] = 0;
  if ((((_BYTE)v2 - 84) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 43) = 0;
  *((_WORD *)v2 + 88) = 0;
  *((_WORD *)v2 + 106) = 0;
  v2[214] = 0;
  if ((((_BYTE)v2 - 112) & 7) != 0
    || (*((void *)v2 + 18) = 0LL,
        result = objc_alloc_init(&OBJC_CLASS___IAPApplicationStateMonitor),
        (((_BYTE)v2 - 56) & 7) != 0)
    || (*((void *)v2 + 25) = result, (((_BYTE)v2 - 48) & 3) != 0)
    || (*((_DWORD *)v2 + 52) = -1, (((_BYTE)v2 - 72) & 7) != 0))
  {
LABEL_26:
    __break(0x5516u);
  }

  else
  {
    *((void *)v2 + 23) = 0LL;
    v2[192] = 0;
    if (dword_100119860 == -1) {
      dword_100119860 = CFPreferencesGetAppBooleanValue( @"PodcastPlaybackInMusicApp",  @"com.apple.iapd",  0LL) != 0;
    }
    result = *v4;
    if (*v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000379D0;
      block[3] = &unk_100101C70;
      block[4] = v2;
      dispatch_async((dispatch_queue_t)result, block);
      return (MediaPlayerHelper *)v2;
    }
  }

  __break(0x5510u);
  return result;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  kMRMediaRemoteNowPlayingInfoDidChangeNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  kMRMediaRemoteNowPlayingApplicationDidChangeNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  MPMusicPlayerControllerItemPlaybackDidEndNotification,  0LL);
  uint32_t v4 = +[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  MPMediaLibraryEntitiesAddedOrRemovedNotification,  v4);
  -[MPMediaLibrary endGeneratingLibraryChangeNotifications](v4, "endGeneratingLibraryChangeNotifications");
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (*p_nowPlayingInfo)
  {

    *p_nowPlayingInfo = 0LL;
  }

  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (*p_nowPlayingAppIdentifier)
  {

    *p_nowPlayingAppIdentifier = 0LL;
  }

  p_nowPlayingAppName = &self->_nowPlayingAppName;
  if (*p_nowPlayingAppName)
  {

    *p_nowPlayingAppName = 0LL;
  }

  p_nowPlayingAppIsPlayingTimestamp = &self->_nowPlayingAppIsPlayingTimestamp;
  if (*p_nowPlayingAppIsPlayingTimestamp)
  {

    *p_nowPlayingAppIsPlayingTimestamp = 0LL;
  }

  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (*p_currentSupportedCommands)
  {
    CFRelease(*p_currentSupportedCommands);
    *p_currentSupportedCommands = 0LL;
  }

  p_pbqItems = &self->pbqItems;
  if (*p_pbqItems)
  {

    *p_pbqItems = 0LL;
  }

  if ((((_BYTE)self - 56) & 7) != 0
    || (self->_appStateMonitor,
        pthread_mutex_unlock(&self->_nowPlayingInfoLock),
        p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue,
        ((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0))
  {
LABEL_25:
    __break(0x5516u);
  }

  else if (*p_nowPlayingHandlerQueue)
  {
    dispatch_release((dispatch_object_t)*p_nowPlayingHandlerQueue);
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MediaPlayerHelper;
    -[MediaPlayerHelper dealloc](&v12, "dealloc");
    return;
  }

  __break(0x5510u);
}

+ (id)sharedSystemMusicPlayer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038050;
  block[3] = &unk_100101C70;
  block[4] = a1;
  if (qword_10011BD08 != -1) {
    dispatch_once(&qword_10011BD08, block);
  }
  return (id)qword_10011BD00;
}

+ (id)sharedSystemMusicPlayerQueue
{
  if (qword_10011BD18 != -1) {
    dispatch_once(&qword_10011BD18, &stru_1001045F0);
  }
  return (id)qword_10011BD10;
}

- (void)postFakeShuffleModeChanged
{
}

- (int)prepareForPlaybackWithQuery:(id)a3 andFirstItem:(id)a4
{
  uint64_t v7 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  int v31 = 0;
  if (dword_100119860) {
    goto LABEL_2;
  }
  *(_WORD *)&self->podcastAppSelected = 0;
  self->iTunesUAppSelected = 0;
  id v10 = [a3 items];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    LOBYTE(v13) = 1;
    int v14 = 1;
    int v15 = 1;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)i) mediaType];
        if (v17 == (id)1024) {
          int v18 = v15;
        }
        else {
          int v18 = 0;
        }
        if (v17 != (id)2) {
          int v15 = v18;
        }
        int v13 = (v17 == (id)4) & v13;
        if (v17 == (id)4096) {
          int v19 = v14;
        }
        else {
          int v19 = 0;
        }
        if (v17 != (id)8) {
          int v14 = v19;
        }
        if (((v15 | v13) & 1) == 0 && (v14 & 1) == 0)
        {
          LOBYTE(v14) = 0;
          int v13 = 0;
          goto LABEL_29;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }

- (void)_nowPlayingItemChanged:(id)a3
{
  if (!byte_10011C864) {
    goto LABEL_16;
  }
  byte_10011C864 = 0;
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
  {
    (*(void (**)(uint64_t))(*(void *)qword_10011BD38 + 680LL))(qword_10011BD38);
    uint32_t v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    if (qword_10011BD40 != -1) {
      dispatch_once(&qword_10011BD40, &stru_1001046A0);
    }
    if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
    {
      (*(void (**)(uint64_t))(*(void *)qword_10011BD38 + 568LL))(qword_10011BD38);
      BOOL v5 = -[MPMediaQuery initWithEntities:entityType:]( [MPMediaQuery alloc],  "initWithEntities:entityType:",  [(id)qword_10011C868 items],  0);
      -[MediaPlayerHelper prepareForPlaybackWithQuery:andFirstItem:]( self,  "prepareForPlaybackWithQuery:andFirstItem:",  v5,  qword_10011C870);

      if (qword_10011BD40 != -1) {
        dispatch_once(&qword_10011BD40, &stru_1001046A0);
      }
      if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
      {
        (*(void (**)(uint64_t))(*(void *)qword_10011BD38 + 560LL))(qword_10011BD38);
        sub_100038804();

LABEL_16:
        if (qword_10011BD40 != -1) {
          dispatch_once(&qword_10011BD40, &stru_1001046A0);
        }
        if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
        {
          (*(void (**)(uint64_t, uint64_t, void, void, void))(*(void *)qword_10011BD38 + 56LL))( qword_10011BD38,  524311LL,  0LL,  0LL,  0LL);
          return;
        }
      }
    }
  }

  __break(0x5516u);
LABEL_22:
  __break(0x550Au);
}

- (void)_repeatModeChanged:(id)a3
{
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (qword_10011BD38) {
    BOOL v3 = (qword_10011BD38 & 7) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    (*(void (**)(void))(*(void *)qword_10011BD38 + 56LL))();
  }
  else {
    __break(0x5516u);
  }
}

- (void)_shuffleModeChanged:(id)a3
{
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (qword_10011BD38) {
    BOOL v3 = (qword_10011BD38 & 7) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    (*(void (**)(void))(*(void *)qword_10011BD38 + 56LL))();
  }
  else {
    __break(0x5516u);
  }
}

- (unsigned)nowPlayingAppIsValid
{
  p_nowPlayingAppIdentifier = (MediaPlayerHelper **)&self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    self = *p_nowPlayingAppIdentifier;
    if (*p_nowPlayingAppIdentifier) {
      LOBYTE(self) = -[MediaPlayerHelper length](self, "length", v2, v3) != 0LL;
    }
  }

  return self;
}

- (unsigned)nowPlayingAppIsIPodApp
{
  uint64_t v2 = self;
  if (self->_nowPlayingAppIsIPodIsValid) {
    goto LABEL_10;
  }
  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (-[NSString isEqualToString:](*p_nowPlayingAppIdentifier, "isEqualToString:", @"com.apple.mobileipod")) {
    LODWORD(self) = 1;
  }
  else {
    LODWORD(self) = -[NSString isEqualToString:]( *p_nowPlayingAppIdentifier,  "isEqualToString:",  @"com.apple.Music");
  }
  v2->_nowPlayingAppIsIPod = self;
  v2->_nowPlayingAppIsIPodRadio = 0;
  if (!(_DWORD)self) {
    goto LABEL_9;
  }
  if ((((_BYTE)v2 + 8) & 7) != 0)
  {
LABEL_11:
    __break(0x5516u);
    return self;
  }

  v2->_nowPlayingAppIsIPodRadio = -[NSMutableDictionary objectForKey:]( v2->_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoRadioStationName) != 0LL;
LABEL_9:
  v2->_nowPlayingAppIsIPodIsValid = 1;
LABEL_10:
  LOBYTE(self) = v2->_nowPlayingAppIsIPod;
  return self;
}

- (unsigned)nowPlayingAppIsiTunesRadio
{
  unsigned int v3 = -[MediaPlayerHelper nowPlayingAppIsIPodApp](self, "nowPlayingAppIsIPodApp");
  if (v3) {
    LOBYTE(v3) = self->_nowPlayingAppIsIPodRadio != 0;
  }
  return v3;
}

- (unsigned)nowPlayingAppIsVideosApp
{
  else {
    LOBYTE(self) = -[NSString isEqualToString:]( self->_nowPlayingAppIdentifier,  "isEqualToString:",  @"com.apple.videos",  v2,  v3);
  }
  return self;
}

- (unsigned)nowPlayingAppIsPodcastApp
{
  else {
    LOBYTE(self) = -[NSString isEqualToString:]( self->_nowPlayingAppIdentifier,  "isEqualToString:",  @"com.apple.podcasts",  v2,  v3);
  }
  return self;
}

- (unsigned)nowPlayingAppIsiBooksApp
{
  else {
    LOBYTE(self) = -[NSString isEqualToString:]( self->_nowPlayingAppIdentifier,  "isEqualToString:",  @"com.apple.iBooks",  v2,  v3);
  }
  return self;
}

- (unsigned)nowPlayingAppIsiTunesUApp
{
  else {
    LOBYTE(self) = -[NSString isEqualToString:]( self->_nowPlayingAppIdentifier,  "isEqualToString:",  @"com.apple.itunesu",  v2,  v3);
  }
  return self;
}

- (id)nowPlayingAppName
{
  if ((((unint64_t)self + 88) & 7) == 0)
  {
    uint64_t v2 = (void *)*((void *)self + 11);
    if (v2) {
      return v2;
    }
  }

  __break(0x5516u);
  return self;
}

- (int)nowPlayingAppPlaybackState
{
  uint64_t v3 = sub_100062E0C();
  p_lastTimeNowPlayingPBRateChangeToPauseOrStop = &self->_lastTimeNowPlayingPBRateChangeToPauseOrStop;
  BOOL v5 = v3;
  BOOL v6 = 1;
  LODWORD(v3) = sub_100063BF0(*p_lastTimeNowPlayingPBRateChangeToPauseOrStop, v3, 1);
  if (!dword_100119848)
  {
    unsigned int explicitControlOccurred = self->_explicitControlOccurred;
    if (explicitControlOccurred >= 2) {
      goto LABEL_39;
    }
    BOOL v6 = v3 > 0x7D0 || explicitControlOccurred != 0;
  }

  if (self->_nowPlayingAppIsPlaying) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6;
  }
  if (!v9)
  {
    BOOL v10 = self->_explicitControlOccurred;
    sub_1000CEA98( 6u,  @"MP: nowPlayingAppPlaybackState: result=%d, _nowPlayingAppIsPlaying(%d) || ! pbRateChangeTimeExpired(%d), _explici tControlOccurred=%d curTime(%u) _lastTimeNowPlayingPBRateChangeToPauseOrStop(%u)",  1LL,  self->_nowPlayingAppIsPlaying,  v6,  v10,  v5,  *p_lastTimeNowPlayingPBRateChangeToPauseOrStop);
  }

  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
LABEL_38:
    __break(0x5516u);
    goto LABEL_39;
  }

  uint64_t v3 = (uint64_t *)-[NSMutableDictionary objectForKey:]( self->_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoPlaybackRate);
  id v11 = v3;
  if (v3)
  {
    LODWORD(v3) = [v3 floatValue];
    if (v12 == 0.0)
    {
      if (v6)
      {
        uint64_t nowPlayingAppIsPlaying = self->_nowPlayingAppIsPlaying;
LABEL_26:
        uint64_t v15 = 2LL;
        sub_1000CEA98( 6u,  @"MP: nowPlayingAppPlaybackState: result=%d, playbackRateObj=%@ _nowPlayingAppIsPlaying=%d pbRateChangeTimeExpired=%d",  2LL,  v11,  nowPlayingAppIsPlaying,  1LL);
        goto LABEL_33;
      }

      goto LABEL_30;
    }

    if (self->_nowPlayingAppIsPlaying) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v6;
    }
    if (v14)
    {
      uint64_t nowPlayingAppIsPlaying = 0LL;
      goto LABEL_26;
    }
  }

  if (!v9)
  {
LABEL_30:
    uint64_t v15 = 1LL;
    goto LABEL_33;
  }

  LODWORD(v3) = -[MediaPlayerHelper isLoadingRadioStation](self, "isLoadingRadioStation");
  if ((_DWORD)v3)
  {
    uint64_t v15 = 1LL;
    sub_1000CEA98( 6u,  @"MP: nowPlayingAppPlaybackState: result=%d, isLoadingRadioStation=%d",  1LL,  -[MediaPlayerHelper isLoadingRadioStation](self, "isLoadingRadioStation"));
  }

  else
  {
    BOOL v16 = self->_explicitControlOccurred;
    sub_1000CEA98( 6u,  @"MP: nowPlayingAppPlaybackState: result=%d, _nowPlayingAppIsPlaying(%d) || ! pbRateChangeTimeExpired(%d), _explici tControlOccurred=%d curTime(%u) _lastTimeNowPlayingPBRateChangeToPauseOrStop(%u) playbackRateObj=%@ isLoadi ngRadioStation=%d",  0LL,  self->_nowPlayingAppIsPlaying,  1LL,  v16,  v5,  self->_lastTimeNowPlayingPBRateChangeToPauseOrStop,  v11,  -[MediaPlayerHelper isLoadingRadioStation](self, "isLoadingRadioStation"));
    uint64_t v15 = 0LL;
  }

- (double)nowPlayingAppPlaybackRate
{
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_nowPlayingInfo)
    {
      id v5 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoPlaybackRate);
      [v5 floatValue];
      double v7 = v6;
      if (!v5)
      {
        if (self->_nowPlayingAppIsPlaying) {
          double v7 = 1.0;
        }
      }
    }

    else
    {
      double v7 = 0.0;
    }

    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v7;
  }

  return result;
}

- (double)nowPlayingAppPlaybackSpeed
{
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    double v5 = 1.0;
    if (*p_nowPlayingInfo)
    {
      id v6 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate);
      if (v6)
      {
        [v6 floatValue];
        double v5 = v7;
      }
    }

    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v5;
  }

  return result;
}

- (double)currentPlaybackTime
{
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) == 0)
  {
    if (*p_nowPlayingInfo)
    {
      double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
      id v6 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoElapsedTime);
      id v7 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoPlaybackRate);
      id v8 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoTimestamp);
      BOOL v9 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
      [v7 doubleValue];
      double v11 = v10;
      [v6 doubleValue];
      double v13 = v12;
      objc_msgSend( -[NSMutableDictionary objectForKey:](*p_nowPlayingInfo, "objectForKey:", kMRMediaRemoteNowPlayingInfoDuration),  "doubleValue");
      double v15 = v14;
      if (!v7 && self->_nowPlayingAppIsPlaying) {
        double v11 = 1.0;
      }
      -[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v8);
      double v17 = v13 + v16 * v11;
      if (v17 < 0.0) {
        double v17 = 0.0;
      }
      if (v17 <= v15 || v15 <= 0.0) {
        double v19 = v17;
      }
      else {
        double v19 = v15;
      }
      goto LABEL_14;
    }

    if (!self->_nowPlayingAppIsPlaying)
    {
      double v19 = 0.0;
      goto LABEL_15;
    }

    double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    v20 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    if (((unint64_t)&self->_nowPlayingAppIsPlayingTimestamp & 7) == 0)
    {
      if (self->_nowPlayingAppIsPlayingTimestamp)
      {
        -[NSDate timeIntervalSinceDate:](v20, "timeIntervalSinceDate:");
        double v19 = v21;
      }

      else
      {
        double v19 = 0.0;
      }

- (double)currentNowPlayingInfoDuration
{
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v4 = -[NSMutableDictionary objectForKey:]( self->_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoDuration);
    if (v4)
    {
      [v4 doubleValue];
      double v6 = v5;
    }

    else
    {
      double v6 = -1.0;
    }

    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v6;
  }

  return result;
}

- (unint64_t)currentNowPlayingInfoPID
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  unint64_t result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if ((((_BYTE)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoUniqueIdentifier),  "unsignedLongLongValue");
    if (self->_nowPlayingAppIsIPodRadio) {
      unint64_t v6 = 0LL;
    }
    else {
      unint64_t v6 = (unint64_t)v5;
    }
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v6;
  }

  return result;
}

- (unsigned)currentNowPlayingInfoNumber:(id)a3
{
  unsigned int result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    unsigned int v6 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->_nowPlayingInfo, "objectForKey:", a3),  "unsignedIntValue");
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v6;
  }

  return result;
}

- (id)currentNowPlayingInfoString:(id)a3
{
  id result = (id)pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v6 = -[NSMutableDictionary objectForKey:](self->_nowPlayingInfo, "objectForKey:", a3);
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v7;
  }

  return result;
}

- (id)nowPlayingInfoTitleForAudiobookIndex:(unsigned int)a3
{
  if (-[MediaPlayerHelper nowPlayingAppIsiBooksApp](self, "nowPlayingAppIsiBooksApp")
    && (uint64_t v5 = -[MediaPlayerHelper currentNowPlayingInfoChapterCount](self, "currentNowPlayingInfoChapterCount"),
        v5 > a3))
  {
    return  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %u/%u",   -[MediaPlayerHelper currentNowPlayingInfoString:]( self,  "currentNowPlayingInfoString:",  kMRMediaRemoteNowPlayingInfoAlbum),  a3 + 1,  v5);
  }

  else
  {
    return 0LL;
  }

- (unsigned)currentNowPlayingInfoTrack
{
  return -[MediaPlayerHelper _currentNowPlayingInfoTrack:](self, "_currentNowPlayingInfoTrack:", 1LL);
}

- (unsigned)_currentNowPlayingInfoTrack:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoQueueIndex);
  uint64_t v6 = -[MediaPlayerHelper fakeStreamTrackIndexTimeExpired](self, "fakeStreamTrackIndexTimeExpired");
  if ((v6 & 1) != 0)
  {
    if (-[MediaPlayerHelper nowPlayingAppIsiBooksApp](self, "nowPlayingAppIsiBooksApp")) {
      return -[MediaPlayerHelper currentNowPlayingInfoChapter](self, "currentNowPlayingInfoChapter");
    }
    if (qword_10011BD40 != -1) {
      dispatch_once(&qword_10011BD40, &stru_1001046A0);
    }
    uint64_t v6 = qword_10011BD38;
    if (!qword_10011BD38 || (qword_10011BD38 & 7) != 0) {
      goto LABEL_19;
    }
    uint64_t v6 = sub_1000393F0(qword_10011BD38, v3);
    if (!(_DWORD)v6) {
      return v5;
    }
    if (dword_100119850 == 1) {
      return 0;
    }
    if ((dword_100119850 & 0xFFFFFFFE) != 2)
    {
      if (!self->_fakeStreamTrackCount)
      {
        self->_fakeStreamTrackCount = 2;
        self->_fakeStreamTrackIndex = 1;
      }
    }
  }

- (unsigned)currentNowPlayingInfoTrackCount
{
  unsigned int fakeStreamTrackCount = -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoTotalQueueCount);
  if (-[MediaPlayerHelper nowPlayingAppIsiBooksApp](self, "nowPlayingAppIsiBooksApp")) {
    return -[MediaPlayerHelper currentNowPlayingInfoChapterCount](self, "currentNowPlayingInfoChapterCount");
  }
  if (dword_100119850 == 4
    && !-[MediaPlayerHelper fakeStreamTrackIndexTimeExpired](self, "fakeStreamTrackIndexTimeExpired"))
  {
    return fakeStreamTrackCount;
  }

  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  unsigned int result = qword_10011BD38;
  if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
  {
    if (fakeStreamTrackCount > 0x7FFFFFFE) {
      unsigned int fakeStreamTrackCount = 0;
    }
    unsigned int result = (*(uint64_t (**)(void))(*(void *)qword_10011BD38 + 512LL))();
    if (!result) {
      return fakeStreamTrackCount;
    }
    unsigned int fakeStreamTrackCount = dword_100119850;
    switch(dword_100119850)
    {
      case 1:
        return fakeStreamTrackCount;
      case 3:
        if (((unint64_t)&self->_fakeStreamTrackCount & 3) == 0)
        {
          unsigned int fakeStreamTrackCount = self->_fakeStreamTrackCount;
          if (!fakeStreamTrackCount)
          {
            -[MediaPlayerHelper _calcNewFakeStreamIndexCount](self, "_calcNewFakeStreamIndexCount");
            return self->_fakeStreamTrackCount;
          }

          return fakeStreamTrackCount;
        }

        break;
      case 2:
        return fakeStreamTrackCount;
      default:
        unsigned int fakeStreamTrackCount = self->_fakeStreamTrackCount;
        if (fakeStreamTrackCount) {
          return fakeStreamTrackCount;
        }
        self->_unsigned int fakeStreamTrackCount = 2;
        if (((unint64_t)&self->_fakeStreamTrackIndex & 3) == 0)
        {
          self->_fakeStreamTrackIndex = 1;
          return 2;
        }

        break;
    }
  }

  __break(0x5516u);
  return result;
}

- (unsigned)currentNowPlayingInfoChapter
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoChapterNumber);
}

- (unsigned)currentNowPlayingInfoChapterCount
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoTotalChapterCount);
}

- (unsigned)currentNowPlayingInfoDisc
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoDiscNumber);
}

- (unsigned)currentNowPlayingInfoDiscCount
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoTotalDiscCount);
}

- (unsigned)currentNowPlayingInfoAlbumTrack
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoTrackNumber);
}

- (unsigned)currentNowPlayingInfoAlbumTrackCount
{
  return -[MediaPlayerHelper currentNowPlayingInfoNumber:]( self,  "currentNowPlayingInfoNumber:",  kMRMediaRemoteNowPlayingInfoTotalTrackCount);
}

- (BOOL)isLoadingRadioStation
{
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    unint64_t v3 = (unint64_t)-[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier);
    unint64_t v4 = (unint64_t)-[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoRadioStationHash);
    LOBYTE(self) = (v3 | v4 | (unint64_t)-[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoRadioStationName)) != 0;
  }

  return (char)self;
}

- (int)currentShuffleMode
{
  int result = sub_100062E0C();
  p_expectedShuffleModeTimestamp = &self->expectedShuffleModeTimestamp;
  if (((unint64_t)&self->expectedShuffleModeTimestamp & 3) == 0)
  {
    int result = sub_100063BF0(*p_expectedShuffleModeTimestamp, result, 1);
    if (*p_expectedShuffleModeTimestamp && (!byte_10011BD20 ? (unsigned int v5 = 1700) : (unsigned int v5 = 5000), result < v5))
    {
      p_expectedShuffleMode = (unsigned int *)&self->expectedShuffleMode;
      if ((p_expectedShuffleMode & 3) == 0)
      {
        NSLog( @"MR: %s:%d return expectedShuffleMode=%d",  "-[MediaPlayerHelper currentShuffleMode]",  1429LL,  *p_expectedShuffleMode);
        return *p_expectedShuffleMode;
      }
    }

    else
    {
      p_expectedShuffleMode = (unsigned int *)&self->shuffleModeCache;
      if ((p_expectedShuffleMode & 3) == 0)
      {
        NSLog( @"MR: %s:%d return shuffleModeCache=%d",  "-[MediaPlayerHelper currentShuffleMode]",  1432LL,  *p_expectedShuffleMode);
        return *p_expectedShuffleMode;
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (int)currentRepeatMode
{
  int result = sub_100062E0C();
  p_expectedRepeatModeTimestamp = &self->expectedRepeatModeTimestamp;
  if (((unint64_t)&self->expectedRepeatModeTimestamp & 3) == 0)
  {
    int result = sub_100063BF0(*p_expectedRepeatModeTimestamp, result, 1);
    if (*p_expectedRepeatModeTimestamp && (!byte_10011BD20 ? (unsigned int v5 = 1700) : (unsigned int v5 = 5000), result < v5))
    {
      p_expectedRepeatMode = (unsigned int *)&self->expectedRepeatMode;
      if ((p_expectedRepeatMode & 3) == 0)
      {
        NSLog( @"MR: %s:%d return expectedRepeatMode=%d",  "-[MediaPlayerHelper currentRepeatMode]",  1442LL,  *p_expectedRepeatMode);
        return *p_expectedRepeatMode;
      }
    }

    else
    {
      int result = -[MediaPlayerHelper nowPlayingAppIsiTunesRadio](self, "nowPlayingAppIsiTunesRadio");
      if (result)
      {
        int v7 = 3;
        NSLog(@"MR: %s:%d return repeatModeCache=%d", "-[MediaPlayerHelper currentRepeatMode]", 1450LL, 3LL);
        return v7;
      }

      p_expectedRepeatMode = (unsigned int *)&self->repeatModeCache;
      if ((p_expectedRepeatMode & 3) == 0)
      {
        NSLog( @"MR: %s:%d return repeatModeCache=%d",  "-[MediaPlayerHelper currentRepeatMode]",  1454LL,  *p_expectedRepeatMode);
        return *p_expectedRepeatMode;
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (void)setExpectedShuffleMode:(int)a3
{
  NSLog(@"MR: %s:%d shuffleMode=%d", a2, "-[MediaPlayerHelper setExpectedShuffleMode:]", 1460LL, a3);
  if (self->shuffleModeCache == a3) {
    return;
  }
  if (((unint64_t)&self->expectedShuffleMode & 3) != 0
    || (self->expectedShuffleMode = a3,
        unsigned int v5 = sub_100062E0C(),
        ((unint64_t)&self->expectedShuffleModeTimestamp & 3) != 0))
  {
LABEL_7:
    __break(0x5516u);
    return;
  }

  self->expectedShuffleModeTimestamp = v5;
  NSLog( @"MR: %s:%d expectedShuffleMode=%d expectedShuffleModeTimestamp=%u",  "-[MediaPlayerHelper setExpectedShuffleMode:]",  1466LL,  self->expectedShuffleMode,  v5);
}

- (void)setExpectedRepeatMode:(int)a3
{
  NSLog(@"MR: %s:%d repeatMode=%d", a2, "-[MediaPlayerHelper setExpectedRepeatMode:]", 1472LL, a3);
  if (self->repeatModeCache == a3) {
    return;
  }
  if (((unint64_t)&self->expectedRepeatMode & 3) != 0
    || (self->expectedRepeatMode = a3,
        unsigned int v5 = sub_100062E0C(),
        ((unint64_t)&self->expectedRepeatModeTimestamp & 3) != 0))
  {
LABEL_7:
    __break(0x5516u);
    return;
  }

  self->expectedRepeatModeTimestamp = v5;
  NSLog( @"MR: %s:%d expectedRepeatMode=%d expectedRepeatModeTimestamp=%u",  "-[MediaPlayerHelper setExpectedRepeatMode:]",  1478LL,  self->expectedRepeatMode,  v5);
}

- (id)currentNowPlayingInfoArtwork
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  id result = (id)pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_nowPlayingInfo)
    {
      id v6 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoArtworkData);
      int v7 = v6;
      if (v6) {
        id v8 = v6;
      }
    }

    else
    {
      int v7 = 0LL;
    }

    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v7;
  }

  return result;
}

- (BOOL)currentNowPlayingInfoArtworkExists
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  BOOL result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = (id *)&self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    BOOL v7 = *p_nowPlayingInfo
      && (id v6 = [*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoArtworkData]) != 0
      && [v6 length] != 0;
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v7;
  }

  return result;
}

- (BOOL)currentNowPlayingInfoTrackCountExists
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  BOOL result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_nowPlayingInfo) {
      BOOL v6 = -[NSMutableDictionary objectForKey:]( *p_nowPlayingInfo,  "objectForKey:",  kMRMediaRemoteNowPlayingInfoTotalQueueCount) != 0LL;
    }
    else {
      BOOL v6 = 0;
    }
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v6;
  }

  return result;
}

- (void)initPBQItemsFromQueueQuery
{
  p_pbqItems = &self->pbqItems;
  if (((unint64_t)&self->pbqItems & 7) != 0)
  {
    __break(0x5516u);
  }

  else if (!*p_pbqItems)
  {
    if (sub_1000357C4())
    {
      unint64_t v3 = (NSArray *)objc_msgSend( +[MediaPlayerHelper sharedSystemMusicPlayer]( MediaPlayerHelper,  "sharedSystemMusicPlayer"),  "queueAsQuery");
      if (v3) {
        unint64_t v3 = (NSArray *)-[NSArray items](v3, "items");
      }
      *p_pbqItems = v3;
    }

    else
    {
      NSLog(@"%s:%d no systemMusicPlayer!", "-[MediaPlayerHelper initPBQItemsFromQueueQuery]", 1553LL);
    }
  }

- (id)getPBQItemsFromQueueQuery
{
  return self;
}

- (id)_nowPlayingInfoDesc:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v5 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoUniqueIdentifier];
  id v30 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTitle];
  id v32 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoPlaybackRate];
  id v31 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoQueueIndex];
  id v29 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalQueueCount];
  id v28 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoChapterNumber];
  id v27 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalChapterCount];
  id v26 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoDiscNumber];
  id v25 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalDiscCount];
  id v24 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTrackNumber];
  id v23 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalTrackCount];
  id v22 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoDuration];
  id v21 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoElapsedTime];
  id v20 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoArtist];
  id v19 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoAlbum];
  id v6 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoComposer];
  id v7 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoGenre];
  id v8 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoStartTime];
  id v9 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTimestamp];
  id v10 = v5;
  id v11 = [v5 unsignedLongLongValue];
  id result = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (((unint64_t)&self->repeatModeCache & 3) != 0 || ((unint64_t)&self->shuffleModeCache & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v13 = result;
    uint64_t repeatModeCache = self->repeatModeCache;
    uint64_t shuffleModeCache = self->shuffleModeCache;
    [result timeIntervalSinceDate:v8];
    uint64_t v17 = v16;
    [v13 timeIntervalSinceDate:v9];
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    pid=%@,0x%qx track#:%@/%@ chap#:%@/%@ disc#:%@/%@\n    elapsed=%@/%@ playbackRate=%@\n    albumTrack#:%@/%@ cached:[repeat=%d shuffle=%d]\n    startTime=%@,%lf timeStamp=%@, %lf nowTime=%@\n    title=%@\n    artist=%@\n    album=%@\n    composer=%@\n    genre=%@",  v10,  v11,  v31,  v29,  v28,  v27,  v26,  v25,  v21,  v22,  v32,  v24,  v23,  repeatModeCache,  shuffleModeCache,  v8,  v17,  v9,  v18,  v13,  v30,  v20,  v19,  v6,  v7);
  }

  return result;
}

- (void)_printNowPlayingInfo:(id)a3 forName:(id)a4
{
  if (sub_1000CEA70(7LL))
  {
    NSLog(@"MR: %s:%d %@=%hhx", "-[MediaPlayerHelper _printNowPlayingInfo:forName:]", 1633LL, a4, a3);
    if (a3) {
      NSLog( @"MR: %s:%d\n%@",  "-[MediaPlayerHelper _printNowPlayingInfo:forName:]",  1638LL,  -[MediaPlayerHelper _nowPlayingInfoDesc:](self, "_nowPlayingInfoDesc:", a3));
    }
  }

- (void)_handleNowPlayingInfo:(__CFDictionary *)a3
{
  v81 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v85 = sub_1000BC5A4();
  pthread_once(&stru_10011B908, sub_1000BC260);
  if (dword_10011B904)
  {
    pthread_once(&stru_1001198A8, (void (*)(void))sub_100042984);
    pthread_mutex_lock(&stru_100119868);
    if (qword_10011BCF8)
    {
      id v5 = (unsigned int *)qword_10011BD28;
      if (!qword_10011BD28 || (qword_10011BD28 & 7) != 0) {
        goto LABEL_220;
      }
      id v6 = (unsigned int *)sub_10003AD60((uint64_t)&qword_10011BCE8);
      if (v85 < *v6) {
        goto LABEL_223;
      }
      uint64_t v7 = v5[19];
      if (dword_10011B8F8[v7]) {
        (*(void (**)(unsigned int *, void, void, void))(*(void *)v5 + 104LL))( v5,  v85 - *v6,  0LL,  0LL);
      }
      sub_10003ADA0((uint64_t)&qword_10011BCE8);
    }

    pthread_mutex_unlock(&stru_100119868);
    pthread_once(&stru_100119828, (void (*)(void))sub_100036CB4);
    if (dword_10011C860)
    {
      if (!qword_10011C858 || (qword_10011C858 & 7) != 0) {
        goto LABEL_220;
      }
      if (v85 < dword_10011C860) {
        goto LABEL_223;
      }
      uint64_t v8 = *(unsigned int *)(qword_10011C858 + 76);
      if (dword_10011B8F8[v8]) {
        (*(void (**)(void))(*(void *)qword_10011C858 + 104LL))();
      }
      dword_10011C860 = 0;
    }
  }

  NSLog(@"MR: %s:%d nowPlayingInfo=%hhx", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1670LL, a3);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  id v10 = *p_nowPlayingInfo;
  unsigned int v11 = *p_nowPlayingInfo != 0LL;
  if (*p_nowPlayingInfo)
  {
    objc_msgSend( -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMRMediaRemoteNowPlayingInfoPlaybackRate),  "floatValue");
    double v13 = v12;
  }

  else
  {
    double v13 = 0.0;
  }

  if (!a3 || !-[__CFDictionary count](a3, "count"))
  {
    sub_1000CEA98( 7u,  @"MR: %s:%d nil nowPlayingInfo=%hhx oldNowPlayingInfo=%hhx tmpNowPlayingInfo=%hhx",  "-[MediaPlayerHelper _handleNowPlayingInfo:]",  1706LL,  a3,  v10,  0LL);
    double v14 = 0LL;
    BOOL v83 = 0;
    unsigned __int8 v78 = 0;
    BOOL v82 = 0;
    BOOL v84 = 0;
    BOOL v77 = 0;
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v75 = 0;
    id v76 = 0LL;
    unsigned int v73 = -1;
    double v18 = 0.0;
    unsigned int v19 = v11;
    signed int v20 = -1;
    unsigned int v21 = v11;
    goto LABEL_33;
  }

  sub_1000CEA98( 7u,  @"MR: %s:%d copy nowPlayingInfo(%hhx) to tmpNowPlayingInfo(%hhx), oldNowPlayingInfo=%hhx",  "-[MediaPlayerHelper _handleNowPlayingInfo:]",  1700LL,  a3,  0LL,  v10);
  double v14 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3);
  +[NowPlayingHelper validateNowPlayingInfo:](&OBJC_CLASS___NowPlayingHelper, "validateNowPlayingInfo:", v14);
  if (!v14)
  {
    unsigned int v11 = 0;
    unsigned int v19 = 0;
    BOOL v83 = 0;
    unsigned __int8 v78 = 0;
    BOOL v82 = 0;
    BOOL v84 = 0;
    BOOL v77 = 0;
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v75 = 0;
    id v76 = 0LL;
    unsigned int v21 = 0;
    unsigned int v73 = -1;
    double v18 = 0.0;
    signed int v20 = -1;
    goto LABEL_33;
  }

  double v15 = v14;
  uint64_t v16 = kMRMediaRemoteNowPlayingInfoTimestamp;
  if (dword_100119838
    || !-[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoTimestamp))
  {
    NSLog( @"%s:%s:%d nil timestamp for nowPlayingInfo, setting it to current time",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAP/link/MediaPlayer.mm",  "-[MediaPlayerHelper _handleNowPlayingInfo:]",  1724LL);
    -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  v16);
  }

  uint64_t v69 = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
  id v30 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  uint64_t v74 = kMRMediaRemoteNowPlayingInfoTotalQueueCount;
  id v31 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  uint64_t v71 = kMRMediaRemoteNowPlayingInfoPlaybackRate;
  id v32 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  id v33 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoIsMusicApp);
  id v34 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoRadioStationName);
  uint64_t v63 = kMRMediaRemoteNowPlayingInfoTitle;
  id v35 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  BOOL v83 = v32 != 0LL;
  v67 = v32;
  [v32 floatValue];
  double v18 = v36;
  BOOL v82 = v33 != 0LL;
  unsigned __int8 v78 = [v33 BOOLValue];
  id v80 = v34;
  BOOL v84 = v34 != 0LL;
  v37 = v30;
  id v76 = [v30 unsignedLongLongValue];
  v64 = v35;
  BOOL v77 = v35 != 0LL;
  id v68 = v31;
  unsigned int v75 = [v31 unsignedLongValue];
  if (!v10)
  {
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v73 = -1;
    unsigned int v11 = 1;
    unsigned int v19 = 1;
    signed int v20 = -1;
    unsigned int v21 = 1;
    goto LABEL_33;
  }

  uint64_t v38 = kMRMediaRemoteNowPlayingInfoQueueIndex;
  id v66 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoQueueIndex);
  uint64_t v39 = kMRMediaRemoteNowPlayingInfoChapterNumber;
  id v40 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoChapterNumber);
  uint64_t v41 = kMRMediaRemoteNowPlayingInfoArtworkData;
  id v65 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", kMRMediaRemoteNowPlayingInfoArtworkData);
  id v42 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v69);
  id v70 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v38);
  id v43 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v74);
  id v44 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v71);
  id v72 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v41);
  id v45 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v39);
  v62 = v40;
  if (!v37)
  {
    v46 = v66;
    if (!v42) {
      goto LABEL_88;
    }
LABEL_94:
    unsigned int v21 = 1;
    v48 = v68;
    if (!v68) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }

  if (!v42)
  {
    unsigned int v21 = 1;
    v48 = v68;
    v46 = v66;
    if (!v68) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }

  v46 = v66;
LABEL_88:
  id v47 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v63);
  if (v64)
  {
    v48 = v68;
    if (!v47 || !objc_msgSend(v64, "isEqualToString:"))
    {
LABEL_108:
      unsigned int v21 = 1;
      if (!v48) {
        goto LABEL_110;
      }
      goto LABEL_109;
    }
  }

  else
  {
    v48 = v68;
    if (v47) {
      goto LABEL_108;
    }
  }

  if (v46)
  {
    if (!v70) {
      goto LABEL_108;
    }
    unsigned int v21 = objc_msgSend(v46, "isEqualToNumber:") ^ 1;
    if (!v48) {
      goto LABEL_110;
    }
  }

  else
  {
    unsigned int v21 = v70 != 0LL;
    if (!v48) {
      goto LABEL_110;
    }
  }

- (void)_handleNowPlayingAppIsPlayingDidChange:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  NSLog( @"MR: %s:%d nowPlayingAppIsPlaying=%d->%d",  "-[MediaPlayerHelper _handleNowPlayingAppIsPlayingDidChange:]",  2027LL,  self->_nowPlayingAppIsPlaying,  v3);
  int nowPlayingAppIsPlaying = self->_nowPlayingAppIsPlaying;
  if (nowPlayingAppIsPlaying != v3)
  {
    self->_int nowPlayingAppIsPlaying = v3;
    p_nowPlayingAppIsPlayingTimestamp = &self->_nowPlayingAppIsPlayingTimestamp;
    if (*p_nowPlayingAppIsPlayingTimestamp) {

    }
    uint64_t v8 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    *p_nowPlayingAppIsPlayingTimestamp = v8;
    id v9 = v8;
  }

  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (!qword_10011BD38 || (qword_10011BD38 & 7) != 0) {
    goto LABEL_20;
  }
  sub_10003AE40(qword_10011BD38, 0);
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (!qword_10011BD38 || (qword_10011BD38 & 7) != 0) {
    goto LABEL_20;
  }
  sub_10003AF78(qword_10011BD38);

  if (nowPlayingAppIsPlaying == v3) {
    goto LABEL_18;
  }
  uint64_t v10 = sub_10004783C();
  if (!v10 || (v10 & 7) != 0)
  {
LABEL_20:
    __break(0x5516u);
    goto LABEL_21;
  }

  sub_10004B9F0(v10, v3 != 0);
LABEL_18:
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  if (global_queue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B384;
    block[3] = &unk_100101C70;
    block[4] = self;
    dispatch_async(global_queue, block);
    return;
  }

- (void)_handlePlaybackQueueDidChange
{
  if ((sub_1000357C4() & 1) != 0)
  {
    unsigned int v3 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue]( &OBJC_CLASS___MediaPlayerHelper,  "sharedSystemMusicPlayerQueue");
    if (!v3) {
      goto LABEL_11;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B514;
    block[3] = &unk_100101C70;
    block[4] = self;
    dispatch_sync(v3, block);
  }

  else
  {
    NSLog(@"%s:%d no systemMusicPlayer!", "-[MediaPlayerHelper _handlePlaybackQueueDidChange]", 2066LL);
  }

  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
  {
    (*(void (**)(void))(*(void *)qword_10011BD38 + 56LL))();
    return;
  }

  __break(0x5516u);
LABEL_11:
  __break(0x5510u);
}

- (void)_handleNowPlayingAppDidChange:(id)a3
{
  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (!a3) {
    goto LABEL_5;
  }
  p_nowPlayingAppIdentifier = (id *)&self->_nowPlayingAppIdentifier;
  if (!*p_nowPlayingAppIdentifier
    || ([*p_nowPlayingAppIdentifier isEqualToString:a3] & 1) == 0)
  {
LABEL_5:
    id v6 = &self->_nowPlayingAppIdentifier;
    NSLog( @"MR: %s:%d app='%@'->'%@'",  "-[MediaPlayerHelper _handleNowPlayingAppDidChange:]",  2097LL,  *v6,  a3);
    if (*v6)
    {

      *id v6 = 0LL;
    }

    if (a3)
    {
      uint64_t v7 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", a3);
      self->_nowPlayingAppIdentifier = v7;
      uint64_t v8 = v7;
      self->_nowPlayingAppChanged = 1;
    }

    self->_nowPlayingAppIsIPodIsValid = 0;
  }

  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  if (self->podcastAppSelected < 2u)
  {
    if (self->podcastAppSelected && -[MediaPlayerHelper nowPlayingAppIsPodcastApp](self, "nowPlayingAppIsPodcastApp")) {
      goto LABEL_33;
    }
    if (self->iBooksAppSelected <= 1u)
    {
      if (self->iBooksAppSelected && -[MediaPlayerHelper nowPlayingAppIsiBooksApp](self, "nowPlayingAppIsiBooksApp")) {
        goto LABEL_33;
      }
      if (self->iTunesUAppSelected <= 1u)
      {
        if (!self->iTunesUAppSelected
          || !-[MediaPlayerHelper nowPlayingAppIsiTunesUApp](self, "nowPlayingAppIsiTunesUApp"))
        {
          if (qword_10011BD40 != -1) {
            dispatch_once(&qword_10011BD40, &stru_1001046A0);
          }
          if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
          {
            sub_10003AE40(qword_10011BD38, 0);
            if (qword_10011BD40 != -1) {
              dispatch_once(&qword_10011BD40, &stru_1001046A0);
            }
            if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
            {
              sub_10003AFF0(qword_10011BD38);
              if (qword_10011BD40 != -1) {
                dispatch_once(&qword_10011BD40, &stru_1001046A0);
              }
              if (qword_10011BD38 && (qword_10011BD38 & 7) == 0)
              {
                sub_10003B7C8((id *)qword_10011BD38, v9, v10);
                goto LABEL_33;
              }
            }
          }

- (void)_setNowPlayingApp:(id)a3
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_nowPlayingAppIdentifier)
    {

      id *p_nowPlayingAppIdentifier = 0LL;
    }

    if (a3)
    {
      uint64_t v7 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", a3);
      id *p_nowPlayingAppIdentifier = v7;
      uint64_t v8 = v7;
    }

    self->_nowPlayingAppIsIPodIsValid = 0;
    pthread_mutex_unlock(p_nowPlayingInfoLock);
  }

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  if (byte_100119844 >= 2u)
  {
    __break(0x550Au);
  }

  else
  {
    sub_1000CEA98( 0,  @"%s:%d __showCloudTracksSetting=%d->%d",  "-[MediaPlayerHelper _canShowCloudTracksDidChangeNotification:]",  2157,  byte_100119844,  objc_msgSend( +[MPCloudController sharedCloudController]( MPCloudController,  "sharedCloudController",  a3),  "canShowCloudMusic"));
    byte_100119844 = objc_msgSend( +[MPCloudController sharedCloudController]( MPCloudController,  "sharedCloudController"),  "canShowCloudMusic");
  }

- (void)_nowPlayingInfoChanged:(id)a3
{
  if (!dword_10011B904) {
    goto LABEL_31;
  }
  unsigned int v10 = sub_1000BC5A4();
  pthread_once(&stru_1001198A8, (void (*)(void))sub_100042984);
  pthread_mutex_lock(&stru_100119868);
  sub_10003BB98((uint64_t)&qword_10011BCE8, &v10);
  pthread_mutex_unlock(&stru_100119868);
  pthread_once(&stru_100119828, (void (*)(void))sub_100036CB4);
  if (!dword_10011C850) {
    goto LABEL_31;
  }
  pthread_mutex_lock(&stru_1001197E8);
  if (!dword_10011C850)
  {
LABEL_30:
    pthread_mutex_unlock(&stru_1001197E8);
LABEL_31:
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    NSLog(@"MR: %s", "-[MediaPlayerHelper _nowPlayingInfoChanged:]");
    if ((((_BYTE)self + 104) & 7) == 0)
    {
      nowPlayingHandlerQueue = self->nowPlayingHandlerQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10003BC34;
      v9[3] = &unk_100104560;
      v9[4] = self;
      MRMediaRemoteGetNowPlayingInfo(nowPlayingHandlerQueue, v9);

      return;
    }

    goto LABEL_33;
  }

  if (!qword_10011C828 || (qword_10011C828 & 7) != 0)
  {
LABEL_33:
    __break(0x5516u);
    goto LABEL_34;
  }

  if (v10 < dword_10011C850)
  {
LABEL_36:
    __break(0x5515u);
    goto LABEL_37;
  }

  uint64_t v4 = *(unsigned int *)(qword_10011C828 + 76);
  if (v4 >= 8)
  {
LABEL_35:
    __break(0x550Au);
    goto LABEL_36;
  }

  if (v4 < 4)
  {
    if (~(unint64_t)dword_10011B8F8 < 4 * v4)
    {
LABEL_34:
      __break(0x5513u);
      goto LABEL_35;
    }

    if (dword_10011B8F8[v4]) {
      (*(void (**)(void))(*(void *)qword_10011C828 + 104LL))();
    }
    switch(dword_10011C854)
    {
      case 1:
        uint64_t v5 = qword_10011C830;
        if (!qword_10011C830) {
          goto LABEL_33;
        }
        goto LABEL_22;
      case 2:
        uint64_t v5 = qword_10011C838;
        if (!qword_10011C838) {
          goto LABEL_33;
        }
        goto LABEL_22;
      case 3:
        uint64_t v5 = qword_10011C840;
        if (!qword_10011C840) {
          goto LABEL_33;
        }
        goto LABEL_22;
      case 4:
        uint64_t v5 = qword_10011C848;
        if (!qword_10011C848) {
          goto LABEL_33;
        }
LABEL_22:
        if ((v5 & 7) != 0) {
          goto LABEL_33;
        }
        if (v10 < dword_10011C850) {
          goto LABEL_36;
        }
        uint64_t v6 = *(unsigned int *)(v5 + 76);
        if (dword_10011B8F8[v6]) {
          (*(void (**)(uint64_t, void, void, void))(*(void *)v5 + 104LL))( v5,  v10 - dword_10011C850,  0LL,  0LL);
        }
LABEL_29:
        dword_10011C850 = 0;
        break;
      default:
        goto LABEL_29;
    }

    goto LABEL_30;
  }

- (void)_nowPlayingAppIsPlayingChanged:(id)a3
{
  if ((((_BYTE)self + 104) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    nowPlayingHandlerQueue = self->nowPlayingHandlerQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10003BD18;
    v5[3] = &unk_1001045A8;
    v5[4] = self;
    MRMediaRemoteGetNowPlayingApplicationIsPlaying(nowPlayingHandlerQueue, v5);
  }

- (void)_playbackQueueDidChangeNotification:(id)a3
{
  p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue;
  if (((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v5 = (dispatch_queue_s *)*p_nowPlayingHandlerQueue;
    if (*p_nowPlayingHandlerQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003BDF8;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_async(v5, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)_nowPlayingAppChanged:(id)a3
{
  if ((((_BYTE)self + 104) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    nowPlayingHandlerQueue = self->nowPlayingHandlerQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10003BE94;
    v5[3] = &unk_100104660;
    v5[4] = self;
    MRMediaRemoteGetNowPlayingApplicationPID(nowPlayingHandlerQueue, v5);
  }

- (void)_mediaLibraryChanged:(id)a3
{
  if (qword_10011BD40 != -1) {
    dispatch_once(&qword_10011BD40, &stru_1001046A0);
  }
  if (!qword_10011BD38 || (qword_10011BD38 & 7) != 0) {
    __break(0x5516u);
  }
  else {
    (*(void (**)(void))(*(void *)qword_10011BD38 + 56LL))();
  }
}

- (void)_itemPlaybackDidEnd:(id)a3
{
  p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue;
  if (((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else if (*p_nowPlayingHandlerQueue)
  {
    dispatch_async((dispatch_queue_t)*p_nowPlayingHandlerQueue, &stru_100104680);
    return;
  }

  __break(0x5510u);
}

- (void)notifyExplicitControlOccurred
{
  self->_unsigned int explicitControlOccurred = 1;
}

- (void)_checkShuffleRepeatModeChange
{
  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (*p_currentSupportedCommands)
  {
    CFIndex Count = CFArrayGetCount(*p_currentSupportedCommands);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v23 = kMRMediaRemoteCommandInfoShuffleMode;
      uint64_t v22 = kMRMediaRemoteCommandInfoRepeatMode;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*p_currentSupportedCommands, v6);
        if (ValueAtIndex)
        {
          unsigned int v10 = ValueAtIndex;
          if (MRMediaRemoteCommandInfoGetEnabled())
          {
            uint64_t Command = MRMediaRemoteCommandInfoGetCommand(v10);
            int v12 = Command;
            sub_1000CEA98( 6u,  @"MP: %s: index=%d command=%d",  "-[MediaPlayerHelper _checkShuffleRepeatModeChange]",  v6,  Command);
            if (v12 == 26)
            {
              unsigned int v24 = -1431655766;
              double v13 = (const __CFNumber *)MRMediaRemoteCommandInfoCopyValueForKey(v10, v23);
              sub_1000CEA98( 6u,  @"MP: %s: tmpShuffleModeObj=%@",  "-[MediaPlayerHelper _checkShuffleRepeatModeChange]",  v13);
              if (!v13) {
                goto LABEL_14;
              }
              CFNumberGetValue(v13, kCFNumberIntType, &v24);
              uint64_t v8 = v24;
              goto LABEL_13;
            }

            if (v12 == 25)
            {
              unsigned int valuePtr = -1431655766;
              double v13 = (const __CFNumber *)MRMediaRemoteCommandInfoCopyValueForKey(v10, v22);
              sub_1000CEA98( 6u,  @"MP: %s: tmpRepeatModeObj=%@",  "-[MediaPlayerHelper _checkShuffleRepeatModeChange]",  v13);
              if (v13)
              {
                CFNumberGetValue(v13, kCFNumberIntType, &valuePtr);
                uint64_t v7 = valuePtr;
LABEL_13:
                CFRelease(v13);
              }
            }
          }
        }

- (void)_supportedCommandsDidChange:(__CFArray *)a3
{
  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (((unint64_t)&self->_currentSupportedCommands & 7) != 0)
  {
    __break(0x5516u);
    -[MediaPlayerHelper _checkShuffleRepeatModeChange](self, "_checkShuffleRepeatModeChange");
  }

  else
  {
    NSLog( @"MR: %s:%d _currentSupportedCommands %@ ---> %@",  a2,  "-[MediaPlayerHelper _supportedCommandsDidChange:]",  2399LL,  *p_currentSupportedCommands,  a3);
    if (*p_currentSupportedCommands) {
      CFRelease(*p_currentSupportedCommands);
    }
    *p_currentSupportedCommands = a3;
    if (a3) {
      CFRetain(a3);
    }
    -[MediaPlayerHelper _checkShuffleRepeatModeChange](self, "_checkShuffleRepeatModeChange");
  }

- (void)_supportedCommandsDidChangeNotification
{
  if ((((_BYTE)self + 104) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    void v5[5] = v2;
    v5[6] = v3;
    nowPlayingHandlerQueue = self->nowPlayingHandlerQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10003C5D0;
    v5[3] = &unk_1001045D0;
    v5[4] = self;
    MRMediaRemoteCopySupportedCommands(nowPlayingHandlerQueue, v5);
  }

- (BOOL)_isSetElapsedTimeAvailable
{
  if (self->_nowPlayingAppIsIPodRadio) {
    return 0;
  }
  else {
    return -[MediaPlayerHelper _isCommandSupported:](self, "_isCommandSupported:", 24LL);
  }
}

- (void)_findCommandRefForCommand:(unsigned int)a3
{
  currentSupportedCommands = self->_currentSupportedCommands;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = -[__CFArray countByEnumeratingWithState:objects:count:]( currentSupportedCommands,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_4:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(currentSupportedCommands);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( currentSupportedCommands,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_4;
      }
      return 0LL;
    }
  }

- (BOOL)_isCommandSupported:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = -[MediaPlayerHelper _findCommandRefForCommand:](self, "_findCommandRefForCommand:");
  BOOL v5 = (BOOL)v4;
  if (v4) {
    LODWORD(v5) = MRMediaRemoteCommandInfoGetCommand(v4) == (_DWORD)v3
  }
               && MRMediaRemoteCommandInfoGetEnabled(v5) != 0;
  sub_1000CEA98(7u, @"command supported %d for command %d", v5, v3);
  return v5;
}

- (int)repeatModeCache
{
  return self->repeatModeCache;
}

- (void)setRepeatModeCache:(int)a3
{
  else {
    self->int repeatModeCache = a3;
  }
}

- (int)shuffleModeCache
{
  return self->shuffleModeCache;
}

- (void)setShuffleModeCache:(int)a3
{
  else {
    self->uint64_t shuffleModeCache = a3;
  }
}

- (BOOL)podcastAppSelected
{
  unsigned int podcastAppSelected = self->podcastAppSelected;
  if (podcastAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = podcastAppSelected != 0;
  }
  return (char)self;
}

- (void)setPodcastAppSelected:(BOOL)a3
{
  self->unsigned int podcastAppSelected = a3;
}

- (BOOL)iBooksAppSelected
{
  unsigned int iBooksAppSelected = self->iBooksAppSelected;
  if (iBooksAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = iBooksAppSelected != 0;
  }
  return (char)self;
}

- (void)setIBooksAppSelected:(BOOL)a3
{
  self->unsigned int iBooksAppSelected = a3;
}

- (BOOL)iTunesUAppSelected
{
  unsigned int iTunesUAppSelected = self->iTunesUAppSelected;
  if (iTunesUAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = iTunesUAppSelected != 0;
  }
  return (char)self;
}

- (void)setITunesUAppSelected:(BOOL)a3
{
  self->unsigned int iTunesUAppSelected = a3;
}

- (OS_dispatch_queue)nowPlayingHandlerQueue
{
  return self->nowPlayingHandlerQueue;
}

- (BOOL)fakeStreamTrackIndexSet
{
  unsigned int fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakeStreamTrackIndexSet != 0;
  }
  return (char)self;
}

@end