@interface WiFiAccountStoreManager
+ (id)sharedWiFiAccountStoreManager;
- (ACAccountStore)accountStore;
- (BOOL)isManagedAppleID;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiAccountStoreManager)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)_updateIsManagedAppleIDAndNotify:(BOOL)a3;
- (void)callback;
- (void)context;
- (void)dealloc;
- (void)registerCallback:(void *)a3 withContext:(void *)a4;
- (void)setCallback:(void *)a3;
- (void)setContext:(void *)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsManagedAppleID:(BOOL)a3;
@end

@implementation WiFiAccountStoreManager

+ (id)sharedWiFiAccountStoreManager
{
  if (qword_1002198D0 != -1) {
    dispatch_once(&qword_1002198D0, &stru_1001E33E0);
  }
  return (id)qword_1002198C8;
}

- (WiFiAccountStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiAccountStoreManager;
  v2 = -[WiFiAccountStoreManager init](&v8, "init");
  if (!v2)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Failed in super-init"];
    }
    goto LABEL_12;
  }

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifid.accountstore", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null dispatchQueue" message:3];
    }
    goto LABEL_12;
  }

  v5 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  v2->_accountStore = v5;
  if (!v5)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Null _accountStore" message:3];
    }
LABEL_12:
    objc_autoreleasePoolPop(v7);

    return 0LL;
  }

  -[WiFiAccountStoreManager _updateIsManagedAppleIDAndNotify:](v2, "_updateIsManagedAppleIDAndNotify:", 0LL);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_accountStoreDidChange:",  ACAccountStoreDidChangeNotification,  0LL);
  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  callback = self->_callback;
  if (callback)
  {
    _Block_release(callback);
    self->_callback = 0LL;
  }

  if (self->_context) {
    self->_context = 0LL;
  }
  accountStore = self->_accountStore;
  if (accountStore) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiAccountStoreManager;
  -[WiFiAccountStoreManager dealloc](&v6, "dealloc");
}

- (void)registerCallback:(void *)a3 withContext:(void *)a4
{
}

- (BOOL)isManagedAppleID
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005D52C;
  v4[3] = &unk_1001E2808;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WiFiAccountStoreManager dispatchQueue](self, "dispatchQueue"), v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateIsManagedAppleIDAndNotify:(BOOL)a3
{
  v7[0] = 0LL;
  v7[1] = v7;
  v7[2] = 0x2020000000LL;
  unsigned __int8 v8 = -86;
  unsigned __int8 v8 = [ -[ACAccountStore aa_primaryAppleAccount]( -[WiFiAccountStoreManager accountStore](self, "accountStore"),  "aa_primaryAppleAccount") aa_isManagedAppleID];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D604;
  block[3] = &unk_1001E3408;
  block[4] = self;
  block[5] = v7;
  BOOL v6 = a3;
  dispatch_sync((dispatch_queue_t)-[WiFiAccountStoreManager dispatchQueue](self, "dispatchQueue"), block);
  _Block_object_dispose(v7, 8);
}

- (void)_accountStoreDidChange:(id)a3
{
}

- (void)setIsManagedAppleID:(BOOL)a3
{
  self->_isManagedAppleID = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

@end