@interface BKGSEventSystem
+ (id)sharedInstance;
- (BKGSEventSystem)init;
- (void)_handleEvent:(__GSEvent *)a3;
@end

@implementation BKGSEventSystem

- (BKGSEventSystem)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BKGSEventSystem;
  v2 = -[BKGSEventSystem init](&v4, "init");
  if (v2)
  {
    GSEventRegisterEventCallBack(sub_1000277C0);
    GSEventInitializeWorkspaceWithQueue(&_dispatch_main_q);
  }

  return v2;
}

- (void)_handleEvent:(__GSEvent *)a3
{
  uint64_t Type = GSEventGetType(a3, a2);
  if ((_DWORD)Type == 50)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    [v10 injectGSEvent:a3];
  }

  else
  {
    int v5 = Type;
    if ((_DWORD)Type == 100)
    {
      id v6 = sub_10003F2F4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int SenderPID = GSEventGetSenderPID(a3);
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring call to deprecated GSEventResetIdleTimer received from %d",  buf,  8u);
      }
    }

    else
    {
      uint64_t v8 = BKLogEventDelivery(Type);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int SenderPID = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "_handleEvent: Ignoring GSEvent type:%d.",  buf,  8u);
      }
    }
  }

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027878;
  block[3] = &unk_1000B7108;
  block[4] = a1;
  if (qword_1000DBFB0 != -1) {
    dispatch_once(&qword_1000DBFB0, block);
  }
  return (id)qword_1000DBFA8;
}

@end