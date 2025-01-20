@interface HTProcessLaunchExitRecord
+ (BOOL)supportsSecureCoding;
+ (id)getProcessExitsAndLaunchesDuringHang:(unint64_t)a3 endTime:(unint64_t)a4;
+ (void)fetchProcessRecords;
- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4;
- (BOOL)isTimedOut;
- (HTProcessLaunchExitRecord)initWithCoder:(id)a3;
- (HTProcessLaunchExitRecord)initWithInfo:(id)a3 pid:(int)a4 spawnTimestamp:(unint64_t)a5 exitTimestamp:(unint64_t)a6 exitReasonCode:(unint64_t)a7 exitReasonNamespace:(unsigned __int8)a8 jetsam_priority:(unsigned __int16)a9;
- (NSString)exitReasonNamespaceString;
- (NSString)processName;
- (int)pid;
- (unint64_t)compareValue;
- (unint64_t)exitReasonCode;
- (unint64_t)exitTimestamp;
- (unint64_t)requestedToRenderTimestamp;
- (unint64_t)spawnTimestamp;
- (unsigned)exitReasonNamespace;
- (unsigned)jetsam_priority;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestedToRenderTimestamp:(unint64_t)a3;
@end

@implementation HTProcessLaunchExitRecord

- (HTProcessLaunchExitRecord)initWithInfo:(id)a3 pid:(int)a4 spawnTimestamp:(unint64_t)a5 exitTimestamp:(unint64_t)a6 exitReasonCode:(unint64_t)a7 exitReasonNamespace:(unsigned __int8)a8 jetsam_priority:(unsigned __int16)a9
{
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___HTProcessLaunchExitRecord;
  v17 = -[HTProcessLaunchExitRecord init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processName, a3);
    v18->_pid = a4;
    v18->_spawnTimestamp = a5;
    v18->_exitTimestamp = a6;
    v18->_exitReasonCode = a7;
    v18->_exitReasonNamespace = a8;
    v18->_jetsam_priority = a9;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  id v5 = a3;
  [v5 encodeObject:processName forKey:@"processName"];
  [v5 encodeInt64:self->_pid forKey:@"pid"];
  [v5 encodeInt64:self->_spawnTimestamp forKey:@"spawnTimestamp"];
  [v5 encodeInt64:self->_exitTimestamp forKey:@"exitTimestamp"];
  [v5 encodeInt64:self->_exitReasonCode forKey:@"exitReasonCode"];
  [v5 encodeInt:self->_exitReasonNamespace forKey:@"exitReasonNamespace"];
  [v5 encodeInt:self->_jetsam_priority forKey:@"jetsamPriority"];
}

- (HTProcessLaunchExitRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"processName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeInt64ForKey:@"pid"];
  id v8 = [v4 decodeInt64ForKey:@"spawnTimestamp"];
  id v9 = [v4 decodeInt64ForKey:@"exitTimestamp"];
  id v10 = [v4 decodeInt64ForKey:@"exitReasonCode"];
  unsigned __int8 v11 = [v4 decodeIntForKey:@"exitReasonNamespace"];
  unsigned __int16 v12 = (unsigned __int16)[v4 decodeIntForKey:@"jetsamPriority"];

  LOWORD(v15) = v12;
  v13 = -[HTProcessLaunchExitRecord initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:]( self,  "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:",  v6,  v7,  v8,  v9,  v10,  v11,  v15);

  return v13;
}

+ (void)fetchProcessRecords
{
  if (qword_10007C190 != -1) {
    dispatch_once(&qword_10007C190, &stru_100071C30);
  }
  id v34 = 0LL;
  v35 = 0LL;
  uint64_t v36 = 0LL;
  int v2 = _launch_service_stats_copy_impl("com.apple.hangtracerd", 128LL, &v34, 5LL);
  if (v2)
  {
    id v3 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = strerror(v2);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v2;
      *(_WORD *)&v38[4] = 2080;
      *(void *)&v38[6] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch launch_service_stats(%d):%s",  buf,  0x12u);
    }
  }

  else
  {
    id v6 = sub_1000199EC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v38 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "launch_service_stats_copy() returned %u records",  buf,  8u);
    }

    if ((_DWORD)v36)
    {
      uint64_t v8 = 0LL;
      unint64_t v9 = 0LL;
      do
      {
        id v10 = (char *)v35;
        unsigned __int8 v11 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_array_get_string(v34, *(unsigned int *)((char *)v35 + v8)),  1LL);
        unsigned __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        double v13 = sub_100003060(*(void *)&v10[v8 + 4]);
        double v14 = sub_100003060(*(void *)&v10[v8 + 12]);
        uint64_t v15 = objc_alloc(&OBJC_CLASS___HTProcessLaunchExitRecord);
        LOWORD(v33) = *(_WORD *)&v10[v8 + 49];
        id v16 = -[HTProcessLaunchExitRecord initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:]( v15,  "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:",  v12,  *(unsigned int *)&v10[v8 + 20],  (unint64_t)v13,  (unint64_t)v14,  *(void *)&v10[v8 + 29],  v10[v8 + 28],  v33);
        [(id)qword_10007C198 insert:v16];

        ++v9;
        v8 += 51LL;
      }

      while (v9 < v36);
    }

    if (v35) {
      free(v35);
    }
    uint64_t v17 = mach_absolute_time();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    for (unint64_t i = 0; i < (unint64_t)[(id)qword_10007C198 count]; ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 objectAtIndex:i]);
      id v20 = [v19 exitTimestamp];

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unint64_t v22 = v17 - (void)v20;
      LODWORD(v20) = sub_100003060((unint64_t)[v21 runloopHangTimeoutDurationMSec] + 30000) < (double)(v17 - (unint64_t)v20);

      if ((_DWORD)v20)
      {
        id v23 = sub_1000199EC();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          double v25 = sub_100002FAC(v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          v27 = (char *)[v26 runloopHangTimeoutDurationMSec];
          v28 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 getDescription:i]);
          *(_DWORD *)buf = 134218498;
          *(double *)v38 = v25;
          *(_WORD *)&v38[8] = 2048;
          *(void *)&v38[10] = v27 + 30000;
          __int16 v39 = 2112;
          v40 = v28;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "discarding stale record, time since exit %.0fms, HT_STALE_RECORD_THRESHOLD_IN_MSEC %llums, %@",  buf,  0x20u);
        }

        -[os_log_s addIndex:](v4, "addIndex:", i);
      }
    }

    [(id)qword_10007C198 removeObjectsAtIndexes:v4];
    v29 = (void *)os_transaction_create("com.apple.hangreporter.launch-exit-records");
    [(id)qword_10007C198 setTransaction:v29];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    dispatch_time_t v31 = dispatch_time(0, 1000000 * (void)[v30 runloopHangTimeoutDurationMSec] + 30000000000);

    v32 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 timer]);
    dispatch_source_set_timer(v32, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
  }
}

+ (id)getProcessExitsAndLaunchesDuringHang:(unint64_t)a3 endTime:(unint64_t)a4
{
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = sub_1000199EC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v56 = sub_100002FAC(a3);
    __int16 v57 = 2048;
    double v58 = sub_100002FAC(a4);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "getProcessExitsAndLaunchesDuringHang: called with windown [%.0f - %.0f]ms",  buf,  0x16u);
  }

  +[HTProcessLaunchExitRecord fetchProcessRecords](&OBJC_CLASS___HTProcessLaunchExitRecord, "fetchProcessRecords");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v39 = mach_absolute_time();
  if ([(id)qword_10007C198 count])
  {
    uint64_t v6 = 0LL;
    unsigned int v7 = 1;
    do
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 objectAtIndex:v6]);
      v53[0] = @"processName";
      v50 = (void *)objc_claimAutoreleasedReturnValue([v8 processName]);
      v54[0] = v50;
      v53[1] = @"processID";
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]));
      v54[1] = v49;
      v53[2] = @"spawnTimestamp";
      v48 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 dateFormatter]);
      unint64_t v9 = sub_100002ECC((uint64_t)[v8 spawnTimestamp], v41, v39);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v48 stringFromDate:v47]);
      v54[2] = v46;
      v53[3] = @"exitTimestamp";
      v45 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 dateFormatter]);
      id v10 = sub_100002ECC((uint64_t)[v8 exitTimestamp], v41, v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v45 stringFromDate:v44]);
      v54[3] = v43;
      v53[4] = @"relativeSpawnTimeToHangStart";
      id v11 = [v8 spawnTimestamp];
      id v12 = [v8 spawnTimestamp];
      else {
        unint64_t v13 = (unint64_t)v12 - a3;
      }
      else {
        double v14 = @"%.3lfs";
      }
      uint64_t v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, sub_100003000(v13));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v54[4] = v16;
      v53[5] = @"relativeExitTimeToHangStart";
      id v17 = [v8 exitTimestamp];
      id v18 = [v8 exitTimestamp];
      else {
        unint64_t v19 = (unint64_t)v18 - a3;
      }
      else {
        id v20 = @"%.3lfs";
      }
      v21 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, sub_100003000(v19));
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v54[5] = v22;
      v53[6] = @"processUptime";
      id v23 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%.3lfs",  sub_100003000((_BYTE *)[v8 exitTimestamp] - (_BYTE *)objc_msgSend(v8, "spawnTimestamp")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v54[6] = v24;
      v53[7] = @"exitReasonCode";
      id v25 = sub_1000142B8((int)[v8 exitReasonNamespace], (uint64_t)objc_msgSend(v8, "exitReasonCode"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v54[7] = v26;
      v53[8] = @"exitReasonNamespace";
      v27 = sub_100013990([v8 exitReasonNamespace]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v54[8] = v28;
      v53[9] = @"jetsamPriority";
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  objc_msgSend(v8, "jetsam_priority")));
      v54[9] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  10LL));

      if ((unint64_t)[v8 exitTimestamp] < a3
        || (id v31 = [v8 exitTimestamp], v32 = v36, (unint64_t)v31 >= a4))
      {
        else {
          v32 = v38;
        }
      }

      -[NSMutableArray addObject:](v32, "addObject:", v30);

      uint64_t v6 = v7;
    }

    while ((unint64_t)[(id)qword_10007C198 count] > v7++);
  }

  v51[0] = @"exitedDuringHang";
  v51[1] = @"exitedBeforeHang";
  v52[0] = v36;
  v52[1] = v38;
  v51[2] = @"exitedAfterHang";
  v52[2] = v37;
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  3LL));

  return v34;
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  return sub_100002FAC(a3 - self->_requestedToRenderTimestamp) < 200.0;
}

- (BOOL)isTimedOut
{
  return 0;
}

- (unint64_t)compareValue
{
  return self->_exitTimestamp;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)spawnTimestamp
{
  return self->_spawnTimestamp;
}

- (unint64_t)exitTimestamp
{
  return self->_exitTimestamp;
}

- (unint64_t)requestedToRenderTimestamp
{
  return self->_requestedToRenderTimestamp;
}

- (void)setRequestedToRenderTimestamp:(unint64_t)a3
{
  self->_requestedToRenderTimestamp = a3;
}

- (unint64_t)exitReasonCode
{
  return self->_exitReasonCode;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)exitReasonNamespace
{
  return self->_exitReasonNamespace;
}

- (NSString)exitReasonNamespaceString
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (unsigned)jetsam_priority
{
  return self->_jetsam_priority;
}

- (void).cxx_destruct
{
}

@end