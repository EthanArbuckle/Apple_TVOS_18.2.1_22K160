@interface DMDActivationPredicateObserverManager
- (BOOL)alarms;
- (DMDActivationPredicateObserverManager)init;
- (DMDActivationPredicateObserverManagerDelegate)delegate;
- (NSArray)notifyMatchingNotifications;
- (NSMutableDictionary)activationPredicateObserversByIdentifier;
- (id)_predicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4;
- (id)_subPredicateObserversForCompoundSubPredicates:(id)a3 withUniqueIdentifier:(id)a4;
- (id)activationPredicateObserverForIdentifier:(id)a3;
- (id)addActivationPredicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4;
- (void)_reportChangeToObserver:(id)a3;
- (void)_updateAllActivationPredicateObserverRegistrations;
- (void)handleAlarmWithIdentifier:(id)a3;
- (void)handleNotifyMatchingNotificationWithName:(id)a3;
- (void)removeActivationPredicateObserverWithUniqueIdentifier:(id)a3;
- (void)setActivationPredicateObserversByIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DMDActivationPredicateObserverManager

- (DMDActivationPredicateObserverManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateObserverManager;
  v5 = -[DMDActivationPredicateObserverManager init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v2, v3, v4);
    activationPredicateObserversByIdentifier = v5->_activationPredicateObserversByIdentifier;
    v5->_activationPredicateObserversByIdentifier = (NSMutableDictionary *)v6;
  }

  return v5;
}

- (id)addActivationPredicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v8);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (!v10)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:]( self,  "_predicateObserverForPredicate:withUniqueIdentifier:",  v6,  v7));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
      [v11 setObject:v10 forKeyedSubscript:v7];
    }
  }

  objc_sync_exit(v8);

  return v10;
}

- (void)removeActivationPredicateObserverWithUniqueIdentifier:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);

  [v6 invalidate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  [v7 setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (id)activationPredicateObserverForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (void)_reportChangeToObserver:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v5,  "activationPredicateObserverManager:didObserveChangeForPredicateWithIdentifier:") & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B9FC;
    block[3] = &unk_10009D848;
    id v7 = v5;
    id v8 = self;
    id v9 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_updateAllActivationPredicateObserverRegistrations
{
  id obj = (id)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  objc_sync_enter(obj);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier]( self,  "activationPredicateObserversByIdentifier"));
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_10009D888];

  objc_sync_exit(obj);
}

- (id)_predicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CEMPredicateBudget);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___CEMPredicateCompositeBudget);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v9 = -[DMDActivationBudgetObserver initWithDelegate:uniqueIdentifier:compositeBudgetPredicate:]( objc_alloc(&OBJC_CLASS___DMDActivationBudgetObserver),  "initWithDelegate:uniqueIdentifier:compositeBudgetPredicate:",  self,  v7,  v6);
      goto LABEL_16;
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___CEMPredicateWeeklyTimeRange);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      id v9 = -[DMDActivationCurfewObserver initWithDelegate:uniqueIdentifier:curfewPredicate:]( objc_alloc(&OBJC_CLASS___DMDActivationCurfewObserver),  "initWithDelegate:uniqueIdentifier:curfewPredicate:",  self,  v7,  v6);
      goto LABEL_16;
    }

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___CEMPredicateOneTime);
    if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    {
      id v9 = -[DMDActivationOneTimeObserver initWithDelegate:uniqueIdentifier:oneTimePredicate:]( objc_alloc(&OBJC_CLASS___DMDActivationOneTimeObserver),  "initWithDelegate:uniqueIdentifier:oneTimePredicate:",  self,  v7,  v6);
      goto LABEL_16;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___CEMPredicateiCloudAccount);
    if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
    {
      id v9 = -[DMDActivationiCloudAccountObserver initWithDelegate:uniqueIdentifier:iCloudAccountPredicate:]( objc_alloc(&OBJC_CLASS___DMDActivationiCloudAccountObserver),  "initWithDelegate:uniqueIdentifier:iCloudAccountPredicate:",  self,  v7,  v6);
      goto LABEL_16;
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___CEMPredicateTrue);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      v15 = &OBJC_CLASS___DMDActivationPredicateTrue;
LABEL_15:
      id v9 = (DMDActivationBudgetObserver *)[[v15 alloc] initWithDelegate:self uniqueIdentifier:v7 predicate:v6];
      goto LABEL_16;
    }

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___CEMPredicateFalse);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
    {
      v15 = &OBJC_CLASS___DMDActivationPredicateFalse;
      goto LABEL_15;
    }

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___CEMPredicateNot);
    if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0)
    {
      id v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadPredicate]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:]( self,  "_predicateObserverForPredicate:withUniqueIdentifier:",  v21,  v7));

      if (v22)
      {
        v23 = -[DMDActivationPredicateNot initWithDelegate:uniqueIdentifier:subPredicateObserver:predicate:]( objc_alloc(&OBJC_CLASS___DMDActivationPredicateNot),  "initWithDelegate:uniqueIdentifier:subPredicateObserver:predicate:",  self,  v7,  v22,  v20);
LABEL_28:
        v17 = v23;
LABEL_30:

        goto LABEL_17;
      }

- (id)_subPredicateObserversForCompoundSubPredicates:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = 1LL;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld",  v7,  (char *)v12 + v11));
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:]( self,  "_predicateObserverForPredicate:withUniqueIdentifier:",  v13,  v14));
        if (v15) {
          -[NSMutableArray addObject:](v19, "addObject:", v15);
        }

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v11 += (uint64_t)v12;
    }

    while (v9);
  }

  id v16 = -[NSMutableArray copy](v19, "copy");
  return v16;
}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  v3[0] = @"com.apple.dmd.budget.didChange";
  v3[1] = @"SignificantTimeChangeNotification";
  v3[2] = DMFiCloudAccountDidChangeDarwinNotification;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMFConfigurationEngineLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling alarm with identifier: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager activationPredicateObserverForIdentifier:]( self,  "activationPredicateObserverForIdentifier:",  v4));
  id v8 = v7;
  if (v7)
  {
    [v7 updateObserverRegistration];
    id v9 = self;
    uint64_t v10 = v8;
  }

  else
  {
    -[DMDActivationPredicateObserverManager _updateAllActivationPredicateObserverRegistrations]( self,  "_updateAllActivationPredicateObserverRegistrations");
    id v9 = self;
    uint64_t v10 = 0LL;
  }

  -[DMDActivationPredicateObserverManager _reportChangeToObserver:](v9, "_reportChangeToObserver:", v10);
}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMFConfigurationEngineLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling notify matching notification with name: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  if (([v4 isEqualToString:@"com.apple.dmd.budget.didChange"] & 1) != 0
    || ([v4 isEqualToString:@"SignificantTimeChangeNotification"] & 1) != 0
    || [v4 isEqualToString:DMFiCloudAccountDidChangeDarwinNotification])
  {
    -[DMDActivationPredicateObserverManager _updateAllActivationPredicateObserverRegistrations]( self,  "_updateAllActivationPredicateObserverRegistrations");
    -[DMDActivationPredicateObserverManager _reportChangeToObserver:](self, "_reportChangeToObserver:", 0LL);
  }
}

- (DMDActivationPredicateObserverManagerDelegate)delegate
{
  return (DMDActivationPredicateObserverManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)activationPredicateObserversByIdentifier
{
  return self->_activationPredicateObserversByIdentifier;
}

- (void)setActivationPredicateObserversByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end