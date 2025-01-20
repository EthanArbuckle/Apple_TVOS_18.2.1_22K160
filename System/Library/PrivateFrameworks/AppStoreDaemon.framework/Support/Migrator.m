@interface Migrator
- (Migrator)init;
- (void)_handleMonitorStateDidChangeNotification:(id)a3;
- (void)_handleNetworkStateDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation Migrator

- (Migrator)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___Migrator;
  v2 = -[Migrator init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.Migrator", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___MigratorConfigurationStore);
    configurationStore = v2->_configurationStore;
    v2->_configurationStore = v7;

    v9 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100253B04;
    block[3] = &unk_1003E9880;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v4 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 removeObserver:self name:@"NetworkStateDidChangeNotification" object:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___Migrator;
  -[Migrator dealloc](&v6, "dealloc");
}

- (void)_handleNetworkStateDidChangeNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002547C4;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMonitorStateDidChangeNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100254DD8;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end