@interface UpgradeOperation
- (NSError)error;
- (NSString)cryptexName;
- (NSString)graftPath;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)logHandle;
- (UpgradeOperation)initWithCryptexName:(id)a3 graftPath:(id)a4;
- (void)completeUpgrade;
- (void)onComplete:(id)a3 withQueue:(id)a4;
- (void)setError:(id)a3;
- (void)startUpgrade;
- (void)terminateJobsWithCompletion:(id)a3;
@end

@implementation UpgradeOperation

- (UpgradeOperation)initWithCryptexName:(id)a3 graftPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UpgradeOperation;
  v9 = -[UpgradeOperation init](&v18, "init");
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.libcryptex", "upgrade");
    logHandle = v9->_logHandle;
    v9->_logHandle = v10;

    dispatch_group_t v12 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v12;

    objc_storeStrong((id *)&v9->_cryptexName, a3);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.security.cryptexd.upgrade", 0LL);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_graftPath, a4);
    error = v9->_error;
    v9->_error = 0LL;
  }

  return v9;
}

- (void)terminateJobsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation cryptexName](self, "cryptexName"));
  id v6 = [v5 UTF8String];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100001D48;
  v9[3] = &unk_1000550B0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  sub_10000DD40((uint64_t)v6, 0x3Cu, v7, v9);
}

- (void)startUpgrade
{
  int v3 = *__error();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation logHandle](self, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Upgrade started.", v6, 2u);
  }

  *__error() = v3;
  id v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation group](self, "group"));
  dispatch_group_enter(v5);
}

- (void)completeUpgrade
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  dispatch_assert_queue_not_V2(v3);

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000229C;
  block[3] = &unk_1000550D8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)onComplete:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  id v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation group](self, "group"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000023E4;
  v10[3] = &unk_100055100;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(v8, v7, v10);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)cryptexName
{
  return self->_cryptexName;
}

- (NSString)graftPath
{
  return self->_graftPath;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setError:(id)a3
{
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
}

@end