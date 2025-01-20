@interface CPLDuetTicketProvider
+ (CPLDuetTicketProvider)sharedDuetTicketProvider;
- (BOOL)_BOOLValueForDuetKeyPath:(id)a3;
- (BOOL)hasSignificantWork;
- (BOOL)isBlocked;
- (CPLDuetTicketProvider)initWithClientBundlerIdentifier:(id)a3;
- (NSString)clientBundlerIdentifier;
- (id)_budgetOverrideKeyPath;
- (id)_isBlockedKeyPath;
- (id)_isUnBlockedKeyPath;
- (id)_significantWorkKeyPath;
- (id)duetStatuses;
- (unint64_t)_unBlockedReason;
- (unint64_t)significantWorkRetainCount;
- (void)_setupCallbacks;
- (void)addBudgetDelegate:(id)a3;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)overrideHasSignificantWork:(BOOL)a3;
- (void)popSignificantWorkIsPending;
- (void)pushSignificantWorkIsPending;
- (void)removeBudgetDelegate:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)setSignificantWorkRetainCount:(unint64_t)a3;
@end

@implementation CPLDuetTicketProvider

+ (CPLDuetTicketProvider)sharedDuetTicketProvider
{
  if (qword_100296318 != -1) {
    dispatch_once(&qword_100296318, &stru_100241048);
  }
  return (CPLDuetTicketProvider *)(id)qword_100296310;
}

- (CPLDuetTicketProvider)initWithClientBundlerIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLDuetTicketProvider;
  v5 = -[CPLDuetTicketProvider init](&v15, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.cloudkit.duet", 0LL);
    duetQueue = v5->_duetQueue;
    v5->_duetQueue = (OS_dispatch_queue *)v6;

    v8 = (NSString *)[v4 copy];
    clientBundlerIdentifier = v5->_clientBundlerIdentifier;
    v5->_clientBundlerIdentifier = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    budgetDelegates = v5->_budgetDelegates;
    v5->_budgetDelegates = v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    duetOverrideContext = v5->_duetOverrideContext;
    v5->_duetOverrideContext = (_CDClientContext *)v12;
  }

  return v5;
}

- (void)addBudgetDelegate:(id)a3
{
}

- (void)removeBudgetDelegate:(id)a3
{
}

- (void)pushSignificantWorkIsPending
{
  duetQueue = self->_duetQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100071BB4;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072DC4;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = duetQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)popSignificantWorkIsPending
{
  duetQueue = self->_duetQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100071C78;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072DC4;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = duetQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  duetQueue = self->_duetQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100071D64;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  dispatch_queue_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072DC4;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  v7 = duetQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (BOOL)_BOOLValueForDuetKeyPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_CDClientContext objectForKeyedSubscript:]( self->_duetOverrideContext,  "objectForKeyedSubscript:",  a3));
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)_unBlockedReason
{
  duetOverrideContext = self->_duetOverrideContext;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _isUnBlockedKeyPath](self, "_isUnBlockedKeyPath"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDClientContext objectForKeyedSubscript:](duetOverrideContext, "objectForKeyedSubscript:", v3));
  id v5 = [v4 integerValue];

  return (unint64_t)v5;
}

- (id)duetStatuses
{
  unsigned __int8 v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSString isEqualToString:](self->_clientBundlerIdentifier, "isEqualToString:", @"com.apple.TVPhotos"))
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSString);
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _significantWorkKeyPath](self, "_significantWorkKeyPath"));
    unsigned int v7 = -[CPLDuetTicketProvider hasSignificantWork](self, "hasSignificantWork");
    id v8 = @"NO";
    dispatch_block_t v9 = @"YES";
    if (!v7) {
      dispatch_block_t v9 = @"NO";
    }
    v10 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@ = %@", v6, v9);
    -[NSMutableArray addObject:](v4, "addObject:", v10);

    id v11 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _isBlockedKeyPath](self, "_isBlockedKeyPath"));
    unsigned int v13 = -[CPLDuetTicketProvider isBlocked](self, "isBlocked");
    if (v13)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _blockedReasonStatus](self, "_blockedReasonStatus"));
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"YES %@",  v2));
    }

    v14 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@ = %@", v12, v8);
    -[NSMutableArray addObject:](v4, "addObject:", v14);

    if (v13)
    {
    }

    duetOverrideContext = self->_duetOverrideContext;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _budgetOverrideKeyPath](self, "_budgetOverrideKeyPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_CDClientContext objectForKeyedSubscript:](duetOverrideContext, "objectForKeyedSubscript:", v16));

    if (v17 && [v17 integerValue])
    {
      v18 = objc_alloc(&OBJC_CLASS___NSString);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineSystemMonitor descriptionForBudgets:]( CPLEngineSystemMonitor,  "descriptionForBudgets:",  [v17 integerValue]));
      v20 = -[NSString initWithFormat:](v18, "initWithFormat:", @"%@ (%@)", v19, v17);
    }

    else
    {
      v20 = @"none";
    }

    v21 = objc_alloc(&OBJC_CLASS___NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _budgetOverrideKeyPath](self, "_budgetOverrideKeyPath"));
    v23 = -[NSString initWithFormat:](v21, "initWithFormat:", @"%@ = %@", v22, v20);
    -[NSMutableArray addObject:](v4, "addObject:", v23);
  }

  return v4;
}

- (id)_budgetOverrideKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/budgetOverride");
}

- (id)_isBlockedKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/isBlocked");
}

- (id)_isUnBlockedKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/isUnBlocked");
}

- (id)_significantWorkKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/significantWork");
}

- (void)_setupCallbacks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _isBlockedKeyPath](self, "_isBlockedKeyPath"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v3));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100072840;
  v7[3] = &unk_10023E630;
  v7[4] = self;
  id v5 = objc_retainBlock(v7);
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.photos.isBlockedRegistration",  v4,  v5));
  -[_CDClientContext registerCallback:](self->_duetOverrideContext, "registerCallback:", v6);
}

- (BOOL)isBlocked
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _isBlockedKeyPath](self, "_isBlockedKeyPath"));
  LOBYTE(v2) = -[CPLDuetTicketProvider _BOOLValueForDuetKeyPath:](v2, "_BOOLValueForDuetKeyPath:", v3);

  return (char)v2;
}

- (BOOL)hasSignificantWork
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _significantWorkKeyPath](self, "_significantWorkKeyPath"));
  LOBYTE(v2) = -[CPLDuetTicketProvider _BOOLValueForDuetKeyPath:](v2, "_BOOLValueForDuetKeyPath:", v3);

  return (char)v2;
}

- (void)overrideHasSignificantWork:(BOOL)a3
{
  unint64_t significantWorkRetainCount = self->_significantWorkRetainCount;
  if (a3)
  {
    if (!significantWorkRetainCount)
    {
      duetOverrideContext = self->_duetOverrideContext;
      dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _significantWorkKeyPath](self, "_significantWorkKeyPath"));
      -[_CDClientContext setObject:forKeyedSubscript:]( duetOverrideContext,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v6);

      unint64_t significantWorkRetainCount = self->_significantWorkRetainCount;
    }

    self->_unint64_t significantWorkRetainCount = significantWorkRetainCount + 1;
  }

  else if (significantWorkRetainCount)
  {
    unint64_t v7 = significantWorkRetainCount - 1;
    self->_unint64_t significantWorkRetainCount = v7;
    if (!v7)
    {
      id v8 = self->_duetOverrideContext;
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _significantWorkKeyPath](self, "_significantWorkKeyPath"));
      -[_CDClientContext setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v9);
    }
  }

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  duetOverrideContext = self->_duetOverrideContext;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _budgetOverrideKeyPath](self, "_budgetOverrideKeyPath"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDClientContext objectForKeyedSubscript:](duetOverrideContext, "objectForKeyedSubscript:", v8));
  unint64_t v10 = (unint64_t)[v9 unsignedIntegerValue];

  if (v5) {
    unint64_t v11 = v10 | a4;
  }
  else {
    unint64_t v11 = v10 & ~a4;
  }
  if (v11 == v10)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000729B4();
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineSystemMonitor descriptionForBudgets:]( &OBJC_CLASS___CPLEngineSystemMonitor,  "descriptionForBudgets:",  v10));
        int v22 = 138412290;
        v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Overriding system budgets is kept at %@",  (uint8_t *)&v22,  0xCu);
      }
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v15 = sub_1000729B4();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineSystemMonitor descriptionForBudgets:]( &OBJC_CLASS___CPLEngineSystemMonitor,  "descriptionForBudgets:",  v10));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineSystemMonitor descriptionForBudgets:]( &OBJC_CLASS___CPLEngineSystemMonitor,  "descriptionForBudgets:",  v11));
        int v22 = 138412546;
        v23 = v17;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Overriding system budgets changed from (%@) to (%@)",  (uint8_t *)&v22,  0x16u);
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
    v20 = self->_duetOverrideContext;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDuetTicketProvider _budgetOverrideKeyPath](self, "_budgetOverrideKeyPath"));
    -[_CDClientContext setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

    -[NSMutableSet enumerateObjectsUsingBlock:](self->_budgetDelegates, "enumerateObjectsUsingBlock:", &stru_1002410A8);
  }

- (NSString)clientBundlerIdentifier
{
  return self->_clientBundlerIdentifier;
}

- (unint64_t)significantWorkRetainCount
{
  return self->_significantWorkRetainCount;
}

- (void)setSignificantWorkRetainCount:(unint64_t)a3
{
  self->_unint64_t significantWorkRetainCount = a3;
}

- (void).cxx_destruct
{
}

@end