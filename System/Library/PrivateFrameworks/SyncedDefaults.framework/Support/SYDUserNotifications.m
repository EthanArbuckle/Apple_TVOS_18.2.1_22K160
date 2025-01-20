@interface SYDUserNotifications
+ (BOOL)shouldShowNotifications;
+ (id)queue;
+ (id)userNotificationCenter;
+ (void)requestAuthorizationIfNecessary;
+ (void)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5;
+ (void)showUserNotificationIfEnabledForStoreIdentifier:(id)a3 format:(id)a4;
@end

@implementation SYDUserNotifications

+ (void)showUserNotificationIfEnabledForStoreIdentifier:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 shouldShowNotifications])
  {
    v15 = &v16;
    v8 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v7,  &v16);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000A440;
    v11[3] = &unk_10004CC50;
    v13 = v8;
    id v14 = a1;
    id v12 = v6;
    v10 = v8;
    dispatch_async(v9, v11);
  }
}

+ (void)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 requestAuthorizationIfNecessary];
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2050000000LL;
  v11 = (void *)qword_1000579A8;
  uint64_t v28 = qword_1000579A8;
  if (!qword_1000579A8)
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10000AA60;
    v23 = &unk_10004CD58;
    v24 = &v25;
    sub_10000AA60((uint64_t)&v20);
    v11 = (void *)v26[3];
  }

  id v12 = v11;
  _Block_object_dispose(&v25, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setTitle:v8];
  [v13 setBody:v9];
  [v13 setThreadIdentifier:v10];
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2050000000LL;
  id v14 = (void *)qword_1000579B8;
  uint64_t v28 = qword_1000579B8;
  if (!qword_1000579B8)
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10000AB58;
    v23 = &unk_10004CD58;
    v24 = &v25;
    sub_10000AB58((uint64_t)&v20);
    id v14 = (void *)v26[3];
  }

  id v15 = v14;
  _Block_object_dispose(&v25, 8);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 requestWithIdentifier:v17 content:v13 trigger:0]);

  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 userNotificationCenter]);
  [v19 addNotificationRequest:v18 withCompletionHandler:&stru_10004CC90];
}

+ (void)requestAuthorizationIfNecessary
{
  if ([a1 shouldShowNotifications])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000A7A0;
    block[3] = &unk_10004CCF0;
    block[4] = a1;
    if (qword_100057980 != -1) {
      dispatch_once(&qword_100057980, block);
    }
  }

+ (id)userNotificationCenter
{
  if (qword_100057990 != -1) {
    dispatch_once(&qword_100057990, &stru_10004CD10);
  }
  return (id)qword_100057988;
}

+ (BOOL)shouldShowNotifications
{
  int v2 = _os_feature_enabled_impl("KVS", "KVSNotifications");
  if (v2) {
    LOBYTE(v2) = os_variant_has_internal_content("com.apple.kvs");
  }
  return v2;
}

+ (id)queue
{
  if (qword_1000579A0 != -1) {
    dispatch_once(&qword_1000579A0, &stru_10004CD30);
  }
  return (id)qword_100057998;
}

@end