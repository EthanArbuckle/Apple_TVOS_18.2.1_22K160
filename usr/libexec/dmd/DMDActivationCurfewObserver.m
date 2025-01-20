@interface DMDActivationCurfewObserver
- (BOOL)_extractComponentsFromPredicate:(id)a3;
- (DMDActivationCurfewObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 curfewPredicate:(id)a5;
- (NSMutableArray)expiredNotificationTimes;
- (NSMutableArray)scheduledAlarmIdentifiers;
- (NSSet)notificationTimes;
- (NSString)calendarIdentifier;
- (id)_datesForNextCurfewBoundary;
- (id)_nextDateAfter:(id)a3 matchingWeekday:(int64_t)a4 hour:(int64_t)a5 minute:(int64_t)a6 second:(int64_t)a7 inCalendar:(id)a8;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (int64_t)endDay;
- (int64_t)endHour;
- (int64_t)endMinute;
- (int64_t)endSecond;
- (int64_t)startDay;
- (int64_t)startHour;
- (int64_t)startMinute;
- (int64_t)startSecond;
- (void)_registerPredicateObserver;
- (void)invalidate;
- (void)setCalendarIdentifier:(id)a3;
- (void)setEndDay:(int64_t)a3;
- (void)setEndHour:(int64_t)a3;
- (void)setEndMinute:(int64_t)a3;
- (void)setEndSecond:(int64_t)a3;
- (void)setExpiredNotificationTimes:(id)a3;
- (void)setNotificationTimes:(id)a3;
- (void)setScheduledAlarmIdentifiers:(id)a3;
- (void)setStartDay:(int64_t)a3;
- (void)setStartHour:(int64_t)a3;
- (void)setStartMinute:(int64_t)a3;
- (void)setStartSecond:(int64_t)a3;
@end

@implementation DMDActivationCurfewObserver

- (DMDActivationCurfewObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 curfewPredicate:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DMDActivationCurfewObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v16,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  v8);
  if (v9)
  {
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    expiredNotificationTimes = v9->_expiredNotificationTimes;
    v9->_expiredNotificationTimes = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    scheduledAlarmIdentifiers = v9->_scheduledAlarmIdentifiers;
    v9->_scheduledAlarmIdentifiers = v12;

    if (!-[DMDActivationCurfewObserver _extractComponentsFromPredicate:](v9, "_extractComponentsFromPredicate:", v8))
    {
      v14 = 0LL;
      goto LABEL_6;
    }

    -[DMDActivationCurfewObserver _registerPredicateObserver](v9, "_registerPredicateObserver");
  }

  v14 = v9;
LABEL_6:

  return v14;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___NSDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:]( self,  "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:",  v4,  -[DMDActivationCurfewObserver startDay](self, "startDay"),  -[DMDActivationCurfewObserver startHour](self, "startHour"),  -[DMDActivationCurfewObserver startMinute](self, "startMinute"),  -[DMDActivationCurfewObserver startSecond](self, "startSecond"),  v6));
  v27 = (void *)v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:]( self,  "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:",  v4,  -[DMDActivationCurfewObserver endDay](self, "endDay"),  -[DMDActivationCurfewObserver endHour](self, "endHour"),  -[DMDActivationCurfewObserver endMinute](self, "endMinute"),  -[DMDActivationCurfewObserver endSecond](self, "endSecond"),  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  [v8 removeAllObjects];

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes"));
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        [v14 doubleValue];
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:-v15]);
        if ([v16 compare:v4] == (id)-1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
          [v17 addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v46 count:16];
    }

    while (v11);
  }

  uint64_t v18 = DMFConfigurationEngineLog( -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  [v26 compare:v7] == (id)-1));
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    unsigned int v22 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
    *(_DWORD *)buf = 138544898;
    v33 = v20;
    __int16 v34 = 2114;
    v35 = v21;
    __int16 v36 = 1024;
    unsigned int v37 = v22;
    __int16 v38 = 2114;
    v39 = v23;
    __int16 v40 = 2114;
    v41 = v7;
    __int16 v42 = 2114;
    v43 = v26;
    __int16 v44 = 2114;
    v45 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, expired notification times: %{public}@, next start date: %{public}@, next end date: %{public}@, now: %{public}@",  buf,  0x44u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  return v24;
}

- (void)invalidate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        xpc_set_event( [@"com.apple.alarm" UTF8String], objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "UTF8String"), 0);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDActivationCurfewObserver;
  -[DMDActivationPredicateObserver invalidate](&v8, "invalidate");
}

- (id)metadata
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDActivationCurfewObserver;
  id v3 = -[DMDActivationPredicateObserver metadata](&v9, "metadata");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"compare:"]);

  if ([v6 count])
  {
    uint64_t v10 = DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey;
    __int128 v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    [v4 setObject:v7 forKeyedSubscript:DMFDeclarationStatePredicatePayloadStatusKey];
  }

  return v4;
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadCalendarIdentifier]);
  -[DMDActivationCurfewObserver setCalendarIdentifier:](self, "setCalendarIdentifier:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v6));

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 payloadNotificationTimes]);
  if (v8) {
    objc_super v9 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  }
  else {
    objc_super v9 = objc_opt_new(&OBJC_CLASS___NSSet);
  }
  uint64_t v10 = v9;
  -[DMDActivationCurfewObserver setNotificationTimes:](self, "setNotificationTimes:", v9);

  __int128 v11 = objc_opt_new(&OBJC_CLASS___NSISO8601DateFormatter);
  -[NSISO8601DateFormatter setFormatOptions:](v11, "setFormatOptions:", 544LL);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 timeZone]);
  -[NSISO8601DateFormatter setTimeZone:](v11, "setTimeZone:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadStartTime]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v11, "dateFromString:", v13));

  if (v14)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v7 components:224 fromDate:v14]);
    -[DMDActivationCurfewObserver setStartHour:](self, "setStartHour:", [v15 hour]);
    -[DMDActivationCurfewObserver setStartMinute:](self, "setStartMinute:", [v15 minute]);
    -[DMDActivationCurfewObserver setStartSecond:](self, "setStartSecond:", [v15 second]);
  }

  else
  {
    double v15 = 0LL;
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadEndTime]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v11, "dateFromString:", v16));

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 components:224 fromDate:v17]);

    -[DMDActivationCurfewObserver setEndHour:](self, "setEndHour:", [v18 hour]);
    -[DMDActivationCurfewObserver setEndMinute:](self, "setEndMinute:", [v18 minute]);
    -[DMDActivationCurfewObserver setEndSecond:](self, "setEndSecond:", [v18 second]);
    double v15 = v18;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadStartDay]);
  -[DMDActivationCurfewObserver setStartDay:](self, "setStartDay:", [v19 integerValue]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadEndDay]);
  -[DMDActivationCurfewObserver setEndDay:](self, "setEndDay:", [v20 integerValue]);

  v39 = v7;
  id v21 = [v7 maximumRangeOfUnit:512];
  unint64_t v23 = (unint64_t)v21 + v22 - 1;
  BOOL v24 = (id)-[DMDActivationCurfewObserver startDay](self, "startDay") < v21
     && -[DMDActivationCurfewObserver startDay](self, "startDay") > v23;
  id v25 = -[DMDActivationCurfewObserver endDay](self, "endDay");
  if (v25 >= v21)
  {
    BOOL v26 = 0;
  }

  else
  {
    id v25 = -[DMDActivationCurfewObserver endDay](self, "endDay");
    BOOL v26 = (unint64_t)v25 > v23;
  }

  if (v14) {
    BOOL v27 = v17 == 0LL;
  }
  else {
    BOOL v27 = 1;
  }
  char v28 = v27 || v24;
  if ((v28 & 1) != 0 || v26 || (id v25 = [v14 compare:v17]) == 0)
  {
    uint64_t v34 = DMFConfigurationEngineLog(v25);
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    v32 = (void *)v8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000603CC(self, v4, v30);
    }
    BOOL v31 = 0;
  }

  else
  {
    uint64_t v29 = DMFConfigurationEngineLog(v25);
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    BOOL v31 = 1;
    v32 = (void *)v8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes"));
      *(_DWORD *)buf = 138546178;
      v41 = v38;
      __int16 v42 = 2114;
      v43 = v37;
      __int16 v44 = 2114;
      v45 = v33;
      __int16 v46 = 2114;
      v47 = v36;
      __int16 v48 = 2048;
      int64_t v49 = -[DMDActivationCurfewObserver startDay](self, "startDay");
      __int16 v50 = 2048;
      int64_t v51 = -[DMDActivationCurfewObserver startHour](self, "startHour");
      __int16 v52 = 2048;
      int64_t v53 = -[DMDActivationCurfewObserver startMinute](self, "startMinute");
      __int16 v54 = 2048;
      int64_t v55 = -[DMDActivationCurfewObserver startSecond](self, "startSecond");
      __int16 v56 = 2048;
      int64_t v57 = -[DMDActivationCurfewObserver endDay](self, "endDay");
      __int16 v58 = 2048;
      int64_t v59 = -[DMDActivationCurfewObserver endHour](self, "endHour");
      __int16 v60 = 2048;
      int64_t v61 = -[DMDActivationCurfewObserver endMinute](self, "endMinute");
      __int16 v62 = 2048;
      int64_t v63 = -[DMDActivationCurfewObserver endSecond](self, "endSecond");
      BOOL v31 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, notific ations times: %{public}@, start day: %ld, start hour: %ld, start minute: %ld, start second: %ld, end day: %ld, e nd hour: %ld, end minute: %ld, end second: %ld",  buf,  0x7Au);
    }
  }

  return v31;
}

- (void)_registerPredicateObserver
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _datesForNextCurfewBoundary](self, "_datesForNextCurfewBoundary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
  [v4 removeAllObjects];

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v24 = *(void *)v26;
    uint64_t v7 = 1LL;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@-%ld",  @"com.apple.dmd.alarm",  v10,  (char *)i + v7));

        [v9 timeIntervalSince1970];
        int64_t v13 = (uint64_t)(v12 * 1000000000.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
        [v14 addObject:v11];

        uint64_t v16 = DMFConfigurationEngineLog(v15);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
          *(_DWORD *)buf = 138544386;
          __int128 v30 = v18;
          __int16 v31 = 2114;
          v32 = v19;
          __int16 v33 = 2114;
          uint64_t v34 = v11;
          __int16 v35 = 2114;
          __int16 v36 = v9;
          __int16 v37 = 2048;
          int64_t v38 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public} @ to fire at date: %{public}@, epoch time in nano seconds: %lld",  buf,  0x34u);
        }

        xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_BOOL(v20, (const char *)[@"ShouldWake" UTF8String], 0);
        xpc_dictionary_set_date(v20, (const char *)[@"Date" UTF8String], v13);
        id v21 = [@"com.apple.alarm" UTF8String];
        id v22 = v11;
        xpc_set_event(v21, [v22 UTF8String], v20);
      }

      id v6 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
      v7 += (uint64_t)i;
    }

    while (v6);
  }
}

- (id)_datesForNextCurfewBoundary
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSDate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:]( self,  "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:",  v3,  -[DMDActivationCurfewObserver startDay](self, "startDay"),  -[DMDActivationCurfewObserver startHour](self, "startHour"),  -[DMDActivationCurfewObserver startMinute](self, "startMinute"),  -[DMDActivationCurfewObserver startSecond](self, "startSecond"),  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:]( self,  "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:",  v3,  -[DMDActivationCurfewObserver endDay](self, "endDay"),  -[DMDActivationCurfewObserver endHour](self, "endHour"),  -[DMDActivationCurfewObserver endMinute](self, "endMinute"),  -[DMDActivationCurfewObserver endSecond](self, "endSecond"),  v5));
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v9 = [v6 compare:v7];
  if (v9 == (id)1)
  {
    -[NSMutableArray addObject:](v8, "addObject:", v7);
LABEL_14:
    id v17 = -[NSMutableArray copy](v8, "copy");
    goto LABEL_18;
  }

  if (v9 == (id)-1LL)
  {
    -[NSMutableArray addObject:](v8, "addObject:", v6);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes", 0LL));
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)v14) doubleValue];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-v15]);
          if (-[NSDate compare:](v3, "compare:", v16) == NSOrderedAscending) {
            -[NSMutableArray addObject:](v8, "addObject:", v16);
          }

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }

      while (v12);
    }

    goto LABEL_14;
  }

  uint64_t v18 = DMFConfigurationEngineLog(v9);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    *(_DWORD *)buf = 138544130;
    __int128 v28 = v21;
    __int16 v29 = 2114;
    __int128 v30 = v22;
    __int16 v31 = 2114;
    v32 = v6;
    __int16 v33 = 2114;
    uint64_t v34 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Predicate type: %{public}@ with unique identifier: %{public}@ failed to calculate the next curfew boundary date fo r next start date: %{public}@, next end date: %{public}@",  buf,  0x2Au);
  }

  id v17 = 0LL;
LABEL_18:

  return v17;
}

- (id)_nextDateAfter:(id)a3 matchingWeekday:(int64_t)a4 hour:(int64_t)a5 minute:(int64_t)a6 second:(int64_t)a7 inCalendar:(id)a8
{
  id v13 = a8;
  id v14 = a3;
  double v15 = objc_opt_new(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setWeekday:](v15, "setWeekday:", a4);
  -[NSDateComponents setHour:](v15, "setHour:", a5);
  -[NSDateComponents setMinute:](v15, "setMinute:", a6);
  -[NSDateComponents setSecond:](v15, "setSecond:", a7);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 nextDateAfterDate:v14 matchingComponents:v15 options:1024]);

  return v16;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSSet)notificationTimes
{
  return self->_notificationTimes;
}

- (void)setNotificationTimes:(id)a3
{
}

- (NSMutableArray)expiredNotificationTimes
{
  return self->_expiredNotificationTimes;
}

- (void)setExpiredNotificationTimes:(id)a3
{
}

- (NSMutableArray)scheduledAlarmIdentifiers
{
  return self->_scheduledAlarmIdentifiers;
}

- (void)setScheduledAlarmIdentifiers:(id)a3
{
}

- (int64_t)startDay
{
  return self->_startDay;
}

- (void)setStartDay:(int64_t)a3
{
  self->_startDay = a3;
}

- (int64_t)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(int64_t)a3
{
  self->_startHour = a3;
}

- (int64_t)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(int64_t)a3
{
  self->_startMinute = a3;
}

- (int64_t)startSecond
{
  return self->_startSecond;
}

- (void)setStartSecond:(int64_t)a3
{
  self->_startSecond = a3;
}

- (int64_t)endDay
{
  return self->_endDay;
}

- (void)setEndDay:(int64_t)a3
{
  self->_endDay = a3;
}

- (int64_t)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(int64_t)a3
{
  self->_endHour = a3;
}

- (int64_t)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(int64_t)a3
{
  self->_endMinute = a3;
}

- (int64_t)endSecond
{
  return self->_endSecond;
}

- (void)setEndSecond:(int64_t)a3
{
  self->_endSecond = a3;
}

- (void).cxx_destruct
{
}

@end