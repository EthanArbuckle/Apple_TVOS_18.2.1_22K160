@interface MobileTimerAssistantAlarmDismiss
- (id)_alarmManager;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmDismiss

- (id)_alarmManager
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2050000000LL;
  v2 = (void *)qword_206A8;
  uint64_t v9 = qword_206A8;
  if (!qword_206A8)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_5AD8;
    v5[3] = &unk_18520;
    v5[4] = &v6;
    sub_5AD8((uint64_t)v5);
    v2 = (void *)v7[3];
  }

  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_102E4(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantAlarmDismiss _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10274(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmDismiss description](self, "description"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmDismiss alarmIds](self, "alarmIds"));
  if ([v6 count])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmDismiss _alarmManager](self, "_alarmManager"));
    uint64_t v8 = MTLogForCategory(3LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MobileTimerAssistantAlarmDismiss _performWithCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v7 alarms]);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v48 = sub_5178;
    v49 = sub_5188;
    id v50 = 0LL;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_5190;
    v41[3] = &unk_18468;
    id v11 = v5;
    id v42 = v11;
    id v43 = v6;
    id v12 = v7;
    id v44 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v28 flatMap:v41]);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_57FC;
    v37[3] = &unk_184D0;
    id v14 = v11;
    id v38 = v14;
    v40 = buf;
    v15 = v10;
    v39 = v15;
    id v16 = [v13 addSuccessBlock:v37];
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    v32 = sub_59E0;
    v33 = &unk_184F8;
    id v34 = v14;
    v36 = buf;
    uint64_t v17 = v15;
    v35 = v17;
    id v18 = [v13 addFailureBlock:&v30];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (v4)
    {
      uint64_t v19 = MTLogForCategory(3LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
        sub_103A8((uint64_t)self, v21, v46);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
      v4[2](v4, v22);

      uint64_t v23 = MTLogForCategory(3LL);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
        sub_10354((uint64_t)self, v25, v45);
      }
    }

    +[MTAnalytics incrementEventCount:]( &OBJC_CLASS___MTAnalytics,  "incrementEventCount:",  kMTCASiriAlarmDismisses,  v28,  v30,  v31,  v32,  v33);

    _Block_object_dispose(buf, 8);
  }

  else if (v4)
  {
    id v26 = [[SACommandFailed alloc] initWithReason:@"No alarm ID is provided."];
    [v26 setErrorCode:1];
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dictionary]);
    v4[2](v4, v27);
  }
}

@end