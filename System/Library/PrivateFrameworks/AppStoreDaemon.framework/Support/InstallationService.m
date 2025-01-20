@interface InstallationService
- (InstallationService)init;
- (id)_init;
- (void)dealloc;
- (void)installAppReviewApps:(id)a3 withReplyHandler:(id)a4;
- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installScreenSyncApps:(id)a3 withReplyHandler:(id)a4;
- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
@end

@implementation InstallationService

- (InstallationService)init
{
  return (InstallationService *)-[InstallationService _init](self, "_init");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___InstallationService;
  -[InstallationService dealloc](&v4, "dealloc");
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___InstallationService;
  v2 = -[InstallationService init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.InstallationService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v7;

    id v9 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v10;
  }

  return v2;
}

- (void)installAppReviewApps:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001A9A20;
  v14[3] = &unk_1003EA5E8;
  id v15 = v6;
  id v16 = v9;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v14 = (id)objc_claimAutoreleasedReturnValue(v9);
  if (self)
  {
    uint64_t v10 = ASDErrorDomain;
    id v11 = v7;
    uint64_t v12 = ASDErrorWithDescription(v10, 909LL, @"This platform is not yet implemented");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    (*((void (**)(id, void, void *))v7 + 2))(v11, 0LL, v13);
  }
}

- (void)installScreenSyncApps:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001A9C90;
  v11[3] = &unk_1003E9FD0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  sub_10022ED10(dispatchQueue, v11);
}

- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v14 = (id)objc_claimAutoreleasedReturnValue(v9);
  id v10 = v7;
  if (self)
  {
    id v11 = sub_100250250((uint64_t)&OBJC_CLASS___InstallTestFlightAppsTask, v8, 0LL, v14);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001AA44C;
    v15[3] = &unk_1003EA3B8;
    id v16 = v10;
    v17 = v12;
    [v12 setCompletionBlock:v15];
    taskQueue = self->_taskQueue;
    if (taskQueue) {
      -[NSOperationQueue addOperation:](taskQueue->_operationQueue, "addOperation:", v12);
    }
  }
}

- (void).cxx_destruct
{
}

@end