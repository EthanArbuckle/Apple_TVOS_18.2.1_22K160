@interface RPRecordSession
- (id)dispatchCaptureQueue;
- (id)outputPath;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)startRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopRecordingWithHandler:(id)a3;
@end

@implementation RPRecordSession

- (id)outputPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 outputPath:0 bundleID:v4]);

  return v5;
}

- (void)startRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  BOOL v10 = a4;
  BOOL v11 = a3;
  id v13 = a5;
  v14 = (void (**)(id, void *))a7;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 45;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p starting in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") != 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: attempting to start record session when session was not in stopped state",  buf,  2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5830LL,  0LL));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v15);
    if (!v14) {
      goto LABEL_16;
    }
LABEL_14:
    v14[2](v14, v15);
    goto LABEL_16;
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___RPRecordSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]( self,  "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:",  v11,  v10,  width,  height));
  if (!v15)
  {
    -[RPRecordSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:]( self,  "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:",  v11,  v10,  v14);
    goto LABEL_16;
  }

  -[RPSession setSessionState:](self, "setSessionState:", 3LL);
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)stopRecordingWithHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v11 = "-[RPRecordSession stopRecordingWithHandler:]";
    __int16 v12 = 1024;
    int v13 = 85;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5829LL,  0LL));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4) {
      v4[2](v4, 0LL, v5);
    }
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v6 stopCaptureForDelegate:self];

    movieWriter = self->_movieWriter;
    if (movieWriter)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10004061C;
      v8[3] = &unk_100071230;
      v8[4] = self;
      v9 = v4;
      -[RPMovieWriter finishWritingWithHandler:](movieWriter, "finishWritingWithHandler:", v8);
    }

    else
    {
      -[RPSession setSessionState:](self, "setSessionState:", 3LL);
      -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824LL, 0LL);
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v11 = "-[RPRecordSession stopRecordingWithHandler:]";
        __int16 v12 = 1024;
        int v13 = 122;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d no movie writer instance when attempting to stop",  buf,  0x12u);
      }

      if (v4) {
        v4[2](v4, 0LL, 0LL);
      }
    }
  }
}

- (void)pauseSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPRecordSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 131;
    __int16 v9 = 2048;
    BOOL v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p pausing in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v3 stopCaptureForDelegate:self];

    -[RPMovieWriter notifyRecordingMayBeStopped](self->_movieWriter, "notifyRecordingMayBeStopped");
    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RPRecordSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (-[RPSession sessionState](self, "sessionState") == 3 && self->_currentRecordingURL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    currentRecordingURL = self->_currentRecordingURL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000409D8;
    v7[3] = &unk_100071208;
    v7[4] = self;
    id v8 = v4;
    [v5 _srRemoveFile:currentRecordingURL completion:v7];
  }
}

- (id)dispatchCaptureQueue
{
  if (qword_100084878 != -1) {
    dispatch_once(&qword_100084878, &stru_100071F40);
  }
  return (id)qword_100084870;
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  v6,  v5))
  {
    __int16 v9 = objc_alloc(&OBJC_CLASS___RPMovieWriter);
    -[RPSession windowSize](self, "windowSize");
    double v11 = v10;
    double v13 = v12;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordSession outputPath](self, "outputPath"));
    v15 = -[RPMovieWriter initWithWindowSize:outputPath:](v9, "initWithWindowSize:outputPath:", v14, v11, v13);
    movieWriter = self->_movieWriter;
    self->_movieWriter = v15;

    unsigned int v17 = self->_movieWriter;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100040C14;
    v19[3] = &unk_100071208;
    v19[4] = self;
    id v20 = v8;
    -[RPMovieWriter startWritingHandler:](v17, "startWritingHandler:", v19);
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    if (v8)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5801LL,  0LL));
      (*((void (**)(id, void *))v8 + 2))(v8, v18);
    }
  }
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100040FB8;
    v9[3] = &unk_100071C58;
    int v10 = v7;
    v9[4] = self;
    v9[5] = a5;
    -[RPSession updatePauseOffsetForSampleBuffer:withSampleType:handler:]( self,  "updatePauseOffsetForSampleBuffer:withSampleType:handler:",  a4,  v7,  v9);
  }

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004110C;
  v5[3] = &unk_100071F68;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v5);
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 277;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  self->super._sessionIsResuming = 1;
  -[RPMovieWriter notifyRecordingResumed](self->_movieWriter, "notifyRecordingResumed");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000413B4;
  v15[3] = &unk_100071208;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:",  self,  callingPID,  v7,  0,  v13,  v15,  v9,  v11);
}

- (void)handleClientApplicationDidEnterBackground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 300;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  -[RPRecordSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 307;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 4) {
    -[RPClientProtocol shouldResumeSessionType:]( self->super._clientProxy,  "shouldResumeSessionType:",  @"RPInAppRecording");
  }
}

- (void)handleDisplayWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPRecordSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 317;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000417D4;
    v3[3] = &unk_100071F90;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
  }

- (void)handleDeviceLockedWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 328;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

- (void)handleDeviceRestrictionWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPRecordSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 346;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100041AB0;
    v3[3] = &unk_100071F90;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
  }

- (void)handleResumeContextIDFailure
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPRecordSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 358;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100041CB4;
    v3[3] = &unk_100071F90;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
  }

- (void).cxx_destruct
{
}

@end