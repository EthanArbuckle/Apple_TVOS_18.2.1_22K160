@interface TVSSPrivacyController
- (BOOL)requireIndicatorsOutsideMenuBar;
- (TVSObserverSet)observers;
- (TVSSMenuModeController)menuModeController;
- (TVSSPrivacyController)initWithMenuModeController:(id)a3 sensorActivityController:(id)a4;
- (TVSSPrivacyState)privacyState;
- (TVSSSensorActivityController)sensorActivityController;
- (id)stateDumpBuilder;
- (void)_notifyPrivacyControllerStateDidChange;
- (void)_updatePrivacyState;
- (void)addControllerObserver:(id)a3;
- (void)dealloc;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)removeControllerObserver:(id)a3;
- (void)sensorActivityControllerDidUpdate:(id)a3;
- (void)setPrivacyState:(id)a3;
- (void)setRequireIndicatorsOutsideMenuBar:(BOOL)a3;
@end

@implementation TVSSPrivacyController

- (TVSSPrivacyController)initWithMenuModeController:(id)a3 sensorActivityController:(id)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  v4 = v29;
  v29 = 0LL;
  v26.receiver = v4;
  v26.super_class = (Class)&OBJC_CLASS___TVSSPrivacyController;
  v29 = -[TVSSPrivacyController init](&v26, "init");
  objc_storeStrong((id *)&v29, v29);
  if (v29)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVSSPrivacyState);
    privacyState = v29->_privacyState;
    v29->_privacyState = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v29->_observers;
    v29->_observers = v7;

    objc_storeStrong((id *)&v29->_menuModeController, location[0]);
    -[TVSSMenuModeController addControllerObserver:](v29->_menuModeController, "addControllerObserver:", v29);
    objc_storeStrong((id *)&v29->_sensorActivityController, v27);
    -[TVSSSensorActivityController addObserver:](v29->_sensorActivityController, "addObserver:", v29);
    -[TVSSPrivacyController _updatePrivacyState](v29, "_updatePrivacyState");
    objc_initWeak(&from, v29);
    aClass = (objc_class *)objc_opt_class(v29);
    v15 = NSStringFromClass(aClass);
    id v24 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TVSystemUIService - %@",  v15);

    v13 = &_dispatch_main_q;
    id v14 = v24;
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = sub_10009BC44;
    v22 = &unk_1001B6330;
    objc_copyWeak(&v23, &from);
    v9 = (BSInvalidatable *)(id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( v13,  v14,  &v18);
    stateCaptureHandle = v29->_stateCaptureHandle;
    v29->_stateCaptureHandle = v9;

    objc_destroyWeak(&v23);
    objc_storeStrong(&v24, 0LL);
    objc_destroyWeak(&from);
  }

  v12 = v29;
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  return v12;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuModeController removeControllerObserver:](self->_menuModeController, "removeControllerObserver:", self);
  -[TVSSSensorActivityController removeObserver:](v4->_sensorActivityController, "removeObserver:", v4);
  -[BSInvalidatable invalidate](v4->_stateCaptureHandle, "invalidate");
  objc_storeStrong((id *)&v4->_stateCaptureHandle, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSPrivacyController;
  -[TVSSPrivacyController dealloc](&v2, "dealloc");
}

- (void)setRequireIndicatorsOutsideMenuBar:(BOOL)a3
{
  if (self->_requireIndicatorsOutsideMenuBar != a3)
  {
    self->_requireIndicatorsOutsideMenuBar = a3;
    -[TVSSPrivacyController _updatePrivacyState](self, "_updatePrivacyState");
  }

- (void)setPrivacyState:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualObjects(v5->_privacyState, location[0]) & 1) == 0)
  {
    os_log_t oslog = (os_log_t)PrivacyLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v6, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "PrivacyStateDidChange: %@", v6, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    objc_storeStrong((id *)&v5->_privacyState, location[0]);
    -[TVSSPrivacyController _notifyPrivacyControllerStateDidChange](v5, "_notifyPrivacyControllerStateDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)addControllerObserver:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = -[TVSSPrivacyController observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeControllerObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSPrivacyController observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSPrivacyController _updatePrivacyState](v7, "_updatePrivacyState");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)sensorActivityControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPrivacyController _updatePrivacyState](v4, "_updatePrivacyState");
  objc_storeStrong(location, 0LL);
}

- (void)_updatePrivacyState
{
  v29 = self;
  SEL v28 = a2;
  v18 = -[TVSSPrivacyController menuModeController](self, "menuModeController");
  unint64_t v19 = -[TVSSMenuModeController mode](v18, "mode");

  unint64_t v27 = v19;
  if (v19 <= 5) {
    __asm { BR              X8 }
  }

  if (-[TVSSPrivacyController requireIndicatorsOutsideMenuBar](v29, "requireIndicatorsOutsideMenuBar"))
  {
    uint64_t v26 = 0LL;
    v25[1] = 0LL;
  }

  v25[0] = 0LL;
  id v24 = 0LL;
  id v23 = 0LL;
  if (v27)
  {
    memset(__b, 0, sizeof(__b));
    v15 = -[TVSSPrivacyController sensorActivityController](v29, "sensorActivityController");
    obj = -[TVSSSensorActivityController activeActivityAttributions](v15, "activeActivityAttributions");

    id v17 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
    if (v17)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0LL;
      id v14 = v17;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(id *)(__b[1] + 8 * v13);
        if ([v22 sensorType])
        {
          if ([v22 sensorType] == (id)1)
          {
            id v5 = objc_alloc(&OBJC_CLASS___TVSSRecordingIndicator);
            id v6 = -[TVSSRecordingIndicator initRecordingIndicatorWithDisplayLocation:recordingType:]( v5,  "initRecordingIndicatorWithDisplayLocation:recordingType:",  v26,  0LL);
            id v7 = v24;
            id v24 = v6;
          }

          else
          {
            [v22 sensorType];
          }
        }

        else
        {
          objc_super v2 = objc_alloc(&OBJC_CLASS___TVSSRecordingIndicator);
          id v3 = -[TVSSRecordingIndicator initRecordingIndicatorWithDisplayLocation:recordingType:]( v2,  "initRecordingIndicatorWithDisplayLocation:recordingType:",  v26,  1LL);
          id v4 = v25[0];
          v25[0] = v3;
        }

        ++v13;
        if (v11 + 1 >= (unint64_t)v14)
        {
          uint64_t v13 = 0LL;
          id v14 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
          if (!v14) {
            break;
          }
        }
      }
    }
  }

  if (v25[0]) {
    id v8 = v25[0];
  }
  else {
    id v8 = v24;
  }
  id v20 = v8;
  v9 = objc_alloc(&OBJC_CLASS___TVSSPrivacyState);
  v10 = -[TVSSPrivacyState initWithMenuMode:recordingIndicator:locationIndicator:]( v9,  "initWithMenuMode:recordingIndicator:locationIndicator:",  v27,  v20,  v23);
  -[TVSSPrivacyController setPrivacyState:](v29, "setPrivacyState:");

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(v25, 0LL);
}

- (void)_notifyPrivacyControllerStateDidChange
{
  v9 = self;
  v8[1] = (id)a2;
  objc_super v2 = -[TVSSPrivacyController observers](self, "observers");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10009C594;
  id v7 = &unk_1001B97F0;
  v8[0] = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](v2, "enumerateObserversUsingBlock:");

  objc_storeStrong(v8, 0LL);
}

- (id)stateDumpBuilder
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v2 =  objc_msgSend( v8[0],  "appendBool:withKey:",  -[TVSSPrivacyController requireIndicatorsOutsideMenuBar](v9, "requireIndicatorsOutsideMenuBar"),  @"requireIndicatorsOutsideMenuBar");
  id v5 = v8[0];
  id v6 = -[TVSSPrivacyController privacyState](v9, "privacyState");
  id v3 = objc_msgSend(v5, "appendObject:withKey:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (BOOL)requireIndicatorsOutsideMenuBar
{
  return self->_requireIndicatorsOutsideMenuBar;
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (TVSSSensorActivityController)sensorActivityController
{
  return self->_sensorActivityController;
}

- (TVSSPrivacyState)privacyState
{
  return self->_privacyState;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end