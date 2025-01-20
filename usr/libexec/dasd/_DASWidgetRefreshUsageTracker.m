@interface _DASWidgetRefreshUsageTracker
+ (id)sharedInstance;
- (NSDate)computedBudgetDate;
- (NSMutableDictionary)dailyComputedBudgetsForAllWidgets;
- (NSMutableDictionary)trackingWidgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDLocalContext)context;
- (_DASWidgetRefreshUsageTracker)init;
- (double)stopTrackingActivity:(id)a3;
- (double)sumOfValuesOfDictionary:(id)a3;
- (id)allocatedBudgetsWithAverageViews:(id)a3 groupTotalBudget:(int)a4 individualMaxBudgets:(id)a5 individualMinBudget:(int)a6;
- (id)dailyBudgetForWidget:(id)a3;
- (id)dailyBudgetsForAllWidgets;
- (id)getAverageWidgetViewsPerDayWithStore:(id)a3;
- (int)allocateBudgetForViewsCurve:(int)a3;
- (unsigned)maxWidgetRefreshBudgetForIndividualDaily;
- (unsigned)maxWidgetRefreshBudgetForSystemDaily;
- (void)computeBudgetFromHistoryForAllWidgets;
- (void)flushComputedBudgetCache;
- (void)invalidateComputedBudgetCache;
- (void)setComputedBudgetDate:(id)a3;
- (void)setContext:(id)a3;
- (void)setDailyComputedBudgetsForAllWidgets:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTrackingWidgets:(id)a3;
- (void)startTrackingActivity:(id)a3;
@end

@implementation _DASWidgetRefreshUsageTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015E28;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157560 != -1) {
    dispatch_once(&qword_100157560, block);
  }
  return (id)qword_100157568;
}

- (_DASWidgetRefreshUsageTracker)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshUsageTracker;
  v2 = -[_DASWidgetRefreshUsageTracker init](&v20, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "widgetRefresh");
    log = v2->_log;
    v2->_log = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    trackingWidgets = v2->_trackingWidgets;
    v2->_trackingWidgets = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dailyComputedBudgetsForAllWidgets = v2->_dailyComputedBudgetsForAllWidgets;
    v2->_dailyComputedBudgetsForAllWidgets = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    computedBudgetDate = v2->_computedBudgetDate;
    v2->_computedBudgetDate = (NSDate *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.dasd.computeWidgetBudgets", v16);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v17;
  }

  return v2;
}

- (id)dailyBudgetForWidget:(id)a3
{
  id v4 = a3;
  -[_DASWidgetRefreshUsageTracker computeBudgetFromHistoryForAllWidgets](self, "computeBudgetFromHistoryForAllWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dailyComputedBudgetsForAllWidgets, "objectForKey:", v4));

  return v5;
}

- (id)dailyBudgetsForAllWidgets
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_dailyComputedBudgetsForAllWidgets, "allKeys"));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DASWidgetRefreshUsageTracker dailyBudgetForWidget:]( self,  "dailyBudgetForWidget:",  v10,  (void)v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)computeBudgetFromHistoryForAllWidgets
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v3 timeIntervalSinceDate:self->_computedBudgetDate];
  double v5 = v4;

  if (v5 > 60.0)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000LL;
    uint64_t v11 = sub_1000161F4;
    v12 = sub_100016204;
    __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001620C;
    v7[3] = &unk_100115288;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(queue, v7);
    objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, (id)v9[5]);
    _Block_object_dispose(&v8, 8);
  }

- (void)invalidateComputedBudgetCache
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000166E0;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)flushComputedBudgetCache
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016770;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)getAverageWidgetViewsPerDayWithStore:(id)a3
{
  id v48 = a3;
  v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v61 dateByAddingTimeInterval:-604800.0]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:86400.0]);
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v7 = 0;
  uint64_t v47 = kDASWidgetViewStreamName;
  do
  {
    int v55 = v7;
    context = objc_autoreleasePoolPush();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](&OBJC_CLASS____DKEventStream, "eventStreamWithName:", v47));
    id obj = v3;
    v59 = (void *)v4;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartAndEndInDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartAndEndInDateRangeFrom:to:",  v3,  v4));
    v52 = (void *)v8;
    uint64_t v82 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v82, 1LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  1LL));
    v81 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
    v51 = (void *)v9;
    __int128 v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v9,  v10,  0LL,  5000LL,  v12));

    -[NSMutableDictionary setReadMetadata:](v13, "setReadMetadata:", 0LL);
    id v72 = 0LL;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v48 executeQuery:v13 error:&v72]);
    id v15 = v72;
    if (v15)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v13;
        __int16 v79 = 2112;
        id v80 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Query for widget views %@ failed with error %@",  buf,  0x16u);
      }
    }

    v49 = v15;
    v50 = v13;
    dispatch_queue_t v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000B16BC(v75, v17, v14, &v76);
    }
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v69;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v69 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v5, "valueForKey:", v24));

          if (!v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v23 startDate]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, v24);
          }

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v6, "valueForKey:", v24));

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v24));
            v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v28 intValue] + 1));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v29, v24);
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100121A08, v24);
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }

      while (v20);
    }

    objc_autoreleasePoolPop(context);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([obj dateByAddingTimeInterval:86400.0]);

    uint64_t v31 = objc_claimAutoreleasedReturnValue([v59 dateByAddingTimeInterval:86400.0]);
    int v7 = v55 + 1;
    os_log_t v3 = (void *)v30;
    uint64_t v4 = v31;
  }

  while (v55 != 6);
  contexta = (void *)v31;
  v56 = (void *)v30;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
  id v32 = [obja countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v60 = *(void *)v65;
    do
    {
      for (j = 0LL; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v65 != v60) {
          objc_enumerationMutation(obja);
        }
        v35 = *(NSMutableDictionary **)(*((void *)&v64 + 1) + 8LL * (void)j);
        v36 = objc_autoreleasePoolPush();
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v35));
        [v37 timeIntervalSinceDate:v61];
        double v39 = v38;

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v35));
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  ((int)[v40 intValue] / (int)vcvtpd_s64_f64(v39 / -86400.0))));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v41, v35);

        v42 = self->_log;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v35));
          *(_DWORD *)buf = 138412546;
          v78 = v35;
          __int16 v79 = 2112;
          id v80 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "widget: %@ - view count: %@", buf, 0x16u);
        }

        objc_autoreleasePoolPop(v36);
      }

      id v33 = [obja countByEnumeratingWithState:&v64 objects:v73 count:16];
    }

    while (v33);
  }

  v45 = self->_log;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v62;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Average views %@", buf, 0xCu);
  }

  return v62;
}

- (int)allocateBudgetForViewsCurve:(int)a3
{
  else {
    return a3;
  }
}

- (id)allocatedBudgetsWithAverageViews:(id)a3 groupTotalBudget:(int)a4 individualMaxBudgets:(id)a5 individualMinBudget:(int)a6
{
  id v9 = a3;
  id v43 = a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v42 = v9;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  id v11 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    double v14 = 0.0;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
        dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:v16]);
        id v18 = [v17 intValue];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v16]);
        signed int v20 = [v19 intValue];

        int v21 = -[_DASWidgetRefreshUsageTracker allocateBudgetForViewsCurve:](self, "allocateBudgetForViewsCurve:", v18);
        if (v21 >= v20) {
          int v22 = v20;
        }
        else {
          int v22 = v21;
        }
        if (v22 <= a6) {
          uint64_t v23 = a6;
        }
        else {
          uint64_t v23 = v22;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v23));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v24, v16);

        double v14 = v14 + (double)v21;
      }

      id v12 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }

    while (v12);
  }

  else
  {
    double v14 = 0.0;
  }

  if (v14 > (double)a4)
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v25 = obj;
    id v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v45;
      double v29 = (double)a4 / v14;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)j);
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v31));
          [v32 doubleValue];
          double v34 = v33;

          v35 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v31]);
          int v36 = [v35 intValue];

          else {
            double v37 = v29;
          }
          double v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v34 * v37)));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v38, v31);
        }

        id v27 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }

      while (v27);
    }
  }

  return v10;
}

- (void)startTrackingActivity:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 widgetBudgetID]);

  if (v4)
  {
    trackingWidgets = self->_trackingWidgets;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 widgetBudgetID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( trackingWidgets,  "setObject:forKeyedSubscript:",  &off_100121A08,  v6);
  }
}

- (double)stopTrackingActivity:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetBudgetID]);

  double v6 = 0.0;
  if (v5)
  {
    trackingWidgets = self->_trackingWidgets;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetBudgetID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](trackingWidgets, "objectForKeyedSubscript:", v8));

    if (v9)
    {
      uint64_t v10 = self->_trackingWidgets;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetBudgetID]);
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

      double v6 = 1.0;
    }
  }

  return v6;
}

- (double)sumOfValuesOfDictionary:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)i)]);
        [v9 doubleValue];
        double v7 = v7 + v10;
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (unsigned)maxWidgetRefreshBudgetForSystemDaily
{
  return self->_maxWidgetRefreshBudgetForSystemDaily;
}

- (unsigned)maxWidgetRefreshBudgetForIndividualDaily
{
  return self->_maxWidgetRefreshBudgetForIndividualDaily;
}

- (NSMutableDictionary)trackingWidgets
{
  return self->_trackingWidgets;
}

- (void)setTrackingWidgets:(id)a3
{
}

- (NSMutableDictionary)dailyComputedBudgetsForAllWidgets
{
  return self->_dailyComputedBudgetsForAllWidgets;
}

- (void)setDailyComputedBudgetsForAllWidgets:(id)a3
{
}

- (NSDate)computedBudgetDate
{
  return self->_computedBudgetDate;
}

- (void)setComputedBudgetDate:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end