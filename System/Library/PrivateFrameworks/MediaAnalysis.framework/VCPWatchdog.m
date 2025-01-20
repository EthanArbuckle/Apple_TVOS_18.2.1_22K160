@interface VCPWatchdog
+ (id)sharedWatchdog;
- (VCPWatchdog)init;
- (void)disable;
- (void)enable;
- (void)pet;
- (void)petWithCrashCallback:(id)a3;
- (void)petWithMessage:(id)a3;
@end

@implementation VCPWatchdog

- (VCPWatchdog)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VCPWatchdog;
  v2 = -[VCPWatchdog init](&v14, "init");
  if (v2)
  {
    v3 = signal(14, (void (__cdecl *)(int))sub_100016C44);
    if (v3)
    {
      uint64_t v5 = MediaAnalysisLogLevel(v3, v4);
      if ((int)v5 >= 4)
      {
        uint64_t v7 = VCPLogInstance(v5, v6);
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        os_log_type_t v9 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "Hijacked SIGALRM; this may be a problem...", v13, 2u);
        }
      }
    }

    dispatch_queue_t v10 = dispatch_queue_create("WatchdogLastPetMessage", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;
  }

  return v2;
}

+ (id)sharedWatchdog
{
  if (qword_1001E63E0 != -1) {
    dispatch_once(&qword_1001E63E0, &stru_1001BA0A0);
  }
  return (id)qword_1001E63D8;
}

- (void)enable
{
  if (alarm(0x78u) && (int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v2 = VCPLogInstance();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Watchdog already enabled", v5, 2u);
    }
  }

- (void)petWithMessage:(id)a3
{
  id v4 = a3;
  alarm(0x78u);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016E28;
  block[3] = &unk_1001BA0C8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)pet
{
}

- (void)petWithCrashCallback:(id)a3
{
  id v4 = a3;
  alarm(0x78u);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016F20;
  block[3] = &unk_1001BA110;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)disable
{
  if (!alarm(0) && (int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v2 = VCPLogInstance();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Watchdog already disabled", v5, 2u);
    }
  }

- (void).cxx_destruct
{
}

@end