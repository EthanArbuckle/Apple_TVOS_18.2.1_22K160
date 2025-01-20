@interface HTHangInfo
+ (double)getHangWaitTimeout;
+ (id)allHangs;
+ (id)firstHang;
+ (unint64_t)hangSequenceEndTime;
+ (unint64_t)hangSequenceLastHangReportedTime;
+ (unint64_t)hangSequenceStartTime;
+ (unint64_t)numberOfHangs;
+ (void)addHang:(id)a3;
+ (void)cleanupAllHangs;
- (BOOL)displayedInHUD;
- (BOOL)isFirstPartyApp;
- (BOOL)isThirdPartyDevSupportModeHang;
- (HTHangInfo)initWithPid:(int)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 reportedTime:(unint64_t)a7 blownFenceID:(unint64_t)a8 hangSubtype:(int64_t)a9 isFirstPartyApp:(BOOL)a10 isThirdPartyDevSupportModeHang:(BOOL)a11 displayedInHUD:(BOOL)a12 serviceName:(id)a13 reason:(id)a14 processName:(id)a15 processPath:(id)a16 userActionData:(id)a17;
- (NSData)userActionData;
- (NSDictionary)infoDict;
- (NSString)hangDescription;
- (NSString)hangTimestamp;
- (NSString)hangUUID;
- (NSString)processName;
- (NSString)processPath;
- (NSString)reason;
- (NSString)serviceName;
- (double)hangDurationMS;
- (int)pid;
- (int64_t)failReason;
- (int64_t)hangSubType;
- (unint64_t)blownFenceID;
- (unint64_t)endTime;
- (unint64_t)reportedTime;
- (unint64_t)startTime;
- (unint64_t)tid;
- (void)setFailReason:(int64_t)a3;
@end

@implementation HTHangInfo

- (double)hangDurationMS
{
  return sub_100025798(self->_endTime - self->_startTime);
}

- (NSString)hangDescription
{
  processName = self->_processName;
  v4 = sub_100018A78(self->_hangSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[HTHangInfo hangDurationMS](self, "hangDurationMS");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@, %.0fms",  processName,  v5,  v6));

  return (NSString *)v7;
}

+ (unint64_t)hangSequenceStartTime
{
  return qword_10005B458;
}

+ (unint64_t)hangSequenceEndTime
{
  return qword_10005B438;
}

+ (unint64_t)hangSequenceLastHangReportedTime
{
  return qword_10005B460;
}

+ (void)addHang:(id)a3
{
  id v3 = a3;
  if (qword_10005B440 != -1) {
    dispatch_once(&qword_10005B440, &stru_100048E88);
  }
  if (![(id)qword_10005B448 count])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v4, "UUIDString"));
    uint64_t v6 = (void *)qword_10005B450;
    qword_10005B450 = v5;
  }

  id v7 = [v3 startTime];
  id v8 = [v3 endTime];
  id v9 = [v3 reportedTime];
  [(id)qword_10005B448 addObject:v3];
  id v10 = sub_1000233A4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 hangDescription]);
    int v13 = 138543362;
    v14 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ added to tailspin capture",  (uint8_t *)&v13,  0xCu);
  }
}

+ (id)allHangs
{
  return [(id)qword_10005B448 copy];
}

+ (id)firstHang
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (id)qword_10005B448;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = 0LL;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0LL;
      id v7 = v4;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v4 = *(id *)(*((void *)&v10 + 1) + 8LL * (void)v6);

        id v8 = objc_msgSend(v4, "startTime", (void)v10);
        if (v8 == (id)qword_10005B458)
        {
          id v3 = v4;
          id v4 = v2;
          id v2 = v3;
          goto LABEL_11;
        }

        uint64_t v6 = (char *)v6 + 1;
        id v7 = v4;
      }

      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }

+ (unint64_t)numberOfHangs
{
  return (unint64_t)[(id)qword_10005B448 count];
}

+ (void)cleanupAllHangs
{
  qword_10005B438 = 0LL;
  qword_10005B458 = -1LL;
  qword_10005B460 = 0LL;
  if (qword_10005B430)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10005B430);
    id v2 = (void *)qword_10005B430;
    qword_10005B430 = 0LL;
  }

  id v3 = (void *)qword_10005B450;
  if (qword_10005B450)
  {
    qword_10005B450 = 0LL;
  }

- (NSDictionary)infoDict
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 enablementPrefix]);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 enablementPrefix]);
  }

  else
  {
    uint64_t v6 = &stru_10004A8D0;
  }

  v28[0] = @"Reason";
  v28[1] = @"ServiceName";
  serviceName = self->_serviceName;
  v29[0] = self->_reason;
  v29[1] = serviceName;
  v29[2] = self->_processPath;
  v28[2] = @"ProcessPath";
  v28[3] = @"PID";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_pid));
  v29[3] = v26;
  v28[4] = @"ThreadID";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_tid));
  v29[4] = v25;
  v28[5] = @"StartTime";
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_startTime));
  v29[5] = v24;
  v28[6] = @"EndTime";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_endTime));
  v29[6] = v23;
  v28[7] = @"ReportedTime";
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_reportedTime));
  v29[7] = v22;
  v28[8] = @"HangType";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_hangSubType));
  v29[8] = v21;
  v28[9] = @"DisplayData";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](&OBJC_CLASS___HTProcessInfo, "displayStateArray"));
  v29[9] = v8;
  v28[10] = @"NetworkState";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](&OBJC_CLASS___HTNetworkInfo, "networkStateForTailSpin"));
  __int128 v10 = v9;
  if (!v9) {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v29[10] = v10;
  v29[11] = qword_10005B450;
  v28[11] = @"HangUUID";
  v28[12] = @"HangNotificationUUID";
  v29[12] = self->_hangUUID;
  v28[13] = @"CreatedAt";
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v11 timeIntervalSinceReferenceDate];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.0f", v12));
  v29[13] = v13;
  v29[14] = v6;
  v27 = v6;
  v28[14] = @"EnablementType";
  v28[15] = @"DisplayedInHUD";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_displayedInHUD));
  v29[15] = v14;
  v28[16] = @"IsThirdPartyDevSupportModeHang";
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isThirdPartyDevSupportModeHang));
  v29[16] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  17LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v16));

  if (!v9) {
  if (sub_100018B74(self->_serviceName) == 1)
  }
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo recentAppsDict](&OBJC_CLASS___HTProcessInfo, "recentAppsDict"));
    [v17 setObject:v18 forKeyedSubscript:@"RecentAppsDict"];
  }

  if (self->_hangSubType == 5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_blownFenceID));
    [v17 setObject:v19 forKeyedSubscript:@"CAFenceId"];
  }

  return (NSDictionary *)v17;
}

- (HTHangInfo)initWithPid:(int)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 reportedTime:(unint64_t)a7 blownFenceID:(unint64_t)a8 hangSubtype:(int64_t)a9 isFirstPartyApp:(BOOL)a10 isThirdPartyDevSupportModeHang:(BOOL)a11 displayedInHUD:(BOOL)a12 serviceName:(id)a13 reason:(id)a14 processName:(id)a15 processPath:(id)a16 userActionData:(id)a17
{
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___HTHangInfo;
  v27 = -[HTHangInfo init](&v47, "init");
  if (v27)
  {
    v44 = v22;
    unint64_t v28 = a6;
    v29 = v26;
    v30 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v30, "UUIDString"));
    hangUUID = v27->_hangUUID;
    v27->_hangUUID = (NSString *)v31;

    id v26 = v29;
    v27->_pid = a3;
    v27->_tid = a4;
    v27->_startTime = a5;
    v27->_endTime = v28;
    v27->_reportedTime = a7;
    v27->_blownFenceID = a8;
    v27->_hangSubType = a9;
    id v22 = v44;
    v27->_isFirstPartyApp = a10;
    v27->_isThirdPartyDevSupportModeHang = a11;
    v27->_displayedInHUD = a12;
    v33 = (NSString *)[v44 copy];
    serviceName = v27->_serviceName;
    v27->_serviceName = v33;

    v35 = (NSString *)[v23 copy];
    reason = v27->_reason;
    v27->_reason = v35;

    v37 = (NSString *)[v24 copy];
    processName = v27->_processName;
    v27->_processName = v37;

    v39 = (NSString *)[v25 copy];
    processPath = v27->_processPath;
    v27->_processPath = v39;

    v41 = (NSData *)[v29 copy];
    userActionData = v27->_userActionData;
    v27->_userActionData = v41;
  }

  return v27;
}

+ (double)getHangWaitTimeout
{
  uint64_t v2 = mach_absolute_time();
  unint64_t v3 = +[HTProcessInfo getEarliestPendingHangStartTime:]( &OBJC_CLASS___HTProcessInfo,  "getEarliestPendingHangStartTime:",  v2);
  if (v3 >= qword_10005B458) {
    uint64_t v4 = qword_10005B458;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v3) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = qword_10005B458;
  }
  if (qword_10005B458) {
    BOOL v6 = qword_10005B460 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = sub_1000233A4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    double v11 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10002C058(v8, v9, v10);
    }
  }

  else
  {
    unint64_t v12 = v3;
    if (v2 >= v5)
    {
      if (v2 >= qword_10005B460)
      {
        if (v2 >= v3)
        {
          double v17 = sub_100025798(v2 - v5);
          double v18 = sub_100025798(v2 - qword_10005B460);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          double v20 = (double)(unint64_t)[v19 hangWaitTimeoutDurationMSec];

          double v21 = 0.0;
          double v22 = 0.0;
          if (v17 < v20)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
            double v22 = (double)(unint64_t)[v23 hangWaitTimeoutDurationMSec] - v17;
          }

          double v24 = 0.0;
          if (v12)
          {
            double v24 = sub_100025798(v2 - v12);
            if (v22 + v24 >= 500.0) {
              double v21 = v22;
            }
            else {
              double v21 = 0.0;
            }
          }

          double v25 = 0.0;
          if (qword_10005B438 > v2) {
            double v25 = sub_100025798(qword_10005B438 - v2);
          }
          double v26 = 350.0 - v18;
          if (350.0 - v18 > v22 + -250.0) {
            double v26 = v22 + -250.0;
          }
          if (v22 >= 250.0 && v18 < 350.0) {
            double v28 = v26;
          }
          else {
            double v28 = 0.0;
          }
          if (v21 >= v25) {
            double v29 = v21;
          }
          else {
            double v29 = v25;
          }
          if (v29 < v28) {
            double v29 = v28;
          }
          if (v29 <= v22) {
            double v11 = v29;
          }
          else {
            double v11 = v22;
          }
          id v30 = sub_1000233A4();
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v32 = 134219776;
            double v33 = v11;
            __int16 v34 = 2048;
            double v35 = v17;
            __int16 v36 = 2048;
            double v37 = v24;
            __int16 v38 = 2048;
            double v39 = v18;
            __int16 v40 = 2048;
            double v41 = v22;
            __int16 v42 = 2048;
            double v43 = v21;
            __int16 v44 = 2048;
            double v45 = v25;
            __int16 v46 = 2048;
            double v47 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "getHangWaitTimeout: waitTimeMS=%.0fms, timeSinceEarliestHangStartMS=%.0fms, timeSinceEarliestPendingHangSt artMS=%.0fms, timeSinceLastHangReportedMS=%.0fms, maxRemainingWaitTimeMS=%.0fms, timeToWaitForPendingHangs Ms=%.0fms, timeToWaitForHangsThatEndsInTheFutureMS=%.0fms, timeToWaitForConsecutiveHangsMS=%.0fms",  (uint8_t *)&v32,  0x52u);
          }
        }

        else
        {
          id v16 = sub_1000233A4();
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          double v11 = 0.0;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            sub_10002C1C0();
          }
        }
      }

      else
      {
        id v14 = sub_1000233A4();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        double v11 = 0.0;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          sub_10002C144(v2, v8, v15);
        }
      }
    }

    else
    {
      id v13 = sub_1000233A4();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      double v11 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10002C0DC();
      }
    }
  }

  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)tid
{
  return self->_tid;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (unint64_t)reportedTime
{
  return self->_reportedTime;
}

- (unint64_t)blownFenceID
{
  return self->_blownFenceID;
}

- (int64_t)hangSubType
{
  return self->_hangSubType;
}

- (BOOL)displayedInHUD
{
  return self->_displayedInHUD;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  return self->_isThirdPartyDevSupportModeHang;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)hangTimestamp
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSString)processPath
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSData)userActionData
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (int64_t)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(int64_t)a3
{
  self->_failReason = a3;
}

- (NSString)hangUUID
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void).cxx_destruct
{
}

@end