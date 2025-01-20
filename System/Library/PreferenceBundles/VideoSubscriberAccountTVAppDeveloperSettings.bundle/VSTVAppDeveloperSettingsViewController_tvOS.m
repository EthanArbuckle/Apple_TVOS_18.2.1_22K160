@interface VSTVAppDeveloperSettingsViewController_tvOS
- (BOOL)loading;
- (NSDictionary)groupedDeveloperAccounts;
- (VSRemoteNotifier)remoteNotifier;
- (VSTVAppDeveloperSettingsViewController_tvOS)initWithCoder:(id)a3;
- (VSTVAppDeveloperSettingsViewController_tvOS)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)fetchAccounts;
- (void)setGroupedDeveloperAccounts:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSTVAppDeveloperSettingsViewController_tvOS

- (VSTVAppDeveloperSettingsViewController_tvOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsViewController_tvOS;
  v3 = -[VSTVAppDeveloperSettingsViewController_tvOS initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    sub_3D3C(v3);
  }
  return v4;
}

- (VSTVAppDeveloperSettingsViewController_tvOS)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsViewController_tvOS;
  v3 = -[VSTVAppDeveloperSettingsViewController_tvOS initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    sub_3D3C(v3);
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsViewController_tvOS;
  -[VSTVAppDeveloperSettingsViewController_tvOS viewDidLoad](&v3, "viewDidLoad");
  -[VSTVAppDeveloperSettingsViewController_tvOS fetchAccounts](self, "fetchAccounts");
}

- (id)loadSettingGroups
{
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[VSTVAppDeveloperSettingsViewController_tvOS groupedDeveloperAccounts]( self,  "groupedDeveloperAccounts"));
  if ([v3 count])
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id obj = v3;
    id v27 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v27)
    {
      v24 = v3;
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v4;
          uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * v4);
          objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          uint64_t v29 = v5;
          v7 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v5]);
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v8 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v34;
            do
            {
              for (i = 0LL; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v34 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
                v13 = -[VSUserAccountFacade initWithAccount:]( objc_alloc(&OBJC_CLASS___VSUserAccountFacade),  "initWithAccount:",  v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountFacade displayNameWithSynchedToThisDeviceIndicator]( v13,  "displayNameWithSynchedToThisDeviceIndicator"));
                v31[0] = _NSConcreteStackBlock;
                v31[1] = 3221225472LL;
                v31[2] = sub_41D8;
                v31[3] = &unk_81D0;
                v31[4] = v12;
                v32 = v13;
                v15 = v13;
                v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  0LL,  0LL,  v31));

                -[NSMutableArray addObject:](v6, "addObject:", v16);
              }

              id v9 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
            }

            while (v9);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v29,  v6));
          -[NSMutableArray addObject:](v26, "addObject:", v17);

          uint64_t v4 = v30 + 1;
        }

        while ((id)(v30 + 1) != v27);
        id v27 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v27);
      objc_super v3 = v24;
    }

    goto LABEL_19;
  }

  if (!-[VSTVAppDeveloperSettingsViewController_tvOS loading](self, "loading"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"TV_APP_DEVELOPER_NO_ACCOUNTS_PLACEHOLDER" value:0 table:0]);

    id obj = (id)v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  0LL,  v19,  0LL,  0LL));
    [v20 setCanFocus:0];
    v41 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v21));

    -[NSMutableArray addObject:](v26, "addObject:", v22);
LABEL_19:
  }

  return v26;
}

- (void)fetchAccounts
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[VSUserAccountManager sharedUserAccountManager]( &OBJC_CLASS___VSUserAccountManager,  "sharedUserAccountManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_4304;
  v4[3] = &unk_8220;
  objc_copyWeak(&v5, &location);
  [v3 fetchDeveloperUserAccountsWithCompletion:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (NSDictionary)groupedDeveloperAccounts
{
  return self->_groupedDeveloperAccounts;
}

- (void)setGroupedDeveloperAccounts:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void).cxx_destruct
{
}

@end