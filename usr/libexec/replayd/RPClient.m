@interface RPClient
+ (id)controlCenterManagerClient;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken;
- (NSString)clientBundleID;
- (NSString)clientMainBundleID;
- (RPClient)initWithConnection:(id)a3 clientProxy:(id)a4 bundleIdentifier:(id)a5;
- (RPClientProxy)clientProxy;
- (int)clientPID;
- (void)dealloc;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)handleMemoryWarningForCurrentActiveSession;
- (void)invalidate;
- (void)notifyClientWithOutputURL:(id)a3 error:(id)a4 withHandler:(id)a5;
- (void)pauseCurrentActiveSession;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppClip;
- (void)pauseInAppRecording;
- (void)reportCameraUsage:(int64_t)a3;
- (void)resumeCurrentActiveSessionWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppBroadcastWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithContextID:(id)a3 completionHandler:(id)a4;
- (void)sessionDidStop;
- (void)setClientBundleID:(id)a3;
- (void)setClientConnectionAuditToken:(id *)a3;
- (void)setClientMainBundleID:(id)a3;
- (void)setClientPID:(int)a3;
- (void)setClientProxy:(id)a3;
- (void)setupInAppBroadcastExtensionBundleID:(id)a3 broadcastConfigurationData:(id)a4 userInfo:(id)a5 handler:(id)a6;
- (void)startInAppBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppClipSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastSessionWithHandler:(id)a3;
- (void)stopInAppCaptureSessionWithHandler:(id)a3;
- (void)stopInAppClipSessionWithHandler:(id)a3;
- (void)stopInAppRecordingSessionWithHandler:(id)a3;
- (void)stopSystemRecordingSessionWithHandler:(id)a3;
- (void)stopSystemRecordingSessionWithURLHandler:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
@end

@implementation RPClient

- (RPClient)initWithConnection:(id)a3 clientProxy:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RPClient;
  v11 = -[RPClient init](&v24, "init");
  if (v11)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "-[RPClient initWithConnection:clientProxy:bundleIdentifier:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 119;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    [v11 setClientProxy:v9];
    [v11 setClientBundleID:v10];
    objc_msgSend(v11, "setClientPID:", objc_msgSend(v8, "processIdentifier"));
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCProcessUtility hostApplicationWithAuditToken:bundleID:]( &OBJC_CLASS___SCProcessUtility,  "hostApplicationWithAuditToken:bundleID:",  v23,  v10));
    [v11 setClientMainBundleID:v12];

    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = 0LL;

    v14 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = 0LL;

    v15 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = 0LL;

    v16 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = 0LL;

    v17 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = 0LL;

    v18 = (void *)*((void *)v11 + 6);
    *((void *)v11 + 6) = 0LL;

    *((_DWORD *)v11 + 14) = 0;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    __int128 v19 = *(_OWORD *)&buf[16];
    *(_OWORD *)(v11 + 104) = *(_OWORD *)buf;
    *(_OWORD *)(v11 + 120) = v19;
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.replaykit.AlertDispatchQueue", 0LL);
    v21 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v20;
  }

  return (RPClient *)v11;
}

- (void)invalidate
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    v4 = "-[RPClient invalidate]";
    __int16 v5 = 1024;
    int v6 = 158;
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  (uint8_t *)&v3,  0x1Cu);
  }

  -[RPSession invalidate](self->_recordSession, "invalidate");
  -[RPSession invalidate](self->_captureSession, "invalidate");
  -[RPSession invalidate](self->_broadcastSession, "invalidate");
  -[RPSession invalidate](self->_clipSession, "invalidate");
  -[RPSession invalidate](self->_systemRecordSession, "invalidate");
  -[RPSystemBroadcastSession invalidate](self->_systemBroadcastSession, "invalidate");
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClient dealloc]";
    __int16 v6 = 1024;
    int v7 = 178;
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPClient;
  -[RPClient dealloc](&v3, "dealloc");
}

- (void)setClientPID:(int)a3
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPClient setClientPID:]";
    __int16 v7 = 1024;
    int v8 = 182;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v5,  0x12u);
  }

  self->_clientPID = a3;
}

- (void)pauseCurrentActiveSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int currentActiveSession = self->_currentActiveSession;
    int v6 = 136446722;
    __int16 v7 = "-[RPClient pauseCurrentActiveSession]";
    __int16 v8 = 1024;
    int v9 = 206;
    __int16 v10 = 1024;
    int v11 = currentActiveSession;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d pausing session type %d",  (uint8_t *)&v6,  0x18u);
  }

  uint64_t v4 = 1LL;
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136446466;
        __int16 v7 = "-[RPClient pauseCurrentActiveSession]";
        __int16 v8 = 1024;
        int v9 = 237;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d We don't have a current active session to pause, returning",  (uint8_t *)&v6,  0x12u);
      }

      return;
    case 1:
      uint64_t v4 = 2LL;
      goto LABEL_14;
    case 2:
      goto LABEL_14;
    case 3:
      uint64_t v4 = 3LL;
      goto LABEL_14;
    case 4:
      uint64_t v4 = 4LL;
LABEL_14:
      -[objc_class pauseSession]((&self->super.isa)[v4], "pauseSession");
      int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
      [v5 recordingDidPause];

      break;
    default:
      break;
  }

- (void)reportCameraUsage:(int64_t)a3
{
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136446466;
        int v5 = "-[RPClient reportCameraUsage:]";
        __int16 v6 = 1024;
        int v7 = 268;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d We don't have a current active session to report camera usage, returning",  (uint8_t *)&v4,  0x12u);
      }

      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_12;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_12;
    case 3:
      captureSession = self->_broadcastSession;
      goto LABEL_12;
    case 4:
      captureSession = self->_clipSession;
      goto LABEL_12;
    case 5:
      captureSession = self->_systemRecordSession;
      goto LABEL_12;
    case 6:
      captureSession = self->_systemBroadcastSession;
LABEL_12:
      [captureSession sessionReportCameraUsage:a3];
      break;
    default:
      return;
  }

- (void)resumeCurrentActiveSessionWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int currentActiveSession = self->_currentActiveSession;
    int v10 = 136446722;
    int v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
    __int16 v12 = 1024;
    int v13 = 306;
    __int16 v14 = 1024;
    int v15 = currentActiveSession;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resuming session type %d",  (uint8_t *)&v10,  0x18u);
  }

  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136446466;
        int v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
        __int16 v12 = 1024;
        int v13 = 326;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d We don't have a current active session to resume, returning",  (uint8_t *)&v10,  0x12u);
      }

      if (v7)
      {
        int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5832LL,  0LL));
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0LL, 0LL);
      }

      break;
    case 1:
      -[RPClient resumeInAppCaptureWithContextID:completionHandler:]( self,  "resumeInAppCaptureWithContextID:completionHandler:",  v6,  v7);
      break;
    case 2:
      -[RPClient resumeInAppRecordingWithContextID:completionHandler:]( self,  "resumeInAppRecordingWithContextID:completionHandler:",  v6,  v7);
      break;
    case 3:
      -[RPClient resumeInAppBroadcastWithContextID:completionHandler:]( self,  "resumeInAppBroadcastWithContextID:completionHandler:",  v6,  v7);
      break;
    case 4:
      -[RPClient resumeInAppClipWithContextID:completionHandler:]( self,  "resumeInAppClipWithContextID:completionHandler:",  v6,  v7);
      break;
    default:
      break;
  }
}

- (void)notifyClientWithOutputURL:(id)a3 error:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, BOOL))a5;
  if (v9)
  {
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      __int16 v14 = "-[RPClient notifyClientWithOutputURL:error:withHandler:]";
      __int16 v15 = 1024;
      int v16 = 343;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop session success, notifying client of session stoppped",  (uint8_t *)&v13,  0x12u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5806LL,  0LL));
    [v11 recordingDidStopWithError:v12 movieURL:v8];

    self->_int currentActiveSession = 0;
  }

  if (v10) {
    v10[2](v10, v9 == 0LL);
  }
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v15 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
    __int16 v16 = 1024;
    int v17 = 357;
    __int16 v18 = 2048;
    __int128 v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v15 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
        __int16 v16 = 1024;
        int v17 = 410;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d We don't have a current active session to stop",  buf,  0x12u);
      }

      if (v4) {
        v4[2](v4, 1LL);
      }
      break;
    case 1:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100028F58;
      v10[3] = &unk_100071208;
      v10[4] = self;
      int v11 = v4;
      -[RPClient stopInAppCaptureSessionWithHandler:](self, "stopInAppCaptureSessionWithHandler:", v10);
      int v5 = v11;
      goto LABEL_17;
    case 2:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100028F44;
      v12[3] = &unk_100071230;
      v12[4] = self;
      int v13 = v4;
      -[RPClient stopInAppRecordingSessionWithHandler:](self, "stopInAppRecordingSessionWithHandler:", v12);
      int v5 = v13;
      goto LABEL_17;
    case 3:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100028F6C;
      v8[3] = &unk_100071208;
      v8[4] = self;
      id v9 = v4;
      -[RPClient stopInAppBroadcastSessionWithHandler:](self, "stopInAppBroadcastSessionWithHandler:", v8);
      int v5 = v9;
      goto LABEL_17;
    case 4:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100028F80;
      v6[3] = &unk_100071208;
      v6[4] = self;
      id v7 = v4;
      -[RPClient stopInAppClipSessionWithHandler:](self, "stopInAppClipSessionWithHandler:", v6);
      int v5 = v7;
LABEL_17:

      break;
    default:
      break;
  }
}

- (void)startInAppRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 442;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Starting in-app recording",  buf,  0x12u);
  }

  recordSession = self->_recordSession;
  if (recordSession)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( recordSession,  "updateClientProxy:callingPID:bundleID:",  v16,  clientPID,  v18);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 445;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d we dont have a record session, creating a new one",  buf,  0x12u);
    }

    __int128 v19 = objc_alloc(&OBJC_CLASS___RPRecordSession);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t v20 = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]( v19,  "initWithClientProxy:sessionType:callingPID:bundleID:delegate:",  v16,  2LL,  v20,  v18,  self);
    v22 = self->_recordSession;
    self->_recordSession = v21;
  }

  v23 = self->_recordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002922C;
  v25[3] = &unk_100071208;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]( v23,  "startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:",  v9,  v8,  v13,  v25,  width,  height);
}

- (void)stopInAppRecordingSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient stopInAppRecordingSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 473;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping in-app recording",  buf,  0x12u);
  }

  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002944C;
  v7[3] = &unk_100071230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPRecordSession stopRecordingWithHandler:](recordSession, "stopRecordingWithHandler:", v7);
}

- (void)pauseInAppRecording
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppRecording]";
    __int16 v5 = 1024;
    int v6 = 489;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Pausing in-app recording",  (uint8_t *)&v3,  0x12u);
  }

  -[RPRecordSession pauseSession](self->_recordSession, "pauseSession");
}

- (void)resumeInAppRecordingWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 494;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Resuming in-app recording",  buf,  0x12u);
  }

  recordSession = self->_recordSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000296FC;
  v10[3] = &unk_100071208;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]( recordSession,  "resumeSessionWithWindowLayerContextID:completionHandler:",  v6,  v10);
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient discardInAppRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 512;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Disarding in-app recording",  buf,  0x12u);
  }

  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000299D4;
  v7[3] = &unk_1000717A8;
  id v8 = v4;
  id v6 = v4;
  -[RPRecordSession discardInAppRecordingWithHandler:](recordSession, "discardInAppRecordingWithHandler:", v7);
}

- (void)startInAppCaptureSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 523;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Starting in-app capture",  buf,  0x12u);
  }

  captureSession = self->_captureSession;
  if (captureSession)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( captureSession,  "updateClientProxy:callingPID:bundleID:",  v16,  clientPID,  v18);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 526;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d we dont have a capture session, creating a new one",  buf,  0x12u);
    }

    __int128 v19 = objc_alloc(&OBJC_CLASS___RPCaptureSession);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t v20 = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]( v19,  "initWithClientProxy:sessionType:callingPID:bundleID:delegate:",  v16,  1LL,  v20,  v18,  self);
    v22 = self->_captureSession;
    self->_captureSession = v21;
  }

  v23 = self->_captureSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100029D44;
  v25[3] = &unk_100071208;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]( v23,  "startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:",  v9,  v8,  v13,  v25,  width,  height);
}

- (void)stopInAppCaptureSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient stopInAppCaptureSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 555;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping in-app capture",  buf,  0x12u);
  }

  captureSession = self->_captureSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100029F64;
  v7[3] = &unk_100071208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPCaptureSession stopCaptureWithHandler:](captureSession, "stopCaptureWithHandler:", v7);
}

- (void)pauseInAppCapture
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppCapture]";
    __int16 v5 = 1024;
    int v6 = 571;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Pausing in-app capture",  (uint8_t *)&v3,  0x12u);
  }

  -[RPCaptureSession pauseSession](self->_captureSession, "pauseSession");
}

- (void)resumeInAppCaptureWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 576;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Resuming in-app capture",  buf,  0x12u);
  }

  captureSession = self->_captureSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002A1F8;
  v10[3] = &unk_100071208;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]( captureSession,  "resumeSessionWithWindowLayerContextID:completionHandler:",  v6,  v10);
}

- (void)setupInAppBroadcastExtensionBundleID:(id)a3 broadcastConfigurationData:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446466;
    v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v26 = 1024;
    int v27 = 595;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v24,  0x12u);
  }

  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( broadcastSession,  "updateClientProxy:callingPID:bundleID:",  v15,  clientPID,  v17);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136446466;
      v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
      __int16 v26 = 1024;
      int v27 = 598;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d we dont have a broadcast session, creating a new one",  (uint8_t *)&v24,  0x12u);
    }

    __int16 v18 = objc_alloc(&OBJC_CLASS___RPBroadcastSession);
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t v19 = self->_clientPID;
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    uint64_t v20 = -[RPBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:]( v18,  "initWithClientProxy:callingPID:bundleID:delegate:",  v15,  v19,  v17,  self);
    v21 = self->_broadcastSession;
    self->_broadcastSession = v20;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446466;
    v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v26 = 1024;
    int v27 = 605;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d setting up broadcast session",  (uint8_t *)&v24,  0x12u);
  }

  v22 = self->_broadcastSession;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
  -[RPBroadcastSession setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]( v22,  "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:",  v23,  v10,  v11,  v12,  v13);
}

- (void)startInAppBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v26 = "-[RPClient startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 610;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Starting in-app broadcast",  buf,  0x12u);
  }

  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( broadcastSession,  "updateClientProxy:callingPID:bundleID:",  v19,  clientPID,  v21);

    v22 = self->_broadcastSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    objc_super v23[2] = sub_10002A890;
    v23[3] = &unk_100071208;
    v23[4] = self;
    id v24 = v17;
    -[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]( v22,  "startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:",  v11,  v10,  v15,  v16,  v23,  width,  height);
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000451E0();
  }
}

- (void)stopInAppBroadcastSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopInAppBroadcastSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 638;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping in-app broadcast",  buf,  0x12u);
  }

  broadcastSession = self->_broadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002AAB0;
  v7[3] = &unk_100071208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPBroadcastSession stopBroadcastWithHandler:](broadcastSession, "stopBroadcastWithHandler:", v7);
}

- (void)pauseInAppBroadcast
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppBroadcast]";
    __int16 v5 = 1024;
    int v6 = 654;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Pausing in-app broadcast",  (uint8_t *)&v3,  0x12u);
  }

  -[RPBroadcastSession pauseSession](self->_broadcastSession, "pauseSession");
}

- (void)updateBroadcastURL:(id)a3
{
  id v4 = a3;
  broadcastSession = self->_broadcastSession;
  if (broadcastSession || (broadcastSession = self->_systemBroadcastSession) != 0LL)
  {
    id v6 = v4;
    [broadcastSession updateBroadcastURL:v4];
    id v4 = v6;
  }
}

- (void)resumeInAppBroadcastWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 669;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Resuming in-app broadcast",  buf,  0x12u);
  }

  broadcastSession = self->_broadcastSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002AD90;
  v10[3] = &unk_100071208;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  -[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]( broadcastSession,  "resumeSessionWithWindowLayerContextID:completionHandler:",  v6,  v10);
}

- (void)startInAppClipSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 688;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Starting in-app clip buffering",  buf,  0x12u);
  }

  clipSession = self->_clipSession;
  if (clipSession)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( clipSession,  "updateClientProxy:callingPID:bundleID:",  v16,  clientPID,  v18);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 691;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d we dont have a clip session, creating a new one",  buf,  0x12u);
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___RPClipSession);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t v20 = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]( v19,  "initWithClientProxy:sessionType:callingPID:bundleID:delegate:",  v16,  4LL,  v20,  v18,  self);
    v22 = self->_clipSession;
    self->_clipSession = v21;
  }

  v23 = self->_clipSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002B1DC;
  v25[3] = &unk_100071208;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]( v23,  "startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:",  v9,  v8,  v13,  v25,  width,  height);
}

- (void)stopInAppClipSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopInAppClipSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 719;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping in-app clip buffering",  buf,  0x12u);
  }

  clipSession = self->_clipSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002B3FC;
  v7[3] = &unk_100071208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPClipSession stopClipWithHandler:](clipSession, "stopClipWithHandler:", v7);
}

- (void)pauseInAppClip
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppClip]";
    __int16 v5 = 1024;
    int v6 = 735;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Pausing in-app clip buffering",  (uint8_t *)&v3,  0x12u);
  }

  -[RPClipSession pauseSession](self->_clipSession, "pauseSession");
}

- (void)resumeInAppClipWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 740;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Resuming in-app clip buffering",  buf,  0x12u);
  }

  clipSession = self->_clipSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002B690;
  v10[3] = &unk_100071208;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]( clipSession,  "resumeSessionWithWindowLayerContextID:completionHandler:",  v6,  v10);
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v15 = "-[RPClient exportClipToURL:duration:completionHandler:]";
    __int16 v16 = 1024;
    int v17 = 758;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  clipSession = self->_clipSession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002B994;
  v12[3] = &unk_100070D98;
  id v13 = v9;
  id v11 = v9;
  -[RPClipSession exportClipToURL:duration:completionHandler:]( clipSession,  "exportClipToURL:duration:completionHandler:",  v8,  v12,  a4);
}

- (void)sessionDidStop
{
  self->_int currentActiveSession = 0;
}

- (void)startSystemRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 783;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Starting system recording",  buf,  0x12u);
  }

  systemRecordSession = self->_systemRecordSession;
  if (systemRecordSession)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t clientPID = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:]( systemRecordSession,  "updateClientProxy:callingPID:bundleID:",  v16,  clientPID,  v18);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 786;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d we dont have a system record session, creating a new one",  buf,  0x12u);
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___RPSystemRecordSession);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    uint64_t v20 = self->_clientPID;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]( v19,  "initWithClientProxy:sessionType:callingPID:bundleID:delegate:",  v16,  5LL,  v20,  v18,  self);
    v22 = self->_systemRecordSession;
    self->_systemRecordSession = v21;
  }

  v23 = self->_systemRecordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002BDA8;
  v25[3] = &unk_100071208;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]( v23,  "startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:",  v9,  v8,  v13,  v25,  width,  height);
}

- (void)stopSystemRecordingSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopSystemRecordingSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 815;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping System Recording",  buf,  0x12u);
  }

  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002BFA0;
  v7[3] = &unk_100071208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPSystemRecordSession stopSystemRecordingWithHandler:](systemRecordSession, "stopSystemRecordingWithHandler:", v7);
}

- (void)stopSystemRecordingSessionWithURLHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopSystemRecordingSessionWithURLHandler:]";
    __int16 v11 = 1024;
    int v12 = 831;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Stopping System Recording with URL handler",  buf,  0x12u);
  }

  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002C150;
  v7[3] = &unk_100071230;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RPSystemRecordSession stopSystemRecordingWithURLHandler:]( systemRecordSession,  "stopSystemRecordingWithURLHandler:",  v7);
}

- (void)handleMemoryWarningForCurrentActiveSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
    __int16 v6 = 1024;
    int v7 = 943;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v4,  0x12u);
  }

  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136446466;
        __int16 v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
        __int16 v6 = 1024;
        int v7 = 968;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d We don't have a current active session.",  (uint8_t *)&v4,  0x12u);
      }

      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_11;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_11;
    case 3:
      captureSession = self->_broadcastSession;
LABEL_11:
      [captureSession handleMemoryWarning];
      break;
    default:
      return;
  }

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPClient updateProcessIDForAudioCaptureWithPID:]";
    __int16 v8 = 1024;
    int v9 = 973;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d pid: %d",  (uint8_t *)&v6,  0x18u);
  }

  switch(self->_currentActiveSession)
  {
    case 0:
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_11;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_11;
    case 3:
      captureSession = self->_broadcastSession;
LABEL_11:
      [captureSession updateProcessIDForAudioCaptureWithPID:v3];
      break;
    default:
      break;
  }

+ (id)controlCenterManagerClient
{
  return 0LL;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientMainBundleID
{
  return self->_clientMainBundleID;
}

- (void)setClientMainBundleID:(id)a3
{
}

- (RPClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (int)clientPID
{
  return self->_clientPID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  __int128 v3 = *(_OWORD *)&self[3].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[3].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = v3;
}

- (void).cxx_destruct
{
}

@end