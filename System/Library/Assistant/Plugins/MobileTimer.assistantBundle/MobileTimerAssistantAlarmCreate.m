@interface MobileTimerAssistantAlarmCreate
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmCreate

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_109B8(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantAlarmCreate _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10948(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmCreate validateCommandArguments](self, "validateCommandArguments"));
  if (v56)
  {
    uint64_t v5 = MTLogForCategory(3LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10AD0();
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v56 dictionary]);
    v4[2](v4, v7);
    goto LABEL_34;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmCreate alarmToCreate](self, "alarmToCreate"));
  uint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS___MTMutableAlarm);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 relativeOffsetMinutes]);

  if (v9)
  {
    uint64_t v10 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    -[NSCalendar setTimeZone:](v10, "setTimeZone:", v11);

    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 relativeOffsetMinutes]);
    -[NSDateComponents setMinute:](v12, "setMinute:", [v13 unsignedIntValue]);

    if (-[NSDateComponents minute](v12, "minute") <= 4) {
      -[NSDateComponents setSecond:](v12, "setSecond:", 40LL);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar dateByAddingComponents:toDate:options:]( v10,  "dateByAddingComponents:toDate:options:",  v12,  v14,  0LL));

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v10, "components:fromDate:", 96LL, v15));
    objc_msgSend(v8, "setHour:", objc_msgSend(v16, "hour"));
    objc_msgSend(v8, "setMinute:", objc_msgSend(v16, "minute"));
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 hour]);

    if (v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 hour]);
      objc_msgSend(v8, "setHour:", objc_msgSend(v18, "unsignedIntValue"));
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 minute]);

    if (!v19) {
      goto LABEL_14;
    }
    uint64_t v10 = (NSCalendar *)objc_claimAutoreleasedReturnValue([v7 minute]);
    objc_msgSend(v8, "setMinute:", -[NSCalendar unsignedIntValue](v10, "unsignedIntValue"));
  }

LABEL_14:
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 frequency]);

  if (v20)
  {
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 frequency]);
    uint64_t v22 = 0LL;
    id v23 = [v21 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v68 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v26 = SAAlarmDayOfWeekForString(*(void *)(*((void *)&v67 + 1) + 8LL * (void)i));
          v22 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v26);
        }

        id v23 = [v21 countByEnumeratingWithState:&v67 objects:v77 count:16];
      }

      while (v23);
    }

    [v8 setRepeatSchedule:v22];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
  BOOL v28 = v27 == 0LL;

  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
    [v8 setTitle:v29];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v8 sound]);
  unsigned int v31 = [v30 isSilent];

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](&OBJC_CLASS___TLToneManager, "sharedToneManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 defaultToneIdentifierForAlertType:13]);

    v34 = (void *)objc_claimAutoreleasedReturnValue([v8 sound]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 vibrationIdentifier]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v8 sound]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 soundVolume]);
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:]( &OBJC_CLASS___MTSound,  "toneSoundWithIdentifier:vibrationIdentifer:volume:",  v33,  v35,  v37));

    [v8 setSound:v38];
  }

  v55 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
  uint64_t v39 = MTLogForCategory(3LL);
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ adding alarm: %{public}@", buf, 0x16u);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager addAlarm:](v55, "addAlarm:", v8));
  objc_initWeak(&location, self);
  dispatch_semaphore_t v42 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v74 = sub_7420;
  v75 = sub_7430;
  id v76 = 0LL;
  v61[0] = _NSConcreteStackBlock;
  v61[2] = sub_7438;
  v61[3] = &unk_18598;
  v61[1] = 3221225472LL;
  objc_copyWeak(&v65, &location);
  id v43 = v8;
  id v62 = v43;
  v64 = buf;
  v44 = v42;
  v63 = v44;
  id v45 = [v41 addSuccessBlock:v61];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_7564;
  v57[3] = &unk_185C0;
  objc_copyWeak(&v60, &location);
  v59 = buf;
  v46 = v44;
  v58 = v46;
  id v47 = [v41 addFailureBlock:v57];
  dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v48 = MTLogForCategory(3LL);
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
    sub_10A7C((uint64_t)self, v50, v72);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
  v4[2](v4, v51);

  uint64_t v52 = MTLogForCategory(3LL);
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
    sub_10A28((uint64_t)self, v54, v71);
  }

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v65);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_34:
}

- (id)validateCommandArguments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmCreate alarmToCreate](self, "alarmToCreate"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 relativeOffsetMinutes]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 relativeOffsetMinutes]);
    id v28 = 0LL;
    int v5 = MTValidateAlarmRelativeOffsetMinutes((unint64_t)[v4 unsignedIntegerValue], &v28);
    id v3 = v28;

    id v6 = v3;
    if (!v5) {
      goto LABEL_12;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 hour]);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v2 hour]);
    id v27 = v3;
    BOOL v9 = MTValidateAlarmHour((unint64_t)[v8 unsignedIntegerValue], &v27);
    id v6 = v27;

    id v3 = v6;
    if (!v9) {
      goto LABEL_12;
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v2 minute]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v2 minute]);
    id v26 = v3;
    BOOL v12 = MTValidateAlarmMinute((unint64_t)[v11 unsignedIntegerValue], &v26);
    id v6 = v26;

    id v3 = v6;
    if (!v12) {
      goto LABEL_12;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v2 frequency]);

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v2 frequency]);
    id v25 = v3;
    int v15 = MTValidateAlarmFrequency(v14, &v25);
    id v6 = v25;

    id v3 = v6;
    if (!v15) {
      goto LABEL_12;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v2 label]);

  if (!v16)
  {
    id v19 = 0LL;
    goto LABEL_14;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v2 label]);
  id v24 = v3;
  BOOL v18 = MTValidateAlarmLabel(v17, &v24);
  id v6 = v24;

  if (v18)
  {
    id v19 = 0LL;
  }

  else
  {
LABEL_12:
    id v20 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v19 = [v20 initWithReason:v22];

    objc_msgSend(v19, "setErrorCode:", objc_msgSend(v6, "code"));
  }

  id v3 = v6;
LABEL_14:

  return v19;
}

  ;
}

@end