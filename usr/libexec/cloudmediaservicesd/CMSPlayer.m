@interface CMSPlayer
- (AVAudioSession)currentAudioSession;
- (BOOL)_validatePrerollContextFromPlayerPointer:(id)a3;
- (BOOL)_validateServiceContextFromPlayerPointer:(id)a3;
- (BOOL)isNowPlayingApp;
- (CMSContentManager)contentManager;
- (CMSLoggingSession)CMSLoggingSession;
- (CMSMPNowPlayingInfoManager)infoManager;
- (CMSMRMediaRemoteCommandHandler)commandHandler;
- (CMSMediaRemoteController)MRController;
- (CMSPlayStateManager)playStateManager;
- (CMSPlayer)initWithPlayerPath:(id)a3;
- (CMSPlayer)initWithPlayerPath:(id)a3 audioSession:(id)a4;
- (CMSPlayerDelegate)delegate;
- (CMSPlayerPointer)playerPointer;
- (CMSPlayerPointer)prerollPointer;
- (MRPlayerPath)playerPath;
- (NSDictionary)getCurrentPlaybackQueue;
- (NSString)applicationBundleID;
- (NSString)description;
- (NSString)serviceAccountHomeUserID;
- (NSString)serviceBundleIdentifier;
- (int64_t)commandHandler:(id)a3 handleMRRemoteCommand:(unsigned int)a4 withOptions:(id)a5;
- (void)_configurePlayerWith:(id)a3 playerPointer:(id)a4 configURL:(id)a5 completionHandler:(id)a6;
- (void)_playMediaForUserActivityDictionary:(id)a3 withPlayerPointer:(id)a4;
- (void)_setupAwaitStartPlayingNotification;
- (void)_updateAudioSessionProperties:(id)a3;
- (void)audioSessionMediaServicesRestarted;
- (void)audioSessionMediaServicesWereLost;
- (void)authRenewalForSessionIdentifier:(id)a3 parentNetworkActivity:(id)a4 completion:(id)a5;
- (void)configureAGPlayerSession:(id)a3 withInitialQueueSegment:(id)a4 initialUserActivity:(id)a5 initialNetworkActivity:(id)a6 playerPointer:(id)a7;
- (void)dealloc;
- (void)didRequestNowPlayingPlayerResignation:(id)a3;
- (void)didRequestToBecomeNowPlayingPlayer:(id)a3;
- (void)initiatePlayback;
- (void)invalidateAudioObjects;
- (void)invalidateNowPlayingInfo;
- (void)pause;
- (void)playStateManager:(id)a3 nowPlayingApplicationChanged:(BOOL)a4;
- (void)setCMSLoggingSession:(id)a3;
- (void)setCommandHandler:(id)a3;
- (void)setContentManager:(id)a3;
- (void)setCurrentAudioSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsNowPlayingApp:(BOOL)a3;
- (void)setMRController:(id)a3;
- (void)setPlayStateManager:(id)a3;
- (void)setPlayerPointer:(id)a3;
- (void)setPrerollPointer:(id)a3;
- (void)setServiceAccountHomeUserID:(id)a3;
- (void)setServiceBundleIdentifier:(id)a3;
- (void)updateAudioSession:(id)a3;
@end

@implementation CMSPlayer

- (CMSPlayer)initWithPlayerPath:(id)a3 audioSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CMSPlayer;
  v9 = -[CMSPlayer init](&v22, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  if (!v7)
  {
LABEL_9:
    v18 = 0LL;
    goto LABEL_10;
  }

  v9->_shouldRecoverCommands = 0;
  objc_storeStrong((id *)&v9->_playerPath, a3);
  v11 = -[CMSMRMediaRemoteCommandHandler initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___CMSMRMediaRemoteCommandHandler),  "initWithPlayerPath:",  v10->_playerPath);
  commandHandler = v10->_commandHandler;
  v10->_commandHandler = v11;

  v13 = v10->_commandHandler;
  if (!v13)
  {
    uint64_t v19 = _CMSQLoggingFacility(0LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000FC10();
    }

    goto LABEL_9;
  }

  -[CMSMRMediaRemoteCommandHandler setDelegate:](v13, "setDelegate:", v10);
  v10->_playMediaStateLock._os_unfair_lock_opaque = 0;
  -[CMSPlayer updateAudioSession:](v10, "updateAudioSession:", v8);
  v14 = objc_alloc(&OBJC_CLASS___CMSPlayStateManager);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  v16 = -[CMSPlayStateManager initWithOrigin:](v14, "initWithOrigin:", v15);
  playStateManager = v10->_playStateManager;
  v10->_playStateManager = v16;

  -[CMSPlayStateManager setPlayStateManagerDelegate:](v10->_playStateManager, "setPlayStateManagerDelegate:", v10);
LABEL_5:
  v18 = v10;
LABEL_10:

  return v18;
}

- (CMSPlayer)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  v6 = -[CMSPlayer initWithPlayerPath:audioSession:](self, "initWithPlayerPath:audioSession:", v4, v5);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMSPlayer;
  -[CMSPlayer dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CMSPlayer: PlayerPath %@, AudioSession: %u, NowPlayingApp: %d >",  self->_playerPath,  -[AVAudioSession opaqueSessionID](self->_currentAudioSession, "opaqueSessionID"),  -[CMSPlayer isNowPlayingApp](self, "isNowPlayingApp"));
}

- (void)updateAudioSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer currentAudioSession](self, "currentAudioSession"));
  objc_sync_enter(v5);
  -[CMSPlayer setCurrentAudioSession:](self, "setCurrentAudioSession:", v4);
  objc_sync_exit(v5);

  -[CMSPlayer _updateAudioSessionProperties:](self, "_updateAudioSessionProperties:", v4);
  contentManager = self->_contentManager;
  if (contentManager)
  {
    -[CMSContentManager setAudioSession:](contentManager, "setAudioSession:", v4);
  }

  else
  {
    uint64_t v7 = _CMSQLoggingFacility(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000FC70(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)audioSessionMediaServicesRestarted
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer currentAudioSession](self, "currentAudioSession"));
  -[CMSPlayer _updateAudioSessionProperties:](self, "_updateAudioSessionProperties:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
  [v4 audioSessionMediaServicesRestarted];
}

- (void)audioSessionMediaServicesWereLost
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
  [v2 audioSessionMediaServicesWereLost];
}

- (NSDictionary)getCurrentPlaybackQueue
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentPlaybackQueue]);

  return (NSDictionary *)v3;
}

- (void)pause
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
  [v2 pause];
}

- (void)invalidateNowPlayingInfo
{
}

- (CMSMPNowPlayingInfoManager)infoManager
{
  return (CMSMPNowPlayingInfoManager *)-[CMSContentManager MPInfoManager](self->_contentManager, "MPInfoManager");
}

- (NSString)applicationBundleID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer infoManager](self, "infoManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);

  return (NSString *)v3;
}

- (void)initiatePlayback
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMSProcessTransaction sharedTransaction](&OBJC_CLASS___CMSProcessTransaction, "sharedTransaction"));
  [v3 setActive:1];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 queueController]);
  [v4 play];
}

- (void)invalidateAudioObjects
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
  [v3 invalidate];

  id v4 = objc_autoreleasePoolPush();
  -[CMSContentManager setQueueController:](self->_contentManager, "setQueueController:", 0LL);
  contentManager = self->_contentManager;
  self->_contentManager = 0LL;

  objc_autoreleasePoolPop(v4);
}

- (void)authRenewalForSessionIdentifier:(id)a3 parentNetworkActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MediaServiceConfiguration sharedInstance](&OBJC_CLASS___MediaServiceConfiguration, "sharedInstance"));
  uint64_t v12 = self->_playerPointer;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer appBundleIdentifier](v12, "appBundleIdentifier"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer userAccountHomeUserID](v12, "userAccountHomeUserID"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer endpointIdentifier](v12, "endpointIdentifier"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100009E30;
  v20[3] = &unk_10001C998;
  id v21 = v11;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  [v19 getCachedServiceInfo:v13 homeUserID:v14 endpointID:v15 completion:v20];
}

- (void)_playMediaForUserActivityDictionary:(id)a3 withPlayerPointer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cachedEndpointConfigurationURL]);
  if (v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
    if (v9)
    {
      id v10 = [v7 preroll];
      int v11 = (int)v10;
      uint64_t v12 = _CMSQLoggingFacility(v10);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v11) {
          int v14 = 89;
        }
        else {
          int v14 = 78;
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
        *(_DWORD *)buf = 136315650;
        v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v14;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Preroll state (%c) PlayerPointer Desc (%@)",  buf,  0x1Cu);
      }

      p_playMediaStateLock = &self->_playMediaStateLock;
      os_unfair_lock_lock(&self->_playMediaStateLock);
      if (v11)
      {
        prerollPointer = self->_prerollPointer;
        if (prerollPointer)
        {
          uint64_t v19 = _CMSQLoggingFacility(v17);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer sessionIdentifier](self->_prerollPointer, "sessionIdentifier"));
            *(_DWORD *)buf = 136315394;
            v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
            __int16 v55 = 2114;
            *(void *)v56 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s abandoning previous prerollPointer for session %{public}@",  buf,  0x16u);
          }

          prerollPointer = self->_prerollPointer;
        }

        self->_prerollPointer = 0LL;

        if (self->_isPrerollingContent)
        {
          uint64_t v23 = _CMSQLoggingFacility(v22);
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s restarting after attempting to preroll in the past",  buf,  0xCu);
          }
        }

        self->_isPrerollingContent = 1;
        os_unfair_lock_unlock(&self->_playMediaStateLock);
        uint64_t v26 = _CMSQLoggingFacility(v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s prerolling", buf, 0xCu);
        }

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_10000A694;
        v52[3] = &unk_10001C9C0;
        v52[4] = self;
        -[CMSPlayer _configurePlayerWith:playerPointer:configURL:completionHandler:]( self,  "_configurePlayerWith:playerPointer:configURL:completionHandler:",  v6,  v7,  v9,  v52);
      }

      else
      {
        uint64_t v31 = _CMSQLoggingFacility(v17);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer sessionIdentifier](self->_playerPointer, "sessionIdentifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionIdentifier]);
          *(_DWORD *)buf = 136315650;
          v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
          __int16 v55 = 2114;
          *(void *)v56 = v33;
          *(_WORD *)&v56[8] = 2114;
          *(void *)&v56[10] = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s compare _playPointer for session %{public}@ vs new session %{public}@",  buf,  0x20u);
        }

        BOOL v35 = -[CMSPlayer _validatePrerollContextFromPlayerPointer:]( self,  "_validatePrerollContextFromPlayerPointer:",  v7);
        if (v35)
        {
          if (self->_isPrerollingContent)
          {
            uint64_t v36 = _CMSQLoggingFacility(v35);
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionIdentifier]);
              *(_DWORD *)buf = 136315394;
              v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
              __int16 v55 = 2114;
              *(void *)v56 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s still waiting on preroll for session %{public}@",  buf,  0x16u);
            }

            objc_storeStrong((id *)&self->_prerollPointer, a4);
            self->_isPrerollingContent = 0;
          }

          else
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
            id v44 = [v43 idleReason];

            uint64_t v46 = _CMSQLoggingFacility(v45);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
            if (v44)
            {
              if (v48)
              {
                uint64_t v49 = CMSPlaybackQueueControllerIdleReasonToString(v44);
                v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                *(_DWORD *)buf = 136315394;
                v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
                __int16 v55 = 2112;
                *(void *)v56 = v50;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s preventing starting playback from preroll. discovered the queue controller idled due to: %@",  buf,  0x16u);
              }
            }

            else
            {
              if (v48)
              {
                *(_DWORD *)buf = 136315138;
                v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s start playback from prerolled state",  buf,  0xCu);
              }

              -[CMSPlayer initiatePlayback](self, "initiatePlayback");
            }
          }
        }

        else
        {
          if (self->_isPrerollingContent)
          {
            v39 = self->_prerollPointer;
            self->_prerollPointer = 0LL;

            self->_isPrerollingContent = 0;
            uint64_t v41 = _CMSQLoggingFacility(v40);
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v54 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]";
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s prerolled state invalidated before preroll could complete",  buf,  0xCu);
            }
          }

          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472LL;
          v51[2] = sub_10000A918;
          v51[3] = &unk_10001C9C0;
          v51[4] = self;
          -[CMSPlayer _configurePlayerWith:playerPointer:configURL:completionHandler:]( self,  "_configurePlayerWith:playerPointer:configURL:completionHandler:",  v6,  v7,  v9,  v51);
        }

        os_unfair_lock_unlock(p_playMediaStateLock);
      }
    }

    else
    {
      uint64_t v29 = _CMSQLoggingFacility(0LL);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10000FDE4();
      }
    }
  }

  else
  {
    uint64_t v28 = _CMSQLoggingFacility(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000FDB8();
    }
  }
}

- (int64_t)commandHandler:(id)a3 handleMRRemoteCommand:(unsigned int)a4 withOptions:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = (void *)MRMediaRemoteCopyCommandDescription(v5);
  uint64_t v9 = _CMSQLoggingFacility(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v90 = 136315394;
    v91 = "-[CMSPlayer commandHandler:handleMRRemoteCommand:withOptions:]";
    __int16 v92 = 2112;
    v93 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Received MR command %@",  (uint8_t *)&v90,  0x16u);
  }

  switch((int)v5)
  {
    case 0:
      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      if (!v30)
      {
        uint64_t v86 = _CMSQLoggingFacility(0LL);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }

      uint64_t v12 = (os_log_s *)v30;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[CMSProcessTransaction sharedTransaction]( &OBJC_CLASS___CMSProcessTransaction,  "sharedTransaction"));
      [v31 setActive:1];

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s contentItems](v12, "contentItems"));
      id v33 = [v32 count];

      uint64_t v35 = _CMSQLoggingFacility(v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v37)
        {
          LOWORD(v90) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Starting playback with something in the queue",  (uint8_t *)&v90,  2u);
        }

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
        [v26 play];
        goto LABEL_72;
      }

      if (v37)
      {
        LOWORD(v90) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Starting on an empty queue but active NowPlaying session. Fetching new queue segment using last session info.",  (uint8_t *)&v90,  2u);
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userActivityDictionary](v12, "userActivityDictionary"));
      contentManager = self->_contentManager;
      goto LABEL_71;
    case 1:
    case 3:
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      -[os_log_s pause](v12, "pause");
      goto LABEL_73;
    case 2:
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));

      if (v38)
      {
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
        -[os_log_s handleTogglePlayPause](v12, "handleTogglePlayPause");
        goto LABEL_73;
      }

      uint64_t v87 = _CMSQLoggingFacility(v39);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_63:
      }
        sub_10000FED0();
LABEL_64:
      int64_t v29 = 100LL;
      goto LABEL_74;
    case 4:
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager MRController](self->_contentManager, "MRController"));
      id v13 = -[os_log_s handleMRNextTrackCommand:withOptions:](v12, "handleMRNextTrackCommand:withOptions:", 4LL, v7);
      goto LABEL_28;
    case 5:
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager MRController](self->_contentManager, "MRController"));
      id v13 = -[os_log_s handleMRPreviousTrackCommand:withOptions:]( v12,  "handleMRPreviousTrackCommand:withOptions:",  5LL,  v7);
      goto LABEL_28;
    case 6:
    case 7:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 20:
      goto LABEL_16;
    case 8:
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 queueController]);
      unsigned int v42 = [v41 currentItemSupportsFastForward];

      if (!v42) {
        goto LABEL_38;
      }
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s queueController](v12, "queueController"));
      id v44 = v43;
      uint64_t v45 = 2LL;
      goto LABEL_37;
    case 9:
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 queueController]);
      unsigned int v48 = [v47 currentItemSupportsFastForward];

      if (!v48) {
        goto LABEL_38;
      }
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s queueController](v12, "queueController"));
      id v44 = v43;
      uint64_t v45 = 3LL;
      goto LABEL_37;
    case 10:
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 queueController]);
      unsigned int v51 = [v50 currentItemSupportsRewind];

      if (!v51) {
        goto LABEL_38;
      }
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s queueController](v12, "queueController"));
      id v44 = v43;
      uint64_t v45 = 0LL;
      goto LABEL_37;
    case 11:
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 queueController]);
      unsigned int v54 = [v53 currentItemSupportsRewind];

      if (!v54)
      {
LABEL_38:
        int64_t v29 = 200LL;
        goto LABEL_75;
      }

      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s queueController](v12, "queueController"));
      id v44 = v43;
      uint64_t v45 = 1LL;
LABEL_37:
      [v43 toggleRewindFastForwardMode:v45];

      goto LABEL_73;
    case 17:
    case 18:
    case 24:
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager MRController](self->_contentManager, "MRController"));
      id v13 = -[os_log_s handleTransitionWithinTrack:withOptions:]( v12,  "handleTransitionWithinTrack:withOptions:",  v5,  v7);
LABEL_28:
      int64_t v29 = (int64_t)v13;
      goto LABEL_74;
    case 19:
      __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionPlaybackRate]);
      [v55 floatValue];
      int v57 = v56;

      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      LODWORD(v58) = v57;
      -[os_log_s setPlaybackRate:](v12, "setPlaybackRate:", v58);
      goto LABEL_73;
    case 21:
      v59 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionIsNegative]);
      id v60 = [v59 BOOLValue];

      uint64_t v62 = _CMSQLoggingFacility(v61);
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = @"YES";
        if ((_DWORD)v60) {
          v64 = @"NO";
        }
        int v90 = 138412290;
        v91 = (const char *)v64;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Informing 3P server user liked track: %@",  (uint8_t *)&v90,  0xCu);
      }

      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      -[os_log_s likeTrack:](v12, "likeTrack:", v60);
      goto LABEL_73;
    case 22:
      v65 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionIsNegative]);
      id v66 = [v65 BOOLValue];

      uint64_t v68 = _CMSQLoggingFacility(v67);
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = @"YES";
        if ((_DWORD)v66) {
          v70 = @"NO";
        }
        int v90 = 138412290;
        v91 = (const char *)v70;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Informing 3P server user disliked track: %@",  (uint8_t *)&v90,  0xCu);
      }

      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      -[os_log_s dislikeTrack:](v12, "dislikeTrack:", v66);
      goto LABEL_73;
    case 23:
      v71 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionIsNegative]);
      id v72 = [v71 BOOLValue];

      uint64_t v74 = _CMSQLoggingFacility(v73);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = @"YES";
        if ((_DWORD)v72) {
          v76 = @"NO";
        }
        int v90 = 138412290;
        v91 = (const char *)v76;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Informing 3P server user bookmarked track : %@",  (uint8_t *)&v90,  0xCu);
      }

      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSContentManager queueController](self->_contentManager, "queueController"));
      -[os_log_s bookmarkTrack:](v12, "bookmarkTrack:", v72);
      goto LABEL_73;
    case 25:
      v77 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionRepeatMode]);
      unsigned int v78 = [v77 integerValue];

      uint64_t v80 = _CMSQLoggingFacility(v79);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_73;
      }
      int v90 = 67109120;
      LODWORD(v91) = v78;
      v81 = "Informing 3P server about the change in repeat mode : %d";
      goto LABEL_59;
    case 26:
      v82 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMRMediaRemoteOptionShuffleMode]);
      unsigned int v83 = [v82 integerValue];

      uint64_t v85 = _CMSQLoggingFacility(v84);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_73;
      }
      int v90 = 67109120;
      LODWORD(v91) = v83;
      v81 = "Informing 3P server about the change in Shuffle mode : %d";
LABEL_59:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v81, (uint8_t *)&v90, 8u);
      goto LABEL_73;
    default:
      if ((_DWORD)v5 == 122)
      {
        uint64_t v14 = _CMSQLoggingFacility(v11);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v90 = 138412290;
          v91 = (const char *)v7;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received RemoteCommandSetPlaybackQueue with Options..%@",  (uint8_t *)&v90,  0xCu);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CMSMRRemoteMediaPlaybackUtility dataFromCustomPlaybackQueue:]( &OBJC_CLASS___CMSMRRemoteMediaPlaybackUtility,  "dataFromCustomPlaybackQueue:",  v7));
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CMSMRRemoteMediaPlaybackUtility CMSPlaybackQueueContextFromData:]( &OBJC_CLASS___CMSMRRemoteMediaPlaybackUtility,  "CMSPlaybackQueueContextFromData:",  v16));

        uint64_t v18 = _CMSQLoggingFacility(v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v12)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s description](v12, "description"));
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s playerPointer](v12, "playerPointer"));
            else {
              uint64_t v23 = @"NO";
            }
            id v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userActivityDictionary](v12, "userActivityDictionary"));
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s playerPointer](v12, "playerPointer"));
            int v90 = 136316162;
            v91 = "-[CMSPlayer commandHandler:handleMRRemoteCommand:withOptions:]";
            __int16 v92 = 2112;
            v93 = v21;
            __int16 v94 = 2112;
            v95 = v23;
            __int16 v96 = 2112;
            v97 = v24;
            __int16 v98 = 2112;
            v99 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s PlaybackQueueContext Desc %@\n Preroll State (%@) Initiating PlayMediaItem with UserActivityDictionary %@ playerPointer %@",  (uint8_t *)&v90,  0x34u);
          }

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userActivityDictionary](v12, "userActivityDictionary"));
          contentManager = v12;
LABEL_71:
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[CMSContentManager playerPointer](contentManager, "playerPointer"));
          -[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]( self,  "_playMediaForUserActivityDictionary:withPlayerPointer:",  v26,  v88);

LABEL_72:
LABEL_73:
          int64_t v29 = 0LL;
        }

        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_10000FEFC();
          }
          int64_t v29 = 200LL;
          uint64_t v12 = v20;
        }
      }

      else
      {
LABEL_16:
        uint64_t v28 = _CMSQLoggingFacility(v11);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10000FE70();
        }
        int64_t v29 = 200LL;
      }

- (void)configureAGPlayerSession:(id)a3 withInitialQueueSegment:(id)a4 initialUserActivity:(id)a5 initialNetworkActivity:(id)a6 playerPointer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = v16;
  if (!v13
    || (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]),
        id v19 = [v18 count],
        v18,
        !v19))
  {
    uint64_t v38 = _CMSQLoggingFacility(v16);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_10000FF5C();
    }
    goto LABEL_12;
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
  if (v20
    && (id v21 = (void *)v20,
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager")),
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playerPointer]),
        unsigned __int8 v24 = -[CMSPlayer _validateServiceContextFromPlayerPointer:]( self,  "_validateServiceContextFromPlayerPointer:",  v23),  v23,  v22,  v21,  (v24 & 1) != 0))
  {
    uint64_t v26 = _CMSQLoggingFacility(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating current session context", buf, 2u);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
    int64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 session]);

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v12 config]);
    [v29 setConfig:v30];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 authHeader]);
    [v29 setAuthHeader:v31];

    objc_msgSend(v29, "setAllowExplicitContent:", objc_msgSend(v12, "allowExplicitContent"));
    objc_msgSend(v29, "setUpdateUserTasteProfile:", objc_msgSend(v12, "updateUserTasteProfile"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionIdentifier]);
    [v29 setSessionIdentifier:v32];

    uint64_t v34 = _CMSQLoggingFacility(v33);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Existing ContentManager will use updated queue segment",  v49,  2u);
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
    BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v17 parentNetworkActivity]);
    [v36 updateQueueSegment:v13 forUserActivityDictionary:v14 withInitialNetworkActivity:v15 andParentNetworkActivity:v37 playerPointer:v17];

    [v12 closeWithForce:0];
  }

  else
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
    [v40 closeSession];

    uint64_t v41 = objc_alloc(&OBJC_CLASS___CMSContentManager);
    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v17 parentNetworkActivity]);
    playerPath = self->_playerPath;
    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer currentAudioSession](self, "currentAudioSession"));
    uint64_t v45 = -[CMSContentManager initWithSession:initialQueueSegment:forUserActivityDictionary:withInitialNetworkActivity:andParentNetworkActivity:playerPointer:playerPath:audioSession:commandHandler:]( v41,  "initWithSession:initialQueueSegment:forUserActivityDictionary:withInitialNetworkActivity:andParentNetworkAct ivity:playerPointer:playerPath:audioSession:commandHandler:",  v12,  v13,  v14,  v15,  v42,  v17,  playerPath,  v44,  self->_commandHandler);
    -[CMSPlayer setContentManager:](self, "setContentManager:", v45);

    int64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
    [v29 setDelegate:self];
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer contentManager](self, "contentManager"));
  if (!v46)
  {
    uint64_t v48 = _CMSQLoggingFacility(v47);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_10000FF88();
    }
LABEL_12:

    [v12 closeWithForce:1];
    goto LABEL_13;
  }

  if (self->_shouldRecoverCommands)
  {
    -[CMSMRMediaRemoteCommandHandler enableDefaultCommands](self->_commandHandler, "enableDefaultCommands");
    self->_shouldRecoverCommands = 0;
  }

- (void)playStateManager:(id)a3 nowPlayingApplicationChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = _CMSQLoggingFacility(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    id v13 = "-[CMSPlayer playStateManager:nowPlayingApplicationChanged:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s manager %@ isNowPlayingApp: %d",  (uint8_t *)&v12,  0x1Cu);
  }

  -[CMSPlayer setIsNowPlayingApp:](self, "setIsNowPlayingApp:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "player:didChangeNowPlayingApplication:");

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayer delegate](self, "delegate"));
    [v11 player:self didChangeNowPlayingApplication:v4];
  }
}

- (void)didRequestToBecomeNowPlayingPlayer:(id)a3
{
  uint64_t v4 = _CMSQLoggingFacility(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CMSPlayer didRequestToBecomeNowPlayingPlayer:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[CMSMRMediaRemoteCommandHandler enableDefaultCommands](self->_commandHandler, "enableDefaultCommands");
}

- (void)didRequestNowPlayingPlayerResignation:(id)a3
{
  uint64_t v4 = _CMSQLoggingFacility(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CMSPlayer didRequestNowPlayingPlayerResignation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  self->_shouldRecoverCommands = 1;
  -[CMSMRMediaRemoteCommandHandler disableAllNonEssentialCommands]( self->_commandHandler,  "disableAllNonEssentialCommands");
}

- (void)_updateAudioSessionProperties:(id)a3
{
  id v7 = 0LL;
  [a3 setCategory:AVAudioSessionCategoryPlayback error:&v7];
  id v3 = v7;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = _CMSQLoggingFacility(v3);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000FFB4();
    }
  }
}

- (void)_setupAwaitStartPlayingNotification
{
  if (self->_queuePlayingNotificationObserver)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_queuePlayingNotificationObserver];
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000BAB4;
  v7[3] = &unk_10001C9E8;
  v7[4] = self;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( [v4 addObserverForName:CMSAVQueuePlayerStartPlayingNotification object:0 queue:0 usingBlock:v7]);
  queuePlayingNotificationObserver = self->_queuePlayingNotificationObserver;
  self->_queuePlayingNotificationObserver = v5;
}

- (void)_configurePlayerWith:(id)a3 playerPointer:(id)a4 configURL:(id)a5 completionHandler:(id)a6
{
  id v85 = a3;
  id v9 = a4;
  id v86 = a5;
  id v87 = a6;
  uint64_t v10 = _CMSQLoggingFacility(v87);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    playerPointer = self->_playerPointer;
    *(_DWORD *)buf = 136315651;
    *(void *)&uint8_t buf[4] = "-[CMSPlayer _configurePlayerWith:playerPointer:configURL:completionHandler:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2113;
    v108 = (uint64_t (*)(uint64_t, uint64_t))playerPointer;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s new PlayerPointer (%{private}@) will replace (%{private}@)",  buf,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionIdentifier]);
  if (!v13)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"QU.%@", v15));

    uint64_t v17 = _CMSQLoggingFacility(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Creating playback sessionIdentifier since none passed from intent: %@",  buf,  0xCu);
    }
  }

  id v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 appBundleIdentifier]);
  if (!v19)
  {
    uint64_t v20 = _CMSQLoggingFacility(0LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Using UNKNOWN appIdentifier since none passed from intent session: %@",  buf,  0xCu);
    }

    id v19 = @"UNKNOWN";
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared"));
  [v22 reportAnalyticsForMethod:@"Playback.Handle" forEventType:kCMSInterfaceAnalyticsDataRequestTSTypeStartTime sessionIdentifier:v13 andAppBundleIdentifier:v19];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 cachedEndpointConfigurationDictionary]);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  v108 = sub_10000C654;
  v109 = sub_10000C664;
  id v110 = 0LL;
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared"));
  [v24 reportAnalyticsForMethod:@"Playback.Handle" forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePreProcess sessionIdentifier:v13 andAppBundleIdentifier:v19];

  if (v23)
  {
    id v25 = objc_alloc(&OBJC_CLASS___CMSCloudExtensionConfiguration);
    uint64_t v26 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v9 parentNetworkActivity]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 siriLanguageCode]);
    id v28 = [v25 initWithDictionary:v23 fromURL:v86 parentNetworkActivity:v26 languageCode:v27];
    int64_t v29 = *(dispatch_semaphore_s **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v28;
  }

  else
  {
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[MediaServiceConfiguration sharedInstance]( &OBJC_CLASS___MediaServiceConfiguration,  "sharedInstance"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v9 appBundleIdentifier]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 userAccountHomeUserID]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIdentifier]);
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472LL;
    v97[2] = sub_10000C66C;
    v97[3] = &unk_10001CA38;
    uint64_t v26 = v30;
    __int16 v98 = v26;
    id v99 = v86;
    id v100 = v13;
    id v101 = v9;
    v102 = self;
    v104 = buf;
    id v103 = v87;
    [v27 getCachedServiceInfo:v31 homeUserID:v32 endpointID:v33 completion:v97];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    int64_t v29 = v98;
  }

  uint64_t v34 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) parsingError]);
  uint64_t v35 = (void *)v34;
  if (v34)
  {
    uint64_t v36 = _CMSQLoggingFacility(v34);
    BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100010074();
    }

    if (v87) {
      (*((void (**)(id, void))v87 + 2))(v87, 0LL);
    }
    goto LABEL_42;
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v9 speakerUpdateListeningHistory]);
  unsigned int v81 = [v38 BOOLValue];

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIdentifier]);
  if (v39)
  {
    uint64_t v41 = _CMSQLoggingFacility(v40);
    unsigned int v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIdentifier]);
      *(_DWORD *)v105 = 138412290;
      *(void *)v106 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Request originated on endpoint %@",  v105,  0xCu);
    }
  }

  id v44 = objc_alloc(&OBJC_CLASS___NSUUID);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIdentifier]);
  unsigned int v83 = -[NSUUID initWithUUIDString:](v44, "initWithUUIDString:", v45);

  if (!+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
  {
    unsigned int v82 = +[CMSSettingsManager explicitContentSettingForAccessoryID:]( &OBJC_CLASS___CMSSettingsManager,  "explicitContentSettingForAccessoryID:",  v83);
    unsigned int v51 = +[CMSSettingsManager listeningHistorySettingForAccessory]( &OBJC_CLASS___CMSSettingsManager,  "listeningHistorySettingForAccessory");
    unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v9 appServiceID]);
    __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v9 userAccountHomeUserID]);
    unsigned int v56 = +[CMSSettingsManager listeningHistorySettingForService:user:]( &OBJC_CLASS___CMSSettingsManager,  "listeningHistorySettingForService:user:",  v54,  v55);

    if ((v81 & v51 & v56) != 1) {
      goto LABEL_25;
    }
LABEL_27:
    if (self->_playerPointer
      && (BOOL v52 = -[CMSPlayer _validateServiceContextFromPlayerPointer:]( self,  "_validateServiceContextFromPlayerPointer:",  v9))
      && (int v57 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer userAccountHomeUserID](self->_playerPointer, "userAccountHomeUserID")),
          double v58 = (void *)objc_claimAutoreleasedReturnValue([v9 userAccountHomeUserID]),
          unsigned __int8 v59 = [v57 isEqualToString:v58],
          v58,
          v57,
          (v59 & 1) == 0))
    {
      uint64_t v79 = _CMSQLoggingFacility(v52);
      uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Not updating listening history because userAccount is different in this updated context request",  v105,  2u);
      }

      uint64_t v53 = 0LL;
      unsigned int v51 = 1;
    }

    else
    {
      unsigned int v51 = 1;
      uint64_t v53 = 1LL;
    }

    goto LABEL_31;
  }

  uint64_t v46 = objc_alloc(&OBJC_CLASS___NSUUID);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v9 requesterHomeUserID]);
  uint64_t v48 = -[NSUUID initWithUUIDString:](v46, "initWithUUIDString:", v47);

  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
  unsigned int v82 = [v49 explicitContentSettingForUser:v48];

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
  unsigned int v51 = [v50 updateListeningHistorySettingForUser:v48 accessoryID:v83];

  if ((v81 & v51 & 1) != 0) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v53 = 0LL;
LABEL_31:
  uint64_t v60 = _CMSQLoggingFacility(v52);
  uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = @"NO";
    if (v82) {
      uint64_t v62 = @"YES";
    }
    *(_DWORD *)v105 = 138412290;
    *(void *)v106 = v62;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Setting allow explicit content: %@",  v105,  0xCu);
  }

  uint64_t v64 = _CMSQLoggingFacility(v63);
  v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    id v66 = @"NO";
    if ((_DWORD)v53) {
      id v66 = @"YES";
    }
    *(_DWORD *)v105 = 67109378;
    *(_DWORD *)v106 = v51;
    *(_WORD *)&v106[4] = 2112;
    *(void *)&v106[6] = v66;
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Setting overall update listening history (HomeKit: %d): %@",  v105,  0x12u);
  }

  objc_storeStrong((id *)&self->_playerPointer, a4);
  uint64_t v67 = objc_alloc(&OBJC_CLASS___CMSCloudExtensionSession);
  uint64_t v68 = -[CMSCloudExtensionSession initWithConfiguration:authProviderDelegate:]( v67,  "initWithConfiguration:authProviderDelegate:",  *(void *)(*(void *)&buf[8] + 40LL),  self);
  -[CMSCloudExtensionSession setSessionIdentifier:](v68, "setSessionIdentifier:", v13);
  -[CMSCloudExtensionSession setQosClass:](v68, "setQosClass:", 33LL);
  -[CMSCloudExtensionSession setAllowExplicitContent:](v68, "setAllowExplicitContent:", v82);
  -[CMSCloudExtensionSession setUpdateUserTasteProfile:](v68, "setUpdateUserTasteProfile:", v53);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionAuthHeader]);
  -[CMSCloudExtensionSession setAuthHeader:](v68, "setAuthHeader:", v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIdentifier]);
  -[CMSCloudExtensionSession setEndpointIdentifier:](v68, "setEndpointIdentifier:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue([v9 requesterHomeUserID]);
  -[CMSCloudExtensionSession setRequesterHomeUserID:](v68, "setRequesterHomeUserID:", v71);

  uint64_t v73 = _CMSQLoggingFacility(v72);
  uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
    sub_100010014();
  }

  objc_initWeak((id *)v105, self);
  -[CMSCloudExtensionSession setPrepareRequestHook:](v68, "setPrepareRequestHook:", &stru_10001CA78);
  id v75 = objc_alloc(&OBJC_CLASS___CMSNetworkActivity);
  v76 = (void *)objc_claimAutoreleasedReturnValue([v9 parentNetworkActivity]);
  id v77 = [v75 initWithLabel:9 parentActivity:v76];

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_10000C9F0;
  v88[3] = &unk_10001CAA0;
  id v78 = v77;
  id v89 = v78;
  int v90 = self;
  id v95 = v87;
  objc_copyWeak(&v96, (id *)v105);
  id v91 = v13;
  __int16 v92 = v19;
  id v93 = v85;
  id v94 = v9;
  -[CMSCloudExtensionSession requestQueueForActivity:networkActivity:completion:]( v68,  "requestQueueForActivity:networkActivity:completion:",  v93,  v78,  v88);

  objc_destroyWeak(&v96);
  objc_destroyWeak((id *)v105);

LABEL_42:
  _Block_object_dispose(buf, 8);
}

- (BOOL)_validatePrerollContextFromPlayerPointer:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[CMSPlayer _validateServiceContextFromPlayerPointer:](self, "_validateServiceContextFromPlayerPointer:", v4);
  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer sessionIdentifier](self->_playerPointer, "sessionIdentifier"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionIdentifier]);
    unsigned int v8 = [v6 isEqualToString:v7];
  }

  else
  {
    unsigned int v8 = 0;
  }

  uint64_t v9 = _CMSQLoggingFacility(v5);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = @"NO";
    playerPointer = self->_playerPointer;
    int v14 = 138412802;
    if (v8) {
      int v12 = @"YES";
    }
    id v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = playerPointer;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "_validatePrerollContextFromPlayerPointer: %@ Current PlayerPointer:(%@)\n New PlayerPointer:(%@)",  (uint8_t *)&v14,  0x20u);
  }

  return v8;
}

- (BOOL)_validateServiceContextFromPlayerPointer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer appBundleIdentifier](self->_playerPointer, "appBundleIdentifier"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 appBundleIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer appServiceID](self->_playerPointer, "appServiceID"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 appServiceID]);
  if (![v7 isEqualToString:v8])
  {

LABEL_9:
    unsigned int v15 = 0;
    goto LABEL_10;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer userAccountHomeUserID](self->_playerPointer, "userAccountHomeUserID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userAccountHomeUserID]);
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userActivityPersistentID]);
    if (v5
      || (int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer userActivityPersistentID](self->_playerPointer, "userActivityPersistentID"))) != 0LL)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerPointer userActivityPersistentID](self->_playerPointer, "userActivityPersistentID"));
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 userActivityPersistentID]);
      unsigned int v15 = [v13 isEqual:v14];

      if (v5)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      unsigned int v15 = 1;
    }

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (AVAudioSession)currentAudioSession
{
  return self->_currentAudioSession;
}

- (void)setCurrentAudioSession:(id)a3
{
}

- (CMSPlayerPointer)playerPointer
{
  return self->_playerPointer;
}

- (void)setPlayerPointer:(id)a3
{
}

- (CMSContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
}

- (CMSLoggingSession)CMSLoggingSession
{
  return self->_CMSLoggingSession;
}

- (void)setCMSLoggingSession:(id)a3
{
}

- (CMSMRMediaRemoteCommandHandler)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (CMSPlayerDelegate)delegate
{
  return (CMSPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  self->_isNowPlayingApp = a3;
}

- (CMSMediaRemoteController)MRController
{
  return self->_MRController;
}

- (void)setMRController:(id)a3
{
}

- (CMSPlayStateManager)playStateManager
{
  return self->_playStateManager;
}

- (void)setPlayStateManager:(id)a3
{
}

- (NSString)serviceBundleIdentifier
{
  return self->_serviceBundleIdentifier;
}

- (void)setServiceBundleIdentifier:(id)a3
{
}

- (NSString)serviceAccountHomeUserID
{
  return self->_serviceAccountHomeUserID;
}

- (void)setServiceAccountHomeUserID:(id)a3
{
}

- (CMSPlayerPointer)prerollPointer
{
  return self->_prerollPointer;
}

- (void)setPrerollPointer:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end