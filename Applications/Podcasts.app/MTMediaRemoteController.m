@interface MTMediaRemoteController
- (AFMultiUserConnection)siriMultiUserConnection;
- (BOOL)_commandEventIsFromSiri:(id)a3;
- (BOOL)_commandEventIsInternal:(id)a3;
- (MPRemoteCommandCenter)metadataCommandCenter;
- (MTDefaultsChangeNotifier)defaultsObserver;
- (MTMediaRemoteController)initWithPlayerController:(id)a3;
- (MTPlaybackQueueController)playbackQueueController;
- (MTPlayerController)playerController;
- (MTSiriAnalyticsController)siriAnalyticsController;
- (NSArray)internalRequestLabels;
- (__CFArray)copySupportedCommands;
- (id)_skipBackwardCommandEvent;
- (id)_skipForwardCommandEvent;
- (id)accountFromQueueContainingDsid:(id)a3 error:(id *)a4;
- (int64_t)findIndexOfCommand:(unsigned int)a3 inArray:(__CFArray *)a4;
- (int64_t)remoteChangePlaybackRate:(id)a3;
- (int64_t)remoteNextTrack:(id)a3;
- (int64_t)remotePause:(id)a3;
- (int64_t)remotePreviousTrack:(id)a3;
- (int64_t)remoteSkipPreference;
- (void)accountForRequesterUserId:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)remoteInsertIntoPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remotePlayCommand:(id)a3 completionHandler:(id)a4;
- (void)remotePlayItemInPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteRemoveFromPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteReorderPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteSetMetadataPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteSetPlaybackQueueCommand:(id)a3 isMagicMoment:(BOOL)a4 completionHandler:(id)a5;
- (void)remoteSetPlaybackSessionCommand:(id)a3 completionHandler:(id)a4;
- (void)remoteTogglePlayPauseCommand:(id)a3 completionHandler:(id)a4;
- (void)sessionIdentifierDidChange;
- (void)setDefaultsObserver:(id)a3;
- (void)setInternalRequestLabels:(id)a3;
- (void)setMetadataCommandCenter:(id)a3;
- (void)setPlaybackQueueController:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setRemoteSkipPreference:(int64_t)a3;
- (void)setSiriAnalyticsController:(id)a3;
- (void)setSiriMultiUserConnection:(id)a3;
- (void)updatePreferredSkipDurationsFromUserDefaults:(id)a3 forCommandCenter:(id)a4;
- (void)updateRemoteSkipPreferenceFromDefaults:(id)a3;
@end

@implementation MTMediaRemoteController

- (MTMediaRemoteController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  -[MTMediaRemoteController setPlayerController:](self, "setPlayerController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 playbackQueueController]);
  uint64_t v7 = _MTLogCategoryMediaRemote(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Starting setup of media remote controller for player: %@",  buf,  0xCu);
  }

  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
  v9 = -[MTMediaRemoteController initWithPlayer:](&v48, "initWithPlayer:", v5);
  v10 = v9;
  if (v9)
  {
    -[MTMediaRemoteController setPlaybackQueueController:](v9, "setPlaybackQueueController:", v6);
    [v6 setSessionDelegate:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 commandCenter]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 insertIntoPlaybackQueueCommand]);
    [v12 addTarget:v10 action:"remoteInsertIntoPlaybackQueueCommand:completionHandler:"];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 playItemInQueueCommand]);
    [v13 addTarget:v10 action:"remotePlayItemInPlaybackQueueCommand:completionHandler:"];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 reorderQueueCommand]);
    [v14 addTarget:v10 action:"remoteReorderPlaybackQueueCommand:completionHandler:"];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 removeFromPlaybackQueueCommand]);
    [v15 addTarget:v10 action:"remoteRemoveFromPlaybackQueueCommand:completionHandler:"];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 setPlaybackQueueCommand]);
    [v16 addTarget:v10 action:"remoteSetPlaybackQueueCommand:completionHandler:" usingExtendedStatus:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 playCommand]);
    [v17 addTarget:v10 action:"remotePlayCommand:completionHandler:"];

    if (os_feature_enabled_red_sun())
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 setPlaybackQueueCommand]);
      [v18 registerSupportedQueueType:8];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 setPlaybackSessionCommand]);
    [v19 addTarget:v10 action:"remoteSetPlaybackSessionCommand:completionHandler:"];

    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 setPlaybackSessionCommand]);
    v52 = @"com.apple.podcasts.MTPlaybackQueueController.GenericQueue";
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
    [v20 setSupportedSessionTypes:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 setPlaybackSessionCommand]);
    v51 = @"com.apple.podcasts.MTPlaybackQueueController.GenericQueue";
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
    [v22 setExportableSessionTypes:v23];

    +[MPRemoteCommandCenter updateLaunchCommandsWithConfigurationHandler:]( &OBJC_CLASS___MPRemoteCommandCenter,  "updateLaunchCommandsWithConfigurationHandler:",  &stru_100243160);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
    LODWORD(v23) = v5 == v24;

    if ((_DWORD)v23)
    {
      v25 = objc_alloc(&OBJC_CLASS___MPRemoteCommandCenter);
      v26 = -[MPRemoteCommandCenter initWithPlayerID:](v25, "initWithPlayerID:", kMTPodcastsMagicMomentsPlayerID);
      -[MTMediaRemoteController setMetadataCommandCenter:](v10, "setMetadataCommandCenter:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController metadataCommandCenter](v10, "metadataCommandCenter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 setPlaybackQueueCommand]);
      [v28 addTarget:v10 action:"remoteSetMetadataPlaybackQueueCommand:completionHandler:" usingExtendedStatus:1];
    }

    objc_initWeak((id *)buf, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
    v50[0] = kMTSkipForwardIntervalDefaultKey;
    v50[1] = kMTSkipBackwardsIntervalDefaultKey;
    v50[2] = kMTRemoteSkipInsteadOfNextTrackDefaultKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 3LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));

    v32 = -[MTDefaultsChangeNotifier initWithProperties:defaults:]( objc_alloc(&OBJC_CLASS___MTDefaultsChangeNotifier),  "initWithProperties:defaults:",  v31,  v29);
    defaultsObserver = v10->_defaultsObserver;
    v10->_defaultsObserver = v32;

    v34 = v10->_defaultsObserver;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000997E4;
    v44[3] = &unk_100243188;
    objc_copyWeak(&v47, (id *)buf);
    id v35 = v29;
    id v45 = v35;
    id v36 = v11;
    id v46 = v36;
    -[MTDictionaryDiff addCallback:](v34, "addCallback:", v44);
    -[MTDefaultsChangeNotifier start](v10->_defaultsObserver, "start");
    -[MTMediaRemoteController updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:]( v10,  "updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:",  v35,  v36);
    -[MTMediaRemoteController updateRemoteSkipPreferenceFromDefaults:]( v10,  "updateRemoteSkipPreferenceFromDefaults:",  v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[MTSiriAnalyticsController sharedInstance]( &OBJC_CLASS___MTSiriAnalyticsController,  "sharedInstance"));
    -[MTMediaRemoteController setSiriAnalyticsController:](v10, "setSiriAnalyticsController:", v37);

    v49[0] = @"PlayerBar";
    v49[1] = @"PlayerBar";
    v49[2] = @"PlayState";
    v49[3] = @"MiniPlayer";
    v49[4] = @"NowPlaying";
    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 5LL));
    internalRequestLabels = v10->_internalRequestLabels;
    v10->_internalRequestLabels = (NSArray *)v39;

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
  }

  uint64_t v41 = _MTLogCategoryMediaRemote(v9);
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Finished setup of media remote controller for player: %@",  buf,  0xCu);
  }

  return v10;
}

- (AFMultiUserConnection)siriMultiUserConnection
{
  siriMultiUserConnection = self->_siriMultiUserConnection;
  if (!siriMultiUserConnection)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___AFMultiUserConnection);
    v5 = self->_siriMultiUserConnection;
    self->_siriMultiUserConnection = v4;

    siriMultiUserConnection = self->_siriMultiUserConnection;
  }

  return siriMultiUserConnection;
}

- (void)accountForRequesterUserId:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController siriMultiUserConnection](self, "siriMultiUserConnection"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009993C;
  v10[3] = &unk_1002431D8;
  id v11 = v6;
  id v9 = v6;
  [v8 getHomeUserIdForSharedUserId:v7 completion:v10];
}

- (id)accountFromQueueContainingDsid:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"enqueuerDSID"]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ic_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ic_sharedAccountStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_storeAccountForStoreAccountID:error:", v6, a4));

    uint64_t v10 = _MTLogCategoryMediaRemote(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Found account %@ with error %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 commandCenter]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setPlaybackQueueCommand]);
  [v5 removeTarget:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 commandCenter]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playCommand]);
  [v8 removeTarget:self];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController defaultsObserver](self, "defaultsObserver"));
  [v9 stop];

  -[MTMediaRemoteController setDefaultsObserver:](self, "setDefaultsObserver:", 0LL);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
  -[MTMediaRemoteController dealloc](&v10, "dealloc");
}

- (__CFArray)copySupportedCommands
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
  v3 = -[MTMediaRemoteController copySupportedCommands](&v9, "copySupportedCommands");
  id v4 = (const void *)MRMediaRemoteCommandInfoCreate(kCFAllocatorDefault);
  MRMediaRemoteCommandInfoSetCommand(v4, 123LL);
  MRMediaRemoteCommandInfoSetEnabled(v4, 1LL);
  CFArrayAppendValue(v3, v4);
  CFRelease(v4);
  v5 = (const void *)MRMediaRemoteCommandInfoCreate(kCFAllocatorDefault);
  MRMediaRemoteCommandInfoSetCommand(v5, 124LL);
  MRMediaRemoteCommandInfoSetEnabled(v5, 1LL);
  CFArrayAppendValue(v3, v5);
  CFRelease(v5);
  CFIndex v6 = -[MTMediaRemoteController findIndexOfCommand:inArray:](self, "findIndexOfCommand:inArray:", 4LL, v3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    CFArrayRemoveValueAtIndex(v3, v6);
  }
  CFIndex v7 = -[MTMediaRemoteController findIndexOfCommand:inArray:](self, "findIndexOfCommand:inArray:", 5LL, v3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    CFArrayRemoveValueAtIndex(v3, v7);
  }
  return v3;
}

- (int64_t)findIndexOfCommand:(unsigned int)a3 inArray:(__CFArray *)a4
{
  if (CFArrayGetCount(a4) < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFIndex v6 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, v6);
    if (++v6 >= CFArrayGetCount(a4)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v6;
}

- (void)remoteInsertIntoPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackQueue]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPGenericTracklistPlaybackQueue);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackQueue]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 trackIdentifiers]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009A1AC;
    v14[3] = &unk_100243200;
    id v17 = v7;
    id v15 = v6;
    uint64_t v16 = self;
    [v13 fetchPlayerItemsForPlaybackQueueRequestIdentifiers:v12 completion:v14];
  }

  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 200LL);
  }
}

- (void)remotePlayItemInPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItemID]);

  [v7 playItemWithContentID:v8];
  v9[2]();
}

- (void)remoteReorderPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  objc_super v10 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItemID]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAfterContextItemID]);

  [v7 reorderItemWithContentId:v8 afterItemWithContentID:v9];
  v10[2]();
}

- (void)remoteRemoveFromPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItemID]);

  [v7 removeItemWithContentID:v8];
  v9[2]();
}

- (void)remoteSetMetadataPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
}

- (void)remoteSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
}

- (void)remoteSetPlaybackQueueCommand:(id)a3 isMagicMoment:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  uint64_t v10 = _MTLogCategoryMediaRemote(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set Playback Queue: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackQueue]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLocalMediaQueryRemotePlaybackQueue);
  char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v16 = _MTLogCategoryMediaRemote(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "remoteSetPlaybackQueueCommand with playbackQueue type MPLocalMediaQueryRemotePlaybackQueue",  buf,  2u);
    }

    v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([v8 playbackQueue]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 mediaQuery]);
    v20 = objc_alloc(&OBJC_CLASS___MTMediaQueryManifest);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 firstItem]);
    v22 = -[MTMediaQueryManifest initWithMediaQuery:initialItem:](v20, "initWithMediaQuery:initialItem:", v19, v21);

    id v23 = [v18 isRequestingImmediatePlayback];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
    [v24 setManifest:v22 startPlayback:v23 reason:7 interactive:0 completion:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[MPRemoteCommandStatus statusWithCode:]( &OBJC_CLASS___MPRemoteCommandStatus,  "statusWithCode:",  0LL));
    v9[2](v9, v25);

    goto LABEL_71;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackQueue]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___MPGenericTracklistPlaybackQueue);
  char v28 = objc_opt_isKindOfClass(v26, v27);

  v29 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([v8 playbackQueue]);
  v18 = v29;
  if ((v28 & 1) == 0)
  {
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___MPEmptyPlaybackQueue);
    char v32 = objc_opt_isKindOfClass(v18, v31);

    if ((v32 & 1) != 0)
    {
      if (os_feature_enabled_red_sun())
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
        [v34 clearUpNextManifest];

        v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[MPRemoteCommandStatus statusWithCode:]( &OBJC_CLASS___MPRemoteCommandStatus,  "statusWithCode:",  0LL));
        v9[2](v9, v18);
      }

      else
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472LL;
        v112[2] = sub_10009BAC4;
        v112[3] = &unk_1002400E8;
        v113 = v9;
        [v75 clearPlayerManifestWithCompletion:v112];

        v18 = v113;
      }

      goto LABEL_71;
    }

- (void)remoteSetPlaybackSessionCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackSessionData]);
  v37[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v37[1] = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  id v34 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v10,  v8,  &v34));
  id v12 = v34;

  uint64_t v14 = _MTLogCategoryMediaRemote(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Set Playback Session: %@", buf, 0xCu);
  }

  if (v12 || (id v16 = [v11 count]) == 0)
  {
    uint64_t v17 = _MTLogCategoryMediaRemote(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to set playback session, unarchiving error: %@",  buf,  0xCu);
    }

    if (v7) {
      v7[2](v7, 200LL);
    }
  }

  else
  {
    v19 = objc_alloc(&OBJC_CLASS___MTURLCommandRequest);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v21 = -[MTURLCommandRequest initWithURLString:](v19, "initWithURLString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest requesterDsid](v21, "requesterDsid"));

    uint64_t v24 = _MTLogCategoryMediaRemote(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Set Playback Session enqueuer DSID: %@",  buf,  0xCu);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ic_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ic_sharedAccountStore"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v22 longLongValue]));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10009BE5C;
    v29[3] = &unk_100243340;
    id v30 = v22;
    uint64_t v31 = self;
    id v32 = v11;
    uint64_t v33 = v7;
    id v28 = v22;
    objc_msgSend(v26, "ic_storeAccountForStoreAccountID:completion:", v27, v29);
  }
}

- (void)remotePlayCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaRemoteOptions]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kMRMediaRemoteOptionInterruptionEvent]);
  id v10 = [v9 BOOLValue];

  uint64_t v12 = _MTLogCategoryMediaRemote(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received remotePlay: %@", buf, 0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 player]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 manifest]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentItem]);

  if (v17)
  {
    if (-[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v6))
    {
      uint64_t v18 = 9LL;
    }

    else if (-[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v6))
    {
      uint64_t v18 = 7LL;
    }

    else
    {
      uint64_t v18 = 8LL;
    }

    unsigned int v19 = [v14 playWithReason:v18 interruptEvent:v10];
    if (v7)
    {
      if (v19) {
        uint64_t v20 = 0LL;
      }
      else {
        uint64_t v20 = 200LL;
      }
      v7[2](v7, v20);
    }
  }

  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10009C330;
    v21[3] = &unk_100243390;
    id v22 = v14;
    char v25 = (char)v10;
    uint64_t v23 = self;
    uint64_t v24 = v7;
    [v22 restorePlayerManifestWithCompletion:v21];
  }
}

- (int64_t)remotePause:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
  return -[MTMediaRemoteController remotePause:](&v4, "remotePause:", a3);
}

- (void)remoteTogglePlayPauseCommand:(id)a3 completionHandler:(id)a4
{
  v8[1] = 3221225472LL;
  v8[2] = sub_10009C544;
  v8[3] = &unk_100240A30;
  id v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
  v8[0] = _NSConcreteStackBlock;
  id v6 = v9;
  -[MTMediaRemoteController remoteTogglePlayPauseCommand:completionHandler:]( &v7,  "remoteTogglePlayPauseCommand:completionHandler:",  a3,  v8);
}

- (int64_t)remoteNextTrack:(id)a3
{
  id v4 = a3;
  if ((id)-[MTMediaRemoteController remoteSkipPreference](self, "remoteSkipPreference") != (id)1
    || -[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v4)
    || -[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
    id v5 = -[MTMediaRemoteController remoteNextTrack:](&v8, "remoteNextTrack:", v4);
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController _skipForwardCommandEvent](self, "_skipForwardCommandEvent"));
    id v5 = -[MTMediaRemoteController remoteSkipForward:](self, "remoteSkipForward:", v7);
  }

  return (int64_t)v5;
}

- (int64_t)remotePreviousTrack:(id)a3
{
  id v4 = a3;
  if ((id)-[MTMediaRemoteController remoteSkipPreference](self, "remoteSkipPreference") != (id)1
    || -[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v4)
    || -[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTMediaRemoteController;
    id v5 = -[MTMediaRemoteController remotePreviousTrack:](&v8, "remotePreviousTrack:", v4);
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController _skipBackwardCommandEvent](self, "_skipBackwardCommandEvent"));
    id v5 = -[MTMediaRemoteController remoteSkipBackward:](self, "remoteSkipBackward:", v7);
  }

  return (int64_t)v5;
}

- (int64_t)remoteChangePlaybackRate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);
  unsigned __int8 v7 = [v6 isVideo];

  if ((v7 & 1) != 0) {
    goto LABEL_8;
  }
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));

  if (!v8) {
    goto LABEL_9;
  }
  [v4 playbackRate];
  if (v9 <= 0.0)
  {
    [v4 playbackRate];
    if (v11 < 0.0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
      [v10 previousRemote];
      goto LABEL_7;
    }

- (void)sessionIdentifierDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 commandCenter]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 setPlaybackSessionCommand]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionIdentifier]);
  [v4 setCurrentPlaybackSessionIdentifier:v6];
}

- (void)updatePreferredSkipDurationsFromUserDefaults:(id)a3 forCommandCenter:(id)a4
{
  uint64_t v5 = kMTSkipForwardIntervalDefaultKey;
  id v6 = a4;
  id v7 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v7 valueForKey:v5]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:kMTSkipBackwardsIntervalDefaultKey]);

  float v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_100254BD8,  &off_100254BF0,  &off_100254C08,  &off_100254C20,  &off_100254C38,  0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_100254BD8,  &off_100254BF0,  &off_100254C08,  &off_100254C20,  &off_100254C38,  0LL));
  if (v13)
  {
    [v9 removeObject:v13];
    [v9 insertObject:v13 atIndex:0];
  }

  if (v8)
  {
    [v10 removeObject:v8];
    [v10 insertObject:v8 atIndex:0];
  }

  float v11 = (void *)objc_claimAutoreleasedReturnValue([v6 skipForwardCommand]);
  [v11 setPreferredIntervals:v9];

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 skipBackwardCommand]);
  [v12 setPreferredIntervals:v10];
}

- (void)updateRemoteSkipPreferenceFromDefaults:(id)a3
{
}

- (BOOL)_commandEventIsFromSiri:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaRemoteOptions]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier]);

  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.MediaAssistant"];
  }

  return v5;
}

- (BOOL)_commandEventIsInternal:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaRemoteOptions]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier]);

  LOBYTE(self) = -[NSArray containsObject:](self->_internalRequestLabels, "containsObject:", v5);
  return (char)self;
}

- (id)_skipForwardCommandEvent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 commandCenter]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 skipForwardCommand]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredIntervals]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  [v6 doubleValue];
  id v7 = objc_msgSend(v4, "newCommandEventWithInterval:");

  return v7;
}

- (id)_skipBackwardCommandEvent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 commandCenter]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 skipBackwardCommand]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredIntervals]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  [v6 doubleValue];
  id v7 = objc_msgSend(v4, "newCommandEventWithInterval:");

  return v7;
}

- (MPRemoteCommandCenter)metadataCommandCenter
{
  return self->_metadataCommandCenter;
}

- (void)setMetadataCommandCenter:(id)a3
{
}

- (int64_t)remoteSkipPreference
{
  return self->_remoteSkipPreference;
}

- (void)setRemoteSkipPreference:(int64_t)a3
{
  self->_remoteSkipPreference = a3;
}

- (MTSiriAnalyticsController)siriAnalyticsController
{
  return self->_siriAnalyticsController;
}

- (void)setSiriAnalyticsController:(id)a3
{
}

- (void)setSiriMultiUserConnection:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsObserver
{
  return self->_defaultsObserver;
}

- (void)setDefaultsObserver:(id)a3
{
}

- (NSArray)internalRequestLabels
{
  return self->_internalRequestLabels;
}

- (void)setInternalRequestLabels:(id)a3
{
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
}

- (MTPlaybackQueueController)playbackQueueController
{
  return self->_playbackQueueController;
}

- (void)setPlaybackQueueController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end