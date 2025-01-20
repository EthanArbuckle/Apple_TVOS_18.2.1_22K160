@interface VSTVAppDeveloperSettingsAccountViewController_tvOS
- (VSRemoteNotifier)remoteNotifier;
- (VSTVAppDeveloperSettingsAccountViewController_tvOS)initWithCoder:(id)a3;
- (VSTVAppDeveloperSettingsAccountViewController_tvOS)initWithStyle:(int64_t)a3;
- (VSUserAccount)account;
- (VSUserAccountFacade)facade;
- (id)loadSettingGroups;
- (void)refreshAccount:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setAccount:(id)a3;
- (void)setFacade:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSTVAppDeveloperSettingsAccountViewController_tvOS

- (VSTVAppDeveloperSettingsAccountViewController_tvOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsAccountViewController_tvOS;
  v3 = -[VSTVAppDeveloperSettingsAccountViewController_tvOS initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    sub_5118(v3);
  }
  return v4;
}

- (VSTVAppDeveloperSettingsAccountViewController_tvOS)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsAccountViewController_tvOS;
  v3 = -[VSTVAppDeveloperSettingsAccountViewController_tvOS initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    sub_5118(v3);
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSTVAppDeveloperSettingsAccountViewController_tvOS;
  -[VSTVAppDeveloperSettingsAccountViewController_tvOS viewDidLoad](&v3, "viewDidLoad");
  -[VSTVAppDeveloperSettingsAccountViewController_tvOS reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)loadSettingGroups
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsAccountViewController_tvOS account](self, "account"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsAccountViewController_tvOS facade](self, "facade"));
    objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"TV_APP_DEVELOPER_SOURCE_IDENTIFIER" value:0 table:0]);

    v75 = (void *)v8;
    v74 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v8,  0LL,  v5,  @"sourceIdentifier"));
    -[NSMutableArray addObject:](v6, "addObject:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"TV_APP_DEVELOPER_CREATED_ON" value:0 table:0]);

    v72 = (void *)v10;
    v71 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v10,  0LL,  v5,  @"created"));
    -[NSMutableArray addObject:](v6, "addObject:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"TV_APP_DEVELOPER_LAST_MODIFIED" value:0 table:0]);

    v70 = (void *)v12;
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v12,  0LL,  v5,  @"lastModified"));
    -[NSMutableArray addObject:](v6, "addObject:");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"TV_APP_DEVELOPER_FROM_THIS_DEVICE" value:0 table:0]);

    v68 = (void *)v14;
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v14,  0LL,  v5,  @"fromThisDevice"));
    -[NSMutableArray addObject:](v6, "addObject:");
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  @"Device Genre",  0LL,  v5,  @"deviceCategory"));
    -[NSMutableArray addObject:](v6, "addObject:");
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v16 = [v15 length];

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"TV_APP_DEVELOPER_IDENTIFIER" value:0 table:0]);

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v18,  0LL,  v5,  @"identifier"));
      -[NSMutableArray addObject:](v6, "addObject:", v19);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 tvProviderIdentifier]);
    id v21 = [v20 length];

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"TV_APP_DEVELOPER_TV_PROVIDER_IDENTIFIER" value:0 table:0]);

      v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v23,  0LL,  v5,  @"tvProviderIdentifier"));
      -[NSMutableArray addObject:](v6, "addObject:", v24);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 updateURLString]);
    id v26 = [v25 length];

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"TV_APP_DEVELOPER_UPDATE_URL" value:0 table:0]);

      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_5B24;
      v82[3] = &unk_81D0;
      id v83 = v28;
      id v84 = v5;
      id v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v29,  0LL,  0LL,  0LL,  v82));
      -[NSMutableArray addObject:](v6, "addObject:", v30);
    }

    v73 = self;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationDataString]);
    id v32 = [v31 length];

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"TV_APP_DEVELOPER_AUTH_DATA" value:0 table:0]);

      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_5B84;
      v79[3] = &unk_81D0;
      id v80 = v34;
      id v81 = v5;
      id v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v35,  0LL,  0LL,  0LL,  v79));
      -[NSMutableArray addObject:](v6, "addObject:", v36);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"TV_APP_DEVELOPER_SYSTEM_TRUST" value:0 table:0]);

    v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v38,  0LL,  v5,  @"requiresSystemTrust"));
    -[NSMutableArray addObject:](v6, "addObject:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v41 = (void *)objc_claimAutoreleasedReturnValue( [v40 localizedStringForKey:@"TV_APP_DEVELOPER_ACCOUNT_TYPE" value:0 table:0]);

    v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v41,  0LL,  v5,  @"accountType"));
    -[NSMutableArray addObject:](v6, "addObject:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v5 billingIdentifier]);
    id v44 = [v43 length];

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 localizedStringForKey:@"TV_APP_DEVELOPER_BILLING_ID" value:0 table:0]);

      v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v46,  0LL,  v5,  @"billingIdentifier"));
      -[NSMutableArray addObject:](v6, "addObject:", v47);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v5 billingCycleEndDate]);
    id v49 = [v48 length];

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v51 = (void *)objc_claimAutoreleasedReturnValue( [v50 localizedStringForKey:@"TV_APP_DEVELOPER_BILLING_CYCLE_END_DATE" value:0 table:0]);

      v52 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v51,  0LL,  v5,  @"billingCycleEndDate"));
      -[NSMutableArray addObject:](v6, "addObject:", v52);
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue([v5 tierIdentifiers]);
    id v54 = [v53 count];

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 localizedStringForKey:@"TV_APP_DEVELOPER_TIERS" value:0 table:0]);

      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472LL;
      v76[2] = sub_5BE4;
      v76[3] = &unk_81D0;
      id v77 = v5;
      id v78 = v56;
      id v57 = v56;
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v57,  0LL,  0LL,  0LL,  v76));
      -[NSMutableArray addObject:](v6, "addObject:", v58);
    }

    if (-[VSUserAccount isFromCurrentDevice](v73->_account, "isFromCurrentDevice"))
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccount updateURL](v73->_account, "updateURL"));

      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        v61 = (void *)objc_claimAutoreleasedReturnValue( [v60 localizedStringForKey:@"TV_APP_DEVELOPER_REFRESH_ACCOUNT" value:0 table:0]);

        v62 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v61,  0LL,  0LL,  0LL,  v73,  "refreshAccount:"));
        -[NSMutableArray addObject:](v6, "addObject:", v62);
      }
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
    -[NSMutableArray addObject:](v3, "addObject:", v63);
  }

  id v64 = -[NSMutableArray copy](v3, "copy");

  return v64;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VSUserAccountManager sharedUserAccountManager]( &OBJC_CLASS___VSUserAccountManager,  "sharedUserAccountManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsAccountViewController_tvOS account](self, "account"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sourceIdentifier]);
  id v11 = [v9 sourceType];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceIdentifier]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_5D98;
  v13[3] = &unk_8270;
  objc_copyWeak(&v14, &location);
  [v8 fetchUserAccountWithSourceIdentifier:v10 sourceType:v11 deviceIdentifier:v12 withCompletion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setAccount:(id)a3
{
  p_account = &self->_account;
  objc_storeStrong((id *)&self->_account, a3);
  id v6 = a3;
  id v7 = -[VSUserAccountFacade initWithAccount:]( objc_alloc(&OBJC_CLASS___VSUserAccountFacade),  "initWithAccount:",  *p_account);

  -[VSTVAppDeveloperSettingsAccountViewController_tvOS setFacade:](self, "setFacade:", v7);
  -[VSTVAppDeveloperSettingsAccountViewController_tvOS reloadSettings](self, "reloadSettings");
}

- (void)refreshAccount:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[VSUserAccountManager sharedUserAccountManager]( &OBJC_CLASS___VSUserAccountManager,  "sharedUserAccountManager",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsAccountViewController_tvOS account](self, "account"));
  [v5 forceRefreshUserAccount:v4 withCompletion:&stru_82B0];
}

- (VSUserAccount)account
{
  return self->_account;
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSUserAccountFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end