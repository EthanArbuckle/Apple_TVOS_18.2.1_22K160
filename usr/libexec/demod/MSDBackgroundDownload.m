@interface MSDBackgroundDownload
+ (id)sharedInstance;
- (BOOL)freezeBackgroundDownload;
- (BOOL)isBackgroundDownloadQueueEmpty;
- (MSDBundleProgressTracker)bundleDownloadInProgress;
- (MSDComponentManager)componentManager;
- (MSDTargetDevice)device;
- (NSString)bgDownloadPauseReason;
- (id)initiateBackgroundDownload;
- (int64_t)bgDownloadPauseStartTime;
- (void)_abortBackgroundDownload;
- (void)_pauseBackgroundDownloadForReason:(id)a3;
- (void)_resumeBackgroundDownload;
- (void)_sendDownloadStatusUpdateNotification;
- (void)didReceiveNewPauseStatus:(BOOL)a3 forReason:(id)a4;
- (void)kickOffBackgroundDownload;
- (void)quitBackgroundDownload;
- (void)setBgDownloadPauseReason:(id)a3;
- (void)setBgDownloadPauseStartTime:(int64_t)a3;
- (void)setBundleDownloadInProgress:(id)a3;
- (void)setComponentManager:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFreezeBackgroundDownload:(BOOL)a3;
- (void)setIsBackgroundDownloadQueueEmpty:(BOOL)a3;
@end

@implementation MSDBackgroundDownload

+ (id)sharedInstance
{
  if (qword_100125298 != -1) {
    dispatch_once(&qword_100125298, &stru_1000F9740);
  }
  return (id)qword_100125290;
}

- (void)kickOffBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  if (-[MSDBackgroundDownload isBackgroundDownloadQueueEmpty](v2, "isBackgroundDownloadQueueEmpty"))
  {
    -[MSDBackgroundDownload setIsBackgroundDownloadQueueEmpty:](v2, "setIsBackgroundDownloadQueueEmpty:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 backgroundDownloadQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017D74;
    block[3] = &unk_1000F9768;
    block[4] = v2;
    dispatch_async(v4, block);
  }

  else
  {
    id v5 = sub_10003A95C();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "Background download is already scheduled, skipping call to schedule background donwload",  buf,  2u);
    }
  }

  objc_sync_exit(v2);
}

- (id)initiateBackgroundDownload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 retrieveSignedManifest]);

  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress"));
    if (!v5
      || (v6 = (void *)v5,
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress")),
          unsigned __int8 v8 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:]( &OBJC_CLASS___MSDBundleProgressTracker,  "isBundleInstance:identicalWithNewBundle:",  v7,  v4),  v7,  v6,  (v8 & 1) == 0))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
      [v9 cleanUpBackgroundState:1];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v10 startBundleUpdateMonitor:v4 inMode:1];

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 backgroundBundle]);
      -[MSDBackgroundDownload setBundleDownloadInProgress:](self, "setBundleDownloadInProgress:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
      [v13 setBackgroundDownloadActive:1];
    }

    id v14 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "signedManifest in background download: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    id v16 = v4;
  }

  return v4;
}

- (void)quitBackgroundDownload
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100092A50(self, v4);
  }

  -[MSDBackgroundDownload _abortBackgroundDownload](self, "_abortBackgroundDownload");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress"));
  [v5 stopBundleUpdateTimer];
}

- (void)_abortBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
  id v4 = [v3 backgroundDownloadState];

  if (v4 == (id)1)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
    [v5 setBackgroundDownloadState:2];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
    [v6 setBackgroundDownloadActive:0];

    id v7 = sub_10003A95C();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Aborting background download...", v11, 2u);
    }

    if (-[MSDBackgroundDownload freezeBackgroundDownload](v2, "freezeBackgroundDownload"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
      [v9 resumeProcessing];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
    [v10 abortProcessing];
  }

  objc_sync_exit(v2);
}

- (void)_pauseBackgroundDownloadForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!-[MSDBackgroundDownload freezeBackgroundDownload](v5, "freezeBackgroundDownload"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v5, "bundleDownloadInProgress"));
    unsigned int v7 = [v6 bundleState];

    if (v7 == 1)
    {
      -[MSDBackgroundDownload setFreezeBackgroundDownload:](v5, "setFreezeBackgroundDownload:", 1LL);
      id v8 = sub_10003A95C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Pausing background download for reason: %{public}@",  (uint8_t *)&v14,  0xCu);
      }

      -[MSDBackgroundDownload setBgDownloadPauseReason:](v5, "setBgDownloadPauseReason:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v10 timeIntervalSince1970];
      -[MSDBackgroundDownload setBgDownloadPauseStartTime:](v5, "setBgDownloadPauseStartTime:", (uint64_t)v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v5, "bundleDownloadInProgress"));
      [v12 stopBundleUpdateTimer];

      -[MSDBackgroundDownload _sendDownloadStatusUpdateNotification](v5, "_sendDownloadStatusUpdateNotification");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v5, "componentManager"));
      [v13 pauseProcessing];
    }
  }

  objc_sync_exit(v5);
}

- (void)_resumeBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  if (-[MSDBackgroundDownload freezeBackgroundDownload](v2, "freezeBackgroundDownload"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v2, "bundleDownloadInProgress"));
    unsigned int v4 = [v3 bundleState];

    if (v4 == 1)
    {
      -[MSDBackgroundDownload setFreezeBackgroundDownload:](v2, "setFreezeBackgroundDownload:", 0LL);
      id v5 = sub_10003A95C();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resuming background download...", v15, 2u);
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)-[MSDBackgroundDownload bgDownloadPauseStartTime](v2, "bgDownloadPauseStartTime")));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v8 timeIntervalSinceDate:v7];
      double v10 = v9;

      double v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAnalyticsEventHandler sharedInstance]( &OBJC_CLASS___MSDAnalyticsEventHandler,  "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bgDownloadPauseReason](v2, "bgDownloadPauseReason"));
      [v11 sendBgDownloadPausedEvent:(uint64_t)v10 forReason:v12];

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v2, "bundleDownloadInProgress"));
      [v13 startBundleUpdateTimer];

      -[MSDBackgroundDownload _sendDownloadStatusUpdateNotification](v2, "_sendDownloadStatusUpdateNotification");
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
      [v14 resumeProcessing];
    }
  }

  objc_sync_exit(v2);
}

- (void)_sendDownloadStatusUpdateNotification
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDBackgroundDownload freezeBackgroundDownload](self, "freezeBackgroundDownload")));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  @"kMSDDownloadPausedKey",  0LL));

  [v5 postNotificationName:@"MSDNotificationPauseDownload" object:0 userInfo:v4];
}

- (void)didReceiveNewPauseStatus:(BOOL)a3 forReason:(id)a4
{
  if (a3) {
    -[MSDBackgroundDownload _pauseBackgroundDownloadForReason:](self, "_pauseBackgroundDownloadForReason:", a4);
  }
  else {
    -[MSDBackgroundDownload _resumeBackgroundDownload](self, "_resumeBackgroundDownload", a3);
  }
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (BOOL)freezeBackgroundDownload
{
  return self->_freezeBackgroundDownload;
}

- (void)setFreezeBackgroundDownload:(BOOL)a3
{
  self->_freezeBackgroundDownload = a3;
}

- (BOOL)isBackgroundDownloadQueueEmpty
{
  return self->_isBackgroundDownloadQueueEmpty;
}

- (void)setIsBackgroundDownloadQueueEmpty:(BOOL)a3
{
  self->_isBackgroundDownloadQueueEmpty = a3;
}

- (MSDBundleProgressTracker)bundleDownloadInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundleDownloadInProgress:(id)a3
{
}

- (int64_t)bgDownloadPauseStartTime
{
  return self->_bgDownloadPauseStartTime;
}

- (void)setBgDownloadPauseStartTime:(int64_t)a3
{
  self->_bgDownloadPauseStartTime = a3;
}

- (NSString)bgDownloadPauseReason
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBgDownloadPauseReason:(id)a3
{
}

- (MSDComponentManager)componentManager
{
  return (MSDComponentManager *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setComponentManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end