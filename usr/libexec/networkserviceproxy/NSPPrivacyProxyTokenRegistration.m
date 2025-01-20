@interface NSPPrivacyProxyTokenRegistration
- (void)reportErrorForAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)tokenLowWaterMarkReachedForAgent:(id)a3;
@end

@implementation NSPPrivacyProxyTokenRegistration

- (void)tokenLowWaterMarkReachedForAgent:(id)a3
{
  id v4 = a3;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_100005D20;
  v12[4] = sub_100005D30;
  id v13 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenLowWaterMarkReachedForAgent");
  uint64_t v5 = NPGetInternalQueue(v13);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005FE0;
  block[3] = &unk_1000F9320;
  id v9 = v4;
  v10 = self;
  v11 = v12;
  id v7 = v4;
  dispatch_async(v6, block);

  _Block_object_dispose(v12, 8);
}

- (void)reportErrorForAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = sub_100005D20;
  v20[4] = sub_100005D30;
  id v21 = (id)os_transaction_create("com.apple.networkserviceproxy.reportErrorForAgent");
  uint64_t v10 = NPGetInternalQueue(v21);
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006204;
  block[3] = &unk_1000F9348;
  int v19 = a4;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  v18 = v20;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);

  _Block_object_dispose(v20, 8);
}

- (void).cxx_destruct
{
}

@end