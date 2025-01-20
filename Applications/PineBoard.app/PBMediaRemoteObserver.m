@interface PBMediaRemoteObserver
+ (PBDependencyDescription)dependencyDescription;
+ (PBMediaRemoteObserver)sharedInstance;
+ (id)_allAudioMediaTypes;
+ (id)_bulletinInfoForNowPlayingInfo:(id)a3;
- (BOOL)isMusicAppPlaying;
- (BOOL)isPodcastsAppPlaying;
- (BOOL)nowPlayingMediaTypeAudioOnly;
- (BOOL)playing;
- (BOOL)playingMusic;
- (MRPlayerPath)nowPlayingPlayerPath;
- (MRPlayerPath)pictureInPicturePlayerPath;
- (NSNumber)defaultPlaybackRate;
- (NSNumber)playbackRate;
- (NSNumber)trackIdentifier;
- (NSString)mediaType;
- (PBApplicationInfo)nowPlayingApplicationInfo;
- (PBDistributedAssertion)suppressNowPlayingBulletinAssertion;
- (PBMRMetadataUpdateTransaction)metadataUpdateTransaction;
- (PBMRPictureInPicturePlayerTransaction)pictureInPicturePlayerTransaction;
- (PBMRSupportedCommandsTransaction)supportedCommandsTransaction;
- (PBMediaRemoteObserver)init;
- (PBMediaRemoteObserverDelegate)delegate;
- (PBPlaybackRateList)supportedPlaybackRates;
- (PBSBulletin)currentBulletin;
- (int)nowPlayingProcessPID;
- (void)_notifyAttentionMonitorPlaybackStateChanged;
- (void)_nowPlayingAppDidChange:(id)a3;
- (void)_nowPlayingAppPlaybackStateDidChange:(id)a3;
- (void)_nowPlayingInfoDidChange:(id)a3;
- (void)_performMetadataUpdate;
- (void)_performPictureInPicturePlayerStateUpdate;
- (void)_performSupportedCommandsUpdateWithPlayerPath:(void *)a3;
- (void)_pictureInPictureStateDidChange:(id)a3;
- (void)_presentTrackChangeBulletinWithInfo:(id)a3;
- (void)_remotePlayerPlaybackStateDidChange:(id)a3;
- (void)_setNeedsMetadataUpdate;
- (void)_updatePictureInPictureStateWithActivePlayerPath:(id)a3;
- (void)_updateSupportedPlaybackRates:(id)a3;
- (void)_updateWithNowPlayingInfoDictionary:(id)a3 playbackState:(unsigned int)a4 nowPlayingPID:(int)a5 nowPlayingPlayerPath:(id)a6;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)dealloc;
- (void)setCurrentBulletin:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation PBMediaRemoteObserver

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10019AD80;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (PBMediaRemoteObserver)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019AE18;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471258 != -1) {
    dispatch_once(&qword_100471258, block);
  }
  return (PBMediaRemoteObserver *)(id)qword_100471250;
}

- (PBMediaRemoteObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMediaRemoteObserver;
  result = -[PBMediaRemoteObserver init](&v3, "init");
  if (result) {
    result->_metadataUpdateRunning._Value = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMediaRemoteObserver;
  -[PBMediaRemoteObserver dealloc](&v3, "dealloc");
}

- (void)startObserving
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBDistributedAssertion distributedAssertionForDomain:]( &OBJC_CLASS___PBDistributedAssertion,  "distributedAssertionForDomain:",  PBSAssertionDomainSuppressNowPlayingBulletin));
  v4 = (PBDistributedAssertion *)objc_claimAutoreleasedReturnValue([v3 requireFocusedProcess]);
  suppressNowPlayingBulletinAssertion = self->_suppressNowPlayingBulletinAssertion;
  self->_suppressNowPlayingBulletinAssertion = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_nowPlayingAppDidChange:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];
  [v6 addObserver:self selector:"_nowPlayingAppPlaybackStateDidChange:" name:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0];
  [v6 addObserver:self selector:"_nowPlayingInfoDidChange:" name:kMRMediaRemoteNowPlayingInfoDidChangeNotification object:0];
  [v6 addObserver:self selector:"_remotePlayerPlaybackStateDidChange:" name:kMRMediaRemotePlayerPlaybackStateDidChangeNotification object:0];
  [v6 addObserver:self selector:"_pictureInPictureStateDidChange:" name:kMRMediaRemotePlayerPictureInPictureDidChange object:0];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  MRMediaRemoteRegisterForNowPlayingNotifications();

  -[PBMediaRemoteObserver _setNeedsMetadataUpdate](self, "_setNeedsMetadataUpdate");
}

- (void)stopObserving
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  MRMediaRemoteUnregisterForNowPlayingNotifications();
}

- (BOOL)nowPlayingMediaTypeAudioOnly
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSString copy](v2->_mediaType, "copy");
  objc_sync_exit(v2);

  id v4 = [(id)objc_opt_class(v2) _allAudioMediaTypes];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

- (NSNumber)playbackRate
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSNumber copy](v2->_playbackRate, "copy");
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (NSNumber)defaultPlaybackRate
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSNumber copy](v2->_defaultPlaybackRate, "copy");
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (PBPlaybackRateList)supportedPlaybackRates
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[PBPlaybackRateList copy](v2->_supportedPlaybackRates, "copy");
  objc_sync_exit(v2);

  return (PBPlaybackRateList *)v3;
}

- (BOOL)playing
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL playing = v2->_playing;
  objc_sync_exit(v2);

  return playing;
}

- (BOOL)playingMusic
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL playingMusic = v2->_playingMusic;
  objc_sync_exit(v2);

  return playingMusic;
}

- (BOOL)isMusicAppPlaying
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isMusicAppPlaying = v2->_isMusicAppPlaying;
  objc_sync_exit(v2);

  return isMusicAppPlaying;
}

- (BOOL)isPodcastsAppPlaying
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isPodcastsAppPlaying = v2->_isPodcastsAppPlaying;
  objc_sync_exit(v2);

  return isPodcastsAppPlaying;
}

- (PBSBulletin)currentBulletin
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentBulletin;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentBulletin:(id)a3
{
  id v4 = (PBSBulletin *)a3;
  v5 = self;
  objc_sync_enter(v5);
  currentBulletin = v5->_currentBulletin;
  v5->_currentBulletin = v4;

  objc_sync_exit(v5);
}

- (int)nowPlayingProcessPID
{
  v2 = self;
  objc_sync_enter(v2);
  int nowPlayingProcessPID = v2->_nowPlayingProcessPID;
  objc_sync_exit(v2);

  return nowPlayingProcessPID;
}

- (PBApplicationInfo)nowPlayingApplicationInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_nowPlayingApplicationInfo;
  objc_sync_exit(v2);

  return v3;
}

- (MRPlayerPath)nowPlayingPlayerPath
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_nowPlayingPlayerPath;
  objc_sync_exit(v2);

  return v3;
}

- (MRPlayerPath)pictureInPicturePlayerPath
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_pictureInPicturePlayerPath;
  objc_sync_exit(v2);

  return v3;
}

- (void)_remotePlayerPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083474();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_remotePlayerPlaybackStateDidChange %@",  (uint8_t *)&v8,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteObserver delegate](self, "delegate"));
  [v7 mediaRemoteObserverRemotePlaybackStateDidChange:self];
}

- (void)_nowPlayingInfoDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083474();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_nowPlayingInfoDidChange %@",  (uint8_t *)&v7,  0xCu);
  }

  -[PBMediaRemoteObserver _setNeedsMetadataUpdate](self, "_setNeedsMetadataUpdate");
}

- (void)_nowPlayingAppPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083474();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_nowPlayingAppPlaybackStateDidChange %@",  (uint8_t *)&v7,  0xCu);
  }

  -[PBMediaRemoteObserver _setNeedsMetadataUpdate](self, "_setNeedsMetadataUpdate");
}

- (void)_nowPlayingAppDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083474();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_nowPlayingAppDidChange %@",  (uint8_t *)&v12,  0xCu);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = [v7 objectForKey:kMRNowPlayingClientUserInfoKey];

  if (v8)
  {
    id v9 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  MRNowPlayingClientGetProcessIdentifier(v8));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(v9);
    lastNotificationPID = self->_lastNotificationPID;
    self->_lastNotificationPID = v10;
  }

  else
  {
    lastNotificationPID = self->_lastNotificationPID;
    self->_lastNotificationPID = 0LL;
  }

  -[PBMediaRemoteObserver _setNeedsMetadataUpdate](self, "_setNeedsMetadataUpdate");
}

- (void)_pictureInPictureStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083474();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_pictureInPictureStateDidChange %@",  (uint8_t *)&v7,  0xCu);
  }

  -[PBMediaRemoteObserver _performPictureInPicturePlayerStateUpdate](self, "_performPictureInPicturePlayerStateUpdate");
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteObserver currentBulletin](self, "currentBulletin"));
  unsigned int v8 = [v7 isEqual:v6];

  if (v8) {
    -[PBMediaRemoteObserver setCurrentBulletin:](self, "setCurrentBulletin:", 0LL);
  }
}

- (void)_presentTrackChangeBulletinWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_1003FDF38,  PBSSystemBulletinStyleKey);
  id v7 = [(id)objc_opt_class(self) _bulletinInfoForNowPlayingInfo:v4];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v8);
  -[PBSBulletin setMessage:](v5, "setMessage:", v6);
  -[PBSBulletin setViewControllerClassName:]( v5,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v5, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  id v9 = sub_100083474();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Presenting track change bulletin: %p",  (uint8_t *)&v14,  0xCu);
  }

  if (!self->_bulletinService)
  {
    v11 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    bulletinService = self->_bulletinService;
    self->_bulletinService = v11;

    -[PBBulletinService setDelegate:](self->_bulletinService, "setDelegate:", self);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteObserver currentBulletin](self, "currentBulletin"));
  if (([v13 isEqual:v5] & 1) == 0)
  {
    if (v13) {
      -[PBBulletinService dismissBulletin:](self->_bulletinService, "dismissBulletin:", v13);
    }
    -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  v5,  0LL);
    -[PBMediaRemoteObserver setCurrentBulletin:](self, "setCurrentBulletin:", v5);
  }
}

- (void)_setNeedsMetadataUpdate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10019BAFC;
  v2[3] = &unk_1003D05A8;
  v2[4] = self;
  v2[5] = a2;
  dispatch_async(&_dispatch_main_q, v2);
}

- (void)_performMetadataUpdate
{
  id v3 = sub_100083474();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PBMediaRemoteObserver _performMetadataUpdate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  NSInteger v5 = -[NSNumber integerValue](self->_lastNotificationPID, "integerValue");
  int v6 = v5;
  id v7 = (const void *)MRNowPlayingClientCreate(v5, 0LL);
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  id v9 = (const void *)MRNowPlayingPlayerPathCreate(LocalOrigin, v7, 0LL);
  v10 = (const void *)MRPlaybackQueueRequestCreate(0LL, 1LL);
  MRPlaybackQueueRequestSetIncludeLanguageOptions(v10, 1LL);
  MRPlaybackQueueRequestSetIncludeMetadata(v10, 1LL);
  MRPlaybackQueueRequestSetIncludeArtwork(v10, 600.0, 600.0);
  v11 = -[PBMRMetadataUpdateTransaction initWithRequest:playerPath:]( objc_alloc(&OBJC_CLASS___PBMRMetadataUpdateTransaction),  "initWithRequest:playerPath:",  v10,  v9);
  metadataUpdateTransaction = self->_metadataUpdateTransaction;
  self->_metadataUpdateTransaction = v11;

  id v13 = self->_metadataUpdateTransaction;
  objc_initWeak((id *)buf, self);
  int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](v13, "queue"));
  dispatch_assert_queue_not_V2(v14);

  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](v13, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019BE44;
  block[3] = &unk_1003DAEF8;
  v16 = v13;
  v18 = v16;
  objc_copyWeak(&v19, (id *)buf);
  int v20 = v6;
  dispatch_sync(v15, block);

  -[PBMediaRemoteObserver _performSupportedCommandsUpdateWithPlayerPath:]( self,  "_performSupportedCommandsUpdateWithPlayerPath:",  v9);
  CFRelease(v10);
  CFRelease(v9);
  if (v7) {
    CFRelease(v7);
  }
  objc_destroyWeak(&v19);

  objc_destroyWeak((id *)buf);
}

- (void)_performSupportedCommandsUpdateWithPlayerPath:(void *)a3
{
  id v4 = -[PBMRSupportedCommandsTransaction initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___PBMRSupportedCommandsTransaction),  "initWithPlayerPath:",  a3);
  NSInteger v5 = self->_supportedCommandsTransaction;
  objc_storeStrong((id *)&self->_supportedCommandsTransaction, v4);
  if (v5)
  {
    int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v5, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019C31C;
    block[3] = &unk_1003CFF08;
    v15 = v5;
    dispatch_async(v6, block);
  }

  objc_initWeak(&location, self);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v4, "queue"));
  dispatch_assert_queue_not_V2(v7);

  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v4, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10019C334;
  v10[3] = &unk_1003D9D78;
  v11 = v4;
  id v9 = v4;
  objc_copyWeak(&v12, &location);
  dispatch_sync(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_performPictureInPicturePlayerStateUpdate
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PBMRPictureInPicturePlayerTransaction);
  id v4 = self->_pictureInPicturePlayerTransaction;
  objc_storeStrong((id *)&self->_pictureInPicturePlayerTransaction, v3);
  if (v4)
  {
    NSInteger v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v4, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019C7A0;
    block[3] = &unk_1003CFF08;
    int v14 = v4;
    dispatch_async(v5, block);
  }

  objc_initWeak(&location, self);
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v3, "queue"));
  dispatch_assert_queue_not_V2(v6);

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction queue](v3, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10019C7B8;
  v9[3] = &unk_1003D9D78;
  v10 = v3;
  unsigned int v8 = v3;
  objc_copyWeak(&v11, &location);
  dispatch_sync(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateWithNowPlayingInfoDictionary:(id)a3 playbackState:(unsigned int)a4 nowPlayingPID:(int)a5 nowPlayingPlayerPath:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v97 = a3;
  id v88 = a6;
  id v9 = sub_100083474();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoTitle));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v88 description]);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v99 = a4;
    *(_WORD *)&v99[4] = 1024;
    *(_DWORD *)&v99[6] = v7;
    *(_WORD *)v100 = 2112;
    *(void *)&v100[2] = v11;
    *(_WORD *)&v100[10] = 2112;
    *(void *)&v100[12] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "-[PBMediaRemoteObserver _update...] state: %d, pid: %d, title: %@, playerPath: %@",  buf,  0x22u);
  }

  v80 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "tvs_numberForKey:", kMRMediaRemoteNowPlayingInfoPlaybackRate));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bs_safeNumberForKey:", kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate));
  v89 = (NSString *)objc_claimAutoreleasedReturnValue( +[TVPMediaRemoteUtilities mediaTypeForInfo:]( &OBJC_CLASS___TVPMediaRemoteUtilities,  "mediaTypeForInfo:",  v97));
  if (v97)
  {
    v79 = (NSNumber *)(id)objc_claimAutoreleasedReturnValue( +[TVPMediaRemoteUtilities trackIdentifierForInfo:]( &OBJC_CLASS___TVPMediaRemoteUtilities,  "trackIdentifierForInfo:"));
  }

  else
  {
    v79 = 0LL;
  }

  id v13 = sub_100083474();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = " NOT";
    *(_DWORD *)buf = 136315650;
    if (a4 == 1) {
      v15 = "";
    }
    *(void *)v99 = v15;
    *(_WORD *)&v99[8] = 1024;
    *(_DWORD *)v100 = a4;
    *(_WORD *)&v100[4] = 2112;
    *(void *)&v100[6] = v80;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "QA: PineBoard thinks that the system is%s playing media (%d, %@)",  buf,  0x1Cu);
  }

  else {
    unsigned int v16 = 0;
  }
  unsigned int v77 = v16;
  unsigned int v96 = v16;
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
    id v18 = (id)objc_claimAutoreleasedReturnValue([v17 processForPID:v77]);

    id v19 = v18;
  }

  else
  {
    id v19 = 0LL;
  }

  v90 = v19;
  v87 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleIdentifier]);
  int v20 = v90;
  if (v90)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v75 = (id)objc_claimAutoreleasedReturnValue([v21 musicAppBundleIdentifier]);

    int v20 = v90;
  }

  else
  {
    id v75 = 0LL;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
  unsigned int v94 = [v22 isEqual:v75];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v90 bundleIdentifier]);
  unsigned int v86 = [v23 isEqualToString:@"com.apple.podcasts"];

  id v24 = [(id)objc_opt_class(self) _allAudioMediaTypes];
  v78 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v25 = self;
  objc_sync_enter(v25);
  int nowPlayingProcessPID = v25->_nowPlayingProcessPID;
  id location = (id *)&v25->_nowPlayingApplicationInfo;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationInfo bundleIdentifier](v25->_nowPlayingApplicationInfo, "bundleIdentifier"));
  int v93 = BSEqualObjects(v26, v87);

  int isPodcastsAppPlaying = v25->_isPodcastsAppPlaying;
  int isMusicAppPlaying = v25->_isMusicAppPlaying;
  int v82 = BSEqualObjects(v25->_nowPlayingPlayerPath, v88);
  p_mediaType = (id *)&v25->_mediaType;
  if (v89 == v25->_mediaType
    || ((unsigned int v28 = -[NSString isEqual:](v89, "isEqual:"), !v97)
      ? (BOOL v29 = nowPlayingProcessPID == v96)
      : (BOOL v29 = 0),
        v29 ? (int v30 = 0) : (int v30 = 1),
        v28))
  {
    int v30 = 0;
  }

  if (v97)
  {
    if (v79 == v25->_trackIdentifier) {
      unsigned int v31 = 1;
    }
    else {
      unsigned int v31 = -[NSNumber isEqual:](v79, "isEqual:");
    }
    p_BOOL playing = &v25->_playing;
    BOOL v92 = v25->_playing == (a4 == 1);
    if (v80 == v25->_playbackRate) {
      unsigned int v33 = 1;
    }
    else {
      unsigned int v33 = -[NSNumber isEqual:](v80, "isEqual:");
    }
    int v74 = v31 ^ 1;
    int v91 = v33 ^ 1;
    int v85 = BSEqualObjects(v76, v25->_defaultPlaybackRate) ^ 1;
  }

  else
  {
    int v74 = 0;
    int v85 = 0;
    p_BOOL playing = &v25->_playing;
    int v91 = 0;
    BOOL v92 = v25->_playing == (a4 == 1);
  }

  if (v89) {
    int v34 = 1;
  }
  else {
    int v34 = v94;
  }
  if (v34 == 1) {
    unsigned int v35 = [v78 containsObject:v89];
  }
  else {
    unsigned int v35 = 0;
  }
  id v36 = *p_mediaType;
  unsigned int v37 = [v78 containsObject:*p_mediaType];
  int v73 = v30;
  if (a4 == 1)
  {
    if (v89) {
      unsigned int v38 = 0;
    }
    else {
      unsigned int v38 = v37;
    }
    int v39 = v35 | v38;
  }

  else
  {
    int v39 = 0;
  }

  int playingMusic = v25->_playingMusic;
  objc_sync_exit(v25);

  BOOL v41 = a4 != 1;
  if ((v89 == 0LL && v36 == 0LL || v41) | v39 & 1)
  {
    int v42 = v39 & ~(v89 == 0LL && v36 == 0LL || v41);
    char v43 = v42 | v41;
    if (v42) {
      uint64_t v44 = 2LL;
    }
    else {
      uint64_t v44 = 0LL;
    }
    if ((v43 & 1) == 0)
    {
      id v45 = sub_100083474();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = *p_mediaType;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v99 = v89 == 0LL;
        *(_WORD *)&v99[4] = 1024;
        *(_DWORD *)&v99[6] = v36 == 0LL;
        *(_WORD *)v100 = 2112;
        *(void *)&v100[2] = v89;
        *(_WORD *)&v100[10] = 2112;
        *(void *)&v100[12] = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "System is playing something but we don't know what: newMediaTypeUndefined:%d, oldMediaTypeUndefined:%d, new me diaType:'%@', old mediaType:'%@'",  buf,  0x22u);
      }

      uint64_t v44 = 1LL;
    }
  }

  else
  {
    uint64_t v44 = 3LL;
  }

  +[PBSSystemStatus _setSystemPlayingState:](&OBJC_CLASS___PBSSystemStatus, "_setSystemPlayingState:", v44);
  char v48 = v93;
  if (!v87) {
    char v48 = 1;
  }
  if ((v48 & 1) != 0)
  {
    v49 = 0LL;
  }

  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v50 installedApplicationWithBundleIdentifier:v87]);
  }

  if (!v92) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"playing");
  }
  if (v91) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"playbackRate");
  }
  if (v85) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"defaultPlaybackRate");
  }
  if (playingMusic != v39) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"playingMusic");
  }
  if (nowPlayingProcessPID != v96) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"nowPlayingProcessPID");
  }
  if ((v93 & 1) == 0) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"nowPlayingApplicationInfo");
  }
  if (isMusicAppPlaying != v94) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"isMusicAppPlaying");
  }
  if (isPodcastsAppPlaying != v86) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"isPodcastsAppPlaying");
  }
  if ((v82 & 1) == 0) {
    -[PBMediaRemoteObserver willChangeValueForKey:](v25, "willChangeValueForKey:", @"nowPlayingPlayerPath");
  }
  v51 = v25;
  objc_sync_enter(v51);
  if (v73)
  {
    id v52 = -[NSString copy](v89, "copy");
    objc_storeStrong((id *)&v25->_mediaType, v52);
  }

  else
  {
    id v53 = *p_mediaType;
    id v52 = *p_mediaType;
    id *p_mediaType = v53;
  }

  if (v74)
  {
    id v54 = -[NSNumber copy](v79, "copy");
    objc_storeStrong(v51 + 13, v54);
  }

  else
  {
    id v55 = v51[13];
    id v54 = v51[13];
    v51[13] = v55;
  }

  BOOL v56 = a4 == 1;
  if (v92) {
    BOOL v56 = *p_playing;
  }
  *p_BOOL playing = v56;
  if (v91)
  {
    id v57 = -[NSNumber copy](v80, "copy");
    objc_storeStrong(v51 + 5, v57);
  }

  else
  {
    id v58 = v51[5];
    id v57 = v51[5];
    v51[5] = v58;
  }

  if (v85)
  {
    id v59 = [v76 copy];
    objc_storeStrong(v51 + 6, v59);
  }

  else
  {
    id v60 = v51[6];
    id v59 = v51[6];
    v51[6] = v60;
  }

  int v61 = v39;
  if (playingMusic == v39) {
    int v61 = v25->_playingMusic;
  }
  v25->_int playingMusic = v61 != 0;
  unsigned int v62 = v94;
  if (isMusicAppPlaying == v94) {
    unsigned int v62 = v25->_isMusicAppPlaying;
  }
  v25->_int isMusicAppPlaying = v62 != 0;
  unsigned int v63 = v86;
  if (isPodcastsAppPlaying == v86) {
    unsigned int v63 = v25->_isPodcastsAppPlaying;
  }
  v25->_int isPodcastsAppPlaying = v63 != 0;
  if (nowPlayingProcessPID == v96) {
    unsigned int v77 = v25->_nowPlayingProcessPID;
  }
  v25->_int nowPlayingProcessPID = v77;
  id v64 = v49;
  if (v93) {
    id v64 = *location;
  }
  objc_storeStrong(location, v64);
  nowPlayingPlayerPath = (MRPlayerPath *)v88;
  if (v82) {
    nowPlayingPlayerPath = v25->_nowPlayingPlayerPath;
  }
  objc_storeStrong((id *)&v25->_nowPlayingPlayerPath, nowPlayingPlayerPath);
  objc_sync_exit(v51);

  if (!v92) {
    [v51 didChangeValueForKey:@"playing"];
  }
  if (v91) {
    [v51 didChangeValueForKey:@"playbackRate"];
  }
  if (v85) {
    [v51 didChangeValueForKey:@"defaultPlaybackRate"];
  }
  if (playingMusic != v39) {
    [v51 didChangeValueForKey:@"playingMusic"];
  }
  if (nowPlayingProcessPID != v96) {
    [v51 didChangeValueForKey:@"nowPlayingProcessPID"];
  }
  if ((v93 & 1) == 0) {
    [v51 didChangeValueForKey:@"nowPlayingApplicationInfo"];
  }
  if (isMusicAppPlaying != v94) {
    [v51 didChangeValueForKey:@"isMusicAppPlaying"];
  }
  if (isPodcastsAppPlaying != v86) {
    [v51 didChangeValueForKey:@"isPodcastsAppPlaying"];
  }
  if ((v82 & 1) == 0) {
    [v51 didChangeValueForKey:@"nowPlayingPlayerPath"];
  }
  id WeakRetained = objc_loadWeakRetained(v51 + 12);
  v67 = WeakRetained;
  if (nowPlayingProcessPID != v96) {
    [WeakRetained mediaRemoteObserverNowPlayingAppDidChange:v51];
  }
  if (v97) {
    BOOL v68 = 0;
  }
  else {
    BOOL v68 = playingMusic == v39;
  }
  int v69 = !v68 || !v92;
  if ((v69 | v91) == 1) {
    [v67 mediaRemoteObserverNowPlayingPlayingOrInfoOrRateDidChange:v51];
  }
  int v70 = playingMusic != v39 || !v92;
  if (v70 == 1)
  {
    [v67 mediaRemoteObserverIsPlayingDidChange:v51];
    if (a4)
    {
      if (a4 != 5) {
        [v51 _notifyAttentionMonitorPlaybackStateChanged];
      }
    }
  }

  if (playingMusic == v39) {
    int v71 = v74;
  }
  else {
    int v71 = 1;
  }
  if (v89
    && v97
    && v39
    && v71
    && [v67 mediaRemoteObserverShouldShowTrackChangeBulletin:v51]
    && ([v51[18] isActive] & 1) == 0)
  {
    [v51 _presentTrackChangeBulletinWithInfo:v97];
  }
}

- (void)_updateSupportedPlaybackRates:(id)a3
{
  id v4 = (PBPlaybackRateList *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(&OBJC_CLASS___PBPlaybackRateList);
  }
  NSInteger v5 = self;
  objc_sync_enter(v5);
  char v6 = BSEqualObjects(v5->_supportedPlaybackRates, v4);
  objc_sync_exit(v5);

  if ((v6 & 1) == 0)
  {
    id v7 = sub_100083474();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10028A914((uint64_t)v4, v8);
    }

    -[PBMediaRemoteObserver willChangeValueForKey:](v5, "willChangeValueForKey:", @"supportedPlaybackRates");
    objc_storeStrong((id *)&v5->_supportedPlaybackRates, v4);
    -[PBMediaRemoteObserver didChangeValueForKey:](v5, "didChangeValueForKey:", @"supportedPlaybackRates");
  }
}

- (void)_updatePictureInPictureStateWithActivePlayerPath:(id)a3
{
  id v5 = a3;
  id v6 = sub_100083474();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    *(void *)int v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Evaluating pip playerPath: %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteObserver pictureInPicturePlayerPath](self, "pictureInPicturePlayerPath"));
  id v9 = v5;
  int v10 = BSEqualObjects(v8, v9);
  id v11 = sub_100083474();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109634;
    *(_DWORD *)int v14 = v10 ^ 1;
    *(_WORD *)&v14[4] = 2114;
    *(void *)&v14[6] = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Picture in picture path changed: %d, old: %{public}@, new: %{public}@",  (uint8_t *)&v13,  0x1Cu);
  }

  if ((v10 & 1) == 0)
  {
    -[PBMediaRemoteObserver willChangeValueForKey:](self, "willChangeValueForKey:", @"pictureInPicturePlayerPath");
    objc_storeStrong((id *)&self->_pictureInPicturePlayerPath, a3);
    -[PBMediaRemoteObserver didChangeValueForKey:](self, "didChangeValueForKey:", @"pictureInPicturePlayerPath");
  }
}

- (void)_notifyAttentionMonitorPlaybackStateChanged
{
}

+ (id)_bulletinInfoForNowPlayingInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoTitle));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoArtist));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoAlbum));
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v8 = sub_1001C307C(@"NowPlayingTitleFormat", 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v9, v5, v6));

    goto LABEL_9;
  }

  if ([v5 length])
  {
    id v11 = v5;
LABEL_8:
    id v10 = [v11 copy];
    goto LABEL_9;
  }

  if ([v6 length])
  {
    id v11 = v6;
    goto LABEL_8;
  }

  id v10 = 0LL;
LABEL_9:
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  PBSSystemBulletinTitleKey);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dataForKey:", kMRMediaRemoteNowPlayingInfoArtworkData));
  int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoArtworkURL));
  if ([v12 length])
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v12,  PBSSystemBulletinImageDataKey);
  }

  else if (v13)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v13,  PBSSystemBulletinImageURLKey);
    id v14 = PBSSystemBulletinImageIDMusic;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", kMRMediaRemoteNowPlayingInfoMediaType));
    if ([v15 isEqual:kMRMediaRemoteMediaTypePodcast])
    {
      id v17 = PBSSystemBulletinImageIDPodcast;

      id v14 = v17;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  PBSSystemBulletinImageURLPlaceholderKey);
  }

  return v4;
}

+ (id)_allAudioMediaTypes
{
  if (qword_100471268 != -1) {
    dispatch_once(&qword_100471268, &stru_1003DAF68);
  }
  return (id)qword_100471260;
}

- (PBMediaRemoteObserverDelegate)delegate
{
  return (PBMediaRemoteObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)trackIdentifier
{
  return self->_trackIdentifier;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (PBMRMetadataUpdateTransaction)metadataUpdateTransaction
{
  return self->_metadataUpdateTransaction;
}

- (PBMRPictureInPicturePlayerTransaction)pictureInPicturePlayerTransaction
{
  return self->_pictureInPicturePlayerTransaction;
}

- (PBMRSupportedCommandsTransaction)supportedCommandsTransaction
{
  return self->_supportedCommandsTransaction;
}

- (PBDistributedAssertion)suppressNowPlayingBulletinAssertion
{
  return self->_suppressNowPlayingBulletinAssertion;
}

- (void).cxx_destruct
{
}

@end