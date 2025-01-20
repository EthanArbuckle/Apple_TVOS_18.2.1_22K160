@interface TKHostKeychainHandler
+ (BOOL)isUnlocked;
- (TKHostKeychainHandler)init;
- (id)operations;
- (void)accessKeychainWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation TKHostKeychainHandler

- (TKHostKeychainHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKHostKeychainHandler;
  v2 = -[TKHostKeychainHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("mkb-keychain-monitor", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

+ (BOOL)isUnlocked
{
  int v2 = MKBGetDeviceLockState(0LL, a2);
  return !v2 || v2 == 3;
}

- (void)accessKeychainWithBlock:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A460;
  block[3] = &unk_10001C7E8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKHostKeychainHandler;
  -[TKHostKeychainHandler dealloc](&v4, "dealloc");
}

- (id)operations
{
  if (qword_100024050 != -1) {
    dispatch_once(&qword_100024050, &stru_10001C808);
  }
  return (id)qword_100024048;
}

- (void).cxx_destruct
{
}

@end