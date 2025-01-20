@interface PBSILOnTimeAccumulator
+ (BOOL)_BOOLeanFromData:(__CFData *)a3;
+ (BOOL)_accumulationEnabled;
+ (BOOL)accumulatingOnTime;
+ (double)currentAccumulatedOnTimeMinutes;
+ (id)_SIL;
+ (int64_t)_currentPersistedSILOnTimeMinutes;
+ (void)_persistOnTimeToPersistentStorage;
+ (void)_startDefaultsTimer;
+ (void)_startPersistentTimer;
+ (void)_stopAllTimers;
+ (void)_writeOnTimeToDefault;
+ (void)adjustSILBrightness;
+ (void)noteSILOff;
+ (void)noteSILOn;
+ (void)persistSILOnTimeImmediately;
@end

@implementation PBSILOnTimeAccumulator

+ (void)noteSILOn
{
  if ([a1 _accumulationEnabled])
  {
    id v3 = sub_1000F7564();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting accumulation", v5, 2u);
    }

    qword_1004701A0 = mach_absolute_time();
    [a1 _startDefaultsTimer];
    [a1 _startPersistentTimer];
  }

+ (void)noteSILOff
{
  if ([a1 _accumulationEnabled])
  {
    id v3 = sub_1000F7564();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping accumulation", v5, 2u);
    }

    [a1 _stopAllTimers];
  }

+ (void)persistSILOnTimeImmediately
{
}

+ (void)adjustSILBrightness
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _SIL]);
  double v4 = (double)(uint64_t)[a1 _currentPersistedSILOnTimeMinutes];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005F6E8;
  v6[3] = &unk_1003D1338;
  *(double *)&v6[4] = v4;
  [v3 writeSILOnTime:v5 completion:v6];
}

+ (BOOL)accumulatingOnTime
{
  return [a1 _accumulationEnabled];
}

+ (double)currentAccumulatedOnTimeMinutes
{
  if (!qword_1004701A0 && [a1 accumulatingOnTime])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"startTimeForThisAccumulationTicks > 0 || ![self accumulatingOnTime]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100275094(a2, (uint64_t)a1, (uint64_t)v6);
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

  else
  {
    else {
      uint64_t v4 = 0LL;
    }
    return BSMonotonicReferencedTimeFromMachTime(v4) / 60.0;
  }

  return result;
}

+ (id)_SIL
{
  if (qword_1004701B0 != -1) {
    dispatch_once(&qword_1004701B0, &stru_1003D2518);
  }
  return (id)qword_1004701A8;
}

+ (BOOL)_BOOLeanFromData:(__CFData *)a3
{
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 != CFDataGetTypeID())
  {
    id v7 = sub_1000F7564();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002751C0(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_13;
  }

  CFIndex Length = CFDataGetLength(a3);
  if (Length > 7)
  {
    CFNumberType v6 = kCFNumberSInt64Type;
    goto LABEL_8;
  }

  if (Length != 4)
  {
    id v19 = sub_1000F7564();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100275190(v8, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_13:
    unsigned __int8 v18 = 0;
    goto LABEL_14;
  }

  CFNumberType v6 = kCFNumberSInt32Type;
LABEL_8:
  BytePtr = CFDataGetBytePtr(a3);
  CFNumberRef v17 = CFNumberCreate(0LL, v6, BytePtr);
  if (v17)
  {
    v8 = v17;
    unsigned __int8 v18 = -[__CFNumber BOOLValue](v17, "BOOLValue");
LABEL_14:

    return v18;
  }

  return 0;
}

+ (BOOL)_accumulationEnabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005FA8C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004701B8 != -1) {
    dispatch_once(&qword_1004701B8, block);
  }
  return byte_1004699F8;
}

+ (int64_t)_currentPersistedSILOnTimeMinutes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSDevice valueForNVRAMVariable:]( &OBJC_CLASS___TVSDevice,  "valueForNVRAMVariable:",  @"sil-on-time"));
  id v3 = sub_1000F7564();
  CFTypeID v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = [v2 integerValue];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Read %ld value from nvram",  (uint8_t *)&v7,  0xCu);
  }

  id v5 = [v2 integerValue];
  return (int64_t)v5;
}

+ (void)_persistOnTimeToPersistentStorage
{
  id v3 = (char *)[a1 _currentPersistedSILOnTimeMinutes];
  CFTypeID v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 accumulatedSILOnTimeMinutes];
  double v6 = v5;

  id v7 = sub_1000F7564();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v13 = &v3[(uint64_t)(v6 + 0.5)];
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    double v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Persisting new accumulation %ld to nvram [%ld + %f]",  buf,  0x20u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  &v3[(uint64_t)(v6 + 0.5)]));
  +[TVSDevice setValue:forNVRAMVariable:]( &OBJC_CLASS___TVSDevice,  "setValue:forNVRAMVariable:",  v9,  @"sil-on-time");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v10 setAccumulatedSILOnTimeMinutes:0.0];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v11 synchronize];

  [a1 adjustSILBrightness];
}

+ (void)_writeOnTimeToDefault
{
  uint64_t v2 = mach_absolute_time();
  double v3 = BSMonotonicReferencedTimeFromMachTime(v2 - qword_1004701A0) / 60.0;
  CFTypeID v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 accumulatedSILOnTimeMinutes];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 setAccumulatedSILOnTimeMinutes:v3 + v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v8 synchronize];

  id v9 = sub_1000F7564();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    double v12 = v3 + v6;
    __int16 v13 = 2048;
    double v14 = v3;
    __int16 v15 = 2048;
    double v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Writing accumulation of %f to defaults [%f + %f]",  (uint8_t *)&v11,  0x20u);
  }

  qword_1004701A0 = mach_absolute_time();
}

+ (void)_startDefaultsTimer
{
  if (([(id)qword_100470198 isScheduled] & 1) == 0)
  {
    if (!qword_100470198)
    {
      id v3 = [[BSContinuousMachTimer alloc] initWithIdentifier:@"PineBoard.SILOnTime.defaults-timer"];
      CFTypeID v4 = (void *)qword_100470198;
      qword_100470198 = (uint64_t)v3;
    }

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 secondsBetweenSILOnTimeDefaultsWrite];
    double v7 = v6;

    id v8 = sub_1000F7564();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scheduling defaults timer for %f secs period",  buf,  0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000601A0;
    v10[3] = &unk_1003D2538;
    v10[4] = a1;
    [(id)qword_100470198 scheduleRepeatingWithFireInterval:&_dispatch_main_q repeatInterval:v10 leewayInterval:v7 queue:v7 handler:1.0];
  }

+ (void)_startPersistentTimer
{
  if (([(id)qword_100470190 isScheduled] & 1) == 0)
  {
    if (!qword_100470190)
    {
      id v3 = [[BSContinuousMachTimer alloc] initWithIdentifier:@"PineBoard.SILOnTime.nvram-timer"];
      CFTypeID v4 = (void *)qword_100470190;
      qword_100470190 = (uint64_t)v3;
    }

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 secondsBetweenSILOnTimePersistentWrite];
    double v7 = v6;

    id v8 = sub_1000F7564();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scheduling nvram timer for %f secs period",  buf,  0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100060314;
    v10[3] = &unk_1003D2538;
    v10[4] = a1;
    [(id)qword_100470190 scheduleRepeatingWithFireInterval:&_dispatch_main_q repeatInterval:v10 leewayInterval:v7 queue:v7 handler:1.0];
  }

+ (void)_stopAllTimers
{
  if (qword_100470198) {
    [(id)qword_100470198 cancel];
  }
  if (qword_100470190)
  {
    [a1 _persistOnTimeToPersistentStorage];
    [(id)qword_100470190 cancel];
  }

@end