@interface OSABridgeLinkRemote
+ (void)instantiate;
- (OSABridgeLinkRemote)init;
- (void)checkForPendingLogs;
- (void)enforceQuota;
- (void)handleLaunchEvent;
- (void)transferInternal:(id)a3 key:(id)a4;
@end

@implementation OSABridgeLinkRemote

+ (void)instantiate
{
  if (qword_100026268 != -1) {
    dispatch_once(&qword_100026268, &stru_100020F88);
  }
}

- (OSABridgeLinkRemote)init
{
  if ((OSAIsRSDDevice(self, a2) & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___OSABridgeLinkRemote;
    v3 = -[OSABridgeLinkRemote init](&v15, "init");
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.ReportCrash.xfer_queue", 0LL);
      serial_xfer_queue = v3->_serial_xfer_queue;
      v3->_serial_xfer_queue = (OS_dispatch_queue *)v4;

      v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      xfer_counts = v3->_xfer_counts;
      v3->_xfer_counts = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryForKey:@"xfer-counts"]);

      if (v9) {
        -[NSMutableDictionary addEntriesFromDictionary:](v3->_xfer_counts, "addEntriesFromDictionary:", v9);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100015B1C((uint64_t *)&v3->_xfer_counts);
      }
      v10 = objc_opt_new(&OBJC_CLASS___PCCBridgeEndpoint);
      bridgeEndpoint = v3->_bridgeEndpoint;
      v3->_bridgeEndpoint = v10;

      v12 = -[PCCProxiedDevice initWithEndpoint:]( objc_alloc(&OBJC_CLASS___PCCProxiedDevice),  "initWithEndpoint:",  v3->_bridgeEndpoint);
      bridgeLink = v3->_bridgeLink;
      v3->_bridgeLink = v12;

      if (!v3->_bridgeLink)
      {

        v3 = 0LL;
      }
    }
  }

  else
  {

    return 0LL;
  }

  return v3;
}

- (void)handleLaunchEvent
{
}

- (void)checkForPendingLogs
{
}

- (void)transferInternal:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serial_xfer_queue = (dispatch_queue_s *)self->_serial_xfer_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F19C;
  block[3] = &unk_100020F18;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serial_xfer_queue, block);
}

- (void)enforceQuota
{
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  int v2 = dirstat_np("/private/var/mobile/Library/Logs/CrashReporter", 0LL, &v13, 16LL);
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v2 < 0)
  {
    if (v3)
    {
      v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = (uint64_t)v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to dirstat [%s]",  buf,  0xCu);
    }
  }

  else
  {
    if (v3)
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = v13;
      __int16 v17 = 2048;
      uint64_t v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "enforceQuota usage: %llu bytes, %llu descendants",  buf,  0x16u);
    }

    unint64_t v4 = v13;
    if (v13 >= 26214401)
    {
      BOOL v5 = (unint64_t)v13 > 0x3200000;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = "threshold, cleaning up";
        if (v4 > 0x3200000) {
          id v6 = "max limit, purging";
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = (uint64_t)v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "enforceQuota exceeded %s",  buf,  0xCu);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10000F7AC;
      v10[3] = &unk_100020FF0;
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      BOOL v12 = v5;
      id v7 = v11;
      sub_10000F630("/private/var/mobile/Library/Logs/CrashReporter", v10);
    }
  }

- (void).cxx_destruct
{
}

@end