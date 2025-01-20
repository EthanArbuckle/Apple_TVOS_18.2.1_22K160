@interface GEOAPCountsAggregator
- (BOOL)aggregateDailyCountsAndReportFrom:(id)a3 until:(id)a4;
- (GEOAPCountsAggregator)init;
- (double)retrieveDailyAggregationInterval;
- (id)apPersistence;
- (id)now;
- (id)retrieveLastDailyAggregationTime;
- (id)retrieveLastMonthlyAggregationTime;
- (void)aggregateDailyUsageCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)aggregateMonthlyCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)aggregateMonthlyUsageCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)reportDailySettingsFrom:(id)a3 until:(id)a4;
- (void)saveLastDailyAggregationTime:(id)a3;
- (void)saveLastMonthlyAggregationTime:(id)a3;
- (void)setup;
- (void)startDailyAggregationFromTime:(id)a3;
- (void)startMonthlyAggregationFromTime:(id)a3;
@end

@implementation GEOAPCountsAggregator

- (GEOAPCountsAggregator)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GEOAPCountsAggregator;
  v2 = -[GEOAPCountsAggregator init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[GEOAPCountsAggregator setup](v2, "setup");
  }
  return v3;
}

- (void)setup
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
  runningLock = self->_runningLock;
  self->_runningLock = v3;

  id v21 = (id)objc_claimAutoreleasedReturnValue(-[GEOAPCountsAggregator now](self, "now"));
  objc_super v5 = (NSDate *)objc_claimAutoreleasedReturnValue(-[GEOAPCountsAggregator retrieveLastDailyAggregationTime](self, "retrieveLastDailyAggregationTime"));
  lastDailyAggregation = self->_lastDailyAggregation;
  self->_lastDailyAggregation = v5;

  if (!self->_lastDailyAggregation)
  {
    v7 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v7, "components:fromDate:", 60LL, v21));
    [v8 setHour:4];
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v7, "dateFromComponents:", v8));
    v10 = self->_lastDailyAggregation;
    self->_lastDailyAggregation = v9;

    -[GEOAPCountsAggregator saveLastDailyAggregationTime:]( self,  "saveLastDailyAggregationTime:",  self->_lastDailyAggregation);
  }

  -[GEOAPCountsAggregator retrieveDailyAggregationInterval](self, "retrieveDailyAggregationInterval");
  self->_double dailyAggregationInterval = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
  unsigned __int8 v13 = [v12 isInternalInstall];

  if ((v13 & 1) == 0)
  {
    double dailyAggregationInterval = self->_dailyAggregationInterval;
    if (dailyAggregationInterval < 86400.0) {
      double dailyAggregationInterval = 86400.0;
    }
    self->_double dailyAggregationInterval = dailyAggregationInterval;
  }

  v15 = (NSDate *)objc_claimAutoreleasedReturnValue( -[GEOAPCountsAggregator retrieveLastMonthlyAggregationTime]( self,  "retrieveLastMonthlyAggregationTime"));
  lastMonthlyAggregation = self->_lastMonthlyAggregation;
  self->_lastMonthlyAggregation = v15;

  if (!self->_lastMonthlyAggregation)
  {
    v17 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v17, "components:fromDate:", 28LL, v21));
    [v18 setDay:2];
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v17, "dateFromComponents:", v18));
    v20 = self->_lastMonthlyAggregation;
    self->_lastMonthlyAggregation = v19;

    -[GEOAPCountsAggregator saveLastMonthlyAggregationTime:]( self,  "saveLastMonthlyAggregationTime:",  self->_lastMonthlyAggregation);
  }
}

- (void)startDailyAggregationFromTime:(id)a3
{
  v4 = (NSDate *)a3;
  id v5 = sub_100007AE4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "starting daily at %@", buf, 0xCu);
  }

  id v7 = sub_100007798((uint64_t)self);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue(v7);
  while (-[NSDate compare:](v8, "compare:", v4) == NSOrderedAscending)
  {
    id v9 = sub_100007AE4();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    id v12 = sub_100007AE4();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "DailyAggregation",  "for '%@'",  buf,  0xCu);
    }

    -[GEOAPCountsAggregator aggregateDailyCountsAndReportFrom:until:]( self,  "aggregateDailyCountsAndReportFrom:until:",  self->_lastDailyAggregation,  v8);
    lastDailyAggregation = self->_lastDailyAggregation;
    self->_lastDailyAggregation = v8;
    v16 = v8;

    -[GEOAPCountsAggregator saveLastDailyAggregationTime:]( self,  "saveLastDailyAggregationTime:",  self->_lastDailyAggregation);
    id v17 = sub_100007798((uint64_t)self);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(v17);

    id v18 = sub_100007AE4();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v11,  "DailyAggregation",  "for '%@'",  buf,  0xCu);
    }
  }

  id v21 = sub_100007AE4();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "completed daily", buf, 2u);
  }
}

- (void)startMonthlyAggregationFromTime:(id)a3
{
  v4 = (NSDate *)a3;
  id v5 = sub_100007AE4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "started monthly at %@", buf, 0xCu);
  }

  id v7 = sub_1000077DC(self);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_100007AE4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "next agg at %@", buf, 0xCu);
  }

  while (-[NSDate compare:](v8, "compare:", v4) == NSOrderedAscending)
  {
    id v11 = sub_100007AE4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    id v14 = sub_100007AE4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "MonthlyAggregation",  "for '%@'",  buf,  0xCu);
    }

    -[GEOAPCountsAggregator aggregateMonthlyCountsAndReportFrom:until:]( self,  "aggregateMonthlyCountsAndReportFrom:until:",  self->_lastMonthlyAggregation,  v8);
    lastMonthlyAggregation = self->_lastMonthlyAggregation;
    self->_lastMonthlyAggregation = v8;
    id v18 = v8;

    -[GEOAPCountsAggregator saveLastMonthlyAggregationTime:]( self,  "saveLastMonthlyAggregationTime:",  self->_lastMonthlyAggregation);
    v19 = sub_1000077DC(self);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(v19);

    id v20 = sub_100007AE4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  v13,  "MonthlyAggregation",  "for '%@'",  buf,  0xCu);
    }
  }

  id v23 = sub_100007AE4();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "completed monthly", buf, 2u);
  }
}

- (void)reportDailySettingsFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007AE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "starting Daily Settings report", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v17 = buf;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_1000080B4;
  id v20 = sub_1000080C4;
  id v21 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPCountsAggregator apPersistence](self, "apPersistence"));
  v14[4] = buf;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000080CC;
  v15[3] = &unk_100028848;
  v15[4] = buf;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000081F4;
  v14[3] = &unk_1000286A0;
  [v10 selectDailySettingsWithVisitorBlock:v15 completionBlock:v14];

  id v11 = sub_100007AE4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)os_signpost_id_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "finished Daily Settings report", v13, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)aggregateMonthlyUsageCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007AE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "starting monthly usage counts aggregation up until %{private}@",  (uint8_t *)&buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  113LL));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x2020000000LL;
  int v39 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  int v32 = 0;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPCountsAggregator apPersistence](self, "apPersistence"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008630;
  v23[3] = &unk_100028898;
  id v12 = v7;
  id v24 = v12;
  p___int128 buf = &buf;
  v28 = &v29;
  id v13 = v6;
  id v25 = v13;
  id v26 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000089E8;
  v19[3] = &unk_1000288E8;
  id v21 = &buf;
  int v22 = 4;
  id v14 = v26;
  id v20 = v14;
  [v11 selectMonthlyCountsWithVisitorBlock:v23 completionBlock:v19];

  id v15 = sub_100007AE4();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);
    int v18 = *((_DWORD *)v30 + 6);
    *(_DWORD *)v33 = 67109376;
    int v34 = v17;
    __int16 v35 = 1024;
    int v36 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "processed %u Monthly Usage counts; dropped %u counts",
      v33,
      0xEu);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)aggregateDailyUsageCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007AE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "starting daily usage counts aggregation up until %{private}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v68 = 0x3032000000LL;
  v69 = sub_1000080B4;
  v70 = sub_1000080C4;
  id v71 = 0LL;
  v61[0] = 0LL;
  v61[1] = v61;
  v61[2] = 0x3032000000LL;
  v61[3] = sub_1000080B4;
  v61[4] = sub_1000080C4;
  id v62 = 0LL;
  v59[0] = 0LL;
  v59[1] = v59;
  v59[2] = 0x3032000000LL;
  v59[3] = sub_1000080B4;
  v59[4] = sub_1000080C4;
  id v60 = 0LL;
  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x3032000000LL;
  v57[3] = sub_1000080B4;
  v57[4] = sub_1000080C4;
  id v58 = v6;
  v56[0] = 0LL;
  v56[1] = v56;
  v56[2] = 0x2020000000LL;
  v56[3] = 0LL;
  v54[0] = 0LL;
  v54[1] = v54;
  v54[2] = 0x3032000000LL;
  v54[3] = sub_1000080B4;
  v54[4] = sub_1000080C4;
  id v10 = v58;
  id v55 = v10;
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x2020000000LL;
  v53[3] = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  113LL));
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  int v52 = 0;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  int v48 = 0;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPCountsAggregator apPersistence](self, "apPersistence"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000091C8;
  v32[3] = &unk_100028938;
  id v19 = v7;
  id v33 = v19;
  int v36 = &v49;
  v37 = &v45;
  id v34 = v10;
  uint64_t v38 = v57;
  int v39 = v56;
  v40 = v54;
  v41 = v53;
  id v35 = v11;
  v42 = v59;
  v43 = v61;
  p___int128 buf = &buf;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100009794;
  v20[3] = &unk_100028988;
  id v23 = &v49;
  int v31 = 4;
  id v13 = v35;
  id v21 = v13;
  id v24 = v61;
  id v25 = &buf;
  id v26 = v56;
  v27 = v57;
  id v14 = v34;
  id v22 = v14;
  v28 = v53;
  uint64_t v29 = v54;
  v30 = v59;
  [v12 selectDailyCountsWithVisitorBlock:v32 completionBlock:v20];

  id v15 = sub_100007AE4();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = *((_DWORD *)v50 + 6);
    int v18 = *((_DWORD *)v46 + 6);
    *(_DWORD *)v63 = 67109376;
    int v64 = v17;
    __int16 v65 = 1024;
    int v66 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "processed %u Daily Usage counts; dropped %u counts",
      v63,
      0xEu);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)aggregateDailyCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007AE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478083;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "starting daily aggregation from %{private}@ until %{private}@",  (uint8_t *)&v13,  0x16u);
  }

  -[GEOAPCountsAggregator reportDailySettingsFrom:until:](self, "reportDailySettingsFrom:until:", v6, v7);
  -[GEOAPCountsAggregator aggregateDailyUsageCountsAndReportFrom:until:]( self,  "aggregateDailyUsageCountsAndReportFrom:until:",  v6,  v7);
  id v10 = sub_100007AE4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478083;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "finished daily aggregation from %{private}@ until %{private}@",  (uint8_t *)&v13,  0x16u);
  }

  return 1;
}

- (void)aggregateMonthlyCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007AE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138478083;
    id v13 = v6;
    __int16 v14 = 2113;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "starting monthly aggregation from %{private}@ until %{private}@",  (uint8_t *)&v12,  0x16u);
  }

  -[GEOAPCountsAggregator aggregateMonthlyUsageCountsAndReportFrom:until:]( self,  "aggregateMonthlyUsageCountsAndReportFrom:until:",  v6,  v7);
  id v10 = sub_100007AE4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138478083;
    id v13 = v6;
    __int16 v14 = 2113;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "finished monthly aggregation from %{private}@ until %{private}@",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)saveLastDailyAggregationTime:(id)a3
{
}

- (id)retrieveLastDailyAggregationTime
{
  return (id)GEOConfigGetDate( GeoAnalyticsConfig_DailyCountsAggregationLastRunTime[0],  GeoAnalyticsConfig_DailyCountsAggregationLastRunTime[1]);
}

- (void)saveLastMonthlyAggregationTime:(id)a3
{
}

- (id)retrieveLastMonthlyAggregationTime
{
  return (id)GEOConfigGetDate( GeoAnalyticsConfig_MonthlyCountsAggregationLastRunTime[0],  GeoAnalyticsConfig_MonthlyCountsAggregationLastRunTime[1]);
}

- (double)retrieveDailyAggregationInterval
{
  return result;
}

- (id)now
{
  return objc_alloc_init(&OBJC_CLASS___NSDate);
}

- (id)apPersistence
{
  return +[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance");
}

- (void).cxx_destruct
{
}

@end