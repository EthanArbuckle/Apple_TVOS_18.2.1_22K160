@interface MobileTimerAssistantTimerDismiss
- (id)_timerManager;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerDismiss

- (id)_timerManager
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2050000000LL;
  v2 = (void *)qword_206E0;
  uint64_t v9 = qword_206E0;
  if (!qword_206E0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_EECC;
    v5[3] = &unk_18520;
    v5[4] = &v6;
    sub_EECC((uint64_t)v5);
    v2 = (void *)v7[3];
  }

  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11CC8(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantTimerDismiss _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(4LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_11C58(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerDismiss description](self, "description"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerDismiss timerIds](self, "timerIds"));
  if ([v5 count])
  {
    uint64_t v6 = MTLogForCategory(4LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timers", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerDismiss _timerManager](self, "_timerManager"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 timers]);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000LL;
    v45 = sub_E558;
    v46 = sub_E568;
    id v47 = 0LL;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_E570;
    v37[3] = &unk_18938;
    v37[4] = self;
    id v38 = v5;
    id v11 = v28;
    id v39 = v11;
    id v12 = v8;
    id v40 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 flatMap:v37]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_EBF0;
    v33[3] = &unk_184D0;
    id v14 = v11;
    id v34 = v14;
    p___int128 buf = &buf;
    v15 = v10;
    v35 = v15;
    id v16 = [v13 addSuccessBlock:v33];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_EDD4;
    v29[3] = &unk_184F8;
    id v30 = v14;
    v32 = &buf;
    uint64_t v17 = v15;
    v31 = v17;
    id v18 = [v13 addFailureBlock:v29];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v19 = MTLogForCategory(4LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
      sub_11D8C((uint64_t)self, v21, v42);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    v4[2](v4, v22);

    uint64_t v23 = MTLogForCategory(4LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
      sub_11D38((uint64_t)self, v25, v41);
    }

    +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriTimerDismisses);
    _Block_object_dispose(&buf, 8);
  }

  else if (v4)
  {
    id v26 = [[SACommandFailed alloc] initWithReason:@"No timer ID is provided."];
    [v26 setErrorCode:1];
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dictionary]);
    v4[2](v4, v27);
  }
}

@end