@interface RPSystemRecordSession
- (CGSize)adjustedWindowSizeForSystemRecording;
- (id)dispatchCaptureQueue;
- (id)outputPath;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleIncomingCallWarning;
- (void)handleMemoryWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)handleSystemAlertStop;
- (void)handleTimerDidUpdate:(id)a3;
- (void)pauseSession;
- (void)setCaptureMicrophoneEnabled:(BOOL)a3;
- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
@end

@implementation RPSystemRecordSession

- (id)outputPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 outputPath:2 bundleID:v4]);

  return v5;
}

- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v40 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v41 = 1024;
    int v42 = 47;
    __int16 v43 = 2048;
    v44 = self;
    __int16 v45 = 1024;
    unsigned int v46 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p starting in session state %d",  buf,  0x22u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]( self,  "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:",  v11,  v10,  width,  height));
  if (v15)
  {
    if ([v15 code] == (id)-5805)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5805LL,  0LL));
      -[RPSession showAlertRecordingCaptureSessionWithError:](self, "showAlertRecordingCaptureSessionWithError:", v16);
    }

    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v15);
    if (v14) {
      v14[2](v14, v15);
    }
  }

  else
  {
    v38.receiver = self;
    v38.super_class = (Class)&OBJC_CLASS___RPSystemRecordSession;
    -[RPSession startWithContextID:windowSize:](&v38, "startWithContextID:windowSize:", v13, width, height);
    if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  v11,  v10))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](&OBJC_CLASS___RPFeatureFlagUtility, "sharedInstance"));
      unsigned int v18 = [v17 systemBannerEnabled];

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](&OBJC_CLASS___RPAngelProxy, "sharedInstance"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_10003578C;
        v37[3] = &unk_100071C30;
        v37[4] = self;
        [v19 connectToAngelWithCompletionHandler:v37];
      }

      -[RPSystemRecordSession adjustedWindowSizeForSystemRecording](self, "adjustedWindowSizeForSystemRecording");
      double v21 = v20;
      double v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](&OBJC_CLASS___RPFeatureFlagUtility, "sharedInstance"));
      unsigned int v25 = [v24 replayKitScreenRecordingHEVC];
      v26 = (id *)&AVVideoCodecTypeHEVC;
      if (!v25) {
        v26 = (id *)&AVVideoCodecTypeH264;
      }
      id v27 = *v26;

      v28 = objc_alloc(&OBJC_CLASS___RPMovieWriter);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPSystemRecordSession outputPath](self, "outputPath"));
      v30 = -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:]( v28,  "initWithWindowSize:outputPath:videoCodecType:",  v29,  v27,  v21,  v23);
      movieWriter = self->_movieWriter;
      self->_movieWriter = v30;

      v32 = self->_movieWriter;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000358EC;
      v35[3] = &unk_100071208;
      v35[4] = self;
      v33 = v14;

      v36 = v33;
      -[RPMovieWriter startWritingHandler:](v32, "startWritingHandler:", v35);
    }

    else
    {
      -[RPSession setSessionState:](self, "setSessionState:", 3LL);
      if (v14)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
        v14[2](v14, v34);
      }
    }
  }
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v16 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
    __int16 v17 = 1024;
    int v18 = 154;
    __int16 v19 = 2048;
    double v20 = self;
    __int16 v21 = 1024;
    unsigned int v22 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  buf,  0x22u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  [v5 stopCaptureForDelegate:self];

  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    sessionID = self->_sessionID;
    BOOL mixAudioTracks = self->_mixAudioTracks;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    BOOL v11 = sub_100035E58;
    v12 = &unk_100071208;
    id v13 = self;
    id v14 = v4;
    -[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]( movieWriter,  "finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:",  sessionID,  mixAudioTracks,  &v9);
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824LL, 0LL);
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
      __int16 v17 = 1024;
      int v18 = 190;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d no movie writer instance when attempting to stop",  buf,  0x12u);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }

  -[RPSession checkAndPlaySystemSessionSound:](self, "checkAndPlaySystemSessionSound:", 0LL, v9, v10, v11, v12, v13);
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]";
    __int16 v15 = 1024;
    int v16 = 206;
    __int16 v17 = 2048;
    int v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  buf,  0x22u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  [v5 stopCaptureForDelegate:self];

  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    v9 = sub_1000361E0;
    uint64_t v10 = &unk_100071230;
    BOOL v11 = self;
    id v12 = v4;
    -[RPMovieWriter finishWritingWithHandler:](movieWriter, "finishWritingWithHandler:", &v7);
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824LL, 0LL);
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }

  -[RPSession checkAndPlaySystemSessionSound:](self, "checkAndPlaySystemSessionSound:", 0LL, v7, v8, v9, v10, v11);
}

- (void)pauseSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPSystemRecordSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 248;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p pausing in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v3 stopCaptureForDelegate:self];

    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    -[RPMovieWriter notifyRecordingMayBeStopped](self->_movieWriter, "notifyRecordingMayBeStopped");
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RPSystemRecordSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }

- (void)setCaptureMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:");
  if (v3)
  {
    self->_BOOL mixAudioTracks = 1;
    if (-[RPSession sessionState](self, "sessionState") == 1 && v3)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
      [v5 enableMicrophone];
    }
  }

  else
  {
    -[RPSession sessionState](self, "sessionState");
  }

- (CGSize)adjustedWindowSizeForSystemRecording
{
  double v3 = v2;
  double v5 = v4;
  if ((((v2 > v4) ^ +[RPHardwareUtility isNativeScreenOrientationPortrait]( &OBJC_CLASS___RPHardwareUtility,  "isNativeScreenOrientationPortrait")) & 1) != 0)
  {
    double v6 = v5;
    double v5 = v3;
    double v3 = v6;
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446978;
    uint64_t v10 = "-[RPSystemRecordSession adjustedWindowSizeForSystemRecording]";
    __int16 v11 = 1024;
    int v12 = 275;
    __int16 v13 = 2048;
    double v14 = v5;
    __int16 v15 = 2048;
    double v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d rotating to window size width %.1f x height:%.1f",  (uint8_t *)&v9,  0x26u);
  }

  double v7 = v5;
  double v8 = v3;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100036748;
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
  v5[2] = sub_10003689C;
  v5[3] = &unk_1000713D0;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v5);
}

- (id)dispatchCaptureQueue
{
  if (qword_100084820 != -1) {
    dispatch_once(&qword_100084820, &stru_100071C78);
  }
  return (id)qword_100084818;
}

- (void)handleSystemAlertStop
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleSystemAlertStop]";
    __int16 v6 = 1024;
    int v7 = 332;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100036AB0;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }

- (void)handleMemoryWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
    __int16 v13 = 1024;
    int v14 = 344;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v4 = [v3 _srDeviceHasSufficientFreeSpaceForRecording];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v6 = [v5 _srDeviceHasSufficientSpaceForCurrentRecording];

    if (v4)
    {
      if (v6)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
          __int16 v13 = 1024;
          int v14 = 352;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Disk space can still support current recording",  buf,  0x12u);
        }

        return;
      }

      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 355;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Disk space cannot support current continued recording, Stopping and discarding current recording",  buf,  0x12u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100036F1C;
      v10[3] = &unk_100071418;
      v10[4] = self;
      int v7 = v10;
    }

    else if (v6)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 367;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Crossed disk threshold: Disk space can support saving current recording",  buf,  0x12u);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100037024;
      v9[3] = &unk_100071418;
      v9[4] = self;
      int v7 = v9;
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 376;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Crossed disk threshold: Disk space cannot support saving current recording",  buf,  0x12u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10003712C;
      v8[3] = &unk_100071418;
      v8[4] = self;
      int v7 = v8;
    }

    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v7);
  }

- (void)handleIncomingCallWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleIncomingCallWarning]";
    __int16 v6 = 1024;
    int v7 = 389;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100037358;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }

- (void)handleDeviceLockedWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleDeviceLockedWarning]";
    __int16 v6 = 1024;
    int v7 = 401;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003754C;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }

- (void)handleDeviceRestrictionWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 413;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100037740;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }

- (void)handleTimerDidUpdate:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPSystemRecordSession handleTimerDidUpdate:]";
    __int16 v10 = 1024;
    int v11 = 425;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v8,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](&OBJC_CLASS___RPFeatureFlagUtility, "sharedInstance"));
    unsigned int v6 = [v5 systemBannerEnabled];

    if (v6)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](&OBJC_CLASS___RPAngelProxy, "sharedInstance"));
      [v7 updateTimer:v4];
    }

    -[RPClientProtocol recordingTimerDidUpdate:](self->super._clientProxy, "recordingTimerDidUpdate:", v4);
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v17 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v18 = 1024;
    int v19 = 439;
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  self->super._sessionIsResuming = 1;
  -[RPMovieWriter notifyRecordingResumed](self->_movieWriter, "notifyRecordingResumed");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  BOOL v6 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  double v8 = v7;
  double v10 = v9;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100037B6C;
  v14[3] = &unk_100071208;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedReality Camera:didStartHandler:",  self,  0xFFFFFFFFLL,  v6,  1,  v12,  1,  v8,  v10,  v14);
}

- (void)handleResumeContextIDFailure
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 460;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100037D98;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }

- (void).cxx_destruct
{
}

@end