@interface RPClipSession
- (id)dispatchCaptureQueue;
- (void)captureDidFailWithError:(id)a3;
- (void)createEncodingSessionWithWidth:(int)a3 withHeight:(int)a4;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)encodeBuffer:(opaqueCMSampleBuffer *)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)startClipWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopClipWithHandler:(id)a3;
@end

@implementation RPClipSession

- (void)startClipWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v18 = "-[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 50;
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
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPClipSession: attempting to start clip session when session was not in stopped state",  buf,  2u);
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
  v16.super_class = (Class)&OBJC_CLASS___RPClipSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]( self,  "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:",  v11,  v10,  width,  height));
  if (!v15)
  {
    -[RPClipSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:]( self,  "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:",  v11,  v10,  v14);
    goto LABEL_16;
  }

  -[RPSession setSessionState:](self, "setSessionState:", 3LL);
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)stopClipWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 136446978;
    *(void *)&v9[4] = "-[RPClipSession stopClipWithHandler:]";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 91;
    *(_WORD *)&v9[18] = 2048;
    *(void *)&v9[20] = self;
    __int16 v10 = 1024;
    unsigned int v11 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p stopping in session state %d",  v9,  0x22u);
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v6 stopCaptureForDelegate:self];

    encodeSession = self->_encodeSession;
    *(_OWORD *)v9 = *(_OWORD *)&kCMTimeInvalid.value;
    *(void *)&v9[16] = kCMTimeInvalid.epoch;
    VTCompressionSessionCompleteFrames(encodeSession, (CMTime *)v9);
    VTCompressionSessionInvalidate(self->_encodeSession);
    v8 = self->_encodeSession;
    if (v8) {
      CFRelease(v8);
    }
    self->_encodeSession = 0LL;
    -[RPClipWriter flushClipBuffer](self->_clipWriter, "flushClipBuffer");
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", 0LL, 0LL);
    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
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
    v6 = "-[RPClipSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 125;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p pausing in session state %d",  buf,  0x22u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    [v3 stopCaptureForDelegate:self];

    -[RPClipWriter flushClipBuffer](self->_clipWriter, "flushClipBuffer");
    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RPClipSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  __int16 v9 = (void (**)(id, void *))a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 136;
    __int16 v22 = 2048;
    uint64_t v23 = (uint64_t)self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  double v10 = 15.0;
  if (a4 <= 15.0)
  {
    if (a4 > 0.0)
    {
LABEL_13:
      double v10 = a4;
      goto LABEL_14;
    }

    if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100043808();
      if (v9) {
        goto LABEL_12;
      }
    }

    else if (v9)
    {
LABEL_12:
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5834LL,  0LL));
      v9[2](v9, v11);

      goto LABEL_13;
    }

    if (-[RPSession sessionState](self, "sessionState") != 1) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 138;
    __int16 v22 = 2048;
    uint64_t v23 = 0x402E000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d clipping to maximum length %f seconds",  buf,  0x1Cu);
  }

- (void)encodeBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipSession dispatchCaptureQueue](self, "dispatchCaptureQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100017E60;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)createEncodingSessionWithWidth:(int)a3 withHeight:(int)a4
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v11 = "-[RPClipSession createEncodingSessionWithWidth:withHeight:]";
    __int16 v12 = 1024;
    int v13 = 202;
    __int16 v14 = 1024;
    int v15 = a3;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d VTCompressionSessionCreate w:%d h:%d",  buf,  0x1Eu);
  }

  outputCallbackRefCon = self->_clipWriter;
  p_encodeSession = &self->_encodeSession;
  if (VTCompressionSessionCreate( kCFAllocatorDefault,  a3,  a4,  0x61766331u,  0LL,  0LL,  kCFAllocatorDefault,  (VTCompressionOutputCallback)sub_100018180,  outputCallbackRefCon,  p_encodeSession))
  {
  }

  else
  {
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_RealTime, kCFBooleanTrue);
    *(_DWORD *)buf = 1056964608;
    CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, buf);
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration, v9);
    CFRelease(v9);
  }

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  v6,  v5))
  {
    CFNumberRef v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    uint64_t callingPID = self->super._callingPID;
    BOOL v11 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
    -[RPSession windowSize](self, "windowSize");
    double v13 = v12;
    double v15 = v14;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v16));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000183C0;
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

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  if (a4)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", *(void *)&a3, a4, a5);
    if (a3)
    {
      id v8 = sub_10003C708(a4, 0LL);
      CFNumberRef v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      CMSampleBufferRef v10 = sub_10003C914(v9);
      if (v10)
      {
        CMSampleBufferRef v11 = v10;
        if (a3 == 2)
        {
          -[RPClipWriter appendAudio2SampleBuffer:](self->_clipWriter, "appendAudio2SampleBuffer:", v10);
        }

        else if (a3 == 1)
        {
          -[RPClipWriter appendAudio1SampleBuffer:](self->_clipWriter, "appendAudio1SampleBuffer:", v10);
        }

        CFRelease(v11);
      }

      else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100043B78();
      }
    }

    else
    {
      -[RPClipSession encodeBuffer:](self, "encodeBuffer:", a4);
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043AFC();
  }

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000186CC;
  v5[3] = &unk_1000713D0;
  id v6 = a3;
  __int16 v7 = self;
  id v4 = v6;
  -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v5);
}

- (id)dispatchCaptureQueue
{
  if (qword_1000846F8 != -1) {
    dispatch_once(&qword_1000846F8, &stru_1000713F0);
  }
  return (id)qword_1000846F0;
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 342;
    __int16 v21 = 2048;
    __int16 v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p resuming in session state %d",  buf,  0x22u);
  }

  self->super._sessionIsResuming = 1;
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
  v15[2] = sub_1000189C0;
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
    id v4 = "-[RPClipSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 364;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  -[RPClipSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPClipSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 371;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 4) {
    -[RPClientProtocol shouldResumeSessionType:]( self->super._clientProxy,  "shouldResumeSessionType:",  @"RPInAppClip");
  }
}

- (void)handleDisplayWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClipSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 381;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100018DE0;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
  }

- (void)handleDeviceLockedWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPClipSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 392;
    __int16 v7 = 1024;
    unsigned int v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  (uint8_t *)&v3,  0x18u);
  }

- (void)handleDeviceRestrictionWarning
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClipSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 410;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000190BC;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
  }

- (void)handleResumeContextIDFailure
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClipSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 422;
    __int16 v8 = 1024;
    unsigned int v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session state %d",  buf,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000192C0;
    v3[3] = &unk_100071418;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
  }

- (void).cxx_destruct
{
}

@end