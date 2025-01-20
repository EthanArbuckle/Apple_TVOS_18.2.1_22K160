@interface ADAnalyticsStore
- (ADAnalyticsStore)initWithPath:(id)a3;
- (BOOL)_deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 error:(id *)a7;
- (BOOL)_deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 error:(id *)a6;
- (BOOL)_deleteEventRecordsWithRecordIDs:(id)a3 error:(id *)a4;
- (BOOL)_insertEventRecords:(id)a3 error:(id *)a4;
- (BOOL)_purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 error:(id *)a4;
- (BOOL)_resetForReason:(id)a3 error:(id *)a4;
- (BOOL)_updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 error:(id *)a5;
- (NSString)path;
- (id)_fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 error:(id *)a8;
- (id)_fetchEventRecordsCreatedAfterDate:(id)a3 error:(id *)a4;
- (id)_fetchEventStreamUIDsWithError:(id *)a3;
- (id)_preparedDatabaseWithError:(id *)a3;
- (void)_countQueuedEventRecordsWithCriteria:(id)a3 withCompletion:(id)a4;
- (void)checkpointWithCompletion:(id)a3;
- (void)countQueuedEventRecordsForDeliveryStream:(unint64_t)a3 withCompletion:(id)a4;
- (void)countQueuedEventRecordsWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 completion:(id)a7;
- (void)deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 completion:(id)a6;
- (void)deleteEventRecordsWithRecordIDs:(id)a3 completion:(id)a4;
- (void)fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 completion:(id)a8;
- (void)fetchEventRecords:(unint64_t)a3 eventStreamUID:(id)a4 streamSpeechId:(id)a5 deliveryStream:(unint64_t)a6 completion:(id)a7;
- (void)fetchEventRecordsCreatedAfterDate:(id)a3 completion:(id)a4;
- (void)fetchEventStreamUIDsWithCompletion:(id)a3;
- (void)insertEventRecords:(id)a3 completion:(id)a4;
- (void)purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 completion:(id)a4;
- (void)purgeWithCompletion:(id)a3;
- (void)resetWithCompletion:(id)a3;
- (void)updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 withCompletion:(id)a5;
@end

@implementation ADAnalyticsStore

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAnalyticsStore;
  -[ADAnalyticsStore dealloc](&v3, "dealloc");
}

- (ADAnalyticsStore)initWithPath:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADAnalyticsStore;
  v5 = -[ADAnalyticsStore init](&v17, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringByStandardizingPath]);
    path = v5->_path;
    v5->_path = (NSString *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.assistant.analytics-store", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___ADAnalyticsEventRecordBuilder);
    eventRecordBuilder = v5->_eventRecordBuilder;
    v5->_eventRecordBuilder = v14;
  }

  return v5;
}

- (void)insertEventRecords:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013ABE8;
  v11[3] = &unk_1004FD9E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 scheduleUnlockedWork:v11];
}

- (void)fetchEventStreamUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013AB68;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AADC;
  block[3] = &unk_1004F2B28;
  unint64_t v25 = a3;
  unint64_t v26 = a4;
  block[4] = self;
  id v22 = v14;
  unint64_t v27 = a7;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(queue, block);
}

- (void)fetchEventRecords:(unint64_t)a3 eventStreamUID:(id)a4 streamSpeechId:(id)a5 deliveryStream:(unint64_t)a6 completion:(id)a7
{
}

- (void)deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10013AA5C;
  v19[3] = &unk_1004FC330;
  unint64_t v23 = a3;
  unint64_t v24 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (void)deleteEventRecordsWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADAnalyticsStore deleteEventRecordsWithRecordIDs:completion:]";
    __int16 v18 = 2048;
    id v19 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Will delete %lu records", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A9E4;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

- (void)deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A96C;
  block[3] = &unk_1004FB3F8;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADAnalyticsStore purgeDeletedEventRecordsBeforeOrEqualToDate:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Purging deleted records before date %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A900;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)fetchEventRecordsCreatedAfterDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A880;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)purgeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsStore purgeWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Purging data from analytics store (%@)...",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013A50C;
  v9[3] = &unk_1004FD990;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsStore resetWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Resetting analytics store (%@)...", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013A404;
  v9[3] = &unk_1004FD990;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)checkpointWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsStore checkpointWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Checkpointing write-ahead log (%@)...",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013A28C;
  v9[3] = &unk_1004FD990;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 scheduleUnlockedWork:v9];
}

- (void)updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[ADAnalyticsStore updateRecordsWithSpeechId:toUpdatedSpeechId:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Updating records with speechId value (%@) to (%@)",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10013A220;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

- (BOOL)_resetForReason:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  if (a4) {
    *a4 = 0LL;
  }
  database = self->_database;
  if (database)
  {
    id v34 = 0LL;
    unsigned __int8 v8 = -[SiriCoreSQLiteDatabase closeWithError:](database, "closeWithError:", &v34);
    id v9 = v34;
    if ((v8 & 1) == 0)
    {
      id v10 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315650;
        v39 = "-[ADAnalyticsStore _resetForReason:error:]";
        __int16 v40 = 2112;
        v41 = path;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to close database (%@) due to %@.",  buf,  0x20u);
      }
    }

    id v11 = self->_database;
    self->_database = 0LL;
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v12 = mach_absolute_time();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v14 = [v13 fileExistsAtPath:self->_path];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = self->_path;
    id v33 = 0LL;
    unsigned __int8 v17 = [v15 removeItemAtPath:v16 error:&v33];
    id v18 = v33;

    if ((v17 & 1) == 0)
    {
      id v19 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        id v20 = self->_path;
        *(_DWORD *)buf = 136315650;
        v39 = "-[ADAnalyticsStore _resetForReason:error:]";
        __int16 v40 = 2112;
        v41 = v20;
        __int16 v42 = 2112;
        id v43 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Failed to remove database (%@) due to %@.",  buf,  0x20u);
      }
    }
  }

  else
  {
    id v18 = 0LL;
  }

  if (v9) {
    id v21 = v9;
  }
  else {
    id v21 = v18;
  }
  if (a4) {
    *a4 = v21;
  }
  if (v6) {
    __int16 v22 = v6;
  }
  else {
    __int16 v22 = @"unknown";
  }
  v35 = @"reason";
  v36 = v22;
  id v23 = v21;
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  v37[0] = v24;
  uint64_t v25 = AFAnalyticsContextCreateWithError(v23);
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v37[1] = v26;
  unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  uint64_t v28 = AFAnalyticsContextsMerge();
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v30 logEventWithType:4306 machAbsoluteTime:v12 context:v29];

  return v23 == 0LL;
}

- (id)_preparedDatabaseWithError:(id *)a3
{
  objc_super v3 = self;
  if (a3) {
    *a3 = 0LL;
  }
  database = self->_database;
  if (database) {
    goto LABEL_4;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v7 = [v6 lastKnownAnalyticsStoreState];

  unsigned __int8 v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v9 logEventWithType:4301 context:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v11 = [v10 fileExistsAtPath:v3->_path];

    id v12 = 0LL;
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      path = v3->_path;
      id v172 = 0LL;
      unsigned __int8 v15 = [v13 removeItemAtPath:path error:&v172];
      id v12 = v172;

      if ((v15 & 1) == 0)
      {
        id v16 = (os_log_s *)AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v17 = (const __CFString *)v3->_path;
          *(_DWORD *)buf = 136315650;
          v195 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
          __int16 v196 = 2112;
          v197 = v17;
          __int16 v198 = 2112;
          uint64_t v199 = (uint64_t)v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to remove database at path %@ due to %@.",  buf,  0x20u);
        }
      }
    }
  }

  else
  {
    id v12 = 0LL;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v18 setLastKnownAnalyticsStoreState:1];

  id v19 = 0LL;
  id v20 = 0LL;
  v151 = v3;
  do
  {
    id v21 = v19;
    id v19 = -[SiriCoreSQLiteDatabase initWithPath:dataProtectionClass:options:]( objc_alloc(&OBJC_CLASS___SiriCoreSQLiteDatabase),  "initWithPath:dataProtectionClass:options:",  v3->_path,  2LL,  3LL);

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v8[489] defaultManager]);
    unsigned __int8 v23 = [v22 fileExistsAtPath:v3->_path];

    id v171 = 0LL;
    unsigned int v24 = -[SiriCoreSQLiteDatabase openWithError:](v19, "openWithError:", &v171);
    id v25 = v171;
    if (!v24)
    {
      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      uint64_t v28 = AFAnalyticsContextCreateWithError(v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v206[0] = v29;
      v204 = @"retryCount";
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20));
      v205 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v205,  &v204,  1LL));
      v206[1] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v206, 2LL));
      uint64_t v33 = AFAnalyticsContextsMerge();
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      [v27 logEventWithType:4302 context:v34];

      objc_super v3 = v151;
      v35 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        v60 = v151->_path;
        *(_DWORD *)buf = 136316162;
        v195 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
        __int16 v196 = 2048;
        v197 = v20;
        __int16 v198 = 2048;
        uint64_t v199 = 3LL;
        __int16 v200 = 2112;
        v201 = (__CFString *)v60;
        __int16 v202 = 2112;
        id v203 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Failed to open analytics database (retry %tu/%tu) at path %@ with error %@.",  buf,  0x34u);
        if (v25) {
          goto LABEL_21;
        }
        goto LABEL_18;
      }

- (BOOL)_insertEventRecords:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v43 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v43));
  id v8 = v43;
  id v9 = v8;
  if (!v7)
  {
    if (!a4)
    {
      BOOL v28 = 0;
      goto LABEL_40;
    }

    goto LABEL_36;
  }

  id v42 = v8;
  unsigned __int8 v10 = [v7 beginTransactionWithError:&v42];
  id v11 = v42;

  if ((v10 & 1) == 0)
  {
    v29 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Failed to begin database transaction due to error %@",  buf,  0x16u);
      if (a4) {
        goto LABEL_35;
      }
    }

    else if (a4)
    {
LABEL_35:
      id v8 = v11;
LABEL_36:
      id v9 = v8;
      BOOL v28 = 0;
      *a4 = v9;
      goto LABEL_40;
    }

    BOOL v28 = 0;
    id v9 = v11;
    goto LABEL_40;
  }

  v31 = v11;
  id v32 = v6;
  id v12 = [v6 mutableCopy];
  if ([v12 count])
  {
    uint64_t v33 = v12;
    do
    {
      context = objc_autoreleasePoolPush();
      if ((unint64_t)[v12 count] >= 0x11)
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", 0, 16));
        objc_msgSend(v12, "removeObjectsInRange:", 0, 16);
      }

      else
      {
        id v13 = [v12 copy];
        [v12 removeAllObjects];
      }

      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          id v18 = 0LL;
          do
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v18);
            id v37 = 0LL;
            unsigned __int8 v20 = [v7 insertIntoTableWithName:@"events" record:v19 error:&v37];
            id v21 = v37;
            if ((v20 & 1) == 0)
            {
              __int16 v22 = (os_log_s *)AFSiriLogContextAnalytics;
              if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
                __int16 v46 = 2112;
                id v47 = v19;
                __int16 v48 = 2112;
                v49 = @"events";
                __int16 v50 = 2112;
                id v51 = v21;
                _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Failed to insert event record %@ into %@ table due to error %@",  buf,  0x2Au);
              }
            }

            id v18 = (char *)v18 + 1;
          }

          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }

        while (v16);
      }

      objc_autoreleasePoolPop(context);
      id v12 = v33;
    }

    while ([v33 count]);
  }

  id v36 = v31;
  unsigned __int8 v23 = [v7 commitTransactionWithError:&v36];
  id v9 = v36;

  if ((v23 & 1) == 0)
  {
    unsigned int v24 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
      __int16 v46 = 2112;
      id v47 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Failed to commit database transaction due to error %@",  buf,  0x16u);
    }

    id v35 = 0LL;
    unsigned __int8 v25 = [v7 rollbackTransactionWithError:&v35];
    id v26 = v35;
    if ((v25 & 1) == 0)
    {
      unint64_t v27 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
        __int16 v46 = 2112;
        id v47 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to rollback database transaction due to error %@",  buf,  0x16u);
      }
    }
  }

  if (a4) {
    *a4 = v9;
  }
  BOOL v28 = v9 == 0LL;

  id v6 = v32;
LABEL_40:

  return v28;
}

- (BOOL)_deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  if (a7) {
    *a7 = 0LL;
  }
  id v36 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v36));
  id v15 = v36;
  id v16 = v15;
  if (v14)
  {
    id v32 = v14;
    id v33 = v13;
    if (v13) {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"assistant_id",  v13,  0LL));
    }
    else {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isNullQueryCriterionWithColumnName:negation:",  @"assistant_id",  0LL));
    }
    unsigned __int8 v20 = (void *)v17;
    id v34 = v12;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"stream_uid",  v12,  0LL));
    v43[0] = v21;
    v43[1] = v20;
    v31 = v20;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"delivery_stream",  v22,  0LL));
    v43[2] = v23;
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "lessThanOrEqualToQueryCriterionWithColumnName:value:",  @"timestamp",  v24));
    v43[3] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 4LL));
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v26));

    __int128 v41 = @"status";
    id v42 = &off_100513300;
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    id v35 = v16;
    id v14 = v32;
    unsigned __int8 v19 = [v32 updateTableWithName:@"events" valueMap:v28 criterion:v27 error:&v35];
    id v18 = v35;

    if ((v19 & 1) != 0) {
      goto LABEL_13;
    }
    v29 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v38 = "-[ADAnalyticsStore _deleteEventRecordsBeforeOrEqualToTimestamp:deliveryStream:eventStreamUID:streamSpeechId:error:]";
      __int16 v39 = 2112;
      id v40 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Failed to update database records with deleted state due to error %@",  buf,  0x16u);
      if (!a7) {
        goto LABEL_13;
      }
    }

    else if (!a7)
    {
LABEL_13:

      id v13 = v33;
      id v12 = v34;
      goto LABEL_14;
    }

    *a7 = v18;
    goto LABEL_13;
  }

  if (a7)
  {
    id v18 = v15;
    unsigned __int8 v19 = 0;
    *a7 = v18;
  }

  else
  {
    unsigned __int8 v19 = 0;
    id v18 = v15;
  }

- (BOOL)_deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  if (a6) {
    *a6 = 0LL;
  }
  id v29 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v29));
  id v12 = v29;
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"stream_uid",  v10,  0LL));
    id v15 = (void *)v14;
    if (!a3 || a4)
    {
      v36[0] = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      id v27 = v10;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "greaterThanOrEqualToQueryCriterionWithColumnName:value:",  @"timestamp",  v16));
      v36[1] = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "lessThanOrEqualToQueryCriterionWithColumnName:value:",  @"timestamp",  v18));
      v36[2] = v22;
      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 3LL));
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v23));

      id v10 = v27;
    }

    else
    {
      v37[0] = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "greaterThanOrEqualToQueryCriterionWithColumnName:value:",  @"timestamp",  v16));
      v37[1] = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v18));
    }

    id v34 = @"status";
    id v35 = &off_100513300;
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v28 = v13;
    unsigned __int8 v21 = [v11 updateTableWithName:@"events" valueMap:v24 criterion:v19 error:&v28];
    id v20 = v28;

    if ((v21 & 1) != 0) {
      goto LABEL_14;
    }
    unsigned __int8 v25 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[ADAnalyticsStore _deleteEventRecordsFromStartTime:toEndTime:eventStreamUID:error:]";
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Failed to update database records with deleted state due to error %@",  buf,  0x16u);
      if (!a6) {
        goto LABEL_14;
      }
    }

    else if (!a6)
    {
LABEL_14:

      goto LABEL_15;
    }

    *a6 = v20;
    goto LABEL_14;
  }

  if (a6)
  {
    id v20 = v12;
    unsigned __int8 v21 = 0;
    *a6 = v20;
  }

  else
  {
    unsigned __int8 v21 = 0;
    id v20 = v12;
  }

- (BOOL)_deleteEventRecordsWithRecordIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    if (![v6 count]) {
      goto LABEL_18;
    }
LABEL_5:
    id v32 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v32));
    id v9 = v32;
    if (!v8)
    {
      if (a4)
      {
        id v20 = v9;
        unsigned __int8 v19 = 0;
        *a4 = v20;
      }

      else
      {
        unsigned __int8 v19 = 0;
        id v20 = v9;
      }

      goto LABEL_22;
    }

    unsigned __int8 v25 = v9;
    id v26 = v8;
    id v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"record_id",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i),  0LL));
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }

        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }

      while (v13);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion orQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "orQueryCriterionWithSubcriteria:",  v10));
    __int16 v39 = @"status";
    id v40 = &off_100513300;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    id v8 = v26;
    id v27 = v25;
    unsigned __int8 v19 = [v26 updateTableWithName:@"events" valueMap:v18 criterion:v17 error:&v27];
    id v20 = v27;

    if ((v19 & 1) == 0)
    {
      unsigned __int8 v21 = (void *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v23 = v21;
        id v24 = -[NSMutableArray count](v10, "count");
        *(_DWORD *)buf = 136315650;
        id v34 = "-[ADAnalyticsStore _deleteEventRecordsWithRecordIDs:error:]";
        __int16 v35 = 2048;
        id v36 = v24;
        __int16 v37 = 2112;
        id v38 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Failed to update %lu database records with deleted state due to error %@",  buf,  0x20u);

        if (!a4) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }

      if (a4) {
LABEL_16:
      }
        *a4 = v20;
    }

- (BOOL)_purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v20 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v20));
  id v8 = v20;
  id v9 = v8;
  if (v7)
  {
    [v6 timeIntervalSince1970];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "lessThanOrEqualToQueryCriterionWithColumnName:value:",  @"date_created",  v10));
    v25[0] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"status",  &off_100513300,  0LL));
    v25[1] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v13));

    id v19 = v9;
    unsigned __int8 v15 = [v7 deleteFromTableWithName:@"events" indexedBy:@"events_index_date_created_status" criterion:v14 error:&v19];
    id v16 = v19;

    if ((v15 & 1) == 0)
    {
      uint64_t v17 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v22 = "-[ADAnalyticsStore _purgeDeletedEventRecordsBeforeOrEqualToDate:error:]";
        __int16 v23 = 2112;
        id v24 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to purge database records with deleted state due to error %@",  buf,  0x16u);
        if (!a4) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }

      if (a4) {
LABEL_7:
      }
        *a4 = v16;
    }

- (id)_fetchEventStreamUIDsWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  id v32 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v32));
  id v5 = v32;
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"status",  &off_1005132E8,  0LL));
    v38[0] = @"stream_uid";
    v38[1] = @"assistant_id";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
    id v31 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 selectValueTuplesFromTableWithName:@"events" columnNames:v8 behavior:1 indexedBy:@"events_index_covering_status_stream_uid" criterion:v7 order:0 range:0 error:&v31]);
    id v10 = v31;

    if (!v10)
    {
      unsigned __int8 v25 = v7;
      id v26 = v4;
      id v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v13 = v9;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "siriCoreSQLiteValue_toString"));

            unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:1]);
            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "siriCoreSQLiteValue_toString"));

            if (v20)
            {
              __int16 v23 = objc_alloc_init(&OBJC_CLASS___ADAnalyticsCompositeStreamId);
              -[ADAnalyticsCompositeStreamId setStreamUID:](v23, "setStreamUID:", v20);
              -[ADAnalyticsCompositeStreamId setSpeechId:](v23, "setSpeechId:", v22);
              -[NSMutableArray addObject:](v12, "addObject:", v23);
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }

        while (v15);
      }

      id v7 = v25;
      id v4 = v26;
      goto LABEL_23;
    }

    id v11 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v35 = "-[ADAnalyticsStore _fetchEventStreamUIDsWithError:]";
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to select database records due to error %@",  buf,  0x16u);
      if (a3) {
        goto LABEL_7;
      }
    }

    else if (a3)
    {
LABEL_7:
      id v12 = 0LL;
      *a3 = v10;
LABEL_23:

      goto LABEL_24;
    }

    id v12 = 0LL;
    goto LABEL_23;
  }

  if (a3)
  {
    id v10 = v5;
    id v12 = 0LL;
    *a3 = v10;
  }

  else
  {
    id v12 = 0LL;
    id v10 = v5;
  }

- (id)_fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 error:(id *)a8
{
  id v14 = a5;
  id v15 = a6;
  if (a8) {
    *a8 = 0LL;
  }
  id v46 = 0LL;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v46));
  id v17 = v46;
  if (v16)
  {
    id v40 = v17;
    id v42 = v16;
    id v43 = v15;
    unint64_t v39 = a3;
    if (v15) {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"assistant_id",  v15,  0LL));
    }
    else {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isNullQueryCriterionWithColumnName:negation:",  @"assistant_id",  0LL));
    }
    unsigned __int8 v21 = (void *)v18;
    id v44 = v14;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"stream_uid",  v14,  0LL));
    v52[0] = v22;
    v52[1] = v21;
    __int128 v41 = v21;
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion greaterThanQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "greaterThanQueryCriterionWithColumnName:value:",  @"timestamp",  v23));
    v52[2] = v24;
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"status",  &off_1005132E8,  0LL));
    v52[3] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a7));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"delivery_stream",  v26,  0LL));
    v52[4] = v27;
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 5LL));
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v28));

    __int128 v30 = (void *)v29;
    id v31 = objc_alloc(&OBJC_CLASS___SiriCoreSQLiteQueryOrder);
    id v51 = @"timestamp";
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
    id v33 = [v31 initWithColumnNames:v32 mode:1];

    id v34 = [[SiriCoreSQLiteQueryRange alloc] initWithLimit:v39];
    eventRecordBuilder = self->_eventRecordBuilder;
    id v45 = v40;
    uint64_t v16 = v42;
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( [v42 selectRecordsFromTableWithName:@"events" columnNames:0 behavior:0 indexedBy:@"events_index_event_batch" criterion:v30 order:v33 range:v34 recordBuilder:eventRecordBuilder error:&v45]);
    id v19 = v45;

    if (v19)
    {
      id v37 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v48 = "-[ADAnalyticsStore _fetchEventRecords:afterTimestamp:eventStreamUID:streamSpeechId:deliveryStream:error:]";
        __int16 v49 = 2112;
        id v50 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s Failed to select database records due to error %@",  buf,  0x16u);
      }

      id v15 = v43;
      id v14 = v44;
      id v20 = 0LL;
      if (a8) {
        *a8 = v19;
      }
    }

    else
    {
      id v20 = v36;
      id v15 = v43;
      id v14 = v44;
    }
  }

  else if (a8)
  {
    id v19 = v17;
    id v20 = 0LL;
    *a8 = v19;
  }

  else
  {
    id v20 = 0LL;
    id v19 = v17;
  }

  return v20;
}

- (id)_fetchEventRecordsCreatedAfterDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v25 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v25));
  id v8 = v25;
  id v9 = v8;
  if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"status",  &off_1005132E8,  0LL));
    if (v6)
    {
      [v6 timeIntervalSince1970];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:value:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "greaterThanOrEqualToQueryCriterionWithColumnName:value:",  @"date_created",  v11));
      v31[0] = v12;
      v31[1] = v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "andQueryCriterionWithSubcriteria:",  v13));

      id v10 = (void *)v14;
    }

    id v15 = objc_alloc(&OBJC_CLASS___SiriCoreSQLiteQueryOrder);
    v30[0] = @"stream_uid";
    v30[1] = @"timestamp";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    id v17 = [v15 initWithColumnNames:v16 mode:1];

    eventRecordBuilder = self->_eventRecordBuilder;
    id v24 = v9;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( [v7 selectRecordsFromTableWithName:@"events" columnNames:0 behavior:0 indexedBy:0 criterion:v10 order:v17 range:0 recordBuilder:eventRecordBuilder error:&v24]);
    id v20 = v24;

    if (!v20)
    {
      id v22 = v19;
      goto LABEL_16;
    }

    unsigned __int8 v21 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v27 = "-[ADAnalyticsStore _fetchEventRecordsCreatedAfterDate:error:]";
      __int16 v28 = 2112;
      id v29 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Failed to select database records due to error %@",  buf,  0x16u);
      if (a4) {
        goto LABEL_9;
      }
    }

    else if (a4)
    {
LABEL_9:
      id v22 = 0LL;
      *a4 = v20;
LABEL_16:

      goto LABEL_17;
    }

    id v22 = 0LL;
    goto LABEL_16;
  }

  if (a4)
  {
    id v20 = v8;
    id v22 = 0LL;
    *a4 = v20;
  }

  else
  {
    id v22 = 0LL;
    id v20 = v8;
  }

- (void)countQueuedEventRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013A124;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)countQueuedEventRecordsForDeliveryStream:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100139FFC;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_countQueuedEventRecordsWithCriteria:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v15 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v15));
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v14 = v9;
    id v11 = [v8 countValuesInTableWithName:@"events" columnName:@"timestamp" behavior:2 indexedBy:0 criterion:v6 range:0 error:&v14];
    id v12 = v14;

    if (v12) {
      id v13 = 0LL;
    }
    else {
      id v13 = v11;
    }
    ((void (**)(id, id, id))v7)[2](v7, v13, v12);
    id v10 = v12;
  }

  else
  {
    v7[2](v7, 0LL, v9);
  }
}

- (BOOL)_updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (a5) {
      *a5 = 0LL;
    }
    id v22 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore _preparedDatabaseWithError:](self, "_preparedDatabaseWithError:", &v22));
    id v11 = v22;
    id v12 = v11;
    if (!v10)
    {
      if (a5)
      {
        id v16 = v11;
        unsigned __int8 v15 = 0;
        *a5 = v16;
      }

      else
      {
        unsigned __int8 v15 = 0;
        id v16 = v11;
      }

      goto LABEL_18;
    }

    if (v8) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"assistant_id",  v8,  0LL));
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isNullQueryCriterionWithColumnName:negation:",  @"assistant_id",  0LL));
    }
    id v17 = (void *)v13;
    id v31 = @"assistant_id";
    id v32 = v9;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    id v21 = v12;
    unsigned __int8 v15 = [v10 updateTableWithName:@"events" valueMap:v18 criterion:v17 error:&v21];
    id v16 = v21;

    if ((v15 & 1) == 0)
    {
      id v19 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v24 = "-[ADAnalyticsStore _updateRecordsWithSpeechId:toUpdatedSpeechId:error:]";
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Failed to update database records with speechId (%@) to speechId (%@) due to error %@",  buf,  0x2Au);
        if (!a5) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }

      if (a5) {
LABEL_16:
      }
        *a5 = v16;
    }

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end