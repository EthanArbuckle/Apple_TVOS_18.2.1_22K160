@interface HHDIntercomApp
- (BOOL)_isApplicationForegroundForEndpoint:(id)a3;
- (HHDIntercomApp)initWithQueue:(id)a3;
- (HHDIntercomApp)initWithQueue:(id)a3 factory:(id)a4;
- (id)_sessionForEndpoint:(id)a3;
- (id)applicationConfigurations;
- (id)applicationIdentifier;
- (int64_t)applicationPriorityClass;
- (void)_addSessionForEndpoint:(id)a3;
- (void)_playAnnouncementWithID:(id)a3 endpoint:(id)a4;
- (void)_removeSession:(id)a3;
- (void)_sendPlaybackCommand:(id)a3 toEndpoint:(id)a4 completion:(id)a5;
- (void)_setApplicationForegroundAssertion:(id)a3 forEndpoint:(id)a4;
- (void)_updateState:(id)a3;
- (void)applicationWillTerminate;
- (void)didAddEndpoint:(id)a3 reason:(int64_t)a4;
- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5;
- (void)didReceiveDismissNotificationForEndpoint:(id)a3;
- (void)didRemoveEndpoint:(id)a3 reason:(int64_t)a4;
- (void)session:(id)a3 didReceiveAnnouncement:(id)a4;
- (void)session:(id)a3 didUpdatePlaybackState:(unint64_t)a4;
- (void)session:(id)a3 willStartPlayingAtMachTime:(unint64_t)a4;
- (void)sessionInterrupted:(id)a3;
- (void)sessionInvalidated:(id)a3;
@end

@implementation HHDIntercomApp

- (HHDIntercomApp)initWithQueue:(id)a3 factory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HHDIntercomApp;
  v9 = -[HHDIntercomApp init](&v13, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    sessions = v9->_sessions;
    v9->_sessions = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v9->_factory, a4);
  }

  return v9;
}

- (HHDIntercomApp)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___HHDIntercomAppFactory);
  v6 = -[HHDIntercomApp initWithQueue:factory:](self, "initWithQueue:factory:", v4, v5);

  return v6;
}

- (id)applicationIdentifier
{
  return @"com.apple.announce";
}

- (void)applicationWillTerminate
{
}

- (void)didAddEndpoint:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v5));

  id v7 = sub_100011AE8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Already have a session for endpoint: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@Adding endpoint %@", (uint8_t *)&v10, 0x16u);
    }

    -[HHDIntercomApp _addSessionForEndpoint:](self, "_addSessionForEndpoint:", v5);
  }
}

- (void)didRemoveEndpoint:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v5));
  id v7 = sub_100011AE8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@Removing session for endpoint %@",  (uint8_t *)&v10,  0x16u);
    }

    -[HHDIntercomApp _removeSession:](self, "_removeSession:", v6);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      v11 = &stru_100024E50;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Nothing to remove for endpoint %@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)didReceiveDismissNotificationForEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ANPlaybackCommand stopCommand](&OBJC_CLASS___ANPlaybackCommand, "stopCommand"));
  -[HHDIntercomApp _sendPlaybackCommand:toEndpoint:completion:]( self,  "_sendPlaybackCommand:toEndpoint:completion:",  v5,  v4,  &stru_100024B68);
}

- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, void *))a5;
  if (a4 == 4)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ANPlaybackCommand previousCommand](&OBJC_CLASS___ANPlaybackCommand, "previousCommand"));
  }

  else if (a4 == 3)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ANPlaybackCommand nextCommand](&OBJC_CLASS___ANPlaybackCommand, "nextCommand"));
  }

  else
  {
    if (a4)
    {
LABEL_9:
      int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      v8[2](v8, v10);
      goto LABEL_10;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ANPlaybackCommand stopCommand](&OBJC_CLASS___ANPlaybackCommand, "stopCommand"));
  }

  int v10 = (void *)v9;
  if (!v9) {
    goto LABEL_9;
  }
  -[HHDIntercomApp _sendPlaybackCommand:toEndpoint:completion:]( self,  "_sendPlaybackCommand:toEndpoint:completion:",  v9,  v11,  v8);
LABEL_10:
}

- (id)applicationConfigurations
{
  id v3 = objc_alloc(&OBJC_CLASS___SIBSApplicationConfiguration);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp applicationIdentifier](self, "applicationIdentifier"));
  id v5 = [v3 initWithApplicationIdentifier:v4];

  [v5 setAudioCategory:0];
  [v5 setAudioMode:2];
  [v5 setLedAnimation:0];
  id v6 = [[SIBSApplicationColor alloc] initWithRed:0 green:255 blue:44];
  [v5 setLedColor:v6];
  id v7 = [[SIBSApplicationButtonBehavior alloc] initWithGesture:0 action:0];
  id v8 = [[SIBSApplicationButtonBehavior alloc] initWithGesture:1 action:3];
  id v9 = [[SIBSApplicationButtonBehavior alloc] initWithGesture:2 action:4];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  [v5 setButtonBehaviors:v10];

  id v13 = v5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  return v11;
}

- (int64_t)applicationPriorityClass
{
  return 1LL;
}

- (void)_sendPlaybackCommand:(id)a3 toEndpoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v9));
  id v12 = sub_100011AE8();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@Received Dismiss Notification for endpoint %@",  buf,  0x16u);
    }

    v15 = self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000121CC;
    v18[3] = &unk_100024BB8;
    id v19 = v8;
    id v20 = v9;
    v21 = v15;
    id v22 = v10;
    v16 = v15;
    [v11 sendPlaybackCommand:v19 completionHandler:v18];
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 accessoryId]);
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      __int16 v25 = 2114;
      id v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@Received dismiss from endpoint %{public}@, but there is no corresponding session",  buf,  0x16u);
    }

    v16 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    (*((void (**)(id, OS_dispatch_queue *))v10 + 2))(v10, v16);
  }
}

- (id)_sessionForEndpoint:(id)a3
{
  id v4 = a3;
  sessions = self->_sessions;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100012450;
  v10[3] = &unk_100024BE0;
  id v6 = v4;
  id v11 = v6;
  id v7 = -[NSMutableArray indexOfObjectPassingTest:](sessions, "indexOfObjectPassingTest:", v10);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = 0LL;
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_sessions, "objectAtIndex:", v7));
  }

  return v8;
}

- (void)_addSessionForEndpoint:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[HHDIntercomAppFactory createLocalPlaybackSessionWithEndpoint:]( self->_factory,  "createLocalPlaybackSessionWithEndpoint:",  a3));
  [v4 setDelegate:self];
  -[NSMutableArray addObject:](self->_sessions, "addObject:", v4);
}

- (void)_removeSession:(id)a3
{
  id v4 = a3;
  [v4 invalidateAssertion];
  [v4 invalidate];
  [v4 setDelegate:0];
  -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v4);
}

- (BOOL)_isApplicationForegroundForEndpoint:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 foregroundAssertion]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setApplicationForegroundAssertion:(id)a3 forEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v7));
  if (v8)
  {
    objc_initWeak((id *)location, v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100012780;
    v12[3] = &unk_100024588;
    objc_copyWeak(&v13, (id *)location);
    [v6 setRevocationHandler:v12];
    [v8 setForegroundAssertion:v6];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v9 = sub_100011AE8();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accessoryId]);
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = &stru_100024E50;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@Unable to find session for endpoint %{public}@ on foreground granted",  location,  0x16u);
    }

    [v6 invalidate];
  }
}

- (void)_updateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
  id v6 = sub_100011AE8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
    uint64_t v9 = SIBSIntercomStateAsString([v4 state]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138412802;
    v24 = &stru_100024E50;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@Handling State Update Request for endpoint %{public}@: %{public}@",  buf,  0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v5));
  if (v11)
  {
    if (((unint64_t)[v4 state] | 2) == 3)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 foregroundAssertion]);

      if (v12)
      {
        if ([v4 state] == (id)3)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 announcementID]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
          -[HHDIntercomApp _playAnnouncementWithID:endpoint:](self, "_playAnnouncementWithID:endpoint:", v13, v14);
        }
      }

      else
      {
        objc_initWeak((id *)buf, self);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100012BA0;
        v19[3] = &unk_100024C08;
        objc_copyWeak(&v22, (id *)buf);
        id v20 = v5;
        id v21 = v4;
        -[HHDIntercomApp requestForegroundForEndpoint:completion:]( self,  "requestForegroundForEndpoint:completion:",  v18,  v19);

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }
    }

    else
    {
      [v11 invalidateAssertion];
    }
  }

  else
  {
    id v15 = sub_100011AE8();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      __int16 v25 = 2114;
      id v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@Cannot find session for %{public}@, unable to process state update request",  buf,  0x16u);
    }
  }
}

- (void)_playAnnouncementWithID:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDIntercomApp _sessionForEndpoint:](self, "_sessionForEndpoint:", v7));
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 playbackState] == (id)1)
    {
      id v10 = sub_100011AE8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = &stru_100024E50;
        id v12 = "%@Session is already playing. Not requesting playback.";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        uint32_t v16 = 12;
        goto LABEL_12;
      }
    }

    else if (v6)
    {
      id v22 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ANPlaybackCommand playCommandWithOptions:announcementIdentifiers:]( &OBJC_CLASS___ANPlaybackCommand,  "playCommandWithOptions:announcementIdentifiers:",  951LL,  v17));

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000130C4;
      v19[3] = &unk_100024C58;
      id v20 = v9;
      id v21 = self;
      [v20 sendPlaybackCommand:v11 completionHandler:v19];
    }

    else
    {
      id v18 = sub_100011AE8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = &stru_100024E50;
        id v12 = "%@Attemping to play without an announcementID";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_11;
      }
    }
  }

  else
  {
    id v15 = sub_100011AE8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      __int16 v25 = 2112;
      id v26 = v7;
      id v12 = "%@Failed to find session for endpoint. %@";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v16);
    }
  }
}

- (void)sessionInterrupted:(id)a3
{
  id v4 = a3;
  id v5 = sub_100011AE8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = &stru_100024E50;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@Session Interrupted: %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000133EC;
  block[3] = &unk_100024C80;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)sessionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = sub_100011AE8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = &stru_100024E50;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@Session Invalidated: %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000135E8;
  block[3] = &unk_100024C80;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)session:(id)a3 willStartPlayingAtMachTime:(unint64_t)a4
{
  id v5 = a3;
  id v6 = sub_100011AE8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    uint64_t v9 = &stru_100024E50;
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@Session %@ will start playing at mach time %llu",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)session:(id)a3 didUpdatePlaybackState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100011AE8();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint32_t v16 = &stru_100024E50;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Session %@ did update playback state: %lu",  buf,  0x20u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000138CC;
  block[3] = &unk_100024690;
  unint64_t v13 = self;
  unint64_t v14 = a4;
  id v12 = v6;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)session:(id)a3 didReceiveAnnouncement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100011AE8();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 announcementID]);
    *(_DWORD *)buf = 138412546;
    __int16 v19 = &stru_100024E50;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@Received Announcement: %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013B84;
  block[3] = &unk_100024CA8;
  id v15 = v6;
  id v16 = v7;
  __int16 v17 = self;
  id v12 = v7;
  id v13 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
}

@end