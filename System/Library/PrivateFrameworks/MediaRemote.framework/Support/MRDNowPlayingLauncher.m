@interface MRDNowPlayingLauncher
- (MRDNowPlayingLauncher)initWithBundleIdentifier:(id)a3 options:(unint64_t)a4;
- (MRDNowPlayingLauncherDelegate)delegate;
- (MSVTimer)playbackStateTimer;
- (NSOperationQueue)notificationOperationQueue;
- (NSString)bundleIdentifier;
- (RBSProcessHandle)processHandle;
- (unint64_t)options;
- (void)_background;
- (void)_cleanup;
- (void)_launch;
- (void)_monitorForTermination:(int)a3;
- (void)_nowPlayingPlaybackStateDidChange:(id)a3;
- (void)_relaunch;
- (void)_startObservingNotifications;
- (void)_stopObservingNotifications;
- (void)_submitLaunchFailure;
- (void)_submitRelaunchEvent:(BOOL)a3;
- (void)_submitTerminationEvent:(unint64_t)a3;
- (void)background;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNotificationOperationQueue:(id)a3;
- (void)setPlaybackStateTimer:(id)a3;
- (void)setProcessHandle:(id)a3;
@end

@implementation MRDNowPlayingLauncher

- (MRDNowPlayingLauncher)initWithBundleIdentifier:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDNowPlayingLauncher;
  v8 = -[MRDNowPlayingLauncher init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.nowPlayingLauncherNotifications", v11);
    v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    notificationOperationQueue = v9->_notificationOperationQueue;
    v9->_notificationOperationQueue = v13;

    -[NSOperationQueue setUnderlyingQueue:](v9->_notificationOperationQueue, "setUnderlyingQueue:", v12);
    v9->_options = a4;
    -[MRDNowPlayingLauncher _startObservingNotifications](v9, "_startObservingNotifications");
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDNowPlayingLauncher;
  -[MRDNowPlayingLauncher dealloc](&v3, "dealloc");
}

- (void)background
{
}

- (void)_cleanup
{
}

- (void)_launch
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ ...", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011F700;
  v9[3] = &unk_1003A17F8;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v3 openApplication:v8 withOptions:0 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_background
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  uint64_t v15 = FBSOpenApplicationOptionKeyActivateSuspended;
  objc_super v16 = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
  uint64_t v8 = _MRLogForCategory(1LL, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ ...", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10011FA84;
  v11[3] = &unk_1003A1820;
  id v12 = v6;
  id v10 = v6;
  [v3 openApplication:v10 withOptions:v5 completion:v11];
}

- (void)_relaunch
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "nowPlayingLauncher:shouldRelaunch:");

    if ((v6 & 1) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher delegate](self, "delegate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
      id v9 = [v7 nowPlayingLauncher:self shouldRelaunch:v8];

      uint64_t v11 = _MRLogForCategory(1LL, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v9)
      {
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
          int v16 = 138543362;
          v17 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Relaunching terminated process %{public}@",  (uint8_t *)&v16,  0xCu);
        }

        -[MRDNowPlayingLauncher _launch](self, "_launch");
      }

      else
      {
        if (v13)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
          int v16 = 138543362;
          v17 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not relaunching terminated process %{public}@",  (uint8_t *)&v16,  0xCu);
        }
      }

      -[MRDNowPlayingLauncher _submitRelaunchEvent:](self, "_submitRelaunchEvent:", v9);
    }
  }

- (void)_monitorForTermination:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher processHandle](self, "processHandle"));

  if (v5)
  {
    uint64_t v7 = _MRLogForCategory(1LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher processHandle](self, "processHandle"));
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      __int16 v22 = 1026;
      unsigned int v23 = [v10 pid];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Process %{public}@ at pid:%{public}d is already being monitored",  buf,  0x12u);
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v3));
    id v19 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v8,  &v19));
    id v12 = v19;
    -[MRDNowPlayingLauncher setProcessHandle:](self, "setProcessHandle:", v11);

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(1LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1002B9F20(self, (uint64_t)v12, v15);
      }

      -[MRDNowPlayingLauncher _cleanup](self, "_cleanup");
    }

    else
    {
      objc_initWeak((id *)buf, self);
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher processHandle](self, "processHandle"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10011FF10;
      v17[3] = &unk_1003A1848;
      objc_copyWeak(&v18, (id *)buf);
      [v16 monitorForDeath:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_startObservingNotifications
{
  uint64_t v3 = _MRLogForCategory(1LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Start observing NowPlaying notifications for %{public}@",  buf,  0xCu);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications(1LL);
  objc_initWeak((id *)buf, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher notificationOperationQueue](self, "notificationOperationQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100120244;
  v9[3] = &unk_10039B930;
  objc_copyWeak(&v10, (id *)buf);
  id v8 =  [v6 addObserverForName:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0 queue:v7 usingBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_stopObservingNotifications
{
  uint64_t v3 = _MRLogForCategory(1LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Stop observing NowPlaying notifications for %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications(0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0];
}

- (void)_nowPlayingPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemotePlaybackStateUserInfoKey]);
  unsigned int v7 = [v6 unsignedIntValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"_MROriginatingNotification"]);

  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1001206B0;
  v26[3] = &unk_1003A1870;
  objc_copyWeak(&v29, &location);
  id v12 = v9;
  id v27 = v12;
  unsigned int v30 = v7;
  id v13 = v11;
  id v28 = v13;
  uint64_t v14 = (MSVTimer *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:block:",  0LL,  v26,  1.0));
  playbackStateTimer = self->_playbackStateTimer;
  self->_playbackStateTimer = v14;

  uint64_t v17 = _MRLogForCategory(1LL, v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)buf = 138543874;
    v33 = v19;
    __int16 v34 = 1026;
    unsigned int v35 = v7;
    __int16 v36 = 2114;
    id v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ received PlaybackStateDidChangeNotification. PlaybackState: %{public}d. PlayerPath: %{public}@.",  buf,  0x1Cu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v21 = [v20 homepodDemoMode];

  if (v21)
  {
    uint64_t v23 = _MRLogForCategory(1LL, v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will ignore this notification (and future PlaybackStateDidChangeNotifications) since HomePod is in demo mode.",  buf,  0xCu);
    }

    -[MRDNowPlayingLauncher _stopObservingNotifications](self, "_stopObservingNotifications");
  }

  else if (v7 == 1)
  {
    -[MRDNowPlayingLauncher launch](self, "launch");
  }

  else
  {
    -[MRDNowPlayingLauncher background](self, "background");
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_submitLaunchFailure
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001208E4;
  v3[3] = &unk_100399650;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
  id v2 = v4;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.appmonitor.launcher", 0LL, v3);
}

- (void)_submitRelaunchEvent:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100120A08;
  v5[3] = &unk_1003A1898;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
  BOOL v7 = a3;
  id v4 = v6;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.appmonitor.launcher", 0LL, v5);
}

- (void)_submitTerminationEvent:(unint64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100120B50;
  v5[3] = &unk_10039D1C0;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingLauncher bundleIdentifier](self, "bundleIdentifier"));
  unint64_t v7 = a3;
  id v4 = v6;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.appmonitor.launcher", 0LL, v5);
}

- (MRDNowPlayingLauncherDelegate)delegate
{
  return (MRDNowPlayingLauncherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSOperationQueue)notificationOperationQueue
{
  return self->_notificationOperationQueue;
}

- (void)setNotificationOperationQueue:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (MSVTimer)playbackStateTimer
{
  return self->_playbackStateTimer;
}

- (void)setPlaybackStateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end