@interface RPRecordingManager
- (BOOL)isMicrophoneRecording;
- (BOOL)volumeMatchesCachePath:(id)a3;
- (NSMutableDictionary)currentAvailableExtensions;
- (NSMutableDictionary)streamUpdateFilterTimers;
- (RPConnectionManager)connectionManager;
- (RPRecordingManager)initWithConnectionManager:(id)a3;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)getCallingConnectionBundleID;
- (id)getCallingConnectionClient;
- (id)periodic:(id)a3 urgency:(int)a4;
- (id)purge:(id)a3 urgency:(int)a4;
- (id)purgeable:(id)a3 urgency:(int)a4;
- (void)applicationDisconnectedWithBundleID:(id)a3 withProcessIdentifier:(int)a4;
- (void)connectionManagerDidAcceptNewConnection:(id)a3 bundleIdentifier:(id)a4;
- (void)createNewBroadcastClientWithBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 isSystemBroadcast:(BOOL)a7 handler:(id)a8;
- (void)dealloc;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)getSystemBroadcastExtensionInfo:(id)a3;
- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4;
- (void)macApplicationDidResignActive;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppRecording;
- (void)processSaveToPhotos:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6;
- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4;
- (void)saveToCameraRoll:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6 handler:(id)a7;
- (void)saveVideo:(id)a3 handler:(id)a4;
- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4;
- (void)setBroadcastURL:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setCurrentAvailableExtensions:(id)a3;
- (void)setMicrophoneRecording:(BOOL)a3;
- (void)setStreamUpdateFilterTimers:(id)a3;
- (void)setUpMemoryPressureNotification;
- (void)setUserNotificationCenter:(id)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopAllActiveClients;
- (void)stopClipBufferingWithCompletionHandler:(id)a3;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastWithHandler:(id)a3;
- (void)stopInAppCaptureWithHandler:(id)a3;
- (void)stopInAppRecordingWithHandler:(id)a3;
- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
- (void)updateClient:(id)a3 withHostBundleID:(id)a4 broadcastExtensionBundleID:(id)a5 broadcastConfigurationData:(id)a6 userInfo:(id)a7 isSystemBroadcast:(BOOL)a8 handler:(id)a9;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
@end

@implementation RPRecordingManager

- (RPRecordingManager)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPRecordingManager;
  v5 = -[RPRecordingManager init](&v10, "init");
  if (v5)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "-[RPRecordingManager initWithConnectionManager:]";
      __int16 v13 = 1024;
      int v14 = 160;
      __int16 v15 = 2048;
      v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    -[RPRecordingManager setConnectionManager:](v5, "setConnectionManager:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[RPRecordingManager setCurrentAvailableExtensions:](v5, "setCurrentAvailableExtensions:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[RPRecordingManager setStreamUpdateFilterTimers:](v5, "setStreamUpdateFilterTimers:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v8 _srSetupTempDirectory];

    -[RPRecordingManager setUpMemoryPressureNotification](v5, "setUpMemoryPressureNotification");
  }

  return v5;
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPRecordingManager dealloc]";
    __int16 v6 = 1024;
    int v7 = 197;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPRecordingManager;
  -[RPRecordingManager dealloc](&v3, "dealloc");
}

- (void)setUpMemoryPressureNotification
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    objc_super v10 = "-[RPRecordingManager setUpMemoryPressureNotification]";
    __int16 v11 = 1024;
    int v12 = 208;
    __int16 v13 = 2048;
    int v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000110E0;
  v8[3] = &unk_100071120;
  v8[4] = self;
  objc_super v3 = objc_retainBlock(v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000111C8;
  v7[3] = &unk_100071120;
  v7[4] = self;
  id v4 = objc_retainBlock(v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001136C;
  v6[3] = &unk_100071120;
  v6[4] = self;
  v5 = objc_retainBlock(v6);
  CacheDeleteRegisterInfoCallbacks(@"com.apple.replayd-cache-delete", v3, v4, &stru_100071140, v5);
}

- (BOOL)volumeMatchesCachePath:(id)a3
{
  return [a3 isEqualToString:@"/private/var/mobile"];
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME", *(void *)&a4));
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v5))
  {
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = [v6 _srSizeOfTempDir:0];
  }

  else
  {
    id v7 = 0LL;
  }

  v11[0] = @"CACHE_DELETE_VOLUME";
  v11[1] = @"CACHE_DELETE_AMOUNT";
  v12[0] = v5;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  return v9;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v8 = [v7 _srSizeOfTempDir:0];

    if (a4 >= 3)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[RPRecordingManager purge:urgency:]";
        __int16 v19 = 1024;
        int v20 = 256;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d cacheDeleteUrgencyHigh",  buf,  0x12u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
      [v9 handleMemoryWarningForCurrentActiveSession];
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _scUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_scUserErrorForCode:userInfo:",  -3805LL,  0LL));
      [v10 stopAllClientStreamsWithError:v11];
    }
  }

  else
  {
    id v8 = 0LL;
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  v8,  @"CACHE_DELETE_VOLUME",  @"CACHE_DELETE_AMOUNT",  v6));
  v16[1] = v12;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  &v15,  2LL));

  return v13;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME", *(void *)&a4));
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v5))
  {
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = [v6 _srDeleteFilesOlderThanTimeToLiveInSeconds:1 deleteSystemFiles:86400.0];
  }

  else
  {
    id v7 = 0LL;
  }

  v11[0] = @"CACHE_DELETE_VOLUME";
  v11[1] = @"CACHE_DELETE_AMOUNT";
  v12[0] = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  return v9;
}

- (void)connectionManagerDidAcceptNewConnection:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getClientWithBundleID:v5]);

  if (v8)
  {
    v9 = -[RPClientProxy initWithConnection:](objc_alloc(&OBJC_CLASS___RPClientProxy), "initWithConnection:", v6);
    [v8 setClientProxy:v9];

    id v10 = [v6 processIdentifier];
    [v8 setClientPID:v10];
  }

  else
  {
    __int16 v11 = objc_alloc(&OBJC_CLASS___RPClient);
    int v12 = -[RPClientProxy initWithConnection:](objc_alloc(&OBJC_CLASS___RPClientProxy), "initWithConnection:", v6);
    __int16 v13 = -[RPClient initWithConnection:clientProxy:bundleIdentifier:]( v11,  "initWithConnection:clientProxy:bundleIdentifier:",  v6,  v12,  v5);

    if (v13)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136446466;
        v16 = "-[RPRecordingManager connectionManagerDidAcceptNewConnection:bundleIdentifier:]";
        __int16 v17 = 1024;
        int v18 = 318;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d client created and adding to client manager",  (uint8_t *)&v15,  0x12u);
      }

      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
      [v14 addClient:v13];
    }

    else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100042FD0();
    }
  }
}

- (void)applicationDisconnectedWithBundleID:(id)a3 withProcessIdentifier:(int)a4
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordingManager: applicationDisconnected",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getClientWithBundleID:v4]);

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100011BF8;
    v7[3] = &unk_100071168;
    id v8 = v6;
    [v8 stopCurrentActiveSessionWithHandler:v7];
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]";
    __int16 v11 = 1024;
    int v12 = 353;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d client disconnected, RPClient representation not found or removed",  buf,  0x12u);
  }
}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100011DF8;
  v18[3] = &unk_1000711B8;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011FA8;
  v7[3] = &unk_1000711E0;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppRecordingSessionWithHandler:v7];
}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v15 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]";
    __int16 v16 = 1024;
    int v17 = 519;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_100012118;
  v11[3] = &unk_100071230;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 stopInAppRecordingSessionWithHandler:v11];
}

- (void)pauseInAppRecording
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v2 pauseInAppRecording];
}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000123EC;
  v10[3] = &unk_100071190;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppRecordingWithContextID:v7 completionHandler:v10];
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v5 discardInAppRecordingWithHandler:v4];
}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100012538;
  v18[3] = &unk_1000711B8;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000126E8;
  v7[3] = &unk_100070D98;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppCaptureSessionWithHandler:v7];
}

- (void)pauseInAppCapture
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v2 pauseInAppCapture];
}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000127D4;
  v10[3] = &unk_100071190;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppCaptureWithContextID:v7 completionHandler:v10];
}

- (void)createNewBroadcastClientWithBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 isSystemBroadcast:(BOOL)a7 handler:(id)a8
{
  BOOL v9 = a7;
  id v14 = (RPClient *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  int v18 = (void (**)(id, void *))a8;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    __int16 v25 = 1024;
    int v26 = 634;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@",  buf,  0x1Cu);
  }

  id v19 = -[RPClient initWithConnection:clientProxy:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___RPClient),  "initWithConnection:clientProxy:bundleIdentifier:",  0LL,  0LL,  v14);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    __int16 v25 = 1024;
    int v26 = 638;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d client created: %@",  buf,  0x1Cu);
  }

  if (v19)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:isSystemBroadcast:handler:]";
      __int16 v25 = 1024;
      int v26 = 640;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d client created and adding to client manager",  buf,  0x12u);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
    [v20 addClient:v19];

    -[RPRecordingManager updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:]( self,  "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:",  v19,  v14,  v15,  v16,  v17,  v9,  v18);
  }

  else
  {
    CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5808LL,  0LL));
    if (v9) {
      CGFloat v22 = @"SystemBroadcast";
    }
    else {
      CGFloat v22 = @"InAppBroadcast";
    }
    +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:]( &OBJC_CLASS___RPReportingAgent,  "reportSessionEnded:endReason:withServiceName:clientBundleId:",  2LL,  v21,  v22,  v14);
    if (v18) {
      v18[2](v18, v21);
    }
  }
}

- (void)updateClient:(id)a3 withHostBundleID:(id)a4 broadcastExtensionBundleID:(id)a5 broadcastConfigurationData:(id)a6 userInfo:(id)a7 isSystemBroadcast:(BOOL)a8 handler:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = (void (**)(void, void))v19;
  if (v9)
  {
    CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5808LL,  0LL));
    +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:]( &OBJC_CLASS___RPReportingAgent,  "reportSessionEnded:endReason:withServiceName:clientBundleId:",  2LL,  v21,  @"SystemBroadcast",  v15);
    if (v20) {
      ((void (**)(void, void *))v20)[2](v20, v21);
    }
  }

  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100012C84;
    v22[3] = &unk_100070D98;
    id v23 = v19;
    [v14 setupInAppBroadcastExtensionBundleID:v16 broadcastConfigurationData:v17 userInfo:v18 handler:v22];
    CGFloat v21 = v23;
  }
}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v21 = 1024;
    int v22 = 695;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Getting client and setting up broadcast",  buf,  0x12u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 getClientForBroadcastWithHostBundleID:v12]);

  if (v18)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 704;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Calling set up in app broadcast on client: %@",  buf,  0x1Cu);
    }

    -[RPRecordingManager updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:]( self,  "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:",  v18,  v12,  v13,  v14,  v15,  0LL,  v16);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 700;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@",  buf,  0x1Cu);
    }

    -[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:]( self,  "createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:",  v12,  v13,  v14,  v15,  0LL,  v16);
  }
}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000130A8;
  v22[3] = &unk_100071258;
  void v22[4] = self;
  id v23 = v15;
  CGFloat v26 = width;
  CGFloat v27 = height;
  BOOL v28 = a5;
  BOOL v29 = a6;
  id v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  [v18 stopAllClientsWithHandler:v22];
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013378;
  v7[3] = &unk_100070D98;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppBroadcastSessionWithHandler:v7];
}

- (void)pauseInAppBroadcast
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v2 pauseInAppBroadcast];
}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100013564;
  v10[3] = &unk_100071190;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppBroadcastWithContextID:v7 completionHandler:v10];
}

- (void)setBroadcastURL:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v5 updateBroadcastURL:v4];
}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CGFloat v26 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 788;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013754;
  v18[3] = &unk_1000711B8;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013988;
  v7[3] = &unk_100070D98;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemRecordingSessionWithHandler:v7];
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013A2C;
  v7[3] = &unk_1000711E0;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemRecordingSessionWithURLHandler:v7];
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CGFloat v26 = "-[RPRecordingManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    __int16 v27 = 1024;
    int v28 = 934;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013BD0;
  v18[3] = &unk_1000711B8;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPRecordingManager stopClipBufferingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 961;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013E24;
  v7[3] = &unk_100070D98;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppClipSessionWithHandler:v7];
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[RPRecordingManager exportClipToURL:duration:completionHandler:]";
    __int16 v16 = 1024;
    int v17 = 975;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_100013F98;
  v12[3] = &unk_100070D98;
  id v13 = v9;
  id v11 = v9;
  [v10 exportClipToURL:v8 duration:v12 completionHandler:a4];
}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100014058;
  v10[3] = &unk_100071190;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppClipWithContextID:v7 completionHandler:v10];
}

- (id)getCallingConnectionBundleID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentConnection]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RPConnectionManager uniqueClientIdentifierWithPID:]( RPConnectionManager,  "uniqueClientIdentifierWithPID:",  [v3 processIdentifier]));
  return v4;
}

- (id)getCallingConnectionClient
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionBundleID](self, "getCallingConnectionBundleID"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getClientWithBundleID:v2]);

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = dword_100084688 > 2;
  }
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004339C();
  }

  return v4;
}

- (void)macApplicationDidResignActive
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    BOOL v5 = "-[RPRecordingManager macApplicationDidResignActive]";
    __int16 v6 = 1024;
    int v7 = 1022;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v4,  0x12u);
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v3 pauseCurrentActiveSession];
}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPRecordingManager macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 1029;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v9,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v8 resumeCurrentActiveSessionWithContextID:v6 completionHandler:v7];
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  [v5 stopCurrentActiveSessionWithHandler:v4];
}

- (void)stopAllActiveClients
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  [v2 stopAllClientsWithHandler:&stru_100071298];
}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveVideoToCameraRoll:handler:]";
    __int16 v10 = 1024;
    int v11 = 1054;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v8,  0x12u);
  }

  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]( self,  "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:",  v6,  1LL,  0LL,  0LL,  v7);
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveClipToCameraRoll:handler:]";
    __int16 v10 = 1024;
    int v11 = 1059;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v8,  0x12u);
  }

  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]( self,  "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:",  v6,  1LL,  0LL,  1LL,  v7);
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveVideo:handler:]";
    __int16 v10 = 1024;
    int v11 = 1064;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v8,  0x12u);
  }

  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]( self,  "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:",  v6,  0LL,  1LL,  0LL,  v7);
}

- (void)saveToCameraRoll:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = (void (**)(id, void *))a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446466;
    id v18 = "-[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]";
    __int16 v19 = 1024;
    int v20 = 1069;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v17,  0x12u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  unsigned __int8 v15 = [v14 hasSystemRecordingEntitlements];

  if ((v15 & 1) == 0)
  {
    if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004348C();
      if (!v13) {
        goto LABEL_11;
      }
    }

    else if (!v13)
    {
      goto LABEL_11;
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5810LL,  0LL));
    v13[2](v13, v16);

    goto LABEL_11;
  }

  -[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]( self,  "processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:",  v12,  v10,  v9,  v8);
  if (v13) {
    v13[2](v13, 0LL);
  }
LABEL_11:
}

- (void)processSaveToPhotos:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6
{
  BOOL v6 = a4;
  id v7 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    BOOL v9 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]";
    __int16 v10 = 1024;
    int v11 = 1087;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Start Save to Photos",  (uint8_t *)&v8,  0x12u);
  }

  +[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:]( &OBJC_CLASS___RPPhotosUtility,  "exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:",  v7,  v6,  &stru_1000712D8);
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    BOOL v9 = "-[RPRecordingManager updateProcessIDForAudioCaptureWithPID:]";
    __int16 v10 = 1024;
    int v11 = 1126;
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d pid :%d",  (uint8_t *)&v8,  0x18u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  unsigned int v6 = [v5 hasSystemRecordingEntitlements];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
    [v7 updateProcessIDForAudioCaptureWithPID:v3];
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043580();
  }

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100014E10;
  v4[3] = &unk_100071300;
  id v5 = a3;
  id v3 = v5;
  +[NSExtension extensionsWithMatchingPointName:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingPointName:completion:",  @"com.apple.broadcast-services-upload",  v4);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (BOOL)isMicrophoneRecording
{
  return self->_microphoneRecording;
}

- (void)setMicrophoneRecording:(BOOL)a3
{
  self->_microphoneRecording = a3;
}

- (RPConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSMutableDictionary)currentAvailableExtensions
{
  return self->_currentAvailableExtensions;
}

- (void)setCurrentAvailableExtensions:(id)a3
{
}

- (NSMutableDictionary)streamUpdateFilterTimers
{
  return self->_streamUpdateFilterTimers;
}

- (void)setStreamUpdateFilterTimers:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end