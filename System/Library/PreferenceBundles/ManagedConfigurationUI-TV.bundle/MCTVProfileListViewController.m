@interface MCTVProfileListViewController
+ (id)_keyValueDictionaryForURL:(id)a3;
- (MCTVInstallProfileViewController)installProfileViewController;
- (MCTVProfileListViewController)initWithStyle:(int64_t)a3;
- (NSURL)lastDeepLinkURL;
- (NSURLSessionDataTask)profileLoadTask;
- (id)_configurationProfilesSettingGroupForDataManager:(id)a3;
- (id)externalValue;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_loadProfileDataAtURL:(id)a3;
- (void)_logDataManagerState;
- (void)_mcuiUpdated;
- (void)_showInstallConfigurationProfile;
- (void)_updateTitleAndExternalData;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)installViewController:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)presentActionForDisplayedDeepLinkURL;
- (void)setExternalValue:(id)a3;
- (void)setInstallProfileViewController:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setProfileLoadTask:(id)a3;
@end

@implementation MCTVProfileListViewController

- (MCTVProfileListViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCTVProfileListViewController;
  v3 = -[MCTVProfileListViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    id v4 = +[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager");
    -[MCTVProfileListViewController _logDataManagerState](v3, "_logDataManagerState");
    -[MCTVProfileListViewController _updateTitleAndExternalData](v3, "_updateTitleAndExternalData");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v3 selector:"_mcuiUpdated" name:@"kMCUIUpdatedNotification" object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"kMCUIUpdatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVProfileListViewController;
  -[MCTVProfileListViewController dealloc](&v4, "dealloc");
}

- (void)_mcuiUpdated
{
  id v3 = MCTVLoggingFacility();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "MCUI updated", v5, 2u);
  }

  -[MCTVProfileListViewController _logDataManagerState](self, "_logDataManagerState");
  -[MCTVProfileListViewController _updateTitleAndExternalData](self, "_updateTitleAndExternalData");
  -[MCTVProfileListViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)loadSettingGroups
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager"));
  id v4 = MCUILocalizedString(@"ADD_PROFILE_BUTTON_TITLE");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_DD7C;
  v27[3] = &unk_28A70;
  v27[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  v27));

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_DE24;
  v24[3] = &unk_28810;
  objc_copyWeak(&v25, &location);
  [v20 setUpdateBlock:v24];
  v30 = v20;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"blockedApplications",  &stru_28AD0));
  [v7 setUpdateBlock:&stru_28AF0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_DFD8;
  v21[3] = &unk_28B18;
  id v8 = v3;
  id v22 = v8;
  objc_copyWeak(&v23, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  v8,  @"mdmProfileInfo",  v21));
  [v9 setUpdateBlock:&stru_28B38];
  id v10 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v29 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v11,  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVProfileListViewController _configurationProfilesSettingGroupForDataManager:]( self,  "_configurationProfilesSettingGroupForDataManager:",  v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v8,  @"enterpriseAppSigners",  &stru_28B58));
  [v15 setUpdateBlock:&stru_28B78];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v8,  @"freeDeveloperAppSigners",  &stru_28B98));
  [v16 setUpdateBlock:&stru_28BB8];
  v28[0] = v19;
  v28[1] = v7;
  v28[2] = v13;
  v28[3] = v14;
  v28[4] = v15;
  v28[5] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 6LL));

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

- (id)_configurationProfilesSettingGroupForDataManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_E71C;
  id v10 = &unk_28BE0;
  objc_copyWeak(&v11, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"configurationProfilesInfo",  &v7));
  objc_msgSend(v5, "setUpdateBlock:", &stru_28C00, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCTVProfileListViewController;
  id v4 = -[MCTVProfileListViewController previewForItemAtIndexPath:](&v12, "previewForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileListViewController tableView](self, "tableView"));
    id v8 = [v7 numberOfSections];

    if (!v8)
    {
      id v9 = MCUILocalizedString(@"NO_PROFILES_INSTALLED");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [v5 setDescriptionText:v10];
    }
  }

  return v5;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)v9;
  objc_super v12 = v11;
  if (v11
    && ((v13 = v11, (-[os_log_s hasPrefix:](v11, "hasPrefix:", @"http://") & 1) != 0)
     || (v13 = v12, (-[os_log_s hasPrefix:](v12, "hasPrefix:", @"https://") & 1) != 0)
     || (v13 = v12, (-[os_log_s hasPrefix:](v12, "hasPrefix:", @"file://") & 1) != 0)
     || (v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"http://" stringByAppendingString:v12]),
         v12,
         v13)))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13));
    if (v14)
    {
      -[MCTVProfileListViewController _loadProfileDataAtURL:](self, "_loadProfileDataAtURL:", v14);
    }

    else
    {
      id v16 = MCTVLoggingFacility();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        v19 = v13;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "MCTVProfileListViewController Error: Cannot convert URL string '%{public}@' to URL",  (uint8_t *)&v18,  0xCu);
      }
    }
  }

  else
  {
    id v15 = MCTVLoggingFacility();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = v12;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "MCTVProfileListViewController Error: Cannot convert provided value '%{public}@' to URL",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)presentActionForDisplayedDeepLinkURL
{
  id v3 = [(id)objc_opt_class(self) _keyValueDictionaryForURL:self->_lastDeepLinkURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"path"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  else {
    [v5 isEqualToString:kMCSettingsURLProfileErrorComponent];
  }
}

- (void)installViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileListViewController navigationController](self, "navigationController", a3, a4));
  id v6 = [v5 popToViewController:self animated:1];

  -[MCTVProfileListViewController setInstallProfileViewController:](self, "setInstallProfileViewController:", 0LL);
}

- (void)_showInstallConfigurationProfile
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_EDBC;
  block[3] = &unk_288C8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_loadProfileDataAtURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  [v5 setRequestCachePolicy:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v5));
  objc_initWeak(&location, self);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_EFBC;
  objc_super v12 = &unk_28C50;
  objc_copyWeak(&v13, &location);
  objc_super v7 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue([v6 dataTaskWithURL:v4 completionHandler:&v9]);
  profileLoadTask = self->_profileLoadTask;
  self->_profileLoadTask = v7;

  -[NSURLSessionDataTask resume](self->_profileLoadTask, "resume", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateTitleAndExternalData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager"));
  id v30 = 0LL;
  id v31 = 0LL;
  id v28 = 0LL;
  id v29 = 0LL;
  id v27 = 0LL;
  [v2 allDeviceManagementOutMDMProfileInfo:&v31 outConfigurationProfilesInfo:&v30 outUninstalledProfilesInfo:0 outEnterpriseAppSigners :&v29 outFreeDevAppSigners:&v28 outBlockedApplications:&v27];
  unint64_t v3 = (unint64_t)v31;
  id v24 = v30;
  id v4 = v29;
  id v5 = v28;
  id v6 = v27;

  id v7 = [v24 count];
  id v8 = (char *)[v4 count];
  unint64_t v9 = (unint64_t)&v8[(void)[v5 count]];
  uint64_t v10 = (char *)[v6 count];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager"));
  id v12 = [v11 isProfileSectionEmpty];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager"));
  v14 = (char *)[v13 itemCount];

  id v15 = @"SINGULAR_BLOBS_DESIGNATION";
  id v16 = @"DEVICE_MANAGEMENT";
  if (v9) {
    v17 = @"DEVICE_MANAGEMENT";
  }
  else {
    v17 = @"SINGULAR_BLOBS_DESIGNATION";
  }
  if (v3) {
    v17 = @"DEVICE_MANAGEMENT";
  }
  if (v10 != (_BYTE *)&dword_0 + 1) {
    id v16 = v17;
  }
  if (v14 == (_BYTE *)&dword_0 + 1) {
    id v15 = v16;
  }
  if (v3 | v9) {
    int v18 = @"PLURAL_PROFILES_WITH_DEVICE_MANAGEMENT";
  }
  else {
    int v18 = @"PLURAL_BLOBS_DESIGNATION";
  }
  else {
    v19 = (__CFString *)v15;
  }
  id v20 = MCUILocalizedString(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v32[0] = @"localizedTitle";
  v32[1] = @"localizedValue";
  v33[0] = v21;
  v33[1] = &stru_29488;
  v32[2] = @"hidden";
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  v33[2] = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));

  -[MCTVProfileListViewController setExternalValue:](self, "setExternalValue:", v23);
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCTVProfileListViewController;
  -[MCTVProfileListViewController setTitle:](&v26, "setTitle:", v21);
}

+ (id)_keyValueDictionaryForURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"&"]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v11),  "componentsSeparatedByString:",  @"=",  (void)v17));
        if ([v12 count] == (char *)&dword_0 + 2)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByRemovingPercentEncoding]);

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
          [v4 setObject:v14 forKey:v15];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v4;
}

- (void)_logDataManagerState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCUIDataManager sharedManager](&OBJC_CLASS___MCUIDataManager, "sharedManager"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_F7BC;
  id v11 = &unk_28880;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  v2));
  id v12 = v3;
  id v13 = v2;
  id v4 = v2;
  [v3 appendBodySectionWithName:@"MCUIDataManager" multilinePrefix:0 block:&v8];
  id v5 = MCTVLoggingFacility();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build", v8, v9, v10, v11, v12, v13));
    *(_DWORD *)buf = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MCUIDataManager {state=%{public}@}", buf, 0xCu);
  }
}

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (NSURLSessionDataTask)profileLoadTask
{
  return self->_profileLoadTask;
}

- (void)setProfileLoadTask:(id)a3
{
}

- (id)externalValue
{
  return self->_externalValue;
}

- (void)setExternalValue:(id)a3
{
}

- (MCTVInstallProfileViewController)installProfileViewController
{
  return self->_installProfileViewController;
}

- (void)setInstallProfileViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end