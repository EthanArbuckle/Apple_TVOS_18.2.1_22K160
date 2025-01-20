@interface InstallCoordinationObserver
+ (id)sharedInstance;
- (InstallCoordinationObserver)init;
- (void)_handleAppMayBeUninstalledNotification:(id)a3;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorShouldPause:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)coordinatorShouldResume:(id)a3;
- (void)shouldPrioritizeAppWithIdentity:(id)a3;
@end

@implementation InstallCoordinationObserver

+ (id)sharedInstance
{
  if (qword_1004627C8 != -1) {
    dispatch_once(&qword_1004627C8, &stru_1003F2A90);
  }
  return (id)qword_1004627C0;
}

- (InstallCoordinationObserver)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___InstallCoordinationObserver;
  v2 = -[InstallCoordinationObserver init](&v22, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppInstallObserver", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    policyQueue = v2->_policyQueue;
    v2->_policyQueue = v7;

    v9 = v2->_policyQueue;
    if (v9) {
      -[NSOperationQueue setName:]( v9->_operationQueue,  "setName:",  @"com.apple.appstored.AppInstallObserver.policyQueue");
    }
    id v10 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v11;

    uint64_t v13 = ASDLogHandleForCategory(2LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Observing installation notifications",  v21,  2u);
    }

    v15 = objc_alloc(&OBJC_CLASS___IXAppInstallObserver);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", &off_10040D240));
    v17 = -[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]( v15,  "initWithMachServiceName:forClients:delegate:",  @"com.apple.appstored.installcoordination",  v16,  v2);
    installObserver = v2->_installObserver;
    v2->_installObserver = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v2 selector:"_handleAppMayBeUninstalledNotification:" name:IXAppMayUninstallNotificationName object:0];
    [v19 addObserver:v2 selector:"_handleAppMayBeUninstalledNotification:" name:@"com.apple.StorageSettings.AppMayUninstall" object:0];
  }

  return v2;
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  databaseStore = self->_databaseStore;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002FFDE8;
  v17[3] = &unk_1003EBCA0;
  id v18 = v7;
  id v19 = v8;
  id v10 = v8;
  id v16 = v7;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v17);
  id v11 = sub_10030F240((uint64_t)&OBJC_CLASS___ODRDownloadManager);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 identity]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
  sub_1003100D4((uint64_t)v12, v14, v15);
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 URL]);
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    __int16 v29 = 2114;
    v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "coordinatorDidCompleteSuccessfully for bundleID: %{public}@ at URL: %{public}@",  buf,  0x16u);
  }

  databaseStore = self->_databaseStore;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100300568;
  v24[3] = &unk_1003EBCA0;
  id v13 = v6;
  id v25 = v13;
  id v14 = v7;
  id v26 = v14;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v24);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___IXGizmoInstallingAppInstallCoordinator, v15);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) == 0)
  {
    id v17 = sub_10030F240((uint64_t)&OBJC_CLASS___ODRDownloadManager);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 identity]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100300828;
    v22[3] = &unk_1003E9880;
    id v23 = v13;
    sub_1003125D0((uint64_t)v18, v20, v21, v22);
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 URL]);
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "coordinatorDidInstallPlaceholder for bundleID: %{public}@ at URL: %{public}@",  buf,  0x16u);
  }

  if (v7)
  {
    databaseStore = self->_databaseStore;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003009EC;
    v13[3] = &unk_1003ED090;
    id v14 = v6;
    -[AppInstallsDatabaseStore readUsingSession:](databaseStore, "readUsingSession:", v13);
  }
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v5 = ASDLogHandleForCategory(2LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Prioritization requested via coordinator %{public}@",  buf,  0xCu);
  }

  databaseStore = self->_databaseStore;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100300DB0;
  v20[3] = &unk_1003F2AB8;
  id v8 = v4;
  objc_super v22 = self;
  id v23 = &v24;
  id v21 = v8;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v20);
  if (*((_BYTE *)v25 + 24))
  {
    id v9 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
    char v13 = sub_1001998FC((uint64_t)v10, v12);
    *((_BYTE *)v25 + 24) = v13 ^ 1;

    if (*((_BYTE *)v25 + 24)) {
      goto LABEL_8;
    }
    uint64_t v14 = ASDLogHandleForCategory(2LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
      *(_DWORD *)buf = 138543362;
      id v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found in-flight purchase for '%{public}@', ignoring prioritization request",  buf,  0xCu);
    }

    if (*((_BYTE *)v25 + 24))
    {
LABEL_8:
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
      sub_1003016D0((uint64_t)self, v19, v8);
    }
  }

  _Block_object_dispose(&v24, 8);
}

- (void)coordinatorShouldPause:(id)a3
{
  id v4 = a3;
  databaseStore = self->_databaseStore;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100301C44;
  v12[3] = &unk_1003EA9D8;
  id v13 = v4;
  id v11 = v4;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v12);
  id v6 = sub_10030F240((uint64_t)&OBJC_CLASS___ODRDownloadManager);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
  sub_1003109F4((uint64_t)v7, v9, v10);
}

- (void)coordinatorShouldResume:(id)a3
{
  id v4 = a3;
  databaseStore = self->_databaseStore;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100301E78;
  v12[3] = &unk_1003EBCA0;
  id v13 = v4;
  uint64_t v14 = self;
  id v11 = v4;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v12);
  id v6 = sub_10030F240((uint64_t)&OBJC_CLASS___ODRDownloadManager);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
  sub_100310EDC((uint64_t)v7, v9, v10);
}

- (void)shouldPrioritizeAppWithIdentity:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  uint64_t v5 = ASDLogHandleForCategory(2LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = (id)objc_opt_class(self, v7);
    __int16 v16 = 2114;
    __int16 v17 = v4;
    id v8 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Prioritize for %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  if ([v4 length])
  {
    sub_1003016D0((uint64_t)self, v4, 0LL);
  }

  else
  {
    uint64_t v9 = ASDLogHandleForCategory(2LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class(self, v11);
      int v14 = 138543362;
      id v15 = v12;
      id v13 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Unable to prioritize due to no bundleID",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)_handleAppMayBeUninstalledNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = [v6 isHRNMode];

  if ((v7 & 1) == 0)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100302BA0;
    block[3] = &unk_1003E9880;
    id v10 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void).cxx_destruct
{
}

@end