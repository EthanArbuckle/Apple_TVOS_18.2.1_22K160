@interface PDFieldDetectorManager
- (PDFieldDetectorManager)init;
- (void)dealloc;
- (void)receivedSecureFieldEntranceEventWithProperties:(id)a3;
- (void)receivedSecureFieldExitEvent;
@end

@implementation PDFieldDetectorManager

- (PDFieldDetectorManager)init
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDFieldDetectorManager;
  -[PDFieldDetectorManager dealloc](&v3, "dealloc");
}

- (void)receivedSecureFieldEntranceEventWithProperties:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)sub_10015B7F8();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015BB74;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedSecureFieldExitEvent
{
  objc_super v3 = (dispatch_queue_s *)sub_10015B7F8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015BFBC;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void).cxx_destruct
{
}

@end