@interface INRegistrationDigestCache
+ (BOOL)isAvailable;
+ (id)sharedInstance;
- (BOOL)removeRegistrationDigestForAccount:(id)a3 withError:(id *)a4;
- (BOOL)updateRegistrationDigest:(id)a3 forAccount:(id)a4 withError:(id *)a5;
- (INRegistrationDigestCache)init;
- (id)registrationDigestForAccount:(id)a3 withError:(id *)a4;
- (void)dealloc;
@end

@implementation INRegistrationDigestCache

+ (BOOL)isAvailable
{
  return MKBDeviceUnlockedSinceBoot(a1, a2) == 1;
}

+ (id)sharedInstance
{
  if (qword_10002C218 != -1) {
    dispatch_once(&qword_10002C218, &stru_100024BC0);
  }
  return (id)qword_10002C210;
}

- (INRegistrationDigestCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___INRegistrationDigestCache;
  v2 = -[INRegistrationDigestCache init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ind.keychain", v4);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v5;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100004BC4;
    handler[3] = &unk_100024BE8;
    v9 = v2;
    notify_register_dispatch( "com.apple.mobile.keybagd.first_unlock",  &v2->_unlockNotifyToken,  &_dispatch_main_q,  handler);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___INRegistrationDigestCache;
  -[INRegistrationDigestCache dealloc](&v3, "dealloc");
}

- (id)registrationDigestForAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_100004D88;
  v23 = sub_100004D98;
  id v24 = 0LL;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v8 = v7;
  if (!v6)
  {

    v8 = @"logged-out";
  }

  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100004DA0;
  v14[3] = &unk_100024C10;
  v15 = v8;
  id v16 = v6;
  v17 = &v19;
  v18 = a4;
  id v10 = v6;
  v11 = v8;
  dispatch_sync(keychainQueue, v14);
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (BOOL)removeRegistrationDigestForAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v8 = v7;
  if (!v6)
  {

    v8 = @"logged-out";
  }

  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005014;
  v13[3] = &unk_100024C10;
  v14 = v8;
  id v15 = v6;
  id v16 = &v18;
  v17 = a4;
  id v10 = v6;
  v11 = v8;
  dispatch_sync(keychainQueue, v13);
  LOBYTE(keychainQueue) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)keychainQueue;
}

- (BOOL)updateRegistrationDigest:(id)a3 forAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v11 = v10;
  if (!v9)
  {

    v11 = @"logged-out";
  }

  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005268;
  block[3] = &unk_100024C38;
  id v18 = v8;
  uint64_t v19 = v11;
  id v20 = v9;
  char v21 = &v23;
  v22 = a5;
  id v13 = v9;
  v14 = v11;
  id v15 = v8;
  dispatch_sync(keychainQueue, block);
  LOBYTE(keychainQueue) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)keychainQueue;
}

- (void).cxx_destruct
{
}

@end