@interface RPScreenCaptureManagerIOS
- (RPScreenCaptureManagerIOS)init;
- (void)handleScreenCaptureFailureWithError:(id)a3;
- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4;
- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5;
- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3;
- (void)screenCaptureControllerMediaServicesWereReset:(id)a3;
- (void)screenCaptureControllerWasPreempted:(id)a3;
- (void)setCloneMirroringMode:(BOOL)a3 contextIDs:(id)a4;
- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9;
- (void)stop;
@end

@implementation RPScreenCaptureManagerIOS

- (RPScreenCaptureManagerIOS)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPScreenCaptureManagerIOS;
  v2 = -[RPScreenCaptureManagerIOS init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    screenCaptureController = v2->_screenCaptureController;
    v2->_screenCaptureController = 0LL;
  }

  return v3;
}

- (void)setCloneMirroringMode:(BOOL)a3 contextIDs:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (v4)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:]";
      __int16 v27 = 1024;
      int v28 = 62;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d mirror mode",  buf,  0x12u);
    }

    BKSDisplayServicesSetCloneMirroringMode(1LL);
    screenCaptureController = self->_screenCaptureController;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:]( screenCaptureController,  "setFigVirtualDisplayOption:forKey:",  v9,  kFigVirtualDisplayOption_MirroringMode);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:]";
      __int16 v27 = 1024;
      int v28 = 66;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d replay mode",  buf,  0x12u);
    }

    v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, v6);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[RPStringUtility numberFromString:]( &OBJC_CLASS___RPStringUtility,  "numberFromString:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i),  (void)v20));
          [v9 addObject:v15];
        }

        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v12);
    }

    v16 = self->_screenCaptureController;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:]( v16,  "setFigVirtualDisplayOption:forKey:",  v17,  kFigVirtualDisplayOption_ContentIDs);

    v18 = self->_screenCaptureController;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:]( v18,  "setFigVirtualDisplayOption:forKey:",  v19,  kFigVirtualDisplayOption_MirroringMode);

    BKSDisplayServicesSetCloneMirroringMode(3LL);
  }
}

- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9
{
  BOOL v11 = a7;
  BOOL v12 = a5;
  double height = a4.height;
  double width = a4.width;
  id v17 = a6;
  id v18 = a8;
  id v19 = objc_retainBlock(a9);
  id didStartScreenCaptureHandler = self->super._didStartScreenCaptureHandler;
  self->super._id didStartScreenCaptureHandler = v19;

  self->super._screenCaptureDidStart = 0;
  if (!self->_screenCaptureController)
  {
    CMTimeMake(&v29, 1LL, 60);
    __int128 v21 = (FigScreenCaptureController *)objc_claimAutoreleasedReturnValue( +[FigScreenCaptureController screenCaptureControllerWithSize:minIntervalBetweenFrames:]( &OBJC_CLASS___FigScreenCaptureController,  "screenCaptureControllerWithSize:minIntervalBetweenFrames:",  &v29,  width,  height));
    screenCaptureController = self->_screenCaptureController;
    self->_screenCaptureController = v21;
  }

  -[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:](self, "setCloneMirroringMode:contextIDs:", v12, v17);
  if (dword_100084688 <= 1)
  {
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_screenCaptureController;
      if (v24) {
        -[FigScreenCaptureController minIntervalBetweenFrames]( self->_screenCaptureController,  "minIntervalBetweenFrames");
      }
      else {
        memset(&v28, 0, sizeof(v28));
      }
      Float64 Seconds = CMTimeGetSeconds(&v28);
      *(_DWORD *)buf = 136448002;
      v31 = "-[RPScreenCaptureManagerIOS startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:out"
            "putHandler:didStartHandler:]";
      __int16 v32 = 1024;
      int v33 = 124;
      __int16 v34 = 2048;
      v35 = v24;
      __int16 v36 = 1024;
      int v37 = a3;
      __int16 v38 = 2048;
      double v39 = width;
      __int16 v40 = 2048;
      double v41 = height;
      __int16 v42 = 2048;
      Float64 v43 = Seconds;
      __int16 v44 = 1024;
      BOOL v45 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d starting capture with FigCaptureController %p, pid %d, window size width %.1f x height:%.1 f, minIntervalBetweenFrames(seconds): %lf mixedRealityCamera=%d",  buf,  0x46u);
    }
  }

  -[FigScreenCaptureController setDelegate:]( self->_screenCaptureController,  "setDelegate:",  self,  v28.value,  *(void *)&v28.timescale,  v28.epoch);
  id v26 = objc_retainBlock(v18);

  id screenCaptureOutputHandler = self->super._screenCaptureOutputHandler;
  self->super._id screenCaptureOutputHandler = v26;

  -[FigScreenCaptureController startCapture](self->_screenCaptureController, "startCapture");
}

- (void)stop
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    screenCaptureController = self->_screenCaptureController;
    int v8 = 136446722;
    v9 = "-[RPScreenCaptureManagerIOS stop]";
    __int16 v10 = 1024;
    int v11 = 131;
    __int16 v12 = 2048;
    uint64_t v13 = screenCaptureController;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop capture with FigCaptureController: %p",  (uint8_t *)&v8,  0x1Cu);
  }

  BOOL v4 = self->_screenCaptureController;
  if (v4)
  {
    -[FigScreenCaptureController stopCapture](v4, "stopCapture");
    -[FigScreenCaptureController setDelegate:](self->_screenCaptureController, "setDelegate:", 0LL);
    v5 = self->_screenCaptureController;
    self->_screenCaptureController = 0LL;
  }

  BKSDisplayServicesSetCloneMirroringMode(0LL);
  id screenCaptureOutputHandler = self->super._screenCaptureOutputHandler;
  self->super._id screenCaptureOutputHandler = 0LL;

  id didStartScreenCaptureHandler = self->super._didStartScreenCaptureHandler;
  self->super._id didStartScreenCaptureHandler = 0LL;

  self->super._screenCaptureDidStart = 0;
  -[RPScreenCaptureManager setSystemBroadcastHostBundleId:](self, "setSystemBroadcastHostBundleId:", 0LL);
}

- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5
{
  id v8 = a3;
  if (a4)
  {
    if (!self->super._screenCaptureDidStart)
    {
      if (self->super._didStartScreenCaptureHandler)
      {
        self->super._screenCaptureDidStart = 1;
        (*((void (**)(void))self->super._didStartScreenCaptureHandler + 2))();
        float v14 = sub_10003D0D4(a4);
        if (dword_100084688 <= 1)
        {
          float v15 = v14;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 136446722;
            id v17 = "-[RPScreenCaptureManagerIOS screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
            __int16 v18 = 1024;
            int v19 = 171;
            __int16 v20 = 2048;
            double v21 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d first sample received at time %.3f",  (uint8_t *)&v16,  0x1Cu);
          }
        }
      }
    }

    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    size_t Width = CVPixelBufferGetWidth(ImageBuffer);
    size_t Height = CVPixelBufferGetHeight(ImageBuffer);
    if (dword_100084688 <= 1)
    {
      size_t v12 = Height;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136447234;
        id v17 = "-[RPScreenCaptureManagerIOS screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
        __int16 v18 = 1024;
        int v19 = 177;
        __int16 v20 = 2048;
        double v21 = *(double *)&Width;
        __int16 v22 = 2048;
        size_t v23 = v12;
        __int16 v24 = 1024;
        int v25 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d screen sampled at window size width:%zu heigth:%zu transformFlags %d",  (uint8_t *)&v16,  0x2Cu);
      }
    }

    id screenCaptureOutputHandler = (void (**)(id, opaqueCMSampleBuffer *, unint64_t))self->super._screenCaptureOutputHandler;
    if (screenCaptureOutputHandler) {
      screenCaptureOutputHandler[2](screenCaptureOutputHandler, a4, a5);
    }
  }
}

- (void)handleScreenCaptureFailureWithError:(id)a3
{
  id v4 = a3;
  -[RPScreenCaptureManagerIOS stop](self, "stop");
  -[RPScreenCaptureManagerProtocol screenCaptureDidFailWithError:]( self->super._delegate,  "screenCaptureDidFailWithError:",  v4);
}

- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4
{
  id v6 = a3;
  if (a4 == -12073)
  {
    uint64_t v10 = -5803LL;
LABEL_9:
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  v10,  0LL));
    -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v9);
    goto LABEL_10;
  }

  if (a4 != -1030)
  {
    uint64_t v10 = -5817LL;
    goto LABEL_9;
  }

  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"RECORDING_ERROR_FAILED_TO_START_LIGHTING"));
  size_t v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.ReplayKit.RPRecordingErrorDomain",  -5803LL,  v8));
  (*((void (**)(void))self->super._didStartScreenCaptureHandler + 2))();

LABEL_10:
}

- (void)screenCaptureControllerWasPreempted:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5806LL,  0LL));
  -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v5);
}

- (void)screenCaptureControllerMediaServicesWereReset:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5817LL,  0LL));
  -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v5);
}

- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    v5 = "-[RPScreenCaptureManagerIOS screenCaptureControllerDidReceiveClearScreen:]";
    __int16 v6 = 1024;
    int v7 = 228;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d repeated clear screen likely DRM playback",  (uint8_t *)&v4,  0x12u);
  }
}

- (void).cxx_destruct
{
}

@end