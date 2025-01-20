@interface PBSystemGestureManager
+ (PBDependencyDescription)dependencyDescription;
+ (PBSystemGestureManager)sharedInstance;
+ (id)_commandsForSystemGesture:(unint64_t)a3;
+ (id)_gestureRecognizerForDescriptor:(id)a3;
+ (unint64_t)_systemGestureForTestName:(id)a3;
- (BOOL)_prepareGestureRecognizerMatchingDescriptor:(id)a3;
- (BOOL)_prepareGestureRecognizersMatchingDescriptors:(id)a3;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BSInvalidatable)stateCaptureHandle;
- (PBSystemGestureArbiter)arbiter;
- (PBSystemGestureDeferringPolicy)deferringPolicy;
- (PBSystemGestureExpectation)testingExpectation;
- (PBSystemGestureKeychordAssistant)keychordAssistant;
- (PBSystemGestureManager)init;
- (PBSystemGestureManager)initWithSystemGestureRecognizerManager:(id)a3;
- (PBSystemGestureManager)initWithSystemGestureRecognizerManager:(id)a3 dataSource:(id)a4;
- (PBSystemGestureManagerDebugPublisher)debugPublisher;
- (PBSystemGestureRecipeDataSource)dataSource;
- (PBSystemGestureRecognizerManager)gestureRecognizerManager;
- (PBSystemGestureTable)table;
- (TVSObserverSet)observers;
- (id)_systemGestureRecipeForSystemGestureType:(unint64_t)a3;
- (id)_systemGestureRecipeProviderBlock;
- (id)addObserver:(id)a3;
- (id)expectSystemGesture:(unint64_t)a3 completion:(id)a4;
- (id)newHandleForSystemGesture:(unint64_t)a3 actionHandler:(id)a4;
- (id)stateDump;
- (id)windowForSystemGestures;
- (void)_cancelAllGestureRecognizers;
- (void)_notifyObserversDidDisableGestureRecognizerWithAllowedPressTypes:(id)a3;
- (void)_notifyObserversDidEnableGestureRecognizerWithAllowedPressTypes:(id)a3;
- (void)_setupAssistantStateDidChange;
- (void)_systemGestureRecognizerStateChanged:(id)a3;
- (void)activateHandle:(id)a3;
- (void)addSystemKeychordGestureWithPressTypes:(id)a3 minimumPressDuration:(double)a4 target:(id)a5 action:(SEL)a6;
- (void)cancelGestureRecognizersWithPressType:(int64_t)a3 forReason:(id)a4;
- (void)cancelSystemGesture:(unint64_t)a3;
- (void)deactivateHandle:(id)a3;
- (void)dealloc;
- (void)removeHandle:(id)a3 forSystemGestureRecipe:(id)a4 withReason:(id)a5;
- (void)setDebugPublisher:(id)a3;
- (void)setupAssistantDidFinish;
@end

@implementation PBSystemGestureManager

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(id)objc_opt_class(self) _systemGestureForTestName:v8];
  if (v9)
  {
    unint64_t v10 = (unint64_t)v9;
    id v11 = [(id)objc_opt_class(self) _commandsForSystemGesture:v9];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v12 count];
    BOOL v14 = v13 != 0LL;
    id v15 = sub_1000B464C(self);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[PPT] Starting test {test=%{public}@}",  buf,  0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObject:v18]);

      id v20 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10008D000;
      v34[3] = &unk_1003D2E78;
      v34[4] = self;
      id v21 = v8;
      id v35 = v21;
      id v22 = v7;
      id v36 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureManager expectSystemGesture:completion:]( self,  "expectSystemGesture:completion:",  v10,  v34));
      dispatch_time_t v24 = dispatch_time(0LL, 1000000000LL);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10008D0DC;
      v28[3] = &unk_1003D2888;
      id v29 = v22;
      id v30 = v21;
      id v31 = v20;
      id v12 = v19;
      id v32 = v12;
      id v33 = v23;
      id v25 = v23;
      v17 = (os_log_s *)v20;
      dispatch_after(v24, &_dispatch_main_q, v28);
    }

    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      sub_100278974((uint64_t)v8, v10, v17);
    }
  }

  else
  {
    id v26 = sub_1000B464C(self);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100278900((uint64_t)v8, (os_log_s *)v12);
    }
    BOOL v14 = 0;
  }

  return v14;
}

+ (unint64_t)_systemGestureForTestName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([&off_1003FED08 objectForKey:a3]);
  v4 = v3;
  if (v3) {
    id v5 = [v3 unsignedIntegerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

+ (id)_commandsForSystemGesture:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  if ((uint64_t)a3 > 28)
  {
    if (a3 == 29)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapButtonCommand button:longPress:]( &OBJC_CLASS___TVRecapButtonCommand,  "button:longPress:",  6LL,  1LL));
      unint64_t v10 = v5;
      v6 = &v10;
      goto LABEL_10;
    }

    if (a3 == 32)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapButtonCommand button:longPress:numberOfClicks:]( &OBJC_CLASS___TVRecapButtonCommand,  "button:longPress:numberOfClicks:",  6LL,  0LL,  2LL));
      id v9 = v5;
      v6 = &v9;
      goto LABEL_10;
    }
  }

  else
  {
    if (a3 == 5)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapButtonCommand button:longPress:]( &OBJC_CLASS___TVRecapButtonCommand,  "button:longPress:",  8LL,  1LL));
      id v11 = v5;
      v6 = &v11;
      goto LABEL_10;
    }

    if (a3 == 6)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 8LL));
      id v12 = v5;
      v6 = &v12;
LABEL_10:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 1LL));

      v4 = (void *)v7;
    }
  }

  return v4;
}

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000B41D8;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (PBSystemGestureManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4270;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004709B0 != -1) {
    dispatch_once(&qword_1004709B0, block);
  }
  return (PBSystemGestureManager *)(id)qword_1004709A8;
}

- (PBSystemGestureManager)initWithSystemGestureRecognizerManager:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___PBSystemGestureManager;
  id v9 = -[PBSystemGestureManager init](&v35, "init");
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gestureRecognizerManager, a3);
    id v11 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureTable);
    table = v10->_table;
    v10->_table = v11;

    id v13 = -[PBSystemGestureArbiter initWithSystemGestureTable:]( objc_alloc(&OBJC_CLASS___PBSystemGestureArbiter),  "initWithSystemGestureTable:",  v10->_table);
    arbiter = v10->_arbiter;
    v10->_arbiter = v13;

    objc_storeStrong((id *)&v10->_dataSource, a4);
    -[PBSystemGestureArbiter setSelectionMode:](v10->_arbiter, "setSelectionMode:", sub_1001C9BFC());
    id v15 = objc_alloc(&OBJC_CLASS___PBSystemGestureDefaultDeferringPolicy);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureManager _systemGestureRecipeProviderBlock]( v10,  "_systemGestureRecipeProviderBlock"));
    v17 = -[PBSystemGestureDefaultDeferringPolicy initWithRecipeProvider:](v15, "initWithRecipeProvider:", v16);
    deferringPolicy = v10->_deferringPolicy;
    v10->_deferringPolicy = (PBSystemGestureDeferringPolicy *)v17;

    v19 = -[PBSystemGestureKeychordAssistant initWithSystemGestureRecognizerManager:systemGestureManager:]( objc_alloc(&OBJC_CLASS___PBSystemGestureKeychordAssistant),  "initWithSystemGestureRecognizerManager:systemGestureManager:",  v10->_gestureRecognizerManager,  v10);
    keychordAssistant = v10->_keychordAssistant;
    v10->_keychordAssistant = v19;

    id v21 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v10->_observers;
    v10->_observers = v21;

    objc_initWeak(&location, v10);
    v23 = (objc_class *)objc_opt_class(v10);
    dispatch_time_t v24 = NSStringFromClass(v23);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%p)",  v25,  v10));

    v27 = &_dispatch_main_q;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000B44E8;
    v32[3] = &unk_1003D04B8;
    objc_copyWeak(&v33, &location);
    uint64_t v28 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v26, v32);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    stateCaptureHandle = v10->_stateCaptureHandle;
    v10->_stateCaptureHandle = (BSInvalidatable *)v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (PBSystemGestureManager)initWithSystemGestureRecognizerManager:(id)a3
{
  return -[PBSystemGestureManager initWithSystemGestureRecognizerManager:dataSource:]( self,  "initWithSystemGestureRecognizerManager:dataSource:",  a3,  0LL);
}

- (PBSystemGestureManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureRecognizerManager mainDisplayManager]( &OBJC_CLASS___PBSystemGestureRecognizerManager,  "mainDisplayManager"));
  v4 = -[PBSystemGestureManager initWithSystemGestureRecognizerManager:]( self,  "initWithSystemGestureRecognizerManager:",  v3);

  return v4;
}

- (void)dealloc
{
  v3 = self->_gestureRecognizerManager;
  table = self->_table;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B4630;
  v7[3] = &unk_1003D53F8;
  id v8 = v3;
  id v5 = v3;
  -[PBSystemGestureTable enumerateGestureRecognizersUsingBlock:](table, "enumerateGestureRecognizersUsingBlock:", v7);
  -[PBSystemGestureExpectation invalidate](self->_testingExpectation, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSystemGestureManager;
  -[PBSystemGestureManager dealloc](&v6, "dealloc");
}

- (id)newHandleForSystemGesture:(unint64_t)a3 actionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureManager _systemGestureRecipeForSystemGestureType:]( self,  "_systemGestureRecipeForSystemGestureType:",  a3));
  if (v7)
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/manager/new",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v22);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable existingHandleForSystemGestureRecipe:]( self->_table,  "existingHandleForSystemGestureRecipe:",  v7));
    unint64_t v10 = v9;
    if (v9 && [v9 invalidateWithReason:@"Replacement"] != (id)-1)
    {
      id v11 = sub_1000B464C(self);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_10027AEB8();
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 systemGestureRecognizerDescriptors]);
    unsigned __int8 v14 = -[PBSystemGestureManager _prepareGestureRecognizersMatchingDescriptors:]( self,  "_prepareGestureRecognizersMatchingDescriptors:",  v13);

    if ((v14 & 1) != 0)
    {
      id v15 = -[PBSystemGestureHandle initWithSystemGestureManager:recipe:actionHandler:]( objc_alloc(&OBJC_CLASS___PBSystemGestureHandle),  "initWithSystemGestureManager:recipe:actionHandler:",  self,  v7,  v6);
      -[PBSystemGestureTable setInactiveHandle:forSystemGestureRecipe:]( self->_table,  "setInactiveHandle:forSystemGestureRecipe:",  v15,  v7);
      id v16 = sub_1000B464C(self);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        dispatch_time_t v24 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Vending handle {handle=%{public}@}",  buf,  0xCu);
      }
    }

    else
    {
      id v20 = sub_1000B464C(self);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10027AE48();
      }
      id v15 = 0LL;
    }

    os_activity_scope_leave(&v22);
  }

  else
  {
    id v18 = sub_1000B464C(self);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_10027ADD8();
    }

    id v15 = 0LL;
  }

  return v15;
}

- (id)addObserver:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3));
}

- (id)windowForSystemGestures
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecognizerManager windowForSystemGestures]( self->_gestureRecognizerManager,  "windowForSystemGestures"));
}

- (void)setupAssistantDidFinish
{
}

- (id)stateDump
{
  v8[0] = @"table";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureTable stateDump](self->_table, "stateDump"));
  v8[1] = @"arbiter.mode";
  v9[0] = v3;
  v4 = sub_1000C2ED4(-[PBSystemGestureArbiter selectionMode](self->_arbiter, "selectionMode"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return v6;
}

- (void)cancelGestureRecognizersWithPressType:(int64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  table = self->_table;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B4AC4;
  v11[3] = &unk_1003D5420;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  int64_t v15 = a3;
  id v9 = v6;
  id v10 = v7;
  -[PBSystemGestureTable enumerateGestureRecognizersUsingBlock:](table, "enumerateGestureRecognizersUsingBlock:", v11);
}

- (void)cancelSystemGesture:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureManager _systemGestureRecipeForSystemGestureType:]( self,  "_systemGestureRecipeForSystemGestureType:"));
  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable existingHandleForSystemGestureRecipe:]( self->_table,  "existingHandleForSystemGestureRecipe:",  v4));
    id v6 = v5;
    if (v5)
    {
      -[os_log_s invokeActionHandlerWithCancellation](v5, "invokeActionHandlerWithCancellation");
    }

    else
    {
      id v8 = sub_1000B464C(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10027AF8C();
      }
    }
  }

  else
  {
    id v7 = sub_1000B464C(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10027AF20();
    }
  }
}

- (void)addSystemKeychordGestureWithPressTypes:(id)a3 minimumPressDuration:(double)a4 target:(id)a5 action:(SEL)a6
{
}

- (id)expectSystemGesture:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  testingExpectation = self->_testingExpectation;
  if (testingExpectation) {
    -[PBSystemGestureExpectation invalidate](testingExpectation, "invalidate");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureManager _systemGestureRecipeForSystemGestureType:]( self,  "_systemGestureRecipeForSystemGestureType:",  a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable existingHandleForSystemGestureRecipe:]( self->_table,  "existingHandleForSystemGestureRecipe:",  v8));
  if (v9)
  {
    id v10 = v9;
    if ([v9 isActive])
    {
      [v10 relinquish];
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v11 = 2LL;
    }
  }

  else
  {
    id v10 = -[PBSystemGestureManager newHandleForSystemGesture:actionHandler:]( self,  "newHandleForSystemGesture:actionHandler:",  a3,  &stru_1003D5440);
    uint64_t v11 = 1LL;
  }

  [v10 acquire];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B4E7C;
  v16[3] = &unk_1003D1660;
  objc_copyWeak(&v18, &location);
  id v12 = v6;
  id v17 = v12;
  id v13 = objc_retainBlock(v16);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureExpectation expectationWithHandle:options:fulfillment:]( &OBJC_CLASS___PBSystemGestureExpectation,  "expectationWithHandle:options:fulfillment:",  v10,  v11,  v13));
  objc_storeStrong((id *)&self->_testingExpectation, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

- (void)activateHandle:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000B464C(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activating handle: %{public}@", buf, 0xCu);
  }

  id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  table = self->_table;
  id v32 = v4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recipe]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable activateSystemGestureForDescriptor:]( table,  "activateSystemGestureForDescriptor:",  v8));

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        int64_t v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 gestureRecognizer]);
        -[PBSystemGestureArbiter resetCacheWithReason:forGestureRecognizer:]( self->_arbiter,  "resetCacheWithReason:forGestureRecognizer:",  @"HandleActivation",  v16);
        if ([v15 previousActiveCount] || !objc_msgSend(v15, "activeCount"))
        {
          id v17 = sub_1000B464C(self);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v22 = [v15 previousActiveCount];
            id v23 = [v15 activeCount];
            *(_DWORD *)buf = 134218240;
            id v44 = v22;
            __int16 v45 = 2048;
            id v46 = v23;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Skipping enabling recognizer {previous=%lu, current=%lu}",  buf,  0x16u);
          }
        }

        else
        {
          [v16 setEnabled:1];
          id v19 = sub_1000B464C(self);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v16));
            *(_DWORD *)buf = 138543362;
            id v44 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Enabling recognizer: %{public}@",  buf,  0xCu);
          }

          -[NSMutableArray addObject:](v33, "addObject:", v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }

    while (v12);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  dispatch_time_t v24 = v33;
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)j) allowedPressTypes]);
        if ([v29 count]) {
          -[PBSystemGestureManager _notifyObserversDidEnableGestureRecognizerWithAllowedPressTypes:]( self,  "_notifyObserversDidEnableGestureRecognizerWithAllowedPressTypes:",  v29);
        }
      }

      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
    }

    while (v26);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugPublisher);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v32 recipe]);
  objc_msgSend(WeakRetained, "systemGestureManager:didActivateHandleOfSystemGesture:", self, objc_msgSend(v31, "type"));
}

- (void)deactivateHandle:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000B464C(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deactivating handle: %{public}@", buf, 0xCu);
  }

  id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  table = self->_table;
  id v30 = v4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recipe]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable deactivateSystemGestureForDescriptor:]( table,  "deactivateSystemGestureForDescriptor:",  v8));

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        int64_t v15 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 gestureRecognizer]);
        -[PBSystemGestureArbiter resetCacheWithReason:forGestureRecognizer:]( self->_arbiter,  "resetCacheWithReason:forGestureRecognizer:",  @"HandleDeactivation",  v16);
        if ([v15 activeCount])
        {
          id v17 = sub_1000B464C(self);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v22 = [v15 previousActiveCount];
            id v23 = [v15 activeCount];
            *(_DWORD *)buf = 134218240;
            id v42 = v22;
            __int16 v43 = 2048;
            id v44 = v23;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Skipping disabling recognizer {previous=%lu, current=%lu}",  buf,  0x16u);
          }
        }

        else
        {
          [v16 setEnabled:0];
          id v19 = sub_1000B464C(self);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v16));
            *(_DWORD *)buf = 138543362;
            id v42 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Disabling recognizer: %{public}@ {reason=deactivation}",  buf,  0xCu);
          }

          -[NSMutableArray addObject:](v31, "addObject:", v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v12);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  dispatch_time_t v24 = v31;
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)j) allowedPressTypes]);
        if ([v29 count]) {
          -[PBSystemGestureManager _notifyObserversDidDisableGestureRecognizerWithAllowedPressTypes:]( self,  "_notifyObserversDidDisableGestureRecognizerWithAllowedPressTypes:",  v29);
        }
      }

      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
    }

    while (v26);
  }
}

- (void)removeHandle:(id)a3 forSystemGestureRecipe:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000B464C(self);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v38 = v8;
    __int16 v39 = 2114;
    id v40 = v10;
    __int16 v41 = 2114;
    id v42 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Removing handle {handle=%p, reason=%{public}@, descriptor=%{public}@}",  buf,  0x20u);
  }

  uint64_t v28 = v10;
  unsigned int v13 = [v10 isEqual:@"Replacement"];
  uint64_t v29 = v9;
  id v30 = v8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable removeHandle:forSystemGestureRecipe:options:]( self->_table,  "removeHandle:forSystemGestureRecipe:options:",  v8,  v9,  v13 ^ 1));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v14;
  id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 gestureRecognizer]);
        -[PBSystemGestureArbiter resetCacheWithReason:forGestureRecognizer:]( self->_arbiter,  "resetCacheWithReason:forGestureRecognizer:",  @"HandleRemoval",  v20);
        if (![v19 activeCount])
        {
          [v20 setEnabled:0];
          id v21 = sub_1000B464C(self);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v20));
            *(_DWORD *)buf = 138543362;
            id v38 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Disabling recognizer: %{public}@ {reason=removal}",  buf,  0xCu);
          }
        }

        if ([v19 count]) {
          char v24 = 1;
        }
        else {
          char v24 = v13;
        }
        if ((v24 & 1) == 0)
        {
          -[PBSystemGestureRecognizerManager removeGestureRecognizer:]( self->_gestureRecognizerManager,  "removeGestureRecognizer:",  v20);
          id v25 = sub_1000B464C(self);
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v20));
            *(_DWORD *)buf = 138543362;
            id v38 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Removing recognizer: %{public}@",  buf,  0xCu);
          }
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v16);
  }
}

- (void)_systemGestureRecognizerStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureArbiter selectionPolicy](self->_arbiter, "selectionPolicy"));
  __int16 v41 = self->_deferringPolicy;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable handleForGestureRecognizer:withSelectionPolicy:deferringPolicy:]( self->_table,  "handleForGestureRecognizer:withSelectionPolicy:deferringPolicy:",  v4,  v6));
  if (v7)
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/manager/fire",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    os_activity_scope_enter(v8, &state);

    id v40 = (void *)objc_claimAutoreleasedReturnValue([v7 handle]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptor]);
    id v10 = sub_1000B464C(self);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v37 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v4));
      id v38 = sub_1001662FC((unint64_t)[v4 state]);
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      *(_DWORD *)buf = 138543874;
      id v44 = v37;
      __int16 v45 = 2112;
      id v46 = v39;
      __int16 v47 = 2112;
      v48 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@ {state=%@, descriptor=%@}",  buf,  0x20u);
    }

    id v12 = [v9 activationMask];
    uint64_t v13 = (uint64_t)v12;
    switch((unint64_t)v5)
    {
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_18;
      case 3uLL:
        goto LABEL_24;
      case 4uLL:
        goto LABEL_18;
      case 5uLL:
LABEL_18:
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v40 recipe]);
        testingExpectation = self->_testingExpectation;
        if (testingExpectation
          && (id v24 = -[PBSystemGestureExpectation type](testingExpectation, "type"), v24 == [v22 type]))
        {
          -[PBSystemGestureExpectation fulfill](self->_testingExpectation, "fulfill");
          id WeakRetained = self->_testingExpectation;
          self->_testingExpectation = 0LL;
        }

        else
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 deferringTargetHandle]);
          BOOL v27 = v26 == 0LL;

          if (v27)
          {
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v9 gestureRecognizerDescriptor]);
            [v40 invokeActionHandlerWithGestureRecognizer:v4 descriptor:v35];

            id WeakRetained = objc_loadWeakRetained((id *)&self->_debugPublisher);
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v40 recipe]);
            objc_msgSend( WeakRetained,  "systemGestureManager:didInvokeHandleOfSystemGesture:",  self,  objc_msgSend(v36, "type"));
          }

          else
          {
            id WeakRetained = (void *)objc_claimAutoreleasedReturnValue([v7 deferringTargetHandle]);
            [WeakRetained invokeActionHandlerWithDeferringSourceRecipe:v22];
            id v28 = objc_loadWeakRetained((id *)&self->_debugPublisher);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained recipe]);
            objc_msgSend( v28,  "systemGestureManager:didInvokeHandleOfSystemGesture:deferringFrom:",  self,  objc_msgSend(v29, "type"),  objc_msgSend(v22, "type"));
          }
        }

        break;
      default:
LABEL_24:
        id v30 = sub_1000B464C(self);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
        {
          id v31 = sub_10006BCC0(v13);
          id v32 = (id)objc_claimAutoreleasedReturnValue(v31);
          __int128 v33 = sub_1001662FC((unint64_t)v5);
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          sub_10027B118(v32, v34, buf, (os_log_t)v22);
        }

        break;
    }

    os_activity_scope_leave(&state);
  }

  else if ([v6 performsSelectiveFiltering])
  {
    id v14 = sub_1000B464C(self);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v4));
      uint64_t v17 = sub_1000C2ED4(-[PBSystemGestureArbiter selectionMode](self->_arbiter, "selectionMode"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543618;
      id v44 = v16;
      __int16 v45 = 2114;
      id v46 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Ignoring recognizer state change due to selection policy filtering {recognizer=%{public}@, selectionMode=%{public}@}",  buf,  0x16u);
    }
  }

  else
  {
    id v19 = sub_1000B464C(self);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = v20;
    if (v5 == (id)4)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10027AFF0((uint64_t)v4, v21);
      }
    }

    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_10027B080((uint64_t)v4, v21);
    }
  }
}

- (id)_systemGestureRecipeForSystemGestureType:(unint64_t)a3
{
  dataSource = self->_dataSource;
  if (dataSource) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecipeDataSource systemGestureRecipeForSystemGestureType:]( dataSource,  "systemGestureRecipeForSystemGestureType:",  a3));
  }
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureRecipe recipeForType:](&OBJC_CLASS___PBSystemGestureRecipe, "recipeForType:", a3));
  }
  return v4;
}

- (id)_systemGestureRecipeProviderBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B5F30;
  v4[3] = &unk_1003D5468;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)_prepareGestureRecognizersMatchingDescriptors:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "gestureRecognizerDescriptor",  (void)v13));
        unsigned int v10 = -[PBSystemGestureManager _prepareGestureRecognizerMatchingDescriptor:]( self,  "_prepareGestureRecognizerMatchingDescriptor:",  v9);

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)_prepareGestureRecognizerMatchingDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable existingGestureRecognizerMatchingDescriptor:]( self->_table,  "existingGestureRecognizerMatchingDescriptor:",  v4));
  if (v5)
  {
    id v6 = (void *)v5;
    -[PBSystemGestureArbiter resetCacheWithReason:forGestureRecognizer:]( self->_arbiter,  "resetCacheWithReason:forGestureRecognizer:",  @"HandleCreation",  v5);
LABEL_7:

    LOBYTE(v6) = 1;
    goto LABEL_8;
  }

  id v7 = [(id)objc_opt_class(self) _gestureRecognizerForDescriptor:v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v6 = v8;
  if (v8)
  {
    [v8 setEnabled:0];
    [v6 setDelegate:self->_arbiter];
    [v6 addTarget:self action:"_systemGestureRecognizerStateChanged:"];
    -[PBSystemGestureTable setGestureRecognizer:forGestureRecognizerDescriptor:]( self->_table,  "setGestureRecognizer:forGestureRecognizerDescriptor:",  v6,  v4);
    -[PBSystemGestureRecognizerManager addGestureRecognizer:]( self->_gestureRecognizerManager,  "addGestureRecognizer:",  v6);
    id v9 = sub_1000B464C(self);
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v6));
      int v13 = 138543618;
      __int128 v14 = v11;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Adding recognizer {recognizer=%{public}@, descriptor=%{public}@}",  (uint8_t *)&v13,  0x16u);
    }

    goto LABEL_7;
  }

- (void)_setupAssistantStateDidChange
{
  uint64_t v3 = -[PBSystemGestureArbiter selectionMode](self->_arbiter, "selectionMode");
  unsigned int v4 = sub_1001C9BFC();
  if (v3 == v4)
  {
    id v5 = sub_1000B464C(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_1000C2ED4(v3);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LODWORD(buf.opaque[0]) = 138543362;
      *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Selection mode remaining unchanged after setup state change {mode=%{public}@}",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    id v9 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/manager/setupStateChange",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v9, &buf);

    id v10 = sub_1000B464C(self);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = sub_1000C2ED4(v4);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 138543362;
      __int16 v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating selection mode due to setup state change {mode=%{public}@}",  (uint8_t *)&v14,  0xCu);
    }

    -[PBSystemGestureArbiter setSelectionMode:](self->_arbiter, "setSelectionMode:", v4);
    -[PBSystemGestureManager _cancelAllGestureRecognizers](self, "_cancelAllGestureRecognizers");
    os_activity_scope_leave(&buf);
  }

- (void)_cancelAllGestureRecognizers
{
}

+ (id)_gestureRecognizerForDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  id v5 = 0LL;
  id v6 = (Class *)&OBJC_CLASS____UIRepeatingPressGestureRecognizer_ptr;
  switch(__ROR8__(v4, 1))
  {
    case 0LL:
      goto LABEL_8;
    case 1LL:
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBGameControllerPressGestureRecognizerDescriptor);
      char isKindOfClass = objc_opt_isKindOfClass(v3, v7);
      id v6 = (Class *)&OBJC_CLASS___UITapGestureRecognizer_ptr;
      id v9 = off_1003CDA00;
      goto LABEL_4;
    case 3LL:
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBHomeLongPressGestureRecognizerDescriptor);
      char isKindOfClass = objc_opt_isKindOfClass(v3, v10);
      id v6 = (Class *)&OBJC_CLASS___UILongPressGestureRecognizer_ptr;
      id v9 = off_1003CDA08;
LABEL_4:
      if ((isKindOfClass & 1) != 0) {
        id v6 = (Class *)v9;
      }
      goto LABEL_6;
    case 5LL:
LABEL_6:
      id v5 = objc_alloc_init(*v6);
      break;
    default:
      break;
  }

  [v3 applySettingsToGestureRecognizer:v5];
LABEL_8:

  return v5;
}

- (void)_notifyObserversDidEnableGestureRecognizerWithAllowedPressTypes:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B656C;
  v7[3] = &unk_1003D54D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

- (void)_notifyObserversDidDisableGestureRecognizerWithAllowedPressTypes:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B6604;
  v7[3] = &unk_1003D54D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

- (PBSystemGestureRecognizerManager)gestureRecognizerManager
{
  return self->_gestureRecognizerManager;
}

- (PBSystemGestureTable)table
{
  return self->_table;
}

- (PBSystemGestureArbiter)arbiter
{
  return self->_arbiter;
}

- (PBSystemGestureDeferringPolicy)deferringPolicy
{
  return self->_deferringPolicy;
}

- (PBSystemGestureKeychordAssistant)keychordAssistant
{
  return self->_keychordAssistant;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (PBSystemGestureExpectation)testingExpectation
{
  return self->_testingExpectation;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (PBSystemGestureManagerDebugPublisher)debugPublisher
{
  return (PBSystemGestureManagerDebugPublisher *)objc_loadWeakRetained((id *)&self->_debugPublisher);
}

- (void)setDebugPublisher:(id)a3
{
}

- (PBSystemGestureRecipeDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

  ;
}

@end