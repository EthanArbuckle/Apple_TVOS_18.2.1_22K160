@interface MobileTimerAssistantAlarmSearch
+ (id)sanitizeAlarmLabelForComparison:(id)a3;
- (MobileTimerAssistantAlarmSearch)searchWithAlarms:(id)a3;
- (id)sanitizedAlarmLabelForComparison;
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmSearch

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11100(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantAlarmSearch _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_11090(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, dispatch_group_s *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch validateCommandArguments](self, "validateCommandArguments"));
  if (v5)
  {
    uint64_t v6 = MTLogForCategory(3LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_11170((uint64_t)self, (uint64_t)v5, v7);
    }

    uint64_t v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    v4[2](v4, v8);
  }

  else
  {
    uint64_t v9 = dispatch_group_create();
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    uint64_t v11 = MTLogForCategory(3LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MobileTimerAssistantAlarmSearch _performWithCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
    }

    uint64_t v13 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager alarms](v13, "alarms"));
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v34 = sub_9FC8;
    v35 = sub_9FD8;
    id v36 = 0LL;
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3032000000LL;
    v31[3] = sub_9FC8;
    v31[4] = sub_9FD8;
    id v32 = 0LL;
    objc_initWeak(&location, self);
    dispatch_group_enter(v9);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_9FE0;
    v25[3] = &unk_187B8;
    objc_copyWeak(&v29, &location);
    v27 = buf;
    v28 = v31;
    uint64_t v8 = v9;
    v26 = v8;
    id v14 = [v16 addCompletionBlock:v25];
    v23[0] = 0LL;
    v23[1] = v23;
    v23[2] = 0x3032000000LL;
    v23[3] = sub_9FC8;
    v23[4] = sub_9FD8;
    id v24 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_A114;
    block[3] = &unk_187E0;
    block[4] = self;
    uint64_t v20 = v31;
    uint64_t v21 = v23;
    uint64_t v22 = buf;
    dispatch_semaphore_t v18 = v10;
    uint64_t v19 = v4;
    v15 = v10;
    dispatch_group_notify(v8, &_dispatch_main_q, block);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v23, 8);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(buf, 8);
  }
}

- (id)validateCommandArguments
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch hour](self, "hour"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch hour](self, "hour"));
    id v24 = 0LL;
    BOOL v5 = MTValidateAlarmHour((unint64_t)[v4 unsignedIntegerValue], &v24);
    id v3 = v24;

    id v6 = v3;
    if (!v5) {
      goto LABEL_10;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch minute](self, "minute"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch minute](self, "minute"));
    id v23 = v3;
    BOOL v9 = MTValidateAlarmMinute((unint64_t)[v8 unsignedIntegerValue], &v23);
    id v6 = v23;

    id v3 = v6;
    if (!v9) {
      goto LABEL_10;
    }
  }

  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));
    id v22 = v3;
    int v12 = MTValidateAlarmFrequency(v11, &v22);
    id v6 = v22;

    id v3 = v6;
    if (!v12) {
      goto LABEL_10;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch label](self, "label"));

  if (!v13)
  {
    id v16 = 0LL;
    goto LABEL_12;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch label](self, "label"));
  id v21 = v3;
  BOOL v15 = MTValidateAlarmLabel(v14, &v21);
  id v6 = v21;

  if (v15)
  {
    id v16 = 0LL;
  }

  else
  {
LABEL_10:
    id v17 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    dispatch_semaphore_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v16 = [v17 initWithReason:v19];

    objc_msgSend(v16, "setErrorCode:", objc_msgSend(v6, "code"));
  }

  id v3 = v6;
LABEL_12:

  return v16;
}

- (MobileTimerAssistantAlarmSearch)searchWithAlarms:(id)a3
{
  id v4 = a3;
  v75 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch sanitizedAlarmLabelForComparison](self, "sanitizedAlarmLabelForComparison"));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v6 = v4;
  uint64_t v7 = (void *)v5;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v86 objects:v92 count:16];
  v76 = (void *)v5;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v87;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v87 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch identifier](self, "identifier"));
        if (v13)
        {
          id v14 = (void *)v13;
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch identifier](self, "identifier"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 alarmURL]);
          unsigned int v17 = [v15 isEqual:v16];

          if (!v17) {
            continue;
          }
        }

        uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch hour](self, "hour"));
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch hour](self, "hour"));
          id v21 = [v20 unsignedIntegerValue];
          id v22 = [v12 hour];

          if (v21 != v22) {
            continue;
          }
        }

        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch minute](self, "minute"));
        if (v23)
        {
          id v24 = (void *)v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch minute](self, "minute"));
          id v26 = [v25 unsignedIntegerValue];
          id v27 = [v12 minute];

          if (v26 != v27) {
            continue;
          }
        }

        uint64_t v28 = objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch enabled](self, "enabled"));
        if (v28)
        {
          id v29 = (void *)v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch enabled](self, "enabled"));
          unsigned int v31 = [v30 BOOLValue];
          unsigned int v32 = [v12 isEnabled];

          if (v31 != v32) {
            continue;
          }
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));

        if (!v33) {
          goto LABEL_30;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));
        if ([v34 count] == (char *)&dword_0 + 1)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:0]);
          int v37 = SAAlarmDayOfWeekForString(v36);

          if (v37 == 1)
          {
            if ([v12 repeatSchedule]) {
              continue;
            }
LABEL_30:
            if (!v7) {
              goto LABEL_36;
            }
            id v46 = v7;
            v47 = (void *)objc_opt_class(self);
            v48 = (void *)objc_claimAutoreleasedReturnValue([v12 displayTitle]);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v47 sanitizeAlarmLabelForComparison:v48]);

            if ([&stru_18B40 isEqualToString:v46]
              && [&stru_18B40 isEqualToString:v49])
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch label](self, "label"));

              uint64_t v51 = objc_claimAutoreleasedReturnValue([v12 displayTitle]);
              v49 = (void *)v51;
            }

            else
            {
              v50 = v46;
            }

            id v52 = [v46 length];
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
            id v54 = objc_msgSend(v50, "compare:options:range:locale:", v49, 129, 0, v52, v53);

            if (!v54) {
LABEL_36:
            }
              -[NSMutableArray addObject:](v75, "addObject:", v12);
            continue;
          }
        }

        else
        {
        }

        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch frequency](self, "frequency"));
        id v39 = [v38 countByEnumeratingWithState:&v82 objects:v91 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = 0LL;
          uint64_t v42 = *(void *)v83;
          do
          {
            for (j = 0LL; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v83 != v42) {
                objc_enumerationMutation(v38);
              }
              unsigned int v44 = SAAlarmDayOfWeekForString(*(void *)(*((void *)&v82 + 1) + 8LL * (void)j));
              v41 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v44);
            }

            id v40 = [v38 countByEnumeratingWithState:&v82 objects:v91 count:16];
          }

          while (v40);
        }

        else
        {
          uint64_t v41 = 0LL;
        }

        BOOL v45 = ((unint64_t)[v12 repeatSchedule] & v41) == 0;
        uint64_t v7 = v76;
        if (!v45) {
          goto LABEL_30;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    }

    while (v9);
  }

  v55 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](v75, "count"));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  v56 = v75;
  id v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v78,  v90,  16LL);
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v79;
    do
    {
      for (k = 0LL; k != v58; k = (char *)k + 1)
      {
        if (*(void *)v79 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)k);
        if ([v61 isSleepAlarm])
        {
          id v62 = objc_alloc_init(&OBJC_CLASS___SAAlarmSleepAlarm);
          v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v61 bedtimeHour]));
          [v62 setBedtimeHour:v63];

          v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v61 bedtimeMinute]));
          [v62 setBedtimeMinute:v64];

          [v62 setIsFiringNext:&__kCFBooleanFalse];
          [v62 setIsOverride:&__kCFBooleanFalse];
        }

        else
        {
          id v62 = objc_alloc_init(&OBJC_CLASS___SAAlarmObject);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([v61 alarmURL]);
        [v62 setIdentifier:v65];

        v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v61 hour]));
        [v62 setHour:v66];

        v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v61 minute]));
        [v62 setMinute:v67];

        v68 = SAAlarmFrequencyFromRepeatSchedule((uint64_t)[v61 repeatSchedule]);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        [v62 setFrequency:v69];

        v70 = (void *)objc_claimAutoreleasedReturnValue([v61 displayTitle]);
        [v62 setLabel:v70];

        v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v61 isEnabled]));
        [v62 setEnabled:v71];

        v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v61 isFiring]));
        [v62 setFiring:v72];

        -[NSMutableArray addObject:](v55, "addObject:", v62);
      }

      id v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v78,  v90,  16LL);
    }

    while (v58);
  }

  id v73 = [[SAAlarmSearchCompleted alloc] initWithResults:v55];
  return (MobileTimerAssistantAlarmSearch *)v73;
}

- (id)sanitizedAlarmLabelForComparison
{
  id v3 = (void *)objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantAlarmSearch label](self, "label"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 sanitizeAlarmLabelForComparison:v4]);

  return v5;
}

+ (id)sanitizeAlarmLabelForComparison:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (qword_206D8 != -1) {
      dispatch_once(&qword_206D8, &stru_18820);
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByCharactersInSet:qword_206C8]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:&stru_18B40]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByCharactersInSet:qword_206D0]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));

    [v7 removeObject:&stru_18B40];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@" "]);

    id v9 = v8;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

@end