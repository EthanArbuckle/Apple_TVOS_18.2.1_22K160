@interface PBDiagnosticsController
- (BOOL)showSysdiagnoseRunningIndication;
- (PBDiagnosticsController)init;
- (PBDiagnosticsController)initWithUIController:(id)a3 systemGestureManager:(id)a4 screenshotNotificationName:(const char *)a5;
- (PBDiagnosticsUIController)uiController;
- (int)screenshotCapturedNotificationToken;
- (void)_handleBlackScreenRecoveryEvent:(id)a3;
- (void)_handleScreenshotEvent:(id)a3;
- (void)_handleSysdiagnoseEvent:(id)a3;
- (void)_setupSystemKeychordGesturesUsingSystemGestureManager:(id)a3;
- (void)_showScreenshotCapturedIndication;
- (void)dealloc;
- (void)hideSysdiagnoseRunningIndication;
- (void)invalidate;
- (void)showStackShotIndication;
@end

@implementation PBDiagnosticsController

- (PBDiagnosticsController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBDiagnosticsUIController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v5 = -[PBDiagnosticsController initWithUIController:systemGestureManager:screenshotNotificationName:]( self,  "initWithUIController:systemGestureManager:screenshotNotificationName:",  v3,  v4,  "ScreenshotCaptured");

  return v5;
}

- (PBDiagnosticsController)initWithUIController:(id)a3 systemGestureManager:(id)a4 screenshotNotificationName:(const char *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  Class v12 = NSClassFromString(@"PBDiagnosticsUIController");
  if (!v11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276844();
    }
LABEL_23:
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x10006F524LL);
  }

  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBDiagnosticsUIControllerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276B14();
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x10006F588LL);
  }

  id v13 = v10;
  Class v14 = NSClassFromString(@"PBSystemGestureManager");
  if (!v13)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002768F8();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x10006F5ECLL);
  }

  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSystemGestureManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276A60();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x10006F650LL);
  }

  if (!a5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"screenshotNotificationName != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002769AC();
    }
    goto LABEL_23;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PBDiagnosticsController;
  v15 = -[PBDiagnosticsController init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uiController, a3);
    objc_initWeak(&location, v16);
    v17 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006F6D8;
    handler[3] = &unk_1003D2CA8;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(a5, &v16->_screenshotCapturedNotificationToken, &_dispatch_main_q, handler);

    -[PBDiagnosticsController _setupSystemKeychordGesturesUsingSystemGestureManager:]( v16,  "_setupSystemKeychordGesturesUsingSystemGestureManager:",  v13);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)dealloc
{
  if (self->_uiController)
  {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client code must invalidate <%@: %p> before dealloc",  objc_opt_class(self),  self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276BC8();
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBDiagnosticsController;
    -[PBDiagnosticsController dealloc](&v4, "dealloc");
  }

- (void)invalidate
{
  int screenshotCapturedNotificationToken = self->_screenshotCapturedNotificationToken;
  if (screenshotCapturedNotificationToken != -1)
  {
    notify_cancel(screenshotCapturedNotificationToken);
    self->_int screenshotCapturedNotificationToken = -1;
  }

  -[PBDiagnosticsUIController invalidate](self->_uiController, "invalidate");
  uiController = self->_uiController;
  self->_uiController = 0LL;
}

- (BOOL)showSysdiagnoseRunningIndication
{
  char v3 = _BSIsInternalInstall("-[PBDiagnosticsController showSysdiagnoseRunningIndication]", a2);
  if ((v3 & 1) == 0) {
    -[PBDiagnosticsUIController showSysdiagnoseRunningIndication]( self->_uiController,  "showSysdiagnoseRunningIndication");
  }
  return v3 ^ 1;
}

- (void)hideSysdiagnoseRunningIndication
{
}

- (void)showStackShotIndication
{
}

- (void)_showScreenshotCapturedIndication
{
}

- (void)_setupSystemKeychordGesturesUsingSystemGestureManager:(id)a3
{
  id v4 = a3;
  [v4 addSystemKeychordGestureWithPressTypes:&off_1003FE638 minimumPressDuration:self target:"_handleSysdiagnoseEvent:" action:5.0];
  [v4 addSystemKeychordGestureWithPressTypes:&off_1003FE650 minimumPressDuration:self target:"_handleScreenshotEvent:" action:3.0];
  [v4 addSystemKeychordGestureWithPressTypes:&off_1003FE668 minimumPressDuration:self target:"_handleBlackScreenRecoveryEvent:" action:5.0];
}

- (void)_handleSysdiagnoseEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000F6B8C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100276C78(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = [v4 state];
  if (v14 == (id)3)
  {
    id v15 = sub_1000F6B8C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remote triggered sysdiagnose", v17, 2u);
    }

    -[PBDiagnosticsUIController hideSysdiagnoseReleaseKeychordIndication]( self->_uiController,  "hideSysdiagnoseReleaseKeychordIndication");
  }

  else if (v14 == (id)2)
  {
    -[PBDiagnosticsUIController showSysdiagnoseReleaseKeychordIndication]( self->_uiController,  "showSysdiagnoseReleaseKeychordIndication");
  }

- (void)_handleScreenshotEvent:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000F6B8C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100276CE8(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  id v13 = [v3 state];
  if (v13 == (id)2)
  {
    id v14 = sub_1000F6B8C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Remote triggered screenshot", v16, 2u);
    }

    sub_100202CDC(1);
  }

- (void)_handleBlackScreenRecoveryEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000F6B8C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100276D58(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = [v4 state];
  if (v14 == (id)2)
  {
    id v15 = sub_1000F6B8C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Remote triggered black screen recovery",  v18,  2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 postNotificationName:@"ATVHIDSystemClientNotification_StartBSR" object:self];
  }

- (PBDiagnosticsUIController)uiController
{
  return self->_uiController;
}

- (int)screenshotCapturedNotificationToken
{
  return self->_screenshotCapturedNotificationToken;
}

- (void).cxx_destruct
{
}

@end