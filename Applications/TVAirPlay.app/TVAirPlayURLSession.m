@interface TVAirPlayURLSession
+ (id)_mediaItemForParameters:(id)a3;
+ (id)_playerForParameters:(id)a3 playlist:(id)a4;
+ (id)_secureStopURL;
- (AVContentKeySession)contentKeySession;
- (BOOL)_handleFailedURLResponseWithOptions:(id)a3 error:(id *)a4;
- (BOOL)_removeItemWithInfo:(id)a3 error:(id *)a4;
- (BOOL)audioOnly;
- (BOOL)connectedInterstitialToPrimary;
- (BOOL)deactivated;
- (BOOL)hasInterstitialSession;
- (BOOL)isInterstitialSession;
- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6;
- (BOOL)player:(id)a3 shouldChangeMediaInDirection:(int64_t)a4;
- (BOOL)player:(id)a3 shouldChangeToMediaAtIndex:(unint64_t)a4;
- (BOOL)player:(id)a3 shouldScanAtRate:(double)a4;
- (BOOL)player:(id)a3 shouldSeekToTime:(double *)a4 playbackDate:(id *)a5;
- (BOOL)playerKVOObserversAdded;
- (BOOL)playerShouldPause:(id)a3;
- (BOOL)playerShouldPlay:(id)a3 timeFromWhichToPlay:(double *)a4;
- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6;
- (BOOL)shouldDelegateToInterstitialForParams:(id)a3;
- (BOOL)stopWithOptions:(id)a3 error:(id *)a4;
- (BOOL)stoppedDueToUser;
- (BOOL)wantsDateRangeCollection;
- (NSArray)interstitialEvents;
- (NSArray)lastReportedDateRanges;
- (NSData)appIdentifier;
- (NSDictionary)initialRequest;
- (NSMutableDictionary)resourceLoadingRequests;
- (NSNumber)audioSessionID;
- (NSString)currentInterstitialEventID;
- (NSString)description;
- (OS_dispatch_source)emptyPlaylistTimer;
- (TVAirPlayLegacySessionDelegate)delegate;
- (TVAirPlayURLSession)initWithPrimarySession:(id)a3;
- (TVAirPlayURLSession)interstitialSession;
- (TVAirPlayURLSession)primarySession;
- (TVPPlayer)player;
- (TVPPlaylist)playlist;
- (id)_handleKeyResponseWithOptions:(id)a3 error:(id *)a4;
- (id)_parametersWithAddedSessionOptions:(id)a3;
- (id)elapsedTimeObserverToken;
- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5;
- (id)playbackInfo;
- (int64_t)sessionType;
- (unsigned)sessionID;
- (void)_cancelEmptyPlaylistTimer;
- (void)_insertItemWithInfo:(id)a3 afterItem:(id)a4;
- (void)_noteAppIdentifierForStreamingKeyRequest:(id)a3;
- (void)_parseSessionOptions:(id)a3;
- (void)_playerErrorDidOccur:(id)a3;
- (void)_playerStateDidChange:(id)a3;
- (void)_removePlayerKVOObservers;
- (void)_sendPendingSecureStopRecordsForSession:(id)a3 removeAfterSending:(BOOL)a4;
- (void)addDateRangeCollectorToItem:(id)a3;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySessionDidGenerateExpiredSessionReport:(id)a3;
- (void)dealloc;
- (void)itemDidChange:(id)a3;
- (void)itemDidPlayToEnd:(id)a3;
- (void)itemReachedTimeToPauseBuffering:(id)a3;
- (void)itemReachedTimeToPausePlayback:(id)a3;
- (void)itemWillChange:(id)a3;
- (void)mediaItem:(id)a3 didRequestResource:(id)a4;
- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playlistDidPlayToEnd:(id)a3;
- (void)sendEventToDelegate:(id)a3 withInfo:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setAudioOnly:(BOOL)a3;
- (void)setAudioSessionID:(id)a3;
- (void)setConnectedInterstitialToPrimary:(BOOL)a3;
- (void)setContentKeySession:(id)a3;
- (void)setCurrentInterstitialEventID:(id)a3;
- (void)setDeactivated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setElapsedTimeObserverToken:(id)a3;
- (void)setInitialRequest:(id)a3;
- (void)setInterstitialEvents:(id)a3;
- (void)setInterstitialSession:(id)a3;
- (void)setLastReportedDateRanges:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerKVOObserversAdded:(BOOL)a3;
- (void)setPlaylist:(id)a3;
- (void)setPrimarySession:(id)a3;
- (void)setResourceLoadingRequests:(id)a3;
- (void)setStoppedDueToUser:(BOOL)a3;
- (void)setWantsDateRangeCollection:(BOOL)a3;
- (void)startWithOptions:(id)a3 completion:(id)a4;
- (void)userStop;
@end

@implementation TVAirPlayURLSession

- (TVAirPlayURLSession)initWithPrimarySession:(id)a3
{
  id v4 = a3;
  v5 = -[TVAirPlayURLSession init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
    -[TVAirPlayURLSession setDelegate:](v5, "setDelegate:", v6);

    objc_storeWeak((id *)&v5->_primarySession, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[TVAirPlayURLSession _cancelEmptyPlaylistTimer](self, "_cancelEmptyPlaylistTimer");
  -[TVAirPlayURLSession _removePlayerKVOObservers](self, "_removePlayerKVOObservers");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVAirPlayURLSession;
  -[TVAirPlayURLSession dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10003ECF0 == a6 || off_10003ECF8 == a6)
  {
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"selectedMediaArrayChanged",  0LL);
  }

  else if (off_10003ED00 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession audioSessionID](self, "audioSessionID"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession audioSessionID](self, "audioSessionID"));
      objc_msgSend(v15, "setAudioSessionID:", objc_msgSend(v16, "unsignedIntValue"));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 AVQueuePlayer]);

    if (v18)
    {
      if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession")
        || -[TVAirPlayURLSession hasInterstitialSession](self, "hasInterstitialSession"))
      {
        if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession")) {
          v19 = (TVAirPlayURLSession *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession primarySession](self, "primarySession"));
        }
        else {
          v19 = self;
        }
        v20 = v19;
        if (-[TVAirPlayURLSession hasInterstitialSession](self, "hasInterstitialSession")) {
          v21 = (TVAirPlayURLSession *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
        }
        else {
          v21 = self;
        }
        v22 = v21;
        if (!-[TVAirPlayURLSession connectedInterstitialToPrimary](v21, "connectedInterstitialToPrimary"))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](v20, "player"));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 AVQueuePlayer]);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](v22, "player"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 AVQueuePlayer]);

          if (v24 && v26)
          {
            [v24 _setInterstitialPlayer:v26];
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialEvents](v20, "interstitialEvents"));

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialEvents](v20, "interstitialEvents"));
              v29 = (void *)objc_claimAutoreleasedReturnValue([v24 currentItem]);
              [v24 _noteRemoteInterstitialEvents:v28 forItem:v29];
            }

            v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession currentInterstitialEventID](v20, "currentInterstitialEventID"));

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession currentInterstitialEventID](v20, "currentInterstitialEventID"));
              [v24 _noteCurrentRemoteInterstitialEvent:v31];
            }

            -[TVAirPlayURLSession setConnectedInterstitialToPrimary:](v22, "setConnectedInterstitialToPrimary:", 1LL);
          }
        }
      }
    }

    else
    {
      -[TVAirPlayURLSession setConnectedInterstitialToPrimary:](self, "setConnectedInterstitialToPrimary:", 0LL);
    }
  }

  else
  {
    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___TVAirPlayURLSession;
    -[TVAirPlayURLSession observeValueForKeyPath:ofObject:change:context:]( &v32,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVAirPlayURLSession;
  v3 = -[TVAirPlayURLSession description](&v7, "description");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ID: %u",  v4,  -[TVAirPlayURLSession sessionID](self, "sessionID")));

  return (NSString *)v5;
}

- (TVAirPlayURLSession)interstitialSession
{
  interstitialSession = self->_interstitialSession;
  if (!interstitialSession)
  {
    objc_super v4 = -[TVAirPlayURLSession initWithPrimarySession:]( objc_alloc(&OBJC_CLASS___TVAirPlayURLSession),  "initWithPrimarySession:",  self);
    v5 = self->_interstitialSession;
    self->_interstitialSession = v4;

    interstitialSession = self->_interstitialSession;
  }

  return interstitialSession;
}

- (BOOL)isInterstitialSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primarySession);
  BOOL v3 = WeakRetained != 0LL;

  return v3;
}

- (BOOL)hasInterstitialSession
{
  return self->_interstitialSession != 0LL;
}

- (BOOL)shouldDelegateToInterstitialForParams:(id)a3
{
  id v4 = a3;
  if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession"))
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kFigEndpointPlaybackSessionKey_ForInterstitial]);
    unsigned __int8 v5 = [v6 BOOLValue];
  }

  return v5;
}

- (int64_t)sessionType
{
  if (-[TVAirPlayURLSession audioOnly](self, "audioOnly")) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

- (void)userStop
{
  v8[0] = @"sessionID";
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TVAirPlayURLSession sessionID](self, "sessionID")));
  v8[1] = @"userExit";
  v9[0] = v3;
  v9[1] = &__kCFBooleanTrue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", @"userStop", v4);
  -[TVAirPlayURLSession setStoppedDueToUser:](self, "setStoppedDueToUser:", 1LL);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
  [v5 stop];

  if (self->_contentKeySession) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 1LL;
  }
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  [v7 deregisterSession:self options:v6];
}

- (void)sendEventToDelegate:(id)a3 withInfo:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession"))
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kFigEndpointPlaybackSessionEventKey_ForInterstitial];

    id v9 = v7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession delegate](self, "delegate"));
  [v8 session:self didPerformEvent:v6 withInfo:v9];
}

- (void)addDateRangeCollectorToItem:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[AVPlayerItemMetadataCollector initWithIdentifiers:classifyingLabels:]( objc_alloc(&OBJC_CLASS___AVPlayerItemMetadataCollector),  "initWithIdentifiers:classifyingLabels:",  0LL,  0LL);
  -[AVPlayerItemMetadataCollector setDelegate:queue:](v5, "setDelegate:queue:", self, &_dispatch_main_q);
  [v4 setMediaItemMetadata:v5 forProperty:TVPMediaItemMetadataDateRangeCollector];
}

- (void)startWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v46 = 0LL;
  unsigned int v8 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v6,  &v46);
  id v9 = (NSError *)v46;
  if (v8)
  {
    id v10 = (NSDictionary *)[v6 copy];
    initialRequest = self->_initialRequest;
    self->_initialRequest = v10;

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Content-Location"]);
    if (v12)
    {
      if (-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:]( self,  "shouldDelegateToInterstitialForParams:",  v6))
      {
        id v13 = sub_1000043A0();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "dispatching to interstitial session",  buf,  2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
        [v15 startWithOptions:v6 completion:v7];
      }

      else
      {
        -[TVAirPlayURLSession _parseSessionOptions:](self, "_parseSessionOptions:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sessionID"]);
        self->_sessionID = [v19 unsignedIntValue];

        MRMediaRemoteSetCanBeNowPlayingApplication(1LL);
        id v20 = [(id)objc_opt_class(self) _mediaItemForParameters:v6];
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        [v21 setResourceLoadingDelegate:self];
        if (self->_wantsDateRangeCollection) {
          -[TVAirPlayURLSession addDateRangeCollectorToItem:](self, "addDateRangeCollectorToItem:", v21);
        }
        v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        resourceLoadingRequests = self->_resourceLoadingRequests;
        self->_resourceLoadingRequests = v22;

        v24 = objc_alloc(&OBJC_CLASS___TVPPlaylist);
        v47 = v21;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
        v26 = -[TVPPlaylist initWithMediaItems:index:isCollection:]( v24,  "initWithMediaItems:index:isCollection:",  v25,  0LL,  0LL);

        -[TVPPlaylist setWindowed:](v26, "setWindowed:", 1LL);
        -[TVAirPlayURLSession setPlaylist:](self, "setPlaylist:", v26);
        id v27 = [(id)objc_opt_class(self) _playerForParameters:v6 playlist:v26];
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        [v28 setPausesOnRouteChange:1];
        -[TVAirPlayURLSession setPlayer:](self, "setPlayer:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"shouldProvideFPSSecureStop"]);
        unsigned int v30 = [v29 BOOLValue];

        if (v30)
        {
          id v31 = [(id)objc_opt_class(self) _secureStopURL];
          objc_super v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = (AVContentKeySession *)objc_claimAutoreleasedReturnValue( +[AVContentKeySession contentKeySessionWithKeySystem:storageDirectoryAtURL:]( &OBJC_CLASS___AVContentKeySession,  "contentKeySessionWithKeySystem:storageDirectoryAtURL:",  AVContentKeySystemFairPlayStreaming,  v32));
          contentKeySession = self->_contentKeySession;
          self->_contentKeySession = v33;

          -[AVContentKeySession setDelegate:queue:]( self->_contentKeySession,  "setDelegate:queue:",  self,  &_dispatch_main_q);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v35 addObserver:self selector:"itemDidPlayToEnd:" name:TVPPlaybackDidPlayToEndOfMediaItemNotification object:v28];

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v36 addObserver:self selector:"itemWillChange:" name:TVPPlaybackCurrentMediaItemWillChangeNotification object:v28];

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v37 addObserver:self selector:"itemDidChange:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:v28];

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v38 addObserver:self selector:"playlistDidPlayToEnd:" name:TVPPlaybackPlaylistDidFinishNotification object:v28];

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v39 addObserver:self selector:"itemReachedTimeToPauseBuffering:" name:TVPPlayerItemReachedTimeToPauseBufferingNotification object:0];

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v40 addObserver:self selector:"itemReachedTimeToPausePlayback:" name:TVPPlayerItemReachedTimeToPausePlaybackNotification object:0];

        [v28 addObserver:self forKeyPath:@"selectedAudioOption" options:0 context:off_10003ECF0];
        [v28 addObserver:self forKeyPath:@"selectedSubtitleOption" options:0 context:off_10003ECF8];
        [v28 addObserver:self forKeyPath:@"AVQueuePlayer" options:0 context:off_10003ED00];
        self->_playerKVOObserversAdded = 1;
        -[TVPPlayer setDelegate:](self->_player, "setDelegate:", self);
        if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession"))
        {
          -[TVPPlayer pause](self->_player, "pause");
        }

        else
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlaySessionManager sharedInstance]( &OBJC_CLASS___TVAirPlaySessionManager,  "sharedInstance"));
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_100005B6C;
          v42[3] = &unk_100030AC8;
          id v43 = v6;
          v44 = self;
          id v45 = v7;
          [v41 registerSession:self withCompletionHandler:v42];
        }
      }
    }

    else
    {
      id v16 = sub_1000043A0();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "### AirPlay no URL in params:\n%{public}@",  buf,  0xCu);
      }

      v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL);
      id v9 = v18;
    }
  }

  else
  {
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0LL, v9);
  }
}

- (BOOL)stopWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v6,  a4);
  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 removeObserver:self name:TVPPlaybackDidPlayToEndOfMediaItemNotification object:self->_player];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 removeObserver:self name:TVPPlaybackCurrentMediaItemWillChangeNotification object:self->_player];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 removeObserver:self name:TVPPlaybackCurrentMediaItemDidChangeNotification object:self->_player];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 removeObserver:self name:TVPPlaybackPlaylistDidFinishNotification object:self->_player];

    -[TVAirPlayURLSession _removePlayerKVOObservers](self, "_removePlayerKVOObservers");
    -[TVAirPlayURLSession _cancelEmptyPlaylistTimer](self, "_cancelEmptyPlaylistTimer");
    -[TVAirPlayURLSession setPlayer:](self, "setPlayer:", 0LL);
    playlist = self->_playlist;
    self->_playlist = 0LL;

    initialRequest = self->_initialRequest;
    self->_initialRequest = 0LL;

    resourceLoadingRequests = self->_resourceLoadingRequests;
    self->_resourceLoadingRequests = 0LL;

    if (!-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession"))
    {
      uint64_t v15 = 2LL * (self->_contentKeySession != 0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
      [v16 deregisterSession:self options:v15];

      MRMediaRemoteSetCanBeNowPlayingApplication(0LL);
      if (-[TVAirPlayURLSession hasInterstitialSession](self, "hasInterstitialSession"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
        [v17 stopWithOptions:v6 error:a4];
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v18 removeObserver:self name:TVPPlayerItemReachedTimeToPauseBufferingNotification object:0];

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v19 removeObserver:self name:TVPPlayerItemReachedTimeToPausePlaybackNotification object:0];
    }
  }

  return v7;
}

- (id)playbackInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playbackInfo](self->_player, "playbackInfo"));
  if (-[TVAirPlayURLSession hasInterstitialSession](self, "hasInterstitialSession"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackInfo]);

    if (v6) {
      [v3 setObject:v6 forKeyedSubscript:kFigEndpointPlaybackSessionPlaybackInfoKey_InterstitialInfo];
    }
  }

  return v3;
}

- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
    && -[TVAirPlayURLSession shouldDelegateToInterstitialForParams:](self, "shouldDelegateToInterstitialForParams:", v9))
  {
    id v11 = (NSError *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
    id v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSError getProperty:qualifier:error:](v11, "getProperty:qualifier:error:", v8, v9, a5));
    goto LABEL_21;
  }

  if (self->_player)
  {
    if ([v8 isEqualToString:@"playbackInfo"])
    {
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession playbackInfo](self, "playbackInfo"));
LABEL_20:
      id v12 = v13;
      id v11 = 0LL;
      goto LABEL_21;
    }

    if ([v8 isEqualToString:@"playbackAccessLog"])
    {
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TVPPlayer accessLogArray](self->_player, "accessLogArray"));
      goto LABEL_20;
    }

    if ([v8 isEqualToString:@"playbackErrorLog"])
    {
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TVPPlayer errorLogArray](self->_player, "errorLogArray"));
      goto LABEL_20;
    }

    if ([v8 isEqualToString:@"timedMetadataArray"])
    {
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TVPPlayer timedMetadata](self->_player, "timedMetadata"));
      goto LABEL_20;
    }

    if ([v8 isEqualToString:@"enableTrack"])
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
      {
        v21 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvs_numberForKey:", @"qualifier"));
        goto LABEL_29;
      }

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v9, v22) & 1) != 0)
      {
        v21 = (NSError *)v9;
LABEL_29:
        id v11 = v21;
        if (v21)
        {
          id v12 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TVPPlayer trackEnabled:]( self->_player,  "trackEnabled:",  -[NSError integerValue](v21, "integerValue"))));

          id v11 = 0LL;
          goto LABEL_21;
        }

        goto LABEL_9;
      }

      v14 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorDomain v15 = NSOSStatusErrorDomain;
      uint64_t v16 = -6756LL;
    }

    else
    {
      if ([v8 isEqualToString:@"selectedMediaArray"])
      {
        id v13 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TVPPlayer selectedMediaArray](self->_player, "selectedMediaArray"));
        goto LABEL_20;
      }

      if ([v8 isEqualToString:@"dateRangeArray"])
      {
        lastReportedDateRanges = self->_lastReportedDateRanges;
        if (!lastReportedDateRanges) {
          lastReportedDateRanges = (NSArray *)&__NSArray0__struct;
        }
        id v13 = lastReportedDateRanges;
        goto LABEL_20;
      }

      id v24 = sub_1000043A0();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        id v27 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Get value for unsupported property: %{public}@",  (uint8_t *)&v26,  0xCu);
      }

      v14 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorDomain v15 = NSOSStatusErrorDomain;
      uint64_t v16 = -6735LL;
    }
  }

  else
  {
    v14 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorDomain v15 = NSOSStatusErrorDomain;
    uint64_t v16 = -6745LL;
  }

  id v11 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", v15, v16, 0LL);
LABEL_9:
  id v12 = 0LL;
  if (v11)
  {
    id v17 = sub_1000043A0();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543618;
      id v27 = v8;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Error getting property: %{public}@, error: %{public}@",  (uint8_t *)&v26,  0x16u);
    }

    if (a5)
    {
      id v11 = v11;
      *a5 = v11;
    }
  }

- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (+[TVAirPlayUtilities validateParametersWithPropertyKey:value:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParametersWithPropertyKey:value:error:",  v10,  v12,  a6))
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0
      && -[TVAirPlayURLSession shouldDelegateToInterstitialForParams:]( self,  "shouldDelegateToInterstitialForParams:",  v11))
    {
      v14 = (NSError *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
      unsigned __int8 v15 = -[NSError setProperty:qualifier:value:error:]( v14,  "setProperty:qualifier:value:error:",  v10,  v11,  v12,  a6);
LABEL_26:

      goto LABEL_27;
    }

    if (!self->_player)
    {
      uint64_t v22 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorDomain v23 = NSOSStatusErrorDomain;
      uint64_t v24 = -6745LL;
      goto LABEL_13;
    }

    if ([v10 isEqualToString:@"position"])
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
      {
        player = self->_player;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_stringForKey:", @"uuid"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer mediaItemForIdentifier:](player, "mediaItemForIdentifier:", v18));

        if (v19)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
          unsigned int v21 = [v20 isEqualToMediaItem:v19];

          if (!v21)
          {
            [v19 setMediaItemMetadata:v12 forProperty:TVPMediaItemMetadataStartTime];
LABEL_23:

            goto LABEL_24;
          }
        }
      }

      else
      {
        v19 = 0LL;
      }

      __int16 v28 = self->_player;
      [v12 doubleValue];
      -[TVPPlayer setPlayerPosition:](v28, "setPlayerPosition:");
      goto LABEL_23;
    }

    if ([v10 isEqualToString:@"rate"])
    {
      id v27 = self->_player;
      [v12 floatValue];
      -[TVPPlayer setPlayerRate:](v27, "setPlayerRate:");
      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"date"])
    {
      -[TVPPlayer setPlaybackDate:](self->_player, "setPlaybackDate:", v12);
      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"forwardEndTime"])
    {
      CMTimeMakeFromDictionary(&buf, (CFDictionaryRef)v12);
      if ((buf.flags & 1) != 0)
      {
        unsigned int v30 = self->_player;
        CMTime v78 = buf;
        -[TVPPlayer setForwardPlaybackEndTime:](v30, "setForwardPlaybackEndTime:", &v78);
      }

      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"reverseEndTime"])
    {
      CMTimeMakeFromDictionary(&buf, (CFDictionaryRef)v12);
      if ((buf.flags & 1) != 0)
      {
        id v31 = self->_player;
        CMTime v78 = buf;
        -[TVPPlayer setReversePlaybackEndTime:](v31, "setReversePlaybackEndTime:", &v78);
      }

      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"enableTrack"])
    {
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v32) & 1) != 0)
      {
        v33 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_numberForKey:", @"qualifier"));
        goto LABEL_44;
      }

      uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v11, v34) & 1) != 0)
      {
        v33 = (NSError *)v11;
LABEL_44:
        v14 = v33;
        if (v33)
        {
          -[TVPPlayer setTrackEnabled:trackID:]( self->_player,  "setTrackEnabled:trackID:",  [v12 BOOLValue],  objc_msgSend(v11, "integerValue"));

          v14 = 0LL;
        }

- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:]( self,  "shouldDelegateToInterstitialForParams:",  v11))
  {
    if (!+[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v11,  a6))
    {
      unsigned __int8 v13 = 0;
      goto LABEL_21;
    }

    if (self->_player)
    {
      if ([v10 isEqualToString:@"requestForStreamingKey"])
      {
        id v37 = 0LL;
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayURLSession _handleKeyResponseWithOptions:error:]( self,  "_handleKeyResponseWithOptions:error:",  v11,  &v37));
        unsigned __int8 v15 = (NSError *)v37;
        if (a5 && v14)
        {
          id v44 = @"value";
          id v45 = v14;
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
        }

        -[TVAirPlayURLSession _noteAppIdentifierForStreamingKeyRequest:]( self,  "_noteAppIdentifierForStreamingKeyRequest:",  v11);

        if (!a6) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }

      if (![v10 isEqualToString:@"failedURLResponse"])
      {
        if ([v10 isEqualToString:@"playlistInsert"])
        {
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"item"]);
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"afterItem"]);
          id v35 = 0LL;
          unsigned int v22 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v21,  &v35);
          id v23 = v35;
          id v34 = v23;
          unsigned int v24 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v21,  &v34);
          unsigned __int8 v15 = (NSError *)v34;

          if (v22 && v24) {
            -[TVAirPlayURLSession _insertItemWithInfo:afterItem:](self, "_insertItemWithInfo:afterItem:", v21, v31);
          }
        }

        else
        {
          if (![v10 isEqualToString:@"playlistRemove"])
          {
            unsigned __int8 v15 = 0LL;
            goto LABEL_20;
          }

          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"item"]);
          id v33 = 0LL;
          unsigned int v25 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v21,  &v33);
          int v26 = (NSError *)v33;
          unsigned __int8 v15 = v26;
          if (v25)
          {
            uint64_t v32 = v26;
            -[TVAirPlayURLSession _removeItemWithInfo:error:](self, "_removeItemWithInfo:error:", v21, &v32);
            id v27 = v32;

            unsigned __int8 v15 = v27;
            if (!v27)
            {
              uint64_t v28 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"uuid"]);
              v29 = (void *)v28;
              if (v28)
              {
                v42 = @"uuid";
                uint64_t v43 = v28;
                unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
              }

              else
              {
                unsigned int v30 = 0LL;
              }

              -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"itemRemoved",  v30);

              unsigned __int8 v15 = 0LL;
            }
          }
        }

        if (a6)
        {
LABEL_16:
          if (v15)
          {
            id v17 = sub_1000043A0();
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v11));
              *(_DWORD *)CMTime buf = 138543618;
              id v39 = v10;
              __int16 v40 = 2114;
              v41 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Error performing action '%{public}@':\n%{public}@",  buf,  0x16u);
            }

            unsigned __int8 v15 = v15;
            *a6 = v15;
          }
        }

- (void)setPlayer:(id)a3
{
  unsigned __int8 v5 = (TVPPlayer *)a3;
  p_player = (id *)&self->_player;
  if (self->_player != v5)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    if (*p_player)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession elapsedTimeObserverToken](self, "elapsedTimeObserverToken"));

      if (v8)
      {
        player = self->_player;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession elapsedTimeObserverToken](self, "elapsedTimeObserverToken"));
        -[TVPPlayer removeElapsedTimeObserverWithToken:](player, "removeElapsedTimeObserverWithToken:", v10);

        -[TVAirPlayURLSession setElapsedTimeObserverToken:](self, "setElapsedTimeObserverToken:", 0LL);
      }

      [v7 removeObserver:self name:TVPPlaybackErrorNotification object:self->_player];
      [v7 removeObserver:self name:TVPPlaybackStateDidChangeNotification object:self->_player];
      -[TVPPlayer stop](self->_player, "stop");
      -[TVPPlayer invalidate](self->_player, "invalidate");
    }

    objc_storeStrong((id *)&self->_player, a3);
    if (*p_player)
    {
      objc_initWeak(&location, *p_player);
      id v11 = *p_player;
      unsigned __int8 v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      unsigned __int8 v15 = sub_100007444;
      uint64_t v16 = &unk_100030AF0;
      objc_copyWeak(&v17, &location);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 addElapsedTimeObserver:&v13]);
      -[TVAirPlayURLSession setElapsedTimeObserverToken:](self, "setElapsedTimeObserverToken:", v12, v13, v14, v15, v16);
      [v7 addObserver:self selector:"_playerErrorDidOccur:" name:TVPPlaybackErrorNotification object:v5];
      [v7 addObserver:self selector:"_playerStateDidChange:" name:TVPPlaybackStateDidChangeNotification object:v5];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_playerErrorDidOccur:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVPPlaybackErrorKey]);

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 domain]);
  BOOL v7 = (void *)v6;
  if (v6)
  {
    v14[0] = @"domain";
    v14[1] = @"code";
    v15[0] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 code]));
    v15[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = sub_1000043A0();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    unsigned __int8 v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "AirPlay-PlaybackError : %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", @"error", v9);
}

- (void)_playerStateDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer state](self->_player, "state", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState loading](&OBJC_CLASS___TVPPlaybackState, "loading"));

  if (v4 == v5)
  {
    id v11 = @"loading";
LABEL_9:
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", v11, 0LL);
    goto LABEL_10;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v6)
  {
LABEL_6:
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession playbackInfo](self, "playbackInfo"));
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", @"playing", v10);

    goto LABEL_10;
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));

  if (v4 == v7)
  {
    id v11 = @"paused";
    goto LABEL_9;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

  if (v4 == v8)
  {
    if (-[TVAirPlayURLSession stoppedDueToUser](self, "stoppedDueToUser"))
    {
      v18[0] = @"sessionID";
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TVAirPlayURLSession sessionID](self, "sessionID")));
      v18[1] = @"userExit";
      v19[0] = v12;
      v19[1] = &__kCFBooleanTrue;
      unsigned __int8 v13 = v19;
      uint64_t v14 = v18;
    }

    else
    {
      v16[0] = @"sessionID";
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TVAirPlayURLSession sessionID](self, "sessionID")));
      v16[1] = @"reason";
      v17[0] = v12;
      v17[1] = @"ended";
      unsigned __int8 v13 = v17;
      uint64_t v14 = v16;
    }

    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v14,  2LL));

    -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", @"stopped", v15);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning"));

    if (v4 == v9) {
      goto LABEL_6;
    }
  }

- (void)itemReachedTimeToPauseBuffering:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);
  if (v5)
  {
    id v6 = sub_1000043A0();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138543362;
      int v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist ITEM REACHED TIME TO PAUSE BUFFERING : %{public}@",  buf,  0xCu);
    }

    id v9 = @"uuid";
    id v10 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"timeToPauseBuffering",  v8);
  }
}

- (void)itemReachedTimeToPausePlayback:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);
  if (v5)
  {
    id v6 = sub_1000043A0();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138543362;
      int v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist ITEM REACHED TIME TO PAUSE PLAYBACK : %{public}@",  buf,  0xCu);
    }

    id v9 = @"uuid";
    id v10 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"timeToPausePlayback",  v8);
  }
}

- (void)itemDidPlayToEnd:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);

  id v6 = sub_1000043A0();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)CMTime buf = 138543362;
      int v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist HIT END : %{public}@",  buf,  0xCu);
    }

    id v9 = @"uuid";
    id v10 = v5;
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"itemPlayedToEnd",  v7);
  }

  else if (v8)
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "!!!AirPlay-Playlist HIT END (no UUID)!!!",  buf,  2u);
  }
}

- (void)itemWillChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);

  id v6 = sub_1000043A0();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)CMTime buf = 138543362;
      int v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist ITEM REMOVED : %{public}@",  buf,  0xCu);
    }

    id v9 = @"uuid";
    id v10 = v5;
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"itemRemoved",  v7);
  }

  else if (v8)
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "!!!AirPlay-Playlist ITEM REMOVED (no UUID)!!!",  buf,  2u);
  }
}

- (void)itemDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);

  id v6 = sub_1000043A0();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 138543362;
    uint64_t v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist ITEM CHANGED : %{public}@",  buf,  0xCu);
  }

  if (v5)
  {
    id v11 = @"uuid";
    int v12 = v5;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  }

  else
  {
    BOOL v8 = 0LL;
  }

  -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"currentItemChanged",  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
  [v9 setMediaItemMetadata:&off_100033348 forProperty:TVPMediaItemMetadataTrackNumber];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
  [v10 setMediaItemMetadata:&off_100033348 forProperty:TVPMediaItemMetadataTotalTrackCount];
}

- (void)playlistDidPlayToEnd:(id)a3
{
  if (!-[TVAirPlayURLSession audioOnly](self, "audioOnly", a3))
  {
    id v4 = sub_1000043A0();
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AirPlay-Playlist ended, starting timeout",  (uint8_t *)buf,  2u);
    }

    -[TVAirPlayURLSession _cancelEmptyPlaylistTimer](self, "_cancelEmptyPlaylistTimer");
    objc_initWeak(buf, self);
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    emptyPlaylistTimer = self->_emptyPlaylistTimer;
    self->_emptyPlaylistTimer = v6;

    BOOL v8 = self->_emptyPlaylistTimer;
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v10 = self->_emptyPlaylistTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000807C;
    handler[3] = &unk_100030B18;
    objc_copyWeak(&v12, buf);
    dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
    dispatch_resume((dispatch_object_t)self->_emptyPlaylistTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }

- (void)_insertItemWithInfo:(id)a3 afterItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:]( self,  "shouldDelegateToInterstitialForParams:",  v12))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
    [v7 _insertItemWithInfo:v12 afterItem:v6];
  }

  else if (-[TVAirPlayURLSession isInterstitialSession](self, "isInterstitialSession") && !self->_initialRequest)
  {
    -[TVAirPlayURLSession startWithOptions:completion:](self, "startWithOptions:completion:", v12, &stru_100030B58);
  }

  else
  {
    -[TVAirPlayURLSession _cancelEmptyPlaylistTimer](self, "_cancelEmptyPlaylistTimer");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayURLSession _parametersWithAddedSessionOptions:]( self,  "_parametersWithAddedSessionOptions:",  v12));
    id v9 = [(id)objc_opt_class(self) _mediaItemForParameters:v8];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v10 setResourceLoadingDelegate:self];
    if (self->_wantsDateRangeCollection) {
      -[TVAirPlayURLSession addDateRangeCollectorToItem:](self, "addDateRangeCollectorToItem:", v10);
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession playlist](self, "playlist"));
    [v11 addItem:v10];
  }
}

- (BOOL)_removeItemWithInfo:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"uuid"]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlaylist trackList](self->_playlist, "trackList"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_100008350;
  v15[3] = &unk_100030B80;
  id v16 = v6;
  id v8 = v6;
  id v9 = [v7 indexOfObjectPassingTest:v15];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6727LL,  0LL);
    id v11 = v10;
    if (a4 && v10)
    {
      id v11 = v10;
      *a4 = v11;
    }
  }

  else
  {
    id v12 = v9;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v9]);
    [v13 setResourceLoadingDelegate:self];

    -[TVPPlaylist removeItemAtIndex:](self->_playlist, "removeItemAtIndex:", v12);
    id v11 = 0LL;
  }

  return v11 == 0LL;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v4 = sub_1000043A0();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    BOOL v7 = "-[TVAirPlayURLSession contentKeySession:didProvideContentKeyRequest:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignoring %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)contentKeySessionDidGenerateExpiredSessionReport:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000043A0();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[TVAirPlayURLSession contentKeySessionDidGenerateExpiredSessionReport:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received %s - %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[TVAirPlayURLSession _sendPendingSecureStopRecordsForSession:removeAfterSending:]( self,  "_sendPendingSecureStopRecordsForSession:removeAfterSending:",  v4,  0LL);
}

- (void)_sendPendingSecureStopRecordsForSession:(id)a3 removeAfterSending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1000043A0();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136315394;
    uint64_t v32 = "-[TVAirPlayURLSession _sendPendingSecureStopRecordsForSession:removeAfterSending:]";
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    appIdentifier = self->_appIdentifier;
    if (appIdentifier)
    {
      BOOL v23 = v4;
      id v10 = [(id)objc_opt_class(self) _secureStopURL];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AVContentKeySession pendingExpiredSessionReportsWithAppIdentifier:storageDirectoryAtURL:]( &OBJC_CLASS___AVContentKeySession,  "pendingExpiredSessionReportsWithAppIdentifier:storageDirectoryAtURL:",  appIdentifier,  v11));

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          id v17 = 0LL;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v17);
            uint64_t v28 = @"record";
            uint64_t v29 = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
            -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"fpsSecureStopGenerated",  v19);

            id v17 = (char *)v17 + 1;
          }

          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }

        while (v15);
      }

      if (v23)
      {
        uint64_t v20 = self->_appIdentifier;
        id v21 = [(id)objc_opt_class(self) _secureStopURL];
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        +[AVContentKeySession removePendingExpiredSessionReports:withAppIdentifier:storageDirectoryAtURL:]( &OBJC_CLASS___AVContentKeySession,  "removePendingExpiredSessionReports:withAppIdentifier:storageDirectoryAtURL:",  v13,  v20,  v22);
      }
    }
  }
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 AVQueuePlayer]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentItem]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaDataCollectors]);
  unsigned int v14 = [v13 containsObject:v8];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);

    id v17 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        unsigned int v22 = 0LL;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v22), "propertyList", (void)v27));
          -[NSArray addObject:](v17, "addObject:", v23);

          unsigned int v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v20);
    }

    lastReportedDateRanges = self->_lastReportedDateRanges;
    self->_lastReportedDateRanges = v17;
    __int128 v25 = v17;

    v31[0] = @"uuid";
    v31[1] = @"dateRangeArray";
    v32[0] = v16;
    v32[1] = v18;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));

    -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", @"dateRange", v26);
  }
}

- (BOOL)player:(id)a3 shouldSeekToTime:(double *)a4 playbackDate:(id *)a5
{
  return 1;
}

- (BOOL)playerShouldPlay:(id)a3 timeFromWhichToPlay:(double *)a4
{
  return 1;
}

- (BOOL)playerShouldPause:(id)a3
{
  return 1;
}

- (BOOL)player:(id)a3 shouldScanAtRate:(double)a4
{
  return 1;
}

- (BOOL)player:(id)a3 shouldChangeMediaInDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = @"userPrevious";
    goto LABEL_5;
  }

  if (!a4)
  {
    id v7 = @"userNext";
LABEL_5:
    -[TVAirPlayURLSession sendEventToDelegate:withInfo:](self, "sendEventToDelegate:withInfo:", v7, 0LL);
  }

  return 0;
}

- (BOOL)player:(id)a3 shouldChangeToMediaAtIndex:(unint64_t)a4
{
  return 0;
}

- (void)mediaItem:(id)a3 didRequestResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000043A0();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "AirPlay Failed URL Request for item: %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 avRequestID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_resourceLoadingRequests,  "setObject:forKeyedSubscript:",  v7,  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);

  -[TVAirPlayURLSession sendEventToDelegate:withInfo:]( self,  "sendEventToDelegate:withInfo:",  @"failedURLRequest",  v11);
}

- (id)_handleKeyResponseWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:](self, "shouldDelegateToInterstitialForParams:", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 _handleKeyResponseWithOptions:v6 error:a4]);

    goto LABEL_21;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appID"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"assetID"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"requestContext"]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"options"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kFigAirPlayCustomURLResponseKey_RequestID]);
  if (v13)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_resourceLoadingRequests,  "objectForKeyedSubscript:",  v13));
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVPSecureKeyRequest);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
    {
      id v16 = sub_1000043A0();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unsigned int v22 = (objc_class *)objc_opt_class(v14);
        BOOL v23 = NSStringFromClass(v22);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)CMTime buf = 138543874;
        __int128 v28 = v13;
        __int16 v29 = 2114;
        __int128 v30 = v24;
        __int16 v31 = 2114;
        id v32 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "No request for with session ID: %{public}@ class: %{public}@ options: %{public}@",  buf,  0x20u);
      }
    }

    if (v14)
    {
      __int128 v25 = v9;
      [v14 setCertificateData:v9];
      [v14 setContentIdentifierData:v10];
      [v14 setRequestOptions:v12];
      id v26 = 0LL;
      unsigned int v18 = [v14 loadKeyRequestDataWithError:&v26];
      unint64_t v19 = (unint64_t)v26;
      if (v18) {
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v14 keyRequestData]);
      }
      else {
        uint64_t v20 = 0LL;
      }
      id v9 = v25;
      goto LABEL_15;
    }
  }

  else
  {
    unsigned int v14 = 0LL;
  }

  uint64_t v20 = 0LL;
  unint64_t v19 = 0LL;
LABEL_15:
  if (!(v20 | v19)) {
    unint64_t v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6727LL,  0LL);
  }
  if (a4 && v19) {
    *a4 = (id) v19;
  }
  id v8 = (id)v20;

LABEL_21:
  return v8;
}

- (void)_noteAppIdentifierForStreamingKeyRequest:(id)a3
{
  id v4 = a3;
  if (-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:](self, "shouldDelegateToInterstitialForParams:", v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
    [v5 _noteAppIdentifierForStreamingKeyRequest:v4];
  }

  else
  {
    appIdentifier = self->_appIdentifier;
    id v7 = (NSData *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"appID"]);
    id v8 = self->_appIdentifier;
    self->_appIdentifier = v7;

    id v9 = sub_1000043A0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_appIdentifier;
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "updating app identifier: %{public}@",  (uint8_t *)&v12,  0xCu);
    }

    if (!appIdentifier) {
      -[TVAirPlayURLSession _sendPendingSecureStopRecordsForSession:removeAfterSending:]( self,  "_sendPendingSecureStopRecordsForSession:removeAfterSending:",  self->_contentKeySession,  1LL);
    }
  }
}

- (BOOL)_handleFailedURLResponseWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[TVAirPlayURLSession shouldDelegateToInterstitialForParams:]( self,  "shouldDelegateToInterstitialForParams:",  v6))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_numberForKey:", @"FCUP_Response_RequestID"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_dataForKey:", @"FCUP_Response_Data"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_numberForKey:", @"FCUP_Response_StatusCode"));
    int v12 = (char *)[v11 integerValue];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_stringForKey:", @"FCUP_Response_URL"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_dictionaryForKey:", @"FCUP_Response_Headers"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_dateForKey:", @"FCUP_Response_ContentRenewalDate"));

    if (v9)
    {
      if (!v10 && !v12)
      {
        id v16 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  0LL));
LABEL_11:
        id v7 = v16;
        if (v16)
        {
          if (a4)
          {
            id v7 = v16;
            id v6 = 0LL;
            unsigned __int8 v8 = 0;
            *a4 = v7;
          }

          else
          {
            id v6 = 0LL;
            unsigned __int8 v8 = 0;
          }

- (void)_parseSessionOptions:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"audioOnly"]);
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"purchasedMediaKind"]);
    uint64_t v6 = (uint64_t)[v7 isEqualToString:@"music"];
  }

  -[TVAirPlayURLSession setAudioOnly:](self, "setAudioOnly:", v6);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"sharedAudioSessionID"]);
  id v9 = (NSNumber *)[v8 copy];
  audioSessionID = self->_audioSessionID;
  self->_audioSessionID = v9;
}

- (void)_removePlayerKVOObservers
{
  if (self->_playerKVOObserversAdded)
  {
    -[TVPPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"selectedAudioOption",  off_10003ECF0);
    -[TVPPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"selectedSubtitleOption",  off_10003ECF8);
    -[TVPPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"AVQueuePlayer",  off_10003ED00);
    self->_playerKVOObserversAdded = 0;
  }

- (id)_parametersWithAddedSessionOptions:(id)a3
{
  id v4 = [a3 mutableCopy];
  if (-[TVAirPlayURLSession audioOnly](self, "audioOnly")) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"audioOnly"];
  }
  return v4;
}

- (void)_cancelEmptyPlaylistTimer
{
  emptyPlaylistTimer = self->_emptyPlaylistTimer;
  if (emptyPlaylistTimer)
  {
    dispatch_source_cancel((dispatch_source_t)emptyPlaylistTimer);
    id v4 = self->_emptyPlaylistTimer;
    self->_emptyPlaylistTimer = 0LL;
  }

+ (id)_playerForParameters:(id)a3 playlist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[TVPPlayer initWithName:](objc_alloc(&OBJC_CLASS___TVPPlayer), "initWithName:", @"TVAirPlayURLPlayerName");
  -[TVPPlayer setUpdatesMediaRemoteInfoAutomatically:]( v7,  "setUpdatesMediaRemoteInfoAutomatically:",  objc_msgSend(v5, "tvs_BOOLForKey:defaultValue:", @"audioOnly", 0) ^ 1);
  -[TVPPlayer setHandleRemoteCommandsWithoutUpdatingMediaRemote:]( v7,  "setHandleRemoteCommandsWithoutUpdatingMediaRemote:",  1LL);
  -[TVPPlayer setPlaylist:](v7, "setPlaylist:", v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Start-Position"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Start-Position-Seconds"]);
  id v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    -[TVPPlayer setElapsedTime:](v7, "setElapsedTime:");
  }

  else if (v8)
  {
    [v8 doubleValue];
    -[TVPPlayer setStartPosition:](v7, "setStartPosition:");
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Start-Date"]);
  if (v11) {
    -[TVPPlayer setPlaybackDate:](v7, "setPlaybackDate:", v11);
  }
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Start-Estimated-Date"]);
  if (v12) {
    -[TVPPlayer setPlaybackDate:](v7, "setPlaybackDate:", v11);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"muted"]);
  unsigned int v14 = v13;
  if (v13) {
    -[TVPPlayer setMuted:](v7, "setMuted:", [v13 BOOLValue]);
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"volume"]);
  id v16 = v15;
  if (v15)
  {
    [v15 floatValue];
    -[TVPPlayer setVolume:](v7, "setVolume:");
  }

  return v7;
}

+ (id)_mediaItemForParameters:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"mz_at"]);
  if ([v4 length]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"buyParams"]);
  }
  else {
    id v5 = 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"HLS-Content-Location"]);
  id v7 = v6;
  if (!v5)
  {
    id v9 = v6;
    if (-[NSURL length](v9, "length"))
    {
      id v10 = sub_1000043A0();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Using HLS-Content-Location for playback URL",  buf,  2u);
      }
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Content-Location"]);

      id v9 = (NSURL *)v12;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"inheritURIQueryComponentFromReferencingURI"]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"purchasedMediaKind"]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"itemType"]);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"dsid"]);
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v39 = v13;
    uint64_t v38 = v14;
    unsigned __int8 v16 = [v14 isEqualToString:@"music"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"audioOnly"]);
    unsigned __int8 v18 = [v17 BOOLValue];

    if ((v16 & 1) == 0 && (v18 & 1) == 0)
    {
      if (!-[NSURL length](v9, "length")
        || (uint64_t v19 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v9),
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](v19, "pathExtension")),
            unsigned __int8 v21 = [v20 isEqualToString:@"m3u8"],
            v20,
            v19,
            (v21 & 1) == 0))
      {
        -[NSMutableArray addObject:](v15, "addObject:", TVPMediaItemTraitUseDiskCache);
      }

      -[NSMutableArray addObject:](v15, "addObject:", TVPMediaItemTraitPreventSpeculativeLoading);
    }

    unsigned int v22 = objc_alloc(&OBJC_CLASS___TVAirPlayMediaItem);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
    unsigned __int8 v8 = -[TVAirPlayMediaItem initWithURL:traits:](v22, "initWithURL:traits:", v23, v15);

    if ([v41 isEqualToString:@"purchased"])
    {
      __int128 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleIdentifier]);
      id v26 = v25;
      id v36 = v9;
      if (v25)
      {
        id v27 = v25;
      }

      else
      {
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        id v27 = (id)objc_claimAutoreleasedReturnValue([v28 processName]);
      }

      if ([v27 length]) {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSUserAgent userAgentForProcessInfo:]( &OBJC_CLASS___AMSUserAgent,  "userAgentForProcessInfo:",  v37));
      }
      else {
        __int16 v29 = 0LL;
      }
      if ([v29 length]) {
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v29, @"User-Agent");
      }
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v40 stringValue]);
      if (v30) {
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v30, @"X-Dsid");
      }
      if (-[NSMutableDictionary count](v24, "count")) {
        -[TVAirPlayStoreMediaItem setMediaItemMetadata:forProperty:]( v8,  "setMediaItemMetadata:forProperty:",  v24,  TVPMediaItemMetadataHTTPHeaders);
      }

      id v9 = v36;
    }

    goto LABEL_35;
  }

  unsigned __int8 v8 = -[TVAirPlayStoreMediaItem initWithParameters:]( objc_alloc(&OBJC_CLASS___TVAirPlayStoreMediaItem),  "initWithParameters:",  v3);
  if ([v7 length])
  {
    id v9 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v7);
    -[TVAirPlayStoreMediaItem setHlsPlaylistURL:](v8, "setHlsPlaylistURL:", v9);
LABEL_35:
  }

  -[TVAirPlayStoreMediaItem setMediaItemMetadata:forProperty:]( v8,  "setMediaItemMetadata:forProperty:",  &__kCFBooleanFalse,  TVPMediaItemMetadataAutomaticallyHandlesInterstitialEvents);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100009BC4;
  v42[3] = &unk_100030BA8;
  id v43 = v3;
  __int16 v31 = v8;
  id v44 = v31;
  BOOL v45 = v5 != 0LL;
  id v32 = v3;
  -[TVAirPlayStoreMediaItem performMediaItemMetadataTransactionWithBlock:]( v31,  "performMediaItemMetadataTransactionWithBlock:",  v42);
  __int16 v33 = v44;
  id v34 = v31;

  return v34;
}

+ (id)_secureStopURL
{
  if (qword_10003F788 != -1) {
    dispatch_once(&qword_10003F788, &stru_100030BC8);
  }
  return (id)qword_10003F780;
}

- (BOOL)deactivated
{
  return self->_deactivated;
}

- (void)setDeactivated:(BOOL)a3
{
  self->_deactivated = a3;
}

- (TVAirPlayLegacySessionDelegate)delegate
{
  return (TVAirPlayLegacySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (TVPPlayer)player
{
  return self->_player;
}

- (BOOL)stoppedDueToUser
{
  return self->_stoppedDueToUser;
}

- (void)setStoppedDueToUser:(BOOL)a3
{
  self->_stoppedDueToUser = a3;
}

- (BOOL)audioOnly
{
  return self->_audioOnly;
}

- (void)setAudioOnly:(BOOL)a3
{
  self->_audioOnly = a3;
}

- (TVPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (NSDictionary)initialRequest
{
  return self->_initialRequest;
}

- (void)setInitialRequest:(id)a3
{
}

- (NSMutableDictionary)resourceLoadingRequests
{
  return self->_resourceLoadingRequests;
}

- (void)setResourceLoadingRequests:(id)a3
{
}

- (BOOL)playerKVOObserversAdded
{
  return self->_playerKVOObserversAdded;
}

- (void)setPlayerKVOObserversAdded:(BOOL)a3
{
  self->_playerKVOObserversAdded = a3;
}

- (id)elapsedTimeObserverToken
{
  return self->_elapsedTimeObserverToken;
}

- (void)setElapsedTimeObserverToken:(id)a3
{
}

- (OS_dispatch_source)emptyPlaylistTimer
{
  return self->_emptyPlaylistTimer;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(id)a3
{
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
}

- (BOOL)wantsDateRangeCollection
{
  return self->_wantsDateRangeCollection;
}

- (void)setWantsDateRangeCollection:(BOOL)a3
{
  self->_wantsDateRangeCollection = a3;
}

- (NSArray)lastReportedDateRanges
{
  return self->_lastReportedDateRanges;
}

- (void)setLastReportedDateRanges:(id)a3
{
}

- (NSString)currentInterstitialEventID
{
  return self->_currentInterstitialEventID;
}

- (void)setCurrentInterstitialEventID:(id)a3
{
}

- (NSArray)interstitialEvents
{
  return self->_interstitialEvents;
}

- (void)setInterstitialEvents:(id)a3
{
}

- (NSData)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (TVAirPlayURLSession)primarySession
{
  return (TVAirPlayURLSession *)objc_loadWeakRetained((id *)&self->_primarySession);
}

- (void)setPrimarySession:(id)a3
{
}

- (void)setInterstitialSession:(id)a3
{
}

- (BOOL)connectedInterstitialToPrimary
{
  return self->_connectedInterstitialToPrimary;
}

- (void)setConnectedInterstitialToPrimary:(BOOL)a3
{
  self->_connectedInterstitialToPrimary = a3;
}

- (void).cxx_destruct
{
}

@end