@interface PBInternationalizationManager
- (PBDisplayManager)displayManager;
- (PBInternationalizationManager)initWithSceneManager:(id)a3 userProfileManager:(id)a4 displayManager:(id)a5;
- (PBLanguageChangeObserver)languageChangeObserver;
- (PBSceneManager)sceneManager;
- (PBUserProfileManager)userProfileManager;
- (PLInternationalizationService)internationalizationService;
- (unint64_t)regionChangeTimestamp;
- (void)_languageDidChange;
- (void)dealloc;
- (void)internationalizationService:(id)a3 client:(id)a4 setDeviceRegion:(id)a5 changePrimaryLanguage:(BOOL)a6 completion:(id)a7;
- (void)internationalizationService:(id)a3 client:(id)a4 setPreferredLanguages:(id)a5 withVariants:(id)a6 completion:(id)a7;
- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5 source:(int64_t)a6;
- (void)observerDidObserveRegionWillChange:(id)a3;
@end

@implementation PBInternationalizationManager

- (PBInternationalizationManager)initWithSceneManager:(id)a3 userProfileManager:(id)a4 displayManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  Class v13 = NSClassFromString(@"PBSceneManager");
  if (!v12)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AA84();
    }
LABEL_27:
    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A0E1CLL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSceneManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AA84();
    }
    _bs_set_crash_log_message([v30 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A0E80LL);
  }

  id v14 = v10;
  Class v15 = NSClassFromString(@"PBUserProfileManager");
  if (!v14)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AB34();
    }
    _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A0EE4LL);
  }

  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBUserProfileManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AB34();
    }
    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A0F48LL);
  }

  id v16 = v11;
  Class v17 = NSClassFromString(@"PBDisplayManager");
  if (!v16)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028ABE4();
    }
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A0FACLL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBDisplayManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028ABE4();
    }
    goto LABEL_27;
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PBInternationalizationManager;
  v18 = -[PBInternationalizationManager init](&v34, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sceneManager, a3);
    objc_storeStrong((id *)&v19->_userProfileManager, a4);
    objc_storeStrong((id *)&v19->_displayManager, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v19->_userInterfaceLayoutDirection = (int64_t)[v20 userInterfaceLayoutDirection];

    v21 = objc_alloc_init(&OBJC_CLASS___PBLanguageChangeObserver);
    languageChangeObserver = v19->_languageChangeObserver;
    v19->_languageChangeObserver = v21;

    uint64_t v23 = (uint64_t)v19->_languageChangeObserver;
    id v24 = sub_1000F6754();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    sub_1000B3E30(v23, v25);

    -[PBLanguageChangeObserver setDelegate:](v19->_languageChangeObserver, "setDelegate:", v19);
    v26 = -[PLInternationalizationService initWithCalloutQueue:]( objc_alloc(&OBJC_CLASS___PLInternationalizationService),  "initWithCalloutQueue:",  &_dispatch_main_q);
    internationalizationService = v19->_internationalizationService;
    v19->_internationalizationService = v26;

    -[PLInternationalizationService setDelegate:](v19->_internationalizationService, "setDelegate:", v19);
    -[PLInternationalizationService activate](v19->_internationalizationService, "activate");
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBInternationalizationManager;
  -[PBInternationalizationManager dealloc](&v3, "dealloc");
}

- (void)internationalizationService:(id)a3 client:(id)a4 setDeviceRegion:(id)a5 changePrimaryLanguage:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  Class v13 = (void *)objc_claimAutoreleasedReturnValue([v12 countryCode]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
  Class v15 = (void *)objc_claimAutoreleasedReturnValue([v14 preferredLanguages]);
  id v16 = [v15 copy];

  Class v17 = (void *)objc_claimAutoreleasedReturnValue([v14 preferredInputModeList]);
  id v18 = [v17 copy];

  [v14 setRegion:v10 updateFirstLanguage:v8];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 preferredLanguages]);
  id v20 = [v19 isEqual:v16];
  char v21 = (char)v20;
  uint64_t v22 = TVCSLanguageLog(v20);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v41 = v13;
    __int16 v42 = 2114;
    id v43 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Changing device region from %{public}@ to %{public}@",  buf,  0x16u);
  }

  userProfileManager = self->_userProfileManager;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001A12F8;
  v35[3] = &unk_1003DB028;
  id v36 = v16;
  id v37 = v18;
  id v38 = v14;
  id v39 = v10;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1001A1688;
  v30[3] = &unk_1003DB050;
  char v34 = v21 ^ 1;
  id v31 = v39;
  id v32 = v38;
  id v33 = v11;
  id v25 = v11;
  id v26 = v38;
  id v27 = v39;
  id v28 = v18;
  id v29 = v16;
  -[PBUserProfileManager _performBatchUpdatesUsingBlock:completion:]( userProfileManager,  "_performBatchUpdatesUsingBlock:completion:",  v35,  v30);
}

- (void)internationalizationService:(id)a3 client:(id)a4 setPreferredLanguages:(id)a5 withVariants:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"languageIdentifiers != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AD08();
    }
    _bs_set_crash_log_message([v25 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A19F0LL);
  }

  Class v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
  [v18 setPreferredLanguages:v14 withVariants:v15];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 preferredLanguages]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 preferredInputModeList]);
  uint64_t v20 = TVCSLanguageLog(v26);
  char v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Change language: {preferredLanguages=%{public}@, inputModes=%{public}@}",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v35 = sub_1001A1A18;
  id v36 = sub_1001A1A28;
  id v37 = 0LL;
  userProfileManager = self->_userProfileManager;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001A1A40;
  v31[3] = &unk_1003DB078;
  id v33 = buf;
  id v32 = v18;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001A1B84;
  v27[3] = &unk_1003DB0A0;
  v30 = buf;
  id v23 = v32;
  id v28 = v23;
  id v24 = v17;
  id v29 = v24;
  -[PBUserProfileManager _performBatchUpdatesUsingBlock:completion:]( userProfileManager,  "_performBatchUpdatesUsingBlock:completion:",  v31,  v27);

  _Block_object_dispose(buf, 8);
}

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5 source:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfileApplicationManager sharedInstance]( &OBJC_CLASS___PBUserProfileApplicationManager,  "sharedInstance"));
    id v12 = v11;
    switch(a6)
    {
      case 2LL:
        goto LABEL_6;
      case 1LL:
LABEL_13:
        id v23 = objc_alloc_init(&OBJC_CLASS___PBApplicationLanguageChangeTransaction);
LABEL_14:
        -[PBApplicationLanguageChangeTransaction setLanguageChange:](v23, "setLanguageChange:", 1LL);
        -[PBApplicationLanguageChangeTransaction setLocaleChange:](v23, "setLocaleChange:", v7);
        -[PBApplicationLanguageChangeTransaction begin](v23, "begin");
LABEL_29:
        if ((sub_1001C9BFC() & 1) == 0)
        {
          id v38 = self->_displayManager;
          dispatch_time_t v39 = dispatch_time(0LL, 2000000000LL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001A21C4;
          block[3] = &unk_1003CFF08;
          v44 = v38;
          v40 = v38;
          dispatch_after(v39, &_dispatch_main_q, block);
        }

- (void)observerDidObserveRegionWillChange:(id)a3
{
  uint64_t v4 = sub_1000B3E24((uint64_t)a3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Region will change", v6, 2u);
  }

  self->_unint64_t regionChangeTimestamp = mach_absolute_time();
}

- (void)_languageDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v4 = [v3 userInterfaceLayoutDirection];

  if (v4 != (id)self->_userInterfaceLayoutDirection)
  {
    self->_userInterfaceLayoutDirection = (int64_t)v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 postNotificationName:@"kPBUserInterfaceLayoutDirectionChangedNotification" object:self];
  }

- (unint64_t)regionChangeTimestamp
{
  return self->_regionChangeTimestamp;
}

- (PLInternationalizationService)internationalizationService
{
  return self->_internationalizationService;
}

- (PBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (PBUserProfileManager)userProfileManager
{
  return self->_userProfileManager;
}

- (PBDisplayManager)displayManager
{
  return self->_displayManager;
}

- (PBLanguageChangeObserver)languageChangeObserver
{
  return self->_languageChangeObserver;
}

- (void).cxx_destruct
{
}

@end