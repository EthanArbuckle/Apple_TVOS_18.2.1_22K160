@interface TVSettingsHomePodSettingsFacade
+ (id)sharedInstance;
- (BOOL)enhanceDialogue;
- (BOOL)enhanceDialogueIsAvailable;
- (BOOL)reduceLoudSounds;
- (BOOL)reduceLoudSoundsIsAvailable;
- (HPSAccessorySettingService)homePodSettingService;
- (id)_init;
- (void)_processResults:(id)a3 lateNightAvailable:(BOOL)a4 enhanceDialogueAvailable:(BOOL)a5;
- (void)_updateValues;
- (void)setEnhanceDialogue:(BOOL)a3;
- (void)setReduceLoudSounds:(BOOL)a3;
@end

@implementation TVSettingsHomePodSettingsFacade

+ (id)sharedInstance
{
  if (qword_1001E1B50 != -1) {
    dispatch_once(&qword_1001E1B50, &stru_100193CE8);
  }
  return (id)qword_1001E1B48;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsHomePodSettingsFacade;
  v2 = -[TVSettingsHomePodSettingsFacade init](&v6, "init");
  if (v2)
  {
    v3 = -[HPSAccessorySettingService initWithDelegate:]( objc_alloc(&OBJC_CLASS___HPSAccessorySettingService),  "initWithDelegate:",  v2);
    homePodSettingService = v2->_homePodSettingService;
    v2->_homePodSettingService = v3;

    -[TVSettingsHomePodSettingsFacade _updateValues](v2, "_updateValues");
  }

  return v2;
}

- (void)setEnhanceDialogue:(BOOL)a3
{
  if (self->_enhanceDialogue != a3)
  {
    BOOL v3 = a3;
    self->_enhanceDialogue = a3;
    objc_initWeak(&location, self);
    BOOL reduceLoudSoundsIsAvailable = self->_reduceLoudSoundsIsAvailable;
    BOOL enhanceDialogueIsAvailable = self->_enhanceDialogueIsAvailable;
    id v7 = objc_alloc(&OBJC_CLASS___HPSBooleanSetting);
    uint64_t v8 = HPSKeyPathEnhanceDialog;
    id v9 = [v7 initWithKeyPath:HPSKeyPathEnhanceDialog BOOLeanValue:v3];
    homePodSettingService = self->_homePodSettingService;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C0428;
    v11[3] = &unk_100193D10;
    objc_copyWeak(&v12, &location);
    BOOL v13 = reduceLoudSoundsIsAvailable;
    BOOL v14 = enhanceDialogueIsAvailable;
    -[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]( homePodSettingService,  "updateSettingForKeyPath:setting:completionHandler:",  v8,  v9,  v11);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

- (void)setReduceLoudSounds:(BOOL)a3
{
  if (self->_reduceLoudSounds != a3)
  {
    BOOL v3 = a3;
    self->_reduceLoudSounds = a3;
    objc_initWeak(&location, self);
    BOOL reduceLoudSoundsIsAvailable = self->_reduceLoudSoundsIsAvailable;
    BOOL enhanceDialogueIsAvailable = self->_enhanceDialogueIsAvailable;
    id v7 = objc_alloc(&OBJC_CLASS___HPSBooleanSetting);
    uint64_t v8 = HPSKeyPathLateNightMode;
    id v9 = [v7 initWithKeyPath:HPSKeyPathLateNightMode BOOLeanValue:v3];
    homePodSettingService = self->_homePodSettingService;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C05A0;
    v11[3] = &unk_100193D10;
    objc_copyWeak(&v12, &location);
    BOOL v13 = reduceLoudSoundsIsAvailable;
    BOOL v14 = enhanceDialogueIsAvailable;
    -[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]( homePodSettingService,  "updateSettingForKeyPath:setting:completionHandler:",  v8,  v9,  v11);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

- (void)_updateValues
{
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  char v28 = 0;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_1000C0938;
  v23[4] = sub_1000C0948;
  id v24 = 0LL;
  BOOL v3 = dispatch_group_create();
  if (_os_feature_enabled_impl("HomePodSettings", "LMLNM"))
  {
    dispatch_group_enter(v3);
    homePodSettingService = self->_homePodSettingService;
    uint64_t v5 = HPSKeyPathLateNightMode;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000C0950;
    v20[3] = &unk_100193D60;
    v22 = v27;
    v21 = v3;
    -[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]( homePodSettingService,  "isSettingAvailableForKeyPath:completionHandler:",  v5,  v20);
  }

  if ((_os_feature_enabled_impl("HomePodSettings", "LMED") & 1) != 0)
  {
    dispatch_group_enter(v3);
    objc_super v6 = self->_homePodSettingService;
    uint64_t v7 = HPSKeyPathEnhanceDialog;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000C09D8;
    v17[3] = &unk_100193D60;
    v19 = v25;
    v18 = v3;
    -[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]( v6,  "isSettingAvailableForKeyPath:completionHandler:",  v7,  v17);
  }

  else
  {
    uint64_t v7 = HPSKeyPathEnhanceDialog;
  }

  dispatch_group_enter(v3);
  uint64_t v8 = self->_homePodSettingService;
  v29[0] = HPSKeyPathLateNightMode;
  v29[1] = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C0A60;
  v14[3] = &unk_100193DB0;
  v16 = v23;
  v10 = v3;
  v15 = v10;
  -[HPSAccessorySettingService settingsForKeyPaths:completionHandler:]( v8,  "settingsForKeyPaths:completionHandler:",  v9,  v14);

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C0B34;
  v11[3] = &unk_100193DD8;
  objc_copyWeak(&v12, &location);
  void v11[4] = v23;
  v11[5] = v27;
  v11[6] = v25;
  dispatch_group_notify(v10, &_dispatch_main_q, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (void)_processResults:(id)a3 lateNightAvailable:(BOOL)a4 enhanceDialogueAvailable:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C0C68;
  v10[3] = &unk_100191910;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  BOOL v13 = a4;
  BOOL v14 = a5;
  BSDispatchMain(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)enhanceDialogue
{
  return self->_enhanceDialogue;
}

- (BOOL)enhanceDialogueIsAvailable
{
  return self->_enhanceDialogueIsAvailable;
}

- (BOOL)reduceLoudSounds
{
  return self->_reduceLoudSounds;
}

- (BOOL)reduceLoudSoundsIsAvailable
{
  return self->_reduceLoudSoundsIsAvailable;
}

- (HPSAccessorySettingService)homePodSettingService
{
  return self->_homePodSettingService;
}

- (void).cxx_destruct
{
}

@end