@interface INActivity
- (BOOL)isRepeating;
- (BOOL)setActivityState:(int64_t)a3;
- (INActivity)initWithTarget:(id)a3 action:(SEL)a4;
- (NSString)activityNextFireDateKey;
- (const)activityID;
- (void)_configureXPCActivityWithCriteria:(id)a3;
- (void)_scheduleNextFireForDate:(id)a3;
- (void)checkIn;
- (void)ensureNextActivityWillOccurBeforeDate:(id)a3;
- (void)setActivityID:(const char *)a3;
- (void)setActivityNextFireDateKey:(id)a3;
- (void)setIsRepeating:(BOOL)a3;
- (void)setNextActivityDate:(id)a3;
- (void)stop;
@end

@implementation INActivity

- (INActivity)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___INActivity;
  v8 = -[INActivity init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[INActivity setIsRepeating:](v8, "setIsRepeating:", 1LL);
    objc_storeStrong(&v9->_target, a3);
    v9->_action = a4;
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ind.activity", v11);
    activityQueue = v9->_activityQueue;
    v9->_activityQueue = (OS_dispatch_queue *)v12;
  }

  return v9;
}

- (void)checkIn
{
  activityQueue = (dispatch_queue_s *)self->_activityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003910;
  block[3] = &unk_100024AB8;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

- (void)stop
{
  activityQueue = (dispatch_queue_s *)self->_activityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003974;
  block[3] = &unk_100024AB8;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

- (BOOL)setActivityState:(int64_t)a3
{
  xpcActivity = self->_xpcActivity;
  if (xpcActivity) {
    LOBYTE(xpcActivity) = xpc_activity_set_state(xpcActivity, a3);
  }
  return (char)xpcActivity;
}

- (void)setNextActivityDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100014AE8((uint64_t)v4, self);
  }

  -[INActivity _scheduleNextFireForDate:](self, "_scheduleNextFireForDate:", v4);
}

- (void)ensureNextActivityWillOccurBeforeDate:(id)a3
{
  id v4 = a3;
  activityQueue = (dispatch_queue_s *)self->_activityQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003B24;
  v7[3] = &unk_100024AE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activityQueue, v7);
}

- (void)_configureXPCActivityWithCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (char *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG)) {
    sub_100014E3C(self, v6);
  }

  if (v4)
  {
    if (self->_xpcActivity)
    {
      BOOL v8 = -[INActivity isRepeating](self, "isRepeating");
      BOOL v9 = v8;
      uint64_t v10 = _INLogSystem(v8);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v12) {
          sub_100014D68((uint64_t)v4, self);
        }

        xpc_activity_set_criteria(self->_xpcActivity, v4);
        goto LABEL_17;
      }

      if (v12) {
        sub_100014DD4(self, (const char *)v11);
      }
    }

    else
    {
      uint64_t v13 = _INLogSystem(v7);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100014D00(self, (const char *)v11);
      }
    }
  }

  uint64_t v14 = _INLogSystem(v7);
  objc_super v15 = (char *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
    sub_100014C98(self, v15);
  }

  v16 = -[INActivity activityID](self, "activityID");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100003F14;
  v17[3] = &unk_100024B30;
  v17[4] = self;
  id v18 = v4;
  xpc_activity_register(v16, XPC_ACTIVITY_CHECK_IN, v17);

LABEL_17:
}

- (void)_scheduleNextFireForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2080;
    v25 = -[INActivity activityID](self, "activityID");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requested date %@ for %s",  (uint8_t *)&v22,  0x16u);
  }

  id v7 = [v4 timeIntervalSinceNow];
  double v9 = v8;
  uint64_t v10 = _INLogSystem(v7);
  v11 = (char *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
    sub_100015140(self, v11);
  }

  if (v9 <= 0.0)
  {
    uint64_t v16 = _INLogSystem(v12);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000150B8(self, (const char *)v4, v13);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    if (-[INActivity isRepeating](self, "isRepeating"))
    {
      double v14 = (double)XPC_ACTIVITY_INTERVAL_1_HOUR;
      else {
        double v15 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_INTERVAL, (uint64_t)v9);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)v15);
      double v9 = v9 - v15;
    }

    else
    {
      xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, 1LL);
    }

    xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, (uint64_t)v9);
    -[INActivity _configureXPCActivityWithCriteria:](self, "_configureXPCActivityWithCriteria:", v13);
    [v4 timeIntervalSinceReferenceDate];
    double v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[INManagedDefaults sharedInstance](&OBJC_CLASS___INManagedDefaults, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[INActivity activityNextFireDateKey](self, "activityNextFireDateKey"));
    [v19 setValue:v20 forManagedDefault:v21];
  }
}

- (const)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(const char *)a3
{
  self->_activityID = a3;
}

- (NSString)activityNextFireDateKey
{
  return self->_activityNextFireDateKey;
}

- (void)setActivityNextFireDateKey:(id)a3
{
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (void)setIsRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end