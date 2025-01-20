@interface PBSystemAppSettings
+ (id)sharedInstance;
- (BOOL)appSwitcherAllowed;
- (BOOL)controlCenterAllowed;
- (BOOL)idleTimerAllowed;
- (BOOL)inputAllowed;
- (BOOL)siriAndDictationAllowed;
- (BOOL)systemDialogsAllowed;
- (BOOL)systemNowPlayingAllowed;
- (PBAppInfoConfiguration)currentConfiguration;
- (PBSystemAppSettings)init;
- (void)setAppSwitcherAllowed:(BOOL)a3;
- (void)setControlCenterAllowed:(BOOL)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setIdleTimerAllowed:(BOOL)a3;
- (void)setInputAllowed:(BOOL)a3;
- (void)setSiriAndDictationAllowed:(BOOL)a3;
- (void)setSystemDialogsAllowed:(BOOL)a3;
- (void)setSystemNowPlayingAllowed:(BOOL)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PBSystemAppSettings

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F24BC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471468 != -1) {
    dispatch_once(&qword_100471468, block);
  }
  return (id)qword_100471460;
}

- (PBSystemAppSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSystemAppSettings;
  v2 = -[PBSystemAppSettings init](&v5, "init");
  v3 = (PBSystemAppSettings *)v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 11) = 16843009;
    *((_DWORD *)v2 + 2) = 16843009;
    [v2 updateWithConfiguration:0];
  }

  return v3;
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 singleAppModeOptions]);
  v6 = (void *)v5;
  v7 = &__NSDictionary0__struct;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"InputAllowed", 1);
  if (self->_inputAllowed != (_DWORD)v9) {
    -[PBSystemAppSettings setInputAllowed:](self, "setInputAllowed:", v9);
  }
  id v10 = objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"IdleTimerAllowed", 1);
  if (self->_idleTimerAllowed != (_DWORD)v10) {
    -[PBSystemAppSettings setIdleTimerAllowed:](self, "setIdleTimerAllowed:", v10);
  }
  if (objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"AppSwitcherAllowed", 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v12 = [v11 isAppSwitcherEnabled];
  }

  else
  {
    id v12 = 0LL;
  }

  if (self->_appSwitcherAllowed != (_DWORD)v12) {
    -[PBSystemAppSettings setAppSwitcherAllowed:](self, "setAppSwitcherAllowed:", v12);
  }
  id v13 = objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"ControlCenterAllowed", 1);
  if (self->_controlCenterAllowed != (_DWORD)v13) {
    -[PBSystemAppSettings setControlCenterAllowed:](self, "setControlCenterAllowed:", v13);
  }
  id v14 = objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"SiriAndDictationAllowed", 1);
  if (self->_siriAndDictationAllowed != (_DWORD)v14) {
    -[PBSystemAppSettings setSiriAndDictationAllowed:](self, "setSiriAndDictationAllowed:", v14);
  }
  if (objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"SystemDialogsAllowed", 1))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v16 = [v15 dialogsEnabled];
  }

  else
  {
    id v16 = 0LL;
  }

  if (self->_systemDialogsAllowed != (_DWORD)v16) {
    -[PBSystemAppSettings setSystemDialogsAllowed:](self, "setSystemDialogsAllowed:", v16);
  }
  if (objc_msgSend(v8, "tvs_BOOLForKey:defaultValue:", @"SystemNowPlayingAllowed", 1))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v18 = [v17 nowPlayingUIEnabled];
  }

  else
  {
    id v18 = 0LL;
  }

  if (self->_systemNowPlayingAllowed != (_DWORD)v18) {
    -[PBSystemAppSettings setSystemNowPlayingAllowed:](self, "setSystemNowPlayingAllowed:", v18);
  }
  -[PBSystemAppSettings setCurrentConfiguration:](self, "setCurrentConfiguration:", v4);
}

- (BOOL)inputAllowed
{
  return self->_inputAllowed;
}

- (void)setInputAllowed:(BOOL)a3
{
  self->_inputAllowed = a3;
}

- (BOOL)appSwitcherAllowed
{
  return self->_appSwitcherAllowed;
}

- (void)setAppSwitcherAllowed:(BOOL)a3
{
  self->_appSwitcherAllowed = a3;
}

- (BOOL)controlCenterAllowed
{
  return self->_controlCenterAllowed;
}

- (void)setControlCenterAllowed:(BOOL)a3
{
  self->_controlCenterAllowed = a3;
}

- (BOOL)idleTimerAllowed
{
  return self->_idleTimerAllowed;
}

- (void)setIdleTimerAllowed:(BOOL)a3
{
  self->_idleTimerAllowed = a3;
}

- (BOOL)siriAndDictationAllowed
{
  return self->_siriAndDictationAllowed;
}

- (void)setSiriAndDictationAllowed:(BOOL)a3
{
  self->_siriAndDictationAllowed = a3;
}

- (BOOL)systemDialogsAllowed
{
  return self->_systemDialogsAllowed;
}

- (void)setSystemDialogsAllowed:(BOOL)a3
{
  self->_systemDialogsAllowed = a3;
}

- (BOOL)systemNowPlayingAllowed
{
  return self->_systemNowPlayingAllowed;
}

- (void)setSystemNowPlayingAllowed:(BOOL)a3
{
  self->_systemNowPlayingAllowed = a3;
}

- (PBAppInfoConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end