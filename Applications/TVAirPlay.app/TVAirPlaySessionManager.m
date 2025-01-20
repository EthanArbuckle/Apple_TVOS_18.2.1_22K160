@interface TVAirPlaySessionManager
+ (TVAirPlaySessionManager)sharedInstance;
- (BOOL)_foregroundAppForAPRKVideoSession;
- (NSArray)activeSessions;
- (TVAirPlaySessionManager)init;
- (id)APRKPinSession;
- (id)APRKVideoSessionSession;
- (id)APRKVideoViewController;
- (id)_cleanupWithError:(id)a3;
- (id)_handleBackgroundSessionUpdate;
- (id)_handleForegroundUpdate;
- (id)_sessionOfType:(int64_t)a3 identifier:(id)a4 activeOnly:(BOOL)a5;
- (id)infoSessionWithID:(id)a3;
- (id)pinSessionWithID:(id)a3;
- (id)presentationSessionWithID:(id)a3;
- (id)streamingSessionWithID:(id)a3;
- (id)urlSessionWithID:(id)a3;
- (void)_callPendingCompletionHandlersWithError:(id)a3;
- (void)_deregisterLegacySession:(id)a3 options:(int64_t)a4;
- (void)_initializeStateMachine;
- (void)_removeAPRKVideoViewControllerIfNeeded;
- (void)_removeSession:(id)a3;
- (void)_requestMediaViewController;
- (void)_updateForSessionChange;
- (void)_updatePresentedViewController;
- (void)dealloc;
- (void)deregisterSession:(id)a3 options:(int64_t)a4;
- (void)mediaViewControllerDidBecomeReady:(id)a3;
- (void)mediaViewControllerDidDismiss:(id)a3;
- (void)registerSession:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation TVAirPlaySessionManager

+ (TVAirPlaySessionManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AD18;
  block[3] = &unk_100030C58;
  block[4] = a1;
  if (qword_10003F7A8 != -1) {
    dispatch_once(&qword_10003F7A8, block);
  }
  return (TVAirPlaySessionManager *)(id)qword_10003F7A0;
}

- (TVAirPlaySessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVAirPlaySessionManager;
  v2 = -[TVAirPlaySessionManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    sessions = v2->_sessions;
    v2->_sessions = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0LL,  0x10000LL));
    pendingCompletionHandlers = v2->_pendingCompletionHandlers;
    v2->_pendingCompletionHandlers = (NSMapTable *)v5;

    -[TVAirPlaySessionManager _initializeStateMachine](v2, "_initializeStateMachine");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVAirPlaySessionManager;
  -[TVAirPlaySessionManager dealloc](&v4, "dealloc");
}

- (void)registerSession:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004410();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Register session %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  -[NSMutableArray addObject:](self->_sessions, "addObject:", v6);
  pendingCompletionHandlers = self->_pendingCompletionHandlers;
  id v11 = objc_retainBlock(v7);

  -[NSMapTable setObject:forKey:](pendingCompletionHandlers, "setObject:forKey:", v11, v6);
  if ((objc_opt_respondsToSelector(v6, "wasRegistered") & 1) != 0) {
    [v6 wasRegistered];
  }
  -[TVAirPlaySessionManager _updateForSessionChange](self, "_updateForSessionChange");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 postNotificationName:@"TVAirPlaySessionManagerActiveSessionsDidChangeNotification" object:0];
}

- (void)deregisterSession:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_100004410();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deregister session %{public}@ options %ld",  (uint8_t *)&v9,  0x16u);
  }

  else {
    -[TVAirPlaySessionManager _removeSession:](self, "_removeSession:", v6);
  }
}

- (void)_deregisterLegacySession:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if ((v4 & 1) != 0)
  {
    [v6 setDeactivated:1];
    -[TVAirPlaySessionManager _updateForSessionChange](self, "_updateForSessionChange");
    objc_initWeak(&location, v7);
    dispatch_time_t v8 = dispatch_time(0LL, 5000000000LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B1E0;
    v13[3] = &unk_100030B18;
    int v9 = &v14;
    objc_copyWeak(&v14, &location);
    id v10 = v13;
LABEL_6:
    dispatch_after(v8, &_dispatch_main_q, v10);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }

  if ((v4 & 2) != 0)
  {
    [v6 setDeactivated:1];
    -[TVAirPlaySessionManager _updateForSessionChange](self, "_updateForSessionChange");
    objc_initWeak(&location, v7);
    dispatch_time_t v8 = dispatch_time(0LL, 5000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B2A0;
    block[3] = &unk_100030B18;
    int v9 = &v12;
    objc_copyWeak(&v12, &location);
    id v10 = block;
    goto LABEL_6;
  }

  -[TVAirPlaySessionManager _removeSession:](self, "_removeSession:", v6);
LABEL_7:
}

- (void)_removeSession:(id)a3
{
  id v5 = a3;
  -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v5);
  if ((objc_opt_respondsToSelector(v5, "wasDeregistered") & 1) != 0) {
    [v5 wasDeregistered];
  }
  -[TVAirPlaySessionManager _updateForSessionChange](self, "_updateForSessionChange");
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"TVAirPlaySessionManagerActiveSessionsDidChangeNotification" object:0];
}

- (id)pinSessionWithID:(id)a3
{
  return -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  4LL,  a3,  0LL);
}

- (id)infoSessionWithID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  5LL,  v4,  0LL));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlaySessionManager pinSessionWithID:](self, "pinSessionWithID:", v4));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVAirPlayInfoSession);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      id v5 = v6;
    }
    else {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (id)presentationSessionWithID:(id)a3
{
  return -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  1LL,  a3,  0LL);
}

- (id)streamingSessionWithID:(id)a3
{
  return -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  0LL,  a3,  0LL);
}

- (id)urlSessionWithID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  2LL,  v4,  0LL));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  3LL,  v4,  0LL));
  }

  return v5;
}

- (id)APRKPinSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlaySessionManager pinSessionWithID:](self, "pinSessionWithID:", 0LL));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVAirPlayAPRKPinSession);
  id v4 = 0LL;
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }

  return v4;
}

- (id)APRKVideoSessionSession
{
  return -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  6LL,  0LL,  0LL);
}

- (id)APRKVideoViewController
{
  return self->_aprkVideoViewController;
}

- (void)_removeAPRKVideoViewControllerIfNeeded
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKViewController videoSession](self->_aprkVideoViewController, "videoSession"));
  if (!v6
    || (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlaySessionManager APRKVideoSessionSession](self, "APRKVideoSessionSession")),
        unsigned __int8 v4 = [v6 isEqual:v3],
        v3,
        (v4 & 1) == 0))
  {
    aprkVideoViewController = self->_aprkVideoViewController;
    self->_aprkVideoViewController = 0LL;
  }
}

- (NSArray)activeSessions
{
  return (NSArray *)-[NSMutableArray copy](self->_sessions, "copy");
}

- (void)mediaViewControllerDidBecomeReady:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004410();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "mediaViewControllerDidBecomeReady:  %{public}@",  buf,  0xCu);
  }

  stateMachine = self->_stateMachine;
  int v9 = @"View Controller";
  id v10 = v4;
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Moved To Foreground",  0LL,  v8);
}

- (void)mediaViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004410();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "mediaViewControllerDidDismiss:  %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Moved To Background",  0LL,  0LL);
}

- (void)_initializeStateMachine
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Background",  0LL,  0LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  int v9 = self->_stateMachine;
  id v10 = sub_100004410();
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVSStateMachine setLogObject:](v9, "setLogObject:", v11);

  id v12 = self->_stateMachine;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000B9D4;
  v21[3] = &unk_100030C80;
  v21[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Sessions Updated",  @"Background",  v21);
  int v13 = self->_stateMachine;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000B9DC;
  v20[3] = &unk_100030C80;
  v20[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"Moved To Foreground",  @"Moving to Foreground",  v20);
  id v14 = self->_stateMachine;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000BA20;
  v19[3] = &unk_100030C80;
  v19[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v14,  "registerHandlerForEvent:onState:withBlock:",  @"Error",  @"Moving to Foreground",  v19);
  v15 = self->_stateMachine;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000BA70;
  v18[3] = &unk_100030C80;
  v18[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Sessions Updated",  @"Foreground",  v18);
  v16 = self->_stateMachine;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000BA78;
  v17[3] = &unk_100030C80;
  v17[4] = self;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v16,  "registerDefaultHandlerForEvent:withBlock:",  @"Moved To Background",  v17);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
}

- (id)_handleBackgroundSessionUpdate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  4LL,  0LL,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  5LL,  0LL,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  1LL,  0LL,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  2LL,  0LL,  1LL));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  6LL,  0LL,  1LL));
  if (v5
    || v6
    || v4
    || v3
    || -[TVAirPlaySessionManager _foregroundAppForAPRKVideoSession](self, "_foregroundAppForAPRKVideoSession") && v7)
  {
    stateMachine = self->_stateMachine;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000BBF8;
    v11[3] = &unk_100030CA8;
    v11[4] = self;
    -[TVSStateMachine executeBlockAfterCurrentStateTransition:]( stateMachine,  "executeBlockAfterCurrentStateTransition:",  v11);
    int v9 = @"Moving to Foreground";
  }

  else
  {
    -[TVAirPlaySessionManager _callPendingCompletionHandlersWithError:]( self,  "_callPendingCompletionHandlersWithError:",  0LL);
    int v9 = @"Background";
  }

  return (id)v9;
}

- (id)_handleForegroundUpdate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  4LL,  0LL,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  5LL,  0LL,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  1LL,  0LL,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  2LL,  0LL,  1LL));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  6LL,  0LL,  1LL));
  if (v5
    || v6
    || v4
    || v3
    || -[TVAirPlaySessionManager _foregroundAppForAPRKVideoSession](self, "_foregroundAppForAPRKVideoSession") && v7)
  {
    -[TVAirPlayMediaViewController setPinSession:](self->_mediaViewController, "setPinSession:", v3);
    -[TVAirPlayMediaViewController setDialogInfoSession:](self->_mediaViewController, "setDialogInfoSession:", v4);
    -[TVAirPlayMediaViewController setPresentationSession:](self->_mediaViewController, "setPresentationSession:", v5);
    -[TVAirPlayMediaViewController setVideoPlaybackSession:](self->_mediaViewController, "setVideoPlaybackSession:", v6);
    mediaViewController = self->_mediaViewController;
    if (-[TVAirPlaySessionManager _foregroundAppForAPRKVideoSession](self, "_foregroundAppForAPRKVideoSession")) {
      int v9 = v7;
    }
    else {
      int v9 = 0LL;
    }
    -[TVAirPlayMediaViewController setAPRKVideoSession:](mediaViewController, "setAPRKVideoSession:", v9);
    id v10 = @"Foreground";
  }

  else
  {
    -[TVAirPlayMediaViewController setPinSession:](self->_mediaViewController, "setPinSession:", 0LL);
    -[TVAirPlayMediaViewController setDialogInfoSession:](self->_mediaViewController, "setDialogInfoSession:", 0LL);
    -[TVAirPlayMediaViewController setPresentationSession:](self->_mediaViewController, "setPresentationSession:", 0LL);
    -[TVAirPlayMediaViewController setVideoPlaybackSession:]( self->_mediaViewController,  "setVideoPlaybackSession:",  0LL);
    -[TVAirPlayMediaViewController setAPRKVideoSession:](self->_mediaViewController, "setAPRKVideoSession:", 0LL);
    -[TVAirPlayMediaViewController dismiss](self->_mediaViewController, "dismiss");
    id v10 = @"Moving to Background";
  }

  -[TVAirPlaySessionManager _callPendingCompletionHandlersWithError:]( self,  "_callPendingCompletionHandlersWithError:",  0LL);

  return (id)v10;
}

- (BOOL)_foregroundAppForAPRKVideoSession
{
  return 1;
}

- (id)_cleanupWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004410();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleaning up:  %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  -[TVAirPlaySessionManager _callPendingCompletionHandlersWithError:]( self,  "_callPendingCompletionHandlersWithError:",  v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  4LL,  0LL,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  5LL,  0LL,  1LL));
  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  1LL,  0LL,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  2LL,  0LL,  1LL));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlaySessionManager _sessionOfType:identifier:activeOnly:]( self,  "_sessionOfType:identifier:activeOnly:",  6LL,  0LL,  1LL));
  [v7 userStop];
  [v8 userStop];
  [v9 userStop];
  [v10 userStop];
  [v11 userStop];
  aprkVideoViewController = self->_aprkVideoViewController;
  self->_aprkVideoViewController = 0LL;

  return @"Background";
}

- (void)_requestMediaViewController
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000C11C;
  v11[3] = &unk_100030CD0;
  v11[4] = self;
  v2 = objc_retainBlock(v11);
  id v3 = sub_100004410();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Request presentation for media view controller [Scene]",  buf,  2u);
  }

  id v5 = -[NSUserActivity initWithActivityType:]( objc_alloc(&OBJC_CLASS___NSUserActivity),  "initWithActivityType:",  @"com.apple.appletv.airplay-scene");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000C214;
  v8[3] = &unk_100030CF8;
  id v9 = v2;
  int v7 = v2;
  [v6 requestSceneSessionActivation:0 userActivity:v5 options:0 errorHandler:v8];
}

- (id)_sessionOfType:(int64_t)a3 identifier:(id)a4 activeOnly:(BOOL)a5
{
  id v8 = a4;
  sessions = self->_sessions;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000C2E4;
  v14[3] = &unk_100030D20;
  int64_t v16 = a3;
  id v10 = v8;
  id v15 = v10;
  BOOL v17 = a5;
  id v11 = -[NSMutableArray indexOfObjectWithOptions:passingTest:]( sessions,  "indexOfObjectWithOptions:passingTest:",  2LL,  v14);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v12 = 0LL;
  }
  else {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sessions, "objectAtIndexedSubscript:", v11));
  }

  return v12;
}

- (void)_updateForSessionChange
{
}

- (void)_updatePresentedViewController
{
}

- (void)_callPendingCompletionHandlersWithError:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMapTable copy](self->_pendingCompletionHandlers, "copy");
  -[NSMapTable removeAllObjects](self->_pendingCompletionHandlers, "removeAllObjects");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)v10),  (void)v12));
        ((void (**)(void, id))v11)[2](v11, v4);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end