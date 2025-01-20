@interface _DASSystemBudgetManager
+ (id)identifierWithActivity:(id)a3;
+ (id)involvedProcessesForActivity:(id)a3 withIdentifier:(id)a4;
+ (id)sharedInstance;
- (NSDictionary)budgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBudgetModulator)systemBudgetModulator;
- (_DASBudgetPersisting)sharedMemoryPersistence;
- (_DASEnergyUsageTracker)energyUsageTracker;
- (_DASNetworkUsageTracker)networkUsageTracker;
- (_DASSystemBudgetManager)init;
- (double)balanceForBudgetWithName:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)budgetKeyPathForBudgetName:(id)a3;
- (id)dataBudgetForActivity:(id)a3;
- (id)defaultSystemCellularBudget;
- (id)defaultSystemEnergyBudget;
- (id)getMissingBudgetsWithExistingBudgets:(id)a3;
- (id)requiredBudgetNames;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)instantiateConfiguredBudgets;
- (void)onBudgetChange:(id)a3;
- (void)postNotificationWithBudget:(id)a3;
- (void)reportMetricsForNetworkUsage:(double)a3 forDataBudget:(id)a4 totalUsage:(double)a5 usageInCell:(double)a6 usageInInexpensive:(double)a7 forActivity:(id)a8;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBudgets:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setEnergyUsageTracker:(id)a3;
- (void)setLog:(id)a3;
- (void)setNetworkUsageTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSharedMemoryPersistence:(id)a3;
- (void)setSystemBudgetModulator:(id)a3;
- (void)unlocked_instantiateConfiguredBudgets;
- (void)updateBudget:(id)a3;
- (void)updateContextStore:(id)a3;
@end

@implementation _DASSystemBudgetManager

- (_DASSystemBudgetManager)init
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS____DASSystemBudgetManager;
  v2 = -[_DASSystemBudgetManager init](&v36, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "systemBudgetManager");
    log = v2->_log;
    v2->_log = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.dasd.systemBudgetManagement", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_DASSharedMemoryBudgetPersistence persistence]( &OBJC_CLASS____DASSharedMemoryBudgetPersistence,  "persistence"));
    sharedMemoryPersistence = v2->_sharedMemoryPersistence;
    v2->_sharedMemoryPersistence = (_DASBudgetPersisting *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[_DASNetworkUsageTracker sharedInstance](&OBJC_CLASS____DASNetworkUsageTracker, "sharedInstance"));
    networkUsageTracker = v2->_networkUsageTracker;
    v2->_networkUsageTracker = (_DASNetworkUsageTracker *)v13;

    -[_DASSystemBudgetManager instantiateConfiguredBudgets](v2, "instantiateConfiguredBudgets");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10002AE30;
    v34[3] = &unk_1001157F8;
    v15 = v2;
    v35 = v15;
    v16 = objc_retainBlock(v34);
    budgets = v15->_budgets;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10002AE3C;
    v32[3] = &unk_100115820;
    id v33 = v16;
    v18 = v16;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](budgets, "enumerateKeysAndObjectsUsingBlock:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v15->_budgets, "allValues"));
    v20 = v2->_sharedMemoryPersistence;
    v21 = v2->_queue;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[_DASBudgetModulator modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:]( &OBJC_CLASS____DASBudgetModulator,  "modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:",  @"System",  v19,  v20,  v21,  v22));
    systemBudgetModulator = v15->_systemBudgetModulator;
    v15->_systemBudgetModulator = (_DASBudgetModulator *)v23;

    -[_DASNetworkUsageTracker setModulator:](v2->_networkUsageTracker, "setModulator:", v15->_systemBudgetModulator);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v15->_budgets, "allValues"));
    -[_DASSystemBudgetManager updateContextStore:](v15, "updateContextStore:", v25);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10002AE4C;
    v29[3] = &unk_100115388;
    v30 = v15;
    notify_register_dispatch("com.apple.dasd.budgetnotifications", &out_token, v27, v29);
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AF54;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157648 != -1) {
    dispatch_once(&qword_100157648, block);
  }
  return (id)qword_100157650;
}

- (id)defaultSystemEnergyBudget
{
  if (qword_100157658 != -1) {
    dispatch_once(&qword_100157658, &stru_100115840);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:]( &OBJC_CLASS____DASBudget,  "budgetWithName:capacity:allocationType:lastModulatedDate:",  @"com.apple.dasd.systemEnergy",  2LL,  v2,  200.0));

  return v3;
}

- (id)defaultSystemCellularBudget
{
  if (qword_100157660 != -1) {
    dispatch_once(&qword_100157660, &stru_100115860);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:]( &OBJC_CLASS____DASBudget,  "budgetWithName:capacity:allocationType:lastModulatedDate:",  @"com.apple.dasd.systemCellular",  1LL,  v2,  52428800.0));

  return v3;
}

- (id)dataBudgetForActivity:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientDataBudgetName]);

  budgets = self->_budgets;
  if (v5)
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientDataBudgetName]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](budgets, "objectForKeyedSubscript:", v7));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( budgets,  "objectForKeyedSubscript:",  @"com.apple.dasd.systemCellular"));
  }

  return v8;
}

- (void)instantiateConfiguredBudgets
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B184;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)unlocked_instantiateConfiguredBudgets
{
  sharedMemoryPersistence = self->_sharedMemoryPersistence;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager requiredBudgetNames](self, "requiredBudgetNames"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[_DASBudgetPersisting loadBudgetsWithExpectedNames:]( sharedMemoryPersistence,  "loadBudgetsWithExpectedNames:",  v4));

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v5);
  id v7 = -[NSMutableArray count](v6, "count");
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    v10 = "Found stored budgets: %@";
    uint64_t v11 = log;
    uint32_t v12 = 12;
  }

  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v10 = "No stored budgets";
    uint64_t v11 = log;
    uint32_t v12 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASSystemBudgetManager getMissingBudgetsWithExistingBudgets:]( self,  "getMissingBudgetsWithExistingBudgets:",  v6));
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v13);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v15 = v6;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name", (void)v26));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v20, v21);
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    }

    while (v17);
  }

  v22 = (NSDictionary *)-[NSMutableDictionary copy](v14, "copy");
  budgets = self->_budgets;
  self->_budgets = v22;

  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_budgets;
    *(_DWORD *)buf = 138412290;
    v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Loaded + new Budgets: %@", buf, 0xCu);
  }
}

- (id)requiredBudgetNames
{
  return +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"com.apple.dasd.systemEnergy",  @"com.apple.dasd.systemCellular",  0LL);
}

- (id)getMissingBudgetsWithExistingBudgets:(id)a3
{
  id v4 = a3;
  context = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager requiredBudgetNames](self, "requiredBudgetNames"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);

        if (v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
          [v6 removeObject:v13];
        }

        else
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Skipping adding stored budget without a name",  buf,  2u);
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    }

    while (v8);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v29;
    while (1)
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
        if ([v21 isEqualToString:@"com.apple.dasd.systemEnergy"])
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager defaultSystemEnergyBudget](self, "defaultSystemEnergyBudget"));
        }

        else
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager defaultSystemCellularBudget](self, "defaultSystemCellularBudget"));
        }

        uint64_t v23 = (void *)v22;

        uint64_t v18 = v23;
LABEL_22:
        [v5 setObject:v18 forKeyedSubscript:v21];
        v24 = self->_log;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Added missing budget: %@", buf, 0xCu);
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (!v17) {
        goto LABEL_28;
      }
    }
  }

  uint64_t v18 = 0LL;
LABEL_28:

  objc_autoreleasePoolPop(context);
  return v5;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  return 0LL;
}

- (void)postNotificationWithBudget:(id)a3
{
  id v20 = a3;
  [v20 balance];
  double v4 = v3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
  unsigned int v6 = [v5 isEqualToString:@"com.apple.dasd.systemEnergy"];

  if (v6)
  {
    id v7 = @"Negative";
    if (v4 > 0.0) {
      id v7 = @"Positive";
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Energy Budget is %@",  v7));
    [v20 balance];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exact budget value is %.0lf",  v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](&OBJC_CLASS____DASNotificationManager, "sharedManager"));
    uint32_t v12 = v11;
    uint64_t v13 = v8;
    v14 = v10;
    id v15 = 0LL;
LABEL_9:
    [v11 postNotificationAtDate:0 withTitle:v13 withTextContent:v14 icon:v15 url:0 expirationDate:0];

    goto LABEL_10;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
  unsigned int v17 = [v16 isEqualToString:@"com.apple.dasd.systemCellular"];

  if (v17)
  {
    uint64_t v18 = @"Negative";
    if (v4 > 0.0) {
      uint64_t v18 = @"Positive";
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Data Budget is %@",  v18));
    [v20 balance];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exact budget value is %.1lfMB",  v19 * 0.000000953674316));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](&OBJC_CLASS____DASNotificationManager, "sharedManager"));
    uint32_t v12 = v11;
    id v15 = @"network";
    uint64_t v13 = v8;
    v14 = v10;
    goto LABEL_9;
  }

- (void)onBudgetChange:(id)a3
{
  id v4 = a3;
  [v4 balance];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5 > 0.0));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = log;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v20 = 138412546;
    v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating budget status for %@ to %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned int v12 = [v11 isEqualToString:@"com.apple.dasd.systemEnergy"];

  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForEnergyBudgetRemainingStatus"));
LABEL_7:
    id v16 = (void *)v13;
LABEL_8:
    [v10 setObject:v6 forKeyedSubscript:v16];
    goto LABEL_9;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned int v15 = [v14 isEqualToString:@"com.apple.dasd.systemCellular"];

  if (v15)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus"));
    goto LABEL_7;
  }

  double v19 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager budgetKeyPathForBudgetName:](self, "budgetKeyPathForBudgetName:", v19));

  if (v16) {
    goto LABEL_8;
  }
LABEL_9:

  unsigned int v17 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  unsigned int v18 = -[NSUserDefaults BOOLForKey:](v17, "BOOLForKey:", @"postBudgetNotifications");

  if (v18) {
    -[_DASSystemBudgetManager postNotificationWithBudget:](self, "postNotificationWithBudget:", v4);
  }
}

- (void)updateContextStore:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[_DASSystemBudgetManager onBudgetChange:]( self,  "onBudgetChange:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

+ (id)involvedProcessesForActivity:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 involvedProcesses]);

  if ([v9 count]) {
    [v7 addObjectsFromArray:v9];
  }
  if ([v8 count]) {
    [v7 addObjectsFromArray:v8];
  }
  if (v5) {
    [v7 addObject:v5];
  }

  return v7;
}

+ (id)identifierWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 clientName]);
  if (([v5 isEqualToString:_DASClientNameBGST] & 1) != 0
    || [v3 delayedStart])
  {

LABEL_5:
    goto LABEL_6;
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kNWEndpointKey]);

  if (v11)
  {
    uint64_t v7 = @"nsurlsessiond";
    goto LABEL_18;
  }

- (id)allBudgets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  budgets = self->_budgets;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002BF38;
  v8[3] = &unk_100115498;
  id v9 = v3;
  id v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](budgets, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = [v5 copy];

  return v6;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a3));
  [v3 balance];
  double v5 = v4;

  return v5;
}

- (double)capacityForBudgetWithName:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a3));
  [v3 capacity];
  double v5 = v4;

  return v5;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Set Balance: %.2lf for %@",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", v6));
  id v9 = v8;
  if (v8)
  {
    [v8 setBalance:a3];
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v9);
  }
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Decrement budget by: %.2lf for %@",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", v6));
  id v9 = v8;
  if (v8)
  {
    [v8 decrementBy:a3];
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v9);
  }
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a4));
  if (v6)
  {
    id v7 = v6;
    [v6 setCapacity:a3];
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v7);
    id v6 = v7;
  }
}

- (void)updateBudget:(id)a3
{
}

- (void)reportMetricsForNetworkUsage:(double)a3 forDataBudget:(id)a4 totalUsage:(double)a5 usageInCell:(double)a6 usageInInexpensive:(double)a7 forActivity:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002C418;
  v15[3] = &unk_100115888;
  id v16 = a4;
  id v17 = a8;
  double v18 = a3;
  double v19 = a6;
  double v20 = a5;
  double v21 = a7;
  id v13 = v17;
  id v14 = v16;
  AnalyticsSendEventLazy(@"com.apple.dasd.advancedmetrics", v15);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (_DASBudgetModulator)systemBudgetModulator
{
  return self->_systemBudgetModulator;
}

- (void)setSystemBudgetModulator:(id)a3
{
}

- (_DASBudgetPersisting)sharedMemoryPersistence
{
  return self->_sharedMemoryPersistence;
}

- (void)setSharedMemoryPersistence:(id)a3
{
}

- (_DASNetworkUsageTracker)networkUsageTracker
{
  return self->_networkUsageTracker;
}

- (void)setNetworkUsageTracker:(id)a3
{
}

- (_DASEnergyUsageTracker)energyUsageTracker
{
  return self->_energyUsageTracker;
}

- (void)setEnergyUsageTracker:(id)a3
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