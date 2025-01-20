@interface HHDClockApp
- (BOOL)isForeground;
- (HHDClockApp)initWithFactory:(id)a3 queue:(id)a4;
- (HHDClockApp)initWithQueue:(id)a3;
- (id)_alarmConfiguration;
- (id)_playerForEndpoint:(id)a3;
- (id)applicationConfigurations;
- (id)applicationIdentifier;
- (int64_t)applicationPriorityClass;
- (void)_handleForegroundForPlayer:(id)a3 assertion:(id)a4;
- (void)_maybeResumePlayer:(id)a3;
- (void)_player:(id)a3 needsToPlay:(BOOL)a4;
- (void)_setVolume:(id)a3 forPlayer:(id)a4;
- (void)_updateState:(id)a3;
- (void)_updateStateForPlayer:(id)a3 reason:(unint64_t)a4;
- (void)application:(id)a3 didReceiveButtonAction:(int64_t)a4 endpoint:(id)a5 completion:(id)a6;
- (void)applicationWillTerminate;
- (void)didAddEndpoint:(id)a3 reason:(int64_t)a4;
- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5;
- (void)didReceiveDismissNotificationForEndpoint:(id)a3;
- (void)didRemoveEndpoint:(id)a3 reason:(int64_t)a4;
- (void)endpointDidStart:(id)a3;
- (void)endpointDidStop:(id)a3;
- (void)player:(id)a3 needsFade:(unint64_t)a4 endingAt:(id)a5 completionHandler:(id)a6;
- (void)player:(id)a3 needsToPlay:(BOOL)a4;
- (void)player:(id)a3 playbackChanged:(unint64_t)a4 reason:(unint64_t)a5;
- (void)player:(id)a3 setVolumeCategory:(id)a4 level:(id)a5;
- (void)setForeground:(BOOL)a3;
@end

@implementation HHDClockApp

- (HHDClockApp)initWithFactory:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HHDClockApp;
  v9 = -[HHDClockApp init](&v13, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    players = v9->_players;
    v9->_players = v10;

    objc_storeStrong((id *)&v9->_factory, a3);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (HHDClockApp)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___HHDClockAppFactory);
  v6 = -[HHDClockApp initWithFactory:queue:](self, "initWithFactory:queue:", v5, v4);

  return v6;
}

- (id)applicationIdentifier
{
  return @"com.apple.timer";
}

- (void)applicationWillTerminate
{
}

- (id)_playerForEndpoint:(id)a3
{
  id v4 = a3;
  players = self->_players;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000029CC;
  v10[3] = &unk_100024560;
  id v6 = v4;
  id v11 = v6;
  id v7 = -[NSMutableArray indexOfObjectPassingTest:](players, "indexOfObjectPassingTest:", v10);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = 0LL;
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_players, "objectAtIndex:", v7));
  }

  return v8;
}

- (void)didAddEndpoint:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v5));

  id v7 = sub_100002640();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      objc_super v13 = &stru_100024E50;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Already have a player for endpoint: %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      objc_super v13 = &stru_100024E50;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@Adding player for endpoint %@",  (uint8_t *)&v12,  0x16u);
    }

    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[HHDClockAppFactory createPlayerWithEndpoint:delegate:]( self->_factory,  "createPlayerWithEndpoint:delegate:",  v5,  self));
    if (v9)
    {
      -[NSMutableArray addObject:](self->_players, "addObject:", v9);
    }

    else
    {
      id v10 = sub_100002640();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        objc_super v13 = &stru_100024E50;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@Failed to create player for endpoint %@",  (uint8_t *)&v12,  0x16u);
      }
    }
  }
}

- (void)didRemoveEndpoint:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v5));
  id v7 = sub_100002640();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@Removing observer for endpoint %@",  (uint8_t *)&v10,  0x16u);
    }

    -[NSMutableArray removeObject:](self->_players, "removeObject:", v6);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Nothing to remove for endpoint %@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)_maybeResumePlayer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);

  if ([v4 state] == (id)1)
  {
    id v7 = sub_100002640();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      __int16 v14 = &stru_100024E50;
      __int16 v15 = 2114;
      v16 = v6;
      v9 = "%@Cannot resume player in playing state for endpoint %{public}@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, 0x16u);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  if (![v4 currentReason])
  {
    id v12 = sub_100002640();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      __int16 v14 = &stru_100024E50;
      __int16 v15 = 2114;
      v16 = v6;
      v9 = "%@Nothing to resume for endpoint %{public}@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }

- (void)endpointDidStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
  id v6 = sub_100002640();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = &stru_100024E50;
    __int16 v13 = 2114;
    __int16 v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@Endpoint %{public}@ started",  (uint8_t *)&v11,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v4));
  if (v8)
  {
    -[HHDClockApp _maybeResumePlayer:](self, "_maybeResumePlayer:", v8);
  }

  else
  {
    id v9 = sub_100002640();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      id v12 = &stru_100024E50;
      __int16 v13 = 2114;
      __int16 v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@Endpoint %{public}@ started, but player is gone",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)endpointDidStop:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
  id v6 = sub_100002640();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = &stru_100024E50;
    __int16 v13 = 2114;
    __int16 v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@Endpoint %{public}@ stopped",  (uint8_t *)&v11,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v4));
  if (v8 && [v8 state] == (id)1)
  {
    [v8 setState:2];
  }

  else
  {
    id v9 = sub_100002640();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = &stru_100024E50;
      __int16 v13 = 2114;
      __int16 v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@Nothing to stop for endpoint %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)didReceiveDismissNotificationForEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v4));
  id v6 = v5;
  if (v5)
  {
    [v5 dismiss];
  }

  else
  {
    id v7 = sub_100002640();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
      int v10 = 138412546;
      int v11 = &stru_100024E50;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@Received dismiss from endpoint %{public}@, but there is no corresponding player",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (!a4)
  {
    -[HHDClockApp didReceiveDismissNotificationForEndpoint:](self, "didReceiveDismissNotificationForEndpoint:", a3);
    id v8 = v9;
  }

  (*((void (**)(id, void))v8 + 2))(v8, 0LL);
}

- (id)_alarmConfiguration
{
  id v3 = objc_alloc(&OBJC_CLASS___SIBSApplicationConfiguration);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp applicationIdentifier](self, "applicationIdentifier"));
  id v5 = [v3 initWithApplicationIdentifier:v4];

  [v5 setAudioCategory:1];
  [v5 setAudioMode:0];
  [v5 setLedAnimation:2];
  id v6 = [[SIBSApplicationColor alloc] initWithRed:255 green:255 blue:255];
  [v5 setLedColor:v6];
  id v7 = [[SIBSApplicationButtonBehavior alloc] initWithGesture:0 action:0];
  id v10 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  [v5 setButtonBehaviors:v8];

  return v5;
}

- (id)applicationConfigurations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _alarmConfiguration](self, "_alarmConfiguration"));
  id v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (int64_t)applicationPriorityClass
{
  return 2LL;
}

- (void)_handleForegroundForPlayer:(id)a3 assertion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100002640();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessoryId]);
    *(_DWORD *)buf = 138412546;
    __int16 v14 = &stru_100024E50;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Foreground has been granted for endpoint %{public}@, starting playback",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000368C;
  v11[3] = &unk_100024588;
  objc_copyWeak(&v12, (id *)buf);
  [v6 setRevocationHandler:v11];
  [v5 setForegroundAssertion:v6];
  [v5 setState:1];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)_updateStateForPlayer:(id)a3 reason:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 foregroundAssertion]);

  if (v7)
  {
    uint64_t v8 = v4 & 3;
    if (v8)
    {
      id v9 = objc_alloc(&OBJC_CLASS___SIBSClockPlayerStateUpdateRequest);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
      id v11 = [v9 initWithEndpoint:v10 reason:v8];

      -[HHDClockApp _updateState:](self, "_updateState:", v11);
    }
  }

  else
  {
    id v12 = sub_100002640();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accessoryId]);
      int v16 = 138412546;
      v17 = &stru_100024E50;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@Unable to update state for %{public}@, since it's not in foreground",  (uint8_t *)&v16,  0x16u);
    }
  }
}

- (void)_updateState:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002640();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = &stru_100024E50;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@Updating state with request: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[HHDClockApp updateApplicationWithState:completion:]( self,  "updateApplicationWithState:completion:",  v4,  &stru_1000245C8);
}

- (void)_setVolume:(id)a3 forPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaRouteId]);

  id v10 = self->_queue;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[HHDClockAppFactory createMediaEndpointBrowserWithQueue:]( self->_factory,  "createMediaEndpointBrowserWithQueue:",  self->_queue));
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100003C68;
  v15[3] = &unk_100024618;
  objc_copyWeak(&v19, &location);
  id v12 = v9;
  id v16 = v12;
  id v13 = v6;
  id v17 = v13;
  __int16 v14 = v10;
  __int16 v18 = v14;
  [v11 findRemoteControlEndpointMatchingIdentifier:v12 completion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)application:(id)a3 didReceiveButtonAction:(int64_t)a4 endpoint:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a3 applicationIdentifier]);
  unsigned __int8 v13 = [v12 isEqualToString:@"com.apple.doorbell"];

  if ((v13 & 1) == 0)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    v11[2](v11, v15);
    goto LABEL_13;
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockApp _playerForEndpoint:](self, "_playerForEndpoint:", v10));
  __int16 v15 = v14;
  if (!v14)
  {
    id v16 = sub_100002640();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryId]);
      int v25 = 138412546;
      v26 = &stru_100024E50;
      __int16 v27 = 2114;
      v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@Received doorbell dismiss from endpoint %{public}@, but there is no corresponding player",  (uint8_t *)&v25,  0x16u);
    }

    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 22LL;
    goto LABEL_12;
  }

  if ([v14 currentReason] != (id)4)
  {
    id v21 = sub_100002640();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryId]);
      int v25 = 138412546;
      v26 = &stru_100024E50;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@Unable to process doorbell button action for endpoint %{public}@, since no doorbell is playing",  (uint8_t *)&v25,  0x16u);
    }

    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 35LL;
LABEL_12:
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  v20,  0LL));
    v11[2](v11, v24);

    goto LABEL_13;
  }

  -[HHDClockApp didReceiveButtonNotificationForEndpoint:buttonAction:completion:]( self,  "didReceiveButtonNotificationForEndpoint:buttonAction:completion:",  v10,  a4,  v11);
LABEL_13:
}

- (void)player:(id)a3 needsToPlay:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000041FC;
  block[3] = &unk_100024640;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_player:(id)a3 needsToPlay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100002640();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessoryId]);
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = &stru_100024E50;
    __int16 v21 = 2114;
    v22 = v10;
    __int16 v23 = 1024;
    BOOL v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Player for endpoint %{public}@ needs to play: %{BOOL}d",  buf,  0x1Cu);
  }

  if (v4)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accessoryId]);

    objc_initWeak((id *)buf, v6);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000440C;
    v15[3] = &unk_100024668;
    id v14 = v12;
    id v16 = v14;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = self;
    -[HHDClockApp requestForegroundForEndpoint:completion:](self, "requestForegroundForEndpoint:completion:", v13, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    [v6 setState:2];
  }
}

- (void)player:(id)a3 playbackChanged:(unint64_t)a4 reason:(unint64_t)a5
{
  id v7 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004630;
  block[3] = &unk_100024690;
  id v12 = self;
  unint64_t v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)player:(id)a3 needsFade:(unint64_t)a4 endingAt:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = sub_100002640();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 endpoint]);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accessoryId]);
    int v14 = 138412802;
    __int16 v15 = &stru_100024E50;
    __int16 v16 = 2114;
    id v17 = v13;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@Player %{public}@ needs to fade with mode %ld",  (uint8_t *)&v14,  0x20u);
  }

  v9[2](v9, 0LL);
}

- (void)player:(id)a3 setVolumeCategory:(id)a4 level:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004958;
  v15[3] = &unk_1000246B8;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  unint64_t v19 = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (void).cxx_destruct
{
}

@end