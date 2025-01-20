@interface MRDLockScreenController
- (BOOL)_onQueue_calculateShouldShowLockScreenForReason:(id *)a3;
- (BOOL)_onQueue_isLockScreenWidgetVisible;
- (BOOL)hasLockScreenAssertion;
- (BOOL)hasLockScreenRecommendationAssertion;
- (BOOL)hasPresentedForCurrentPersonalDevices;
- (BOOL)isLockScreenRecommendationActive;
- (BOOL)isLockScreenWidgetActive;
- (BOOL)isLockScreenWidgetVisible;
- (BOOL)shouldFinishPresentationForCurrentPersonalDevices;
- (MRDLockScreenAssertion)legacyAssertion;
- (MRDLockScreenContentController)contentController;
- (MRDLockScreenController)init;
- (MRDLockScreenControllerDelegate)delegate;
- (MRDPersonalDeviceController)personalDeviceController;
- (MRLockScreenUIControllable)uiController;
- (MRPlayerPath)electedPlayerPath;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)previousPlayerPath;
- (int64_t)changeType;
- (int64_t)eventType;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_onQueue_reevaluateShouldShowLockScreenForReason:(id)a3;
- (void)_onSerialQueue_restoreElectedPlayer;
- (void)lockScreenContentControllerStateDidChange:(id)a3;
- (void)personalDeviceControllerStateDidChange:(id)a3;
- (void)routeRecommendationDismissed;
- (void)setChangeType:(int64_t)a3;
- (void)setContentController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElectedPlayerPath:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setHasLockScreenAssertion:(BOOL)a3;
- (void)setHasLockScreenRecommendationAssertion:(BOOL)a3;
- (void)setHasPresentedForCurrentPersonalDevices:(BOOL)a3;
- (void)setLegacyAssertion:(id)a3;
- (void)setLockScreenRecommendationActive:(BOOL)a3;
- (void)setPersonalDeviceController:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPreviousPlayerPath:(id)a3;
- (void)setShouldFinishPresentationForCurrentPersonalDevices:(BOOL)a3;
- (void)setUiController:(id)a3;
@end

@implementation MRDLockScreenController

- (MRDLockScreenController)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRDLockScreenController;
  v2 = -[MRDLockScreenController init](&v25, "init");
  v3 = v2;
  if (v2)
  {
    id playerPathInvalidationToken = v2->_playerPathInvalidationToken;
    v2->_id playerPathInvalidationToken = 0LL;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = (MRDDisplayMonitor *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRDLockScreenController", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v3->_hasLockScreenAssertion = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v3 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v3->_displayMonitor];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v3 selector:"_handleElectedPlayerDidChangeNotification:" name:kMRMediaRemoteElectedPlayerDidChangeNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v3 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v3 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v16 = [v15 supportLockscreenPlatterDisplayForPersonalDevice];

    if (v16)
    {
      v17 = objc_opt_new(&OBJC_CLASS___MRDPersonalDeviceController);
      personalDeviceController = v3->_personalDeviceController;
      v3->_personalDeviceController = v17;

      -[MRDPersonalDeviceController setDelegate:](v3->_personalDeviceController, "setDelegate:", v3);
      v19 = objc_alloc_init(&OBJC_CLASS___MRDLockScreenContentController);
      contentController = v3->_contentController;
      v3->_contentController = v19;

      -[MRDLockScreenContentController setDelegate:](v3->_contentController, "setDelegate:", v3);
      *(_WORD *)&v3->_hasPresentedForCurrentPersonalDevices = 0;
    }

    v21 = (dispatch_queue_s *)v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A893C;
    block[3] = &unk_100399250;
    v24 = v3;
    dispatch_async(v21, block);
  }

  return v3;
}

- (BOOL)isLockScreenWidgetActive
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A89F4;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_onQueue_isLockScreenWidgetVisible
{
  if (self->_hasLockScreenAssertion)
  {
    BOOL v3 = -[MRDDisplayMonitor lockScreenVisible](self->_displayMonitor, "lockScreenVisible");
    if (v3) {
      LOBYTE(v3) = !-[MRDDisplayMonitor ambientVisible](self->_displayMonitor, "ambientVisible");
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)isLockScreenWidgetVisible
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A8AE4;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setHasLockScreenAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_hasLockScreenAssertion != v3)
  {
    self->_hasLockScreenAssertion = v3;
    if (self->_delegate)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A8B9C;
      block[3] = &unk_100399250;
      void block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (BOOL)isLockScreenRecommendationActive
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A8C3C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLockScreenRecommendationActive:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A8CAC;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setPreviousPlayerPath:(id)a3
{
  id v5 = a3;
  if (self->_previousPlayerPathInvalidationToken)
  {
    MRMediaRemoteRemovePlayerPathInvalidationHandler();
    id previousPlayerPathInvalidationToken = self->_previousPlayerPathInvalidationToken;
    self->_id previousPlayerPathInvalidationToken = 0LL;
  }

  objc_storeStrong((id *)&self->_previousPlayerPath, a3);
  if (self->_previousPlayerPath)
  {
    objc_initWeak(&location, self);
    previousPlayerPath = self->_previousPlayerPath;
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A8DC8;
    v11[3] = &unk_10039E6F0;
    objc_copyWeak(&v12, &location);
    char v9 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler(previousPlayerPath, queue, v11);
    id v10 = self->_previousPlayerPathInvalidationToken;
    self->_id previousPlayerPathInvalidationToken = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)setPlayerPath:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = -[MRDLockScreenController _onQueue_isLockScreenWidgetVisible](self, "_onQueue_isLockScreenWidgetVisible");
  if (self->_changeType && (v6 & 1) != 0)
  {
    uint64_t v8 = _MRLogForCategory(0LL, v7);
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = self->_playerPath;
      v11 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription(self->_changeType);
      *(_DWORD *)buf = 138544130;
      v37 = playerPath;
      __int16 v38 = 2114;
      id v39 = v5;
      __int16 v40 = 2114;
      v41 = v11;
      __int16 v42 = 2114;
      v43 = @"visible";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Deferring setting playerPath from %{public}@ to %{public}@ because changeType is <%{pu blic}@> and lock screen is <%{public}@>",  buf,  0x2Au);
    }

    if (self->_playerPathInvalidationToken)
    {
      MRMediaRemoteRemovePlayerPathInvalidationHandler();
      id playerPathInvalidationToken = self->_playerPathInvalidationToken;
      self->_id playerPathInvalidationToken = 0LL;
    }

    objc_initWeak((id *)buf, self);
    v13 = self->_playerPath;
    queue = self->_queue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000A91B8;
    v32[3] = &unk_10039E6F0;
    objc_copyWeak(&v33, (id *)buf);
    v15 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler(v13, queue, v32);
    id v16 = self->_playerPathInvalidationToken;
    self->_id playerPathInvalidationToken = v15;

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    -[MRDLockScreenController setPreviousPlayerPath:](self, "setPreviousPlayerPath:", self->_playerPath);
    if (self->_playerPathInvalidationToken)
    {
      MRMediaRemoteRemovePlayerPathInvalidationHandler();
      id v18 = self->_playerPathInvalidationToken;
      self->_id playerPathInvalidationToken = 0LL;
    }

    uint64_t v19 = _MRLogForCategory(0LL, v17);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_playerPath;
      *(_DWORD *)buf = 138543618;
      v37 = v21;
      __int16 v38 = 2114;
      id v39 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Setting playerPath from %{public}@ to %{public}@",  buf,  0x16u);
    }

    objc_storeStrong((id *)&self->_playerPath, a3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A91AC;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v22 = v5;
    id v35 = v22;
    dispatch_async(&_dispatch_main_q, block);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 nowPlayingServer]);
    objc_super v25 = (MRDNowPlayingServerResult *)objc_claimAutoreleasedReturnValue([v24 queryExistingPlayerPath:v22]);
    playerResult = self->_playerResult;
    self->_playerResult = v25;

    v27 = objc_alloc(&OBJC_CLASS___NSString);
    v29 = self->_playerPath;
    previousPlayerPath = self->_previousPlayerPath;
    v30 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription(self->_changeType);
    v31 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"PlayerPath changed from %@ to %@ with changeType %@",  previousPlayerPath,  v29,  v30);
    -[MRDLockScreenController _onQueue_reevaluateShouldShowLockScreenForReason:]( self,  "_onQueue_reevaluateShouldShowLockScreenForReason:",  v31);
  }
}

- (void)_onSerialQueue_restoreElectedPlayer
{
  electedPlayerPath = self->_electedPlayerPath;
  if (electedPlayerPath != self->_playerPath
    && (-[MRPlayerPath isEqual:](electedPlayerPath, "isEqual:") & 1) == 0)
  {
    uint64_t v5 = _MRLogForCategory(0LL, v4);
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = self->_playerPath;
      uint64_t v8 = self->_electedPlayerPath;
      int v9 = 138543618;
      id v10 = playerPath;
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Restoring defered playerPath from %{public}@ to electedPlayerPath %{public}@",  (uint8_t *)&v9,  0x16u);
    }

    self->_changeType = 0LL;
    -[MRDLockScreenController setPlayerPath:](self, "setPlayerPath:", self->_electedPlayerPath);
  }

- (void)personalDeviceControllerStateDidChange:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A934C;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)lockScreenContentControllerStateDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A93F0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)routeRecommendationDismissed
{
  id v6 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"recommendation dismissed"];
  [v6 setType:2];
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v2 mediaRecentlyPlayedInterval];
  objc_msgSend(v6, "setDisableDuration:");

  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 routingServer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemEndpointController]);
  [v5 updateSystemEndpointForRequest:v6];
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9510;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey]);
  uint64_t v8 = (int)[v7 intValue];

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MRDElectedPlayerControllerEventUserInfoKey"]);
  uint64_t v11 = (int)[v10 intValue];

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9674;
  block[3] = &unk_1003990A8;
  void block[4] = self;
  id v15 = v5;
  uint64_t v16 = v8;
  uint64_t v17 = v11;
  id v13 = v5;
  dispatch_sync(queue, block);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9754;
  block[3] = &unk_100398E60;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v6 = [v5 supportManyRecommendationsPlatters];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey]);

    int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
    id v11 = [v10 integerValue];

    if (v11 == (id)3)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);

      uint64_t v14 = _MRLogForCategory(0LL, v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
          int v20 = 138412290;
          v21 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Requesting legacy RSE presentation - %@",  (uint8_t *)&v20,  0xCu);
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController uiController](self, "uiController"));
        [v18 acquireRouteRecommendationAssertionForIdentifiers:&off_1003BBB40];
      }

      else
      {
        if (v16)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
          int v20 = 138412290;
          v21 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Requesting legacy RSE dismissal - %@",  (uint8_t *)&v20,  0xCu);
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController uiController](self, "uiController"));
        [v18 releaseRouteRecommendationAssertion];
      }

      -[MRDLockScreenController setHasLockScreenRecommendationAssertion:]( self,  "setHasLockScreenRecommendationAssertion:",  v12 != 0LL);
    }
  }
}

- (void)_onQueue_reevaluateShouldShowLockScreenForReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1002B784C((uint64_t)v4, v7);
  }

  if (!-[MRDDisplayMonitor lockScreenVisible](self->_displayMonitor, "lockScreenVisible")) {
    -[MRDLockScreenController _onSerialQueue_restoreElectedPlayer](self, "_onSerialQueue_restoreElectedPlayer");
  }
  uint64_t v20 = 0LL;
  if (-[MRDLockScreenController _onQueue_calculateShouldShowLockScreenForReason:]( self,  "_onQueue_calculateShouldShowLockScreenForReason:",  &v20))
  {
    if (!-[MRDLockScreenController hasLockScreenAssertion](self, "hasLockScreenAssertion"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController uiController](self, "uiController"));
      int v9 = v8;
      if (v8)
      {
        [v8 acquireLockScreenControlsAssertion];
      }

      else
      {
        BOOL v16 = objc_alloc_init(&OBJC_CLASS___MRDLockScreenAssertion);
        -[MRDLockScreenController setLegacyAssertion:](self, "setLegacyAssertion:", v16);
      }

      uint64_t v17 = self;
      uint64_t v18 = 1LL;
LABEL_22:
      -[MRDLockScreenController setHasLockScreenAssertion:](v17, "setHasLockScreenAssertion:", v18);
LABEL_23:
    }
  }

  else if (-[MRDLockScreenController _onQueue_isLockScreenWidgetVisible](self, "_onQueue_isLockScreenWidgetVisible"))
  {
    uint64_t v11 = _MRLogForCategory(0LL, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1002B780C(v12);
    }

    if (!self->_playerPath)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] LockScreen now showing empty controls. Will be dismissed when lock screen is no longer visible",  v19,  2u);
      }

      goto LABEL_23;
    }
  }

  else if (-[MRDLockScreenController hasLockScreenAssertion](self, "hasLockScreenAssertion"))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController uiController](self, "uiController"));
    if (v9)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController uiController](self, "uiController"));
      [v15 releaseLockScreenControlsAssertion];
    }

    else
    {
      -[MRDLockScreenController setLegacyAssertion:](self, "setLegacyAssertion:", 0LL);
    }

    uint64_t v17 = self;
    uint64_t v18 = 0LL;
    goto LABEL_22;
  }
}

- (BOOL)_onQueue_calculateShouldShowLockScreenForReason:(id *)a3
{
  if (!self->_playerPath)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController personalDeviceController](self, "personalDeviceController"));
    if ([v6 personalDeviceWasRecentlyAttached])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenController contentController](self, "contentController"));
      if ([v7 lockScreenPlatterHasContent]
        && -[MRDDisplayMonitor lockScreenVisible](self->_displayMonitor, "lockScreenVisible"))
      {
        unsigned __int8 v8 = -[MRDLockScreenController shouldFinishPresentationForCurrentPersonalDevices]( self,  "shouldFinishPresentationForCurrentPersonalDevices");

        if ((v8 & 1) == 0)
        {
          BOOL v5 = 1;
          -[MRDLockScreenController setHasPresentedForCurrentPersonalDevices:]( self,  "setHasPresentedForCurrentPersonalDevices:",  1LL);
          *a3 = @"personalDeviceAttached";
          return v5;
        }

        return 0;
      }
    }

    return 0;
  }

  *a3 = @"playerPath";
  return 1;
}

- (MRLockScreenUIControllable)uiController
{
  uiController = self->_uiController;
  if (!uiController)
  {
    id v4 = (MRLockScreenUIControllable *)objc_claimAutoreleasedReturnValue( +[MRDUIControllerProvider lockScreenUIControllerWithDelegate:]( &OBJC_CLASS___MRDUIControllerProvider,  "lockScreenUIControllerWithDelegate:",  self));
    BOOL v5 = self->_uiController;
    self->_uiController = v4;

    uiController = self->_uiController;
  }

  return uiController;
}

- (MRDLockScreenControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRDLockScreenControllerDelegate *)a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlayerPath)previousPlayerPath
{
  return self->_previousPlayerPath;
}

- (void)setUiController:(id)a3
{
}

- (BOOL)hasLockScreenAssertion
{
  return self->_hasLockScreenAssertion;
}

- (BOOL)hasLockScreenRecommendationAssertion
{
  return self->_hasLockScreenRecommendationAssertion;
}

- (void)setHasLockScreenRecommendationAssertion:(BOOL)a3
{
  self->_hasLockScreenRecommendationAssertion = a3;
}

- (MRDLockScreenAssertion)legacyAssertion
{
  return self->_legacyAssertion;
}

- (void)setLegacyAssertion:(id)a3
{
}

- (MRPlayerPath)electedPlayerPath
{
  return self->_electedPlayerPath;
}

- (void)setElectedPlayerPath:(id)a3
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (MRDPersonalDeviceController)personalDeviceController
{
  return self->_personalDeviceController;
}

- (void)setPersonalDeviceController:(id)a3
{
}

- (MRDLockScreenContentController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
}

- (BOOL)hasPresentedForCurrentPersonalDevices
{
  return self->_hasPresentedForCurrentPersonalDevices;
}

- (void)setHasPresentedForCurrentPersonalDevices:(BOOL)a3
{
  self->_hasPresentedForCurrentPersonalDevices = a3;
}

- (BOOL)shouldFinishPresentationForCurrentPersonalDevices
{
  return self->_shouldFinishPresentationForCurrentPersonalDevices;
}

- (void)setShouldFinishPresentationForCurrentPersonalDevices:(BOOL)a3
{
  self->_shouldFinishPresentationForCurrentPersonalDevices = a3;
}

- (void).cxx_destruct
{
}

@end