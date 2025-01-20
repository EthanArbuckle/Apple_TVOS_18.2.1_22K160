@interface BluetoothScanController
- (id)checkPresence;
- (void)start;
@end

@implementation BluetoothScanController

- (void)start
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[BluetoothScanController checkPresence](self, "checkPresence"));
  if ((-[BluetoothScanController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothScanController result](self, "result"));
    [v3 setStatusCode:v4];
  }

  -[BluetoothScanController setFinished:](self, "setFinished:", 1LL);
}

- (id)checkPresence
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_100003360;
  v17 = sub_100003370;
  v18 = &off_100008530;
  v3 = objc_autoreleasePoolPush();
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String], 0);
  v6 = objc_alloc_init(&OBJC_CLASS___OSDBluetooth);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003378;
  v10[3] = &unk_100008270;
  v10[4] = self;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  -[OSDBluetooth performScanOnQueue:timeout:gracePeriod:completionBlock:]( v6,  "performScanOnQueue:timeout:gracePeriod:completionBlock:",  v5,  v10,  10.0,  2.0);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v3);
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

@end