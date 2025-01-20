@interface TVSSPrivacyViewPixelShifter
+ (CGPoint)offsetForStep:(unint64_t)a3;
+ (id)_prefKeyForIdentifier:(id)a3;
- (BOOL)timerRunning;
- (BSCompoundAssertion)shifterActiveAssertion;
- (CGPoint)offset;
- (NSString)identifier;
- (OS_dispatch_source)timer;
- (TVSObserverSet)observerSet;
- (TVSSPrivacyViewPixelShifter)initWithIdentifier:(id)a3;
- (double)timerInterval;
- (id)acquireAssertionWithReason:(id)a3;
- (unint64_t)currentStep;
- (void)_timerFired;
- (void)_updateOffset;
- (void)_updateState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSPrivacyViewPixelShifter

- (TVSSPrivacyViewPixelShifter)initWithIdentifier:(id)a3
{
  id v51 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v51;
  id v51 = 0LL;
  v49.receiver = v3;
  v49.super_class = (Class)&OBJC_CLASS___TVSSPrivacyViewPixelShifter;
  v31 = -[TVSSPrivacyViewPixelShifter init](&v49, "init");
  id v51 = v31;
  objc_storeStrong(&v51, v31);
  if (v31)
  {
    v30 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults registerDefaults:](v30, "registerDefaults:", &off_1001C84E8);

    id v29 = [location[0] copy];
    v4 = (void *)*((void *)v51 + 2);
    *((void *)v51 + 2) = v29;

    v28 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    v5 = (void *)*((void *)v51 + 3);
    *((void *)v51 + 3) = v28;

    v27 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults doubleForKey:](v27, "doubleForKey:", @"IndicatorUpdateInterval");
    *((void *)v51 + 6) = v6;

    v25 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    v26 = (void *)objc_opt_class(v51);
    id v24 = [v26 _prefKeyForIdentifier:*((void *)v51 + 2)];
    id v22 = -[NSUserDefaults objectForKey:](v25, "objectForKey:");
    id v23 = [v22 unsignedIntegerValue];
    *((void *)v51 + 5) = v23;

    objc_initWeak(&from, v51);
    id v21 = location[0];
    v42 = _NSConcreteStackBlock;
    int v43 = -1073741824;
    int v44 = 0;
    v45 = sub_10004C2A8;
    v46 = &unk_1001B7B28;
    objc_copyWeak(&v47, &from);
    v7 =  +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v21,  &v42);
    v8 = (void *)*((void *)v51 + 4);
    *((void *)v51 + 4) = v7;

    v20 = &_dispatch_main_q;
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v20);
    v10 = (void *)*((void *)v51 + 7);
    *((void *)v51 + 7) = v9;

    uint64_t v41 = (unint64_t)(1000000000.0 * *((double *)v51 + 6));
    source = (dispatch_source_s *)*((void *)v51 + 7);
    dispatch_time_t v11 = dispatch_time(0LL, 0LL);
    dispatch_source_set_timer(source, v11, v41, 0LL);
    v19 = (dispatch_source_s *)*((void *)v51 + 7);
    handler = _NSConcreteStackBlock;
    int v36 = -1073741824;
    int v37 = 0;
    v38 = sub_10004C310;
    v39 = &unk_1001B75D0;
    objc_copyWeak(&v40, &from);
    dispatch_source_set_event_handler(v19, &handler);
    *((_BYTE *)v51 + 8) = 0;
    [v51 _updateOffset];
    v17 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
    -[PBSDisplayManager addStateObserver:](v17, "addStateObserver:", v51);

    v16 = (void *)objc_opt_class(&OBJC_CLASS___PBSSystemStatus);
    [v16 addObserver:v51 forKeyPath:@"systemAttentionState" options:0 context:off_10021F330];
    id v34 = PrivacyLog();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *((void *)v51 + 2);
      id v14 = (id)BSNSStringFromCGPoint(*((double *)v51 + 8), *((double *)v51 + 9));
      id v32 = v14;
      sub_10004C34C((uint64_t)v52, v15, (uint64_t)v32, *((void *)v51 + 5));
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  v33,  "Privacy pixel shifter created - %@ initialOffset: %@ step: %lu",  v52,  0x20u);

      objc_storeStrong(&v32, 0LL);
    }

    objc_storeStrong(&v34, 0LL);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&from);
  }

  v13 = (TVSSPrivacyViewPixelShifter *)v51;
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v51, 0LL);
  return v13;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  -[BSCompoundAssertion invalidate](self->_shifterActiveAssertion, "invalidate");
  [(id)objc_opt_class(PBSSystemStatus) removeObserver:v5 forKeyPath:@"systemAttentionState" context:off_10021F330];
  v2 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  -[PBSDisplayManager removeStateObserver:](v2, "removeStateObserver:", v5);

  if (!v5->_timerRunning) {
    dispatch_resume((dispatch_object_t)v5->_timer);
  }
  objc_storeStrong((id *)&v5->_timer, 0LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPrivacyViewPixelShifter;
  -[TVSSPrivacyViewPixelShifter dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      dispatch_source_t v9 = NSStringFromSelector(v16);
      v5 = v9;
      dispatch_time_t v11 = v5;
      objc_super v3 = (objc_class *)objc_opt_class(v17);
      v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSPrivacyViewPixelShifter.m",  91,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x10004C670LL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_observerSet, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  SEL v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      v8 = NSStringFromSelector(v15);
      id v4 = v8;
      v10 = v4;
      objc_super v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      dispatch_source_t v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSPrivacyViewPixelShifter.m",  97,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10004C8D0LL);
  }

  -[TVSObserverSet removeObserver:](v16->_observerSet, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (id)acquireAssertionWithReason:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[BSCompoundAssertion acquireForReason:](v6->_shifterActiveAssertion, "acquireForReason:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPrivacyViewPixelShifter _updateState](v5, "_updateState");
  objc_storeStrong(location, 0LL);
}

+ (CGPoint)offsetForStep:(unint64_t)a3
{
  id v22 = a1;
  SEL v21 = a2;
  unint64_t v20 = a3;
  uint64_t v19 = 29LL;
  uint64_t v18 = 17LL;
  uint64_t v17 = 493LL;
  uint64_t v16 = 986LL;
  uint64_t v15 = a3 + 246;
  unint64_t v14 = (a3 + 246) % 0x3DA;
  if (v14 > 0x1ED) {
    unint64_t v14 = 986 - v14;
  }
  unint64_t v13 = v14 / 0x1D;
  unint64_t v12 = v14 % 0x1D;
  if (v14 / 0x1D % 2 == 1) {
    unint64_t v12 = 28 - v12;
  }
  sub_10004CC4C();
  oslog[3] = v3;
  oslog[4] = v4;
  sub_10004CC4C();
  oslog[1] = v5;
  oslog[2] = v6;
  sub_10004CC4C();
  double v23 = v7;
  double v24 = v8;
  oslog[0] = (os_log_t)PrivacyLog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_10004CC78((uint64_t)v25, v15, v14, v13, v12);
    _os_log_debug_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEBUG,  "adjustedStep: %lu, normalizedPosition: %lu, rowNumber: %lu, columnNumber: %lu",  v25,  0x2Au);
  }

  objc_storeStrong((id *)oslog, 0LL);
  double v9 = v24;
  double v10 = v23;
  result.y = v9;
  result.x = v10;
  return result;
}

  ;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  uint64_t v16 = a6;
  if (a6 == off_10021F330)
  {
    double v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    unint64_t v13 = sub_10004CE3C;
    unint64_t v14 = &unk_1001B5A60;
    uint64_t v15 = v20;
    BSDispatchMain(&v10);
    objc_storeStrong((id *)&v15, 0LL);
  }

  else
  {
    v9.receiver = v20;
    v9.super_class = (Class)&OBJC_CLASS___TVSSPrivacyViewPixelShifter;
    -[TVSSPrivacyViewPixelShifter observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v18,  v17,  v16);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_timerFired
{
  id v4 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  objc_super v3 =  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_currentStep);
  id v2 = [(id)objc_opt_class(self) _prefKeyForIdentifier:self->_identifier];
  -[NSUserDefaults setObject:forKey:](v4, "setObject:forKey:", v3);

  -[TVSSPrivacyViewPixelShifter _updateOffset](self, "_updateOffset");
}

- (void)_updateState
{
  unint64_t v20 = self;
  SEL v19 = a2;
  id v18 = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
  double v8 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v2 = -[PBSDisplayManager currentDisplayMode](v8, "currentDisplayMode");
  BOOL v9 = v2 != 0LL;

  BOOL v17 = v9;
  BOOL v10 = 0;
  if (v9)
  {
    BOOL v10 = 0;
    if (v18 != (id)7)
    {
      BOOL v10 = 0;
      if (v18 != (id)6) {
        BOOL v10 = v18 != (id)8;
      }
    }
  }

  BOOL v16 = v10;
  char v15 = -[BSCompoundAssertion isActive](v20->_shifterActiveAssertion, "isActive") & 1;
  char v7 = 0;
  if (v10) {
    char v7 = v15;
  }
  char v14 = v7 & 1;
  if (v20->_timerRunning || (v14 & 1) == 0)
  {
    if (v20->_timerRunning && (v14 & 1) == 0)
    {
      v20->_timerRunning = 0;
      os_log_t v11 = (os_log_t)PrivacyLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if (v16) {
          v5 = @"Y";
        }
        else {
          v5 = @"N";
        }
        if ((v15 & 1) != 0) {
          uint64_t v6 = @"Y";
        }
        else {
          uint64_t v6 = @"N";
        }
        sub_100028588((uint64_t)v21, (uint64_t)v20->_identifier, (uint64_t)v5, (uint64_t)v6);
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stopping privacy pixel shifter - %@ (displayRenderingUI: %@ hasObservers: %@)",  v21,  0x20u);
      }

      objc_storeStrong((id *)&v11, 0LL);
      dispatch_suspend((dispatch_object_t)v20->_timer);
    }
  }

  else
  {
    v20->_timerRunning = 1;
    os_log_t oslog = (os_log_t)PrivacyLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v16) {
        objc_super v3 = @"Y";
      }
      else {
        objc_super v3 = @"N";
      }
      if ((v15 & 1) != 0) {
        id v4 = @"Y";
      }
      else {
        id v4 = @"N";
      }
      sub_100028588((uint64_t)v22, (uint64_t)v20->_identifier, (uint64_t)v3, (uint64_t)v4);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  type,  "Starting privacy pixel shifter - %@ (displayRenderingUI: %@ hasObservers: %@)",  v22,  0x20u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    dispatch_resume((dispatch_object_t)v20->_timer);
  }

- (void)_updateOffset
{
  SEL v19 = self;
  SEL v18 = a2;
  [(id)objc_opt_class(self) offsetForStep:self->_currentStep];
  v17.x = v2;
  v17.y = v3;
  -[TVSSPrivacyViewPixelShifter willChangeValueForKey:](v19, "willChangeValueForKey:");
  v19->_offset = v17;
  -[TVSSPrivacyViewPixelShifter didChangeValueForKey:](v19, "didChangeValueForKey:", @"offset");
  observerSet = v19->_observerSet;
  os_log_t v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  char v14 = sub_10004D480;
  char v15 = &unk_1001B7B50;
  BOOL v16 = v19;
  -[TVSObserverSet enumerateObserversUsingBlock:](observerSet, "enumerateObserversUsingBlock:", &v11);
  os_log_t oslog = (os_log_t)PrivacyLog();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v5 = type;
    id v6 = (id)BSNSStringFromCGPoint(v19->_offset.x, v19->_offset.y);
    id v8 = v6;
    sub_10004D540((uint64_t)v20, (uint64_t)v8, v19->_currentStep);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v5,  "Updated privacy pixel shifter offset - %@ - Step: %lu",  v20,  0x16u);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
}

+ (id)_prefKeyForIdentifier:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IndicatorStepCount-%@",  location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGPoint)offset
{
  double y = self->_offset.y;
  double x = self->_offset.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (TVSObserverSet)observerSet
{
  return self->_observerSet;
}

- (BSCompoundAssertion)shifterActiveAssertion
{
  return self->_shifterActiveAssertion;
}

- (unint64_t)currentStep
{
  return self->_currentStep;
}

- (double)timerInterval
{
  return self->_timerInterval;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)timerRunning
{
  return self->_timerRunning;
}

- (void).cxx_destruct
{
}

@end