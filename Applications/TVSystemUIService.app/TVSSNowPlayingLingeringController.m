@interface TVSSNowPlayingLingeringController
- (BOOL)isActive;
- (BOOL)isVisible;
- (NSTimer)lingeringTimer;
- (TVSSNowPlayingLingeringController)initWithInitialPlaybackState:(int64_t)a3 lingeringDuration:(double)a4;
- (TVSStateMachine)stateMachine;
- (double)lingeringDuration;
- (id)_setupNewStateMachine;
- (id)visibilityDidChangeHandler;
- (int64_t)lastPlaybackState;
- (void)_handleStateTransitionFrom:(id)a3 toState:(id)a4;
- (void)_notifyOfVisibilityChange;
- (void)_updateLingeringTimer;
- (void)_updateVisibility;
- (void)handlePlaybackStateChange:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setLastPlaybackState:(int64_t)a3;
- (void)setLingeringTimer:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setVisibilityDidChangeHandler:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation TVSSNowPlayingLingeringController

- (TVSSNowPlayingLingeringController)initWithInitialPlaybackState:(int64_t)a3 lingeringDuration:(double)a4
{
  SEL v12 = a2;
  unint64_t v11 = a3;
  double v10 = a4;
  v13 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingLingeringController;
  v13 = -[TVSSNowPlayingLingeringController init](&v9, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    id v6 = -[TVSSNowPlayingLingeringController _setupNewStateMachine](v13, "_setupNewStateMachine");
    -[TVSSNowPlayingLingeringController setStateMachine:](v13, "setStateMachine:");

    v13->_lingeringDuration = v10;
    id v8 = sub_10003EA50(v11);
    v7 = -[TVSSNowPlayingLingeringController stateMachine](v13, "stateMachine");
    -[TVSStateMachine postEvent:](v7, "postEvent:", v8);

    objc_storeStrong(&v8, 0LL);
  }

  v5 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  return v5;
}

- (void)setVisible:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_visible != a3)
  {
    os_log_t oslog = (os_log_t)NowPlayingLingeringLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003EC58((uint64_t)v7, v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Changing visibility to: %{BOOL}d", v7, 8u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v6->_visible = v4;
    -[TVSSNowPlayingLingeringController _notifyOfVisibilityChange](v6, "_notifyOfVisibilityChange");
  }

- (void)setLingeringTimer:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_lingeringTimer != location[0])
  {
    -[NSTimer invalidate](v4->_lingeringTimer, "invalidate");
    objc_storeStrong((id *)&v4->_lingeringTimer, location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)handlePlaybackStateChange:(int64_t)a3
{
  SEL v5 = self;
  v4[2] = (id)a2;
  v4[1] = (id)a3;
  v4[0] = sub_10003EA50(a3);
  v3 = -[TVSSNowPlayingLingeringController stateMachine](v5, "stateMachine");
  -[TVSStateMachine postEvent:](v3, "postEvent:", v4[0]);

  objc_storeStrong(v4, 0LL);
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (self->_active)
    {
      BOOL v4 = -[TVSSNowPlayingLingeringController stateMachine](self, "stateMachine");
      -[TVSStateMachine postEvent:](v4, "postEvent:", @"BecomeActiveEvent");
    }

    else
    {
      v3 = -[TVSSNowPlayingLingeringController stateMachine](self, "stateMachine");
      -[TVSStateMachine postEvent:](v3, "postEvent:", @"ResignActiveEvent");
    }
  }

- (void)_updateVisibility
{
  SEL v5 = self;
  v4[1] = (id)a2;
  v7 = (dispatch_once_t *)&unk_100221C40;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7790);
  if (*v7 != -1) {
    dispatch_once(v7, location);
  }
  objc_storeStrong(&location, 0LL);
  v3 = -[TVSSNowPlayingLingeringController stateMachine](v5, "stateMachine");
  v4[0] = -[TVSStateMachine currentState](v3, "currentState");

  unsigned __int8 v2 = [(id)qword_100221C48 containsObject:v4[0]];
  -[TVSSNowPlayingLingeringController setVisible:](v5, "setVisible:", v2 & 1);
  objc_storeStrong(v4, 0LL);
}

- (void)_updateLingeringTimer
{
  v26 = self;
  v25[1] = (id)a2;
  SEL v12 = -[TVSSNowPlayingLingeringController stateMachine](self, "stateMachine");
  v25[0] = -[TVSStateMachine currentState](v12, "currentState");

  if (([v25[0] isEqual:@"LingerState"] & 1) != 0
    || ([v25[0] isEqual:@"LingerActiveState"] & 1) != 0)
  {
    unsigned __int8 v2 = -[TVSSNowPlayingLingeringController lingeringTimer](v26, "lingeringTimer");
    BOOL v11 = v2 != 0LL;

    if (v11)
    {
      id v15 = NowPlayingLingeringLog();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        v7 = -[TVSSNowPlayingLingeringController lingeringTimer](v26, "lingeringTimer");
        sub_10001AC54((uint64_t)v28, (uint64_t)v7);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  v14,  "Timer(%p) already running for a linger state",  v28,  0xCu);
      }

      objc_storeStrong(&v15, 0LL);
    }

    else
    {
      id v24 = -[TVSSNowPlayingLingeringController stateMachine](v26, "stateMachine");
      -[TVSSNowPlayingLingeringController lingeringDuration](v26, "lingeringDuration");
      double v9 = v3;
      v18 = _NSConcreteStackBlock;
      int v19 = -1073741824;
      int v20 = 0;
      v21 = sub_10003F478;
      v22 = &unk_1001B77B8;
      id v23 = v24;
      double v10 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v18,  v9);
      -[TVSSNowPlayingLingeringController setLingeringTimer:](v26, "setLingeringTimer:");

      id location = NowPlayingLingeringLog();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = -[TVSSNowPlayingLingeringController lingeringTimer](v26, "lingeringTimer");
        -[TVSSNowPlayingLingeringController lingeringDuration](v26, "lingeringDuration");
        *(float *)&double v4 = v4;
        sub_10003F4DC((uint64_t)v29, (uint64_t)v8, COERCE__INT64(*(float *)&v4));
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v16,  "Starting new lingering timer(%p) with duration %f",  v29,  0x16u);
      }

      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v23, 0LL);
      objc_storeStrong(&v24, 0LL);
    }
  }

  else
  {
    id v6 = -[TVSSNowPlayingLingeringController lingeringTimer](v26, "lingeringTimer");

    if (v6)
    {
      id v13 = NowPlayingLingeringLog();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        SEL v5 = -[TVSSNowPlayingLingeringController lingeringTimer](v26, "lingeringTimer");
        sub_10001AC54((uint64_t)v27, (uint64_t)v5);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Canceling lingering timer(%p)",  v27,  0xCu);
      }

      objc_storeStrong(&v13, 0LL);
      -[TVSSNowPlayingLingeringController setLingeringTimer:](v26, "setLingeringTimer:", 0LL);
    }
  }

  objc_storeStrong(v25, 0LL);
}

- (void)_notifyOfVisibilityChange
{
  double v3 = self;
  location[1] = (id)a2;
  location[0] = -[TVSSNowPlayingLingeringController visibilityDidChangeHandler](self, "visibilityDidChangeHandler");
  if (location[0]) {
    (*((void (**)(id, TVSSNowPlayingLingeringController *))location[0] + 2))(location[0], v3);
  }
  objc_storeStrong(location, 0LL);
}

- (id)_setupNewStateMachine
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v6 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  os_log_type_t v16 = sub_10003F97C;
  v17 = &unk_1001B77E0;
  objc_copyWeak(v18, location);
  int v19 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v6,  "initWithName:initialState:mode:stateChangeHandler:",  @"LingeringStateMachine",  @"InitialState",  0LL,  &v13);
  -[TVSStateMachine setCallsStateChangeHandlerSynchronously:](v19, "setCallsStateChangeHandlerSynchronously:", 1LL);
  id v5 = NowPlayingLingeringLog();
  -[TVSStateMachine setLogObject:](v19, "setLogObject:");

  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"PlayEvent",  &stru_1001B7820);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"SeekEvent",  &stru_1001B7840);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"InterruptEvent",  &stru_1001B7860);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"StopEvent",  &stru_1001B7880);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"UnknownEvent",  &stru_1001B78A0);
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"InitialState",  @"PauseEvent",  @"HiddenState");
  double v4 = v19;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  double v10 = sub_10003FEB0;
  BOOL v11 = &unk_1001B78C8;
  objc_copyWeak(&v12, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v4,  "registerHandlerForEvent:onState:withBlock:",  @"PauseEvent",  @"VisibleState",  &v7);
  objc_destroyWeak(&v12);
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"LingerState",  @"BecomeActiveEvent",  @"LingerActiveState");
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"LingerActiveState",  @"ResignActiveEvent",  @"LingerState");
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"LingerState",  @"TimerExpiredEvent",  @"HiddenState");
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"LingerActiveState",  @"TimerExpiredEvent",  @"ActiveTimerExpiredState");
  -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( v19,  "registerStateTransitionFromState:onEvent:toState:",  @"ActiveTimerExpiredState",  @"ResignActiveEvent",  @"HiddenState");
  -[TVSStateMachine setShouldAcceptEvents:](v19, "setShouldAcceptEvents:", 1LL);
  double v3 = v19;
  objc_storeStrong((id *)&v19, 0LL);
  objc_destroyWeak(v18);
  objc_destroyWeak(location);
  return v3;
}

- (void)_handleStateTransitionFrom:(id)a3 toState:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSNowPlayingLingeringController _updateVisibility](v7, "_updateVisibility");
  -[TVSSNowPlayingLingeringController _updateLingeringTimer](v7, "_updateLingeringTimer");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (double)lingeringDuration
{
  return self->_lingeringDuration;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (id)visibilityDidChangeHandler
{
  return self->_visibilityDidChangeHandler;
}

- (void)setVisibilityDidChangeHandler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (int64_t)lastPlaybackState
{
  return self->_lastPlaybackState;
}

- (void)setLastPlaybackState:(int64_t)a3
{
  self->_lastPlaybackState = a3;
}

- (NSTimer)lingeringTimer
{
  return self->_lingeringTimer;
}

- (void).cxx_destruct
{
}

@end