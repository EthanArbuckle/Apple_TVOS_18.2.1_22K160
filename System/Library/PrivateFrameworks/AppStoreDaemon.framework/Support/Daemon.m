@interface Daemon
- (Daemon)init;
- (void)_handleMigrationDidFinishNotification:(id)a3;
- (void)dealloc;
@end

@implementation Daemon

- (Daemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___Daemon;
  v2 = -[Daemon init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.Daemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    transactionCount = v2->_transactionCount;
    v2->_transactionCount = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactionStore = v2->_transactionStore;
    v2->_transactionStore = v9;
  }

  return v2;
}

- (void)dealloc
{
  jetsamSource = self->_jetsamSource;
  if (jetsamSource) {
    dispatch_source_cancel((dispatch_source_t)jetsamSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___Daemon;
  -[Daemon dealloc](&v4, "dealloc");
}

- (void)_handleMigrationDidFinishNotification:(id)a3
{
  int v3 = byte_1004625B8;
  objc_opt_self(&OBJC_CLASS___Daemon);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 synchronize];

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:@"osVersionStringKey"]);

  v7 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[Daemon] Fresh install detected upgrading to %@",  (uint8_t *)&v13,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v10 setObject:v7 forKey:@"osVersionStringKey"];
    goto LABEL_11;
  }

  unsigned __int8 v8 = [v6 isEqualToString:v7];
  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      int v13 = 138412546;
      v14 = v6;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[Daemon] OS version has updated from %@ to %@",  (uint8_t *)&v13,  0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v11 setObject:v7 forKey:@"osVersionStringKey"];

    id v12 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    sub_100186078((uint64_t)v10);
LABEL_11:

    goto LABEL_12;
  }

  if (v9)
  {
    int v13 = 138412290;
    v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[Daemon] OS version %@ is current",  (uint8_t *)&v13,  0xCu);
  }

- (void).cxx_destruct
{
}

@end