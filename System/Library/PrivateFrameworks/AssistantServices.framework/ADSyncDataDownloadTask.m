@interface ADSyncDataDownloadTask
+ (Class)_getItemClassForSyncType:(id)a3 withAppId:(id *)a4 forItem:(id)a5;
- (ADServerSyncRequestParams)params;
- (ADSyncDataDownloadTask)initWithParams:(id)a3 usingSyncToken:(id)a4 withDelegate:(id)a5;
- (ADVocabDonationBridge)bridge;
- (NSString)requestAceId;
- (NSString)syncToken;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (double)lastModifiedAt;
- (id)_donateObjects:(id)a3 syncType:(id)a4 assistantId:(id)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7;
- (id)_streamDonateObjects:(id)a3 syncType:(id)a4 itemClass:(Class)a5 appId:(id)a6 assistantId:(id)a7 isFirstBatch:(BOOL)a8 isLastBatch:(BOOL)a9;
- (int64_t)currentBatchNumber;
- (int64_t)downloadAttempt;
- (int64_t)state;
- (void)_cancelRequestTimeout;
- (void)_extendRequestTimeout;
- (void)_handleCommandSuccessResponseCode:(id)a3;
- (void)_performErrorHandling:(id)a3;
- (void)_restart;
- (void)_scheduleRequestTimeoutWithInterval:(double)a3;
- (void)_sendServerSyncDataRequest;
- (void)_timeoutDownloadTask;
- (void)handleCommand:(id)a3;
- (void)setBridge:(id)a3;
- (void)setCurrentBatchNumber:(int64_t)a3;
- (void)setDownloadAttempt:(int64_t)a3;
- (void)setLastModifiedAt:(double)a3;
- (void)setQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSyncToken:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)start;
@end

@implementation ADSyncDataDownloadTask

- (ADSyncDataDownloadTask)initWithParams:(id)a3 usingSyncToken:(id)a4 withDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___ADSyncDataDownloadTask;
  v12 = -[ADSyncDataDownloadTask init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_params, a3);
    objc_storeStrong((id *)&v13->_syncToken, a4);
    v14 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v14, "UUIDString"));
    requestAceId = v13->_requestAceId;
    v13->_requestAceId = (NSString *)v15;

    v13->_state = 1LL;
    *(_OWORD *)&v13->_downloadAttempt = xmmword_1003CA320;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v17 timeIntervalSince1970];
    v13->_lastModifiedAt = v18;

    objc_storeWeak(&qword_1005783D0, v11);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_DEFAULT, 0);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);

    dispatch_queue_t v23 = dispatch_queue_create("ADSyncDataDownloadTask", v22);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v23;
  }

  return v13;
}

- (int64_t)state
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002D330C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)requestAceId
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1002D32E0;
  id v10 = sub_1002D32F0;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002D32F8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D31A0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_restart
{
  int64_t downloadAttempt = self->_downloadAttempt;
  int64_t v4 = downloadAttempt + 1;
  self->_int64_t downloadAttempt = downloadAttempt + 1;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (downloadAttempt < 3)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      params = self->_params;
      int64_t state = self->_state;
      int v14 = 136315907;
      uint64_t v15 = "-[ADSyncDataDownloadTask _restart]";
      __int16 v16 = 2113;
      v17 = params;
      __int16 v18 = 2048;
      int64_t v19 = state;
      __int16 v20 = 2048;
      int64_t v21 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Restarting download for %{private}@ currently in state: %zd, attempt number: %zd",  (uint8_t *)&v14,  0x2Au);
    }

    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8, "UUIDString"));
    requestAceId = self->_requestAceId;
    self->_requestAceId = v9;

    -[ADSyncDataDownloadTask _sendServerSyncDataRequest](self, "_sendServerSyncDataRequest");
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v11 = self->_params;
      int v14 = 136315395;
      uint64_t v15 = "-[ADSyncDataDownloadTask _restart]";
      __int16 v16 = 2113;
      v17 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Cancelling download task for %{private}@ as max number of retries reached",  (uint8_t *)&v14,  0x16u);
    }

    self->_int64_t state = 8LL;
    uint64_t v6 = -[ADSyncDataDownloadTaskResult initWithState:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTaskResult),  "initWithState:",  self->_state);
    -[ADSyncDataDownloadTask _cancelRequestTimeout](self, "_cancelRequestTimeout");
    id WeakRetained = objc_loadWeakRetained(&qword_1005783D0);
    [WeakRetained syncDownloadTask:self endedWithResult:v6];
  }

- (void)_sendServerSyncDataRequest
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    params = self->_params;
    *(_DWORD *)buf = 136315395;
    v25 = "-[ADSyncDataDownloadTask _sendServerSyncDataRequest]";
    __int16 v26 = 2113;
    v27 = params;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s Sending request for %{private}@",  buf,  0x16u);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___SASyncServerSyncDataRequest);
  [v4 setAceId:self->_requestAceId];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams assistantId](self->_params, "assistantId"));
  [v4 setAssistantId:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
  [v4 setSyncType:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams clientGeneration](self->_params, "clientGeneration"));
  [v4 setClientGeneration:v7];

  [v4 setSyncToken:self->_syncToken];
  requestAceId = self->_requestAceId;
  int64_t v9 = -[ADServerSyncRequestParams triggerType](self->_params, "triggerType");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
  +[ADMUXReverseSyncInstrumentationUtil logSiriVocabDataDownloadTriggeredRequestId:triggerType:syncType:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "logSiriVocabDataDownloadTriggeredRequestId:triggerType:syncType:",  requestAceId,  v9,  v10);

  os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextMUXReverseSync);
  v12 = (os_log_s *)AFSiriLogContextMUXReverseSync;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "MUXReverseSyncDownloadEvent",  (const char *)&unk_1004B87EF,  buf,  2u);
  }

  self->syncDownloadEventSignpost = v11;
  objc_initWeak((id *)buf, self);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  __int16 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int16 v20 = sub_1002D2E48;
  int64_t v21 = &unk_1004FA7E8;
  objc_copyWeak(&v23, (id *)buf);
  v22 = self;
  [v14 handleCommand:v4 completion:&v18];

  self->_int64_t state = 2LL;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v18, v19, v20, v21));
  [v15 timeIntervalSince1970];
  self->_lastModifiedAt = v16;

  -[ADSyncDataDownloadTask _scheduleRequestTimeoutWithInterval:](self, "_scheduleRequestTimeoutWithInterval:", 30.0);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002D204C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleCommandSuccessResponseCode:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataBatch]);
  id v6 = [v5 count];
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_17:
    v27 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    v28 = v27;
    os_signpost_id_t syncDownloadEventSignpost = self->syncDownloadEventSignpost;
    if (syncDownloadEventSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
      *(_DWORD *)buf = 138543618;
      v36 = @"MUXReverseSyncDownloadSuccess";
      __int16 v37 = 2114;
      id v38 = v30;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  syncDownloadEventSignpost,  "MUXReverseSyncDownloadEvent",  "ADMUXReverseSyncDownloadStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{pub lic,signpost.telemetry:string2}@ ",  buf,  0x16u);
    }

    self->_int64_t state = 5LL;
    -[ADSyncDataDownloadTask _cancelRequestTimeout](self, "_cancelRequestTimeout");
    v12 = -[ADSyncDataDownloadTaskResult initWithState:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTaskResult),  "initWithState:",  self->_state);
    goto LABEL_21;
  }

  *(_DWORD *)buf = 136315394;
  v36 = (const __CFString *)"-[ADSyncDataDownloadTask _handleCommandSuccessResponseCode:]";
  __int16 v37 = 2048;
  id v38 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Received data batch of size=%ld",  buf,  0x16u);
  if (!v6) {
    goto LABEL_17;
  }
LABEL_3:
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serverGeneration]);

  if (!v8)
  {
    NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response has empty server generation which is unexpected. Sync requestId: %@",  v18));
    v34 = v19;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    v12 = (ADSyncDataDownloadTaskResult *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADSyncDataDownloadTaskError",  2LL,  v20));

    -[ADSyncDataDownloadTask _performErrorHandling:](self, "_performErrorHandling:", v12);
    int64_t v21 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    id WeakRetained = v21;
    os_signpost_id_t v23 = self->syncDownloadEventSignpost;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
      *(_DWORD *)buf = 138543618;
      v36 = @"MUXReverseSyncUnexpectedFailure";
      __int16 v37 = 2114;
      id v38 = v24;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_SIGNPOST_INTERVAL_END,  v23,  "MUXReverseSyncDownloadEvent",  "ADMUXReverseSyncDownloadStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{pub lic,signpost.telemetry:string2}@ ",  buf,  0x16u);
    }

    goto LABEL_22;
  }

  -[ADSyncDataDownloadTask _extendRequestTimeout](self, "_extendRequestTimeout");
  id v9 = (id)(self->_currentBatchNumber + 1);
  if (v9 != [v4 batchNumber])
  {
    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Current batch number does not match expected batch number"));
    v32 = v25;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v12 = (ADSyncDataDownloadTaskResult *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADSyncDataDownloadTaskError",  1LL,  v26));

    goto LABEL_15;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 syncType]);
  os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
  v12 = (ADSyncDataDownloadTaskResult *)objc_claimAutoreleasedReturnValue( -[ADSyncDataDownloadTask _donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:]( self,  "_donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:",  v5,  v10,  v11,  [v4 batchNumber] == 0,  objc_msgSend(v4, "lastBatch")));

  if (v12)
  {
LABEL_15:
    -[ADSyncDataDownloadTask _performErrorHandling:](self, "_performErrorHandling:", v12);
LABEL_23:

    goto LABEL_24;
  }

  self->_currentBatchNumber = (int64_t)[v4 batchNumber];
  if ([v4 lastBatch])
  {
    v13 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    int v14 = v13;
    os_signpost_id_t v15 = self->syncDownloadEventSignpost;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
      *(_DWORD *)buf = 138543618;
      v36 = @"MUXReverseSyncDownloadSuccess";
      __int16 v37 = 2114;
      id v38 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_END,  v15,  "MUXReverseSyncDownloadEvent",  "ADMUXReverseSyncDownloadStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{pub lic,signpost.telemetry:string2}@ ",  buf,  0x16u);
    }

    -[ADSyncDataDownloadTask _cancelRequestTimeout](self, "_cancelRequestTimeout");
    self->_int64_t state = 5LL;
    v12 = -[ADSyncDataDownloadTaskResult initWithState:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTaskResult),  "initWithState:",  self->_state);
    -[ADSyncDataDownloadTaskResult setBatchSize:](v12, "setBatchSize:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 serverGeneration]);
    -[ADSyncDataDownloadTaskResult setServerGeneration:](v12, "setServerGeneration:", v17);

LABEL_21:
    id WeakRetained = (os_log_s *)objc_loadWeakRetained(&qword_1005783D0);
    -[os_log_s syncDownloadTask:endedWithResult:](WeakRetained, "syncDownloadTask:endedWithResult:", self, v12);
LABEL_22:

    goto LABEL_23;
  }

- (void)_performErrorHandling:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v8 = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    int v10 = 136315394;
    os_signpost_id_t v11 = "-[ADSyncDataDownloadTask _performErrorHandling:]";
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  self->_int64_t state = 4LL;
  id v6 = -[ADSyncDataDownloadTaskResult initWithState:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTaskResult),  "initWithState:",  self->_state);
  -[ADSyncDataDownloadTaskResult setErrorCode:](v6, "setErrorCode:", [v4 code]);
  -[ADSyncDataDownloadTask _cancelRequestTimeout](self, "_cancelRequestTimeout");
  id WeakRetained = objc_loadWeakRetained(&qword_1005783D0);
  [WeakRetained syncDownloadTask:self endedWithResult:v6];
}

- (void)_timeoutDownloadTask
{
  self->_int64_t state = 7LL;
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    params = self->_params;
    int v7 = 136315395;
    id v8 = "-[ADSyncDataDownloadTask _timeoutDownloadTask]";
    __int16 v9 = 2113;
    int v10 = params;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Download task with params: %{private}@ timed out",  (uint8_t *)&v7,  0x16u);
  }

  id v4 = -[ADSyncDataDownloadTaskResult initWithState:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTaskResult),  "initWithState:",  self->_state);
  id WeakRetained = objc_loadWeakRetained(&qword_1005783D0);
  [WeakRetained syncDownloadTask:self endedWithResult:v4];
}

- (id)_donateObjects:(id)a3 syncType:(id)a4 assistantId:(id)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v45 = 0LL;
  os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  double v16 = +[ADSyncDataDownloadTask _getItemClassForSyncType:withAppId:forItem:]( &OBJC_CLASS___ADSyncDataDownloadTask,  "_getItemClassForSyncType:withAppId:forItem:",  v13,  &v45,  v15);
  id v17 = v45;

  __int16 v18 = (void *)AFSiriLogContextDaemon;
  if (v16)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      params = self->_params;
      v41 = v18;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams sharedUserId](params, "sharedUserId"));
      *(_DWORD *)buf = 136315650;
      v49 = (const __CFString *)"-[ADSyncDataDownloadTask _donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:]";
      __int16 v50 = 2112;
      id v51 = v14;
      __int16 v52 = 2112;
      id v53 = v42;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "%s Initiating donation for assistantId=%@, userId=%@",  buf,  0x20u);
    }

    if (-[objc_class isEqual:](v16, "isEqual:", objc_opt_class(&OBJC_CLASS___SASyncSiriKitAppVocabulary)))
    {
      os_signpost_id_t v19 = os_signpost_id_generate(AFSiriLogContextMUXReverseSync);
      __int16 v20 = (os_log_s *)AFSiriLogContextMUXReverseSync;
      int64_t v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "MUXReverseSyncDonationEvent",  (const char *)&unk_1004B87EF,  buf,  2u);
      }

      self->os_signpost_id_t syncDonationEventSignpost = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams sharedUserId](self->_params, "sharedUserId"));
      id v44 = 0LL;
      +[ADVocabDonationBridge bulkDonate:withAppId:itemClass:forUserId:deviceId:error:]( &OBJC_CLASS___ADVocabDonationBridge,  "bulkDonate:withAppId:itemClass:forUserId:deviceId:error:",  v12,  v17,  v16,  v22,  v14,  &v44);
      id v23 = v44;

      v24 = (os_log_s *)AFSiriLogContextMUXReverseSync;
      v25 = v24;
      os_signpost_id_t syncDonationEventSignpost = self->syncDonationEventSignpost;
      if (syncDonationEventSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
        *(_DWORD *)buf = 138543618;
        v49 = @"MUXReverseSyncDonationFailureItemsDonation";
        __int16 v50 = 2114;
        id v51 = v27;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  syncDonationEventSignpost,  "MUXReverseSyncDonationEvent",  "ADMUXReverseSyncDonationStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{p ublic,signpost.telemetry:string2}@ ",  buf,  0x16u);
      }

      if (v23) {
        goto LABEL_12;
      }
    }

    else
    {
      LOBYTE(v43) = v7;
      id v23 = (id)objc_claimAutoreleasedReturnValue( -[ADSyncDataDownloadTask _streamDonateObjects:syncType:itemClass:appId:assistantId:isFirstBatch:isLastBatch:]( self,  "_streamDonateObjects:syncType:itemClass:appId:assistantId:isFirstBatch:isLastBatch:",  v12,  v13,  v16,  v17,  v14,  v8,  v43));
      if (v23)
      {
LABEL_12:
        v28 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v49 = (const __CFString *)"-[ADSyncDataDownloadTask _donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:]";
          __int16 v50 = 2112;
          id v51 = v14;
          __int16 v52 = 2112;
          id v53 = v23;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Donation failed for assistantId=%@ with error=%@",  buf,  0x20u);
        }

        +[ADMUXReverseSyncInstrumentationUtil logSyncDataDonationFailedWithReason:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "logSyncDataDonationFailedWithReason:",  v23);
        NSErrorUserInfoKey v46 = NSDebugDescriptionErrorKey;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Donation failed for sync type:%@",  v13));
        v47 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
        NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADSyncDataDownloadTaskError",  9LL,  v30));

        goto LABEL_27;
      }
    }

    if (v7)
    {
      v34 = (os_log_s *)AFSiriLogContextMUXReverseSync;
      v35 = v34;
      os_signpost_id_t v36 = self->syncDonationEventSignpost;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
        *(_DWORD *)buf = 138543618;
        v49 = @"MUXReverseSyncDonationSuccess";
        __int16 v50 = 2114;
        id v51 = v37;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_END,  v36,  "MUXReverseSyncDonationEvent",  "ADMUXReverseSyncDonationStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{p ublic,signpost.telemetry:string2}@ ",  buf,  0x16u);
      }
    }

    id v38 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v49 = (const __CFString *)"-[ADSyncDataDownloadTask _donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:]";
      __int16 v50 = 2112;
      id v51 = v13;
      __int16 v52 = 2112;
      id v53 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "%s Successfully donated objects with syncType=%@, assistantId=%@ to Koa",  buf,  0x20u);
    }

    NSErrorUserInfoKey v31 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v49 = (const __CFString *)"-[ADSyncDataDownloadTask _donateObjects:syncType:assistantId:isFirstBatch:isLastBatch:]";
      __int16 v50 = 2112;
      id v51 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%s Unknown itemClass for syncType=%@",  buf,  0x16u);
    }

    NSErrorUserInfoKey v54 = NSDebugDescriptionErrorKey;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Item class not found for sync type:%@",  v13));
    v55 = v32;
    NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADSyncDataDownloadTaskError",  8LL,  v33));
  }

- (id)_streamDonateObjects:(id)a3 syncType:(id)a4 itemClass:(Class)a5 appId:(id)a6 assistantId:(id)a7 isFirstBatch:(BOOL)a8 isLastBatch:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  __int16 v18 = (os_log_s *)a7;
  if (v9)
  {
    os_signpost_id_t v19 = os_signpost_id_generate(AFSiriLogContextMUXReverseSync);
    __int16 v20 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    int64_t v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "MUXReverseSyncDonationEvent",  (const char *)&unk_1004B87EF,  buf,  2u);
    }

    self->os_signpost_id_t syncDonationEventSignpost = v19;
    v22 = objc_alloc(&OBJC_CLASS___ADVocabDonationBridge);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams sharedUserId](self->_params, "sharedUserId"));
    id v47 = 0LL;
    id v24 = -[ADVocabDonationBridge initForStreamingWithAppId:itemClass:userId:deviceId:error:]( v22,  "initForStreamingWithAppId:itemClass:userId:deviceId:error:",  v17,  a5,  v23,  v18,  &v47);
    v25 = (os_log_s *)v47;

    if (v25)
    {
      __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v51 = (const __CFString *)"-[ADSyncDataDownloadTask _streamDonateObjects:syncType:itemClass:appId:assistantId:isF"
                                  "irstBatch:isLastBatch:]";
        __int16 v52 = 2112;
        id v53 = v18;
        __int16 v54 = 2112;
        v55 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Failed to create ADVocabDonationBridge for assistantId=%@ with error=%@",  buf,  0x20u);
      }

      v27 = (os_log_s *)AFSiriLogContextMUXReverseSync;
      v28 = v27;
      os_signpost_id_t syncDonationEventSignpost = self->syncDonationEventSignpost;
      if (syncDonationEventSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
        *(_DWORD *)buf = 138543618;
        id v51 = @"MUXReverseSyncDonationFailureBridgeCreation";
        __int16 v52 = 2114;
        id v53 = v30;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  syncDonationEventSignpost,  "MUXReverseSyncDonationEvent",  "ADMUXReverseSyncDonationStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{p ublic,signpost.telemetry:string2}@ ",  buf,  0x16u);
      }

      NSErrorUserInfoKey v31 = v25;
      v32 = v31;
      goto LABEL_24;
    }

    -[ADSyncDataDownloadTask setBridge:](self, "setBridge:", v24);
  }

  NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncDataDownloadTask bridge](self, "bridge"));

  if (!v33)
  {
    v39 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v51 = (const __CFString *)"-[ADSyncDataDownloadTask _streamDonateObjects:syncType:itemClass:appId:assistantId:isFir"
                                "stBatch:isLastBatch:]";
      __int16 v52 = 2112;
      id v53 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s ADVocabDonationBridge is nil while servicing a stream donation for assistantId=%@",  buf,  0x16u);
    }

    NSErrorUserInfoKey v48 = NSDebugDescriptionErrorKey;
    NSErrorUserInfoKey v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ADVocabDonationBridge is nil while servicing a stream donation for assistantId:%@",  v18));
    v49 = v31;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADSyncDataDownloadTaskError",  9LL,  v40));

    goto LABEL_24;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncDataDownloadTask bridge](self, "bridge"));
  id v46 = 0LL;
  [v34 addToStream:v15 error:&v46];
  v32 = (os_log_s *)v46;

  if (v32)
  {
    v35 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v51 = (const __CFString *)"-[ADSyncDataDownloadTask _streamDonateObjects:syncType:itemClass:appId:assistantId:isFir"
                                "stBatch:isLastBatch:]";
      __int16 v52 = 2112;
      id v53 = v18;
      __int16 v54 = 2112;
      v55 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Failed to donate for assistantId=%@ with error=%@",  buf,  0x20u);
    }

    os_signpost_id_t v36 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    NSErrorUserInfoKey v31 = v36;
    os_signpost_id_t v37 = self->syncDonationEventSignpost;
    if (v37 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v36)) {
      goto LABEL_24;
    }
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
    *(_DWORD *)buf = 138543618;
    id v51 = @"MUXReverseSyncDonationFailureItemsDonation";
    __int16 v52 = 2114;
    id v53 = v38;
    goto LABEL_20;
  }

  if (!a9)
  {
    v32 = 0LL;
    goto LABEL_25;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncDataDownloadTask bridge](self, "bridge"));
  id v45 = 0LL;
  [v42 finishStream:&v45];
  v32 = (os_log_s *)v45;

  -[ADSyncDataDownloadTask setBridge:](self, "setBridge:", 0LL);
  if (v32)
  {
    uint64_t v43 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v51 = (const __CFString *)"-[ADSyncDataDownloadTask _streamDonateObjects:syncType:itemClass:appId:assistantId:isFir"
                                "stBatch:isLastBatch:]";
      __int16 v52 = 2112;
      id v53 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%s Error=%@ while trying to clean up ADVocabDonationBridge stream",  buf,  0x16u);
    }

    id v44 = (os_log_s *)AFSiriLogContextMUXReverseSync;
    NSErrorUserInfoKey v31 = v44;
    os_signpost_id_t v37 = self->syncDonationEventSignpost;
    if (v37 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
      goto LABEL_24;
    }
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](self->_params, "syncType"));
    *(_DWORD *)buf = 138543618;
    id v51 = @"MUXReverseSyncDonationFailureStreamClosure";
    __int16 v52 = 2114;
    id v53 = v38;
LABEL_20:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v37,  "MUXReverseSyncDonationEvent",  "ADMUXReverseSyncDonationStatusParamName=%{public,signpost.telemetry:string1}@ ADMUXReverseSyncDownloadType=%{publi c,signpost.telemetry:string2}@ ",  buf,  0x16u);

LABEL_24:
  }

- (void)_cancelRequestTimeout
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel((dispatch_source_t)timeoutTimer);
  }
}

- (void)_scheduleRequestTimeoutWithInterval:(double)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (!timeoutTimer)
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    BOOL v7 = self->_timeoutTimer;
    self->_timeoutTimer = v6;

    objc_initWeak(&location, self);
    BOOL v8 = self->_timeoutTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002D2020;
    v10[3] = &unk_1004FAF58;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v8, v10);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    timeoutTimer = self->_timeoutTimer;
  }

  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)timeoutTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

- (void)_extendRequestTimeout
{
}

- (ADServerSyncRequestParams)params
{
  return self->_params;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (int64_t)downloadAttempt
{
  return self->_downloadAttempt;
}

- (void)setDownloadAttempt:(int64_t)a3
{
  self->_int64_t downloadAttempt = a3;
}

- (int64_t)currentBatchNumber
{
  return self->_currentBatchNumber;
}

- (void)setCurrentBatchNumber:(int64_t)a3
{
  self->_currentBatchNumber = a3;
}

- (double)lastModifiedAt
{
  return self->_lastModifiedAt;
}

- (void)setLastModifiedAt:(double)a3
{
  self->_lastModifiedAt = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (ADVocabDonationBridge)bridge
{
  return self->_bridge;
}

- (void)setBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)_getItemClassForSyncType:(id)a3 withAppId:(id *)a4 forItem:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqualToString:SASyncSyncTypeContactsValue])
  {
    id v9 = CKVAppIdContacts;
    int v10 = &OBJC_CLASS___SAPerson_ptr;
  }

  else if ([v7 isEqualToString:SASyncSyncTypeAppInfoValue])
  {
    id v9 = CKVAppIdApplications;
    int v10 = &OBJC_CLASS___SAAppInfo_ptr;
  }

  else
  {
    if (![v7 isEqualToString:SASyncSyncTypeAppCustomVocabValue])
    {
      id v12 = 0LL;
      goto LABEL_8;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue([v8 bundleId]);
    int v10 = &OBJC_CLASS___SASyncSiriKitAppVocabulary_ptr;
  }

  *a4 = v9;
  uint64_t v11 = objc_opt_class(*v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_8:

  return (Class)v12;
}

@end