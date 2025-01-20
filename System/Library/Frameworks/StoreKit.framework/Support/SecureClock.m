@interface SecureClock
+ (id)_dateFormatter;
+ (id)_dateFromHeaderValue:(id)a3;
+ (id)_global;
+ (id)_hashForServerDate:(double)a3 systemUptime:(double)a4;
+ (id)_persistentStatePath;
+ (id)now;
+ (void)synchronizeWithURLResult:(id)a3;
- (double)_timeIntervalSinceLastServerResponse;
- (id)_currentTime;
- (id)_currentTimeSynchronized;
- (id)_init;
- (void)_logState;
- (void)_readState;
- (void)_synchronizeWithURLResult:(id)a3;
- (void)_writeState;
@end

@implementation SecureClock

+ (id)now
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _global]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _currentTimeSynchronized]);

  return v3;
}

+ (void)synchronizeWithURLResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 _global]);
  [v5 _synchronizeWithURLResult:v4];
}

+ (id)_global
{
  if (qword_10032E350 != -1) {
    dispatch_once(&qword_10032E350, &stru_1002E86A0);
  }
  return (id)qword_10032E348;
}

+ (id)_dateFormatter
{
  if (qword_10032E360 != -1) {
    dispatch_once(&qword_10032E360, &stru_1002E86C0);
  }
  return (id)qword_10032E358;
}

+ (id)_dateFromHeaderValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _dateFormatter]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromString:v4]);

  return v6;
}

+ (id)_hashForServerDate:(double)a3 systemUptime:(double)a4
{
  v10[0] = 0LL;
  v10[1] = 0LL;
  *(double *)data = a3;
  *(double *)&data[1] = a4;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice sk_bootSession](&OBJC_CLASS___AMSDevice, "sk_bootSession"));
  id v5 = v4;
  if (v4)
  {
    [v4 getUUIDBytes:v10];
    memset(v8, 0, sizeof(v8));
    CC_SHA256(data, 0x20u, (unsigned __int8 *)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, 32LL));
  }

  else
  {
    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
      sub_10025E250();
    }
    v6 = 0LL;
  }

  return v6;
}

+ (id)_persistentStatePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sk_persistedDataURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"sc" isDirectory:0]);

  return v4;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SecureClock;
  v2 = -[SecureClock init](&v7, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v3;

    lastServerDate = v2->_lastServerDate;
    v2->_lastServerDate = 0LL;

    v2->_uptimeAtLastServerResponse = INFINITY;
  }

  return v2;
}

- (void)_synchronizeWithURLResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v5 systemUptime];
  uint64_t v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 responseHeaders]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tcr_stringForKey:", @"date"));

  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue([v4 response]),
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URL]),
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 scheme]),
        unsigned int v13 = [v12 isEqualToString:@"https"],
        v12,
        v11,
        v10,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SecureClock _dateFromHeaderValue:](&OBJC_CLASS___SecureClock, "_dateFromHeaderValue:", v9));
    v15 = v14;
    if (v14)
    {
      lock = self->_lock;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100033BF4;
      v19[3] = &unk_1002E86E8;
      v19[4] = self;
      uint64_t v21 = v7;
      id v20 = v14;
      sub_100046160(lock, v19);
    }

    else
    {
      if (qword_10032E3B0 != -1) {
        dispatch_once(&qword_10032E3B0, &stru_1002E8708);
      }
      v18 = (void *)qword_10032E368;
      if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
        sub_10025E314(v18, v4, (uint64_t)v9);
      }
    }
  }

  else
  {
    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    v17 = (void *)qword_10032E368;
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
      sub_10025E27C(v17, v4);
    }
  }

  -[SecureClock _logState](self, "_logState");
}

- (void)_writeState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SecureClock _hashForServerDate:systemUptime:]( &OBJC_CLASS___SecureClock,  "_hashForServerDate:systemUptime:"));
  if (v3)
  {
    memset(v11, 0, sizeof(v11));
    -[NSDate timeIntervalSinceReferenceDate](self->_lastServerDate, "timeIntervalSinceReferenceDate");
    double uptimeAtLastServerResponse = self->_uptimeAtLastServerResponse;
    v10[0] = v5;
    *(double *)&v10[1] = uptimeAtLastServerResponse;
    [v3 getBytes:v11 length:32];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v10, 48LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SecureClock _persistentStatePath](&OBJC_CLASS___SecureClock, "_persistentStatePath"));
    id v9 = 0LL;
    [v6 writeToURL:v7 options:1 error:&v9];
    id v8 = v9;

    if (v8)
    {
      if (qword_10032E3B0 != -1) {
        dispatch_once(&qword_10032E3B0, &stru_1002E8708);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
        sub_10025E3F8();
      }
    }

    else
    {
      -[SecureClock _logState](self, "_logState");
    }
  }

  else
  {
    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
      sub_10025E3CC();
    }
  }
}

- (void)_readState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SecureClock _persistentStatePath](&OBJC_CLASS___SecureClock, "_persistentStatePath"));
  id v14 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  0LL,  &v14));
  id v5 = v14;

  if (v5)
  {
    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
      sub_10025E4B8();
    }
    goto LABEL_26;
  }

  if (v4 && [v4 length] == (id)48)
  {
    memset(v16, 0, sizeof(v16));
    __int128 v15 = 0u;
    [v4 getBytes:&v15 length:48];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SecureClock _hashForServerDate:systemUptime:]( &OBJC_CLASS___SecureClock,  "_hashForServerDate:systemUptime:",  v15));
    if (!v6)
    {
      if (qword_10032E3B0 != -1) {
        dispatch_once(&qword_10032E3B0, &stru_1002E8708);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
        sub_10025E460();
      }
      goto LABEL_25;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v16, 32LL));
    if ([v6 isEqualToData:v7])
    {
      double v8 = *((double *)&v15 + 1);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v9 systemUptime];
      double v11 = v10;

      if (v8 < v11)
      {
        v12 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *(double *)&v15));
        lastServerDate = self->_lastServerDate;
        self->_lastServerDate = v12;

        self->_double uptimeAtLastServerResponse = *((double *)&v15 + 1);
        -[SecureClock _logState](self, "_logState");
LABEL_25:

        goto LABEL_26;
      }
    }

    else
    {
    }

    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
      sub_10025E48C();
    }
    goto LABEL_25;
  }

  if (qword_10032E3B0 != -1) {
    dispatch_once(&qword_10032E3B0, &stru_1002E8708);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_ERROR)) {
    sub_10025E460();
  }
LABEL_26:
}

- (id)_currentTime
{
  return -[NSDate dateByAddingTimeInterval:](self->_lastServerDate, "dateByAddingTimeInterval:");
}

- (id)_currentTimeSynchronized
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000341BC;
  double v10 = sub_1000341CC;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000341D4;
  v5[3] = &unk_1002E6A00;
  v5[4] = self;
  v5[5] = &v6;
  sub_100046160(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)_timeIntervalSinceLastServerResponse
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  double v5 = v4 - self->_uptimeAtLastServerResponse;

  return v5;
}

- (void)_logState
{
  if (os_variant_has_internal_content("com.apple.storekitd"))
  {
    if (qword_10032E3B0 != -1) {
      dispatch_once(&qword_10032E3B0, &stru_1002E8708);
    }
    id v3 = (void *)qword_10032E368;
    if (os_log_type_enabled((os_log_t)qword_10032E368, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureClock _currentTime](self, "_currentTime"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[SecureClock _timeIntervalSinceLastServerResponse](self, "_timeIntervalSinceLastServerResponse");
      uint64_t v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v9 systemUptime];
      int v11 = 138544130;
      v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2050;
      uint64_t v16 = v8;
      __int16 v17 = 2050;
      uint64_t v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[SC] Secure Clock State: SecureClock(%{public}@) SystemClock(%{public}@) SecondsSinceLastResponse(%{public}f) Up time(%{public}f)",  (uint8_t *)&v11,  0x2Au);
    }
  }

- (void).cxx_destruct
{
}

@end