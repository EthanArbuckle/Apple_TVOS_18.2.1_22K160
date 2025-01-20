@interface Environment
+ (id)sharedInstance;
- (Environment)init;
- (SQLiteDatabase)userDatabase;
@end

@implementation Environment

+ (id)sharedInstance
{
  if (qword_10032EAC8 != -1) {
    dispatch_once(&qword_10032EAC8, &stru_1002E9820);
  }
  return (id)qword_10032EAC0;
}

- (Environment)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___Environment;
  v2 = -[Environment init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storekit.Environment", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (SQLiteDatabase)userDatabase
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_10005F104;
  v10 = sub_10005F114;
  id v11 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005F11C;
  v5[3] = &unk_1002E7840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SQLiteDatabase *)v3;
}

- (void).cxx_destruct
{
}

@end