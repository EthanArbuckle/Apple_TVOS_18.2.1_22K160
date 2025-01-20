@interface CSAttSiriContinuityEndDetector
- (BOOL)configureContinuityWindowTimeout;
- (BOOL)continuityEndDelivered;
- (BOOL)continuityEndDeliveryNeeded;
- (CSAttSiriContinuityEndDetector)init;
- (CSAttSiriRecognitionCompletionCachedInfo)cachedRecognitionCompletionInfo;
- (CSAttSiriTimer)continuityDetectorTimer;
- (NSHashTable)continuityDetectionReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSString)cachedTRPId;
- (NSString)requestId;
- (OS_dispatch_queue)queue;
- (float)continuityTimeoutWindowInSec;
- (void)_deliverRecognitionCompletionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)_handleContinuityDetectorTimeout;
- (void)_notifyContinuityEnd;
- (void)_setupContinuityDetectorTimer;
- (void)addContinuityDetectionReceiver:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)configureTimeout:(float)a3;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didGenerateTRPDetector:(id)a3;
- (void)didReceiveTRPCandidateExecutionReady:(id)a3 withTrpId:(id)a4;
- (void)setCachedRecognitionCompletionInfo:(id)a3;
- (void)setCachedTRPId:(id)a3;
- (void)setConfigureContinuityWindowTimeout:(BOOL)a3;
- (void)setContinuityDetectionReceivers:(id)a3;
- (void)setContinuityDetectorTimer:(id)a3;
- (void)setContinuityEndDelivered:(BOOL)a3;
- (void)setContinuityEndDeliveryNeeded:(BOOL)a3;
- (void)setContinuityTimeoutWindowInSec:(float)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setUpWithContinuityEndUsage:(BOOL)a3;
- (void)start;
@end

@implementation CSAttSiriContinuityEndDetector

- (CSAttSiriContinuityEndDetector)init
{
  if ((+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled") & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___CSAttSiriContinuityEndDetector;
    v3 = -[CSAttSiriContinuityEndDetector init](&v17, "init");
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("CSAttSiriContinuityEndDetector queue", 0LL);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

      v3->_continuityEndDeliveryNeeded = 0;
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      continuityDetectionReceivers = v3->_continuityDetectionReceivers;
      v3->_continuityDetectionReceivers = (NSHashTable *)v6;

      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      recognitionTaskCompletionReceivers = v3->_recognitionTaskCompletionReceivers;
      v3->_recognitionTaskCompletionReceivers = (NSHashTable *)v8;

      cachedRecognitionCompletionInfo = v3->_cachedRecognitionCompletionInfo;
      v3->_cachedRecognitionCompletionInfo = 0LL;

      v3->_continuityEndDelivered = 0;
      requestId = v3->_requestId;
      v3->_requestId = 0LL;

      cachedTRPId = v3->_cachedTRPId;
      v3->_cachedTRPId = 0LL;

      v3->_configureContinuityWindowTimeout = 0;
    }

    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAttSiriContinuityEndDetector init]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }

    self = v3;
    v14 = self;
  }

  else
  {
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAttSiriContinuityEndDetector init]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Medoc feature flag is disabled!",  buf,  0xCu);
    }

    v14 = 0LL;
  }

  return v14;
}

- (void)configureTimeout:(float)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100143D58;
  v4[3] = &unk_10022E8F8;
  float v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100143C84;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setUpWithContinuityEndUsage:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100143B68;
  v4[3] = &unk_10022EFA8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)addContinuityDetectionReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContinuityEndDetector queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100143AE0;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContinuityEndDetector queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100143A58;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_setupContinuityDetectorTimer
{
  continuityDetectorTimer = self->_continuityDetectorTimer;
  if (continuityDetectorTimer)
  {
    -[CSAttSiriTimer cancelTimer](continuityDetectorTimer, "cancelTimer");
    id v4 = self->_continuityDetectorTimer;
    self->_continuityDetectorTimer = 0LL;
  }

  objc_initWeak(&location, self);
  BOOL v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double continuityTimeoutWindowInSec = self->_continuityTimeoutWindowInSec;
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSAttSiriContinuityEndDetector _setupContinuityDetectorTimer]";
    __int16 v14 = 2048;
    double v15 = continuityTimeoutWindowInSec;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Setup continuity timer for duration %f secs",  buf,  0x16u);
  }

  v7 = self->_continuityDetectorTimer;
  float v8 = self->_continuityTimeoutWindowInSec;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10014399C;
  v9[3] = &unk_10022E920;
  objc_copyWeak(&v10, &location);
  -[CSAttSiriTimer setTimerForSecs:completionBlock:](v7, "setTimerForSecs:completionBlock:", v9, v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleContinuityDetectorTimeout
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContinuityEndDetector queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSAttSiriContinuityEndDetector _notifyContinuityEnd](self, "_notifyContinuityEnd");
}

- (void)_notifyContinuityEnd
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2050000000LL;
  v3 = (void *)qword_100280210;
  uint64_t v27 = qword_100280210;
  if (!qword_100280210)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100143898;
    v23[3] = &unk_10022E990;
    v23[4] = &v24;
    sub_100143898((uint64_t)v23);
    v3 = (void *)v25[3];
  }

  id v4 = v3;
  _Block_object_dispose(&v24, 8);
  id v5 = objc_alloc(v4);
  uint64_t v6 = mach_continuous_time();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriContinuityEndDetector cachedTRPId](self, "cachedTRPId"));
  id v8 = [v5 initWithGeneratedHostTime:v6 lastTRPCandidateId:v7 requestId:self->_requestId];

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriContinuityEndDetector continuityDetectionReceivers]( self,  "continuityDetectionReceivers",  0LL));
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "didGenerateContinuityEnd:") & 1) != 0) {
          [v13 didGenerateContinuityEnd:v8];
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }

    while (v10);
  }

  self->_continuityEndDelivered = 1;
  cachedRecognitionCompletionInfo = self->_cachedRecognitionCompletionInfo;
  if (cachedRecognitionCompletionInfo)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriRecognitionCompletionCachedInfo statistics]( cachedRecognitionCompletionInfo,  "statistics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriRecognitionCompletionCachedInfo requestId]( self->_cachedRecognitionCompletionInfo,  "requestId"));
    int64_t v17 = -[CSAttSiriRecognitionCompletionCachedInfo endpointMode]( self->_cachedRecognitionCompletionInfo,  "endpointMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriRecognitionCompletionCachedInfo completionError]( self->_cachedRecognitionCompletionInfo,  "completionError"));
    -[CSAttSiriContinuityEndDetector _deliverRecognitionCompletionWithStatistics:requestId:endpointMode:error:]( self,  "_deliverRecognitionCompletionWithStatistics:requestId:endpointMode:error:",  v15,  v16,  v17,  v18);
  }
}

- (void)_deliverRecognitionCompletionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[CSAttSiriContinuityEndDetector _deliverRecognitionCompletionWithStatistics:requestId:endpointMode:error:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriContinuityEndDetector recognitionTaskCompletionReceivers]( self,  "recognitionTaskCompletionReceivers",  0LL));
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v18);
        if (v19
          && (objc_opt_respondsToSelector( *(void *)(*((void *)&v20 + 1) + 8LL * (void)v18),  "didCompleteRecognitionTaskWithStatistics:requestId:endpointMode:error:") & 1) != 0)
        {
          [v19 didCompleteRecognitionTaskWithStatistics:v10 requestId:v11 endpointMode:a5 error:v12];
        }

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v16);
  }
}

- (void)didGenerateTRPDetector:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_10014382C;
  id v10 = &unk_10022EFD0;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(queue, &v7);
  -[CSAttSiriContinuityEndDetector start](self, "start", v7, v8, v9, v10, v11);
}

- (void)didReceiveTRPCandidateExecutionReady:(id)a3 withTrpId:(id)a4
{
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001435F0;
  block[3] = &unk_10022E968;
  block[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  int64_t v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)continuityEndDeliveryNeeded
{
  return self->_continuityEndDeliveryNeeded;
}

- (void)setContinuityEndDeliveryNeeded:(BOOL)a3
{
  self->_continuityEndDeliveryNeeded = a3;
}

- (CSAttSiriTimer)continuityDetectorTimer
{
  return self->_continuityDetectorTimer;
}

- (void)setContinuityDetectorTimer:(id)a3
{
}

- (float)continuityTimeoutWindowInSec
{
  return self->_continuityTimeoutWindowInSec;
}

- (void)setContinuityTimeoutWindowInSec:(float)a3
{
  self->_double continuityTimeoutWindowInSec = a3;
}

- (BOOL)configureContinuityWindowTimeout
{
  return self->_configureContinuityWindowTimeout;
}

- (void)setConfigureContinuityWindowTimeout:(BOOL)a3
{
  self->_configureContinuityWindowTimeout = a3;
}

- (NSHashTable)continuityDetectionReceivers
{
  return self->_continuityDetectionReceivers;
}

- (void)setContinuityDetectionReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
{
}

- (NSString)cachedTRPId
{
  return self->_cachedTRPId;
}

- (void)setCachedTRPId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (CSAttSiriRecognitionCompletionCachedInfo)cachedRecognitionCompletionInfo
{
  return self->_cachedRecognitionCompletionInfo;
}

- (void)setCachedRecognitionCompletionInfo:(id)a3
{
}

- (BOOL)continuityEndDelivered
{
  return self->_continuityEndDelivered;
}

- (void)setContinuityEndDelivered:(BOOL)a3
{
  self->_continuityEndDelivered = a3;
}

- (void).cxx_destruct
{
}

@end