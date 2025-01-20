@interface MobileTimerAssistantTimerSet
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerSet

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10C00(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantTimerSet _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(4LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10B90(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerSet validateCommandArguments](self, "validateCommandArguments"));
  uint64_t v6 = MTLogForCategory(4LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10D18((uint64_t)self, (uint64_t)v5, v8);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    v4[2](v4, v9);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timer", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v10 = (void *)objc_opt_new(&OBJC_CLASS___MTTimerManager);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 currentTimer]);
    objc_initWeak(&location, self);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000LL;
    v41 = sub_7D58;
    v42 = sub_7D68;
    id v43 = 0LL;
    v33[0] = _NSConcreteStackBlock;
    v33[2] = sub_7D70;
    v33[3] = &unk_18610;
    v33[1] = 3221225472LL;
    objc_copyWeak(&v35, &location);
    id v9 = v10;
    id v34 = v9;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v24 flatMap:v33]);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_7FB0;
    v29[3] = &unk_18638;
    objc_copyWeak(&v32, &location);
    p___int128 buf = &buf;
    uint64_t v13 = v11;
    v30 = v13;
    id v14 = [v12 addSuccessBlock:v29];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_8094;
    v25[3] = &unk_185C0;
    objc_copyWeak(&v28, &location);
    v27 = &buf;
    v15 = v13;
    v26 = v15;
    id v16 = [v12 addFailureBlock:v25];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v17 = MTLogForCategory(4LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
      sub_10CC4((uint64_t)self, v19, v38);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    v4[2](v4, v20);

    uint64_t v21 = MTLogForCategory(4LL);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
      sub_10C70((uint64_t)self, v23, v37);
    }

    +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriTimerSets);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
}

- (id)validateCommandArguments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerSet timer](self, "timer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
  unsigned __int8 v5 = [v4 isEqualToString:SATimerStateUndefinedValue];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerSet timer](self, "timer"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
    NSLog(@"Unexpected timer state: %@", v7);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerSet timer](self, "timer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 timerValue]);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantTimerSet timer](self, "timer"));
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 timerValue]);
    id v12 = [v11 integerValue];
    double v13 = (double)(uint64_t)v12;

    if ((uint64_t)v12 >= 86400)
    {
      double v14 = v13 - (double)(unint64_t)(v13 / 3600.0) * 3600.0;
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SATimerSet.timer.timerValue: Duration must be less than 24 hours. Value = %f (%ld:%02ld:%02ld)",  *(void *)&v13,  (unint64_t)(v13 / 3600.0),  (unint64_t)(v14 / 60.0),  (unint64_t)(v14 - (double)(unint64_t)(v14 / 60.0) * 60.0));
LABEL_9:
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v16 = [[SACommandFailed alloc] initWithReason:v17];

      return v16;
    }

    if ((uint64_t)v12 <= 0)
    {
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SATimerSet.timer.timerValue: Duration must be greater than 0. Value = %f",  *(void *)&v13,  v19,  v20,  v21);
      goto LABEL_9;
    }
  }

  id v16 = 0LL;
  return v16;
}

@end