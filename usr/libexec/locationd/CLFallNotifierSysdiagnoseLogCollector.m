@interface CLFallNotifierSysdiagnoseLogCollector
+ (id)getSysdiagnoseOutputFilename;
+ (id)getSysdiagnoseOutputPath;
+ (void)writeAnomalyInfoToFileWithLastFallEvent:(ImpactEvent *)a3 writeMask:(unint64_t)a4 fallNotifierConfig:(Config *)a5 stateLogger:(id)a6 statsLogger:(id)a7 sensorsLogger:(id)a8 pressureLogger:(id)a9 heartRateLogger:(id)a10 wristStateLogger:(id)a11 odometerLogger:(id)a12 falsePositiveSuppressionFeaturesLogger:(id)a13 hgalLogger:(id)a14 logDirectory:(id)a15 logFilePrefix:(id)a16;
+ (void)writeOtherFallLoggerData:(id)a3 otherLoggerDirectory:(id)a4 otherLoggerFilePrefix:(id)a5 destinationLogger:(id)a6;
@end

@implementation CLFallNotifierSysdiagnoseLogCollector

+ (id)getSysdiagnoseOutputPath
{
  if (v6 >= 0) {
    v2 = __p;
  }
  else {
    v2 = (void **)__p[0];
  }
  v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v2);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

+ (id)getSysdiagnoseOutputFilename
{
  v2 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyyMMdd_HH-mm-ss");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreMotionDebug_AnomalyData_%@.bin",  -[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v2));
}

+ (void)writeAnomalyInfoToFileWithLastFallEvent:(ImpactEvent *)a3 writeMask:(unint64_t)a4 fallNotifierConfig:(Config *)a5 stateLogger:(id)a6 statsLogger:(id)a7 sensorsLogger:(id)a8 pressureLogger:(id)a9 heartRateLogger:(id)a10 wristStateLogger:(id)a11 odometerLogger:(id)a12 falsePositiveSuppressionFeaturesLogger:(id)a13 hgalLogger:(id)a14 logDirectory:(id)a15 logFilePrefix:(id)a16
{
  __int16 v19 = a4;
  id v21 = -[CLFallLogger initToDirectory:prefix:rotation:]( objc_alloc(&OBJC_CLASS___CLFallLogger),  "initToDirectory:prefix:rotation:",  a15,  a16,  0LL);
  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_10184D4F8);
  }
  v22 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = [a15 UTF8String];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [a16 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Logging anomaly info in file [%s] [%s]",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10184D4F8);
    }
    uint64_t v24 = qword_1019345D8;
    int v32 = 136315394;
    id v33 = [a15 UTF8String];
    __int16 v34 = 2080;
    id v35 = [a16 UTF8String];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v24,  2LL,  "Logging anomaly info in file [%s] [%s]",  (const char *)&v32,  22);
    v26 = (char *)v25;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:state Logger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppr essionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]",  "%s\n",  v25);
    if (v26 != buf) {
      free(v26);
    }
  }

  if ((v19 & 0x80) != 0)
  {
    *(_WORD *)&buf[16] = 0;
    *(void *)buf = &off_101858100;
    *(void *)&buf[8] = 0LL;
    buf[18] = 1;
    sub_1004F2598();
    *(_DWORD *)&buf[20] = sub_1004F2690();
    unsigned __int8 v31 = 0;
    sub_1012049AC((unsigned __int8 *)&v32, "FallStatsEnabled", &v31, 0);
    char v37 = BYTE1(v32);
    unsigned __int8 v31 = 0;
    sub_1012049AC((unsigned __int8 *)&v32, "FallStatsPressureEnabled", &v31, 0);
    char v38 = BYTE1(v32);
    unsigned __int8 v31 = 0;
    sub_1012049AC((unsigned __int8 *)&v32, "FallStatsSensorRecordingEnabled", &v31, 0);
    char v39 = BYTE1(v32);
    char v40 = sub_10071F09C();
    unsigned __int8 v31 = 0;
    sub_1012049AC((unsigned __int8 *)&v32, "AnomalyMotionInternalTest", &v31, 0);
    char v41 = BYTE1(v32);
    char v42 = 0;
    BOOL var1 = a5->var1;
    unint64_t var0 = a5->var0.var0;
    unsigned __int8 v45 = a5->var0.var1;
    BOOL v46 = a5->var0.var2 != 0;
    unsigned __int8 var3 = a5->var0.var3;
    BOOL v48 = a5->var0.var5 != 0;
    char v49 = 0;
    objc_msgSend( v21,  "logData:",  +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf));
  }

  if ((v19 & 2) != 0)
  {
    sub_100740784((uint64_t)buf, (uint64_t)a3);
    objc_msgSend( v21,  "logData:",  +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf));
  }

  if ((v19 & 4) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a6,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"newtonState",  v21);
  }
  if ((v19 & 8) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a7,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"newtonStats",  v21);
  }
  if ((v19 & 0x10) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a8,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"newtonSensors",  v21);
  }
  if ((v19 & 0x20) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a9,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"pressure",  v21);
  }
  if ((v19 & 0x40) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a10,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"heartRate",  v21);
  }
  if ((v19 & 0x100) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a11,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"wristState",  v21);
  }
  if ((v19 & 0x400) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a12,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"odometer",  v21);
  }
  if ((v19 & 0x200) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a13,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"falsePositiveSuppressionFeatures",  v21);
  }
  if ((v19 & 0x800) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]( &OBJC_CLASS___CLFallNotifierSysdiagnoseLogCollector,  "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:",  a14,  @"/var/root/Library/Caches/locationd/logs/newtonStats",  @"hgal",  v21);
  }
  [v21 flushToFile];
  [v21 stopLogging];

  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_10184D4F8);
  }
  v23 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Logging anomaly info done packing file", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10184D4F8);
    }
    LOWORD(v32) = 0;
    LODWORD(v29) = 2;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  2LL,  "Logging anomaly info done packing file",  &v32,  v29);
    v28 = (char *)v27;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:state Logger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppr essionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]",  "%s\n",  v27);
    if (v28 != buf) {
      free(v28);
    }
  }

+ (void)writeOtherFallLoggerData:(id)a3 otherLoggerDirectory:(id)a4 otherLoggerFilePrefix:(id)a5 destinationLogger:(id)a6
{
  uint64_t v31 = 0LL;
  id v9 =  -[NSArray mutableCopy]( -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a4,  &v31),  "mutableCopy");
  if (!v31)
  {
    v10 = v9;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v14);
          if (![v15 rangeOfString:a5])
          {
            v36[0] = a4;
            v36[1] = v15;
            v16 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
            v17 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v16);
            if (v17)
            {
              v18 = v17;
              if (qword_1019345D0 != -1) {
                dispatch_once(&qword_1019345D0, &stru_10184D4F8);
              }
              __int16 v19 = (os_log_s *)qword_1019345D8;
              if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
              {
                v20 = -[NSString UTF8String](v16, "UTF8String");
                *(_DWORD *)buf = 136315138;
                id v35 = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Dumping [%s]", buf, 0xCu);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019345D0 != -1) {
                  dispatch_once(&qword_1019345D0, &stru_10184D4F8);
                }
                uint64_t v21 = qword_1019345D8;
                v22 = -[NSString UTF8String](v16, "UTF8String");
                int v32 = 136315138;
                id v33 = v22;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  2LL,  "Dumping [%s]",  (const char *)&v32);
                uint64_t v24 = (uint8_t *)v23;
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "+[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFileP refix:destinationLogger:]",  "%s\n",  v23);
                if (v24 != buf) {
                  free(v24);
                }
              }

              [a6 logData:v18];
            }
          }

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v25 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
        id v12 = v25;
      }

      while (v25);
    }
  }

@end