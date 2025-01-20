@interface MTPlayerController
+ (BOOL)hasDefaultInstance;
+ (MTPlayerController)defaultInstance;
+ (id)_activityRestorationPath;
+ (id)_loadActivityForRestoration;
+ (void)setDefaultInstance:(id)a3;
- (BOOL)_openExternalItemIfNeededForManifest:(id)a3;
- (BOOL)_promptToClearUpNextIfNeededForRequest:(id)a3;
- (BOOL)_shouldOpenExternalItemForEpisode:(id)a3;
- (BOOL)hasReportedThisEpisode;
- (BOOL)isLicenseKeyExpiredError:(id)a3;
- (BOOL)isLicenseKeyIntegrityError:(id)a3;
- (BOOL)isManifestRestorationOngoing;
- (BOOL)isPlayerManifestRestored;
- (BOOL)isPlayerTargetLocal;
- (BOOL)isPlayingEpisodeUuid:(id)a3;
- (BOOL)isPlayingFullScreenVideo;
- (BOOL)isPlayingLocally;
- (BOOL)isSeekingOrScrubbing;
- (BOOL)pauseLocalPlayerWithInitiator:(unint64_t)a3;
- (BOOL)playWithContext:(id)a3;
- (BOOL)playWithReason:(unint64_t)a3;
- (BOOL)playWithReason:(unint64_t)a3 interruptEvent:(BOOL)a4;
- (BOOL)shouldFindSomethingToPlay;
- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4;
- (BOOL)updateEpisode:(id)a3 andPlayerItem:(id)a4 withElapsedTime:(double)a5 andDuration:(double)a6 onMediaItemWillChange:(BOOL)a7;
- (BOOL)volumeControlAvailable;
- (IMAVPlayer)player;
- (MPCPlayerPath)playerPath;
- (MTCompositeManifest)compositeManifest;
- (MTCoreDataKeyRequestStorage)keyStorage;
- (MTMediaRemoteController)mediaRemoteController;
- (MTNowPlayingArtworkProvider)artworkProvider;
- (MTPlaybackPositionController)playbackPositionController;
- (MTPlaybackQueueController)playbackQueueController;
- (MTPlayerController)init;
- (MTPlayerController)initWithPlayer:(id)a3;
- (MTPlayerFailureDialogProxy)dialogProxy;
- (MTPlayerManifest)userManifest;
- (MTPropertyChangeQueryObserver)transcriptIdentifierObserver;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (MTUpNextController)upNextController;
- (MTUpNextManifest)upNextManifest;
- (NSMutableArray)restorationCompletions;
- (NSMutableSet)recordedPlayEventsForCurrentItem;
- (NSString)previousPlayingEpisodeUuid;
- (NSTimer)setPlaybackQueueRequestTimeoutTimer;
- (NSURL)lastRecordedItemURL;
- (NSUserActivity)currentActivity;
- (OS_dispatch_queue)dataAccessQueue;
- (OS_dispatch_queue)loadQueue;
- (OS_dispatch_queue)restorationQueue;
- (PFFairPlayInvalidationManager)invalidationManager;
- (PFFairPlayValidationManager)validationManager;
- (double)currentTime;
- (double)lastPlaybackPositionSaveTime;
- (double)lastPlaybackSaveTime;
- (double)metricsPlayStartPosition;
- (id)_alertControllerForClearingOrKeepingUpNextWithRequest:(id)a3;
- (id)_currentEpisodeForManifest:(id)a3;
- (id)copy;
- (id)currentItem;
- (id)platformSyncPlayheadChangeObserverBlock;
- (id)playingEpisodeUuid;
- (int64_t)_validatePlaybackRequest:(id)a3;
- (int64_t)metricsPlayStartTime;
- (void)_currentActivityBecomeCurrent;
- (void)_invokeRestorationCompletions;
- (void)_localPlayerPath;
- (void)_onQueueRestorePlayerManifestWithCompletion:(id)a3;
- (void)_performAfterPlay:(id)a3 playbackStarted:(BOOL)a4;
- (void)_performMediaRemoteCommand:(unsigned int)a3;
- (void)_performMediaRemoteCommand:(unsigned int)a3 options:(id)a4;
- (void)_recordMetricsForItemDidChange;
- (void)_restoreDefaultManifestIfNeededWithCompletion:(id)a3;
- (void)_restoreEmptyManifestIfNeededWithCompletion:(id)a3;
- (void)_restoreManifestIfNeededWithCompletion:(id)a3 useEmptyManifest:(BOOL)a4;
- (void)_saveActivityForRestoration;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4 options:(id)a5;
- (void)_setLocalPlaybackQueue:(id)a3;
- (void)_setPlaybackQueue:(id)a3;
- (void)_showGenericPromptToClearUpNextWithRequest:(id)a3;
- (void)_updateCurrentActivityForPlayState;
- (void)attemptToRecoverFromKeyError:(id)a3;
- (void)beginObservingTranscriptIdentifierChangesForCurrentItem:(id)a3;
- (void)clearPlayerManifestWithCompletion:(id)a3;
- (void)currentItemDidChange;
- (void)currentItemWillChange:(id)a3;
- (void)dealloc;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)openExternalEpisode:(id)a3;
- (void)pauseLocalPlayer;
- (void)pausePlayerTarget;
- (void)pausePlayerTargetWithInitiator:(unint64_t)a3;
- (void)playItemAtIndex:(unint64_t)a3;
- (void)playLocalPlayer;
- (void)playManifest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)playManifest:(id)a3 reason:(unint64_t)a4;
- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 presentationType:(unint64_t)a6 completion:(id)a7;
- (void)playPlayerTarget;
- (void)playWithContext:(id)a3 completion:(id)a4;
- (void)playbackStateDidChange:(id)a3;
- (void)player:(id)a3 didStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)player:(id)a3 failedToStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)player:(id)a3 willStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)playerErrorDidOccur:(id)a3;
- (void)playerFailedToPlayToEndTime:(id)a3;
- (void)playerFailure:(id)a3 shouldShowDialog:(BOOL)a4;
- (void)playerHeadWillChange:(id)a3;
- (void)playerPeriodicUpdate;
- (void)presentNowPlayingAnimated:(BOOL)a3;
- (void)recordMTPlayerMetricsForCurrentItemWithCurrentTime:(double)a3;
- (void)recordMetricsEventForAccessLog:(id)a3 playerItem:(id)a4;
- (void)recordMetricsEventForErrorLog:(id)a3 withEpisode:(id)a4;
- (void)recordMetricsForCurrentItem;
- (void)resolveActivePlayerPathWithCompletion:(id)a3;
- (void)restoreFromUserActivity:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7;
- (void)restoreFromUserActivity:(id)a3 withManifest:(id)a4 startPlayback:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
- (void)restorePlayerManifestWithCompletion:(id)a3;
- (void)seekToTime:(double)a3;
- (void)setArtworkProvider:(id)a3;
- (void)setCompositeManifest:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDataAccessQueue:(id)a3;
- (void)setDialogProxy:(id)a3;
- (void)setHasReportedThisEpisode:(BOOL)a3;
- (void)setInvalidationManager:(id)a3;
- (void)setIsManifestRestorationOngoing:(BOOL)a3;
- (void)setIsPlayingFullScreenVideo:(BOOL)a3;
- (void)setKeyStorage:(id)a3;
- (void)setLastPlaybackPositionSaveTime:(double)a3;
- (void)setLastPlaybackSaveTime:(double)a3;
- (void)setLastRecordedItemURL:(id)a3;
- (void)setLoadQueue:(id)a3;
- (void)setManifest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)setManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 context:(id)a5 completion:(id)a6;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 destination:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 context:(id)a6 completion:(id)a7;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7;
- (void)setManifestAsDryRun:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)setMediaRemoteController:(id)a3;
- (void)setMetricsPlayStartPosition:(double)a3;
- (void)setMetricsPlayStartTime:(int64_t)a3;
- (void)setPlatformSyncPlayheadChangeObserverBlock:(id)a3;
- (void)setPlaybackPositionController:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerManifestRestored:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPreviousPlayingEpisodeUuid:(id)a3;
- (void)setRecordedPlayEventsForCurrentItem:(id)a3;
- (void)setRestorationCompletions:(id)a3;
- (void)setRestorationQueue:(id)a3;
- (void)setSecureDownloadRenewalManager:(id)a3;
- (void)setSetPlaybackQueueRequestTimeoutTimer:(id)a3;
- (void)setShouldFindSomethingToPlay:(BOOL)a3;
- (void)setTranscriptIdentifierObserver:(id)a3;
- (void)setUpNextController:(id)a3;
- (void)setUpNextManifest:(id)a3;
- (void)setUserManifest:(id)a3;
- (void)setValidationManager:(id)a3;
- (void)setupPlayerNotifications;
- (void)stopLocalPlayer;
- (void)stopLocalPlayerWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)stopPlayerTarget;
- (void)stopPlayerTargetWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)tearDownPlayerNotifications;
- (void)updateEpisodeForPlayerUpdateForceSave:(BOOL)a3;
- (void)updateUPPEpisodeUuid:(id)a3 bookmarkTime:(double)a4;
- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
@end

@implementation MTPlayerController

+ (BOOL)hasDefaultInstance
{
  return qword_1002B6B80 != 0;
}

+ (MTPlayerController)defaultInstance
{
  if (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
    unsigned int v3 = [v2 isMultiplayerHost];

    if (v3)
    {
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMLogCategory player](&OBJC_CLASS___IMLogCategory, "player"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "HomePod attempted to access the shared player controller",  v6,  2u);
      }
    }
  }

  return (MTPlayerController *)(id)qword_1002B6B80;
}

+ (void)setDefaultInstance:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&qword_1002B6B80, a3);
  id v4 = +[MTHandoffController sharedInstance](&OBJC_CLASS___MTHandoffController, "sharedInstance");
  id v5 = +[MTProcessorManager sharedInstance](&OBJC_CLASS___MTProcessorManager, "sharedInstance");
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
}

- (MTPlayerController)init
{
  return -[MTPlayerController initWithPlayer:](self, "initWithPlayer:", 0LL);
}

- (MTPlayerController)initWithPlayer:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MTPlayerController;
  id v5 = -[MTPlayerController init](&v30, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v5 selector:"_updateCurrentActivityForPlayState" name:MTApplicationDidEnterBackgroundNotification object:0];
    [v6 addObserver:v5 selector:"_updateCurrentActivityForPlayState" name:MTApplicationDidBecomeActiveNotification object:0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[MTPlayerController setRecordedPlayEventsForCurrentItem:](v5, "setRecordedPlayEventsForCurrentItem:", v7);

    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTEpisodeManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTPodcastManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTPlaylistManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTUnplayedManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTStoreManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTListenNowManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTSwiftEpisodeListManifest));
    +[IMPlayerManifest registerManifestForRestoration:]( &OBJC_CLASS___IMPlayerManifest,  "registerManifestForRestoration:",  objc_opt_class(&OBJC_CLASS___MTNetworkMediaManifest));
    if (v4)
    {
      -[MTPlayerController setPlayer:](v5, "setPlayer:", v4);
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
      -[MTPlayerController setPlayer:](v5, "setPlayer:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](v5, "player"));
    [v9 setCausalityObserver:v5];

    v10 = -[MTUpNextController initWithPlayerController:]( objc_alloc(&OBJC_CLASS___MTUpNextController),  "initWithPlayerController:",  v5);
    -[MTPlayerController setUpNextController:](v5, "setUpNextController:", v10);

    v11 = -[MTUpNextManifest initWithPlayerController:]( objc_alloc(&OBJC_CLASS___MTUpNextManifest),  "initWithPlayerController:",  v5);
    -[MTPlayerController setUpNextManifest:](v5, "setUpNextManifest:", v11);

    v12 = -[MTPlaybackQueueController initWithPlayerController:]( objc_alloc(&OBJC_CLASS___MTPlaybackQueueController),  "initWithPlayerController:",  v5);
    -[MTPlayerController setPlaybackQueueController:](v5, "setPlaybackQueueController:", v12);

    if ((os_feature_enabled_bluemoon(v13) & 1) == 0)
    {
      v14 = -[MTMediaRemoteController initWithPlayerController:]( objc_alloc(&OBJC_CLASS___MTMediaRemoteController),  "initWithPlayerController:",  v5);
      -[MTPlayerController setMediaRemoteController:](v5, "setMediaRemoteController:", v14);
    }

    if (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
    {
      v15 = objc_alloc_init(&OBJC_CLASS___MTPlaybackPositionController);
      -[MTPlayerController setPlaybackPositionController:](v5, "setPlaybackPositionController:", v15);
    }

    -[MTPlayerController setLastPlaybackSaveTime:](v5, "setLastPlaybackSaveTime:", CFAbsoluteTimeGetCurrent());
    -[MTPlayerController setupPlayerNotifications](v5, "setupPlayerNotifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[MTPlayerController setRestorationCompletions:](v5, "setRestorationCompletions:", v16);

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("MTPlayerController-RestorePlayerManifest", v18);
    -[MTPlayerController setRestorationQueue:](v5, "setRestorationQueue:", v19);

    dispatch_queue_t v20 = dispatch_queue_create( "com.apple.podcasts.MTPlayerController.dataAccessQueue",  &_dispatch_queue_attr_concurrent);
    -[MTPlayerController setDataAccessQueue:](v5, "setDataAccessQueue:", v20);

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.podcasts.compositeManifest.loadingQueue", 0LL);
    -[MTPlayerController setLoadQueue:](v5, "setLoadQueue:", v21);

    -[MTPlayerController setIsManifestRestorationOngoing:](v5, "setIsManifestRestorationOngoing:", 0LL);
    v22 = objc_opt_new(&OBJC_CLASS___MTCoreDataKeyRequestStorage);
    -[MTPlayerController setKeyStorage:](v5, "setKeyStorage:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 secureDownloadRenewalManager]);
    -[MTPlayerController setSecureDownloadRenewalManager:](v5, "setSecureDownloadRenewalManager:", v24);

    v25 = objc_alloc(&OBJC_CLASS___PFFairPlayValidationManager);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    v27 = -[PFFairPlayValidationManager initWithEpisodeRemovalManager:](v25, "initWithEpisodeRemovalManager:", v26);
    -[MTPlayerController setValidationManager:](v5, "setValidationManager:", v27);

    v28 = objc_opt_new(&OBJC_CLASS___PFFairPlayInvalidationManager);
    -[MTPlayerController setInvalidationManager:](v5, "setInvalidationManager:", v28);

    v5->_shouldFindSomethingToPlay = 1;
  }

  return v5;
}

- (void)dealloc
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[MTPlayerController tearDownPlayerNotifications](self, "tearDownPlayerNotifications");
  -[MTPropertyChangeQueryObserver stop](self->_transcriptIdentifierObserver, "stop");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPlayerController;
  -[MTPlayerController dealloc](&v4, "dealloc");
}

- (void)setupPlayerNotifications
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v3 = IMAVPlayerNotification_MediaItemWillChange;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"currentItemWillChange:" name:v3 object:v4];

  uint64_t v5 = IMAVPlayerNotification_MediaItemDidChange;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"currentItemDidChange" name:v5 object:v6];

  uint64_t v7 = IMAVPlayerNotification_StateDidChange;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"playbackStateDidChange:" name:v7 object:v8];

  uint64_t v9 = IMAVPlayerNotification_PeriodicUpdate;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"playerPeriodicUpdate" name:v9 object:v10];

  uint64_t v11 = IMAVPlayerNotification_ErrorDidOccur;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"playerErrorDidOccur:" name:v11 object:v12];

  uint64_t v13 = IMAVPlayerNotification_FailedToPlayToEndTime;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"playerFailedToPlayToEndTime:" name:v13 object:v14];

  uint64_t v15 = IMAVPlayerNotification_PlayerHeadWillChange;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v17 addObserver:self selector:"playerHeadWillChange:" name:v15 object:v16];
}

- (void)tearDownPlayerNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)playerErrorDidOccur:(id)a3
{
}

- (void)attemptToRecoverFromKeyError:(id)a3
{
  id v4 = a3;
  +[PFBugReporterBridge reportKeyIntegrityError]( &OBJC_CLASS____TtC18PodcastsFoundation19PFBugReporterBridge,  "reportKeyIntegrityError");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFFairPlayRolloutController sharedInstance]( &OBJC_CLASS___PFFairPlayRolloutController,  "sharedInstance"));
  unsigned int v8 = [v7 isEnabled];

  if (v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS___PFFairPlayAsset);
    id v10 = [v6 episodeStoreId];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
    id v12 = [v9 initWithAdamID:v10 avAsset:v11];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController invalidationManager](self, "invalidationManager"));
    id v14 = [v13 removeKeyFor:v12];

    objc_initWeak(&location, self);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController invalidationManager](self, "invalidationManager"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000ED2AC;
    v20[3] = &unk_1002447D0;
    objc_copyWeak(&v21, &location);
    [v15 removalAllFairPlayKeysWithCompletion:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController keyStorage](self, "keyStorage"));
    objc_msgSend(v16, "removeKeyDataForStoreTrackID:", objc_msgSend(v6, "episodeStoreId"));

    objc_initWeak(&location, self);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController keyStorage](self, "keyStorage"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000ED3A4;
    v18[3] = &unk_100244058;
    objc_copyWeak(&v19, &location);
    [v17 removeAllKeyDataWithCompletion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)playerFailedToPlayToEndTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IMAVPlayerNotificationKey_Error]);

  -[MTPlayerController playerFailure:shouldShowDialog:]( self,  "playerFailure:shouldShowDialog:",  v4,  [v6 code] == (id)-11870);
}

- (BOOL)isLicenseKeyExpiredError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-42800)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v5 = [v4 isEqualToString:@"CoreMediaErrorDomain"];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isLicenseKeyIntegrityError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-42803)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v5 = [v4 isEqualToString:@"CoreMediaErrorDomain"];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)playerFailure:(id)a3 shouldShowDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v46 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v46 userInfo]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IMAVPlayerNotificationKey_Error]);

  [v47 recordMetrics];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  -[MTPlayerController player:willStopWithReason:initiator:]( self,  "player:willStopWithReason:initiator:",  v6,  10LL,  2LL);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  -[MTPlayerController player:didStopWithReason:initiator:](self, "player:didStopWithReason:initiator:", v7, 10LL, 2LL);

  unsigned int v8 = v47;
  if ([v47 code] != (id)-11819)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v9 currentItem]);

    uint64_t v12 = _MTLogCategoryPlayback(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v45 episode]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = (uint64_t)v15;
      __int16 v58 = 2112;
      v59 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Player failure for episode with uuid %@ with error %@",  buf,  0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v46 userInfo]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:IMAVPlayerNotificationKey_PlaybackInterrupted]);
    unsigned int v18 = [v17 BOOLValue];

    if ((v4 & v18) == 1)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v45 episode]);
      uint64_t v20 = (uint64_t)[v19 reasonForNotPlayable];

      uint64_t v23 = _MTLogCategoryPlayback(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v45 episode]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uuid]);
        *(_DWORD *)buf = 134218242;
        uint64_t v57 = v20;
        __int16 v58 = 2112;
        v59 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Reason for player failure: %lu for episode with uuid %@",  buf,  0x16u);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v27 playerItem]);

      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v44 errorLog]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 events]);

      id v30 = [v29 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v52;
        do
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v52 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 errorDomain]);
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[MTStandardKeyRequestHandler keyRequestLicenseErrorDomain]( &OBJC_CLASS___MTStandardKeyRequestHandler,  "keyRequestLicenseErrorDomain"));
            unsigned int v36 = [v34 isEqualToString:v35];

            if (v36)
            {
              if ([v33 errorStatusCode] == (id)-1002)
              {
                uint64_t v20 = 8LL;
              }

              else if ([v33 errorStatusCode] == (id)-1004)
              {
                uint64_t v20 = 9LL;
              }

              else if ([v33 errorStatusCode] == (id)-1014)
              {
                uint64_t v20 = 10LL;
              }
            }
          }

          id v30 = [v29 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }

        while (v30);
      }

      if (-[MTPlayerController isLicenseKeyIntegrityError:](self, "isLicenseKeyIntegrityError:", v47)) {
        uint64_t v20 = 13LL;
      }
      if (!v20)
      {
        if ([v47 code] == (id)-11870)
        {
          uint64_t v20 = 6LL;
        }

        else if (-[MTPlayerController isLicenseKeyExpiredError:](self, "isLicenseKeyExpiredError:", v47))
        {
          uint64_t v20 = 8LL;
        }

        else if ([v47 code] == (id)-1009 || objc_msgSend(v47, "code") == (id)-1005)
        {
          uint64_t v20 = 2LL;
        }

        else
        {
          v37 = (NSString *)objc_claimAutoreleasedReturnValue([v47 domain]);
          if (v37 == NSURLErrorDomain) {
            uint64_t v20 = 4LL;
          }
          else {
            uint64_t v20 = 5LL;
          }
        }
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogProxy);
      BOOL v39 = WeakRetained == 0LL;

      if (v39)
      {
        objc_initWeak((id *)buf, self);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeUnavailableUtil sharedInstance]( &OBJC_CLASS___MTEpisodeUnavailableUtil,  "sharedInstance"));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v45 author]);
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_1000EDB64;
        v49[3] = &unk_1002447F8;
        v49[4] = self;
        objc_copyWeak(&v50, (id *)buf);
        [v42 showDialogForReason:v20 podcastTitle:v43 completion:v49];

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        id v40 = objc_loadWeakRetained((id *)&self->_dialogProxy);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v45 author]);
        [v40 proxyShouldShowDialogForReason:v20 podcastTitle:v41];
      }
    }

    unsigned int v8 = v47;
  }
}

- (void)currentItemWillChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "currentItemWillChange", buf, 2u);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldMediaItem]);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:IMAVPlayerNotificationKey_NewMediaItem]);

  if (v9)
  {
    [v9 playhead];
    uint64_t v13 = v12;
    [v9 duration];
    uint64_t v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mainQueueContext]);

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1000EE01C;
    v52[3] = &unk_100244820;
    id v53 = v17;
    id v18 = v9;
    id v54 = v18;
    v55 = self;
    uint64_t v56 = v13;
    uint64_t v57 = v15;
    id v19 = v17;
    [v19 performBlockAndWaitWithSave:v52];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 privateQueueContext]);

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1000EE188;
    v49[3] = &unk_100240240;
    id v50 = v21;
    id v51 = v18;
    id v22 = v21;
    [v22 performBlock:v49];
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 url]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v11 url]);
  if ([v23 isEqual:v24])
  {
    unsigned __int8 v25 = [v11 enqueuedByAnotherUser];

    if ((v25 & 1) == 0)
    {
      [v9 playhead];
      objc_msgSend(v11, "setPlayhead:");
    }
  }

  else
  {
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  unsigned int v27 = [v26 isPlaybackRequested];

  if (v27)
  {
    -[MTPlayerController recordMetricsForCurrentItem](self, "recordMetricsForCurrentItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:IMAVPlayerNotificationKey_CurrentPlayheadTime]);
    [v29 floatValue];
    double v31 = v30;

    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:]( self,  "recordMTPlayerMetricsForCurrentItemWithCurrentTime:",  v31);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  unsigned int v33 = [v32 BOOLForKey:kMTContinuousPlaybackEnabledKey];

  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:IMAVPlayerNotificationKey_DidSleepAtAssetEnd]);
  unsigned __int8 v36 = [v35 BOOLValue];

  unsigned __int8 v37 = 0;
  if (v33 && (v36 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    unsigned __int8 v37 = [v38 isPlaybackRequested];
  }

  if (v11)
  {
    id v39 = [v11 upgradeToAlternatePaidVersionIfNeeded];
    v41 = v44;
    if ((_DWORD)v39)
    {
      uint64_t v42 = _MTLogCategoryPlayback(v39, v40);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "We are upgrading the next item going into the player",  buf,  2u);
      }

      [v11 invalidateAsset];
    }
  }

  else
  {
    -[MTPlayerController shouldFindSomethingToPlay](self, "shouldFindSomethingToPlay");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EE1F4;
    block[3] = &unk_100241458;
    v41 = v44;
    id v46 = v44;
    v47 = self;
    unsigned __int8 v48 = v37;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (BOOL)updateEpisode:(id)a3 andPlayerItem:(id)a4 withElapsedTime:(double)a5 andDuration:(double)a6 onMediaItemWillChange:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  if (([v12 isPlaceholder] & 1) == 0
    && (!+[MTApplication localLibraryUpdatesDisabled](&OBJC_CLASS___MTApplication, "localLibraryUpdatesDisabled")
     || +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod")))
  {
    [v11 endOfTrack];
    double v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);

    if (v14 > a5 || !v7)
    {
      if ([v12 enqueuedByAnotherUser])
      {
        LOBYTE(v31) = 0;
LABEL_47:

        goto LABEL_48;
      }

      double v32 = kMTEpisodePlayheadCutoffForPartiallyPlayed;
      if (kMTEpisodePlayheadCutoffForPartiallyPlayed >= a5)
      {
        BOOL v31 = 0LL;
      }

      else
      {
        if (([v11 isUnplayed] & 1) != 0 || objc_msgSend(v11, "backCatalog"))
        {
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[PodcastsStateCoordinator shared]( &OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator,  "shared"));
          [v33 unsafeEpisodePlayedBeyondThresholdForFirstTime:v11 from:3];

          BOOL v31 = 1LL;
          objc_msgSend(v11, "setPlayState:manually:source:", 1, objc_msgSend(v11, "playStateManuallySet"), 9);
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          double v35 = v34;
          unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v11 podcast]);
          [v36 lastRemovedFromUpNextDate];
          double v38 = v35 - v37;

          if (v38 > v32)
          {
            id v39 = (void *)objc_claimAutoreleasedReturnValue([v11 podcast]);
            [v39 setLastRemovedFromUpNextDate:0.0];

            BOOL v31 = 1LL;
          }
        }

        else
        {
          BOOL v31 = 0LL;
        }

        if (!v11
          && (+[MTStoreIdentifier isEmpty:]( MTStoreIdentifier,  "isEmpty:",  [v12 episodeStoreId]) & 1) == 0 && (+[MTStoreIdentifier isEmpty:]( MTStoreIdentifier,  "isEmpty:",  objc_msgSend(v12, "podcastStoreId")) & 1) == 0 && (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
        {
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[PodcastsStateCoordinator shared]( &OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator,  "shared"));
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472LL;
          v65[2] = sub_1000EE9A8;
          v65[3] = &unk_1002448B8;
          id v66 = v12;
          v67 = self;
          [v40 insertNewImplicitFollowIfNeededForPlayerItem:v66 from:3 completion:v65];
        }
      }

      id v41 = [v11 playhead];
      if (vabdd_f64(a5, v43) > 0.2)
      {
        uint64_t v44 = _MTLogCategoryPlayback(v41, v42);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          uint64_t v46 = objc_claimAutoreleasedReturnValue([v11 uuid]);
          v47 = (void *)v46;
          unsigned __int8 v48 = @"unknown";
          if (v46) {
            unsigned __int8 v48 = (const __CFString *)v46;
          }
          *(_DWORD *)buf = 138412290;
          v69 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "Episode %@: Updating episode playhead and last date played",  buf,  0xCu);
        }

        *(float *)&double v49 = a5;
        [v11 setPlayhead:v49];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v11, "setLastDatePlayed:");
      }

      if (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
      {
        id v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
        unsigned int v51 = [v50 networkUPPEnabled];

        if (v51)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          -[MTPlayerController lastPlaybackPositionSaveTime](self, "lastPlaybackPositionSaveTime");
          double v54 = Current - v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v55 syncValueForKey:kBagKeyUPPSyncInterval]);
          [v56 doubleValue];
          BOOL v58 = v54 <= v57;

          if (!v58 || !~v31)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackPositionController](self, "playbackPositionController"));
            id v60 = [v12 episodeStoreId];
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472LL;
            v63[2] = sub_1000EEC5C;
            v63[3] = &unk_100241DB0;
            id v64 = v12;
            [v59 updatePlaybackPositionWithEpisodeStoreId:v60 completed:0 position:v16 account:v63 completion:a5];

            -[MTPlayerController setLastPlaybackPositionSaveTime:]( self,  "setLastPlaybackPositionSaveTime:",  CFAbsoluteTimeGetCurrent());
          }
        }
      }

      platformSyncPlayheadChangeObserverBlock = (void (**)(id, void *, BOOL))self->_platformSyncPlayheadChangeObserverBlock;
      if (!platformSyncPlayheadChangeObserverBlock) {
        goto LABEL_47;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
      platformSyncPlayheadChangeObserverBlock[2](platformSyncPlayheadChangeObserverBlock, v23, v31);
LABEL_46:

      goto LABEL_47;
    }

    uint64_t v19 = _MTLogCategoryPlayback(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 title]);
      *(_DWORD *)buf = 138412802;
      v69 = v21;
      __int16 v70 = 2048;
      double v71 = a5;
      __int16 v72 = 2048;
      double v73 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Marking episode %@ as played with elapsed time %f and endOfTrack time %f",  buf,  0x20u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
    uint64_t v23 = v22;
    if (v12) {
      [v22 setObject:v12 forKey:@"MTPlayerControllerEpisodeKey"];
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v24 postNotificationName:@"MTPlayerControllerNotification_EpisodeMarkedAsPlayed" object:self userInfo:v23];

    LODWORD(v25) = 0;
    [v11 setPlayhead:v25];
    [v12 setPlayhead:0.0];
    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 contentItem]);
    LODWORD(v27) = 0;
    [v26 setElapsedTime:0.0 playbackRate:v27];

    if (([v12 enqueuedByAnotherUser] & 1) == 0)
    {
      if (v11
        && (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod") & 1) == 0)
      {
        [v11 setPlayed:1 manually:0 source:9];
        float v30 = (void *)objc_claimAutoreleasedReturnValue([v11 podcast]);
        [v30 updateCursorPosition:0];
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
        unsigned int v29 = [v28 networkUPPEnabled];

        if (!v29) {
          goto LABEL_27;
        }
        float v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackPositionController](self, "playbackPositionController"));
        objc_msgSend( v30,  "updatePlaybackPositionWithEpisodeStoreId:completed:position:account:completion:",  objc_msgSend(v12, "episodeStoreId"),  1,  v16,  &stru_100244868,  0.0);
      }
    }

- (void)beginObservingTranscriptIdentifierChangesForCurrentItem:(id)a3
{
  id v4 = a3;
  -[MTPropertyChangeQueryObserver stop](self->_transcriptIdentifierObserver, "stop");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeUuid]);
  if ([v5 length])
  {
    unsigned __int8 v6 = [v4 isPlaceholder];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = objc_alloc(&OBJC_CLASS___MTPropertyChangeQueryObserver);
      uint64_t v8 = kMTEpisodeEntityName;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeUuid]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuid:", v9));
      id v11 = -[MTPropertyChangeQueryObserver initWithEntityName:predicate:](v7, "initWithEntityName:predicate:", v8, v10);
      transcriptIdentifierObserver = self->_transcriptIdentifierObserver;
      self->_transcriptIdentifierObserver = v11;

      uint64_t v18 = kEpisodeTranscriptIdentifier;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      -[MTPropertyChangeQueryObserver setPropertyKeys:](self->_transcriptIdentifierObserver, "setPropertyKeys:", v13);

      double v14 = self->_transcriptIdentifierObserver;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000EEF04;
      v16[3] = &unk_100240D18;
      id v17 = v4;
      id v15 = -[MTPropertyChangeQueryObserver addResultsChangedHandler:](v14, "addResultsChangedHandler:", v16);
      -[MTPropertyChangeQueryObserver startObserving](self->_transcriptIdentifierObserver, "startObserving");
    }
  }

  else
  {
  }
}

- (void)player:(id)a3 willStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v7 = _MTLogCategoryPlayback(self, a2);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSPersistentStringFromMTStopReason(a4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412546;
    double v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Will stop player (reason: %@, initiator: %@)",  (uint8_t *)&v13,  0x16u);
  }
}

- (void)player:(id)a3 didStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v7 = _MTLogCategoryPlayback(self, a2);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSPersistentStringFromMTStopReason(a4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412546;
    double v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Did stop player (reason: %@, initiator: %@)",  (uint8_t *)&v13,  0x16u);
  }
}

- (void)player:(id)a3 failedToStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v7 = _MTLogCategoryPlayback(self, a2);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSPersistentStringFromMTStopReason(a4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412546;
    double v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Failed to stop player (reason: %@, initiator: %@)",  (uint8_t *)&v13,  0x16u);
  }
}

- (void)currentItemDidChange
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EF420;
  v7[3] = &unk_10023FF98;
  v7[4] = self;
  +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v7);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSince1970];
  -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v4 * 1000.0));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v5 currentTime];
  -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

  -[MTPlayerController _recordMetricsForItemDidChange](self, "_recordMetricsForItemDidChange");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  -[MTPlayerController beginObservingTranscriptIdentifierChangesForCurrentItem:]( self,  "beginObservingTranscriptIdentifierChangesForCurrentItem:",  v6);

  -[MTPlayerController setHasReportedThisEpisode:](self, "setHasReportedThisEpisode:", 0LL);
}

- (void)playerHeadWillChange:(id)a3
{
  id v18 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IMAVPlayerNotificationKey_FromMediaRemote]);
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  LODWORD(v5) = [v7 isPlaybackActive];

  if ((_DWORD)v5 && v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IMAVPlayerNotificationKey_NewPlayheadTime]);
    [v9 floatValue];
    double v11 = v10;

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldPlayheadTime]);
    [v13 floatValue];
    double v15 = v14;

    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:]( self,  "recordMTPlayerMetricsForCurrentItemWithCurrentTime:",  v15);
    -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSince1970];
    -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v17 * 1000.0));
  }
}

- (void)playerPeriodicUpdate
{
  uint64_t v3 = _MTLogCategoryPlayback(self, a2);
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "playerPeriodicUpdate", v5, 2u);
  }

  -[MTPlayerController updateEpisodeForPlayerUpdateForceSave:]( self,  "updateEpisodeForPlayerUpdateForceSave:",  -[MTPlayerController isPlayingLocally](self, "isPlayingLocally") ^ 1);
}

- (void)updateEpisodeForPlayerUpdateForceSave:(BOOL)a3
{
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  unsigned __int8 v5 = [v21 isPlaceholder];
  unsigned int v6 = v21;
  if ((v5 & 1) == 0)
  {
    unsigned int v7 = -[MTPlayerController isPlayingLocally](self, "isPlayingLocally");
    unsigned __int8 v8 = -[MTPlayerController isSeekingOrScrubbing](self, "isSeekingOrScrubbing");
    -[MTPlayerController currentTime](self, "currentTime");
    double v10 = v9;
    [v21 duration];
    unsigned int v6 = v21;
    if (v21)
    {
      if ((v8 & 1) == 0)
      {
        double v12 = v11;
        if (v7)
        {
          if (!-[MTPlayerController hasReportedThisEpisode](self, "hasReportedThisEpisode"))
          {
            int v13 = (void *)objc_claimAutoreleasedReturnValue([v21 storeReportingParams]);

            if (v13)
            {
              -[MTPlayerController setHasReportedThisEpisode:](self, "setHasReportedThisEpisode:", 1LL);
              float v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreReportingController sharedInstance]( &OBJC_CLASS___MTStoreReportingController,  "sharedInstance"));
              double v15 = (void *)objc_claimAutoreleasedReturnValue([v21 storeReportingParams]);
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
              objc_msgSend(v14, "reportPlaybackFromStore:reason:", v15, objc_msgSend(v16, "playReason"));
            }
          }
        }

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v21 episodeUuid]);
        if ([v17 length])
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 mainOrPrivateContext]);

          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_1000EF858;
          v22[3] = &unk_100244370;
          BOOL v29 = a3;
          id v23 = v19;
          id v24 = v21;
          char v30 = v7;
          id v25 = v17;
          v26 = self;
          double v27 = v10;
          double v28 = v12;
          id v20 = v19;
          [v20 performBlockAndWait:v22];
        }

        else
        {
          -[MTPlayerController updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:]( self,  "updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:",  0LL,  v21,  0LL,  v10,  v12);
        }

        unsigned int v6 = v21;
      }
    }
  }
}

- (void)playbackStateDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MTLogCategoryPlayback(v4, v5);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "playbackStateDidChange", buf, 2u);
  }

  if (!-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
    unsigned int v9 = [v8 userActivityContainsPlayhead];

    if (v9) {
      -[MTPlayerController _saveActivityForRestoration](self, "_saveActivityForRestoration");
    }
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](&OBJC_CLASS___MTUPPSyncProcessor, "sharedInstance"));
    [v10 playerPaused];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    if (v11)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldPlayheadTime]);
      [v13 floatValue];
      float v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:IMAVPlayerNotificationKey_CurrentPlayheadTime]);
      [v17 floatValue];
      float v19 = v18;

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      if ([v20 state] == (id)2) {
        float v21 = v15;
      }
      else {
        float v21 = v19;
      }
      double v22 = v21;

      -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:]( self,  "recordMTPlayerMetricsForCurrentItemWithCurrentTime:",  v22);
      -[MTPlayerController recordMetricsForCurrentItem](self, "recordMetricsForCurrentItem");
    }
  }

  -[MTPlayerController _updateCurrentActivityForPlayState](self, "_updateCurrentActivityForPlayState");
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mainOrPrivateContext]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  -[MTPlayerController updateEpisodeForPlayerUpdateForceSave:](self, "updateEpisodeForPlayerUpdateForceSave:", 1LL);
  unsigned __int8 v26 = -[MTPlayerController isPlayingLocally](self, "isPlayingLocally");
  if (v25)
  {
    if ((v26 & 1) != 0)
    {
      double v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      [v27 currentTime];
      -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

      double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v28 timeIntervalSince1970];
      -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v29 * 1000.0));

      double v38 = _NSConcreteStackBlock;
      char v30 = sub_1000EFE2C;
      BOOL v31 = &v38;
    }

    else
    {
      id v39 = _NSConcreteStackBlock;
      char v30 = sub_1000EFDC4;
      BOOL v31 = &v39;
    }

    v31[1] = (void **)3221225472LL;
    v31[2] = (void **)v30;
    v31[3] = (void **)&unk_100240240;
    double v32 = v24;
    v31[4] = v32;
    unsigned int v33 = v25;
    v31[5] = v33;
    [v32 performBlock:v31];

    if (-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
    {
      id v34 = [v33 upgradeToAlternatePaidVersionIfNeeded];
      if ((_DWORD)v34)
      {
        uint64_t v36 = _MTLogCategoryPlayback(v34, v35);
        double v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "We are upgrading the currently playing item after a pause/play",  buf,  2u);
        }

        -[MTPlayerController pauseLocalPlayer](self, "pauseLocalPlayer");
        [v33 invalidateAsset];
        [v33 setPlayhead:0.0];
        -[MTPlayerController playLocalPlayer](self, "playLocalPlayer");
      }
    }
  }
}

- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4
{
  if (a4 == 2) {
    return 1;
  }
  if (a4 == 1) {
    return [a3 isVideo];
  }
  return 0;
}

- (void)openExternalEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  uint64_t v6 = (void *)objc_opt_class(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EFF78;
  v8[3] = &unk_10023FF98;
  id v9 = v4;
  id v7 = v4;
  [v6 performOnMainQueue:v8];
}

- (BOOL)playWithReason:(unint64_t)a3
{
  return -[MTPlayerController playWithReason:interruptEvent:](self, "playWithReason:interruptEvent:", a3, 0LL);
}

- (BOOL)playWithReason:(unint64_t)a3 interruptEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](&OBJC_CLASS___MTPlaybackContext, "contextWithReason:", a3));
  [v6 setPresentationType:0];
  [v6 setInterruptEvent:v4];
  LOBYTE(v4) = -[MTPlayerController playWithContext:](self, "playWithContext:", v6);

  return v4;
}

- (BOOL)playWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  id v6 = [v5 play];

  -[MTPlayerController _performAfterPlay:playbackStarted:](self, "_performAfterPlay:playbackStarted:", v4, v6);
  return (char)v6;
}

- (void)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v6 stopWithReason:a3 initiator:a4];
}

- (void)playWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000F01B8;
  v11[3] = &unk_1002448E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "play:interruptionEvent:", v11, objc_msgSend(v10, "interruptEvent"));
}

- (void)_performAfterPlay:(id)a3 playbackStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 source];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  v16[0] = @"interactive";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isInteractive]));
  v16[1] = @"play_source";
  v17[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreReportingController reportingStringForPlayReason:]( &OBJC_CLASS___MTStoreReportingController,  "reportingStringForPlayReason:",  v7));
  v17[1] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  @"play",  v8,  v11);

  if (v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    unsigned int v13 = -[MTPlayerController shouldPresentNowPlayingForItem:presentationType:]( self,  "shouldPresentNowPlayingForItem:presentationType:",  v12,  [v6 presentationType]);

    if (v13)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000F03CC;
      v14[3] = &unk_100240240;
      v14[4] = self;
      id v15 = v6;
      +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v14);
    }
  }
}

- (void)playItemAtIndex:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  [v4 setCurrentIndex:a3];
}

- (BOOL)pauseLocalPlayerWithInitiator:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  LOBYTE(a3) = [v4 pauseWithInitiator:a3];

  return a3;
}

- (void)pauseLocalPlayer
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v2 pause];
}

- (void)pausePlayerTarget
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal")) {
    -[MTPlayerController pauseLocalPlayer](self, "pauseLocalPlayer");
  }
  else {
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 1LL);
  }
}

- (void)seekToTime:(double)a3
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    [v7 setCurrentTime:a3];
  }

  else
  {
    uint64_t v8 = kMRMediaRemoteOptionPlaybackPosition;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    id v9 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

    -[MTPlayerController _performMediaRemoteCommand:options:](self, "_performMediaRemoteCommand:options:", 24LL, v6);
  }

- (void)pausePlayerTargetWithInitiator:(unint64_t)a3
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    [v5 pauseWithInitiator:a3];
  }

  else
  {
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 1LL);
  }

- (void)playLocalPlayer
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v2 play];
}

- (void)playPlayerTarget
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal")) {
    -[MTPlayerController playLocalPlayer](self, "playLocalPlayer");
  }
  else {
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 0LL);
  }
}

- (void)stopLocalPlayer
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v2 stop];
}

- (void)stopLocalPlayerWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v6 stopWithReason:a3 initiator:a4];
}

- (void)stopPlayerTarget
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal")) {
    -[MTPlayerController stopLocalPlayer](self, "stopLocalPlayer", v3);
  }
  else {
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 3LL);
  }
}

- (void)stopPlayerTargetWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
}

- (BOOL)isPlayingLocally
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  unsigned __int8 v3 = [v2 isPlaybackRequested];

  return v3;
}

- (double)currentTime
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)setCurrentTime:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v4 setCurrentTime:a3];
}

- (BOOL)isSeekingOrScrubbing
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  unsigned __int8 v3 = [v2 scrubbing];

  return v3;
}

- (void)resolveActivePlayerPathWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playerPath](self, "playerPath"));
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000F09B4;
    v8[3] = &unk_100244908;
    id v9 = v4;
    [v5 resolveWithCompletion:v8];
    id v6 = v9;
LABEL_5:

    goto LABEL_6;
  }

  if (v4)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    double v11 = @"No PlayerPath to resolve.";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MTPlayerControllerErrorDomain",  -1LL,  v7));

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    goto LABEL_5;
  }

- (BOOL)isPlayerTargetLocal
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playerPath](self, "playerPath"));
  unsigned __int8 v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 route]);
    unsigned __int8 v5 = [v4 isDeviceRoute];
  }

  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)currentItem
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentItem]);

  return v3;
}

- (id)playingEpisodeUuid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episodeUuid]);

  return v3;
}

- (BOOL)isPlayingEpisodeUuid:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playingEpisodeUuid](self, "playingEpisodeUuid"));
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)volumeControlAvailable
{
  return 0;
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](&OBJC_CLASS___MTApplication, "sharedApplication"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appController]);
  [v5 presentNowPlayingAnimated:v3];
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
}

- (void)playManifest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)setManifest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 context:(id)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 context:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v15 = a3;
  id v12 = a7;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetPlaybackQueueRequest requestWithContext:]( &OBJC_CLASS___MTSetPlaybackQueueRequest,  "requestWithContext:",  a6));
  [v13 setManifest:v15];
  if (v10) {
    uint64_t v14 = [v15 isPlaceholder] ^ 1;
  }
  else {
    uint64_t v14 = 0LL;
  }
  [v13 setStartPlayback:v14];
  objc_msgSend(v13, "setSuppressMetrics:", objc_msgSend(v15, "isPlaceholder"));
  [v13 setPlaybackDestination:!v9];
  [v13 setCompletion:v12];

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v13);
}

- (void)setManifestAsDryRun:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](&OBJC_CLASS___MTPlaybackContext, "contextWithReason:", a4));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetPlaybackQueueRequest requestWithContext:]( &OBJC_CLASS___MTSetPlaybackQueueRequest,  "requestWithContext:",  v11));
  [v10 setManifest:v9];

  [v10 setDryRun:1];
  [v10 setStartPlayback:1];
  [v10 setCompletion:v8];

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v10);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 destination:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[MTSetPlaybackQueueRequest requestWithContext:]( &OBJC_CLASS___MTSetPlaybackQueueRequest,  "requestWithContext:",  a6));
  [v14 setManifest:v13];

  [v14 setStartPlayback:v9];
  [v14 setPlaybackDestination:a5];
  [v14 setCompletion:v12];

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v14);
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  if ([v4 validate])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manifest]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000F0F00;
    v6[3] = &unk_100240240;
    v6[4] = self;
    id v7 = v4;
    [v5 load:v6];
  }

  else
  {
    [v4 finishWithStatus:3];
  }
}

- (void)setManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](&OBJC_CLASS___MTPlaybackContext, "contextWithReason:", a6));
  [v16 setInteractive:v8];
  -[MTPlayerController setManifest:startPlayback:forceLocal:context:completion:]( self,  "setManifest:startPlayback:forceLocal:context:completion:",  v15,  v11,  v10,  v16,  v14);
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 presentationType:(unint64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](&OBJC_CLASS___MTPlaybackContext, "contextWithReason:", a4));
  [v14 setPresentationType:a6];
  [v14 setInteractive:v8];
  -[MTPlayerController setManifest:startPlayback:context:completion:]( self,  "setManifest:startPlayback:context:completion:",  v13,  1LL,  v14,  v12);
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](&OBJC_CLASS___MTPlaybackContext, "contextWithReason:", a4));
  -[MTPlayerController setManifest:startPlayback:context:completion:]( self,  "setManifest:startPlayback:context:completion:",  v6,  1LL,  v7,  0LL);
}

- (void)_setPlaybackQueue:(id)a3
{
  id v4 = a3;
  if ([v4 playbackDestination] == (id)1
    && !-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000F1304;
    v5[3] = &unk_100241B88;
    id v6 = v4;
    id v7 = self;
    +[MTRemoteSetPlaybackQueueUtil setRemotePlaybackQueue:completion:]( &OBJC_CLASS___MTRemoteSetPlaybackQueueUtil,  "setRemotePlaybackQueue:completion:",  v6,  v5);
  }

  else
  {
    -[MTPlayerController _setLocalPlaybackQueue:](self, "_setLocalPlaybackQueue:", v4);
  }
}

- (void)_setLocalPlaybackQueue:(id)a3
{
  id v4 = a3;
  kdebug_trace(723518084LL, 0LL, 0LL, 0LL, 0LL);
  objc_initWeak(&location, self);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manifest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  unsigned __int8 v7 = [v4 startPlayback];
  -[MTPlayerController setUserManifest:](self, "setUserManifest:", v5);
  BOOL v8 = -[MTCompositeManifest initWithUpNextManifest:userManifest:loadQueue:]( objc_alloc(&OBJC_CLASS___MTCompositeManifest),  "initWithUpNextManifest:userManifest:loadQueue:",  self->_upNextManifest,  v5,  self->_loadQueue);
  -[MTPlayerController setCompositeManifest:](self, "setCompositeManifest:", v8);

  id v9 = [v6 source];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  [v10 setPlayReason:v9];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  [v11 setPlayReason:v9];

  uint64_t v14 = _MTLogCategoryPlayback(v12, v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [v4 startPlayback];
    *(_DWORD *)buf = 67109376;
    unsigned int v31 = v16;
    __int16 v32 = 2048;
    id v33 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Performing local SetPlaybackQueue with startPlaying %d reason %lu",  buf,  0x12u);
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  float v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000F1664;
  v22[3] = &unk_100244958;
  id v19 = v4;
  id v23 = v19;
  id v20 = v5;
  id v24 = v20;
  id v21 = v6;
  unsigned __int8 v28 = v7;
  v27[1] = v9;
  id v25 = v21;
  unsigned __int8 v26 = self;
  objc_copyWeak(v27, &location);
  [v17 setManifest:v18 completion:v22];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

- (id)_currentEpisodeForManifest:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  float v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_1000F1C00;
  id v21 = sub_1000F1C10;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentItem]);
  id v22 = (id)objc_claimAutoreleasedReturnValue([v4 episode]);

  if (!v18[5])
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTBaseEpisodeListManifest);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 initialEpisodeUuid]);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000F1C18;
      v13[3] = &unk_1002404B8;
      unsigned int v16 = &v17;
      id v9 = v8;
      id v14 = v9;
      id v10 = v6;
      id v15 = v10;
      [v9 performBlockAndWait:v13];
    }
  }

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (int64_t)_validatePlaybackRequest:(id)a3
{
  id v44 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v44 manifest]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v44 context]);
  unsigned int v6 = [v5 isInteractive];

  if ([v4 count])
  {
    int64_t v7 = 1LL;
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTNetworkMediaManifest);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    {
      else {
        int64_t v7 = 3LL;
      }
    }

    else
    {
      int64_t v7 = 3LL;
    }
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MTStoreManifest);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
  {
    if ([v4 loadStatus] == (id)2) {
      int64_t v7 = 4LL;
    }
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MTNetworkMediaManifest);
    if ((objc_opt_isKindOfClass(v4, v13) & 1) == 0) {
      goto LABEL_21;
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);
    if ([v14 isExplicit])
    {
      unsigned int v15 = +[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed");

      if (!v15) {
        int64_t v7 = 4LL;
      }
    }

    else
    {
    }
  }

  if (v7 == 4) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 == 1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    [(id)objc_opt_class(v11) performOnMainQueue:&stru_100244978];

    int v12 = 1;
    int64_t v7 = 4LL;
    goto LABEL_22;
  }

- (BOOL)_openExternalItemIfNeededForManifest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController _currentEpisodeForManifest:](self, "_currentEpisodeForManifest:", a3));
  BOOL v5 = -[MTPlayerController _shouldOpenExternalItemForEpisode:](self, "_shouldOpenExternalItemForEpisode:", v4);
  if (v5) {
    -[MTPlayerController openExternalEpisode:](self, "openExternalEpisode:", v4);
  }

  return v5;
}

- (BOOL)_shouldOpenExternalItemForEpisode:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F2478;
  v7[3] = &unk_1002404E0;
  uint64_t v9 = &v10;
  id v5 = v3;
  id v8 = v5;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (BOOL)_promptToClearUpNextIfNeededForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController upNextController](self, "upNextController"));
  unsigned int v6 = [v5 count];

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController upNextController](self, "upNextController"));
  id v8 = [v7 upNextOffset];

  if ([v4 playbackDestination]) {
    unsigned int v9 = -[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal");
  }
  else {
    unsigned int v9 = 1;
  }
  if (v6 == v8) {
    goto LABEL_9;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  if ([v11 upNextQueueIntent])
  {

LABEL_8:
    goto LABEL_9;
  }

  if ([v4 playbackDestination] != (id)1) {
    unsigned int v9 = 0;
  }

  if (v9 == 1)
  {
    int64_t v14 = v6 - v8;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_TITLE" value:&stru_100248948 table:0]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_MESSAGE" value:&stru_100248948 table:0]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v18,  v14));

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    id v21 = (void *)objc_opt_class(v20);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000F26E0;
    v24[3] = &unk_100240C10;
    v24[4] = self;
    id v25 = v4;
    id v26 = v16;
    id v27 = v19;
    id v22 = v19;
    id v23 = v16;
    [v21 performOnMainQueue:v24];

    BOOL v12 = 1;
    goto LABEL_10;
  }

- (void)_showGenericPromptToClearUpNextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_TITLE" value:&stru_100248948 table:0]);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_MESSAGE" value:&stru_100248948 table:0]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v8, 1LL));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  id v11 = (void *)objc_opt_class(v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F28C0;
  v15[3] = &unk_100240C10;
  v15[4] = self;
  id v16 = v4;
  id v17 = v6;
  id v18 = v9;
  id v12 = v9;
  id v13 = v6;
  id v14 = v4;
  [v11 performOnMainQueue:v15];
}

- (id)_alertControllerForClearingOrKeepingUpNextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"QUEUE_KEEP_CONFIRM" value:&stru_100248948 table:0]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000F2BA0;
  v24[3] = &unk_1002402E0;
  id v8 = v4;
  id v25 = v8;
  id v26 = self;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  0LL,  v24));

  [v5 addAction:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"QUEUE_CLEAR_CONFIRM" value:&stru_100248948 table:0]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000F2C50;
  v21[3] = &unk_1002402E0;
  id v12 = v8;
  id v22 = v12;
  id v23 = self;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v21));

  [v5 addAction:v13];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000F2D00;
  v19[3] = &unk_100241F90;
  id v20 = v12;
  id v16 = v12;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  v19));

  [v5 addAction:v17];
  return v5;
}

- (void)clearPlayerManifestWithCompletion:(id)a3
{
  id v4 = a3;
  self->_shouldFindSomethingToPlay = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v5 setManifest:0 completion:0];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F2DB8;
  v7[3] = &unk_100240138;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MTPlayerController _restoreManifestIfNeededWithCompletion:useEmptyManifest:]( self,  "_restoreManifestIfNeededWithCompletion:useEmptyManifest:",  v7,  1LL);
}

- (void)restorePlayerManifestWithCompletion:(id)a3
{
  int64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  unsigned int v9 = sub_1000F2EA4;
  uint64_t v10 = &unk_100240138;
  id v11 = self;
  id v12 = a3;
  id v4 = v12;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, &v7);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue", v7, v8, v9, v10, v11));
  dispatch_async(v6, v5);
}

- (void)_onQueueRestorePlayerManifestWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationCompletions](self, "restorationCompletions"));
    id v6 = [v4 copy];
    id v7 = objc_retainBlock(v6);
    [v5 addObject:v7];

    uint64_t v10 = _MTLogCategoryPlayback(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationCompletions](self, "restorationCompletions"));
      *(_DWORD *)__int128 buf = 134217984;
      id v18 = [v12 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Added manifest restoration completion. Count = %lu",  buf,  0xCu);
    }
  }

  if (!-[MTPlayerController isManifestRestorationOngoing](self, "isManifestRestorationOngoing"))
  {
    -[MTPlayerController setIsManifestRestorationOngoing:](self, "setIsManifestRestorationOngoing:", 1LL);
    if (-[MTPlayerController isPlayerManifestRestored](self, "isPlayerManifestRestored"))
    {
      -[MTPlayerController _invokeRestorationCompletions](self, "_invokeRestorationCompletions");
    }

    else
    {
      id v13 = [(id)objc_opt_class(self) _loadActivityForRestoration];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000F305C;
      v15[3] = &unk_100240240;
      v15[4] = self;
      id v16 = (id)objc_claimAutoreleasedReturnValue(v13);
      id v14 = v16;
      +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v15);
    }
  }
}

- (void)_invokeRestorationCompletions
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F339C;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_restoreEmptyManifestIfNeededWithCompletion:(id)a3
{
}

- (void)_restoreDefaultManifestIfNeededWithCompletion:(id)a3
{
}

- (void)_restoreManifestIfNeededWithCompletion:(id)a3 useEmptyManifest:(BOOL)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 manifest]);

  if (v8)
  {
    if (v6) {
      v6[2](v6);
    }
  }

  else
  {
    if (a4
      || (uint64_t v9 = (MTItemListManifest *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playMyPodcastsWithOrder:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playMyPodcastsWithOrder:",  0LL))) == 0LL)
    {
      uint64_t v9 = -[MTItemListManifest initWithItems:]( objc_alloc(&OBJC_CLASS___MTItemListManifest),  "initWithItems:",  &__NSArray0__struct);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000F373C;
    v10[3] = &unk_100240A30;
    id v11 = v6;
    -[MTPlayerController setManifest:startPlayback:forceLocal:reason:interactive:completion:]( self,  "setManifest:startPlayback:forceLocal:reason:interactive:completion:",  v9,  0LL,  1LL,  1LL,  0LL,  v10);
  }
}

- (void)restoreFromUserActivity:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000F38C0;
  v16[3] = &unk_1002449C8;
  objc_copyWeak(v19, &location);
  id v14 = v12;
  BOOL v20 = a4;
  id v17 = v14;
  v19[1] = (id)a5;
  BOOL v21 = a6;
  id v15 = v13;
  id v18 = v15;
  +[MTPlayerManifest restoreActivity:completion:]( &OBJC_CLASS___MTPlayerManifest,  "restoreActivity:completion:",  v14,  v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)restoreFromUserActivity:(id)a3 withManifest:(id)a4 startPlayback:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000F3A74;
  v20[3] = &unk_100244A58;
  id v17 = v15;
  id v21 = v17;
  id v18 = v16;
  id v23 = v18;
  v24[1] = (id)a6;
  id v19 = v14;
  id v22 = v19;
  objc_copyWeak(v24, &location);
  BOOL v25 = a5;
  BOOL v26 = a7;
  +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v20);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

- (void)setCurrentActivity:(id)a3
{
}

- (void)_updateCurrentActivityForPlayState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  unsigned int v4 = [v3 isPlaybackRequested];

  if (v4) {
    -[MTPlayerController _currentActivityBecomeCurrent](self, "_currentActivityBecomeCurrent");
  }
}

- (void)_currentActivityBecomeCurrent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));

  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    [v4 setDelegate:self];

    dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    [v5 setSupportsContinuationStreams:1];

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    [v6 becomeCurrent];
  }

- (void)_saveActivityForRestoration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 activityType]);
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  [v4 setObject:v7 forKeyedSubscript:@"userInfo"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 _suggestedActionType]));
  [v4 setObject:v8 forKeyedSubscript:@"suggestedActionType"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 _options]);
  [v4 setObject:v9 forKeyedSubscript:@"options"];

  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000F3F34;
  v12[3] = &unk_100240240;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(v10, v12);
}

+ (id)_loadActivityForRestoration
{
  id v2 = [(id)objc_opt_class(a1) _activityRestorationPath];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v3));
  if (v4)
  {
    v34[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v34[1] = objc_opt_class(&OBJC_CLASS___NSData);
    v34[2] = objc_opt_class(&OBJC_CLASS___NSDate);
    v34[3] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v34[4] = objc_opt_class(&OBJC_CLASS___NSNull);
    v34[5] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v34[6] = objc_opt_class(&OBJC_CLASS___NSSet);
    v34[7] = objc_opt_class(&OBJC_CLASS___NSString);
    v34[8] = objc_opt_class(&OBJC_CLASS___NSURL);
    v34[9] = objc_opt_class(&OBJC_CLASS___NSUUID);
    dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 10LL));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

    char v30 = (void *)v6;
    id v31 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v31));
    id v8 = v31;
    uint64_t v10 = v8;
    if (v8)
    {
      uint64_t v11 = _MTLogCategoryPlayback(v8, v9);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v33 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to restore activity with error %@",  buf,  0xCu);
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"type"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"title"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"userInfo"]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"suggestedActionType"]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"options"]);
    if (v13)
    {
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v19 = objc_opt_class(v18);
      if ((objc_opt_isKindOfClass(v13, v19) & 1) == 0)
      {

        id v13 = 0LL;
      }
    }

    if (v14)
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v21 = objc_opt_class(v20);
      if ((objc_opt_isKindOfClass(v14, v21) & 1) == 0)
      {

        id v14 = 0LL;
      }
    }

    if (v15)
    {
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v23 = objc_opt_class(v22);
      if ((objc_opt_isKindOfClass(v15, v23) & 1) == 0)
      {

        id v15 = 0LL;
      }
    }

    if (v16)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v25 = objc_opt_class(v24);
      if ((objc_opt_isKindOfClass(v16, v25) & 1) == 0)
      {

        id v16 = 0LL;
      }
    }

    if (v17)
    {
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v27 = objc_opt_class(v26);
      if ((objc_opt_isKindOfClass(v17, v27) & 1) == 0)
      {

        id v17 = 0LL;
      }
    }

    if (v13)
    {
      id v28 = -[NSUserActivity _initWithTypeIdentifier:suggestedActionType:options:]( [NSUserActivity alloc],  "_initWithTypeIdentifier:suggestedActionType:options:",  v13,  [v16 integerValue],  v17);
      [v28 setTitle:v14];
      [v28 setUserInfo:v15];
    }

    else
    {
      id v28 = 0LL;
    }
  }

  else
  {
    id v28 = 0LL;
  }

  return v28;
}

+ (id)_activityRestorationPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](&OBJC_CLASS___MTConstants, "sharedDocumentsDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"play_queue_restoration.data"]);

  return v3;
}

- (void)_localPlayerPath
{
  id v2 = (const void *)MRNowPlayingClientCreate(0LL, kMTApplicationBundleIdentifier);
  id v3 = (const void *)MRNowPlayingPlayerCreate(kPodcastsPlayerID, kPodcastsPlayerID);
  unsigned int v4 = (void *)MRNowPlayingPlayerPathCreate(0LL, v2, v3);
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)_performMediaRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    -[MTPlayerController _sendMediaRemoteCommand:toPlayer:]( self,  "_sendMediaRemoteCommand:toPlayer:",  v4,  -[MTPlayerController _localPlayerPath](self, "_localPlayerPath"));
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000F45C8;
    v7[3] = &unk_100244A80;
    void v7[4] = self;
    int v9 = v4;
    id v8 = v6;
    -[MTPlayerController resolveActivePlayerPathWithCompletion:](self, "resolveActivePlayerPathWithCompletion:", v7);
  }
}

- (void)_performMediaRemoteCommand:(unsigned int)a3
{
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4
{
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  uint64_t v12 = kMRMediaRemoteOptionDirectUserInteraction;
  id v13 = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v9 = [v8 mutableCopy];

  if (v7) {
    [v9 addEntriesFromDictionary:v7];
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  MRMediaRemoteSendCommandToPlayer(v6, v9, a4, 0LL, v11, &stru_100244AC0);
}

- (void)recordMTPlayerMetricsForCurrentItemWithCurrentTime:(double)a3
{
  if (+[MTPrivacyUtil allowReporting](&OBJC_CLASS___MTPrivacyUtil, "allowReporting"))
  {
    dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    uint64_t v6 = v5;
    if (v5)
    {
      if ([v5 podcastStoreId])
      {
        -[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition");
        double v8 = a3 - v7;
        if (v8 >= 0.5)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
          uint64_t v10 = [v9 isReachable] ^ 1;

          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
          BOOL v13 = v12 != 0LL;

          v60[0] = @"com.apple.podcasts";
          v59[0] = @"app";
          v59[1] = @"playStartTime";
          id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[MTPlayerController metricsPlayStartTime](self, "metricsPlayStartTime")));
          v60[1] = v44;
          v59[2] = @"playStartPosition";
          -[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition");
          float v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          v60[2] = v43;
          v59[3] = @"playDuration";
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
          v60[3] = v14;
          v59[4] = @"playbackSpeed";
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 playbackSpeed]));
          v60[4] = v16;
          v59[5] = @"contentType";
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 priceType]);
          uint64_t v18 = (void *)v17;
          uint64_t v19 = &stru_100248948;
          if (v17) {
            uint64_t v19 = (const __CFString *)v17;
          }
          v60[5] = v19;
          v59[6] = @"isOffline";
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
          v60[6] = v20;
          v59[7] = @"isSignedIn";
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
          v60[7] = v21;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  8LL));
          id v23 = [v22 mutableCopy];

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringForKey:@"canary"]);

          if ([v25 length]) {
            [v23 setObject:v25 forKeyedSubscript:@"canary"];
          }
          if ([v6 isAppleMusicEpisode])
          {
            id v48 = 0LL;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[MTMusicSubscriptionInfoLoader loadIfNeededAndReturnError:]( &OBJC_CLASS___MTMusicSubscriptionInfoLoader,  "loadIfNeededAndReturnError:",  &v48));
            id v27 = v48;
            if (v27)
            {
              uint64_t v28 = _MTLogCategoryMetrics();
              int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                id v50 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Unable to get Music Subscription Info with error: %@",  buf,  0xCu);
              }
            }

            else
            {
              [v23 setObject:v26 forKeyedSubscript:@"musicSubscriptionData"];
            }
          }

          else if ([v6 isAppleNewsEpisode])
          {
            else {
              char v30 = @"none";
            }
            [v23 setObject:v30 forKeyedSubscript:@"newsSubscriptionData"];
          }

          id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)-[MTPlayerController metricsPlayStartTime](self, "metricsPlayStartTime") / 1000.0));
          uint64_t v32 = _MTLogCategoryMetrics();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDefaults metricsCanaryIdentifier](&OBJC_CLASS___AMSDefaults, "metricsCanaryIdentifier"));
            -[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition");
            uint64_t v36 = v35;
            double v37 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
            *(_DWORD *)__int128 buf = 138413314;
            id v50 = v34;
            __int16 v51 = 2112;
            uint64_t v52 = v31;
            __int16 v53 = 2048;
            uint64_t v54 = v36;
            __int16 v55 = 2048;
            double v56 = v8;
            __int16 v57 = 2112;
            BOOL v58 = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "canary: %@, playStartTime: %@, playStartPosition: %f, playDuration: %f, item: %@",  buf,  0x34u);
          }

          double v38 = -[MTEpisodeMetricDataSource initWithPlayerItem:]( objc_alloc(&OBJC_CLASS___MTEpisodeMetricDataSource),  "initWithPlayerItem:",  v6);
          id v39 = (void *)objc_claimAutoreleasedReturnValue( +[AnalyticsIdentifierManager sharedInstance]( &OBJC_CLASS____TtC18PodcastsFoundation26AnalyticsIdentifierManager,  "sharedInstance"));
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identifierPromise]);
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_1000F4DC4;
          v45[3] = &unk_100244AE8;
          id v46 = v23;
          id v47 = v38;
          uint64_t v41 = v38;
          id v42 = v23;
          [v40 addFinishBlock:v45];
        }
      }
    }
  }

- (void)recordMetricsForCurrentItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  uint64_t v4 = v3;
  if (v3 && ([v3 isPlaceholder] & 1) == 0)
  {
    dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerItem]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    objc_sync_enter(v7);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController lastRecordedItemURL](self, "lastRecordedItemURL"));
    unsigned __int8 v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
      [v11 removeAllObjects];

      -[MTPlayerController setLastRecordedItemURL:](self, "setLastRecordedItemURL:", v8);
    }

    objc_sync_exit(v7);
    if (v6)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 privateQueueContext]);

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000F50C8;
      v15[3] = &unk_100240C10;
      id v16 = v6;
      id v17 = v13;
      id v18 = v4;
      uint64_t v19 = self;
      id v14 = v13;
      [v14 performBlock:v15];
    }
  }
}

- (void)recordMetricsEventForAccessLog:(id)a3 playerItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (([v6 isPlaceholder] & 1) == 0)
  {
    double v7 = -[MTEpisodeMetricDataSource initWithPlayerItem:]( objc_alloc(&OBJC_CLASS___MTEpisodeMetricDataSource),  "initWithPlayerItem:",  v6);
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlayMetricsEvent eventWithAccessLog:dataSource:]( &OBJC_CLASS___MTPlayMetricsEvent,  "eventWithAccessLog:dataSource:",  v13,  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    objc_sync_enter(v9);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    unsigned __int8 v11 = [v10 containsObject:v8];

    if ((v11 & 1) == 0)
    {
      [v8 record];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
      [v12 addObject:v8];
    }

    objc_sync_exit(v9);
  }
}

- (void)recordMetricsEventForErrorLog:(id)a3 withEpisode:(id)a4
{
  id v5 = a3;
  v32[0] = @"date";
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 date]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v9 = objc_opt_class(v8);
  id v31 = (void *)v7;
  char isKindOfClass = objc_opt_isKindOfClass(v7, v9);
  if ((isKindOfClass & 1) != 0)
  {
    int v29 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
    [v29 timeIntervalSinceReferenceDate];
    unsigned __int8 v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    unsigned __int8 v11 = &off_100254E30;
  }

  char v30 = v11;
  v33[0] = v11;
  v32[1] = @"uri";
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 URI]);
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (const __CFString *)v12;
  }
  else {
    id v14 = &stru_100248948;
  }
  v33[1] = v14;
  v32[2] = @"server_address";
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 serverAddress]);
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (const __CFString *)v15;
  }
  else {
    id v17 = &stru_100248948;
  }
  v33[2] = v17;
  v32[3] = @"playback_session_id";
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v5 playbackSessionID]);
  uint64_t v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (const __CFString *)v18;
  }
  else {
    uint64_t v20 = &stru_100248948;
  }
  v33[3] = v20;
  v32[4] = @"error_status_code";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 errorStatusCode]));
  v33[4] = v21;
  v32[5] = @"error_domain";
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v5 errorDomain]);
  id v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = (const __CFString *)v22;
  }
  else {
    uint64_t v24 = &stru_100248948;
  }
  v33[5] = v24;
  v32[6] = @"error_comment";
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v5 errorComment]);
  uint64_t v26 = (void *)v25;
  if (v25) {
    id v27 = (const __CFString *)v25;
  }
  else {
    id v27 = &stru_100248948;
  }
  v33[6] = v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  7LL));
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  @"play_error",  v6,  v28);

  if ((isKindOfClass & 1) != 0)
  {
  }
}

- (void)_recordMetricsForItemDidChange
{
  if (+[MTPrivacyUtil allowReporting](&OBJC_CLASS___MTPrivacyUtil, "allowReporting"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    uint64_t v4 = v3;
    if (v3 && ([v3 isPlaceholder] & 1) == 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricsContentIdentifier]);

      if (v6)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 privateQueueContext]);

        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_1000F5774;
        v10[3] = &unk_100240C10;
        id v11 = v8;
        id v12 = v4;
        id v13 = self;
        id v14 = v6;
        id v9 = v8;
        [v9 performBlock:v10];
      }
    }
  }

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a5;
  -[MTPlayerController reportStopReason:withInitiator:](self, "reportStopReason:withInitiator:", 6LL, 2LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  [v6 pause];

  [v7 close];
}

- (void)updateUPPEpisodeUuid:(id)a3 bookmarkTime:(double)a4
{
  id v9 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  if (v6)
  {
    if (!-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeUuid]);
      unsigned int v8 = [v9 isEqualToString:v7];

      if (v8) {
        -[MTPlayerController setCurrentTime:](self, "setCurrentTime:", a4);
      }
    }
  }
}

- (void)setArtworkProvider:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackQueueController](self, "playbackQueueController"));
  [v5 setArtworkProvider:v4];
}

- (MTPlayerFailureDialogProxy)dialogProxy
{
  return (MTPlayerFailureDialogProxy *)objc_loadWeakRetained((id *)&self->_dialogProxy);
}

- (void)setDialogProxy:(id)a3
{
}

- (IMAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MTUpNextController)upNextController
{
  return self->_upNextController;
}

- (void)setUpNextController:(id)a3
{
}

- (MTPlaybackQueueController)playbackQueueController
{
  return self->_playbackQueueController;
}

- (void)setPlaybackQueueController:(id)a3
{
}

- (MTCompositeManifest)compositeManifest
{
  return self->_compositeManifest;
}

- (void)setCompositeManifest:(id)a3
{
}

- (MTUpNextManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)setUpNextManifest:(id)a3
{
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (void)setUserManifest:(id)a3
{
}

- (BOOL)isPlayingFullScreenVideo
{
  return self->_isPlayingFullScreenVideo;
}

- (void)setIsPlayingFullScreenVideo:(BOOL)a3
{
  self->_isPlayingFullScreenVideo = a3;
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (id)platformSyncPlayheadChangeObserverBlock
{
  return self->_platformSyncPlayheadChangeObserverBlock;
}

- (void)setPlatformSyncPlayheadChangeObserverBlock:(id)a3
{
}

- (NSString)previousPlayingEpisodeUuid
{
  return self->_previousPlayingEpisodeUuid;
}

- (void)setPreviousPlayingEpisodeUuid:(id)a3
{
}

- (BOOL)hasReportedThisEpisode
{
  return self->_hasReportedThisEpisode;
}

- (void)setHasReportedThisEpisode:(BOOL)a3
{
  self->_hasReportedThisEpisode = a3;
}

- (double)lastPlaybackSaveTime
{
  return self->_lastPlaybackSaveTime;
}

- (void)setLastPlaybackSaveTime:(double)a3
{
  self->_lastPlaybackSaveTime = a3;
}

- (int64_t)metricsPlayStartTime
{
  return self->_metricsPlayStartTime;
}

- (void)setMetricsPlayStartTime:(int64_t)a3
{
  self->_metricsPlayStartTime = a3;
}

- (double)metricsPlayStartPosition
{
  return self->_metricsPlayStartPosition;
}

- (void)setMetricsPlayStartPosition:(double)a3
{
  self->_metricsPlayStartPosition = a3;
}

- (MTPlaybackPositionController)playbackPositionController
{
  return self->_playbackPositionController;
}

- (void)setPlaybackPositionController:(id)a3
{
}

- (double)lastPlaybackPositionSaveTime
{
  return self->_lastPlaybackPositionSaveTime;
}

- (void)setLastPlaybackPositionSaveTime:(double)a3
{
  self->_lastPlaybackPositionSaveTime = a3;
}

- (MTMediaRemoteController)mediaRemoteController
{
  return self->_mediaRemoteController;
}

- (void)setMediaRemoteController:(id)a3
{
}

- (NSUserActivity)currentActivity
{
  return self->_currentActivity;
}

- (BOOL)shouldFindSomethingToPlay
{
  return self->_shouldFindSomethingToPlay;
}

- (void)setShouldFindSomethingToPlay:(BOOL)a3
{
  self->_shouldFindSomethingToPlay = a3;
}

- (BOOL)isPlayerManifestRestored
{
  return self->_playerManifestRestored;
}

- (void)setPlayerManifestRestored:(BOOL)a3
{
  self->_playerManifestRestored = a3;
}

- (OS_dispatch_queue)restorationQueue
{
  return self->_restorationQueue;
}

- (void)setRestorationQueue:(id)a3
{
}

- (OS_dispatch_queue)dataAccessQueue
{
  return self->_dataAccessQueue;
}

- (void)setDataAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
}

- (NSMutableArray)restorationCompletions
{
  return self->_restorationCompletions;
}

- (void)setRestorationCompletions:(id)a3
{
}

- (BOOL)isManifestRestorationOngoing
{
  return self->_isManifestRestorationOngoing;
}

- (void)setIsManifestRestorationOngoing:(BOOL)a3
{
  self->_isManifestRestorationOngoing = a3;
}

- (NSTimer)setPlaybackQueueRequestTimeoutTimer
{
  return self->_setPlaybackQueueRequestTimeoutTimer;
}

- (void)setSetPlaybackQueueRequestTimeoutTimer:(id)a3
{
}

- (NSMutableSet)recordedPlayEventsForCurrentItem
{
  return self->_recordedPlayEventsForCurrentItem;
}

- (void)setRecordedPlayEventsForCurrentItem:(id)a3
{
}

- (NSURL)lastRecordedItemURL
{
  return self->_lastRecordedItemURL;
}

- (void)setLastRecordedItemURL:(id)a3
{
}

- (MTCoreDataKeyRequestStorage)keyStorage
{
  return self->_keyStorage;
}

- (void)setKeyStorage:(id)a3
{
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
}

- (PFFairPlayValidationManager)validationManager
{
  return self->_validationManager;
}

- (void)setValidationManager:(id)a3
{
}

- (PFFairPlayInvalidationManager)invalidationManager
{
  return self->_invalidationManager;
}

- (void)setInvalidationManager:(id)a3
{
}

- (MTPropertyChangeQueryObserver)transcriptIdentifierObserver
{
  return self->_transcriptIdentifierObserver;
}

- (void)setTranscriptIdentifierObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end