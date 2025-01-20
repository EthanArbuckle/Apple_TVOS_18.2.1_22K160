@interface _DASBudgetModulator
+ (id)modulatorForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7;
- (NSArray)budgets;
- (NSDate)lastModulationDate;
- (NSDate)lastStartOfADayPeriodForBudgetAllocation;
- (NSDate)lastUsageTimelineUpdate;
- (NSMutableDictionary)lastPredictionUpdateForWidgets;
- (NSMutableDictionary)predictedBudgetsForWidgets;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_DASBudgetPersisting)persistence;
- (_DKKnowledgeStore)store;
- (_DKPredictionTimeline)usage;
- (double)areaUnderTrapeziodWithFirstValue:(double)a3 andSecondValue:(double)a4;
- (double)budgetProportionAtDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5;
- (double)gaussianKDEatDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5;
- (double)locked_budgetAllocationProportionAtDate:(id)a3 forWidgetBudgetID:(id)a4;
- (double)relativeUsageAtDate:(id)a3 withTimeline:(id)a4;
- (id)initForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7;
- (id)usageTimeline;
- (id)usageTimelineForWidgetBudgetID:(id)a3 withStartDate:(id)a4;
- (int)computeSlotForDate:(id)a3 relativeToDate:(id)a4;
- (int)numberOfModulationFromDate:(id)a3 toDate:(id)a4;
- (void)locked_addBudgetsToBeModulated:(id)a3;
- (void)locked_modulateBudgets;
- (void)locked_replaceBudgetsToBeModulated:(id)a3;
- (void)locked_updateBudgetsToBeModulatedAdditions:(id)a3 removals:(id)a4;
- (void)modulateBudgets:(id)a3 lastModulatedAt:(id)a4 forNumberOfModulationSlots:(int)a5 atDate:(id)a6;
- (void)registerForTrial;
- (void)setBudgets:(id)a3;
- (void)setLastModulationDate:(id)a3;
- (void)setLastPredictionUpdateForWidgets:(id)a3;
- (void)setLastStartOfADayPeriodForBudgetAllocation:(id)a3;
- (void)setLastUsageTimelineUpdate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPredictedBudgetsForWidgets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUsage:(id)a3;
- (void)updateCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)updateTrialParametersWithManager:(id)a3;
@end

@implementation _DASBudgetModulator

- (id)initForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS____DASBudgetModulator;
  id v17 = -[_DASBudgetModulator init](&v51, "init");
  if (v17)
  {
    if (v13) {
      id v18 = v13;
    }
    else {
      id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    v19 = (void *)*((void *)v17 + 5);
    *((void *)v17 + 5) = v18;

    objc_storeStrong((id *)v17 + 1, a5);
    objc_storeStrong((id *)v17 + 2, a6);
    id v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"budgetModulation%@", v12));
    os_log_t v21 = os_log_create("com.apple.duetactivityscheduler", (const char *)[v20 UTF8String]);
    v22 = (void *)*((void *)v17 + 12);
    *((void *)v17 + 12) = v21;

    dispatch_source_t v23 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v17 + 2));
    v24 = (void *)*((void *)v17 + 6);
    *((void *)v17 + 6) = v23;

    objc_storeStrong((id *)v17 + 7, a7);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v26 = (void *)*((void *)v17 + 4);
    *((void *)v17 + 4) = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v28 = (void *)*((void *)v17 + 11);
    *((void *)v17 + 11) = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v30 = (void *)*((void *)v17 + 10);
    *((void *)v17 + 10) = v29;

    unsigned int v31 = [v12 isEqualToString:@"Widgets"];
    if (v31) {
      int v32 = 900;
    }
    else {
      int v32 = 1800;
    }
    dword_1001574F0 = v32;
    if (v31) {
      int v33 = 96;
    }
    else {
      int v33 = 48;
    }
    dword_1001574F4 = v33;
    [v17 registerForTrial];
    v34 = (dispatch_source_s *)*((void *)v17 + 6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000ECC0;
    block[3] = &unk_1001150D0;
    v35 = v17;
    id v50 = v35;
    dispatch_block_t v36 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v34, v36);

    uint64_t v37 = objc_claimAutoreleasedReturnValue([v14 lastModulationDate]);
    v38 = (void *)v35[3];
    v35[3] = v37;

    uint64_t v39 = dword_1001574F0;
    v40 = (void *)v35[3];
    if (v40)
    {
      [v40 timeIntervalSinceNow];
      uint64_t v39 = llround(fmax(v41 + (double)v39, 0.0));
    }

    v42 = (os_log_s *)*((void *)v17 + 12);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v53 = (double)v39 / 60.0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Setting timer to fire ~%2.0fm from now",  buf,  0xCu);
    }

    v43 = (dispatch_source_s *)*((void *)v17 + 6);
    dispatch_time_t v44 = dispatch_walltime(0LL, 1000000000 * v39 + 60000000000LL);
    dispatch_source_set_timer(v43, v44, 1000000000LL * dword_1001574F0, 0xDBCAC8E00uLL);
    v45 = (dispatch_queue_s *)*((void *)v17 + 2);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10000ECF0;
    v47[3] = &unk_1001150D0;
    v48 = v35;
    dispatch_async(v45, v47);
    dispatch_activate(*((dispatch_object_t *)v17 + 6));
  }

  return v17;
}

+ (id)modulatorForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)objc_opt_class(a1)) initForBudgetTypes:v16 withBudgets:v15 persistence:v14 withQueue:v13 withStore:v12];

  return v17;
}

- (void)registerForTrial
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  [v3 addDelegate:self];
  -[_DASBudgetModulator updateTrialParametersWithManager:](self, "updateTrialParametersWithManager:", v3);
}

- (void)updateTrialParametersWithManager:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 factorWithName:@"Budget_UsageModulationMaximumInitialAllotmentPercentage"]);
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    qword_100156718 = v7;
  }

  uint64_t v8 = qword_100156720;
  uint64_t v9 = qword_100156728;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 factorWithName:@"Budget_MinimumBatteryLevelForFullUsageInitialAllotment"]);

  if (v10)
  {
    [v10 doubleValue];
    uint64_t v9 = v11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 factorWithName:@"Budget_MinimumBatteryForUsageInitialAllotment"]);

  if (v12)
  {
    [v12 doubleValue];
    uint64_t v8 = v13;
  }

  if (*(double *)&v8 <= *(double *)&v9)
  {
    qword_100156720 = v8;
    qword_100156728 = v9;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 factorWithName:@"Budget_MinimumUsageAllotmentSlotLookaheadDuration"]);

  if (v14)
  {
    [v14 doubleValue];
    qword_100156730 = v15;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218752;
    uint64_t v18 = qword_100156718;
    __int16 v19 = 2048;
    uint64_t v20 = qword_100156720;
    __int16 v21 = 2048;
    uint64_t v22 = qword_100156728;
    __int16 v23 = 2048;
    uint64_t v24 = qword_100156730;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Config: Initial Allotment: %.2f, Minimum Level: %.0f, Minimum Full Level: %.0f, Minimum Lookahead: %.0f",  (uint8_t *)&v17,  0x2Au);
  }
}

- (void)locked_replaceBudgetsToBeModulated:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary removeAllObjects](self->_lastPredictionUpdateForWidgets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_predictedBudgetsForWidgets, "removeAllObjects");
  v6 = (NSArray *)[v5 copy];
  budgets = self->_budgets;
  self->_budgets = v6;

  uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastModulationDate = self->_lastModulationDate;
  self->_lastModulationDate = v8;

  -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:]( self,  "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:",  v5,  0LL,  1LL,  self->_lastModulationDate);
  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (void)locked_addBudgetsToBeModulated:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate) {
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:]( self,  "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:",  v6,  0LL,  1LL);
  }
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_budgets, "arrayByAddingObjectsFromArray:", v6));
  budgets = self->_budgets;
  self->_budgets = v4;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (void)locked_updateBudgetsToBeModulatedAdditions:(id)a3 removals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate) {
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:]( self,  "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:",  v6,  0LL,  1LL);
  }
  id v8 = -[NSArray mutableCopy](self->_budgets, "mutableCopy");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "removeObject:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v13), (void)v16);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  [v8 addObjectsFromArray:v6];
  id v14 = (NSArray *)[v8 copy];
  budgets = self->_budgets;
  self->_budgets = v14;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (int)numberOfModulationFromDate:(id)a3 toDate:(id)a4
{
  return vcvtmd_s64_f64((v4 + 60.0) / (86400.0 / (double)dword_1001574F4));
}

- (double)relativeUsageAtDate:(id)a3 withTimeline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isUnavailable])
  {
    double v8 = 1.0 / (double)dword_1001574F4;
  }

  else
  {
    id v9 = objc_autoreleasePoolPush();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 138412290;
      id v43 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Modulation Timeline: %@",  (uint8_t *)&v42,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAtDate:v11]);
    [v12 doubleValue];
    double v14 = v13;

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dateByAddingTimeInterval:(double)dword_1001574F0]);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;

    if (v19 >= 0.0)
    {
      uint64_t v22 = v16;
    }

    else
    {
      do
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAtDate:v16]);
        [v20 doubleValue];
        double v14 = v14 + v21;

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 dateByAddingTimeInterval:(double)dword_1001574F0]);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
        [v22 timeIntervalSinceDate:v23];
        double v25 = v24;

        __int128 v16 = v22;
      }

      while (v25 < 0.0);
    }

    double v26 = *(double *)&qword_100156730;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:v26]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
    [v27 timeIntervalSinceDate:v28];
    double v30 = v29;

    if (v30 >= 0.0)
    {
      unsigned int v31 = v27;
    }

    else
    {
      do
      {
        unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v27 dateByAddingTimeInterval:86400.0]);

        int v32 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
        [v31 timeIntervalSinceDate:v32];
        double v34 = v33;

        v27 = v31;
      }

      while (v34 < 0.0);
    }

    v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      dispatch_block_t v36 = v35;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAtDate:v31]);
      int v42 = 138412802;
      id v43 = v37;
      __int16 v44 = 2112;
      v45 = v31;
      __int16 v46 = 2112;
      v47 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "All Likelihoods: %@, Value at %@: %@",  (uint8_t *)&v42,  0x20u);
    }

    if (v14 == 0.0)
    {
      double v8 = 1.0 / (double)dword_1001574F4;
    }

    else
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAtDate:v31]);
      [v39 doubleValue];
      double v8 = v40 / v14;
    }

    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (id)usageTimeline
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v4 = v3;
  if (self->_usage && ([v3 timeIntervalSinceDate:self->_lastUsageTimelineUpdate], v5 < 21600.0))
  {
    id v6 = self->_usage;
  }

  else
  {
    id v7 = objc_autoreleasePoolPush();
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKPredictor predictorWithKnowledgeStore:]( &OBJC_CLASS____DKPredictor,  "predictorWithKnowledgeStore:",  self->_store));
    id v6 = (_DKPredictionTimeline *)objc_claimAutoreleasedReturnValue([v8 deviceActivityLikelihood]);
    objc_storeStrong((id *)&self->_usage, v6);
    objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, v4);

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

- (void)locked_modulateBudgets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastModulationDate = self->_lastModulationDate;
  if (lastModulationDate)
  {
    uint64_t v5 = -[_DASBudgetModulator numberOfModulationFromDate:toDate:]( self,  "numberOfModulationFromDate:toDate:",  lastModulationDate,  v3);
    if (!(_DWORD)v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Last updated budgets too recently. Exiting.",  (uint8_t *)&v13,  2u);
      }

      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  id v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  double v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    budgets = self->_budgets;
    id v10 = self->_lastModulationDate;
    int v13 = 138412802;
    double v14 = budgets;
    __int16 v15 = 2112;
    __int128 v16 = v10;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Last modulated budgets %@ at %@, modulating for %d slots from then to now",  (uint8_t *)&v13,  0x1Cu);
  }

  -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:]( self,  "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:",  self->_budgets,  self->_lastModulationDate,  v5,  v7);
  id v11 = self->_lastModulationDate;
  self->_lastModulationDate = v7;
  uint64_t v12 = v7;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
  -[_DASBudgetPersisting saveModulationDate:](self->_persistence, "saveModulationDate:", v12);

LABEL_9:
}

- (void)modulateBudgets:(id)a3 lastModulatedAt:(id)a4 forNumberOfModulationSlots:(int)a5 atDate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v73;
    double v15 = -1.0;
    double v16 = 0.0;
    *(void *)&__int128 v12 = 134218242LL;
    __int128 v66 = v12;
    id v67 = a4;
    uint64_t v68 = *(void *)v73;
LABEL_3:
    uint64_t v17 = 0LL;
    id v70 = v13;
    while (2)
    {
      if (*(void *)v73 != v14) {
        objc_enumerationMutation(obj);
      }
      int v18 = *(void **)(*((void *)&v72 + 1) + 8 * v17);
      switch(objc_msgSend(v18, "allocationType", v66))
      {
        case 0u:
          double v16 = 0.0;
          goto LABEL_29;
        case 1u:
          [v18 capacity];
          double v16 = v26 * (double)a5 / (double)dword_1001574F4;
          goto LABEL_29;
        case 2u:
          if (a4)
          {
            if (v15 < 0.0)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetModulator usageTimeline](self, "usageTimeline"));
              -[_DASBudgetModulator relativeUsageAtDate:withTimeline:]( self,  "relativeUsageAtDate:withTimeline:",  v10,  v27);
              double v15 = v28;
            }

            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              double v77 = v15 * 100.0;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Allocating %2.2f%% of budget based on usage",  buf,  0xCu);
            }

            [v18 capacity];
            double v16 = v15 * v30;
            if ([v18 allocationType])
            {
LABEL_31:
              if (v16 != 0.0)
              {
                dispatch_block_t v36 = self->_log;
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  double v77 = *(double *)&v18;
                  __int16 v78 = 2048;
                  double v79 = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Increment budget %@ by %10.2lf",  buf,  0x16u);
                }

                [v18 incrementBy:v16];
              }

              goto LABEL_53;
            }
          }

          else
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryLevel"));
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
            [v39 doubleValue];
            double v41 = v40;

            id v13 = v70;
            double v42 = 0.0;
            if (v41 >= *(double *)&qword_100156720)
            {
              double v42 = *(double *)&qword_100156718;
              if (v41 < *(double *)&qword_100156728) {
                double v42 = (v41 - *(double *)&qword_100156720)
              }
                    * *(double *)&qword_100156718
                    / (*(double *)&qword_100156728 - *(double *)&qword_100156720);
            }

            [v18 capacity];
            double v16 = v42 * v43;
            __int16 v44 = self->_log;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = v44;
              __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
              *(_DWORD *)buf = v66;
              double v77 = v16;
              __int16 v78 = 2112;
              double v79 = *(double *)&v46;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "Allocating %.0f budget on start for %@",  buf,  0x16u);
            }

            if ([v18 allocationType])
            {
LABEL_41:
              v47 = self->_log;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                double v77 = *(double *)&v18;
                __int16 v78 = 2048;
                double v79 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Set budget balance for %@ to %10.2lf",  buf,  0x16u);
              }

              v48 = v18;
              double v49 = v16;
LABEL_52:
              [v48 setBalance:v49];
              goto LABEL_53;
            }
          }

- (void)updateCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = self->_budgets;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (void)v15));
        unsigned int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          [v12 setCapacity:a3];
          goto LABEL_11;
        }
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (int)computeSlotForDate:(id)a3 relativeToDate:(id)a4
{
  if (v4 < 0.0) {
    double v4 = v4 + ceil(v4 / -86400.0) * 86400.0;
  }
  return (uint64_t)v4 / dword_1001574F0 % dword_1001574F4;
}

- (double)locked_budgetAllocationProportionAtDate:(id)a3 forWidgetBudgetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_predictedBudgetsForWidgets,  "objectForKeyedSubscript:",  v7));

  if (!v8)
  {
LABEL_6:
    lastStartOfADayPeriodForBudgetAllocation = self->_lastStartOfADayPeriodForBudgetAllocation;
    if (lastStartOfADayPeriodForBudgetAllocation)
    {
      id v13 = lastStartOfADayPeriodForBudgetAllocation;
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", v6);
      if (v14 >= -86400.0)
      {
        id v9 = v13;
      }

      else
      {
        do
        {
          id v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", 86400.0));

          -[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v6);
          id v13 = v9;
        }

        while (v15 < -86400.0);
      }

      double v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastPredictionUpdateForWidgets,  "objectForKeyedSubscript:",  v7));

      if (v24) {
        double v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastPredictionUpdateForWidgets,  "objectForKeyedSubscript:",  v7));
      }
      else {
        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", 0.0));
      }
      double v26 = v25;
      [v25 timeIntervalSinceDate:v6];
      if (-v27 <= (double)(24 * dword_1001574F0))
      {
        double v23 = v26;
      }

      else
      {
        do
        {
          double v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateByAddingTimeInterval:"));

          [v23 timeIntervalSinceDate:v6];
          double v26 = v23;
        }

        while (-v28 > (double)(24 * dword_1001574F0));
      }

      while (1)
      {
        [v23 timeIntervalSinceDate:v6];
        if (v30 <= 0.0) {
          break;
        }
        double v29 = v23;
        double v23 = (void *)objc_claimAutoreleasedReturnValue([v23 dateByAddingTimeInterval:(double)(-24 * dword_1001574F0)]);
      }
    }

    else
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v9 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v22,  -5.0));

      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", 0.0));
    }

    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( -[_DASBudgetModulator usageTimelineForWidgetBudgetID:withStartDate:]( self,  "usageTimelineForWidgetBudgetID:withStartDate:",  v7,  v9));
    if ([v31 isUnavailable])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v68 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Budget allocation predictions unavailable for widget %@, returning even modulation",  buf,  0xCu);
      }

      double v20 = 1.0 / (double)dword_1001574F4;
    }

    else
    {
      double v33 = (void *)objc_claimAutoreleasedReturnValue([v31 startDate]);
      double v34 = (void *)objc_claimAutoreleasedReturnValue([v31 valueAtDate:v33]);
      [v34 doubleValue];
      double v36 = v35;

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v31 startDate]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dateByAddingTimeInterval:(double)dword_1001574F0]);

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v31 endDate]);
      [v38 timeIntervalSinceDate:v39];
      double v41 = v40;

      id v66 = v7;
      if (v41 >= 0.0)
      {
        __int16 v44 = v38;
      }

      else
      {
        do
        {
          double v42 = (void *)objc_claimAutoreleasedReturnValue([v31 valueAtDate:v38]);
          [v42 doubleValue];
          double v36 = v36 + v43;

          __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v38 dateByAddingTimeInterval:(double)dword_1001574F0]);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v31 endDate]);
          [v44 timeIntervalSinceDate:v45];
          double v47 = v46;

          v38 = v44;
        }

        while (v47 < 0.0);
      }

      v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      for (int i = 0; i != 24; ++i)
      {
        double v50 = (void *)objc_claimAutoreleasedReturnValue([v23 dateByAddingTimeInterval:(double)(dword_1001574F0 * i)]);
        -[_DASBudgetModulator budgetProportionAtDate:withTimeline:withNormalizer:]( self,  "budgetProportionAtDate:withTimeline:withNormalizer:",  v50,  v31,  v36);
        double v52 = v51;

        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v52));
        -[NSMutableArray addObject:](v48, "addObject:", v53);
      }

      id v7 = v66;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_predictedBudgetsForWidgets,  "setObject:forKeyedSubscript:",  v48,  v66);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastPredictionUpdateForWidgets,  "setObject:forKeyedSubscript:",  v23,  v66);
      objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, v9);
      v54 = self->_log;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        double v55 = (double)(24 * dword_1001574F0);
        double v56 = v54;
        double v57 = (void *)objc_claimAutoreleasedReturnValue([v23 dateByAddingTimeInterval:v55]);
        *(_DWORD *)buf = 138413314;
        *(void *)uint64_t v68 = v66;
        *(_WORD *)&v68[8] = 2112;
        *(void *)&v68[10] = v23;
        *(_WORD *)&v68[18] = 2112;
        *(void *)&v68[20] = v57;
        __int16 v69 = 2112;
        id v70 = v9;
        __int16 v71 = 2112;
        __int128 v72 = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "Computed fresh budget allocation predictions cache for widget %@, START: %@, END: %@, TIMELINE START: %@, PREDICTIONS: %@",  buf,  0x34u);

        id v7 = v66;
      }

      unsigned int v58 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:]( self,  "computeSlotForDate:relativeToDate:",  v6,  v23);
      unsigned int v59 = v58;
      if (v58 < 0x18)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v48, "objectAtIndexedSubscript:", v58));
        [v61 doubleValue];
        double v20 = v62;
      }

      else
      {
        double v60 = self->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v64 = v60;
          id v65 = -[NSMutableArray count](v48, "count");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v68 = v59;
          *(_WORD *)&v68[4] = 2112;
          *(void *)&v68[6] = v6;
          *(_WORD *)&v68[14] = 2048;
          *(void *)&v68[16] = v65;
          _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "PLEASE FILE A RADAR - Requested out of bounds slot index - requestedSlot: %d, requestedDate: %@, size of pre dicted proportions array: %lu",  buf,  0x1Cu);
        }

        double v20 = 1.0 / (double)dword_1001574F4;
      }
    }

    goto LABEL_42;
  }

  id v9 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastPredictionUpdateForWidgets,  "objectForKeyedSubscript:",  v7));
  int v10 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:](self, "computeSlotForDate:relativeToDate:", v6, v9);
  if (v10 > 23)
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v68 = v7;
      *(_WORD *)&v68[8] = 2112;
      *(void *)&v68[10] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Cached budget allocation prediction for widget %@ too old, start at %@",  buf,  0x16u);
    }

    goto LABEL_6;
  }

  int v16 = v10;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_predictedBudgetsForWidgets,  "objectForKeyedSubscript:",  v7));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:v16]);
  [v18 doubleValue];
  double v20 = v19;

  int v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)uint64_t v68 = v7;
    *(_WORD *)&v68[8] = 2112;
    *(void *)&v68[10] = v9;
    *(_WORD *)&v68[18] = 2048;
    *(double *)&v68[20] = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Cached budget allocation prediction for widget %@ available from %@ : budget proportion %f",  buf,  0x20u);
  }

- (id)usageTimelineForWidgetBudgetID:(id)a3 withStartDate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStringValue:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStringValue:",  a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  kDASWidgetViewStreamName));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:]( &OBJC_CLASS____DKPredictionQuery,  "predictionQueryForStream:withPredicate:withPredictionType:",  v8,  v7,  0LL));

  [v9 setAsOfDate:v6];
  [v9 setSlotDuration:dword_1001574F0];
  store = self->_store;
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStore executeQuery:error:](store, "executeQuery:error:", v9, &v15));
  id v12 = v15;
  log = self->_log;
  if (v12)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B1128((uint64_t)v9, (uint64_t)v12, log);
    }
  }

  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B10B4((uint64_t)v11, log);
  }

  return v11;
}

- (double)budgetProportionAtDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  -[_DASBudgetModulator gaussianKDEatDate:withTimeline:withNormalizer:]( self,  "gaussianKDEatDate:withTimeline:withNormalizer:",  v9,  v8,  a5);
  double v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:(double)dword_1001574F0]);

  -[_DASBudgetModulator gaussianKDEatDate:withTimeline:withNormalizer:]( self,  "gaussianKDEatDate:withTimeline:withNormalizer:",  v12,  v8,  a5);
  double v14 = v13;

  -[_DASBudgetModulator areaUnderTrapeziodWithFirstValue:andSecondValue:]( self,  "areaUnderTrapeziodWithFirstValue:andSecondValue:",  v11,  v14);
  return result;
}

- (double)gaussianKDEatDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 startDate]);
  unsigned int v11 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:](self, "computeSlotForDate:relativeToDate:", v8, v10);

  unsigned int v12 = dword_1001574F4;
  double v13 = 0.0;
  if (dword_1001574F4 >= 2)
  {
    signed int v14 = -(dword_1001574F4 >> 1);
    double v15 = 0.0;
    do
    {
      unsigned int v16 = (v11 + v14) % v12;
      unsigned int v17 = v11 + v12 + v14;
      double v18 = (double)(int)(dword_1001574F0 * v17);
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v9 startDate]);
      double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v19,  v18));

      int v21 = (void *)objc_claimAutoreleasedReturnValue([v9 valueAtDate:v20]);
      [v21 doubleValue];
      double v23 = v22 / a5;

      double v15 = v15 + v23 * pow(0.980198673, (double)(v14 * v14));
      ++v14;
      unsigned int v12 = dword_1001574F4;
    }

    while (v14 < (int)(dword_1001574F4 >> 1));
    double v13 = v15 * 0.0797884561;
  }

  return v13;
}

- (double)areaUnderTrapeziodWithFirstValue:(double)a3 andSecondValue:(double)a4
{
  if (a3 >= a4) {
    double v4 = a4;
  }
  else {
    double v4 = a3;
  }
  double v5 = a4 - a3;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5 * 0.5;
}

- (_DASBudgetPersisting)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastModulationDate
{
  return self->_lastModulationDate;
}

- (void)setLastModulationDate:(id)a3
{
}

- (NSDate)lastUsageTimelineUpdate
{
  return self->_lastUsageTimelineUpdate;
}

- (void)setLastUsageTimelineUpdate:(id)a3
{
}

- (NSArray)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (_DKKnowledgeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (_DKPredictionTimeline)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
}

- (NSDate)lastStartOfADayPeriodForBudgetAllocation
{
  return self->_lastStartOfADayPeriodForBudgetAllocation;
}

- (void)setLastStartOfADayPeriodForBudgetAllocation:(id)a3
{
}

- (NSMutableDictionary)lastPredictionUpdateForWidgets
{
  return self->_lastPredictionUpdateForWidgets;
}

- (void)setLastPredictionUpdateForWidgets:(id)a3
{
}

- (NSMutableDictionary)predictedBudgetsForWidgets
{
  return self->_predictedBudgetsForWidgets;
}

- (void)setPredictedBudgetsForWidgets:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end