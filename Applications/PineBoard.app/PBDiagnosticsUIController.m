@interface PBDiagnosticsUIController
+ (id)_newScreenshotCapturedBulletin;
+ (id)_newStackshotBulletin;
+ (id)_newSysdiagnoseReleaseKeychordBulletin;
+ (id)_newSysdiagnoseRunningBulletin;
- (PBBulletinService)bulletinService;
- (PBDiagnosticsUIController)init;
- (PBDiagnosticsUIController)initWithBulletinService:(id)a3;
- (PBSBulletin)screenshotCapturedBulletin;
- (PBSBulletin)sysdiagnoseReleaseKeychordBulletin;
- (PBSBulletin)sysdiagnoseRunningBulletin;
- (void)_didDismissBulletin:(id)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)dealloc;
- (void)hideSysdiagnoseReleaseKeychordIndication;
- (void)hideSysdiagnoseRunningIndication;
- (void)invalidate;
- (void)showScreenshotCapturedIndication;
- (void)showStackShotIndication;
- (void)showSysdiagnoseReleaseKeychordIndication;
- (void)showSysdiagnoseRunningIndication;
@end

@implementation PBDiagnosticsUIController

- (PBDiagnosticsUIController)init
{
  v3 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
  v4 = -[PBDiagnosticsUIController initWithBulletinService:](self, "initWithBulletinService:", v3);

  return v4;
}

- (PBDiagnosticsUIController)initWithBulletinService:(id)a3
{
  id v6 = a3;
  Class v7 = NSClassFromString(@"PBBulletinService");
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283804(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
    JUMPOUT(0x100125590LL);
  }

  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBBulletinServiceClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283804(a2);
    }
    goto LABEL_11;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBDiagnosticsUIController;
  v8 = -[PBDiagnosticsUIController init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bulletinService, a3);
    -[PBBulletinService setDelegate:](v9->_bulletinService, "setDelegate:", v9);
  }

  return v9;
}

- (void)dealloc
{
  if (self->_bulletinService)
  {
    v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client code must invalidate <%@: %p> before dealloc",  objc_opt_class(self),  self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002838A8(a2);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBDiagnosticsUIController;
    -[PBDiagnosticsUIController dealloc](&v5, "dealloc");
  }

- (void)invalidate
{
  bulletinService = self->_bulletinService;
  self->_bulletinService = 0LL;
}

- (void)showSysdiagnoseReleaseKeychordIndication
{
  if (!self->_sysdiagnoseReleaseKeychordBulletin)
  {
    id v3 = sub_1000F6C04();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)Class v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Posting sysdiagnose release keychord bulletin",  v7,  2u);
    }

    objc_super v5 = (PBSBulletin *)[(id)objc_opt_class(self) _newSysdiagnoseReleaseKeychordBulletin];
    sysdiagnoseReleaseKeychordBulletin = self->_sysdiagnoseReleaseKeychordBulletin;
    self->_sysdiagnoseReleaseKeychordBulletin = v5;

    -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  self->_sysdiagnoseReleaseKeychordBulletin,  0LL);
  }

- (void)hideSysdiagnoseReleaseKeychordIndication
{
  if (self->_sysdiagnoseReleaseKeychordBulletin)
  {
    -[PBBulletinService dismissBulletin:](self->_bulletinService, "dismissBulletin:");
    sysdiagnoseReleaseKeychordBulletin = self->_sysdiagnoseReleaseKeychordBulletin;
    self->_sysdiagnoseReleaseKeychordBulletin = 0LL;
  }

- (void)showSysdiagnoseRunningIndication
{
  sysdiagnoseRunningBulletin = self->_sysdiagnoseRunningBulletin;
  id v4 = sub_1000F6C04();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (sysdiagnoseRunningBulletin)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100283964(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Posting sysdiagnose running bulletin", v16, 2u);
    }

    v14 = (PBSBulletin *)[(id)objc_opt_class(self) _newSysdiagnoseRunningBulletin];
    v15 = self->_sysdiagnoseRunningBulletin;
    self->_sysdiagnoseRunningBulletin = v14;

    -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  self->_sysdiagnoseRunningBulletin,  0LL);
  }

- (void)hideSysdiagnoseRunningIndication
{
  if (self->_sysdiagnoseRunningBulletin)
  {
    -[PBBulletinService dismissBulletin:](self->_bulletinService, "dismissBulletin:");
    sysdiagnoseRunningBulletin = self->_sysdiagnoseRunningBulletin;
    self->_sysdiagnoseRunningBulletin = 0LL;
  }

  else
  {
    id v4 = sub_1000F6C04();
    sysdiagnoseRunningBulletin = (PBSBulletin *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(sysdiagnoseRunningBulletin, OS_LOG_TYPE_ERROR)) {
      sub_100283998(sysdiagnoseRunningBulletin, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)showStackShotIndication
{
  id v3 = [(id)objc_opt_class(self) _newStackshotBulletin];
  -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  v3,  0LL);
}

- (void)showScreenshotCapturedIndication
{
  screenshotCapturedBulletin = self->_screenshotCapturedBulletin;
  id v4 = sub_1000F6C04();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (screenshotCapturedBulletin)
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "New screenshot captured while screenshot captured bulletin already on screen. Squelching repost.",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Posting screenshot captured bulletin",  (uint8_t *)buf,  2u);
    }

    uint64_t v7 = (PBSBulletin *)[(id)objc_opt_class(self) _newScreenshotCapturedBulletin];
    uint64_t v8 = self->_screenshotCapturedBulletin;
    self->_screenshotCapturedBulletin = v7;

    objc_initWeak(buf, self);
    bulletinService = self->_bulletinService;
    uint64_t v10 = self->_screenshotCapturedBulletin;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100125A64;
    v11[3] = &unk_1003D01C0;
    objc_copyWeak(&v12, buf);
    -[PBBulletinService presentBulletin:withCompletion:](bulletinService, "presentBulletin:withCompletion:", v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100125BC4;
  v6[3] = &unk_1003CFEB8;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)_didDismissBulletin:(id)a3
{
  id v4 = (PBSBulletin *)a3;
  id v5 = v4;
  if (self->_sysdiagnoseReleaseKeychordBulletin == v4)
  {
    self->_sysdiagnoseReleaseKeychordBulletin = 0LL;
  }

  if (self->_sysdiagnoseRunningBulletin == v5)
  {
    self->_sysdiagnoseRunningBulletin = 0LL;
  }

  if (self->_screenshotCapturedBulletin == v5)
  {
    self->_screenshotCapturedBulletin = 0LL;
  }
}

+ (id)_newSysdiagnoseReleaseKeychordBulletin
{
  v2 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setViewControllerClassName:]( v2,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v2, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  v10[0] = &off_1003FDBA8;
  v9[0] = PBSSystemBulletinStyleKey;
  v9[1] = PBSSystemBulletinTitleKey;
  id v3 = sub_1001C307C(@"RunningSysdiagnoseTitle", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[1] = v4;
  v9[2] = PBSSystemBulletinMessageKey;
  id v5 = sub_1001C307C(@"ReleaseSysdiagnoseKeychordMessage", 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[3] = PBSSystemBulletinTimeoutKey;
  v10[2] = v6;
  v10[3] = &off_1003FEB10;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  -[PBSBulletin setMessage:](v2, "setMessage:", v7);

  return v2;
}

+ (id)_newSysdiagnoseRunningBulletin
{
  v2 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setViewControllerClassName:]( v2,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v2, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  v8[0] = &off_1003FDBA8;
  v7[0] = PBSSystemBulletinStyleKey;
  v7[1] = PBSSystemBulletinTitleKey;
  id v3 = sub_1001C307C(@"RunningSysdiagnoseTitle", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[2] = PBSSystemBulletinTimeoutKey;
  v8[1] = v4;
  v8[2] = &off_1003FEB20;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));
  -[PBSBulletin setMessage:](v2, "setMessage:", v5);

  return v2;
}

+ (id)_newScreenshotCapturedBulletin
{
  v2 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setViewControllerClassName:]( v2,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v2, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  v7[0] = PBSSystemBulletinStyleKey;
  v7[1] = PBSSystemBulletinImageIDKey;
  v8[0] = &off_1003FDBA8;
  v8[1] = PBSSystemBulletinImageIDScreenshot;
  v7[2] = PBSSystemBulletinTitleKey;
  id v3 = sub_1001C307C(@"ScreenshotCapturedTitle", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  void v7[3] = PBSSystemBulletinTimeoutKey;
  v8[2] = v4;
  void v8[3] = &off_1003FEB10;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  -[PBSBulletin setMessage:](v2, "setMessage:", v5);

  return v2;
}

+ (id)_newStackshotBulletin
{
  v2 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setViewControllerClassName:]( v2,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v2, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  v10[0] = &off_1003FDBA8;
  v9[0] = PBSSystemBulletinStyleKey;
  v9[1] = PBSSystemBulletinTitleKey;
  id v3 = sub_1001C307C(@"StackShotTakenTitle", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[1] = v4;
  v9[2] = PBSSystemBulletinMessageKey;
  id v5 = sub_1001C307C(@"StackShotTakenSubtitle", 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[3] = PBSSystemBulletinTimeoutKey;
  v10[2] = v6;
  v10[3] = &off_1003FEB30;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  -[PBSBulletin setMessage:](v2, "setMessage:", v7);

  return v2;
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (PBSBulletin)sysdiagnoseReleaseKeychordBulletin
{
  return self->_sysdiagnoseReleaseKeychordBulletin;
}

- (PBSBulletin)sysdiagnoseRunningBulletin
{
  return self->_sysdiagnoseRunningBulletin;
}

- (PBSBulletin)screenshotCapturedBulletin
{
  return self->_screenshotCapturedBulletin;
}

- (void).cxx_destruct
{
}

  ;
}

@end