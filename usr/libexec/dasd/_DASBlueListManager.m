@interface _DASBlueListManager
+ (id)managerWithContext:(id)a3;
+ (int64_t)nextHoursBudgetWithPreviousBudget:(int64_t)a3;
- (BOOL)blueListEnabled;
- (BOOL)shouldBlueListPushes;
- (OS_dispatch_source)budgetResetTimer;
- (_CDContextualKeyPath)blueListKeyPath;
- (_CDContextualKeyPath)pushBudgetKeyPath;
- (_CDContextualKeyPath)pushBudgetResetKeyPath;
- (_CDLocalContext)context;
- (_DASBlueListManager)initWithContext:(id)a3;
- (int)lpmNotifyToken;
- (int64_t)pushBudget;
- (void)decrementPushBudgetRemaining;
- (void)registerForBlueListNotifications;
- (void)setBlueListEnabled:(BOOL)a3;
- (void)setBlueListKeyPath:(id)a3;
- (void)setBudgetResetTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setLpmNotifyToken:(int)a3;
- (void)setPushBudget:(int64_t)a3;
- (void)setPushBudgetKeyPath:(id)a3;
- (void)setPushBudgetResetKeyPath:(id)a3;
- (void)setupResetTimer;
- (void)updateBlueListStatus:(BOOL)a3;
- (void)updateBudgetsForNextSlot;
- (void)updateGlobalBudget:(int64_t)a3;
@end

@implementation _DASBlueListManager

+ (int64_t)nextHoursBudgetWithPreviousBudget:(int64_t)a3
{
  double v3 = (double)(a3 + 64);
  if (v3 > 96.0) {
    return (uint64_t)96.0;
  }
  return (uint64_t)v3;
}

+ (id)managerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (_DASBlueListManager)initWithContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____DASBlueListManager;
  v6 = -[_DASBlueListManager init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/push/bluelist"));
    blueListKeyPath = v7->_blueListKeyPath;
    v7->_blueListKeyPath = (_CDContextualKeyPath *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/push/globalBudget"));
    pushBudgetKeyPath = v7->_pushBudgetKeyPath;
    v7->_pushBudgetKeyPath = (_CDContextualKeyPath *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/push/globalBudgetResetDate"));
    pushBudgetResetKeyPath = v7->_pushBudgetResetKeyPath;
    v7->_pushBudgetResetKeyPath = (_CDContextualKeyPath *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[_CDLocalContext objectForKeyedSubscript:]( v7->_context,  "objectForKeyedSubscript:",  v7->_blueListKeyPath));
    v7->_blueListEnabled = [v14 BOOLValue];

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[_CDLocalContext objectForKeyedSubscript:]( v7->_context,  "objectForKeyedSubscript:",  v7->_pushBudgetKeyPath));
    v16 = v15;
    if (v15) {
      v7->_pushBudget = (int64_t)[v15 integerValue];
    }
    else {
      -[_DASBlueListManager updateGlobalBudget:](v7, "updateGlobalBudget:", 64LL);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[_CDLocalContext objectForKeyedSubscript:]( v7->_context,  "objectForKeyedSubscript:",  v7->_pushBudgetResetKeyPath));
    v19 = v18;
    if (v18 && ([v18 timeIntervalSinceDate:v17], v20 >= 0.0))
    {
      v21 = v19;
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v17,  3600.0));

      -[_CDLocalContext setObject:forKeyedSubscript:]( v7->_context,  "setObject:forKeyedSubscript:",  v21,  v7->_pushBudgetResetKeyPath);
      if (v16) {
        -[_DASBlueListManager updateBudgetsForNextSlot](v7, "updateBudgetsForNextSlot");
      }
    }

    -[_DASBlueListManager registerForBlueListNotifications](v7, "registerForBlueListNotifications");
    -[_DASBlueListManager setupResetTimer](v7, "setupResetTimer");
  }

  return v7;
}

- (void)updateGlobalBudget:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_pushBudget = a3 & ~(a3 >> 63);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  -[_CDLocalContext setObject:forKeyedSubscript:]( obj->_context,  "setObject:forKeyedSubscript:",  v4,  obj->_pushBudgetKeyPath);

  -[_DASBlueListManager updateBlueListStatus:]( obj,  "updateBlueListStatus:",  -[_DASBlueListManager shouldBlueListPushes](obj, "shouldBlueListPushes"));
  objc_sync_exit(obj);
}

- (void)updateBudgetsForNextSlot
{
}

- (void)decrementPushBudgetRemaining
{
  obj = self;
  objc_sync_enter(obj);
  -[_DASBlueListManager updateGlobalBudget:](obj, "updateGlobalBudget:", obj->_pushBudget - 1);
  objc_sync_exit(obj);
}

- (void)setupResetTimer
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  budgetResetTimer = self->_budgetResetTimer;
  self->_budgetResetTimer = v5;

  v7 = self->_budgetResetTimer;
  dispatch_time_t v8 = dispatch_walltime(0LL, 3600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0x34630B8A000uLL, 0x174876E800uLL);
  v9 = self->_budgetResetTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100065038;
  handler[3] = &unk_1001150D0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  dispatch_resume((dispatch_object_t)self->_budgetResetTimer);
}

- (void)updateBlueListStatus:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_blueListEnabled != v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    -[_CDLocalContext setObject:forKeyedSubscript:]( obj->_context,  "setObject:forKeyedSubscript:",  v5,  obj->_blueListKeyPath);

    id v4 = obj;
    obj->_blueListEnabled = v3;
  }

  objc_sync_exit(v4);
}

- (BOOL)shouldBlueListPushes
{
  context = self->_context;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForThermalPressureLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForThermalPressureLevel"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  int v6 = [v5 intValue];

  if (v6 > 20 || self->_pushBudget < 1) {
    return 1;
  }
  v9 = self->_context;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  int v12 = [v11 intValue];

  v13 = self->_context;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForWiFiConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForWiFiConnectionQuality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));

  v16 = self->_context;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForWiredConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForWiredConnectionQuality"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));

  v19 = self->_context;
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCellConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForCellConnectionQuality"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20));

  BOOL v22 = (uint64_t)[v15 integerValue] <= 49
     && (uint64_t)[v18 integerValue] <= 49
     && (uint64_t)[v21 integerValue] < 100;
  BOOL v7 = v12 < 21 || v22;

  return v7;
}

- (void)registerForBlueListNotifications
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForThermalPressureLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForThermalPressureLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForWiFiConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForWiFiConnectionQuality"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForWiredConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForWiredConnectionQuality"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCellConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForCellConnectionQuality"));
  v24 = (void *)v3;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:withFormat:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:withFormat:",  v3,  @"self.%@.value > %@",  v3,  &off_100121F00));
  objc_super v23 = (void *)v4;
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:withFormat:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:withFormat:",  v4,  @"self.%@.value < %@",  v4,  &off_100121F18));
  BOOL v22 = (void *)v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:withFormat:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:withFormat:",  v5,  @"self.%@.value < %@",  v5,  &off_100121F18));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:withFormat:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:withFormat:",  v6,  @"self.%@.value < %@",  v6,  &off_100121F30));
  v27[0] = v21;
  v27[1] = v20;
  v27[2] = v19;
  v27[3] = v18;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL));
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS____CDContextualPredicate,  "andPredicateWithSubpredicates:",  v7));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100065650;
  v26[3] = &unk_1001153B0;
  v26[4] = self;
  v9 = objc_retainBlock(v26);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.dasd.blueListEnable",  v8,  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS____CDContextualPredicate,  "notPredicateWithSubpredicate:",  v8));
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.dasd.blueListEnable",  v11,  v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v17));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.dasd.blueListPlugin",  v13,  v9));

  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v10);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v12);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v14);
  -[_DASBlueListManager updateBlueListStatus:]( self,  "updateBlueListStatus:",  -[_DASBlueListManager shouldBlueListPushes](self, "shouldBlueListPushes"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100065768;
  handler[3] = &unk_100115388;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.lowpowermode", &self->_lpmNotifyToken, v16, handler);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualKeyPath)blueListKeyPath
{
  return self->_blueListKeyPath;
}

- (void)setBlueListKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pushBudgetKeyPath
{
  return self->_pushBudgetKeyPath;
}

- (void)setPushBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pushBudgetResetKeyPath
{
  return self->_pushBudgetResetKeyPath;
}

- (void)setPushBudgetResetKeyPath:(id)a3
{
}

- (int64_t)pushBudget
{
  return self->_pushBudget;
}

- (void)setPushBudget:(int64_t)a3
{
  self->_pushBudget = a3;
}

- (OS_dispatch_source)budgetResetTimer
{
  return self->_budgetResetTimer;
}

- (void)setBudgetResetTimer:(id)a3
{
}

- (BOOL)blueListEnabled
{
  return self->_blueListEnabled;
}

- (void)setBlueListEnabled:(BOOL)a3
{
  self->_blueListEnabled = a3;
}

- (int)lpmNotifyToken
{
  return self->_lpmNotifyToken;
}

- (void)setLpmNotifyToken:(int)a3
{
  self->_lpmNotifyToken = a3;
}

- (void).cxx_destruct
{
}

@end