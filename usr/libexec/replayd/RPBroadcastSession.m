@interface RPBroadcastSession
- (BOOL)isBroadcastSetup;
- (BOOL)showAlertForBroadcastSessionWithError:(id)a3;
- (BOOL)showResumeBroadcastAlert;
- (NSDictionary)extensionInfo;
- (NSString)broadcastHostBundleId;
- (RPBroadcastConfiguration)broadcastConfiguration;
- (RPBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6;
- (id)broadcastSessionAudioQueue;
- (id)broadcastSessionVideoQueue;
- (id)dispatchCaptureQueue;
- (id)enableBroadcastWithListenerEndpoint:(id)a3;
- (unsigned)orientationFromFigTransform:(unint64_t)a3;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)disableBroadcast;
- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4;
- (void)handleBroadcastError:(id)a3;
- (void)handleBroadcastServiceInfo:(id)a3;
- (void)handleBroadcastURL:(id)a3;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 withHandler:(id)a4;
- (void)notifyExtensionOfAction:(int64_t)a3 completion:(id)a4;
- (void)notifyExtensionOfAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4;
- (void)notifyExtensionOfVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4 sampleOrientation:(unsigned int)a5;
- (void)pauseSession;
- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4;
- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4;
- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)setBroadcastConfiguration:(id)a3;
- (void)setBroadcastHostBundleId:(id)a3;
- (void)setExtensionInfo:(id)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 handler:(id)a8;
- (void)startCaptureWithHandler:(id)a3;
- (void)stopBroadcastWithHandler:(id)a3;
- (void)updateBroadcastURL:(id)a3;
@end

@implementation RPBroadcastSession

- (RPBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPBroadcastSession;
  v6 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]( &v9,  "initWithClientProxy:sessionType:callingPID:bundleID:delegate:",  a3,  3LL,  *(void *)&a4,  a5,  a6);
  if (v6)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:]";
      __int16 v12 = 1024;
      int v13 = 66;
      __int16 v14 = 2048;
      v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    broadcastURL = v6->_broadcastURL;
    v6->_broadcastURL = 0LL;
  }

  return v6;
}

- (void)startBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 handler:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a5;
  id v16 = a7;
  v17 = (void (**)(id, void *))a8;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
    __int16 v22 = 1024;
    int v23 = 74;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 1024;
    unsigned int v27 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p starting in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") != 3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
      __int16 v22 = 1024;
      int v23 = 97;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d attempting to start broadcast session when session was not in stopped state",  buf,  0x12u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5830LL,  0LL));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v18);
    if (!v17) {
      goto LABEL_17;
    }
LABEL_15:
    v17[2](v17, v18);
    goto LABEL_17;
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RPBroadcastSession;
  -[RPSession startWithContextID:windowSize:](&v19, "startWithContextID:windowSize:", v15, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]( self,  "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:",  v13,  v12,  width,  height));
  if (!v18)
  {
    -[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]( self,  "processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:",  v13,  v12,  v16,  v17);
    goto LABEL_17;
  }

  -[RPSession setSessionState:](self, "setSessionState:", 3LL);
  if (v17) {
    goto LABEL_15;
  }
LABEL_17:
}

- (void)stopBroadcastWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    objc_super v9 = "-[RPBroadcastSession stopBroadcastWithHandler:]";
    __int16 v10 = 1024;
    int v11 = 109;
    __int16 v12 = 2048;
    BOOL v13 = self;
    __int16 v14 = 1024;
    unsigned int v15 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5829LL,  0LL));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4) {
      v4[2](v4, v5);
    }
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000317A0;
    v6[3] = &unk_100070DC0;
    v6[4] = self;
    v7 = v4;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 4LL, v6);
  }
}

- (void)disableBroadcast
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[RPBroadcastSession disableBroadcast]";
    __int16 v8 = 1024;
    int v9 = 142;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d disableBroadcast",  (uint8_t *)&v6,  0x12u);
  }

  -[RPSession setSessionState:](self, "setSessionState:", 3LL);
  broadcastExtension = self->_broadcastExtension;
  self->_broadcastExtension = 0LL;

  broadcastUserInfo = self->_broadcastUserInfo;
  self->_broadcastUserInfo = 0LL;

  broadcastConfiguration = self->_broadcastConfiguration;
  self->_broadcastConfiguration = 0LL;
}

- (BOOL)isBroadcastSetup
{
  return self->_broadcastExtension && self->_broadcastUserInfo != 0LL;
}

- (void)updateBroadcastURL:(id)a3
{
  v4 = (NSURL *)a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[RPBroadcastSession updateBroadcastURL:]";
    __int16 v8 = 1024;
    int v9 = 158;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v6,  0x12u);
  }

  broadcastURL = self->_broadcastURL;
  self->_broadcastURL = v4;
}

- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  int v11 = (void (**)(id, void *))a6;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446466;
    unsigned int v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    __int16 v16 = 1024;
    int v17 = 163;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v14,  0x12u);
  }

  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  v8,  v7))
  {
    if (-[RPBroadcastSession isBroadcastSetup](self, "isBroadcastSetup"))
    {
      -[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]( self,  "enableBroadcastStartCaptureWithListenerEndpoint:withHandler:",  v10,  v11);
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446466;
        unsigned int v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpo"
              "int:withHandler:]";
        __int16 v16 = 1024;
        int v17 = 177;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d attempted to start broadcast without a session, bailing out",  (uint8_t *)&v14,  0x12u);
      }

      -[RPSession setSessionState:](self, "setSessionState:", 3LL);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5808LL,  0LL));
      -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v13);
      if (v11) {
        v11[2](v11, v13);
      }
    }
  }

  else
  {
    -[RPBroadcastSession disableBroadcast](self, "disableBroadcast");
    if (v11)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5801LL,  0LL));
      v11[2](v11, v12);
    }
  }
}

- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
    __int16 v13 = 1024;
    int v14 = 203;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d found broadcast info, enabling for session",  buf,  0x12u);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[RPBroadcastSession enableBroadcastWithListenerEndpoint:]( self,  "enableBroadcastWithListenerEndpoint:",  v6));
  if (v8)
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    if (v7) {
      v7[2](v7, v8);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
      __int16 v13 = 1024;
      int v14 = 216;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d broadcast started without error",  buf,  0x12u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100031EA4;
    v9[3] = &unk_100070DC0;
    v9[4] = self;
    id v10 = v7;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 1LL, v9);
  }
}

- (void)startCaptureWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[RPBroadcastSession startCaptureWithHandler:]";
    __int16 v19 = 1024;
    int v20 = 233;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  double v9 = v8;
  double v11 = v10;
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100032084;
  v15[3] = &unk_100071208;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:",  self,  callingPID,  v7,  0,  v13,  v15,  v9,  v11);
}

- (void)pauseSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v7 = "-[RPBroadcastSession pauseSession]";
    __int16 v8 = 1024;
    int v9 = 255;
    __int16 v10 = 2048;
    double v11 = self;
    __int16 v12 = 1024;
    unsigned int v13 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p pausing in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v3 stopCaptureForDelegate:self];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100032334;
    v5[3] = &unk_100070D30;
    v5[4] = self;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 2LL, v5);
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RPBroadcastSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    unsigned int v13 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 270;
    __int16 v16 = 2048;
    int v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  v10[1] = 3221225472LL;
  v10[2] = sub_1000324D0;
  v10[3] = &unk_100070D98;
  id v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPBroadcastSession;
  v10[0] = _NSConcreteStackBlock;
  id v8 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]( &v9,  "resumeSessionWithWindowLayerContextID:completionHandler:",  v6,  v10);
  -[RPBroadcastSession notifyExtensionOfAction:completion:]( self,  "notifyExtensionOfAction:completion:",  3LL,  &stru_100071AE0);
}

- (id)enableBroadcastWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 281;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d enableBroadcastWithExtension",  buf,  0x12u);
  }

  objc_initWeak(&location, self);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 288;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d setting up extension proxy",  buf,  0x12u);
  }

  if (v4)
  {
    v5 = -[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]( objc_alloc(&OBJC_CLASS___RPBroadcastExtensionProxy),  "initWithBroadcastUploadListenerEndpoint:",  v4);
    broadcastUploadExtensionProxy = (dispatch_semaphore_s *)self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v5;
  }

  else
  {
    id v7 = -[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]( objc_alloc(&OBJC_CLASS___RPBroadcastExtensionProxy),  "initWithBroadcastUploadExtension:",  self->_broadcastExtension);
    id v8 = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    __int16 v10 = self->_broadcastUploadExtensionProxy;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100032900;
    v18[3] = &unk_1000713D0;
    broadcastUploadExtensionProxy = v9;
    unsigned int v19 = broadcastUploadExtensionProxy;
    int v20 = self;
    -[RPBroadcastExtensionProxy establishConnectionWithHandler:](v10, "establishConnectionWithHandler:", v18);
    dispatch_semaphore_wait(broadcastUploadExtensionProxy, 0xFFFFFFFFFFFFFFFFLL);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000329EC;
  v16[3] = &unk_100071358;
  objc_copyWeak(&v17, &location);
  -[RPBroadcastExtensionProxy setServiceInfoHandler:]( self->_broadcastUploadExtensionProxy,  "setServiceInfoHandler:",  v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100032A34;
  v14[3] = &unk_100071B08;
  objc_copyWeak(&v15, &location);
  -[RPBroadcastExtensionProxy setBroadcastURLHandler:]( self->_broadcastUploadExtensionProxy,  "setBroadcastURLHandler:",  v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100032A7C;
  v12[3] = &unk_100071098;
  objc_copyWeak(&v13, &location);
  -[RPBroadcastExtensionProxy setErrorHandler:](self->_broadcastUploadExtensionProxy, "setErrorHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return 0LL;
}

- (void)handleBroadcastServiceInfo:(id)a3
{
}

- (void)handleBroadcastURL:(id)a3
{
}

- (void)handleBroadcastError:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[RPBroadcastSession handleBroadcastError:]";
    __int16 v9 = 1024;
    int v10 = 335;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d error %@",  buf,  0x1Cu);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100032C38;
    v5[3] = &unk_1000713D0;
    v5[4] = self;
    id v6 = v4;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v5);
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
    unsigned int v27 = "-[RPBroadcastSession setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v28 = 1024;
    int v29 = 346;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle baseIdentifier:](&OBJC_CLASS___NSBundle, "baseIdentifier:", v13));
  -[RPBroadcastSession setBroadcastHostBundleId:](self, "setBroadcastHostBundleId:", v17);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100032E38;
  v21[3] = &unk_100071B30;
  id v22 = v14;
  int v23 = self;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  -[RPBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:]( self,  "loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:",  v17,  v21);
}

- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:]";
    __int16 v14 = 1024;
    int v15 = 378;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d looking for upload extension",  buf,  0x12u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000330DC;
  v9[3] = &unk_100071B58;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingPointName:baseIdentifier:completion:",  @"com.apple.broadcast-services-upload",  v7,  v9);
}

- (id)dispatchCaptureQueue
{
  if (qword_1000847F0 != -1) {
    dispatch_once(&qword_1000847F0, &stru_100071B78);
  }
  return (id)qword_1000847E8;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v7);
    if ((_DWORD)v7 == 2)
    {
      if (!-[RPSession microphoneEnabled](self, "microphoneEnabled"))
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a4);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0LL, DataLength);
      }

      __int16 v9 = self;
      id v10 = a4;
      uint64_t v11 = 3LL;
    }

    else
    {
      if ((_DWORD)v7 != 1)
      {
        if (!(_DWORD)v7) {
          -[RPBroadcastSession processSampleBuffer:transformFlags:](self, "processSampleBuffer:transformFlags:", a4, a5);
        }
        return;
      }

      __int16 v9 = self;
      id v10 = a4;
      uint64_t v11 = 2LL;
    }

    -[RPBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]( v9,  "notifyExtensionOfAudioSampleBuffer:withType:",  v10,  v11);
  }

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000333FC;
  v5[3] = &unk_1000713D0;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v5);
}

- (BOOL)showAlertForBroadcastSessionWithError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || (v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]), BOOL v6 = v5 == 0, v5, v6))
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      __int16 v9 = "-[RPBroadcastSession showAlertForBroadcastSessionWithError:]";
      __int16 v10 = 1024;
      int v11 = 456;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Not showing the alert, as there is no error or the error domain is nil",  (uint8_t *)&v8,  0x12u);
    }
  }

  return 1;
}

- (BOOL)showResumeBroadcastAlert
{
  return 1;
}

- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
    __int16 v9 = 1024;
    int v10 = 590;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d processing sample buffer for streaming",  (uint8_t *)&v7,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      int v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
      __int16 v9 = 1024;
      int v10 = 593;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session is paused discard sample",  (uint8_t *)&v7,  0x12u);
    }
  }

  else
  {
    -[RPBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]( self,  "notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:",  a3,  1LL,  -[RPBroadcastSession orientationFromFigTransform:](self, "orientationFromFigTransform:", a4));
  }

- (void)notifyExtensionOfAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  if (self->_broadcastExtension)
  {
    if (self->_broadcastUploadExtensionProxy)
    {
      if (!-[RPSession dispatchLimitReached:](self, "dispatchLimitReached:", a4))
      {
        if (a3) {
          CFRetain(a3);
        }
        id v7 = sub_10003C708(a3, a4);
        int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        __int16 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPBroadcastSession broadcastSessionAudioQueue](self, "broadcastSessionAudioQueue"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_100033860;
        v11[3] = &unk_100071BC8;
        v11[4] = self;
        id v12 = v8;
        int64_t v13 = a4;
        __int16 v14 = a3;
        id v10 = v8;
        dispatch_async(v9, v11);
      }
    }

    else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100046234();
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000461B4();
  }

- (void)notifyExtensionOfVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4 sampleOrientation:(unsigned int)a5
{
  if (!self->_broadcastExtension)
  {
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 640;
    id v18 = " [INFO] %{public}s:%d no broadcast extension found!";
LABEL_13:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v18,  (uint8_t *)&timingInfoOut,  0x12u);
    return;
  }

  if (!self->_broadcastUploadExtensionProxy)
  {
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 645;
    id v18 = " [INFO] %{public}s:%d broadcast extension not ready";
    goto LABEL_13;
  }

  uint64_t v6 = *(void *)&a5;
  if (!-[RPSession dispatchLimitReached:](self, "dispatchLimitReached:", a4))
  {
    if (a3) {
      CFRetain(a3);
    }
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    [v9 setObject:v10 forKeyedSubscript:@"RPSampleBufferVideoOrientation"];

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    [v9 setObject:v11 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];

    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    __int16 v14 = objc_alloc_init(&OBJC_CLASS___RPIOSurfaceObject);
    -[RPIOSurfaceObject setIOSurface:](v14, "setIOSurface:", IOSurface);
    [v9 setObject:v14 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyIOSurface"];
    CMSampleBufferGetSampleTimingInfo(a3, 0LL, &timingInfoOut);
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &timingInfoOut, 72LL));
    [v9 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPBroadcastSession broadcastSessionVideoQueue](self, "broadcastSessionVideoQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100033CC0;
    v19[3] = &unk_100071BC8;
    v19[4] = self;
    id v20 = v9;
    v21 = a3;
    int64_t v22 = a4;
    id v17 = v9;
    dispatch_async(v16, v19);

    CFRelease(ImageBuffer);
  }

- (void)notifyExtensionOfAction:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if (!self->_broadcastExtension)
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 691;
    int64_t v13 = " [INFO] %{public}s:%d no broadcast extension found!";
    goto LABEL_15;
  }

  if (!self->_broadcastUploadExtensionProxy)
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 697;
    int64_t v13 = " [INFO] %{public}s:%d broadcast extension not ready";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
LABEL_16:
    v6[2](v6);
    goto LABEL_19;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v7 setObject:v8 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyActionType"];

  [v7 setObject:self->_broadcastUserInfo forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionUserInfo"];
  if (a3 == 4)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100034118;
    v15[3] = &unk_100070D30;
    int v11 = v9;
    id v16 = v11;
    -[RPBroadcastExtensionProxy processPayload:completion:]( broadcastUploadExtensionProxy,  "processPayload:completion:",  v7,  v15);
    dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v11, v12)
      && dword_100084688 <= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000462B4();
    }

    v6[2](v6);
  }

  else
  {
    __int16 v14 = self->_broadcastUploadExtensionProxy;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003410C;
    v17[3] = &unk_1000717A8;
    id v18 = v6;
    -[RPBroadcastExtensionProxy processPayload:completion:](v14, "processPayload:completion:", v7, v17);
    int v11 = v18;
  }

LABEL_19:
}

- (id)broadcastSessionAudioQueue
{
  if (qword_100084800 != -1) {
    dispatch_once(&qword_100084800, &stru_100071BE8);
  }
  return (id)qword_1000847F8;
}

- (id)broadcastSessionVideoQueue
{
  if (qword_100084810 != -1) {
    dispatch_once(&qword_100084810, &stru_100071C08);
  }
  return (id)qword_100084808;
}

- (unsigned)orientationFromFigTransform:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 1;
  }
  else {
    return dword_100051E48[a3 - 1];
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v18 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 804;
    __int16 v21 = 2048;
    int v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  self->super._sessionIsResuming = 1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  double v9 = v8;
  double v11 = v10;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100034470;
  v15[3] = &unk_100071208;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:",  self,  callingPID,  v7,  0,  v13,  v15,  v9,  v11);
}

- (void)handleClientApplicationDidEnterBackground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPBroadcastSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 824;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  -[RPBroadcastSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
    __int16 v6 = 1024;
    int v7 = 831;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (-[RPBroadcastSession showResumeBroadcastAlert](self, "showResumeBroadcastAlert"))
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        __int16 v6 = 1024;
        int v7 = 835;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume",  buf,  0x12u);
      }

      -[RPClientProtocol shouldResumeSessionType:]( self->super._clientProxy,  "shouldResumeSessionType:",  @"RPInAppBroadcast");
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        __int16 v6 = 1024;
        int v7 = 838;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop",  buf,  0x12u);
      }

      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_100034880;
      v3[3] = &unk_100071418;
      v3[4] = self;
      -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
    }
  }

- (void)handleDisplayWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 850;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100034A84;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }

- (void)handleDeviceLockedWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPBroadcastSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 861;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

- (void)handleDeviceRestrictionWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 879;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100034D60;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }

- (void)handleResumeContextIDFailure
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 891;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100034F64;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }

- (NSDictionary)extensionInfo
{
  return self->_extensionInfo;
}

- (void)setExtensionInfo:(id)a3
{
}

- (RPBroadcastConfiguration)broadcastConfiguration
{
  return self->_broadcastConfiguration;
}

- (void)setBroadcastConfiguration:(id)a3
{
}

- (NSString)broadcastHostBundleId
{
  return self->_broadcastHostBundleId;
}

- (void)setBroadcastHostBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end