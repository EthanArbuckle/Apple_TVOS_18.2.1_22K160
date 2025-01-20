@interface EnergyTelemetry
+ (id)sharedInstance;
- (BOOL)isBAInfoAvailable;
- (BOOL)recordLastAccumulatedEnergyTelemetry:(id)a3;
- (EnergyTelemetry)init;
- (id)appendIncrementalData:(id)a3 toRecords:(id)a4;
- (id)calcSlotValueFromEnergy:(double)a3 withIntensity:(double)a4;
- (id)copyAccumulatedEnergyTelemetry;
- (id)fetchEmissionHistoriesForDays:(id)a3 fromRecords:(id)a4;
- (id)findDayStarts:(id)a3 returnMidnights:(id *)a4;
- (id)getBalancingAuthority;
- (id)getDateFrom:(id)a3 alignedToMinutes:(unint64_t)a4;
- (id)getIncrementalEnergyRecord;
- (id)getLastAccumulatedEnergyTelemetry;
- (id)getUTCMidnightFor:(id)a3;
- (unint64_t)iterateDaysCovering:(id)a3 toEnd:(id)a4;
- (unsigned)getSlotWithDate:(id)a3;
- (void)calculateEnergyAndPublishTelemetry;
- (void)getEnergyTelemetry;
- (void)sendDailySummaryToCoreAnalyticsForDate:(id)a3 withLocation:(id)a4 withCarbon:(double)a5 withEnergy:(double)a6 withSystem:(double)a7 missingIntensity:(BOOL)a8;
- (void)sendDayToCoreAnalytics:(_NSRange)a3 ofRecord:(id)a4;
- (void)sendDayToPowerlog:(_NSRange)a3 ofRecord:(id)a4;
- (void)sendSlotEventToCoreAnalytics:(id)a3;
- (void)sendTypedEventToCoreAnalyticsWithDate:(id)a3 withEnergy:(double)a4 andIntensity:(id)a5 forSlot:(id)a6 atLocation:(id)a7;
- (void)setIncrementalEnergyRecord:(id)a3;
@end

@implementation EnergyTelemetry

- (EnergyTelemetry)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___EnergyTelemetry;
  v2 = -[EnergyTelemetry init](&v29, "init");
  os_log_t v3 = os_log_create("com.apple.powerdatad", "energyTelemetry");
  log = v2->_log;
  v2->_log = v3;

  if (!v2->_log)
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_10000A714(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_18;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  defaults = v2->_defaults;
  v2->_defaults = (NSUserDefaults *)v5;

  if (!v2->_defaults)
  {
    if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A748();
    }
    goto LABEL_18;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  utcCal = v2->_utcCal;
  v2->_utcCal = (NSCalendar *)v7;

  if (!v2->_utcCal)
  {
    if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A774();
    }
    goto LABEL_18;
  }

  v9 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  utcFormatter = v2->_utcFormatter;
  v2->_utcFormatter = v9;

  v11 = v2->_utcCal;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSCalendar setTimeZone:](v11, "setTimeZone:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](v2, "getUTCMidnightFor:", v13));
  utcMidnight = v2->_utcMidnight;
  v2->_utcMidnight = (NSDate *)v14;

  if (!v2->_utcMidnight)
  {
    if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A7A0();
    }
LABEL_18:
    v19 = 0LL;
    goto LABEL_19;
  }

  if (!qword_100014B20)
  {
    __int128 v30 = off_100010680;
    uint64_t v31 = 0LL;
    qword_100014B20 = _sl_dlopen(&v30, 0LL);
  }

  if (qword_100014B20)
  {
    id v16 = [sub_100004F9C() managerWithID:@"com.apple.powerdatad.gridManager" locationBundlePath:@"/System/Library/LocationBundles/WirelessDiagnostics.bundle"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    gridManager = v2->gridManager;
    v2->gridManager = (_GDSManager *)v17;
  }

  v19 = v2;
LABEL_19:

  return v19;
}

+ (id)sharedInstance
{
  if (qword_100014B18 != -1) {
    dispatch_once(&qword_100014B18, &stru_1000105D0);
  }
  return (id)qword_100014B10;
}

- (id)getUTCMidnightFor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_utcMidnight = &self->_utcMidnight;
    if (!self->_utcMidnight || !-[NSCalendar isDate:inSameDayAsDate:](self->_utcCal, "isDate:inSameDayAsDate:", v4))
    {
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSCalendar dateBySettingHour:minute:second:ofDate:options:]( self->_utcCal,  "dateBySettingHour:minute:second:ofDate:options:",  0LL,  0LL,  0LL,  v4,  0LL));
      utcMidnight = self->_utcMidnight;
      self->_utcMidnight = v6;

      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        sub_10000A7F8((uint64_t)p_utcMidnight, log, v9, v10, v11, v12, v13, v14);
      }
    }

    v15 = *p_utcMidnight;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A7CC();
    }
    v15 = 0LL;
  }

  return v15;
}

- (unsigned)getSlotWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v4));
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    unsigned int v7 = (v6 / 60.0) / 0xF;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A860();
    }
    unsigned int v7 = -1;
  }

  return v7;
}

- (BOOL)recordLastAccumulatedEnergyTelemetry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_defaults;
  objc_sync_enter(v5);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v4, @"last_telemetry_baseline");
  objc_sync_exit(v5);

  return 1;
}

- (id)getLastAccumulatedEnergyTelemetry
{
  os_log_t v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( self->_defaults,  "dictionaryForKey:",  @"last_telemetry_baseline"));
  objc_sync_exit(v3);

  return v4;
}

- (id)getIncrementalEnergyRecord
{
  os_log_t v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults arrayForKey:](self->_defaults, "arrayForKey:", @"incremental_telemetry_array"));
  objc_sync_exit(v3);

  return v4;
}

- (void)setIncrementalEnergyRecord:(id)a3
{
  id v5 = a3;
  id v4 = self->_defaults;
  objc_sync_enter(v4);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, @"incremental_telemetry_array");
  objc_sync_exit(v4);
}

- (id)getDateFrom:(id)a3 alignedToMinutes:(unint64_t)a4
{
  if (a3)
  {
    if (a4) {
      unint64_t v5 = a4;
    }
    else {
      unint64_t v5 = 60LL;
    }
    utcCal = self->_utcCal;
    id v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](utcCal, "components:fromDate:", 96LL, v7));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar dateBySettingHour:minute:second:ofDate:options:]( self->_utcCal,  "dateBySettingHour:minute:second:ofDate:options:",  [v8 hour],  (unint64_t)objc_msgSend(v8, "minute") / v5 * v5,  0,  v7,  0));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (BOOL)isBAInfoAvailable
{
  if (!qword_100014B20)
  {
    __int128 v15 = off_100010680;
    id v16 = 0LL;
    qword_100014B20 = _sl_dlopen(&v15, 0LL);
  }

  if (!qword_100014B20) {
    return 0;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000LL;
  v8 = (void *)qword_100014B30;
  uint64_t v14 = qword_100014B30;
  if (!qword_100014B30)
  {
    *(void *)&__int128 v15 = _NSConcreteStackBlock;
    *((void *)&v15 + 1) = 3221225472LL;
    id v16 = sub_10000897C;
    uint64_t v17 = &unk_1000106A0;
    v18 = &v11;
    sub_10000897C((uint64_t)&v15, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v11);
    v8 = (void *)v12[3];
  }

  id v9 = v8;
  _Block_object_dispose(&v11, 8);
  return objc_opt_class(v9) != 0;
}

- (id)findDayStarts:(id)a3 returnMidnights:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"slot_date",  1LL));
  BOOL v20 = v17;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  [v5 sortUsingDescriptors:v6];

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 7LL));
  v8 = (char *)[v5 count];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    for (i = 0LL; i != v9; ++i)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:i]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"slot_date"]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v13));

      if (v14 && ([v10 isEqualToDate:v14] & 1) == 0)
      {
        [v19 addIndex:i];
        [v7 addObject:v14];
        id v15 = v14;

        uint64_t v10 = v15;
      }
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  if (a4) {
    *a4 = v7;
  }

  return v19;
}

- (id)appendIncrementalData:(id)a3 toRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] < 0x2A0)
  {
    if ([v7 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"slot_date"]);
      if (!v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"telemetry_date"]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[EnergyTelemetry getDateFrom:alignedToMinutes:]( self,  "getDateFrom:alignedToMinutes:",  v11,  15LL));
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"slot_date"]);
      if ([v12 isEqualToDate:v10])
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v13 doubleValue];
        double v15 = v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v16 doubleValue];
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 + v17));
        [v6 setObject:v18 forKeyedSubscript:@"wall_energy_consumed"];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"system_energy_consumed"]);
        [v19 doubleValue];
        double v21 = v20;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"system_energy_consumed"]);
        [v22 doubleValue];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21 + v23));
        [v6 setObject:v24 forKeyedSubscript:@"system_energy_consumed"];

        [v7 removeLastObject];
      }

      [v7 addObject:v6];
      id v8 = v6;
    }

    else
    {
      [v7 addObject:v6];
      id v8 = v6;
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A8C0();
    }
    id v8 = 0LL;
  }

  return v8;
}

- (void)getEnergyTelemetry
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getIncrementalEnergyRecord](v2, "getIncrementalEnergyRecord"));
  id v4 = [v3 mutableCopy];

  if (!v4) {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  v92 = v4;
  id v5 = v2->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000AAFC((int)[v4 count], v97, v5);
  }

  id v6 = -[EnergyTelemetry copyAccumulatedEnergyTelemetry](v2, "copyAccumulatedEnergyTelemetry");
  if (v6)
  {
    if ([v92 count])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v92 lastObject]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"slot_date"]);
      BOOL v9 = v8 == 0LL;

      if (v9)
      {
        if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_DEBUG)) {
          sub_10000AAD0();
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

        -[EnergyTelemetry setIncrementalEnergyRecord:](v2, "setIncrementalEnergyRecord:", v10);
        v92 = (void *)v10;
      }
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getLastAccumulatedEnergyTelemetry](v2, "getLastAccumulatedEnergyTelemetry"));
    if (v90)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"system_energy_consumed"]);
      [v11 doubleValue];
      double v13 = v12;
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"system_energy_consumed"]);
      [v14 doubleValue];
      if (v13 < v15)
      {
        BOOL v21 = 1;
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v16 doubleValue];
        double v18 = v17;
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v19 doubleValue];
        BOOL v21 = v18 < v20;
      }

      double v23 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"telemetry_date"]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 laterDate:v24]);
      v89 = v23;
      BOOL v22 = v25 == v23;

      if (v22)
      {
        log = v2->_log;
        BOOL v22 = 1;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v89;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last accumulated-energy date %@", buf, 0xCu);
        }
      }
    }

    else
    {
      v89 = 0LL;
      BOOL v22 = 0;
      BOOL v21 = 0;
    }

    if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_DEBUG)) {
      sub_10000AA70();
    }
    if (v90) {
      BOOL v27 = v89 == 0LL;
    }
    else {
      BOOL v27 = 1;
    }
    int v28 = v27 || v21;
    if ((v22 | v28) == 1)
    {
      objc_super v29 = v2->_log;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v94 = v90;
        __int16 v95 = 1024;
        LODWORD(v96[0]) = v21;
        WORD2(v96[0]) = 1024;
        *(_DWORD *)((char *)v96 + 6) = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Recreating baseline. lastData %@ negativeDelta %u, lastDateInFuture %u",  buf,  0x18u);
      }
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"telemetry_date"]);
      [v31 timeIntervalSinceDate:v89];
      double v33 = v32;

      v34 = v2->_log;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10000A9F4((uint64_t)v90, v34, v33);
      }
      if (v33 <= 14400.0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"system_energy_consumed"]);
        [v35 doubleValue];
        double v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"system_energy_consumed"]);
        [v38 doubleValue];
        double v40 = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v41 doubleValue];
        double v43 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"wall_energy_consumed"]);
        [v44 doubleValue];
        double v46 = v45;

        id v47 = (id)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](v2, "getDateFrom:alignedToMinutes:", v89, 15LL));
        id v48 = v89;
        v91 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"telemetry_date"]);
        v49 = v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"telemetry_date"]);
        [v50 timeIntervalSinceDate:v47];
        double v52 = v51;

        id v53 = [v92 count];
        id v54 = v53;
        if (v53 == (id)672 || 672 - (uint64_t)v53 >= (uint64_t)vcvtpd_s64_f64(v52 / 900.0))
        {
          id v57 = v49;
        }

        else
        {
          if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_ERROR)) {
            sub_10000A978();
          }
          v55 = (void *)objc_claimAutoreleasedReturnValue( -[EnergyTelemetry getDateFrom:alignedToMinutes:]( v2,  "getDateFrom:alignedToMinutes:",  v91,  15LL));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 dateByAddingTimeInterval:-(double)(900 * (671 - (uint64_t)v54))]);

          id v47 = v56;
          id v57 = v47;
        }

        id v87 = v47;
        v58 = (void *)objc_claimAutoreleasedReturnValue([v87 dateByAddingTimeInterval:900.0]);
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](v2, "getDateFrom:alignedToMinutes:", v91, 15LL));
        [v58 timeIntervalSinceDate:v57];
        double v61 = v60;
        v85 = v57;
        v86 = v58;
        [v91 timeIntervalSinceDate:v57];
        double v63 = v62;
        v88 = 0LL;
        double v64 = v37 - v40;
        double v65 = v43 - v46;
        for (i = v87; ; i = (void *)v81)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue([v59 laterDate:i]);
          BOOL v68 = v61 > 0.001 && v67 == v59;
          BOOL v69 = v68;

          if (!v69) {
            break;
          }
          if (v61 <= v63) {
            double v70 = v61;
          }
          else {
            double v70 = v63;
          }
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[EnergyTelemetry getSlotWithDate:](v2, "getSlotWithDate:", i)));
          [v71 setObject:v72 forKeyedSubscript:@"slot_id"];

          [v71 setObject:i forKeyedSubscript:@"slot_date"];
          v73 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"adapter_family"]);
          [v71 setObject:v73 forKeyedSubscript:@"adapter_family"];

          double v74 = v70 / v63;
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v65 * v74));
          [v71 setObject:v75 forKeyedSubscript:@"wall_energy_consumed"];

          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v64 * v74));
          [v71 setObject:v76 forKeyedSubscript:@"system_energy_consumed"];

          v77 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"balancing_authority_id"]);
          [v71 setObject:v77 forKeyedSubscript:@"balancing_authority_id"];

          v78 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"telemetry_date"]);
          [v71 setObject:v78 forKeyedSubscript:@"telemetry_date"];

          v79 = v2->_log;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue([v71 description]);
            *(_DWORD *)buf = 134218242;
            v94 = v88;
            __int16 v95 = 2112;
            v96[0] = v84;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEBUG,  "Segment %lu telemetry %@",  buf,  0x16u);

            ++v88;
          }

          id v80 = -[EnergyTelemetry appendIncrementalData:toRecords:](v2, "appendIncrementalData:toRecords:", v71, v92);
          uint64_t v81 = objc_claimAutoreleasedReturnValue([i dateByAddingTimeInterval:900.0]);

          [v91 timeIntervalSinceDate:v81];
          double v83 = v82;

          double v61 = fmin(fabs(v83), 900.0);
        }

        -[EnergyTelemetry setIncrementalEnergyRecord:](v2, "setIncrementalEnergyRecord:", v92);
        -[EnergyTelemetry recordLastAccumulatedEnergyTelemetry:](v2, "recordLastAccumulatedEnergyTelemetry:", v6);

        __int128 v30 = v89;
        goto LABEL_60;
      }

      if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_ERROR)) {
        sub_10000A94C();
      }
    }

    -[EnergyTelemetry recordLastAccumulatedEnergyTelemetry:](v2, "recordLastAccumulatedEnergyTelemetry:", v6);
    __int128 v30 = v89;
LABEL_60:

    goto LABEL_61;
  }

  if (os_log_type_enabled(v2->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000A920();
  }
LABEL_61:

  objc_sync_exit(v2);
}

- (id)copyAccumulatedEnergyTelemetry
{
  uint64_t v26 = 0LL;
  uint64_t valuePtr = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"telemetry_date");

  id v5 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (!MatchingService)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000AB40();
    }
    goto LABEL_9;
  }

  io_object_t v7 = MatchingService;
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty( MatchingService,  @"PowerTelemetryData",  kCFAllocatorDefault,  0);
  if (!CFProperty)
  {
    IOObjectRelease(v7);
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000AB6C();
    }
LABEL_9:
    double v12 = 0LL;
    goto LABEL_30;
  }

  BOOL v9 = CFProperty;
  Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"AccumulatedWallEnergyEstimate");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
    uint64_t v11 = valuePtr;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"wall_energy_consumed");

  double v14 = (const __CFNumber *)CFDictionaryGetValue(v9, @"AccumulatedSystemEnergyConsumed");
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberSInt64Type, &v26);
    uint64_t v15 = v26;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  @"system_energy_consumed");

  double v17 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v7, @"AdapterDetails", kCFAllocatorDefault, 0);
  double v18 = (const __CFNumber *)CFDictionaryGetValue(v17, @"FamilyCode");
  if (v18)
  {
    CFNumberGetValue(v18, kCFNumberSInt64Type, &v25);
    uint64_t v19 = v25;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v19));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, @"adapter_family");

  CFRelease(v17);
  CFRelease(v9);
  IOObjectRelease(v7);
  if (!qword_100014B20)
  {
    __int128 v28 = off_100010680;
    uint64_t v29 = 0LL;
    qword_100014B20 = _sl_dlopen(&v28, 0LL);
  }

  if (!qword_100014B20
    || !sub_100004B24()
    || !-[EnergyTelemetry isBAInfoAvailable](self, "isBAInfoAvailable"))
  {
    goto LABEL_25;
  }

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getBalancingAuthority](self, "getBalancingAuthority"));
  BOOL v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 identifier]);

  if (!v22)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000AB98();
    }
LABEL_25:
    BOOL v22 = 0LL;
  }

  if (v22) {
    double v23 = v22;
  }
  else {
    double v23 = &stru_100010C58;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v23,  @"balancing_authority_id");
  double v12 = v3;

LABEL_30:
  return v12;
}

- (id)calcSlotValueFromEnergy:(double)a3 withIntensity:(double)a4
{
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3 * a4 / 1000000000.0);
}

- (void)calculateEnergyAndPublishTelemetry
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  obj = (os_log_t *)v2;
  double v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getIncrementalEnergyRecord](v2, "getIncrementalEnergyRecord"));
  id v71 = [v3 mutableCopy];

  if (v71 && [v71 count])
  {
    if ([v71 count]
      && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v71 lastObject]),
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"slot_date"]),
          v5,
          v4,
          !v5))
    {
      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR)) {
        sub_10000AC94();
      }
    }

    else
    {
      BOOL v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t findDayStarts:returnMidnights:](obj, "findDayStarts:returnMidnights:", v71, 0LL));
      if (!qword_100014B20)
      {
        *(_OWORD *)v79 = off_100010680;
        uint64_t v80 = 0LL;
        qword_100014B20 = _sl_dlopen(v79, 0LL);
      }

      if (qword_100014B20)
      {
        if (sub_100004B24() && -[os_log_t isBAInfoAvailable](obj, "isBAInfoAvailable"))
        {
          id v6 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_t fetchEmissionHistoriesForDays:fromRecords:]( obj,  "fetchEmissionHistoriesForDays:fromRecords:",  v68,  v71));
          io_object_t v7 = obj[5];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            sub_10000AC50(v79, (uint64_t)[v6 count], v7);
          }

          uint64_t v67 = [v71 count];
          if (v67)
          {
            uint64_t v9 = 0LL;
            *(void *)&__int128 v8 = 138412290LL;
            __int128 v66 = v8;
            do
            {
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v9, v66));
              id v11 = [v10 mutableCopy];

              double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"telemetry_date"]);
              double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"slot_date"]);
              double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
              uint64_t v15 = v14;
              if (v13)
              {
                if (v14)
                {
                  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"average"]);
                  if (!v16
                    || (double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
                        BOOL v18 = v16 == v17,
                        v17,
                        v18))
                  {
                    uint64_t v24 = obj[5];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v66;
                      id v78 = v11;
                      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "systemwide emissions data wasn't found for record: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"marginal"]);
                    if (!v19
                      || (double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
                          BOOL v21 = v19 == v20,
                          v20,
                          v21))
                    {

                      uint64_t v26 = obj[5];
                      BOOL v22 = &off_100011350;
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v66;
                        id v78 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "marginal emissions data wasn't found for record: %@",  buf,  0xCu);
                      }
                    }

                    else
                    {
                      BOOL v22 = (_UNKNOWN **)v19;
                    }

                    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"wall_energy_consumed"]);
                    [v27 doubleValue];
                    double v29 = v28;
                    [v16 doubleValue];
                    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_t calcSlotValueFromEnergy:withIntensity:]( obj,  "calcSlotValueFromEnergy:withIntensity:",  v29,  v30));
                    [v11 setObject:v31 forKeyedSubscript:@"carbon_footprint"];

                    [v11 setObject:v16 forKeyedSubscript:@"avg_intensity"];
                    [v11 setObject:v22 forKeyedSubscript:@"marginal_intensity"];
                    [v71 setObject:v11 atIndexedSubscript:v9];
                    objc_msgSend(v70, "addIndex:", objc_msgSend(v71, "indexOfObject:", v11));
                    double v32 = obj[5];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v66;
                      id v78 = v11;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Calculated carbon %@",  buf,  0xCu);
                    }
                  }
                }

                else
                {
                  uint64_t v25 = obj[5];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v66;
                    id v78 = v11;
                    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "emissions data wasn't found for record: %@",  buf,  0xCu);
                  }
                }
              }

              else
              {
                double v23 = obj[5];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v66;
                  id v78 = v11;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "calculateEnergy tried to process a record in the old format: %@",  buf,  0xCu);
                }
              }

              ++v9;
            }

            while (v67 != v9);
          }

          int v33 = 1;
        }

        else
        {
          int v33 = 0;
          id v6 = &__NSDictionary0__struct;
        }

        if (sub_100004B24())
        {
          if ((-[os_log_t isBAInfoAvailable](obj, "isBAInfoAvailable") & 1) == 0)
          {
            v34 = obj[5];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "GridDataServices framework unavailable",  buf,  2u);
            }
          }
        }
      }

      else
      {
        int v33 = 0;
      }

      uint64_t v35 = (uint64_t)[v68 count];
      double v36 = (char *)[v68 firstIndex];
      int v37 = v33 ^ 1;
      while (v36 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = (char *)[v68 indexGreaterThanIndex:v36];
        double v39 = v38;
        if (v35 > 4) {
          int v40 = 1;
        }
        else {
          int v40 = v37;
        }
        if (v40 == 1 && v38 > v36)
        {
          v41 = v36;
          do
          {
            double v42 = (void *)objc_claimAutoreleasedReturnValue([v71 objectAtIndexedSubscript:v41]);
            double v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"carbon_footprint"]);

            if (!v43)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue([v71 objectAtIndexedSubscript:v41]);
              id v45 = [v44 mutableCopy];

              [v45 setObject:&stru_100010C58 forKeyedSubscript:@"balancing_authority_id"];
              [v45 setObject:&off_100011360 forKeyedSubscript:@"avg_intensity"];
              double v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"wall_energy_consumed"]);
              [v46 doubleValue];
              id v47 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_t calcSlotValueFromEnergy:withIntensity:]( obj,  "calcSlotValueFromEnergy:withIntensity:"));
              [v45 setObject:v47 forKeyedSubscript:@"carbon_footprint"];

              [v71 setObject:v45 atIndexedSubscript:v41];
            }

            ++v41;
          }

          while (v39 != v41);
        }

        if (v39 <= v36) {
          goto LABEL_63;
        }
        char v48 = 1;
        v49 = v36;
        do
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue([v71 objectAtIndexedSubscript:v49]);
          double v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"carbon_footprint"]);
          BOOL v52 = v51 != 0LL;

          v48 &= v52;
          ++v49;
        }

        while (v39 != v49);
        if ((v48 & 1) != 0)
        {
LABEL_63:
          -[os_log_t sendDayToCoreAnalytics:ofRecord:](obj, "sendDayToCoreAnalytics:ofRecord:", v36, v39 - v36, v71);
          -[os_log_t sendDayToPowerlog:ofRecord:](obj, "sendDayToPowerlog:ofRecord:", v36, v39 - v36, v71);
          objc_msgSend(v70, "addIndexesInRange:", v36, v39 - v36);
        }

        --v35;
        double v36 = (char *)[v68 indexGreaterThanIndex:v36];
      }

      if ([v70 count])
      {
        id v53 = obj[5];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v70;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Pruning processed records %@", buf, 0xCu);
        }

        [v71 removeObjectsAtIndexes:v70];
        [v70 removeAllIndexes];
      }

      id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 dateByAddingTimeInterval:-345600.0]);

      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_DEBUG)) {
        sub_10000ABF0();
      }
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      id v56 = v71;
      id v57 = [v56 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v73;
        do
        {
          for (i = 0LL; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v73 != v58) {
              objc_enumerationMutation(v56);
            }
            double v60 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
            double v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"telemetry_date"]);
            double v62 = (void *)objc_claimAutoreleasedReturnValue([v61 earlierDate:v55]);
            double v63 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"telemetry_date"]);
            BOOL v64 = v62 == v63;

            if (v64) {
              objc_msgSend(v70, "addIndex:", objc_msgSend(v56, "indexOfObject:", v60));
            }
          }

          id v57 = [v56 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }

        while (v57);
      }

      double v65 = obj[5];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v78 = v70;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Pruning expired records %@", buf, 0xCu);
      }

      [v56 removeObjectsAtIndexes:v70];
      -[os_log_t setIncrementalEnergyRecord:](obj, "setIncrementalEnergyRecord:", v56);
    }
  }

  else if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR))
  {
    sub_10000ABC4();
  }

  objc_sync_exit(obj);
}

- (id)getBalancingAuthority
{
  id v3 = sub_100004F9C();
  if (!objc_opt_class(v3) || !-[EnergyTelemetry isBAInfoAvailable](self, "isBAInfoAvailable")) {
    goto LABEL_8;
  }
  if (!qword_100014B20)
  {
    __int128 v8 = off_100010680;
    uint64_t v9 = 0LL;
    qword_100014B20 = _sl_dlopen(&v8, 0LL);
  }

  if (qword_100014B20)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_GDSManager latestBalancingAuthority](self->gridManager, "latestBalancingAuthority"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10000ACC0(log, v4);
    }
  }

  else
  {
LABEL_8:
    id v6 = self->_log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "GridDataServices framework unavailable",  (uint8_t *)&v8,  2u);
    }

    id v4 = 0LL;
  }

  return v4;
}

- (void)sendDayToPowerlog:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (length)
  {
    v55[0] = @"telemetry_date";
    v55[1] = @"slot_id";
    v55[2] = @"wall_energy_consumed";
    v55[3] = @"system_energy_consumed";
    v55[4] = @"adapter_family";
    v55[5] = @"balancing_authority_id";
    v55[6] = @"avg_intensity";
    v55[7] = @"marginal_intensity";
    v55[8] = @"carbon_footprint";
    double v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 9LL));
    int v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v40 setObject:v39 forKeyedSubscript:@"Keys"];
    uint64_t v42 = 0LL;
    uint64_t v8 = 0LL;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v34 = v9;
    uint64_t v10 = v7;
    int v37 = self;
    v38 = v7;
    NSUInteger v35 = location;
    NSUInteger v36 = length;
    do
    {
      context = objc_autoreleasePoolPush();
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v8 + location]);
      id v12 = [v11 mutableCopy];

      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"sent_to_powerlog"]);
      if (v13)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          id v49 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Skipping %@ as it was already sent to powerlog.",  buf,  0xCu);
        }
      }

      else
      {
        NSUInteger v41 = v8 + location;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v16 = v39;
        id v17 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v45;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v45 != v19) {
                objc_enumerationMutation(v16);
              }
              BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v44 + 1) + 8 * (void)i),  v34));
              if (v21)
              {
                [v15 addObject:v21];
              }

              else
              {
                BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                [v15 addObject:v22];
              }
            }

            id v18 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }

          while (v18);
        }

        double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v42));
        [v40 setObject:v15 forKeyedSubscript:v23];

        ++v42;
        [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"sent_to_powerlog"];
        uint64_t v10 = v38;
        [v38 setObject:v12 atIndexedSubscript:v41];

        NSUInteger length = v36;
        self = v37;
        NSUInteger location = v35;
      }

      objc_autoreleasePoolPop(context);
      ++v8;
    }

    while (v8 != length);
    id v7 = v10;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v42));
    [v40 setObject:v24 forKeyedSubscript:@"NumRows"];

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
    {
      sub_10000ADA8();
      if (v42) {
        goto LABEL_20;
      }
    }

    else if (v42)
    {
LABEL_20:
      uint64_t v25 = self->_log;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = v25;
        id v27 = [v40 count];
        double v28 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:&off_100011370]);
        double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
        double v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v42 - 1));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v30]);
        double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:0]);
        *(_DWORD *)buf = 134218498;
        id v49 = v27;
        __int16 v50 = 2112;
        double v51 = v29;
        __int16 v52 = 2112;
        id v53 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Sending %lu entries to powerlog. Start %@ End %@",  buf,  0x20u);
      }

      PLLogRegisteredEvent(121LL, @"EnergyTelemetry", v40, 0LL);
    }

    goto LABEL_26;
  }

  int v33 = self->_log;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Nothing to send to powerlog.", buf, 2u);
  }

- (void)sendDayToCoreAnalytics:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (length)
  {
    NSUInteger v33 = location;
    if (location >= location + length)
    {
      char v9 = 1;
      double v11 = 0.0;
      double v10 = 0.0;
      double v8 = 0.0;
    }

    else
    {
      double v8 = 0.0;
      char v9 = 1;
      double v10 = 0.0;
      double v11 = 0.0;
      do
      {
        id v12 = objc_autoreleasePoolPush();
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:location]);
        id v14 = [v13 mutableCopy];

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"avg_intensity"]);
        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"balancing_authority_id"]);
          unsigned __int8 v17 = [&stru_100010C58 isEqualToString:v16];

          v9 &= v17;
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"sent_to_coreanalytics"]);

        if (v18)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Skipping %@ as it was already sent to Core Analytics.",  buf,  0xCu);
          }
        }

        else
        {
          double v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"carbon_footprint"]);
          [v20 doubleValue];
          double v8 = v8 + v21;

          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"wall_energy_consumed"]);
          [v22 doubleValue];
          double v10 = v10 + v23;

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"system_energy_consumed"]);
          [v24 doubleValue];
          double v11 = v11 + v25;

          -[EnergyTelemetry sendSlotEventToCoreAnalytics:](self, "sendSlotEventToCoreAnalytics:", v14);
          [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"sent_to_coreanalytics"];
          [v7 setObject:v14 atIndexedSubscript:location];
        }

        objc_autoreleasePoolPop(v12);
        ++location;
        --length;
      }

      while (length);
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v33]);
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"slot_date"]);
    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v28));

    double v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v33]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"balancing_authority_id"]);

    double v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413826;
      id v35 = v29;
      __int16 v36 = 2112;
      int v37 = v31;
      __int16 v38 = 2048;
      double v39 = v8;
      __int16 v40 = 2048;
      double v41 = v10;
      __int16 v42 = 2048;
      double v43 = v11;
      __int16 v44 = 1024;
      int v45 = v9 & 1;
      __int16 v46 = 2048;
      __int128 v47 = v31;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "sending daily summary: %@ %@ %.20e %.20e %.20e %d %p",  buf,  0x44u);
    }

    -[EnergyTelemetry sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:]( self,  "sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:",  v29,  v31,  v9 & 1,  v8,  v10,  v11);
  }

  else
  {
    uint64_t v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Nothing to send to Core Analytics.", buf, 2u);
    }
  }
}

- (void)sendDailySummaryToCoreAnalyticsForDate:(id)a3 withLocation:(id)a4 withCarbon:(double)a5 withEnergy:(double)a6 withSystem:(double)a7 missingIntensity:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  v26[0] = v14;
  v25[0] = @"domain";
  v25[1] = @"date";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](self->_utcFormatter, "stringFromDate:", a3));
  v26[1] = v15;
  v25[2] = @"summary_value";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
  v26[2] = v16;
  v25[3] = @"wall_value";
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a6));
  v26[3] = v17;
  v25[4] = @"system_energy_value";
  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a7));
  uint64_t v19 = (void *)v18;
  double v20 = &__kCFBooleanTrue;
  if (!v8) {
    double v20 = &__kCFBooleanFalse;
  }
  v26[4] = v18;
  v26[5] = v20;
  v25[5] = @"is_intensity_static";
  v25[6] = @"algorithm_enabled";
  v26[6] = &__kCFBooleanFalse;
  double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  7LL));

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000AE08();
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100007DF4;
  v23[3] = &unk_1000105F8;
  id v24 = v21;
  id v22 = v21;
  AnalyticsSendEventLazy(@"com.apple.energyTelemetry.v2.summary", v23);
}

- (void)sendSlotEventToCoreAnalytics:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"balancing_authority_id"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"slot_date"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wall_energy_consumed"]);
  [v6 doubleValue];
  double v8 = v7;
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"avg_intensity"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"slot_id"]);

  -[EnergyTelemetry sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:]( self,  "sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:",  v5,  v9,  v10,  v11,  v8);
}

- (void)sendTypedEventToCoreAnalyticsWithDate:(id)a3 withEnergy:(double)a4 andIntensity:(id)a5 forSlot:(id)a6 atLocation:(id)a7
{
  id v12 = a3;
  double v13 = (_UNKNOWN **)a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  v22[0] = _NSConcreteStackBlock;
  v22[2] = sub_100008010;
  v22[3] = &unk_100010620;
  v22[1] = 3221225472LL;
  if (v13) {
    unsigned __int8 v17 = v13;
  }
  else {
    unsigned __int8 v17 = &off_100011360;
  }
  id v23 = v17;
  id v24 = v15;
  BOOL v29 = v13 == 0LL;
  double v25 = self;
  id v26 = v12;
  id v27 = v14;
  double v28 = a4;
  id v18 = v14;
  id v19 = v12;
  id v20 = v16;
  double v21 = v17;
  AnalyticsSendEventLazy(@"com.apple.energyTelemetry.v1.slot", v22);
}

- (unint64_t)iterateDaysCovering:(id)a3 toEnd:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", a3));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v6));
  id v9 = v7;
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 earlierDate:v9]);

  if (v10 == v8)
  {
    unint64_t v11 = 0LL;
    double v13 = v9;
  }

  else
  {
    unint64_t v11 = 0LL;
    id v12 = v9;
    do
    {
      ++v11;
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:86400.0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 earlierDate:v13]);
      id v12 = v13;
    }

    while (v14 != v8);
  }

  return v11;
}

- (id)fetchEmissionHistoriesForDays:(id)a3 fromRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (char *)[v5 firstIndex];
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  96 * (void)[v5 count]));
  id v49 = v5;
  id v9 = (char *)[v5 indexGreaterThanIndex:v7];
  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = @"balancing_authority_id";
    *(void *)&__int128 v10 = 138412803LL;
    __int128 v46 = v10;
    __int128 v47 = v8;
    do
    {
      double v13 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v9 - v7,  v46));
      id v15 = v7;
      id v16 = v12;
      if (v13 > v7)
      {
        do
        {
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v15]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v16]);
          id v19 = v14;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v18]);
          [v20 doubleValue];
          double v22 = v21;
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"wall_energy_consumed"]);
          [v23 doubleValue];
          double v25 = v22 + v24;

          id v14 = v19;
          id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
          [v19 setObject:v26 forKeyedSubscript:v18];

          ++v15;
        }

        while (v13 != v15);
      }

      id v12 = v16;
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 keysSortedByValueUsingComparator:&stru_100010660]);
      __int16 v52 = v27;
      if ([v27 count])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          double v43 = log;
          __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
          int v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"slot_date"]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v52;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "sorted BA IDs for day %@: %@",  buf,  0x16u);

          id v27 = v52;
        }
      }

      if ([v27 count]) {
        BOOL v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:0]);
      }
      else {
        BOOL v29 = &stru_100010C58;
      }
      double v51 = v14;
      if ((unint64_t)[v27 count] >= 2
        && -[__CFString isEqualToString:](v29, "isEqualToString:", &stru_100010C58))
      {
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:1]);

        BOOL v29 = (__CFString *)v30;
      }

      uint64_t v31 = v7;
      if (v13 > v7)
      {
        do
        {
          double v32 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v31]);
          id v33 = [v32 mutableCopy];

          [v33 setObject:v29 forKeyedSubscript:v16];
          [v6 setObject:v33 atIndexedSubscript:v31];

          ++v31;
        }

        while (v13 != v31);
      }

      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"slot_date"]);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v35));

      __int16 v50 = v36;
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v36 dateByAddingTimeInterval:86400.0]);
      if (v29 && !-[__CFString isEqualToString:](v29, "isEqualToString:", &stru_100010C58))
      {
        double v8 = v47;
        if (!qword_100014B20)
        {
          *(_OWORD *)buf = off_100010680;
          *(void *)&buf[16] = 0LL;
          qword_100014B20 = _sl_dlopen(buf, 0LL);
        }

        __int16 v40 = v50;
        if (!qword_100014B20) {
          goto LABEL_34;
        }
        double v41 = self->_log;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v46;
          *(void *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v53;
          *(_WORD *)&buf[22] = 2113;
          v55 = v29;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Fetching emissions for %@ to %@ for \"%{private}@\"",  buf,  0x20u);
        }

        int v37 = (void *)objc_claimAutoreleasedReturnValue( -[_GDSManager carbonIntensityHistoryForBA:from:to:]( self->gridManager,  "carbonIntensityHistoryForBA:from:to:",  v29,  v50,  v53));
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v37 historicalMap]);
        if (v42) {
          [v47 addEntriesFromDictionary:v42];
        }
      }

      else
      {
        v56[0] = @"average";
        v56[1] = @"marginal";
        v57[0] = &off_100011360;
        v57[1] = &off_100011360;
        int v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
        if (v13 <= v7)
        {
          double v8 = v47;
        }

        else
        {
          double v8 = v47;
          do
          {
            __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
            double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"slot_date"]);
            [v47 setObject:v37 forKeyedSubscript:v39];

            ++v7;
          }

          while (v13 != v7);
        }

        __int16 v40 = v50;
      }

LABEL_34:
      id v9 = (char *)[v49 indexGreaterThanIndex:v13];
      double v7 = v13;
    }

    while (v9 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end