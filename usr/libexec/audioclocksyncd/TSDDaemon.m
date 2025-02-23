@interface TSDDaemon
- (TSDDaemon)init;
- (void)start;
@end

@implementation TSDDaemon

- (TSDDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TSDDaemon;
  v2 = -[TSDDaemon init](&v7, "init");
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon waiting for daemon service to become available\n",  buf,  2u);
    }

    v3 = objc_alloc_init(&OBJC_CLASS___DaemonServiceMatcher);
    unsigned __int8 v4 = -[DaemonServiceMatcher waitForService](v3, "waitForService");
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon daemon service matched and available\n",  buf,  2u);
      }

      -[TSDDaemon start](v2, "start");
    }

    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 136316418;
        v9 = "serviceIsAvailable";
        __int16 v10 = 2048;
        uint64_t v11 = 0LL;
        __int16 v12 = 2048;
        uint64_t v13 = 0LL;
        __int16 v14 = 2080;
        v15 = &unk_100030E57;
        __int16 v16 = 2080;
        v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/TSDDaemon.m";
        __int16 v18 = 1024;
        int v19 = 47;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
      }

      v2 = 0LL;
    }
  }

  return v2;
}

- (void)start
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon waiting for clock manager to become available\n",  buf,  2u);
  }

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001D8E0;
  v3[3] = &unk_10003C4B0;
  v3[4] = self;
  +[TSDClockManager notifyWhenClockManagerIsAvailable:]( &OBJC_CLASS___TSDClockManager,  "notifyWhenClockManagerIsAvailable:",  v3);
}

- (void).cxx_destruct
{
}

@end