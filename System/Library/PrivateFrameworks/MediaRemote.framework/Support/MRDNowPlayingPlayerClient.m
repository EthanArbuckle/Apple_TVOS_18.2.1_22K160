@interface MRDNowPlayingPlayerClient
- (BOOL)_onQueue_isPlaying;
- (BOOL)canBeNowPlayingPlayer;
- (BOOL)hasNowPlayingData;
- (BOOL)isPictureInPictureEnabled;
- (BOOL)isPlaying;
- (BOOL)pushStateCanBeNowPlayingPlayer;
- (BOOL)pushStateHasNowPlayingData;
- (BOOL)pushStateIsPlaying;
- (BOOL)pushStatePictureInPictureEnabled;
- (MRContentItem)nowPlayingContentItem;
- (MRDNowPlayingPlayerClient)initWithPlayerPath:(id)a3;
- (MRDNowPlayingPlayerClientDelegate)delegate;
- (MRDNowPlayingPlayerClientPlaybackState)pushStatePlaybackState;
- (MRDPlaybackQueueParticipantDataSource)participantDataSource;
- (MRDPlaybackQueueRemoteParticipantDataSource)remoteParticipantDataSource;
- (MRNowPlayingState)nowPlayingState;
- (MRPlaybackQueue)playbackQueue;
- (MRPlaybackQueueSubscriptionController)subscriptionController;
- (MRPlayer)player;
- (MRPlayer)pushStatePlayer;
- (MRPlayerPath)playerPath;
- (NSArray)participants;
- (NSArray)snapshots;
- (NSArray)supportedRemoteControlCommands;
- (NSData)supportedRemoteControlCommandsData;
- (NSDate)canBeNowPlayingPlayerTimestamp;
- (NSDate)lastPlayingDate;
- (NSDate)playbackStateTimestamp;
- (NSMapTable)handoffSessions;
- (NSString)description;
- (double)timeSincePlaying;
- (id)_onQueue_lastPlayingDate;
- (id)_onQueue_playbackState;
- (id)_sortSnapshots:(id)a3;
- (id)activeContent;
- (id)handleHandoffEvent:(id)a3;
- (id)playbackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6;
- (id)snapshotForIsPlaying:(BOOL)a3;
- (id)snapshotForPlaybackState:(unsigned int)a3;
- (id)snapshotsForIsPlaying:(BOOL)a3;
- (unint64_t)playbackQueueCapabilities;
- (unsigned)inferredPlaybackState;
- (unsigned)playbackState;
- (void)_handleNowPlayingAppDidChange:(id)a3;
- (void)_onQueue_canBeNowPlayingDidChange:(BOOL)a3;
- (void)_onQueue_isPlayingDidChange:(BOOL)a3;
- (void)_onQueue_pictureInPictureEnabledDidChanged:(BOOL)a3;
- (void)_onQueue_playbackQueueCapabilitiesDidChange:(unint64_t)a3;
- (void)_onQueue_playbackQueueContentItemsArtworkDidChange:(id)a3;
- (void)_onQueue_playbackQueueContentItemsDidChange:(id)a3;
- (void)_onQueue_playbackQueueDidChange:(id)a3 nowPlayingItemChanged:(BOOL)a4;
- (void)_onQueue_playbackStateDidChanged:(id)a3;
- (void)_onQueue_popState;
- (void)_onQueue_pushState;
- (void)_onQueue_supportedCommandsDidChange:(id)a3;
- (void)_onQueue_updatePlaybackQueue:(id)a3 fromRequest:(id)a4;
- (void)dataSource:(id)a3 didUpdateParticipants:(id)a4;
- (void)notifyArtworkChangedForContentItems:(id)a3;
- (void)registerHandoffSession:(id)a3;
- (void)setCanBeNowPlayingPlayer:(BOOL)a3;
- (void)setCanBeNowPlayingPlayerTimestamp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInferredPlaybackState:(unsigned int)a3;
- (void)setParticipantDataSource:(id)a3;
- (void)setPictureInPictureEnabled:(BOOL)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(unint64_t)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPushStateCanBeNowPlayingPlayer:(BOOL)a3;
- (void)setPushStateHasNowPlayingData:(BOOL)a3;
- (void)setPushStateIsPlaying:(BOOL)a3;
- (void)setPushStatePictureInPictureEnabled:(BOOL)a3;
- (void)setPushStatePlaybackState:(id)a3;
- (void)setPushStatePlayer:(id)a3;
- (void)setSupportedRemoteControlCommands:(id)a3;
- (void)setSupportedRemoteControlCommandsData:(id)a3;
- (void)updateClient:(id)a3;
- (void)updateLastPlayingDate:(id)a3;
- (void)updatePlaybackQueue:(id)a3;
- (void)updatePlaybackQueue:(id)a3 fromRequest:(id)a4;
- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4;
- (void)updatePlayer:(id)a3;
@end

@implementation MRDNowPlayingPlayerClient

- (id)activeContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playbackQueue](self, "playbackQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentItemWithOffset:0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);

  return v5;
}

- (MRDNowPlayingPlayerClient)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___MRDNowPlayingPlayerClient;
  v5 = -[MRDNowPlayingPlayerClient init](&v56, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
    unsigned int v7 = [v6 processIdentifier];
    pid_t v8 = getpid();

    if (v7 == v8 && (MSVDeviceOSIsInternalInstall() & 1) == 0)
    {
      uint64_t v10 = _MRLogForCategory(1LL, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002B5488(v11);
      }
    }

    v12 = (MRPlayerPath *)[v4 copy];
    playerPath = v5->_playerPath;
    v5->_playerPath = v12;

    v14 = objc_alloc(&OBJC_CLASS___NSString);
    v15 = (objc_class *)objc_opt_class(v5);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    v19 = -[NSString initWithFormat:](v14, "initWithFormat:", @"com.apple.mediaremote.%@.%@", v17, v18);

    v20 = v19;
    v21 = -[NSString UTF8String](v20, "UTF8String");
    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_t v24 = dispatch_queue_create(v21, v23);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v24;

    v26 = -[MRPlaybackQueueSubscriptionController initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueSubscriptionController),  "initWithPlayerPath:",  v4);
    subscriptionController = v5->_subscriptionController;
    v5->_subscriptionController = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    playbackStateHistory = v5->_playbackStateHistory;
    v5->_playbackStateHistory = v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastPlayingDate = v5->_lastPlayingDate;
    v5->_lastPlayingDate = (NSDate *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
    LODWORD(v23) = [v32 isSystemMediaApplication];

    if (!(_DWORD)v23) {
      goto LABEL_20;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v34 = [v33 supportMultiplayerHost];

    v35 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
    v36 = v35;
    if ((v34 & 1) != 0)
    {
      unsigned int v37 = [v35 isHosted];

      if (v37)
      {
        v38 = -[MRDPlaybackQueueParticipantDataSource initWithDelegate:]( objc_alloc(&OBJC_CLASS___MRDPlaybackQueueParticipantDataSource),  "initWithDelegate:",  v5);
        participantDataSource = v5->_participantDataSource;
        v5->_participantDataSource = v38;

        uint64_t v41 = _MRLogForCategory(1LL, v40);
        remoteParticipantDataSource = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(remoteParticipantDataSource, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v5->_participantDataSource;
          *(_DWORD *)buf = 138543618;
          v58 = v43;
          __int16 v59 = 2114;
          id v60 = v4;
          v44 = "[MRDNowPlayingPlayerClient] Installed MRDPlaybackQueueParticipantDataSource: %{public}@ on %{public}@ be"
                "cause - LocallyHosted origin";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, remoteParticipantDataSource, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
          goto LABEL_19;
        }

        goto LABEL_19;
      }
    }

    else
    {
      unsigned int v45 = [v35 isLocal];

      if (v45)
      {
        v46 = -[MRDPlaybackQueueParticipantDataSource initWithDelegate:]( objc_alloc(&OBJC_CLASS___MRDPlaybackQueueParticipantDataSource),  "initWithDelegate:",  v5);
        v47 = v5->_participantDataSource;
        v5->_participantDataSource = v46;

        uint64_t v49 = _MRLogForCategory(1LL, v48);
        remoteParticipantDataSource = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(remoteParticipantDataSource, OS_LOG_TYPE_DEFAULT))
        {
          v50 = v5->_participantDataSource;
          *(_DWORD *)buf = 138543618;
          v58 = v50;
          __int16 v59 = 2114;
          id v60 = v4;
          v44 = "[MRDNowPlayingPlayerClient] Installed MRDPlaybackQueueParticipantDataSource: %{public}@ on %{public}@ be"
                "cause - LOCL origin";
          goto LABEL_15;
        }

- (NSString)description
{
  uint64_t v7 = 0LL;
  pid_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10002DC9C;
  v11 = sub_10002DCAC;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002DCB4;
  v6[3] = &unk_100398EC8;
  v6[4] = self;
  v6[5] = &v7;
  msv_dispatch_sync_on_queue(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSData)supportedRemoteControlCommandsData
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002E0FC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (MRPlayerPath)playerPath
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002E200;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

- (MRPlayer)player
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](self, "playerPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (MRPlayer *)v3;
}

- (NSArray)supportedRemoteControlCommands
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002E33C;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setSupportedRemoteControlCommands:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002E430;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setSupportedRemoteControlCommandsData:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002E600;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002E718;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (MRPlaybackQueue)playbackQueue
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002EBB8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlaybackQueue *)v3;
}

- (MRContentItem)nowPlayingContentItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playbackQueue](self, "playbackQueue"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentItemWithOffset:0]);

  return (MRContentItem *)v3;
}

- (void)setInferredPlaybackState:(unsigned int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002ECA4;
  v4[3] = &unk_10039A990;
  v4[4] = self;
  unsigned int v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (unsigned)inferredPlaybackState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002EF78;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unsigned int v3 = [(id)v7[5] playbackState];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002F018;
  v9[3] = &unk_10039A9B8;
  unsigned int v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
}

- (void)updateLastPlayingDate:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F278;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (BOOL)canBeNowPlayingPlayer
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F34C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCanBeNowPlayingPlayer:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002F3BC;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (NSDate)canBeNowPlayingPlayerTimestamp
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  id v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F4D8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setCanBeNowPlayingPlayerTimestamp:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002F568;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (unsigned)playbackState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  id v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F640;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unsigned int v3 = [(id)v7[5] playbackState];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDate)playbackStateTimestamp
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  id v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F72C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (id)_onQueue_playbackState
{
  id v3 = self->_playerPlaybackState;
  if (!-[MRDNowPlayingPlayerClientPlaybackState playbackState](v3, "playbackState"))
  {
    id v4 = self->_inferredPlayerPlaybackState;

    id v3 = v4;
  }

  if (!-[MRDNowPlayingPlayerClientPlaybackState playbackState](v3, "playbackState"))
  {
    BOOL v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueue playbackQueue](self->_playbackQueueInternal, "playbackQueue"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItemWithOffset:0]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    unsigned int v9 = [v8 hasPlaybackRate];

    if (v9)
    {
      if (fabsf(MRContentItemGetPlaybackRate(v7)) > 0.00000011921) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    unsigned int v12 = [v11 hasElapsedTimeTimestamp];

    if (v12)
    {
      v13 = objc_alloc(&OBJC_CLASS___NSDate);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
      [v14 elapsedTimeTimestamp];
      v15 = -[NSDate initWithTimeIntervalSinceReferenceDate:](v13, "initWithTimeIntervalSinceReferenceDate:");

      BOOL v5 = v15;
    }

    v16 = -[MRDNowPlayingPlayerClientPlaybackState initWithPlaybackState:date:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingPlayerClientPlaybackState),  "initWithPlaybackState:date:",  v10,  v5);

    id v3 = v16;
  }

  return v3;
}

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002F94C;
  v4[3] = &unk_100399B70;
  v4[4] = self;
  void v4[5] = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (unint64_t)playbackQueueCapabilities
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FB98;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPlaying
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FC54;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_onQueue_isPlaying
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient _onQueue_playbackState](self, "_onQueue_playbackState"));
  char IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing([v3 playbackState]);

  return IsAdvancing;
}

- (BOOL)isPictureInPictureEnabled
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FD74;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasNowPlayingData
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FE30;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MRNowPlayingState)nowPlayingState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  char v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FF4C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRNowPlayingState *)v3;
}

- (double)timeSincePlaying
{
  uint64_t v6 = 0LL;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100030170;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_onQueue_lastPlayingDate
{
  if (-[MRDNowPlayingPlayerClient _onQueue_isPlaying](self, "_onQueue_isPlaying")) {
    double v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  else {
    double v3 = self->_lastPlayingDate;
  }
  return v3;
}

- (NSMapTable)handoffSessions
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000302BC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMapTable *)v3;
}

- (void)setPlayerPath:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003034C;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100030408;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (void)updateClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000304B8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)updatePlayer:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030578;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)updatePlaybackQueue:(id)a3
{
}

- (void)updatePlaybackQueue:(id)a3 fromRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100030670;
  v11[3] = &unk_100398F40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v11);
}

- (void)_onQueue_updatePlaybackQueue:(id)a3 fromRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueue playbackQueue](self->_playbackQueueInternal, "playbackQueue"));
  id v9 = [v8 copy];

  -[MRDNowPlayingPlayerClient _onQueue_pushState](self, "_onQueue_pushState");
  playbackQueueInternal = self->_playbackQueueInternal;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItems]);
  -[MRDPlaybackQueue updatePlaybackQueueWithContentItems:fromRequest:]( playbackQueueInternal,  "updatePlaybackQueueWithContentItems:fromRequest:",  v11,  v7);

  -[MRDNowPlayingPlayerClient _onQueue_popState](self, "_onQueue_popState");
  if (!v7)
  {
    id v34 = v6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItems]);
    if ([v12 count]) {
      -[MRDNowPlayingPlayerClient _onQueue_playbackQueueContentItemsDidChange:]( self,  "_onQueue_playbackQueueContentItemsDidChange:",  v12);
    }
    v32 = v12;
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v33 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueue playbackQueue](self->_playbackQueueInternal, "playbackQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 contentItems]);

    id obj = v15;
    id v38 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v45;
      id v37 = v9;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v16;
          v17 = *(void **)(*((void *)&v44 + 1) + 8 * v16);
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue([v9 contentItems]);
          id v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v41;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v41 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
                dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
                unsigned int v26 = [v24 isEqualToString:v25];

                if (v26)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v17 artwork]);
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 imageData]);
                  if (v28)
                  {
                    v29 = (void *)v28;
                    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v23 artwork]);
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 imageData]);

                    if (!v31) {
                      -[NSMutableArray addObject:](v13, "addObject:", v17);
                    }
                  }

                  else
                  {
                  }
                }
              }

              id v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }

            while (v20);
          }

          uint64_t v16 = v39 + 1;
          id v9 = v37;
        }

        while ((id)(v39 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }

      while (v38);
    }

    -[MRDNowPlayingPlayerClient _onQueue_playbackQueueContentItemsArtworkDidChange:]( v33,  "_onQueue_playbackQueueContentItemsArtworkDidChange:",  v13);
    id v7 = 0LL;
    id v6 = v34;
  }
}

- (void)notifyArtworkChangedForContentItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v8 = v4;
    id v6 = [v4 count];
    BOOL v5 = v8;
    if (v6)
    {
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100030A50;
      block[3] = &unk_100398E60;
      block[4] = self;
      id v10 = v8;
      dispatch_sync(serialQueue, block);

      BOOL v5 = v8;
    }
  }
}

- (id)snapshotForPlaybackState:(unsigned int)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_10002DC9C;
  id v12 = sub_10002DCAC;
  id v13 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030B34;
  block[3] = &unk_10039AA08;
  block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)snapshotsForIsPlaying:(BOOL)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030C4C;
  block[3] = &unk_10039AA30;
  BOOL v12 = a3;
  block[4] = self;
  id v11 = v5;
  unsigned int v7 = v5;
  dispatch_sync(serialQueue, block);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient _sortSnapshots:](self, "_sortSnapshots:", v7));

  return v8;
}

- (id)snapshotForIsPlaying:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient snapshotsForIsPlaying:](self, "snapshotsForIsPlaying:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (NSArray)snapshots
{
  uint64_t v6 = 0LL;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10002DC9C;
  uint64_t v10 = sub_10002DCAC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100030E54;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)_sortSnapshots:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_10039AA70];
}

- (id)playbackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10002DC9C;
  v33 = sub_10002DCAC;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  dispatch_queue_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  unsigned int v26 = sub_10002DC9C;
  v27 = sub_10002DCAC;
  id v28 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003103C;
  v17[3] = &unk_10039AA98;
  v17[4] = self;
  id v20 = &v29;
  id v13 = v10;
  id v18 = v13;
  unsigned int v22 = a4;
  id v14 = v11;
  id v19 = v14;
  uint64_t v21 = &v23;
  dispatch_sync(serialQueue, v17);
  if (a6) {
    *a6 = (id) v24[5];
  }
  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (NSArray)participants
{
  participantDataSource = self->_participantDataSource;
  if (participantDataSource || (participantDataSource = self->_remoteParticipantDataSource) != 0LL) {
    participantDataSource = (void *)objc_claimAutoreleasedReturnValue([participantDataSource participants]);
  }
  return (NSArray *)participantDataSource;
}

- (void)registerHandoffSession:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000311A4;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (id)handleHandoffEvent:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_10002DC9C;
  v17 = sub_10002DCAC;
  id v18 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003157C;
  block[3] = &unk_100399CB8;
  BOOL v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
  unsigned int v7 = (void *)v14[5];
  if (v7)
  {
    [v7 handleEvent:v6];
    id v8 = 0LL;
  }

  else
  {
    id v8 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 185LL);
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_handleNowPlayingAppDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v9 = (id)objc_claimAutoreleasedReturnValue(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](self, "playerPath"));
  unsigned int v7 = [v9 isEqual:v6];

  if (v7)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100031690;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_sync(serialQueue, block);
  }
}

- (void)dataSource:(id)a3 didUpdateParticipants:(id)a4
{
  id v5 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031718;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

- (void)_onQueue_canBeNowPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self playerCanBeNowPlayingDidChange:v3];
}

- (void)_onQueue_isPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v3)
  {
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastPlayingDate = self->_lastPlayingDate;
    self->_lastPlayingDate = v5;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self isPlayingDidChange:v3];
}

- (void)_onQueue_pictureInPictureEnabledDidChanged:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self pictureInPictureEnabledDidChange:v3];
}

- (void)_onQueue_playbackStateDidChanged:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v10 = objc_alloc_init(&OBJC_CLASS___MRDNowPlayingPlayerClientPlaybackStateSnapshot);
  -[MRDNowPlayingPlayerClientPlaybackStateSnapshot setPlayerPlaybackState:](v10, "setPlayerPlaybackState:", v5);
  playbackStateHistory = self->_playbackStateHistory;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 playbackState]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](playbackStateHistory, "setObject:forKeyedSubscript:", v10, v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v5 playbackState];

  [WeakRetained nowPlayingPlayerClient:self playbackStateDidChange:v9];
}

- (void)_onQueue_supportedCommandsDidChange:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v5 copy];

  [WeakRetained nowPlayingPlayerClient:self supportedCommandsDidChange:v6];
}

- (void)_onQueue_playbackQueueDidChange:(id)a3 nowPlayingItemChanged:(BOOL)a4
{
  BOOL v4 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [v7 copy];

  [WeakRetained nowPlayingPlayerClient:self playbackQueueDidChange:v8 nowPlayingItemDidChange:v4];
}

- (void)_onQueue_playbackQueueCapabilitiesDidChange:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self playbackQueueCapabilitiesDidChange:a3];
}

- (void)_onQueue_playbackQueueContentItemsDidChange:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v6, 1LL);
    [WeakRetained nowPlayingPlayerClient:self playbackQueueContentItemsDidChange:v5];
  }
}

- (void)_onQueue_playbackQueueContentItemsArtworkDidChange:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v6, 1LL);
    [WeakRetained nowPlayingPlayerClient:self playbackQueueArtworkContentItemsDidChange:v5];
  }
}

- (void)_onQueue_pushState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient _onQueue_playbackState](self, "_onQueue_playbackState"));
  -[MRDNowPlayingPlayerClient setPushStatePlaybackState:](self, "setPushStatePlaybackState:", v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath player](self->_playerPath, "player"));
  id v5 = [v4 copy];
  -[MRDNowPlayingPlayerClient setPushStatePlayer:](self, "setPushStatePlayer:", v5);

  -[MRDNowPlayingPlayerClient setPushStateHasNowPlayingData:]( self,  "setPushStateHasNowPlayingData:",  -[MRDNowPlayingPlayerClient hasNowPlayingData](self, "hasNowPlayingData"));
  -[MRDNowPlayingPlayerClient setPushStatePictureInPictureEnabled:]( self,  "setPushStatePictureInPictureEnabled:",  -[MRDNowPlayingPlayerClient isPictureInPictureEnabled](self, "isPictureInPictureEnabled"));
  -[MRDNowPlayingPlayerClient setPushStateCanBeNowPlayingPlayer:]( self,  "setPushStateCanBeNowPlayingPlayer:",  -[MRDNowPlayingPlayerClient canBeNowPlayingPlayer](self, "canBeNowPlayingPlayer"));
}

- (void)_onQueue_popState
{
  unsigned int v3 = -[MRDNowPlayingPlayerClient hasNowPlayingData](self, "hasNowPlayingData");
  if (v3 != -[MRDNowPlayingPlayerClient pushStateHasNowPlayingData](self, "pushStateHasNowPlayingData"))
  {
    if (v3)
    {
      if (self->_hasNowPlayingDataTransaction) {
        goto LABEL_11;
      }
      uint64_t v5 = _MRLogForCategory(1LL, v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        *(_DWORD *)buf = 138543362;
        *(void *)v82 = playerPath;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingPlayerClient] Taking hasNowPlayingData transaction for %{public}@",  buf,  0xCu);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath description](self->_playerPath, "description"));
      id v9 = (MROSTransaction *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.mediaremoted.MRDNowPlayingPlayerClient/%@",  v8));

      id v10 = -[MROSTransaction initWithName:](objc_alloc(&OBJC_CLASS___MROSTransaction), "initWithName:", v9);
      hasNowPlayingDataTransaction = self->_hasNowPlayingDataTransaction;
      self->_hasNowPlayingDataTransaction = v10;

      MRRegisterTransaction(self->_hasNowPlayingDataTransaction);
    }

    else
    {
      uint64_t v12 = _MRLogForCategory(1LL, v4);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = self->_playerPath;
        *(_DWORD *)buf = 138543362;
        *(void *)v82 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingPlayerClient] Removing hasNowPlayingData transaction for %{public}@",  buf,  0xCu);
      }

      id v9 = self->_hasNowPlayingDataTransaction;
      self->_hasNowPlayingDataTransaction = 0LL;
    }
  }

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (MRDPlaybackQueueParticipantDataSource)participantDataSource
{
  return self->_participantDataSource;
}

- (void)setParticipantDataSource:(id)a3
{
}

- (MRDPlaybackQueueRemoteParticipantDataSource)remoteParticipantDataSource
{
  return self->_remoteParticipantDataSource;
}

- (MRDNowPlayingPlayerClientDelegate)delegate
{
  return (MRDNowPlayingPlayerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pushStateIsPlaying
{
  return self->_pushStateIsPlaying;
}

- (void)setPushStateIsPlaying:(BOOL)a3
{
  self->_pushStateIsPlaying = a3;
}

- (MRDNowPlayingPlayerClientPlaybackState)pushStatePlaybackState
{
  return self->_pushStatePlaybackState;
}

- (void)setPushStatePlaybackState:(id)a3
{
}

- (MRPlayer)pushStatePlayer
{
  return self->_pushStatePlayer;
}

- (void)setPushStatePlayer:(id)a3
{
}

- (BOOL)pushStateHasNowPlayingData
{
  return self->_pushStateHasNowPlayingData;
}

- (void)setPushStateHasNowPlayingData:(BOOL)a3
{
  self->_pushStateHasNowPlayingData = a3;
}

- (BOOL)pushStatePictureInPictureEnabled
{
  return self->_pushStatePictureInPictureEnabled;
}

- (void)setPushStatePictureInPictureEnabled:(BOOL)a3
{
  self->_pushStatePictureInPictureEnabled = a3;
}

- (BOOL)pushStateCanBeNowPlayingPlayer
{
  return self->_pushStateCanBeNowPlayingPlayer;
}

- (void)setPushStateCanBeNowPlayingPlayer:(BOOL)a3
{
  self->_pushStateCanBeNowPlayingPlayer = a3;
}

- (void).cxx_destruct
{
}

@end