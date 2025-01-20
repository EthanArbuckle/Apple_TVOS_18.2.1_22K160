@interface ADDevicePropertiesUtils
+ (int)_SISchemaAppleMediaProductsSubscriptionFrom:(id)a3;
+ (void)fetchActiveSubscriptionsWithQueue:(id)a3 completion:(id)a4;
@end

@implementation ADDevicePropertiesUtils

+ (void)fetchActiveSubscriptionsWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1002DDE7C;
  v38 = sub_1002DDE8C;
  id v39 = 0LL;
  id v9 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1002DDE94;
  v26[3] = &unk_1004FACB8;
  id v10 = v6;
  id v27 = v10;
  p___int128 buf = &buf;
  id v11 = v7;
  id v28 = v11;
  id v12 = [v9 initWithBlock:v26];
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2050000000LL;
  v13 = (void *)qword_100578470;
  uint64_t v34 = qword_100578470;
  if (!qword_100578470)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1002DDF3C;
    v30[3] = &unk_1004FDB20;
    v30[4] = &v31;
    sub_1002DDF3C((uint64_t)v30);
    v13 = (void *)v32[3];
  }

  id v14 = v13;
  _Block_object_dispose(&v31, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sharedStatusController]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002DE0D8;
  v23[3] = &unk_1004FACE0;
  id v25 = a1;
  id v16 = v12;
  id v24 = v16;
  [v15 getSubscriptionStatusWithCompletionHandler:v23];
  v17 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002DE26C;
  v21[3] = &unk_1004FD940;
  id v18 = v16;
  id v22 = v18;
  v19 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v17,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v10,  v21,  3.0);
  v20 = *(void **)(*((void *)&buf + 1) + 40LL);
  *(void *)(*((void *)&buf + 1) + 40LL) = v19;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  _Block_object_dispose(&buf, 8);
}

+ (int)_SISchemaAppleMediaProductsSubscriptionFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 statusType];
  if (v4 == (id)1)
  {
    int v5 = 5;
  }

  else if (v4 == (id)2)
  {
    else {
      int v5 = 1;
    }
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

@end