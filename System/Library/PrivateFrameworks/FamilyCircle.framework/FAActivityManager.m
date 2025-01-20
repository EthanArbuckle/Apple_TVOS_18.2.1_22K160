@interface FAActivityManager
- (FAActivityManager)initWithQueueProvider:(id)a3;
- (FAOSUpdatedActivity)osUpdatedActivity;
- (void)checkinXPCActivities;
- (void)handleAccountAddition:(id)a3 completion:(id)a4;
- (void)handleAccountDeletion:(id)a3 completion:(id)a4;
- (void)setOsUpdatedActivity:(id)a3;
@end

@implementation FAActivityManager

- (FAActivityManager)initWithQueueProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FAActivityManager;
  v5 = -[FAActivityManager init](&v15, "init");
  if (v5)
  {
    v6 = -[FAHeartbeatActivity initWithQueueProvider:]( objc_alloc(&OBJC_CLASS___FAHeartbeatActivity),  "initWithQueueProvider:",  v4);
    heartbeatActivity = v5->_heartbeatActivity;
    v5->_heartbeatActivity = v6;

    objc_initWeak(&location, v5->_heartbeatActivity);
    v8 = objc_alloc(&OBJC_CLASS___FAOSUpdatedActivity);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000073D4;
    v12[3] = &unk_100041440;
    objc_copyWeak(&v13, &location);
    v9 = -[FAOSUpdatedActivity initWithHeartbeatActivityHandler:](v8, "initWithHeartbeatActivityHandler:", v12);
    osUpdatedActivity = v5->_osUpdatedActivity;
    v5->_osUpdatedActivity = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)checkinXPCActivities
{
  uint64_t v3 = _FALogSystem(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking in XPC activities..", v6, 2u);
  }

  -[FAHeartbeatActivity checkin](self->_heartbeatActivity, "checkin");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAActivityManager osUpdatedActivity](self, "osUpdatedActivity"));
  [v5 checkinWithCompletionHandler:&stru_100041480];
}

- (void)handleAccountAddition:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _FALogSystem(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling account addition.", buf, 2u);
  }

  -[FAActivityManager checkinXPCActivities](self, "checkinXPCActivities");
  heartbeatActivity = self->_heartbeatActivity;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000075C0;
  v11[3] = &unk_1000414A8;
  id v12 = v5;
  v10 = (void (**)(id, uint64_t))v5;
  -[FAHeartbeatActivity performHeartbeatCheckinWithCompletion:]( heartbeatActivity,  "performHeartbeatCheckinWithCompletion:",  v11);
  v10[2](v10, 1LL);
}

- (void)handleAccountDeletion:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = _FALogSystem(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling account deletion.", v10, 2u);
  }

  -[FAHeartbeatActivity unregister](self->_heartbeatActivity, "unregister");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FAActivityManager osUpdatedActivity](self, "osUpdatedActivity"));
  [v9 unregister];

  v5[2](v5, 1LL);
}

- (FAOSUpdatedActivity)osUpdatedActivity
{
  return self->_osUpdatedActivity;
}

- (void)setOsUpdatedActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end