@interface TVCacheDeleteService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)activeConnections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)connectionQueue;
- (TVAppCachePolicyManager)policyManager;
- (TVCacheDeleteManager)cacheDeleteManager;
- (id)_init;
- (id)manager:(id)a3 purgeTasksForUrgency:(int64_t)a4;
- (void)dealloc;
- (void)setActiveConnections:(id)a3;
- (void)setCacheDeleteManager:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setPolicyManager:(id)a3;
- (void)setXPCListener:(id)a3;
- (void)start;
@end

@implementation TVCacheDeleteService

+ (id)sharedInstance
{
  if (qword_1000134D8 != -1) {
    dispatch_once(&qword_1000134D8, &stru_10000C548);
  }
  return (id)qword_1000134D0;
}

- (id)_init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVCacheDeleteService;
  v2 = -[TVCacheDeleteService init](&v29, "init");
  if (!v2)
  {
LABEL_12:
    v17 = v2;
    goto LABEL_13;
  }

  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  activeConnections = v2->_activeConnections;
  v2->_activeConnections = v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.atvcached.connectionQueue", 0LL);
  connectionQueue = v2->_connectionQueue;
  v2->_connectionQueue = (OS_dispatch_queue *)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPMediaCacheManager sharedInstance](&OBJC_CLASS___TVPMediaCacheManager, "sharedInstance"));
  [v7 setCacheRegistrationDisabled:1];

  v8 = -[TVCacheDeleteManager initWithCacheDeleteID:]( objc_alloc(&OBJC_CLASS___TVCacheDeleteManager),  "initWithCacheDeleteID:",  @"com.apple.atvcached.CacheDelete");
  cacheDeleteManager = v2->_cacheDeleteManager;
  v2->_cacheDeleteManager = v8;

  -[TVCacheDeleteManager setDelegate:](v2->_cacheDeleteManager, "setDelegate:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvcd_documentDirectoryURL"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  unsigned int v14 = [v12 fileExistsAtPath:v13 isDirectory:&v28];

  if (!v14 || v28)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v27 = 0LL;
    unsigned __int8 v19 = [v18 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v20 = v27;

    if ((v19 & 1) == 0)
    {
      id v21 = sub_100007290();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100007764((uint64_t)v20, v22);
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"com.apple.atvcached.TVAppPurgePolicies"]);
    v24 = -[TVAppCachePolicyManager initWithURL:]( objc_alloc(&OBJC_CLASS___TVAppCachePolicyManager),  "initWithURL:",  v23);
    policyManager = v2->_policyManager;
    v2->_policyManager = v24;

    goto LABEL_12;
  }

  id v15 = sub_100007290();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100007724(v16);
  }

  v17 = 0LL;
LABEL_13:

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVCacheDeleteService;
  -[TVCacheDeleteService dealloc](&v3, "dealloc");
}

- (void)start
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteService xpcListener](self, "xpcListener"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v6 = -[NSXPCListener initWithMachServiceName:](v4, "initWithMachServiceName:", TVSCacheDeleteMachServiceName);
    -[NSXPCListener setDelegate:](v6, "setDelegate:", self);
    -[TVCacheDeleteService setXPCListener:](self, "setXPCListener:", v6);
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteService xpcListener](self, "xpcListener"));
    [v5 resume];
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.atvcached.client"]);
  unsigned int v7 = [v6 BOOLValue];

  if (v5)
  {
    [v5 auditToken];
  }

  else
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
  }

  CFTypeRef cf = 0LL;
  v33 = 0LL;
  *(_OWORD *)buf = v34;
  __int128 v37 = v35;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken(buf, &v33, &cf))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      signed int v9 = [v5 processIdentifier];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CPCopyBundleIdentifierAndTeamFromAuditToken fail for PID %lu",  buf,  0xCu);
    }

    CFTypeRef cf = 0LL;
    v33 = 0LL;
    goto LABEL_12;
  }

  if (cf) {
    CFRelease(cf);
  }
  v8 = v33;
  if (!v33)
  {
LABEL_12:
    id v10 = sub_100007290();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Checking if command line executable is test tool.",  buf,  2u);
    }

    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 _xpcConnection]);
    pid_t pid = xpc_connection_get_pid(v12);
    int v14 = proc_pidpath(pid, buf, 0x400u);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
      if (qword_1000134E8 != -1) {
        dispatch_once(&qword_1000134E8, &stru_10000C568);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000134E0 objectForKeyedSubscript:v16]);
      if (!v8)
      {
        id v17 = sub_100007290();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Still no bundle ID. Trying to get the bundle ID via path.",  v31,  2u);
        }

        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByDeletingLastPathComponent]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v19));

        v8 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
      }
    }

    else
    {
      v8 = 0LL;
    }
  }

  id v21 = sub_100007290();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Evaluating acceptability of connection from %{public}@",  buf,  0xCu);
  }

  if (v7)
  {
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteService connectionQueue](self, "connectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004720;
    block[3] = &unk_10000C490;
    id v28 = v5;
    id v29 = v8;
    v30 = self;
    dispatch_async(v23, block);
  }

  else
  {
    id v24 = sub_100007290();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Rejecting connection %{public}@", buf, 0xCu);
    }

    [v5 invalidate];
  }

  return v7;
}

- (id)manager:(id)a3 purgeTasksForUrgency:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteService policyManager](self, "policyManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 manager:v6 purgeTasksForUrgency:a4]);

  return v8;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXPCListener:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (TVCacheDeleteManager)cacheDeleteManager
{
  return self->_cacheDeleteManager;
}

- (void)setCacheDeleteManager:(id)a3
{
}

- (TVAppCachePolicyManager)policyManager
{
  return self->_policyManager;
}

- (void)setPolicyManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end