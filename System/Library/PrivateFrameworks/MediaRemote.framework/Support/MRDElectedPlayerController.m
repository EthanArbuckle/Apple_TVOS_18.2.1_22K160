@interface MRDElectedPlayerController
- (BOOL)_shouldUseNotification:(id)a3;
- (MRDElectedPlayerController)initWithOriginClient:(id)a3;
- (MRDElectedPlayerControllerDelegate)delegate;
- (MRDNowPlayingOriginClient)originClient;
- (MRPlayerPath)electedPlayerPath;
- (MRPlayerPath)previousElectedPlayerPath;
- (NSString)activeSystemEndpointOutputDeviceUID;
- (NSString)event;
- (NSString)eventReason;
- (NSString)mostRecentEvent;
- (NSString)mostRecentEventReason;
- (NSString)mostRecentSelectionReason;
- (NSString)selectionReason;
- (id)_onSyncSelf_calculateElectedPlayerForOriginClient:(id)a3 event:(int64_t)a4 reason:(id *)a5;
- (int64_t)_resolveChangeTypeWithOriginClient:(id)a3 forEvent:(int64_t)a4;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleNowPlayingApplicationDidChangeNotification:(id)a3;
- (void)_handleNowPlayingApplicationDidForegroundNotification:(id)a3;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:(int64_t)a3;
- (void)_onSyncSelf_reevaluateElectedPlayerForEvent:(int64_t)a3 withReason:(id)a4;
- (void)setActiveSystemEndpointOutputDeviceUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginClient:(id)a3;
- (void)setOriginClient:(id)a3 withChangeType:(int64_t)a4;
@end

@implementation MRDElectedPlayerController

- (MRDElectedPlayerController)initWithOriginClient:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDElectedPlayerController;
  v5 = -[MRDElectedPlayerController init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v5 selector:"_handlePlaybackQueueChangedNotification:" name:kMRNowPlayingPlaybackQueueChangedNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v5 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v5 selector:"_handleNowPlayingApplicationDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v5 selector:"_handleNowPlayingApplicationDidForegroundNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v5 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    -[MRDElectedPlayerController setOriginClient:](v5, "setOriginClient:", v4);
  }

  return v5;
}

- (void)setOriginClient:(id)a3
{
  v20 = (MRDNowPlayingOriginClient *)a3;
  v5 = self;
  objc_sync_enter(v5);
  p_originClient = (id *)&v5->_originClient;
  originClient = v5->_originClient;
  if (originClient) {
    BOOL v8 = originClient == v20;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    v9 = originClient;
    objc_storeStrong((id *)&v5->_originClient, a3);
    v10 = objc_alloc(&OBJC_CLASS___NSString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient deviceInfo](v9, "deviceInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceUID]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient deviceInfo](v9, "deviceInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([*p_originClient deviceInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceUID]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([*p_originClient deviceInfo]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
    v18 = -[NSString initWithFormat:]( v10,  "initWithFormat:",  @"ElectedOrigin changed from <%@> (<%@>) to <%@> (<%@>)",  v11,  v13,  v15,  v17);
    -[MRDElectedPlayerController _onSyncSelf_reevaluateElectedPlayerForEvent:withReason:]( v5,  "_onSyncSelf_reevaluateElectedPlayerForEvent:withReason:",  0LL,  v18);
  }

  objc_sync_exit(v5);
}

- (void)setOriginClient:(id)a3 withChangeType:(int64_t)a4
{
  id v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  changeType = v6->_changeType;
  v6->_changeType = (NSNumber *)v7;

  -[MRDElectedPlayerController setOriginClient:](v6, "setOriginClient:", v9);
  objc_sync_exit(v6);
}

- (void)setActiveSystemEndpointOutputDeviceUID:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeSystemEndpointOutputDeviceUID = obj->_activeSystemEndpointOutputDeviceUID;
  obj->_activeSystemEndpointOutputDeviceUID = v4;

  objc_sync_exit(obj);
}

- (NSString)activeSystemEndpointOutputDeviceUID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSString copy](v2->_activeSystemEndpointOutputDeviceUID, "copy");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (MRPlayerPath)electedPlayerPath
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_electedPlayerPath;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldUseNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient origin](self->_originClient, "origin"));
  LOBYTE(v4) = [v6 isEqual:v7];

  return (char)v4;
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (-[MRDElectedPlayerController _shouldUseNotification:](v5, "_shouldUseNotification:", v7))
  {
    v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ PlaybackQueueChanged",  v4);
    -[MRDElectedPlayerController _onSyncSelf_reevaluateElectedPlayerForEvent:withReason:]( v5,  "_onSyncSelf_reevaluateElectedPlayerForEvent:withReason:",  5LL,  v6);

    -[MRDElectedPlayerController _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:]( v5,  "_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:",  5LL);
  }

  objc_sync_exit(v5);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
  unsigned int v6 = [v5 BOOLValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 playerPath]);
  BOOL v8 = self;
  objc_sync_enter(v8);
  if (-[MRDElectedPlayerController _shouldUseNotification:](v8, "_shouldUseNotification:", v12))
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSString);
    v10 = @"stopped";
    if (v6) {
      v10 = @"started";
    }
    v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@ Playback %@", v7, v10);
    -[MRDElectedPlayerController _onSyncSelf_reevaluateElectedPlayerForEvent:withReason:]( v8,  "_onSyncSelf_reevaluateElectedPlayerForEvent:withReason:",  1LL,  v11);

    -[MRDElectedPlayerController _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:]( v8,  "_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:",  1LL);
  }

  objc_sync_exit(v8);
}

- (void)_handleNowPlayingApplicationDidChangeNotification:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (-[MRDElectedPlayerController _shouldUseNotification:](v4, "_shouldUseNotification:", v9))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    BOOL v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"NowPlayingAppChanged to %@",  v7);
    -[MRDElectedPlayerController _onSyncSelf_reevaluateElectedPlayerForEvent:withReason:]( v4,  "_onSyncSelf_reevaluateElectedPlayerForEvent:withReason:",  3LL,  v8);
  }

  objc_sync_exit(v4);
}

- (void)_handleNowPlayingApplicationDidForegroundNotification:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (-[MRDElectedPlayerController _shouldUseNotification:](v4, "_shouldUseNotification:", v11))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteApplicationForegroundUserInfoKey]);
    unsigned int v7 = [v6 BOOLValue];

    BOOL v8 = objc_alloc(&OBJC_CLASS___NSString);
    id v9 = @"Back";
    if (v7) {
      id v9 = @"Fore";
    }
    v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"Was %@grounded", v9);
    -[MRDElectedPlayerController _onSyncSelf_reevaluateElectedPlayerForEvent:withReason:]( v4,  "_onSyncSelf_reevaluateElectedPlayerForEvent:withReason:",  4LL,  v10);
  }

  objc_sync_exit(v4);
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
  id v7 = [v6 integerValue];

  if (v7 == (id)1)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey]);

    -[MRDElectedPlayerController setActiveSystemEndpointOutputDeviceUID:]( self,  "setActiveSystemEndpointOutputDeviceUID:",  v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey]);
    id v12 = [v11 integerValue];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000EE32C;
    v14[3] = &unk_1003A05F0;
    v14[4] = self;
    id v15 = v9;
    id v16 = v12;
    id v13 = v9;
    MRAVEndpointResolveActiveSystemEndpointWithType(1LL, &_dispatch_main_q, v14, 7.0);
  }
}

- (void)_onSyncSelf_reevaluateElectedPlayerForEvent:(int64_t)a3 withReason:(id)a4
{
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1002B8C40(a3, (uint64_t)v7, v10);
  }

  originClient = self->_originClient;
  id v46 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDElectedPlayerController _onSyncSelf_calculateElectedPlayerForOriginClient:event:reason:]( self,  "_onSyncSelf_calculateElectedPlayerForOriginClient:event:reason:",  originClient,  a3,  &v46));
  id v13 = v46;
  id v14 = v46;
  id v15 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue([v12 playerPath]);
  objc_storeStrong((id *)&self->_mostRecentEventReason, a4);
  objc_storeStrong((id *)&self->_mostRecentSelectionReason, v13);
  id v16 = 0LL;
  mostRecentEvent = self->_mostRecentEvent;
  self->_mostRecentEvent = &v16->isa;

  v18 = self->_electedPlayerPath;
  if (v15 == v18)
  {
  }

  else
  {
    v19 = v18;
    v20 = v15;
    unsigned __int8 v21 = -[MRPlayerPath isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
    {
      v23 = (MRPlayerPath *)-[MRPlayerPath copy](self->_electedPlayerPath, "copy");
      previousElectedPlayerPath = self->_previousElectedPlayerPath;
      self->_previousElectedPlayerPath = v23;

      v25 = (MRPlayerPath *)-[MRPlayerPath copy](v20, "copy");
      electedPlayerPath = self->_electedPlayerPath;
      self->_electedPlayerPath = v25;

      objc_storeStrong((id *)&self->_eventReason, self->_mostRecentEventReason);
      objc_storeStrong((id *)&self->_selectionReason, self->_mostRecentSelectionReason);
      objc_storeStrong((id *)&self->_event, self->_mostRecentEvent);
      int64_t v27 = -[MRDElectedPlayerController _resolveChangeTypeWithOriginClient:forEvent:]( self,  "_resolveChangeTypeWithOriginClient:forEvent:",  self->_originClient,  a3);
      uint64_t v29 = _MRLogForCategory(0LL, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = v7;
        v31 = self->_previousElectedPlayerPath;
        v39 = self->_electedPlayerPath;
        uint64_t v32 = MRMediaRemoteActiveEndpointChangeTypeCopyDescription(v27);
        v33 = (void *)v32;
        else {
          v34 = off_1003A0638[a3];
        }
        *(_DWORD *)buf = 138413570;
        v48 = v31;
        __int16 v49 = 2112;
        id v7 = v40;
        v50 = v39;
        __int16 v51 = 2114;
        uint64_t v52 = v32;
        __int16 v53 = 2114;
        v54 = v34;
        __int16 v55 = 2114;
        id v56 = v40;
        __int16 v57 = 2114;
        id v58 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[MRDElectedPlayerController] ElectedPlayer changed from <%@> to <%@> changeType=<%{public}@>, event=%{public}@ , eventReason=%{public}@, selectionReason=%{public}@",  buf,  0x3Eu);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000EEA48;
      block[3] = &unk_1003A0618;
      block[4] = self;
      v42 = v20;
      int64_t v44 = v27;
      int64_t v45 = a3;
      id v43 = v14;
      dispatch_async(&_dispatch_main_q, block);
      changeType = self->_changeType;
      self->_changeType = 0LL;

      -[MRDElectedPlayerController _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:]( self,  "_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:",  a3);
      goto LABEL_17;
    }
  }

  uint64_t v35 = _MRLogForCategory(0LL, v22);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v38 = self->_electedPlayerPath;
    *(_DWORD *)buf = 138412802;
    v48 = v38;
    __int16 v49 = 2114;
    v50 = (MRPlayerPath *)v7;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "[MRDElectedPlayerController] ElectedPlayer remained <%@> eventReason=%{public}@, selectionReason=%{public}@",  buf,  0x20u);
  }

LABEL_17:
}

- (int64_t)_resolveChangeTypeWithOriginClient:(id)a3 forEvent:(int64_t)a4
{
  id v5 = a3;
  changeType = self->_changeType;
  if (!changeType)
  {
    int64_t v7 = 0LL;
LABEL_13:
    if (!self->_electedPlayerPath)
    {
      if (self->_previousElectedPlayerPath)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v5 activeNowPlayingClient]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activePlayerClient]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
        unsigned int v21 = [v20 isEqual:self->_previousElectedPlayerPath];

        if (v21)
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 nowPlayingServer]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 queryExistingPlayerPath:self->_previousElectedPlayerPath]);

          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 playerClient]);
          if (v25)
          {
            uint64_t v27 = _MRLogForCategory(0LL, v26);
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription(1LL);
              electedPlayerPath = self->_electedPlayerPath;
              previousElectedPlayerPath = self->_previousElectedPlayerPath;
              int v32 = 138543874;
              v33 = v29;
              __int16 v34 = 2114;
              uint64_t v35 = electedPlayerPath;
              __int16 v36 = 2114;
              v37 = previousElectedPlayerPath;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[MRDElectedPlayerController] Manually setting changeType to %{public}@ because changeType uninitialized and playerPath %{public}@ is nil and previousPlayerPath %{public}@ is still valid",  (uint8_t *)&v32,  0x20u);
            }

            int64_t v7 = 1LL;
          }
        }
      }
    }

    goto LABEL_14;
  }

  int64_t v7 = -[NSNumber integerValue](changeType, "integerValue");
  if (v7 == 1)
  {
    if (self->_previousElectedPlayerPath)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queryExistingPlayerPath:self->_previousElectedPlayerPath]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]);
      if (v11)
      {
        int64_t v7 = 1LL;
      }

      else
      {
        uint64_t v13 = _MRLogForCategory(0LL, v12);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription(0LL);
          id v16 = self->_previousElectedPlayerPath;
          int v32 = 138543618;
          v33 = v15;
          __int16 v34 = 2114;
          uint64_t v35 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDElectedPlayerController] Manually setting changeType to %{public}@ because previousPlayerPath %{public}@ does not exist anymore",  (uint8_t *)&v32,  0x16u);
        }

        int64_t v7 = 0LL;
      }
    }

    else
    {
      int64_t v7 = 1LL;
    }
  }

  if (!self->_changeType) {
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)_onSyncSelf_calculateElectedPlayerForOriginClient:(id)a3 event:(int64_t)a4 reason:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeNowPlayingClient]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerClient]);
  if (![v9 isPlaying])
  {
    if ([v7 isActivityActive])
    {
      v10 = @"SiriIntent";
      goto LABEL_5;
    }

    if (([v8 isForegrounded] & 1) != 0
      || [v8 supportsBackgroundAudio])
    {
      [v9 timeSincePlaying];
      double v14 = v13;
      if (a4 == 2)
      {
        id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"was not playing sort of recently <%lf> seconds ago",  *(void *)&v13);
LABEL_19:
        v25 = v15;
        id v11 = 0LL;
        goto LABEL_20;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v16 electedPlayerInterval];
      double v18 = v17;

      if (v14 < v18)
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue([v9 nowPlayingContentItem]);

        v19 = objc_alloc(&OBJC_CLASS___NSString);
        if (v11)
        {
          *a5 =  -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"was playing recently <%lf> seconds ago",  *(void *)&v14);
          goto LABEL_6;
        }

        v25 =  -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"was playing recently <%lf> seconds ago but not nowPlayingData",  *(void *)&v14);
LABEL_20:
        *a5 = v25;
        goto LABEL_7;
      }

      v23 = objc_alloc(&OBJC_CLASS___NSString);
      v24 = v23;
      if (v9)
      {
        id v15 = -[NSString initWithFormat:]( v23,  "initWithFormat:",  @"was not playing recently. Last played <%lf> seconds ago",  *(void *)&v14);
        goto LABEL_19;
      }

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
      uint64_t v22 = -[NSString initWithFormat:](v24, "initWithFormat:", @"%@ has no activePlayer", v21);
    }

    else
    {
      v20 = objc_alloc(&OBJC_CLASS___NSString);
      if (v8)
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
        uint64_t v22 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"%@ is not foregrounded and does not support background audio",  v21);
      }

      else
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
        uint64_t v22 = -[NSString initWithFormat:](v20, "initWithFormat:", @"%@ has no activeNowPlayingClient", v21);
      }
    }

    *a5 = v22;

    id v11 = 0LL;
    goto LABEL_7;
  }

  v10 = @"is playing";
LABEL_5:
  *a5 = v10;
LABEL_6:
  id v11 = v9;
LABEL_7:

  return v11;
}

- (void)_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:(int64_t)a3
{
  if (self->_electedPlayerPath)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient activeNowPlayingClient](self->_originClient, "activeNowPlayingClient"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activePlayerClient]);

    if ([v6 isPlaying])
    {
      playbackTimer = self->_playbackTimer;
      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
      else {
        uint64_t v9 = off_1003A0638[a3];
      }
      v23 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"electedPlayer %@ is playing for event <%@>",  self->_electedPlayerPath,  v9);
    }

    else
    {
      [v6 timeSincePlaying];
      double v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v15 electedPlayerInterval];
      double v17 = v16 + 5.0;

      if (v14 < v17)
      {
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
        v19 = objc_alloc(&OBJC_CLASS___MRPersistentTimer);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_1000EF190;
        v27[3] = &unk_1003990A8;
        v27[4] = self;
        id v28 = v18;
        int64_t v29 = a3;
        double v30 = v17;
        v20 = v18;
        unsigned int v21 = -[MRPersistentTimer initWithInterval:name:queue:block:]( v19,  "initWithInterval:name:queue:block:",  @"com.apple.mediaremote.electedplayercontroller.playbacktimer",  &_dispatch_main_q,  v27,  v17 - v14);
        uint64_t v22 = self->_playbackTimer;
        self->_playbackTimer = v21;

LABEL_18:
        return;
      }

      playbackTimer = self->_playbackTimer;
      v24 = objc_alloc(&OBJC_CLASS___NSString);
      else {
        v25 = off_1003A0638[a3];
      }
      v23 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"electedPlayer %@ was not playing recently for event <%@>",  self->_electedPlayerPath,  v25);
    }

    v20 = v23;
    -[MRPersistentTimer invalidateWithReason:](playbackTimer, "invalidateWithReason:", v23);
    goto LABEL_18;
  }

  v10 = self->_playbackTimer;
  id v11 = objc_alloc(&OBJC_CLASS___NSString);
  else {
    uint64_t v12 = off_1003A0638[a3];
  }
  uint64_t v26 = -[NSString initWithFormat:](v11, "initWithFormat:", @"no electedPlayer for event <%@>", v12);
  -[MRPersistentTimer invalidateWithReason:](v10, "invalidateWithReason:", v26);
}

- (MRPlayerPath)previousElectedPlayerPath
{
  return self->_previousElectedPlayerPath;
}

- (NSString)event
{
  return self->_event;
}

- (NSString)eventReason
{
  return self->_eventReason;
}

- (NSString)selectionReason
{
  return self->_selectionReason;
}

- (NSString)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (NSString)mostRecentEventReason
{
  return self->_mostRecentEventReason;
}

- (NSString)mostRecentSelectionReason
{
  return self->_mostRecentSelectionReason;
}

- (MRDElectedPlayerControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRDElectedPlayerControllerDelegate *)a3;
}

- (MRDNowPlayingOriginClient)originClient
{
  return self->_originClient;
}

- (void).cxx_destruct
{
}

@end