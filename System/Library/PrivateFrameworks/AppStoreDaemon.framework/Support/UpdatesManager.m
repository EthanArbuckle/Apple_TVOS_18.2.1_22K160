@interface UpdatesManager
+ (BOOL)isTVProviderApp:(int64_t)a3;
+ (BOOL)shouldUseModernUpdates;
+ (id)_internalManager;
+ (id)sharedManager;
- (BOOL)_shouldUseModernUpdates;
- (BOOL)shouldUseModernUpdates;
- (UpdatesManager)init;
- (void)_invalidateCachedModernUpdatesValue:(id)a3;
@end

@implementation UpdatesManager

- (UpdatesManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UpdatesManager;
  v2 = -[UpdatesManager init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    unfairLock = v2->_unfairLock;
    v2->_unfairLock = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_invalidateCachedModernUpdatesValue:" name:AMSBagChangedNotification object:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
    [v6 addObserver:v2 selector:"_invalidateCachedModernUpdatesValue:" name:@"AccountStorePrimaryAccountDidChange" object:v7];
  }

  return v2;
}

+ (id)_internalManager
{
  if (qword_1004624D0 != -1) {
    dispatch_once(&qword_1004624D0, &stru_1003EFA00);
  }
  return (id)qword_1004624D8;
}

+ (id)sharedManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _internalManager]);
  unsigned int v3 = [v2 shouldUseModernUpdates];

  if (v3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager_Swift shared](&OBJC_CLASS____TtC9appstored20UpdatesManager_Swift, "shared"));
  }
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager_ObjC sharedManager](&OBJC_CLASS___UpdatesManager_ObjC, "sharedManager"));
  }
  return v4;
}

+ (BOOL)shouldUseModernUpdates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _internalManager]);
  unsigned __int8 v3 = [v2 shouldUseModernUpdates];

  return v3;
}

+ (BOOL)isTVProviderApp:(int64_t)a3
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedManager]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10027E14C;
  v9[3] = &unk_1003EFA28;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  [v6 isTVProviderApp:a3 withReplyHandler:v9];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

- (BOOL)shouldUseModernUpdates
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10027E338;
  v23 = sub_10027E348;
  id v24 = 0LL;
  unfairLock = self->_unfairLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10027E350;
  v18[3] = &unk_1003E9BE0;
  v18[4] = self;
  v18[5] = &v19;
  sub_1002C11C4(unfairLock, v18);
  v4 = (void *)v20[5];
  if (v4)
  {
    LOBYTE(v5) = [v4 BOOLValue];
  }

  else
  {
    unsigned int v5 = -[UpdatesManager _shouldUseModernUpdates](self, "_shouldUseModernUpdates");
    v6 = self->_unfairLock;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10027E364;
    v16[3] = &unk_1003EC5C0;
    v16[4] = self;
    char v17 = v5;
    sub_1002C11C4(v6, v16);
    id v7 = sub_1002F8D10((uint64_t)&OBJC_CLASS___AppDefaultsManager, @"CurrentUpdateSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = [v8 isEqualToNumber:&off_10040CD00];
    if (v8 && v5 != v9)
    {
      id v10 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10027E3A0;
      v14[3] = &unk_1003EFA48;
      char v15 = v5;
      [v11 modifyUsingTransaction:v14];
    }

    if (v5) {
      uint64_t v12 = &off_10040CD00;
    }
    else {
      uint64_t v12 = &off_10040CD18;
    }
    sub_1002F8D94((uint64_t)&OBJC_CLASS___AppDefaultsManager, v12, @"CurrentUpdateSource");
  }

  _Block_object_dispose(&v19, 8);

  return v5;
}

- (void)_invalidateCachedModernUpdatesValue:(id)a3
{
  unfairLock = self->_unfairLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10027E410;
  v4[3] = &unk_1003E9880;
  v4[4] = self;
  sub_1002C11C4(unfairLock, v4);
}

- (BOOL)_shouldUseModernUpdates
{
  if (os_variant_has_internal_content("com.apple.appstored")
    && sub_1002F8BE0((uint64_t)&OBJC_CLASS___AppDefaultsManager, @"UseMAPIUpdates", 0LL))
  {
    uint64_t v2 = ASDLogHandleForCategory(40LL);
    unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Using modern updates due to default being set",  v13,  2u);
    }

    return 1;
  }

  id v4 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  double v7 = sub_10025716C(v5, @"media-api-updates-rollout-rate", 1, 0.0);

  if (v7 <= 0.0) {
    return 0;
  }
  if (v7 >= 1.0) {
    return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_activeiTunesAccount"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_DSID"));

  if (v10) {
    BOOL v11 = (uint64_t)[v10 integerValue] % 100 < (uint64_t)(v7 * 100.0);
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end