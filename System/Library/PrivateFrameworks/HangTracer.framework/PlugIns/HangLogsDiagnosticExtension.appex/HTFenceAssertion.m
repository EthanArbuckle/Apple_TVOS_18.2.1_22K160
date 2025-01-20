@interface HTFenceAssertion
- (HTFenceAssertion)initWithFenceName:(unint64_t)a3;
- (void)blown;
- (void)invalidate;
@end

@implementation HTFenceAssertion

- (HTFenceAssertion)initWithFenceName:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___HTFenceAssertion;
  v4 = -[HTFenceAssertion init](&v19, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v4->__name = a3;
  v4->__startTime = mach_absolute_time();
  if (qword_10001A218 != -1) {
    dispatch_once(&qword_10001A218, &stru_100014B40);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v7 = [v6 hangtracerDaemonEnabled];

  if ((v7 & 1) == 0)
  {
    id v13 = shared_ht_log_handle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000C468();
    }
    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v9 = [v8 fenceTrackingEnabled];

  if ((v9 & 1) == 0)
  {
    id v15 = shared_ht_log_handle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000C43C();
    }
LABEL_12:

    v12 = 0LL;
    goto LABEL_13;
  }

  sub_10000A608();
  id v10 = sub_10000A63C();
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A67C;
  block[3] = &unk_100014540;
  v18 = v5;
  dispatch_async(v11, block);

LABEL_7:
  v12 = v5;
LABEL_13:

  return v12;
}

- (void)invalidate
{
  uint64_t v3 = mach_absolute_time();
  id v4 = sub_10000A63C();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A7E0;
  v6[3] = &unk_100014AA0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(v5, v6);
}

- (void)blown
{
  uint64_t v3 = mach_absolute_time();
  id v4 = sub_10000A63C();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A948;
  v6[3] = &unk_100014AA0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(v5, v6);
}

@end