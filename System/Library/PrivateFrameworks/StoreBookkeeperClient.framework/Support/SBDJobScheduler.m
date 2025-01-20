@interface SBDJobScheduler
+ (id)jobSchedulerForAccount:(id)a3 withDomain:(id)a4;
+ (void)__initializeBackgroundTaskAgentWithJobRunner:(id)a3;
+ (void)addBackgroundJob:(id)a3 nextJobTimeInterval:(double)a4;
+ (void)initializeBackgroundTaskAgentWithJobRunner:(id)a3;
- (BOOL)hasScheduledJob:(double *)a3;
- (NSNumber)accountIdentifier;
- (NSString)domain;
- (void)removeScheduledJobs;
- (void)scheduleUpdateJobWithTimeInterval:(double)a3 replaceExisting:(BOOL)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation SBDJobScheduler

- (void)scheduleUpdateJobWithTimeInterval:(double)a3 replaceExisting:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v7 = -[SBDJobScheduler hasScheduledJob:](self, "hasScheduledJob:", &v14);
  if (v4)
  {
    -[SBDJobScheduler removeScheduledJobs](self, "removeScheduledJobs");
LABEL_6:
    os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler accountIdentifier](self, "accountIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler domain](self, "domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s stringValue](v8, "stringValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  @"com.apple.storebookkeeperd.updateJob",  v12,  v10));

    +[SBDJobScheduler addBackgroundJob:nextJobTimeInterval:]( &OBJC_CLASS___SBDJobScheduler,  "addBackgroundJob:nextJobTimeInterval:",  v13,  a3);
    goto LABEL_7;
  }

  if ((v7 & 1) == 0) {
    goto LABEL_6;
  }
  os_log_t v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    double v9 = v14;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v16 = v9 - v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: Skipping scheduling job - there is a job already scheduled in %.2f seconds and this request did n ot request replacing existing jobs",  buf,  0xCu);
LABEL_7:
  }
}

- (BOOL)hasScheduledJob:(double *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler accountIdentifier](self, "accountIdentifier"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler domain](self, "domain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  @"com.apple.storebookkeeperd.updateJob",  v10,  v9));

  id v12 = v11;
  v13 = (void *)BackgroundTaskAgentCopyJob([v12 UTF8String]);

  BOOL v14 = v13 != 0LL;
  if (a3 && v13)
  {
    double v15 = xpc_dictionary_get_double(v13, kBackgroundTaskAgentJobWindowStartTime);
    *a3 = v15;
    if (v15 >= v7)
    {
      BOOL v14 = 1;
    }

    else
    {
      double v16 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "SBDJobScheduler: Scheduled job time passed. Removing scheduled jobs.",  buf,  2u);
      }

      -[SBDJobScheduler removeScheduledJobs](self, "removeScheduledJobs");
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (void)removeScheduledJobs
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler accountIdentifier](self, "accountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBDJobScheduler domain](self, "domain"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  @"com.apple.storebookkeeperd.updateJob",  v4,  v3));

  id v6 = v5;
  BackgroundTaskAgentRemoveJob([v6 UTF8String]);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)jobSchedulerForAccount:(id)a3 withDomain:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SBDJobScheduler);
  os_log_t v8 = v7;
  if (v7)
  {
    -[SBDJobScheduler setDomain:](v7, "setDomain:", v6);
    -[SBDJobScheduler setAccountIdentifier:](v8, "setAccountIdentifier:", v5);
  }

  return v8;
}

+ (void)__initializeBackgroundTaskAgentWithJobRunner:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SBDJobScheduler: Initializing BackgroundTaskAgentInit",  buf,  2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010B1C;
  v6[3] = &unk_10001D278;
  id v7 = v3;
  id v5 = v3;
  BackgroundTaskAgentInit("com.apple.storebookkeeperd", &_dispatch_main_q, v6);
}

+ (void)initializeBackgroundTaskAgentWithJobRunner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010AB8;
  block[3] = &unk_10001D2A0;
  SEL v9 = a2;
  id v10 = a1;
  id v8 = a3;
  uint64_t v3 = qword_1000238E0;
  id v4 = v8;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }

  else
  {
    dispatch_once(&qword_1000238E0, block);
    id v5 = v8;
  }
}

+ (void)addBackgroundJob:(id)a3 nextJobTimeInterval:(double)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[XPCTransactionController sharedInstance](&OBJC_CLASS___XPCTransactionController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 beginTransactionWithIdentifier:@"AddBackgroundJob-ShortKeepAlive"]);

  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSinceReferenceDate];
  double v11 = fmax(a4, 0.1) + v10;

  id v12 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      v13 = v5;
    }
    else {
      v13 = @"no-name";
    }
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v14 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138412802;
    v24 = v13;
    __int16 v25 = 2048;
    double v26 = v11;
    __int16 v27 = 2048;
    double v28 = v11 - v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SBDJobScheduler: Add Job: %@ -- Next: %0.2f (delta from current = %.2f)",  buf,  0x20u);
  }

  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowStartTime, v11);
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowEndTime, v11 + 604800.0);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentCellularAllowed, 1);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentJobWindowAdjustTime, 1);
  xpc_dictionary_set_int64(v8, kBackgroundTaskAgentPowerPluggedinTime, 0LL);
  double v16 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    __int16 v25 = 2048;
    double v26 = v11 - Current;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: Adding job %@ (%.2f seconds from now)",  buf,  0x16u);
  }

  v18 = v5;
  BackgroundTaskAgentAddJob(-[__CFString UTF8String](v18, "UTF8String"), v8);
  dispatch_time_t v19 = dispatch_time(0LL, (uint64_t)dbl_100014970[a4 < 2.0]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010A74;
  block[3] = &unk_10001D2C8;
  id v22 = v7;
  id v20 = v7;
  dispatch_after(v19, &_dispatch_main_q, block);
}

@end