@interface RPCaptureSession
- (id)dispatchCaptureQueue;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)packageAudioSampleBufferForCapture:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)startCaptureWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopCaptureWithHandler:(id)a3;
@end

@implementation RPCaptureSession

- (void)startCaptureWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v18 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 35;
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
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPCaptureSession: attempting to start capture session when session was not in stopped state",  buf,  2u);
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
  v16.super_class = (Class)&OBJC_CLASS___RPCaptureSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]( self,  "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:",  v11,  v10,  width,  height));
  if (!v15)
  {
    -[RPCaptureSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:]( self,  "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:",  v11,  v10,  v14);
    goto LABEL_16;
  }

  -[RPSession setSessionState:](self, "setSessionState:", 3LL);
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  v6,  v5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    uint64_t callingPID = self->super._callingPID;
    BOOL v11 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
    -[RPSession windowSize](self, "windowSize");
    double v13 = v12;
    double v15 = v14;
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v16));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003ADF4;
    v19[3] = &unk_100071208;
    v19[4] = self;
    id v20 = v8;
    objc_msgSend( v9,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:",  self,  callingPID,  v11,  0,  v17,  v19,  v13,  v15);
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

- (void)stopCaptureWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    id v8 = "-[RPCaptureSession stopCaptureWithHandler:]";
    __int16 v9 = 1024;
    int v10 = 108;
    __int16 v11 = 2048;
    double v12 = self;
    __int16 v13 = 1024;
    unsigned int v14 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  (uint8_t *)&v7,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5829LL,  0LL));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4) {
      v4[2](v4, v5);
    }
  }

  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2LL);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v6 stopCaptureForDelegate:self];

    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", 0LL, 0LL);
    if (v4) {
      v4[2](v4, 0LL);
    }
  }
}

- (void)pauseSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v6 = "-[RPCaptureSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 136;
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p pausing in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v3 stopCaptureForDelegate:self];

    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RPCaptureSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }

- (id)dispatchCaptureQueue
{
  if (qword_100084840 != -1) {
    dispatch_once(&qword_100084840, &stru_100071E00);
  }
  return (id)qword_100084838;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  if (-[RPSession sessionState](self, "sessionState", *(void *)&a3, a4, a5) == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v6);
    if ((_DWORD)v6 == 2)
    {
      if (!-[RPSession microphoneEnabled](self, "microphoneEnabled"))
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a4);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0LL, DataLength);
      }

      __int16 v9 = self;
      int v10 = a4;
      uint64_t v11 = 3LL;
    }

    else
    {
      if ((_DWORD)v6 != 1)
      {
        if (!(_DWORD)v6) {
          -[RPCaptureSession processVideoSampleBuffer:](self, "processVideoSampleBuffer:", a4, v8);
        }
        return;
      }

      __int16 v9 = self;
      int v10 = a4;
      uint64_t v11 = 2LL;
    }

    -[RPCaptureSession packageAudioSampleBufferForCapture:withType:]( v9,  "packageAudioSampleBufferForCapture:withType:",  v10,  v11);
  }

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003B3C8;
  v5[3] = &unk_1000713D0;
  id v6 = a3;
  __int16 v7 = self;
  id v4 = v6;
  -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v5);
}

- (void)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9.duration.value) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "session is paused discard sample",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    __int16 v7 = objc_alloc_init(&OBJC_CLASS___RPIOSurfaceObject);
    -[RPIOSurfaceObject setIOSurface:](v7, "setIOSurface:", IOSurface);
    CMSampleBufferGetSampleTimingInfo(a3, 0LL, &v9);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v9, 72LL));
    -[RPClientProtocol captureHandlerWithSample:timingData:]( self->super._clientProxy,  "captureHandlerWithSample:timingData:",  v7,  v8);
    CFRelease(ImageBuffer);
  }

- (void)packageAudioSampleBufferForCapture:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  id v6 = sub_10003C708(a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[RPClientProtocol captureHandlerWithAudioSample:bufferType:]( self->super._clientProxy,  "captureHandlerWithAudioSample:bufferType:",  v7,  a4);
}

- (void)handleDisplayWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v5 = "-[RPCaptureSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 246;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003B6F0;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }

- (void)handleDeviceLockedWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPCaptureSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 257;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

- (void)handleDeviceRestrictionWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPCaptureSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 275;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003B9CC;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }

- (void)handleResumeContextIDFailure
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPCaptureSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 287;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003BBD0;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 297;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  self->super._sessionIsResuming = 1;
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  double v9 = v8;
  double v11 = v10;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003BEA4;
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
    id v4 = "-[RPCaptureSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 318;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  -[RPCaptureSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPCaptureSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 325;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 4) {
    -[RPClientProtocol shouldResumeSessionType:]( self->super._clientProxy,  "shouldResumeSessionType:",  @"RPInAppCapture");
  }
}

@end