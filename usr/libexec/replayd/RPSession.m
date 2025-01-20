@interface RPSession
+ (unint64_t)getFileSizeForURL:(id)a3;
- (BOOL)cameraEnabled;
- (BOOL)checkContextIDsMatch:(id)a3;
- (BOOL)checkMultiWindow;
- (BOOL)deviceLocked;
- (BOOL)dispatchLimitReached:(int64_t)a3;
- (BOOL)getAcknowledgementAlertResultsWithMicrophone:(BOOL)a3 cameraEnabled:(BOOL)a4;
- (BOOL)microphoneEnabled;
- (BOOL)shouldBypassAlertForTest;
- (BOOL)shouldSupressAlert;
- (BOOL)showAlertRecordingCaptureSessionWithError:(id)a3;
- (BOOL)showStopSystemSessionAlert;
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (CGAffineTransform)CGAffineTransformFromFigTransformFlags:(SEL)a3;
- (CGSize)windowSize;
- (NSString)bundleID;
- (NSString)contextID;
- (RPReportingAgent)reportingAgent;
- (RPSession)initWithClientProxy:(id)a3 sessionType:(int)a4 callingPID:(int)a5 bundleID:(id)a6 delegate:(id)a7;
- (id)checkApplicationForegroundRequirement;
- (id)checkCaptureRequirementsWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 windowSize:(CGSize)a5;
- (id)checkContextIDRequirement;
- (id)checkDeviceLockedRequirement;
- (id)checkMinWindowSizeRequirement:(CGSize)a3;
- (id)checkSufficientFreeSpace;
- (id)getCallingConnectionBundleID;
- (id)getNotificationBodyTextForSessionType:(int)a3 cameraEnabled:(BOOL)a4 microphoneEnabled:(BOOL)a5;
- (id)getNotificationTitleTextForSessionType:(int)a3 bundleID:(id)a4;
- (id)serviceNameForReporting;
- (id)showAcknowledgementAlertWithMicrophone:(BOOL)a3 camera:(BOOL)a4;
- (int)sessionState;
- (void)addObserversForSession;
- (void)checkAndPlaySystemSessionSound:(BOOL)a3;
- (void)checkAndPlaySystemSessionSoundForRecordingOn:(BOOL)a3;
- (void)checkForAcknowledgementAlertTimeout;
- (void)clientApplicationDidEnterBackground;
- (void)clientApplicationDidEnterForeground;
- (void)dealloc;
- (void)dispatchCompleted:(int64_t)a3;
- (void)frontmostApplicationDidChange:(id)a3;
- (void)handleDisplayBacklightUpdate:(id)a3;
- (void)handleUpdateDisplayLayout:(id)a3;
- (void)invalidate;
- (void)notifyClientSessionDidStopWithError:(int64_t)a3 movieURL:(id)a4 showAlert:(BOOL)a5;
- (void)pauseSession;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4 movieWriter:(id)a5;
- (void)removeObserversForSession;
- (void)reportSessionEndReason:(id)a3;
- (void)reportSummaryEvent:(int64_t)a3 recordedFileSize:(int64_t)a4;
- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)sendBiomeEventIsStarting:(BOOL)a3;
- (void)sendBiomeEventWithSessionState:(int)a3;
- (void)setBundleID:(id)a3;
- (void)setCameraEnabled:(BOOL)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceLocked:(BOOL)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setReportingAgent:(id)a3;
- (void)setSessionState:(int)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)setupDispatchLimits;
- (void)startAcknowledgementAlertTimer;
- (void)startWithContextID:(id)a3 windowSize:(CGSize)a4;
- (void)timerDidUpdate:(id)a3;
- (void)updateClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5;
- (void)updatePauseOffsetForSampleBuffer:(opaqueCMSampleBuffer *)a3 withSampleType:(int)a4 handler:(id)a5;
- (void)updatePauseOffsetFromVideoBuffer:(opaqueCMSampleBuffer *)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
- (void)updateReportingSampleCount:(int)a3;
@end

@implementation RPSession

- (RPSession)initWithClientProxy:(id)a3 sessionType:(int)a4 callingPID:(int)a5 bundleID:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___RPSession;
  v15 = -[RPSession init](&v39, "init");
  uint64_t v16 = objc_opt_class(v15);
  BOOL v17 = v16 != objc_opt_class(&OBJC_CLASS___RPSession) || dword_100084688 > 2;
  if (!v17 && (BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)))
  {
    sub_100042C78(v18, v19, v20, v21, v22, v23, v24, v25);
    if (!v15) {
      goto LABEL_13;
    }
  }

  else if (!v15)
  {
    goto LABEL_13;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class(v15);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 136446978;
    v41 = "-[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]";
    __int16 v42 = 1024;
    int v43 = 148;
    __int16 v44 = 2112;
    v45 = v28;
    __int16 v46 = 2048;
    v47 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  buf,  0x26u);
  }

  objc_storeStrong((id *)v15 + 2, a3);
  v29 = (void *)*((void *)v15 + 40);
  *((void *)v15 + 40) = 0LL;

  *((CGSize *)v15 + 21) = CGSizeZero;
  objc_storeStrong((id *)v15 + 39, a6);
  *((_DWORD *)v15 + 21) = a4;
  v30 = objc_alloc(&OBJC_CLASS___RPReportingAgent);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceNameForReporting]);
  v32 = -[RPReportingAgent initWithServiceName:](v30, "initWithServiceName:", v31);
  v33 = (void *)*((void *)v15 + 41);
  *((void *)v15 + 41) = v32;

  objc_storeStrong((id *)v15 + 3, a7);
  v34 = (void *)*((void *)v15 + 12);
  *((void *)v15 + 12) = 0LL;

  v15[88] = 0;
  *((void *)v15 + 18) = 0x4020000000000000LL;
  *((_OWORD *)v15 + 2) = *(_OWORD *)&kCMTimeInvalid.value;
  *((void *)v15 + 6) = kCMTimeInvalid.epoch;
  *(_OWORD *)(v15 + 56) = *(_OWORD *)&kCMTimeZero.value;
  *((void *)v15 + 9) = kCMTimeZero.epoch;
  v15[80] = 0;
  *((_WORD *)v15 + 153) = 0;
  *((_WORD *)v15 + 76) = 0;
  *((_DWORD *)v15 + 77) = 3;
  *((_DWORD *)v15 + 2) = a5;
  v35 = objc_alloc_init(&OBJC_CLASS___RPApplicationStateMonitor);
  v36 = (void *)*((void *)v15 + 15);
  *((void *)v15 + 15) = v35;

  [*((id *)v15 + 15) addObserver:v15 processIdentifier:*((unsigned int *)v15 + 2)];
  if (*((_DWORD *)v15 + 21) == 6) {
    [*((id *)v15 + 15) addSystemObserver:v15];
  }
  [v15 setDeviceLocked:0];
  pthread_mutex_init((pthread_mutex_t *)(v15 + 176), 0LL);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 240), 0LL);
LABEL_13:

  return (RPSession *)v15;
}

- (void)invalidate
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    v7 = "-[RPSession invalidate]";
    __int16 v8 = 1024;
    int v9 = 215;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

  -[RPApplicationStateMonitor removeObserverWithProcessIdentifier:]( self->_applicationStateMonitor,  "removeObserverWithProcessIdentifier:",  self->_callingPID);
  if (self->_sessionType == 6) {
    -[RPApplicationStateMonitor removeSystemObserver](self->_applicationStateMonitor, "removeSystemObserver");
  }
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 136446978;
    __int16 v8 = "-[RPSession dealloc]";
    __int16 v9 = 1024;
    int v10 = 225;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    __int16 v13 = 2048;
    id v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  buf,  0x26u);
  }

  pthread_mutex_destroy(&self->_videoMutex);
  pthread_mutex_destroy(&self->_audioMutex);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPSession;
  -[RPSession dealloc](&v6, "dealloc");
}

- (void)startWithContextID:(id)a3 windowSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = (NSString *)a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = (objc_class *)objc_opt_class(self);
    __int16 v9 = NSStringFromClass(v8);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v17 = 136446978;
    BOOL v18 = "-[RPSession startWithContextID:windowSize:]";
    __int16 v19 = 1024;
    int v20 = 237;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v17,  0x26u);
  }

  contextID = self->_contextID;
  self->_contextID = v7;
  __int16 v12 = v7;

  +[RPHardwareUtility limitRecordingWindowSizeFromSize:]( &OBJC_CLASS___RPHardwareUtility,  "limitRecordingWindowSizeFromSize:",  width,  height);
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  self->_windowSize.double width = v14;
  self->_windowSize.double height = v16;
  *(_OWORD *)&self->_lastSampleTimestamp.value = *(_OWORD *)&kCMTimeInvalid.value;
  self->_lastSampleTimestamp.epoch = kCMTimeInvalid.epoch;
  *(_OWORD *)&self->_sampleTimeOffset.value = *(_OWORD *)&kCMTimeZero.value;
  self->_sampleTimeOffset.epoch = kCMTimeZero.epoch;
  self->_sessionIsResuming = 0;
  -[RPSession addObserversForSession](self, "addObserversForSession");
  -[RPSession setSessionState:](self, "setSessionState:", 0LL);
  -[RPSession checkForAcknowledgementAlertTimeout](self, "checkForAcknowledgementAlertTimeout");
}

- (void)addObserversForSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    v7 = "-[RPSession addObserversForSession]";
    __int16 v8 = 1024;
    int v9 = 250;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2048;
    double v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

- (void)removeObserversForSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    v7 = "-[RPSession removeObserversForSession]";
    __int16 v8 = 1024;
    int v9 = 261;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2048;
    double v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

- (void)setSessionState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    int v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 136447234;
    int v9 = "-[RPSession setSessionState:]";
    __int16 v10 = 1024;
    int v11 = 272;
    __int16 v12 = 2112;
    double v13 = v7;
    __int16 v14 = 2048;
    double v15 = self;
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p session state change to %d",  (uint8_t *)&v8,  0x2Cu);
  }

  if (self->_sessionState != (_DWORD)v3) {
    -[RPSession sendBiomeEventWithSessionState:](self, "sendBiomeEventWithSessionState:", v3);
  }
  self->_sessionState = v3;
  if ((_DWORD)v3 == 3) {
    -[RPSession removeObserversForSession](self, "removeObserversForSession");
  }
}

- (void)reportSessionEndReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPSession serviceNameForReporting](self, "serviceNameForReporting"));
  +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:]( &OBJC_CLASS___RPReportingAgent,  "reportSessionEnded:endReason:withServiceName:clientBundleId:",  2LL,  v4,  v5,  self->_bundleID);
}

- (void)reportSummaryEvent:(int64_t)a3 recordedFileSize:(int64_t)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  [v7 setRecordedFileSize:a4];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  [v8 setEndReason:a3];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectSummaryEventMetrics]);
  [v11 reportEventWithType:1 dictionary:v10 clientBundleId:self->_bundleID];
}

- (void)checkForAcknowledgementAlertTimeout
{
  unsigned int sessionType = self->_sessionType;
  BOOL v4 = sessionType > 7;
  int v5 = (1 << sessionType) & 0xE8;
  if (v4 || v5 == 0)
  {
    if (self->_lastExemptTime)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v7 timeIntervalSinceDate:self->_lastExemptTime];
      double v9 = v8 / 60.0;

      if (self->_privacyAcknowledgementAlertTimeoutMinutes >= v9)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          BOOL isExempt = self->_isExempt;
          int v12 = 136446978;
          double v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          __int16 v14 = 1024;
          int v15 = 311;
          __int16 v16 = 2048;
          double v17 = v9;
          __int16 v18 = 1024;
          BOOL v19 = isExempt;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement exempt %d",  (uint8_t *)&v12,  0x22u);
        }
      }

      else
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136446722;
          double v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          __int16 v14 = 1024;
          int v15 = 306;
          __int16 v16 = 2048;
          double v17 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement required",  (uint8_t *)&v12,  0x1Cu);
        }

        self->_BOOL isExempt = 0;
        *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
      }
    }

    lastExemptTime = self->_lastExemptTime;
    self->_lastExemptTime = 0LL;
  }

  else
  {
    self->_BOOL isExempt = 0;
    *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
  }

- (void)startAcknowledgementAlertTimer
{
  unsigned int sessionType = self->_sessionType;
  BOOL v3 = sessionType > 7;
  int v4 = (1 << sessionType) & 0xE8;
  if (v3 || v4 == 0)
  {
    if (self->_lastExemptTime)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isExempt = self->_isExempt;
        int v11 = 136446722;
        int v12 = "-[RPSession startAcknowledgementAlertTimer]";
        __int16 v13 = 1024;
        int v14 = 329;
        __int16 v15 = 1024;
        BOOL v16 = isExempt;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d timer already running for user acknowledgement exempt %d",  (uint8_t *)&v11,  0x18u);
      }
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = self->_isExempt;
        int v11 = 136446722;
        int v12 = "-[RPSession startAcknowledgementAlertTimer]";
        __int16 v13 = 1024;
        int v14 = 326;
        __int16 v15 = 1024;
        BOOL v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d starting timer for user acknowledgement exempt %d",  (uint8_t *)&v11,  0x18u);
      }

      double v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      lastExemptTime = self->_lastExemptTime;
      self->_lastExemptTime = v9;
    }
  }

- (void)updateReportingSampleCount:(int)a3
{
  switch(a3)
  {
    case 2:
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v4, "setMicFrameCount:", (char *)objc_msgSend(v4, "micFrameCount") + 1);

      break;
    case 1:
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v5, "setAppAudioFrameCount:", (char *)objc_msgSend(v5, "appAudioFrameCount") + 1);

      break;
    case 0:
      id v3 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v3, "setVideoFrameCount:", (char *)objc_msgSend(v3, "videoFrameCount") + 1);

      break;
  }

- (void)updateClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  __int16 v10 = (NSString *)a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (objc_class *)objc_opt_class(self);
    int v12 = NSStringFromClass(v11);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v19 = 136446978;
    int v20 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
    __int16 v21 = 1024;
    int v22 = 363;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    v26 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v19,  0x26u);
  }

  objc_storeStrong((id *)&self->_clientProxy, a3);
  uint64_t callingPID = self->_callingPID;
  if ((_DWORD)callingPID != (_DWORD)v6)
  {
    if (dword_100084688 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = (objc_class *)objc_opt_class(self);
        BOOL v16 = NSStringFromClass(v15);
        double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v19 = 136446978;
        int v20 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
        __int16 v21 = 1024;
        int v22 = 366;
        __int16 v23 = 2112;
        uint64_t v24 = v17;
        __int16 v25 = 2048;
        v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p pid changed",  (uint8_t *)&v19,  0x26u);
      }

      uint64_t callingPID = self->_callingPID;
    }

    -[RPApplicationStateMonitor removeObserverWithProcessIdentifier:]( self->_applicationStateMonitor,  "removeObserverWithProcessIdentifier:",  callingPID);
    -[RPApplicationStateMonitor addObserver:processIdentifier:]( self->_applicationStateMonitor,  "addObserver:processIdentifier:",  self,  v6);
    self->_uint64_t callingPID = v6;
  }

  bundleID = self->_bundleID;
  self->_bundleID = v10;
}

- (void)notifyClientSessionDidStopWithError:(int64_t)a3 movieURL:(id)a4 showAlert:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](&OBJC_CLASS___NSError, "_rpUserErrorForCode:userInfo:", a3, 0LL));
  -[RPSessionDelegate sessionDidStop](self->_delegate, "sessionDidStop");
  -[RPClientProtocol recordingDidStopWithError:movieURL:]( self->_clientProxy,  "recordingDidStopWithError:movieURL:",  v9,  v8);

  if (v5) {
    -[RPSession showAlertRecordingCaptureSessionWithError:](self, "showAlertRecordingCaptureSessionWithError:", v9);
  }
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
    __int16 v8 = 1024;
    int v9 = 441;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d pid: %d",  (uint8_t *)&v6,  0x18u);
  }

  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    if ((int)v3 < 1)
    {
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136446722;
        v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
        __int16 v8 = 1024;
        int v9 = 445;
        __int16 v10 = 1024;
        int v11 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resuming audio capture for pid: %d",  (uint8_t *)&v6,  0x18u);
      }

      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
      [v5 restartAppAudioCaptureForProcessID:v3];
    }
  }

- (void)pauseSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class(self);
    id v4 = NSStringFromClass(v3);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    v7 = "-[RPSession pauseSession]";
    __int16 v8 = 1024;
    int v9 = 458;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

  -[RPSession setSessionState:](self, "setSessionState:", 4LL);
}

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = (objc_class *)objc_opt_class(self);
    int v9 = NSStringFromClass(v8);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v18 = 136446978;
    int v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 466;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    __int16 v24 = 2048;
    __int16 v25 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v18,  0x26u);
  }

  if (self->_sessionState == 4)
  {
    -[RPSession checkForAcknowledgementAlertTimeout](self, "checkForAcknowledgementAlertTimeout");
    -[RPSession setContextID:](self, "setContextID:", v6);
    BOOL microphoneEnabled = self->_microphoneEnabled;
    if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]( self,  "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:",  self->_microphoneEnabled,  self->_cameraEnabled))
    {
      if (microphoneEnabled && self->_sessionType == 2 && !self->_microphoneEnabled)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = (objc_class *)objc_opt_class(self);
          BOOL v16 = NSStringFromClass(v15);
          double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          int v18 = 136446978;
          int v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
          __int16 v20 = 1024;
          int v21 = 487;
          __int16 v22 = 2112;
          __int16 v23 = v17;
          __int16 v24 = 2048;
          __int16 v25 = self;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p resume capture with mic, but session will silence mic",  (uint8_t *)&v18,  0x26u);
        }

        self->_BOOL microphoneEnabled = 1;
        -[RPSession handleResumeCaptureWithCompletionHandler:](self, "handleResumeCaptureWithCompletionHandler:", v7);
        self->_BOOL microphoneEnabled = 0;
      }

      else
      {
        -[RPSession handleResumeCaptureWithCompletionHandler:](self, "handleResumeCaptureWithCompletionHandler:", v7);
      }

      goto LABEL_18;
    }

    -[RPSession setSessionState:](self, "setSessionState:", 3LL);
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v13 = -5801LL;
LABEL_17:
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  v13,  0LL));
    v7[2](v7, v14);

    goto LABEL_18;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int sessionState = self->_sessionState;
    int v18 = 136446722;
    int v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 500;
    __int16 v22 = 1024;
    LODWORD(v23) = sessionState;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Cannot resume session as it was not in paused state. Session state:%d",  (uint8_t *)&v18,  0x18u);
  }

  if (v7)
  {
    uint64_t v13 = -5832LL;
    goto LABEL_17;
  }

- (void)updatePauseOffsetFromVideoBuffer:(opaqueCMSampleBuffer *)a3
{
  if (self->_sessionIsResuming)
  {
    CMTimeMake(&v8, v9.value - self->_lastSampleTimestamp.value, v9.timescale);
    p_$95D729B680665BEAEFA1D6FCA8238556 sampleTimeOffset = &self->_sampleTimeOffset;
    CMTime time1 = kCMTimeZero;
    $95D729B680665BEAEFA1D6FCA8238556 sampleTimeOffset = self->_sampleTimeOffset;
    if (CMTimeCompare(&time1, (CMTime *)&sampleTimeOffset))
    {
      CMTimeMake(&time1, p_sampleTimeOffset->value + v8.value, v8.timescale);
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&time1.value;
      CMTimeEpoch epoch = time1.epoch;
    }

    else
    {
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&v8.value;
      CMTimeEpoch epoch = v8.epoch;
    }

    self->_sampleTimeOffset.CMTimeEpoch epoch = epoch;
    self->_sessionIsResuming = 0;
  }

  else
  {
    self->_lastSampleTimestamp = ($95D729B680665BEAEFA1D6FCA8238556)v9;
  }

- (void)updatePauseOffsetForSampleBuffer:(opaqueCMSampleBuffer *)a3 withSampleType:(int)a4 handler:(id)a5
{
  CMTime v8 = a5;
  CMTime v9 = v8;
  if (!a4)
  {
    -[RPSession updatePauseOffsetFromVideoBuffer:](self, "updatePauseOffsetFromVideoBuffer:", a3);
LABEL_5:
    CMSampleBufferGetPresentationTimeStamp(&v16, a3);
    CMTime time1 = (CMTime)self->_sampleTimeOffset;
    CMTime time2 = kCMTimeZero;
    if (CMTimeCompare(&time1, &time2))
    {
      CMTime time2 = v16;
      CMTime sampleTimeOffset = (CMTime)self->_sampleTimeOffset;
      CMTimeSubtract(&time1, &time2, &sampleTimeOffset);
      CMTime sampleTimeOffset = time1;
      CMTimeConvertScale(&time2, &sampleTimeOffset, v16.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTime sampleTimeOffset = time2;
      CMSampleBufferRef v10 = sub_10003C5DC(a3, (uint64_t)&sampleTimeOffset);
      int v11 = (void (*)(void *, CMSampleBufferRef))v9[2];
      if (v10)
      {
        CMSampleBufferRef v12 = v10;
        v11(v9, v10);
        CFRelease(v12);
        goto LABEL_10;
      }
    }

    else
    {
      int v11 = (void (*)(void *, CMSampleBufferRef))v9[2];
    }

    v11(v9, a3);
    goto LABEL_10;
  }

  if (!self->_sessionIsResuming) {
    goto LABEL_5;
  }
  ((void (*)(void *, void))v8[2])(v8, 0LL);
LABEL_10:
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4 movieWriter:(id)a5
{
  id v8 = a5;
  if (self->_sessionState == 4)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[RPSession processSampleBuffer:transformFlags:movieWriter:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 567;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session is paused discard sample",  buf,  0x12u);
    }
  }

  else
  {
    __int128 v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)buf = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf[16] = v9;
    __int128 v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v10[0] = *(_OWORD *)buf;
    v10[1] = *(_OWORD *)&buf[16];
    v10[2] = v12;
    [v8 appendVideoSampleBuffer:a3 withWindowTransform:v10];
  }
}

- (CGAffineTransform)CGAffineTransformFromFigTransformFlags:(SEL)a3
{
  char v4 = a4;
  __int128 v6 = *(_OWORD *)&CGAffineTransformIdentity.a;
  __int128 v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  __int128 v8 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v8;
  if ((a4 & 4) != 0)
  {
    __int128 v13 = v8;
    __int128 v14 = v7;
    __int128 v15 = v6;
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 587;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d rotate clockwise",  (uint8_t *)&buf,  0x12u);
    }

    CGAffineTransformMakeRotation(&t2, 1.57079633);
    *(_OWORD *)&buf.a = v15;
    *(_OWORD *)&buf.c = v14;
    *(_OWORD *)&buf.tx = v13;
    self = CGAffineTransformConcat(retstr, &buf, &t2);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        return self;
      }
      goto LABEL_13;
    }
  }

  else if ((a4 & 2) == 0)
  {
    goto LABEL_3;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.a) = 136446466;
    *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
    WORD2(buf.b) = 1024;
    *(_DWORD *)((char *)&buf.b + 6) = 591;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d flip x",  (uint8_t *)&buf,  0x12u);
  }

  __int128 v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  self = CGAffineTransformScale(&buf, &v16, -1.0, 1.0);
  __int128 v10 = *(_OWORD *)&buf.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  if ((v4 & 1) != 0)
  {
LABEL_13:
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 595;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d flip y",  (uint8_t *)&buf,  0x12u);
    }

    __int128 v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v16.c = v11;
    *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
    self = CGAffineTransformScale(&buf, &v16, 1.0, -1.0);
    __int128 v12 = *(_OWORD *)&buf.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  }

  return self;
}

- (void)checkAndPlaySystemSessionSound:(BOOL)a3
{
  BOOL v3 = a3;
  if ((+[RPHardwareUtility supportsShutterSound](&OBJC_CLASS___RPHardwareUtility, "supportsShutterSound")
     || +[RPHardwareUtility isVoiceOverRunning](&OBJC_CLASS___RPHardwareUtility, "isVoiceOverRunning"))
    && (self->_sessionType - 5) <= 2)
  {
    if (v3) {
      AudioServicesPlaySystemSound(0x45Du);
    }
    else {
      AudioServicesPlaySystemSound(0x45Eu);
    }
  }

- (BOOL)checkMultiWindow
{
  return +[RPHardwareUtility isIPad](&OBJC_CLASS___RPHardwareUtility, "isIPad");
}

- (void)handleUpdateDisplayLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](&OBJC_CLASS___RPFeatureFlagUtility, "sharedInstance"));
  unsigned int v6 = [v5 systemBannerEnabled];

  if (v6) {
    -[RPSession handleDisplayBacklightUpdate:](self, "handleDisplayBacklightUpdate:", v4);
  }
  if (-[RPSession checkMultiWindow](self, "checkMultiWindow"))
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elements", 0));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) bundleIdentifier]);

          if (v13) {
            ++v10;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
      }

      while (v9);

      self->_int64_t levelOneElementCount = v10;
      if (v10 >= 2)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int64_t levelOneElementCount = self->_levelOneElementCount;
          *(_DWORD *)CGAffineTransform buf = 136446722;
          __int16 v20 = "-[RPSession handleUpdateDisplayLayout:]";
          __int16 v21 = 1024;
          int v22 = 797;
          __int16 v23 = 2048;
          int64_t v24 = levelOneElementCount;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop recording from split mode with %ld elements",  buf,  0x1Cu);
        }

        -[RPSession handleDisplayWarning](self, "handleDisplayWarning");
      }
    }

    else
    {

      self->_int64_t levelOneElementCount = 0LL;
    }
  }
}

- (void)handleDisplayBacklightUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 displayBacklightLevel])
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446722;
      unsigned int v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      __int16 v7 = 1024;
      int v8 = 812;
      __int16 v9 = 1024;
      unsigned int v10 = [v4 displayBacklightLevel];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Display layout updated displayBacklightLevel=%d",  (uint8_t *)&v5,  0x18u);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      unsigned int v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      __int16 v7 = 1024;
      int v8 = 807;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Display layout updated to minimum backlight",  (uint8_t *)&v5,  0x12u);
    }

    if (!self->_enableLockedRecording) {
      -[RPSession handleDeviceLockedWarning](self, "handleDeviceLockedWarning");
    }
  }
}

- (id)checkCaptureRequirementsWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 windowSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class(self);
    __int16 v9 = NSStringFromClass(v8);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v14 = 136446978;
    __int128 v15 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    __int16 v16 = 1024;
    int v17 = 835;
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2048;
    __int16 v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v14,  0x26u);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[RPSession checkSufficientFreeSpace](self, "checkSufficientFreeSpace"));
  __int128 v12 = (void *)v11;
  if ((self->_sessionType - 5) >= 3)
  {
    if (!v11)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkContextIDRequirement](self, "checkContextIDRequirement"));
      if (!v12)
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession checkApplicationForegroundRequirement]( self,  "checkApplicationForegroundRequirement"));
        if (!v12) {
          goto LABEL_6;
        }
      }
    }
  }

  else if (!v11)
  {
LABEL_6:
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkMinWindowSizeRequirement:](self, "checkMinWindowSizeRequirement:", width, height));
  }

  if (v12 && dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446722;
    __int128 v15 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    __int16 v16 = 1024;
    int v17 = 877;
    __int16 v18 = 2112;
    int v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Check requirements error %@",  (uint8_t *)&v14,  0x1Cu);
  }

  return v12;
}

- (id)checkDeviceLockedRequirement
{
  if (self->_deviceLocked)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      int v5 = "-[RPSession checkDeviceLockedRequirement]";
      __int16 v6 = 1024;
      int v7 = 886;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d failed to start system recording because device was in locked state",  (uint8_t *)&v4,  0x12u);
    }

    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5809LL,  0LL));
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (id)checkContextIDRequirement
{
  v2 = self;
  contextID = self->_contextID;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &contextID, 1LL));
  LOBYTE(v2) = -[RPSession checkContextIDsMatch:](v2, "checkContextIDsMatch:", v3);

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPSession checkContextIDRequirement]";
    __int16 v7 = 1024;
    int v8 = 901;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d contextIDs do not match",  (uint8_t *)&v5,  0x12u);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
}

- (BOOL)checkContextIDsMatch:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[RPStringUtility numberFromString:]( &OBJC_CLASS___RPStringUtility,  "numberFromString:",  *(void *)(*((void *)&v16 + 1) + 8 * v8),  (void)v16));
      id v10 = [v9 unsignedIntValue];

      uint64_t ClientPort = CARenderServerGetClientPort(0LL, v10);
      if (!(_DWORD)ClientPort) {
        break;
      }
      id v12 = +[RPConnectionManager uniqueClientIdentifierWithPID:]( &OBJC_CLASS___RPConnectionManager,  "uniqueClientIdentifierWithPID:",  CARenderServerGetClientProcessId(0LL, ClientPort));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession getCallingConnectionBundleID](self, "getCallingConnectionBundleID"));
      mach_port_deallocate(mach_task_self_, ClientPort);
      LODWORD(ClientPort) = [v13 isEqualToString:v14];

      if (!(_DWORD)ClientPort) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        LOBYTE(ClientPort) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    LOBYTE(ClientPort) = 1;
  }

  return ClientPort;
}

- (id)getCallingConnectionBundleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](&OBJC_CLASS___RPConnectionManager, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentConnection]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RPConnectionManager uniqueClientIdentifierWithPID:]( RPConnectionManager,  "uniqueClientIdentifierWithPID:",  [v3 processIdentifier]));
  return v4;
}

- (id)checkSufficientFreeSpace
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = [v2 _srDeviceHasSufficientFreeSpaceForRecording];

  if ((v3 & 1) != 0) {
    return 0LL;
  }
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPSession checkSufficientFreeSpace]";
    __int16 v7 = 1024;
    int v8 = 960;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d insufficient disk space for recording",  (uint8_t *)&v5,  0x12u);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5805LL,  0LL));
}

- (id)checkApplicationForegroundRequirement
{
  if (-[RPApplicationStateMonitor isApplicationInForegroundWithBundleIdentifier:]( self->_applicationStateMonitor,  "isApplicationInForegroundWithBundleIdentifier:",  self->_bundleID))
  {
    return 0LL;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPSession checkApplicationForegroundRequirement]";
    __int16 v5 = 1024;
    int v6 = 972;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d attempted to start recording with application not in the foreground",  (uint8_t *)&v3,  0x12u);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
}

- (id)checkMinWindowSizeRequirement:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.height <= 0.0 || a3.width <= 0.0)
  {
    __int16 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5834LL,  0LL));
  }

  else
  {
    __int16 v5 = 0LL;
  }

  return v5;
}

- (BOOL)getAcknowledgementAlertResultsWithMicrophone:(BOOL)a3 cameraEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ((self->_sessionType - 5) < 3
    || +[RPConnectionManager hasUnitTestEntitlement](&OBJC_CLASS___RPConnectionManager, "hasUnitTestEntitlement"))
  {
    -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v5);
    -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v4);
    return 1;
  }

  if (-[RPSession shouldSupressAlert](self, "shouldSupressAlert"))
  {
    -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v5);
    -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v4);
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446722;
      __int128 v19 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      __int16 v20 = 1024;
      int v21 = 1016;
      __int16 v22 = 2080;
      __int16 v23 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %s internal settings suppressAlert",  (uint8_t *)&v18,  0x1Cu);
    }

    return 1;
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession showAcknowledgementAlertWithMicrophone:camera:]( self,  "showAcknowledgementAlertWithMicrophone:camera:",  v5,  v4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"microphoneEnabled"]);
  self->_didAcceptMicrophonePermission |= [v10 BOOLValue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"cameraEnabled"]);
  self->_didAcceptCameraPermission |= [v11 BOOLValue];

  BOOL v12 = self->_didAcceptMicrophonePermission && v5;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v12);
  BOOL v13 = self->_didAcceptCameraPermission && v4;
  -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v13);
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"alertResponse"]);
  unsigned __int8 v7 = [v14 BOOLValue];

  if ((v7 & 1) == 0 && dword_100084688 <= 1)
  {
    unsigned __int8 v7 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v15 = (objc_class *)objc_opt_class(self);
      __int128 v16 = NSStringFromClass(v15);
      __int128 v17 = (char *)objc_claimAutoreleasedReturnValue(v16);
      int v18 = 136446978;
      __int128 v19 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      __int16 v20 = 1024;
      int v21 = 1031;
      __int16 v22 = 2112;
      __int16 v23 = v17;
      __int16 v24 = 2048;
      __int16 v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p user declined session",  (uint8_t *)&v18,  0x26u);

      return 0;
    }
  }

  return v7;
}

- (BOOL)shouldSupressAlert
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"RPSuppressAlert", @"com.apple.replayd");
  BOOL v4 = v3 != 0LL;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    __int16 v9 = "-[RPSession shouldSupressAlert]";
    __int16 v10 = 1024;
    int v11 = 1045;
    __int16 v12 = 1024;
    BOOL v13 = v3 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d suppressAlert=%d",  (uint8_t *)&v8,  0x18u);
  }

  CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"RPEnableShortPrivacyTrigger", @"com.apple.replayd");
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    __int16 v9 = "-[RPSession shouldSupressAlert]";
    __int16 v10 = 1024;
    int v11 = 1047;
    __int16 v12 = 1024;
    BOOL v13 = v5 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d shortPrivacyPrompt=%d",  (uint8_t *)&v8,  0x18u);
  }

  double v6 = 0.333333333;
  if (!v5) {
    double v6 = 8.0;
  }
  self->_privacyAcknowledgementAlertTimeoutMinutes = v6;
  if (v3)
  {
    CFRelease(v3);
    return 1;
  }

  return v4;
}

- (id)showAcknowledgementAlertWithMicrophone:(BOOL)a3 camera:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = (objc_class *)objc_opt_class(self);
    int v8 = NSStringFromClass(v7);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)CGAffineTransform buf = 136447490;
    __int16 v44 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    __int16 v45 = 1024;
    int v46 = 1069;
    __int16 v47 = 2112;
    *(void *)v48 = v9;
    *(_WORD *)&v48[8] = 2048;
    v49 = self;
    __int16 v50 = 1024;
    BOOL v51 = v5;
    __int16 v52 = 1024;
    BOOL v53 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p microphoneEnabled: %d cameraEnabled: %d",  buf,  0x32u);
  }

  if (!self->_didAcceptCameraPermission && v4
    || (!self->_didAcceptMicrophonePermission ? (BOOL v10 = !v5) : (BOOL v10 = 1), !v10))
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136446978;
      __int16 v44 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
      __int16 v45 = 1024;
      int v46 = 1073;
      __int16 v47 = 1024;
      *(_DWORD *)v48 = v4;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d user acknowledgement required requesting camera %d and microphone %d",  buf,  0x1Eu);
    }

    self->_BOOL isExempt = 0;
  }

  int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!self->_isExempt)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[RPSession getNotificationTitleTextForSessionType:bundleID:]( self,  "getNotificationTitleTextForSessionType:bundleID:",  self->_sessionType,  self->_bundleID));
    __int128 v16 = (const void *)objc_claimAutoreleasedReturnValue( -[RPSession getNotificationBodyTextForSessionType:cameraEnabled:microphoneEnabled:]( self,  "getNotificationBodyTextForSessionType:cameraEnabled:microphoneEnabled:",  self->_sessionType,  v4,  v5));
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v14);
    v38 = v16;
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v16);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](&OBJC_CLASS___NSBundle, "_rpFrameworkBundle"));
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v17 bundleURL]);

    value = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON"));
    if (v5 && v4)
    {
      if (self->_sessionType == 3) {
        int v21 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED";
      }
      else {
        int v21 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED";
      }
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v21,  v38));
      if (self->_sessionType == 3) {
        __int16 v23 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_2";
      }
      else {
        __int16 v23 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_2";
      }

      __int128 v19 = (void *)v40;
LABEL_44:
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, value);
      CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v22);
      if (v19) {
        CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v19);
      }
      v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, 0LL, Mutable);
      if (!v27)
      {
        if (Mutable) {
          CFRelease(Mutable);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v31, @"cameraEnabled");

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v32, @"microphoneEnabled");

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v33, @"alertResponse");

        self->_BOOL isExempt = 0;
        goto LABEL_63;
      }

      v28 = v27;
      CFUserNotificationReceiveResponse(v27, 0.0, &responseFlags);
      CFOptionFlags v29 = responseFlags;
      BOOL v10 = responseFlags == 2;
      CFOptionFlags responseFlags = 2LL * (responseFlags != 2);
      if (!v10)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CGAffineTransform buf = 136446466;
          __int16 v44 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
          __int16 v45 = 1024;
          int v46 = 1180;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d user acknowledgement accepted, but no consent for microphone or camera",  buf,  0x12u);
        }

        BOOL v30 = 1;
        goto LABEL_62;
      }

      if (dword_100084688 <= 1)
      {
        BOOL v30 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_62:
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v34, @"cameraEnabled");

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v35, @"microphoneEnabled");

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v29 != 2));
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v36, @"alertResponse");

          self->_BOOL isExempt = v30;
          CFRelease(v28);
          CFRelease(Mutable);
          __int128 v19 = (void *)v40;
LABEL_63:

          goto LABEL_64;
        }

        *(_DWORD *)CGAffineTransform buf = 136446466;
        __int16 v44 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
        __int16 v45 = 1024;
        int v46 = 1189;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d user acknowledgement refused",  buf,  0x12u);
      }

      BOOL v30 = 0;
      goto LABEL_62;
    }

    if (!v5 || v4)
    {
      int sessionType = self->_sessionType;
      __int128 v19 = (void *)v40;
      if (!v4 || v5)
      {
        if (sessionType == 3) {
          __int16 v20 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED";
        }
        else {
          __int16 v20 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED";
        }
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v20,  v38));
        goto LABEL_44;
      }

      if (sessionType == 3) {
        v26 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_CAMERA";
      }
      else {
        v26 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_CAMERA";
      }
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v26,  v38));
      if (self->_sessionType != 3) {
        goto LABEL_40;
      }
    }

    else
    {
      if (self->_sessionType == 3) {
        __int16 v24 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1";
      }
      else {
        __int16 v24 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1";
      }
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v24,  v38));
      __int128 v19 = (void *)v40;
      if (self->_sessionType != 3)
      {
LABEL_40:
        __int16 v25 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_2";
        goto LABEL_41;
      }
    }

    __int16 v25 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_2";
LABEL_41:

    goto LABEL_44;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 136446466;
    __int16 v44 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    __int16 v45 = 1024;
    int v46 = 1214;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d session is still exempt from showing the alert",  buf,  0x12u);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RPSession cameraEnabled](self, "cameraEnabled")));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, @"cameraEnabled");

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RPSession microphoneEnabled](self, "microphoneEnabled")));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, @"microphoneEnabled");

  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, @"alertResponse");
LABEL_64:

  return v11;
}

- (id)getNotificationTitleTextForSessionType:(int)a3 bundleID:(id)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  self->_bundleID,  a4));
  switch(self->_sessionType)
  {
    case 1:
      double v6 = @"ACKNOWLEDGEMENT_CAPTURE_ALERT_TITLE";
      goto LABEL_7;
    case 2:
      double v6 = @"ACKNOWLEDGEMENT_ALERT_TITLE";
      goto LABEL_7;
    case 3:
      double v6 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_TITLE";
      goto LABEL_7;
    case 4:
      double v6 = @"ACKNOWLEDGEMENT_CLIPS_ALERT_TITLE";
LABEL_7:
      int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v6));
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v5));

      break;
    default:
      unsigned __int8 v7 = 0LL;
      break;
  }

  return v7;
}

- (id)getNotificationBodyTextForSessionType:(int)a3 cameraEnabled:(BOOL)a4 microphoneEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unsigned int v8 = self->_sessionType - 1;
  if (v8 <= 3)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  off_1000710B8[v8]));
    if (!v6) {
      goto LABEL_3;
    }
LABEL_7:
    int sessionType = self->_sessionType;
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@" "]);
    if (sessionType == 3)
    {
      __int16 v12 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_CAMERA";
      goto LABEL_10;
    }

- (BOOL)shouldBypassAlertForTest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.replayKit.ReplayKitTestRunneriOS"];

  return v3;
}

- (BOOL)showStopSystemSessionAlert
{
  return 1;
}

- (id)serviceNameForReporting
{
  unsigned int v2 = self->_sessionType - 1;
  if (v2 > 5) {
    return 0LL;
  }
  else {
    return off_1000710D8[v2];
  }
}

- (BOOL)showAlertRecordingCaptureSessionWithError:(id)a3
{
  return 1;
}

- (void)checkAndPlaySystemSessionSoundForRecordingOn:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[RPHardwareUtility supportsShutterSound](&OBJC_CLASS___RPHardwareUtility, "supportsShutterSound")
    || +[RPHardwareUtility isVoiceOverRunning](&OBJC_CLASS___RPHardwareUtility, "isVoiceOverRunning"))
  {
    if (v3) {
      AudioServicesPlaySystemSound(0x45Du);
    }
    else {
      AudioServicesPlaySystemSound(0x45Eu);
    }
  }

+ (unint64_t)getFileSizeForURL:(id)a3
{
  id v3 = a3;
  id v9 = 0LL;
  id v8 = 0LL;
  [v3 getResourceValue:&v9 forKey:NSURLFileSizeKey error:&v8];
  id v4 = v9;
  id v5 = v8;
  if (v4)
  {
    id v6 = [v4 unsignedIntegerValue];
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136446978;
      int v11 = "+[RPSession getFileSizeForURL:]";
      __int16 v12 = 1024;
      int v13 = 1488;
      __int16 v14 = 2048;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d recordedFileSize for URL %lu bytes URL: %@",  buf,  0x26u);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return (unint64_t)v6;
}

- (void)timerDidUpdate:(id)a3
{
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  -[RPSession showStopSystemSessionAlert](self, "showStopSystemSessionAlert");
  v6[2](v6);

  return 1;
}

- (void)frontmostApplicationDidChange:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class(self);
    id v6 = NSStringFromClass(v5);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 136446978;
    id v9 = "-[RPSession frontmostApplicationDidChange:]";
    __int16 v10 = 1024;
    int v11 = 1532;
    __int16 v12 = 2112;
    int v13 = v7;
    __int16 v14 = 2048;
    id v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v8,  0x26u);
  }

  -[RPSession handleFrontmostApplicationDidChange:](self, "handleFrontmostApplicationDidChange:", v4);
}

- (void)clientApplicationDidEnterBackground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class(self);
    id v4 = NSStringFromClass(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    unsigned __int8 v7 = "-[RPSession clientApplicationDidEnterBackground]";
    __int16 v8 = 1024;
    int v9 = 1538;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    int v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

  -[RPSession handleClientApplicationDidEnterBackground](self, "handleClientApplicationDidEnterBackground");
  -[RPSession startAcknowledgementAlertTimer](self, "startAcknowledgementAlertTimer");
}

- (void)clientApplicationDidEnterForeground
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class(self);
    id v4 = NSStringFromClass(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 136446978;
    unsigned __int8 v7 = "-[RPSession clientApplicationDidEnterForeground]";
    __int16 v8 = 1024;
    int v9 = 1545;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    int v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %@ %p",  (uint8_t *)&v6,  0x26u);
  }

  -[RPSession handleClientApplicationDidEnterForeground](self, "handleClientApplicationDidEnterForeground");
}

- (void)setupDispatchLimits
{
  self->_dispatchVideoCount = 0LL;
  self->_dispatchAudioCount = 0LL;
}

- (BOOL)dispatchLimitReached:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v4 = 20LL;
  }
  else {
    uint64_t v4 = 21LL;
  }
  uint64_t v5 = 240LL;
  if (a3 == 1) {
    uint64_t v5 = 176LL;
  }
  int v6 = (pthread_mutex_t *)((char *)self + v5);
  pthread_mutex_lock((pthread_mutex_t *)((char *)self + v5));
  uint64_t v7 = (uint64_t)(&self->super.isa)[v4];
  if (v7 <= 4) {
    (&self->super.isa)[v4] = (Class)(v7 + 1);
  }
  pthread_mutex_unlock(v6);
  BOOL v8 = v7 < 5 || dword_100084688 > 2;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100042F40();
  }
  return v7 > 4;
}

- (void)dispatchCompleted:(int64_t)a3
{
  uint64_t v4 = 240LL;
  if (a3 == 1)
  {
    uint64_t v4 = 176LL;
    uint64_t v5 = 20LL;
  }

  else
  {
    uint64_t v5 = 21LL;
  }

  int v6 = (pthread_mutex_t *)((char *)self + v4);
  pthread_mutex_lock((pthread_mutex_t *)((char *)self + v4));
  --(&self->super.isa)[v5];
  pthread_mutex_unlock(v6);
}

- (void)sendBiomeEventWithSessionState:(int)a3
{
}

- (void)sendBiomeEventIsStarting:(BOOL)a3
{
  BOOL v3 = a3;
  int sessionType = self->_sessionType;
  if (sessionType == 6 || sessionType == 3)
  {
    uint64_t v7 = (void *)objc_opt_new(&OBJC_CLASS___BMScreenSharingStream, a2);
    BOOL v8 = (objc_class *)&OBJC_CLASS___BMScreenSharingEvent;
  }

  else
  {
    uint64_t v7 = (void *)objc_opt_new(&OBJC_CLASS___BMScreenRecordingStream, a2);
    BOOL v8 = (objc_class *)&OBJC_CLASS___BMScreenRecordingEvent;
  }

  id v9 = [[v8 alloc] initWithIsStart:v3];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);
  [v10 sendEvent:v9];

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = self->_sessionType;
    __int16 v12 = @"stop";
    __int16 v14 = "-[RPSession sendBiomeEventIsStarting:]";
    int v13 = 136446978;
    __int16 v15 = 1024;
    if (v3) {
      __int16 v12 = @"start";
    }
    int v16 = 1668;
    __int16 v17 = 1024;
    int v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Sending Biome event for sessionType:%d %@",  (uint8_t *)&v13,  0x22u);
  }

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_BOOL microphoneEnabled = a3;
}

- (BOOL)cameraEnabled
{
  return self->_cameraEnabled;
}

- (void)setCameraEnabled:(BOOL)a3
{
  self->_cameraEnabled = a3;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (RPReportingAgent)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end