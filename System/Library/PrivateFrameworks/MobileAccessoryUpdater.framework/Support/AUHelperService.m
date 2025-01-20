@interface AUHelperService
- (AUHelperService)initWithQueue:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (void)userPreferenceObjectForSuite:(unint64_t)a3 withKey:(id)a4 withReply:(id)a5;
- (void)userPreferenceSetObject:(id)a3 forSuite:(unint64_t)a4 withKey:(id)a5;
@end

@implementation AUHelperService

- (AUHelperService)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AUHelperService;
  v6 = -[AUHelperService init](&v15, "init");
  if (!v6) {
    goto LABEL_4;
  }
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.auhelper", "AUHelper");
  log = v6->_log;
  v6->_log = v7;

  objc_storeStrong((id *)&v6->_listenerQueue, a3);
  v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accessoryupdater.launchauhelper");
  listener = v6->_listener;
  v6->_listener = v9;

  v11 = v6->_listener;
  if (v11)
  {
    -[NSXPCListener setDelegate:](v11, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");
LABEL_4:
    v12 = v6;
    goto LABEL_8;
  }

  v13 = v6->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000480A0(v13);
  }
  v12 = 0LL;
LABEL_8:

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  listenerQueue = (dispatch_queue_s *)self->_listenerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006008;
  block[3] = &unk_100075338;
  id v10 = v5;
  v11 = &v12;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(listenerQueue, block);
  LOBYTE(listenerQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)listenerQueue;
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.accessoryupdater.launchauhelper.entitled"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && ([v5 BOOLValue])
  {
    BOOL v7 = 1;
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100048150(log, v4);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)userPreferenceObjectForSuite:(unint64_t)a3 withKey:(id)a4 withReply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = sub_100003C9C(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    uint64_t v12 = -[NSUserDefaults initWithSuiteName:](objc_alloc(&OBJC_CLASS___NSUserDefaults), "initWithSuiteName:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v12, "objectForKey:", v8));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315906;
      v16 = "-[AUHelperService userPreferenceObjectForSuite:withKey:withReply:]";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  " %s: Read out %@: %@ for %@",  (uint8_t *)&v15,  0x2Au);
    }

    v9[2](v9, v13);

    v9 = (void (**)(id, void *))v12;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000481DC();
    }
    v9[2](v9, 0LL);
  }
}

- (void)userPreferenceSetObject:(id)a3 forSuite:(unint64_t)a4 withKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100003C9C(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  log = self->_log;
  if (v11)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315906;
      int v15 = "-[AUHelperService userPreferenceSetObject:forSuite:withKey:]";
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  " %s: Write %@: %@ to %@",  (uint8_t *)&v14,  0x2Au);
    }

    v13 = -[NSUserDefaults initWithSuiteName:](objc_alloc(&OBJC_CLASS___NSUserDefaults), "initWithSuiteName:", v11);
    -[NSUserDefaults setObject:forKey:](v13, "setObject:forKey:", v8, v9);
  }

  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    sub_100048248();
  }
}

- (void).cxx_destruct
{
}

@end