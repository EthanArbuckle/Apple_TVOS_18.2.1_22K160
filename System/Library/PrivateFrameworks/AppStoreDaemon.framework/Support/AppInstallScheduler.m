@interface AppInstallScheduler
- (AppInstallScheduler)init;
- (void)_didDeleteEntityNotification:(id)a3;
- (void)_handlePolicyNotificationWithMonitorStateDidChangeNotification:(id)a3;
@end

@implementation AppInstallScheduler

- (AppInstallScheduler)init
{
  id v3 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (self)
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___AppInstallScheduler;
    self = -[AppInstallScheduler init](&v20, "init");
    if (self)
    {
      dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.AppInstallScheduler", v7);
      dispatchQueue = self->_dispatchQueue;
      self->_dispatchQueue = v8;

      objc_storeStrong((id *)&self->_databaseStore, v4);
      v10 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
      bootstrapQueue = self->_bootstrapQueue;
      self->_bootstrapQueue = v10;

      v12 = self->_bootstrapQueue;
      if (v12) {
        -[NSOperationQueue setName:]( v12->_operationQueue,  "setName:",  @"com.apple.appstored.TaskQueue.bootstrapQueue");
      }
      v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      retryCount = self->_retryCount;
      self->_retryCount = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v15 addObserver:self selector:"_didDeleteEntityNotification:" name:@"SQLiteDidDeleteEntityNotification" object:0];

      v16 = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10023BBC0;
      block[3] = &unk_1003E9880;
      self = self;
      v19 = self;
      dispatch_async(v16, block);
    }
  }

  return self;
}

- (void)_didDeleteEntityNotification:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SQLiteUserInfoKeyPersistentID"]);

  if (v5)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10023D3BC;
    v7[3] = &unk_1003E9DC0;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_handlePolicyNotificationWithMonitorStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10023D448;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
}

@end