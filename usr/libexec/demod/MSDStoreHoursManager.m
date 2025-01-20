@interface MSDStoreHoursManager
+ (id)sharedInstance;
- (BOOL)evaluateStoreStatusAgainstCurrentTime;
- (BOOL)evaluateStoreStatusAgainstPointInTime:(id)a3;
- (BOOL)isStoreOpenNow;
- (BOOL)useDefaultStoreHours;
- (MSDStoreHoursManager)init;
- (NSArray)storeHourRecords;
- (NSDate)nextContentRevertDate;
- (NSDate)nextStoreClosedDate;
- (NSDate)nextStoreOpenDate;
- (NSTimer)expirationTimer;
- (NSTimer)storeCloseTimer;
- (NSTimer)storeOpenTimer;
- (id)parseRawStoreHours:(id)a3;
- (id)screenSaverShouldRunUntil;
- (void)populateStoreHourFromDefaultSettingsForDate:(id)a3;
- (void)populateStoreHourFromHubSuppliedSettingsForDate:(id)a3;
- (void)setExpirationTimer:(id)a3;
- (void)setIsStoreOpenNow:(BOOL)a3;
- (void)setNextContentRevertDate:(id)a3;
- (void)setNextStoreClosedDate:(id)a3;
- (void)setNextStoreOpenDate:(id)a3;
- (void)setStoreCloseTimer:(id)a3;
- (void)setStoreHourRecords:(id)a3;
- (void)setStoreOpenTimer:(id)a3;
- (void)setUseDefaultStoreHours:(BOOL)a3;
- (void)setupStoreCloseTimer:(id)a3;
- (void)setupStoreHourSettingsExpirationTimer:(id)a3;
- (void)setupStoreOpenCloseTimers;
- (void)setupStoreOpenTimer:(id)a3;
- (void)storeCloseHandler:(id)a3;
- (void)storeHourSettingsExpirationHandler:(id)a3;
- (void)storeOpenHandler:(id)a3;
- (void)updateStoreHours:(id)a3 lastSettingsUpdatedDate:(id)a4;
@end

@implementation MSDStoreHoursManager

+ (id)sharedInstance
{
  if (qword_100125358 != -1) {
    dispatch_once(&qword_100125358, &stru_1000F9C88);
  }
  return (id)qword_100125350;
}

- (MSDStoreHoursManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSDStoreHoursManager;
  v2 = -[MSDStoreHoursManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDStoreHoursManager setStoreHourRecords:](v2, "setStoreHourRecords:", 0LL);
    -[MSDStoreHoursManager setExpirationTimer:](v3, "setExpirationTimer:", 0LL);
    -[MSDStoreHoursManager setStoreOpenTimer:](v3, "setStoreOpenTimer:", 0LL);
    -[MSDStoreHoursManager setStoreCloseTimer:](v3, "setStoreCloseTimer:", 0LL);
    -[MSDStoreHoursManager setUseDefaultStoreHours:](v3, "setUseDefaultStoreHours:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[MSDStoreHoursManager populateStoreHourFromDefaultSettingsForDate:]( v3,  "populateStoreHourFromDefaultSettingsForDate:",  v4);

    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      objc_initWeak(&location, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100034AA4;
      v10[3] = &unk_1000F9CB0;
      objc_copyWeak(&v11, &location);
      id v7 =  [v5 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.FireExpiration" object:0 queue:v6 usingBlock:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

    v8 = v3;
  }

  return v3;
}

- (void)updateStoreHours:(id)a3 lastSettingsUpdatedDate:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (!v8
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast")),
        unsigned int v11 = [v8 isEqualToDate:v10],
        v10,
        v11))
  {
    id v12 = sub_10003A95C();
    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096C80();
    }
    id v14 = 0LL;
LABEL_7:

    -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", 0LL);
    -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 1LL);
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100096C4C(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_17;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 endOfDay]);
  id v14 = [v24 newDateByAddingOneWeek];

  [v14 timeIntervalSinceNow];
  if (v26 < 300.0)
  {
    id v32 = sub_10003A95C();
    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096CE0(v14, v13);
    }
    goto LABEL_7;
  }

  if (!v6
    || (uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSArray, v25), (objc_opt_isKindOfClass(v6, v27) & 1) == 0)
    || ![v6 count])
  {
    id v31 = sub_10003A95C();
    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096D70();
    }
    goto LABEL_7;
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager parseRawStoreHours:](self, "parseRawStoreHours:", v6));
  if (!v28)
  {
    id v33 = sub_10003A95C();
    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096DD0(v13, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_7;
  }

  v16 = (os_log_s *)v28;
  -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", v28);
  -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 0LL);
  -[MSDStoreHoursManager setupStoreHourSettingsExpirationTimer:](self, "setupStoreHourSettingsExpirationTimer:", v14);
  id v29 = sub_10003A95C();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "New store hours successfully loaded!", v41, 2u);
  }

LABEL_17:
}

- (BOOL)evaluateStoreStatusAgainstCurrentTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(self) = -[MSDStoreHoursManager evaluateStoreStatusAgainstPointInTime:]( self,  "evaluateStoreStatusAgainstPointInTime:",  v3);

  return (char)self;
}

- (BOOL)evaluateStoreStatusAgainstPointInTime:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
  id v9 = sub_10003A95C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 toString]);
    int v36 = 138543362;
    uint64_t v37 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Evaluating store status against time: %{public}@",  (uint8_t *)&v36,  0xCu);
  }

  if (-[MSDStoreHoursManager useDefaultStoreHours](self, "useDefaultStoreHours")) {
    -[MSDStoreHoursManager populateStoreHourFromDefaultSettingsForDate:]( self,  "populateStoreHourFromDefaultSettingsForDate:",  v4);
  }
  else {
    -[MSDStoreHoursManager populateStoreHourFromHubSuppliedSettingsForDate:]( self,  "populateStoreHourFromHubSuppliedSettingsForDate:",  v4);
  }
  if (v5 != -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow")) {
    goto LABEL_15;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  if (([v13 isEqualToDate:v7] & 1) == 0)
  {

LABEL_14:
    goto LABEL_15;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
  unsigned __int8 v15 = [v14 isEqualToDate:v8];

  if ((v15 & 1) != 0)
  {
    id v16 = sub_10003A95C();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No change in store open-closed status.",  (uint8_t *)&v36,  2u);
    }

    BOOL v18 = 0;
    goto LABEL_26;
  }

- (id)screenSaverShouldRunUntil
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v6 = 0LL;
LABEL_6:
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 60LL));

    goto LABEL_7;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 screenSaverIdleDelay]);

  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  id v9 = v6;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  id v10 = sub_10003A95C();
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    double v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Screen saver idle delay: %{public}@ (seconds)",  (uint8_t *)&v25,  0xCu);
  }

  if (-[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow"))
  {
    id v12 = v4;
    [v12 timeIntervalSinceNow];
    id v14 = sub_10003A95C();
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Store will be closing soon!",  (uint8_t *)&v25,  2u);
    }

    double v16 = (double)(60 * (uint64_t)[v9 integerValue]);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(60 * (uint64_t)[v9 integerValue])));
    if ([v12 compare:v3] == (id)1)
    {
      id v17 = sub_10003A95C();
      BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Store will be opening soon!",  (uint8_t *)&v25,  2u);
      }

      id v19 = v4;
      goto LABEL_20;
    }

    double v16 = 300.0;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v16));
LABEL_20:
  id v20 = v19;

  id v12 = v20;
LABEL_21:
  id v21 = sub_10003A95C();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v12 toString]);
    int v25 = 138543362;
    double v26 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Screen saver should run until: %{public}@",  (uint8_t *)&v25,  0xCu);
  }

  return v12;
}

- (void)setupStoreOpenCloseTimers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  -[MSDStoreHoursManager setupStoreOpenTimer:](self, "setupStoreOpenTimer:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  -[MSDStoreHoursManager setupStoreCloseTimer:](self, "setupStoreCloseTimer:", v4);
}

- (id)parseRawStoreHours:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    id v8 = v6;
    id v9 = 0LL;
    id obj = v5;
    uint64_t v32 = *(void *)v34;
    while (2)
    {
      id v10 = 0LL;
      unsigned int v11 = v9;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v10);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0 || [v12 count] != (id)3)
        {
          id v25 = sub_10003A95C();
          double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100096EC4();
          }
          goto LABEL_25;
        }

        id v14 = v4;
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
        double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](&OBJC_CLASS___NSDate, "dateFromString:", v15));

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](&OBJC_CLASS___NSDate, "dateFromString:", v17));

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:2]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](&OBJC_CLASS___NSDate, "dateFromString:", v19));

        if (!v16 || !v18 || !v20)
        {
          id v28 = sub_10003A95C();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_100096E64();
          }

          id v4 = v14;
          goto LABEL_25;
        }

        if (![v18 isLaterDateThan:v16]
          || ([v20 isLaterDateThan:v18] & 1) == 0)
        {
          id v26 = sub_10003A95C();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          id v4 = v14;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100096E04();
          }

LABEL_25:
          id v5 = obj;

          id v24 = 0LL;
          goto LABEL_26;
        }

        id v9 = objc_alloc_init(&OBJC_CLASS___MSDStoreHourRecord);

        -[MSDStoreHourRecord setClosedDate:](v9, "setClosedDate:", v16);
        -[MSDStoreHourRecord setRevertDate:](v9, "setRevertDate:", v18);
        -[MSDStoreHourRecord setOpenDate:](v9, "setOpenDate:", v20);
        id v4 = v14;
        [v14 addObject:v9];

        id v10 = (char *)v10 + 1;
        unsigned int v11 = v9;
      }

      while (v8 != v10);
      id v5 = obj;
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___MSDStoreHourRecord);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[MSDStoreHourRecord setClosedDate:](v11, "setClosedDate:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[MSDStoreHourRecord setRevertDate:](v11, "setRevertDate:", v22);

  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[MSDStoreHourRecord setOpenDate:](v11, "setOpenDate:", v23);

  [v4 addObject:v11];
  id v24 = v4;
LABEL_26:

  return v24;
}

- (void)populateStoreHourFromDefaultSettingsForDate:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v5 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 startOfDayForDate:v14]);
  -[NSDateComponents setHour:](v5, "setHour:", 8LL);
  -[NSDateComponents setMinute:](v5, "setMinute:", 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingComponents:v5 toDate:v6 options:0]);
  -[NSDateComponents setHour:](v5, "setHour:", 8LL);
  -[NSDateComponents setMinute:](v5, "setMinute:", 30LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingComponents:v5 toDate:v6 options:0]);
  -[NSDateComponents setHour:](v5, "setHour:", 23LL);
  -[NSDateComponents setMinute:](v5, "setMinute:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingComponents:v5 toDate:v6 options:0]);
  if (![v14 isEarlierDateThan:v7])
  {
    if ([v14 isEarlierDateThan:v8])
    {
      -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0LL);
      -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v8);
    }

    else
    {
      if (![v14 isEarlierDateThan:v9])
      {
        -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0LL);
        id v11 = [v8 newDateByAddingOneDay];
        -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v11);

        id v12 = [v9 newDateByAddingOneDay];
        -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v12);

        goto LABEL_9;
      }

      -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 1LL);
      id v10 = [v8 newDateByAddingOneDay];
      -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v10);
    }

    -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v9);
LABEL_9:
    id v13 = [v7 newDateByAddingOneDay];
    -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v13);

    goto LABEL_10;
  }

  -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0LL);
  -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v8);
  -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v9);
  -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v7);
LABEL_10:
}

- (void)populateStoreHourFromHubSuppliedSettingsForDate:(id)a3
{
  id v26 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = 0LL;
    unint64_t v7 = 1LL;
    while (1)
    {
      id v8 = v6;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v7 - 1]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 closedDate]);
      LODWORD(v8) = [v26 isLaterDateThan:v10];

      if (!(_DWORD)v8)
      {
        -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 1LL);
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 closedDate]);
        -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v16);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 revertDate]);
        -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v17);

        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v6 openDate]);
        -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v18);
        goto LABEL_13;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 openDate]);
      unsigned int v12 = [v26 isEarlierDateThan:v11];

      if (v12) {
        break;
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
      id v14 = [v13 count];
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:v7]);

    -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0LL);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 closedDate]);
    -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 openDate]);
    -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v21);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 revertDate]);
    unsigned int v23 = [v26 isLaterDateThan:v22];

    if (v23) {
      id v24 = v18;
    }
    else {
      id v24 = v6;
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 revertDate]);
    -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v25);

LABEL_13:
LABEL_14:
  }
}

- (void)setupStoreHourSettingsExpirationTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035DF4;
  block[3] = &unk_1000F93B8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeHourSettingsExpirationHandler:(id)a3
{
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store hour settings are now expired!", v7, 2u);
  }

  -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", 0LL);
  -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"com.apple.MobileStoreDemo.StoreHours.Expired" object:0 userInfo:0];
}

- (void)setupStoreOpenTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036130;
  block[3] = &unk_1000F93B8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeOpenHandler:(id)a3
{
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store is open!", v7, 2u);
  }

  -[MSDStoreHoursManager evaluateStoreStatusAgainstCurrentTime](self, "evaluateStoreStatusAgainstCurrentTime");
  -[MSDStoreHoursManager setupStoreOpenCloseTimers](self, "setupStoreOpenCloseTimers");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"com.apple.MobileStoreDemo.StoreHours.StoreOpen" object:0 userInfo:0];
}

- (void)setupStoreCloseTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000363CC;
  block[3] = &unk_1000F93B8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeCloseHandler:(id)a3
{
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store is closed!", v7, 2u);
  }

  -[MSDStoreHoursManager evaluateStoreStatusAgainstCurrentTime](self, "evaluateStoreStatusAgainstCurrentTime");
  -[MSDStoreHoursManager setupStoreOpenCloseTimers](self, "setupStoreOpenCloseTimers");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"com.apple.MobileStoreDemo.StoreHours.StoreClosed" object:0 userInfo:0];
}

- (BOOL)isStoreOpenNow
{
  return self->_isStoreOpenNow;
}

- (void)setIsStoreOpenNow:(BOOL)a3
{
  self->_isStoreOpenNow = a3;
}

- (NSDate)nextStoreOpenDate
{
  return self->_nextStoreOpenDate;
}

- (void)setNextStoreOpenDate:(id)a3
{
}

- (NSDate)nextStoreClosedDate
{
  return self->_nextStoreClosedDate;
}

- (void)setNextStoreClosedDate:(id)a3
{
}

- (NSDate)nextContentRevertDate
{
  return self->_nextContentRevertDate;
}

- (void)setNextContentRevertDate:(id)a3
{
}

- (NSArray)storeHourRecords
{
  return self->_storeHourRecords;
}

- (void)setStoreHourRecords:(id)a3
{
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
}

- (NSTimer)storeOpenTimer
{
  return self->_storeOpenTimer;
}

- (void)setStoreOpenTimer:(id)a3
{
}

- (NSTimer)storeCloseTimer
{
  return self->_storeCloseTimer;
}

- (void)setStoreCloseTimer:(id)a3
{
}

- (BOOL)useDefaultStoreHours
{
  return self->_useDefaultStoreHours;
}

- (void)setUseDefaultStoreHours:(BOOL)a3
{
  self->_useDefaultStoreHours = a3;
}

- (void).cxx_destruct
{
}

@end