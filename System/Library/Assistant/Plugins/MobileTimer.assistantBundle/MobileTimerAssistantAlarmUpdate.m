@interface MobileTimerAssistantAlarmUpdate
- (id)updateAlarm:(id)a3 withModification:(id)a4;
- (id)updateAlarmsWithManager:(id)a3;
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmUpdate

- (void)dealloc
{
  uint64_t v3 = MTLogForCategory(3LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MobileTimerAssistantAlarmUpdate;
  -[MobileTimerAssistantAlarmUpdate dealloc](&v5, "dealloc");
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10E08(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantAlarmUpdate _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10D98(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmUpdate validateCommandArguments](self, "validateCommandArguments"));
  if (v5)
  {
    uint64_t v6 = MTLogForCategory(3LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10F20();
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    v4[2](v4, v8);
  }

  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    v34 = sub_8828;
    v35 = sub_8838;
    id v36 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmUpdate updateAlarmsWithManager:](self, "updateAlarmsWithManager:", v9));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_8840;
    v27[3] = &unk_186A0;
    objc_copyWeak(&v30, &location);
    v29 = &v31;
    uint64_t v12 = v10;
    v28 = v12;
    id v13 = [v11 addSuccessBlock:v27];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_897C;
    v23[3] = &unk_185C0;
    objc_copyWeak(&v26, &location);
    v25 = &v31;
    uint64_t v14 = v12;
    v24 = v14;
    id v15 = [v11 addFailureBlock:v23];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v16 = MTLogForCategory(3LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v32[5] dictionary]);
      sub_10ECC((uint64_t)self, v18, v39);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v32[5] dictionary]);
    v4[2](v4, v19);

    uint64_t v20 = MTLogForCategory(3LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v32[5] dictionary]);
      sub_10E78((uint64_t)self, v22, v38);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v30);

    _Block_object_dispose(&v31, 8);
    objc_destroyWeak(&location);
  }
}

- (id)validateCommandArguments
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  uint64_t v9 = 0LL;
  dispatch_semaphore_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_8828;
  id v13 = sub_8838;
  id v14 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmUpdate modifications](self, "modifications"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_8BF4;
  v8[3] = &unk_186F0;
  v8[4] = &v15;
  v8[5] = &v9;
  [v2 enumerateObjectsUsingBlock:v8];

  if (*((_BYTE *)v16 + 24))
  {
    id v3 = 0LL;
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v10[5] userInfo]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v3 = [v4 initWithReason:v6];

    objc_msgSend(v3, "setErrorCode:", objc_msgSend((id)v10[5], "code"));
  }

  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v3;
}

- (id)updateAlarmsWithManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[MobileTimerAssistantAlarmUpdate updateAlarmsWithManager:]";
    __int16 v16 = 2114;
    uint64_t v17 = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 alarms]);
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_9220;
  v11[3] = &unk_18790;
  objc_copyWeak(&v13, (id *)buf);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 flatMap:v11]);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return v9;
}

- (id)updateAlarm:(id)a3 withModification:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 hour]);
  BOOL v8 = v7 != 0LL;

  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 hour]);
    objc_msgSend(v6, "setHour:", objc_msgSend(v9, "unsignedIntegerValue"));
  }

  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 minute]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 minute]);
    objc_msgSend(v6, "setMinute:", objc_msgSend(v11, "unsignedIntegerValue"));

    BOOL v8 = 1;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 addedFrequency]);

  if (v12)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 addedFrequency]);
    id v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = 0LL;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v13);
          }
          unsigned int v19 = SAAlarmDayOfWeekForString(*(void *)(*((void *)&v43 + 1) + 8LL * (void)i));
          v16 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v19);
        }

        id v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }

      while (v15);
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    objc_msgSend(v6, "setRepeatSchedule:", (unint64_t)objc_msgSend(v6, "repeatSchedule") | v16);
    BOOL v8 = 1;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 removedFrequency]);

  if (v20)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "removedFrequency", 0));
    id v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v26 = SAAlarmDayOfWeekForString(*(void *)(*((void *)&v39 + 1) + 8LL * (void)j));
          uint64_t v27 = MTAlarmRepeatDayFromSAAlarmDayOfWeek(v26);
        }

        uint64_t v28 = v27;
        id v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }

      while (v23);
      uint64_t v29 = ~v28;
    }

    else
    {
      uint64_t v29 = -1LL;
    }

    objc_msgSend(v6, "setRepeatSchedule:", (unint64_t)objc_msgSend(v6, "repeatSchedule") & v29);
    BOOL v8 = 1;
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);

  if (v30)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);
    [v6 setTitle:v31];

LABEL_30:
    v32 = (void *)objc_claimAutoreleasedReturnValue([v5 enabled]);
    if (v32)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v5 enabled]);
      objc_msgSend(v6, "setEnabled:", objc_msgSend(v33, "BOOLValue"));
    }

    else
    {
      [v6 setEnabled:1];
    }

    goto LABEL_34;
  }

  if (v8) {
    goto LABEL_30;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue([v5 enabled]);

  if (v35)
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v5 enabled]);
    id v37 = [v36 BOOLValue];

    [v6 setEnabled:v37];
    v38 = &kMTCASiriAlarmDeactivations;
    if ((_DWORD)v37) {
      v38 = &kMTCASiriAlarmActivations;
    }
    +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", *v38);
  }

@end