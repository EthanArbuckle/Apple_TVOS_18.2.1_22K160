@interface MCTVProfileViewController
- (BOOL)_hasRMConfigurations;
- (BOOL)_profileContainsMDMPayload;
- (DMCProfileViewModel)profileViewModel;
- (MCProfile)profile;
- (MCTVProfileViewController)initWithProfile:(id)a3 mode:(int)a4;
- (MCTVProfileViewController)initWithProfileIdentifier:(id)a3;
- (RMUIConfigurationInterface)rmuiConfigInterface;
- (TSKSettingItem)summaryItem;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_ddmSettingGroup;
- (id)_payloadIdentifierForPayloadClass:(Class)a3;
- (id)_payloadIdentifiersForPayloadClass:(Class)a3;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)mode;
- (void)_infoCellSummaryTitles:(id *)a3 values:(id *)a4;
- (void)_setupRMConfigurationsUI;
- (void)dealloc;
- (void)setProfile:(id)a3;
- (void)setRmuiConfigInterface:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCTVProfileViewController

- (MCTVProfileViewController)initWithProfile:(id)a3 mode:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCTVProfileViewController;
  v7 = -[MCTVProfileViewController initWithStyle:](&v11, "initWithStyle:", 1LL);
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    -[MCTVProfileViewController setProfile:](v7, "setProfile:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v8 selector:"reloadSettingsIfNeeded" name:@"kMCUIProfileDidChangeNotification" object:0];
  }

  return v8;
}

- (MCTVProfileViewController)initWithProfileIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 installedProfileWithIdentifier:v4]);

  if (v6)
  {
    self = -[MCTVProfileViewController initWithProfile:mode:](self, "initWithProfile:mode:", v6, 0LL);
    v7 = self;
  }

  else
  {
    id v8 = MCTVLoggingFacility();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "MCTVProfileViewController could not find an installed profile with identifier: %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVProfileViewController;
  -[MCTVProfileViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCTVProfileViewController;
  -[MCTVProfileViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
  id v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)loadSettingGroups
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile signerSummary](self->_profile, "signerSummary"));
  v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v4,  0LL,  self->_profile,  0LL));
  summaryItem = self->_summaryItem;
  self->_summaryItem = v5;

  -[TSKSettingItem setCanFocus:](self->_summaryItem, "setCanFocus:", 0LL);
  -[NSMutableArray addObject:](v3, "addObject:", self->_summaryItem);
  v7 = self->_profileViewModel;
  id v8 = MCUILocalizedString(@"BLOB_DETAILS");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  profileViewModel = self->_profileViewModel;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_FFF8;
  v25[3] = &unk_28A70;
  int v11 = v7;
  v26 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  profileViewModel,  @"moreDetailsSections",  v25));

  [v12 setUpdateBlock:&stru_28C70];
  -[NSMutableArray addObject:](v3, "addObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v3));
  v14 = self->_profileViewModel;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_10080;
  v23 = &unk_28CE0;
  v24 = v11;
  v15 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v14,  @"elevatedPayloadTypes",  &v20));
  v27[0] = v13;
  v27[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController _ddmSettingGroup](self, "_ddmSettingGroup", v20, v21, v22, v23));
  v27[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 3LL));

  return v18;
}

- (id)_ddmSettingGroup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController rmuiConfigInterface](self, "rmuiConfigInterface"));
  id v4 = MCUILocalizedString(@"CONFIGURATIONS");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_103F0;
  v14[3] = &unk_28A70;
  id v6 = v3;
  id v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  v14));

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10420;
  v11[3] = &unk_28810;
  objc_copyWeak(&v12, &location);
  [v7 setUpdateBlock:v11];
  v16 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setProfile:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_profile, a3);
  if (self->_profile)
  {
    v5 = -[DMCProfileViewModel initWithProfile:managedPayloads:]( objc_alloc(&OBJC_CLASS___DMCProfileViewModel),  "initWithProfile:managedPayloads:",  v7,  self->_mode != 1);
    profileViewModel = self->_profileViewModel;
    self->_profileViewModel = v5;
  }

  -[MCTVProfileViewController _setupRMConfigurationsUI](self, "_setupRMConfigurationsUI");
  -[MCTVProfileViewController reloadSettings](self, "reloadSettings");
}

- (BOOL)_hasRMConfigurations
{
  rmuiConfigInterface = self->_rmuiConfigInterface;
  if (!rmuiConfigInterface) {
    return 0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMUIConfigurationInterface profileViewModels](rmuiConfigInterface, "profileViewModels"));
  if ([v4 count])
  {
    char v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMUIConfigurationInterface pluginViewModels](self->_rmuiConfigInterface, "pluginViewModels"));
    char v5 = [v6 count] != 0;
  }

  return v5;
}

- (id)_payloadIdentifierForPayloadClass:(Class)a3
{
  profile = self->_profile;
  if (profile)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile payloads](profile, "payloads", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
          {
            int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            goto LABEL_12;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    int v11 = 0LL;
LABEL_12:
  }

  else
  {
    int v11 = 0LL;
  }

  return v11;
}

- (id)_payloadIdentifiersForPayloadClass:(Class)a3
{
  if (!self->_profile) {
    return 0LL;
  }
  char v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile payloads](self->_profile, "payloads", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  if (-[NSMutableArray count](v5, "count")) {
    __int128 v13 = v5;
  }
  else {
    __int128 v13 = 0LL;
  }
  __int128 v14 = v13;

  return v14;
}

- (BOOL)_profileContainsMDMPayload
{
  id v3 = -[MCTVProfileViewController _payloadIdentifierForPayloadClass:]( self,  "_payloadIdentifierForPayloadClass:",  objc_opt_class(&OBJC_CLASS___MCMDMPayload));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (!v4) {
    return 0;
  }
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 unverifiedInstalledMDMProfileIdentifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
  LOBYTE(v5) = [v7 isEqualToString:v6];

  return (char)v5;
}

- (void)_setupRMConfigurationsUI
{
  if (self->_mode == 1) {
    goto LABEL_2;
  }
  if (-[MCTVProfileViewController _profileContainsMDMPayload](self, "_profileContainsMDMPayload"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    char v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dmc_visibleRemoteManagementAccounts"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    id v7 = objc_alloc(&OBJC_CLASS___RMUIConfigurationInterface);
    id v8 = v7;
    if (!v6)
    {
      id v12 = (RMUIConfigurationInterface *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMUIConfigurationInterface identifier](v12, "identifier"));
      __int128 v14 = -[RMUIConfigurationInterface initWithMDMProfileIdentifier:scope:initialLoad:]( v8,  "initWithMDMProfileIdentifier:scope:initialLoad:",  v13,  1LL,  1LL);
      rmuiConfigInterface = self->_rmuiConfigInterface;
      self->_rmuiConfigInterface = v14;

      goto LABEL_10;
    }

    uint64_t v9 = -[RMUIConfigurationInterface initWithAccount:scope:initialLoad:]( v7,  "initWithAccount:scope:initialLoad:",  v6,  1LL,  1LL);
LABEL_8:
    id v12 = self->_rmuiConfigInterface;
    self->_rmuiConfigInterface = v9;
LABEL_10:

    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v16 addObserver:self selector:"reloadSettings" name:RMUIConfigurationsDidChangeNotification object:0];
    id v3 = (RMUIConfigurationInterface *)v16;
    goto LABEL_11;
  }

  id v10 = -[MCTVProfileViewController _payloadIdentifiersForPayloadClass:]( self,  "_payloadIdentifiersForPayloadClass:",  objc_opt_class(&OBJC_CLASS___MCDeclarationsPayload));
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    id v6 = (void *)v11;
    uint64_t v9 = -[RMUIConfigurationInterface initWithDeclarationsPayloadIdentifiers:scope:initialLoad:]( objc_alloc(&OBJC_CLASS___RMUIConfigurationInterface),  "initWithDeclarationsPayloadIdentifiers:scope:initialLoad:",  v11,  1LL,  1LL);
    goto LABEL_8;
  }

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  if (v8 == self->_summaryItem)
  {
    uint64_t v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
    id v12 = NSStringFromClass(v11);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v13 forIndexPath:v7]);

    id v20 = 0LL;
    id v21 = 0LL;
    -[MCTVProfileViewController _infoCellSummaryTitles:values:](self, "_infoCellSummaryTitles:values:", &v21, &v20);
    id v14 = v21;
    id v15 = v20;
    [v10 setSummaryTitles:v14 withValues:v15];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile friendlyName](self->_profile, "friendlyName"));
    [v10 setHeaderText:v16];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile organization](self->_profile, "organization"));
    [v10 setSubHeaderText:v17];
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___MCTVProfileViewController;
    id v9 = -[MCTVProfileViewController tableView:cellForRowAtIndexPath:](&v19, "tableView:cellForRowAtIndexPath:", v6, v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  char v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  if (v5 == self->_summaryItem) {
    double v6 = UITableViewAutomaticDimension;
  }
  else {
    double v6 = 66.0;
  }

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  char v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  if (v5 == self->_summaryItem) {
    double v6 = 200.0;
  }
  else {
    double v6 = 66.0;
  }

  return v6;
}

- (void)_infoCellSummaryTitles:(id *)a3 values:(id *)a4
{
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile signerSummary](self->_profile, "signerSummary"));
  if ([v9 length])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v9));
    -[NSMutableString appendString:](v7, "appendString:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[DMCProfileViewModel trustTextForProfile:]( &OBJC_CLASS___DMCProfileViewModel,  "trustTextForProfile:",  self->_profile));
  if (v11) {
    -[NSMutableAttributedString appendAttributedString:](v8, "appendAttributedString:", v11);
  }
  v30 = a4;
  id v12 = MCUILocalizedString(@"BLOB_TABLE_SIGNED_BY");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableArray addObject:](v31, "addObject:", v13);

  id v14 = -[NSMutableString copy](v7, "copy");
  -[NSMutableArray addObject:](v6, "addObject:", v14);

  -[NSMutableArray addObject:](v31, "addObject:", @" ");
  id v15 = -[NSMutableAttributedString copy](v8, "copy");
  -[NSMutableArray addObject:](v6, "addObject:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile profileDescription](self->_profile, "profileDescription"));
  if ([v16 length])
  {
    id v17 = MCUILocalizedString(@"BLOB_TABLE_DESCRIPTION");
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableArray addObject:](v31, "addObject:", v18);

    id v19 = [v16 copy];
    -[NSMutableArray addObject:](v6, "addObject:", v19);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[DMCProfileViewModel payloadInfoSectionSummaries]( self->_profileViewModel,  "payloadInfoSectionSummaries"));
  id v21 = [v20 mutableCopy];

  if (-[MCProfile isLocked](self->_profile, "isLocked"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile removalPasscode](self->_profile, "removalPasscode"));
    id v23 = [v22 length];

    if (v23)
    {
      id v24 = MCUILocalizedString(@"PROFILE_REMOVAL_PASSWORD");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [v21 addObject:v25];
    }
  }

  if ([v21 count])
  {
    id v26 = MCUILocalizedString(@"BLOB_TABLE_CONTAINS");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableArray addObject:](v31, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:@"\n"]);
    -[NSMutableArray addObject:](v6, "addObject:", v28);
  }

  if (a3) {
    *a3 = -[NSMutableArray copy](v31, "copy");
  }
  if (v30) {
    id *v30 = -[NSMutableArray copy](v6, "copy");
  }
}

- (MCProfile)profile
{
  return self->_profile;
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (int)mode
{
  return self->_mode;
}

- (TSKSettingItem)summaryItem
{
  return self->_summaryItem;
}

- (RMUIConfigurationInterface)rmuiConfigInterface
{
  return self->_rmuiConfigInterface;
}

- (void)setRmuiConfigInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end