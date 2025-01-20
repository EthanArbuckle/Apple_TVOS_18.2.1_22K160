@interface SASpeculativeDownloadAnalytics
+ (BOOL)isBundleIdInHierarchy:(id)a3;
+ (BOOL)shouldSendTelemetry;
+ (id)SDTelResidencyKeysTranslationTable;
+ (id)SDTelStateKeysTranslationTable;
+ (id)SDTelUrgencyKeysTranslationTable;
+ (id)SDTelVolumeKeysTranslationTable;
+ (id)getLastSentTelemetryDate;
+ (void)sendTelemetry:(id)a3 withHistogramMatrix:(id)a4;
+ (void)updateLastSentTelemetryDate;
- (NSString)SdaStateFilePath;
- (unint64_t)Options;
- (void)analyzeVolPath:(id)a3 pathList:(id)a4 dirKeyCache:(id)a5 appSizerResults:(id)a6;
- (void)setOptions:(unint64_t)a3;
- (void)setSdaStateFilePath:(id)a3;
@end

@implementation SASpeculativeDownloadAnalytics

+ (BOOL)isBundleIdInHierarchy:(id)a3
{
  id v3 = a3;
  if (qword_10005AAD0 != -1) {
    dispatch_once(&qword_10005AAD0, &stru_10004D0A0);
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = (id)qword_10005AAC8;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend( v3,  "hasPrefix:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)i),  (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)analyzeVolPath:(id)a3 pathList:(id)a4 dirKeyCache:(id)a5 appSizerResults:(id)a6
{
  id v10 = a3;
  id v56 = a4;
  id v11 = a5;
  id v55 = a6;
  uint64_t v12 = SALog(v55);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Start SDA for %@", (uint8_t *)&buf, 0xCu);
  }

  v14 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDAState loadFromFileAtPath:]( &OBJC_CLASS___SDAState,  "loadFromFileAtPath:",  self->_SdaStateFilePath));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastEventIdPerVol]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v10]);

  if (v17)
  {
    FSEventStreamEventId sinceWhen = (FSEventStreamEventId)[v17 unsignedLongLongValue];
    v54 = objc_opt_new(&OBJC_CLASS___SDAHistogramMatrix);
    id v19 = v10;
    if (statfs((const char *)[v19 UTF8String], &__src))
    {
      v20 = __error();
      int v21 = *v20;
      uint64_t v22 = SALog(v20);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100032F34(v21, v23);
      }
    }

    else
    {
      dev_t deviceToWatch = __src.f_fsid.val[0];
      __int16 v63 = 0;
      if (fsctl(__src.f_mntonname, 0x40024A6CuLL, &v63, 1u))
      {
        v28 = __error();
        int v29 = *v28;
        uint64_t v30 = SALog(v28);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100032E9C(v29, v31);
        }
      }

      else
      {
        switch(v63)
        {
          case 2:
            int v32 = 1;
            break;
          case 64:
            int v32 = 2;
            break;
          case 576:
            int v32 = 3;
            break;
          default:
            int v32 = 0;
            break;
        }

        v50 = v54;
        *(void *)&__int128 buf = v50;
        *((void *)&buf + 1) = &sinceWhen;
        memcpy(v66, &__src, sizeof(v66));
        int v67 = v32;
        id v68 = v11;
        id v69 = v56;
        v49 = v14;
        v70 = v49;
        char v71 = 0;
        context.version = 0LL;
        memset(&context.retain, 0, 24);
        context.info = &buf;
        values = @"/.activity";
        pathsToWatchRelativeToDevice = CFArrayCreate( kCFAllocatorDefault,  (const void **)&values,  1LL,  &kCFTypeArrayCallBacks);
        FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
        FSEventStreamEventId v34 = sinceWhen;
        if (sinceWhen >= CurrentEventId) {
          FSEventStreamEventId v34 = CurrentEventId;
        }
        FSEventStreamEventId sinceWhen = v34;
        uint64_t v35 = SALog(CurrentEventId);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_100032E70();
        }

        v37 = FSEventStreamCreateRelativeToDevice( kCFAllocatorDefault,  (FSEventStreamCallback)sub_100021C5C,  &context,  deviceToWatch,  pathsToWatchRelativeToDevice,  sinceWhen,  0.0,  0x10u);
        deviceToWatcha = dispatch_queue_create("fse que", 0LL);
        FSEventStreamSetDispatchQueue(v37, deviceToWatcha);
        uint64_t v38 = FSEventStreamStart(v37);
        if ((_DWORD)v38)
        {
          -[NSConditionLock lockWhenCondition:](v49, "lockWhenCondition:", 1LL);
          FSEventStreamStop(v37);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100022AAC;
          block[3] = &unk_10004D0C8;
          v60 = v37;
          v39 =  -[NSConditionLock initWithCondition:]( objc_alloc(&OBJC_CLASS___NSConditionLock),  "initWithCondition:",  0LL);
          v59 = v39;
          dispatch_async(deviceToWatcha, block);
          -[NSConditionLock lockWhenCondition:](v39, "lockWhenCondition:", 1LL);
          CFRelease(pathsToWatchRelativeToDevice);
          CFRelease(values);
          uint64_t v41 = SALog(v40);
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            sub_100032DEC((uint64_t *)&sinceWhen, (uint64_t)v19, v42);
          }

          FSEventStreamEventId v43 = sinceWhen;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v15 updateEventId:v43 andDate:v44 forVolPath:v19];

          if ((self->_Options & 1) != 0) {
            id v45 = -[SDAHistogramMatrix print](v50, "print");
          }
          uint64_t v46 = SALog(v45);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "SDA: Send telemetry", v57, 2u);
          }

          +[SASpeculativeDownloadAnalytics sendTelemetry:withHistogramMatrix:]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "sendTelemetry:withHistogramMatrix:",  v55,  v50);
        }

        else
        {
          uint64_t v48 = SALog(v38);
          v39 = (NSConditionLock *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR)) {
            sub_100032D8C();
          }
        }

        sub_100022B30((id *)&buf);
      }
    }
  }

  else
  {
    uint64_t v24 = SALog(v18);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Initial run. Set initial lastEventId and abort.",  (uint8_t *)&buf,  2u);
    }

    FSEventStreamEventId v26 = FSEventsGetCurrentEventId();
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 updateEventId:v26 andDate:v27 forVolPath:v10];
  }
}

+ (void)sendTelemetry:(id)a3 withHistogramMatrix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100022CC8;
  v13[3] = &unk_10004D118;
  v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v15 = v5;
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[SASpeculativeDownloadAnalytics SDTelVolumeKeysTranslationTable]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "SDTelVolumeKeysTranslationTable"));
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[SASpeculativeDownloadAnalytics SDTelStateKeysTranslationTable]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "SDTelStateKeysTranslationTable"));
  id v18 = (id)objc_claimAutoreleasedReturnValue( +[SASpeculativeDownloadAnalytics SDTelUrgencyKeysTranslationTable]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "SDTelUrgencyKeysTranslationTable"));
  id v19 = (id)objc_claimAutoreleasedReturnValue( +[SASpeculativeDownloadAnalytics SDTelResidencyKeysTranslationTable]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "SDTelResidencyKeysTranslationTable"));
  id v7 = v19;
  id v8 = v18;
  id v9 = v17;
  id v10 = v16;
  id v11 = v5;
  uint64_t v12 = v14;
  [v6 enumerateBundleHistogram:v13];
}

+ (id)SDTelVolumeKeysTranslationTable
{
  if (qword_10005AAE0 != -1) {
    dispatch_once(&qword_10005AAE0, &stru_10004D138);
  }
  return (id)qword_10005AAD8;
}

+ (id)SDTelStateKeysTranslationTable
{
  if (qword_10005AAF0 != -1) {
    dispatch_once(&qword_10005AAF0, &stru_10004D158);
  }
  return (id)qword_10005AAE8;
}

+ (id)SDTelUrgencyKeysTranslationTable
{
  if (qword_10005AB00 != -1) {
    dispatch_once(&qword_10005AB00, &stru_10004D178);
  }
  return (id)qword_10005AAF8;
}

+ (id)SDTelResidencyKeysTranslationTable
{
  if (qword_10005AB10 != -1) {
    dispatch_once(&qword_10005AB10, &stru_10004D198);
  }
  return (id)qword_10005AB08;
}

+ (void)updateLastSentTelemetryDate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  +[SARunTimeDataManager setRunTimeDataObject:forKey:]( &OBJC_CLASS___SARunTimeDataManager,  "setRunTimeDataObject:forKey:",  v2,  @"lastSpeculativeDownloadSentTelemetryDate");
}

+ (id)getLastSentTelemetryDate
{
  return +[SARunTimeDataManager runTimeDataObjectForKey:]( &OBJC_CLASS___SARunTimeDataManager,  "runTimeDataObjectForKey:",  @"lastSpeculativeDownloadSentTelemetryDate");
}

+ (BOOL)shouldSendTelemetry
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SASpeculativeDownloadAnalytics getLastSentTelemetryDate]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "getLastSentTelemetryDate"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v3 timeIntervalSinceDate:v2];
    BOOL v5 = v4 >= 86400.0;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (NSString)SdaStateFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSdaStateFilePath:(id)a3
{
}

- (unint64_t)Options
{
  return self->_Options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_Options = a3;
}

- (void).cxx_destruct
{
}

@end