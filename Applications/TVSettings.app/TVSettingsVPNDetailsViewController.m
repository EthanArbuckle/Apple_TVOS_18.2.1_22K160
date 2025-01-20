@interface TVSettingsVPNDetailsViewController
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (TVSettingsVPNConfiguration)configuration;
- (TVSettingsVPNDetailsViewController)initWithConfiguration:(id)a3;
- (id)connectionTypeFormatter;
- (id)ipAddressesFormatter;
- (id)loadSettingGroups;
- (id)title;
- (void)confirmConfigurationRemoval;
- (void)openVPNApp;
- (void)removeConfiguration;
- (void)setConfiguration:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
@end

@implementation TVSettingsVPNDetailsViewController

- (TVSettingsVPNDetailsViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsVPNDetailsViewController;
  v5 = -[TVSettingsVPNDetailsViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[TVSettingsVPNDetailsViewController setConfiguration:](v5, "setConfiguration:", v4);
  }

  return v6;
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 displayName]);

  return v3;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController configuration](self, "configuration"));
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v46 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  id v5 = [v3 grade];
  if (v5 != (id)2 && [v3 onDemandCapable])
  {
    uint64_t v6 = TSKLocString(@"VPNConnectOnDemandTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v7,  0LL,  v3,  @"onDemandEnabled",  0LL,  0LL));

    -[NSMutableArray addObject:](v4, "addObject:", v8);
  }

  uint64_t v9 = TSKLocString(@"VPNDomainsTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000D95D4;
  v47[3] = &unk_10018EC30;
  id v11 = v3;
  id v48 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v10,  0LL,  v11,  @"domains",  v47));

  [v12 setUpdateBlock:&stru_100194A68];
  v45 = v12;
  -[NSMutableArray addObject:](v4, "addObject:", v12);
  uint64_t v13 = TSKLocString(@"VPNTypeTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v14,  0LL,  v11,  @"connectionType"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController connectionTypeFormatter](self, "connectionTypeFormatter"));
  [v15 setLocalizedValueFormatter:v16];

  [v15 setCanFocus:0];
  v44 = v15;
  -[NSMutableArray addObject:](v4, "addObject:", v15);
  uint64_t v17 = TSKLocString(@"VPNServerTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v18,  0LL,  v11,  @"server"));

  [v19 setCanFocus:0];
  v43 = v19;
  -[NSMutableArray addObject:](v4, "addObject:", v19);
  if (v5 == (id)2)
  {
    v20 = @"RelayDeleteTitle";
    v21 = self;
  }

  else
  {
    uint64_t v22 = TSKLocString(@"VPNServerAddressTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v23,  0LL,  v11,  @"remoteAddress"));

    [v24 setCanFocus:0];
    [v24 setUpdateBlock:&stru_100194A88];
    -[NSMutableArray addObject:](v4, "addObject:", v24);
    uint64_t v25 = TSKLocString(@"VPNAddressTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v26,  0LL,  v11,  @"ipAddresses"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController ipAddressesFormatter](self, "ipAddressesFormatter"));
    [v27 setLocalizedValueFormatter:v28];

    [v27 setCanFocus:0];
    [v27 setUpdateBlock:&stru_100194AA8];
    -[NSMutableArray addObject:](v4, "addObject:", v27);
    uint64_t v29 = TSKLocString(@"VPNConnectTimeTitle");
    v21 = self;
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v30,  0LL,  v11,  @"localizedElapsedTime"));

    [v31 setCanFocus:0];
    [v31 setUpdateBlock:&stru_100194AC8];
    -[NSMutableArray addObject:](v4, "addObject:", v31);

    v20 = @"VPNDeleteTitle";
  }

  uint64_t v32 = TSKLocString(@"VPNOpenAppTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationName]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v33, v34));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v35,  0LL,  0LL,  0LL,  v21,  "openVPNApp"));

  objc_msgSend(v36, "setHidden:", objc_msgSend(v11, "isProfileBacked"));
  -[NSMutableArray addObject:](v4, "addObject:", v36);
  uint64_t v37 = TSKLocString(v20);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v38,  0LL,  0LL,  0LL,  v21,  "confirmConfigurationRemoval"));

  objc_msgSend(v39, "setHidden:", objc_msgSend(v11, "isProfileBacked"));
  -[NSMutableArray addObject:](v4, "addObject:", v39);
  id v40 = -[NSMutableArray copy](v4, "copy");
  -[TSKSettingGroup setSettingItems:](v46, "setSettingItems:", v40);

  v49 = v46;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));

  return v41;
}

- (void)openVPNApp
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController configuration](self, "configuration"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationIdentifier]);
  [v5 openApplication:v4 withOptions:0 completion:0];
}

- (void)confirmConfigurationRemoval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController configuration](self, "configuration"));
  id v4 = [v3 grade];

  if (v4 == (id)2) {
    id v5 = @"RelayDeleteAlertTitle";
  }
  else {
    id v5 = @"VPNDeleteAlertTitle";
  }
  uint64_t v6 = TSKLocString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  0LL,  1LL));

  uint64_t v9 = TSKLocString(@"VPNDeleteAlertConfirmationTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D9870;
  v15[3] = &unk_10018F018;
  v15[4] = self;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  0LL,  v15));
  [v8 addAction:v11];

  uint64_t v12 = TSKLocString(@"VPNDeleteAlertCancelTitle");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  0LL));
  [v8 addAction:v14];

  -[TVSettingsVPNDetailsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
}

- (void)removeConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  objc_initWeak(&location, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDetailsViewController configuration](self, "configuration"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D9970;
  v6[3] = &unk_10018E568;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  id v7 = v5;
  [v5 removeConfiguration:v4 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)connectionTypeFormatter
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D9B2C;
  v5[3] = &unk_100194AF0;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithFormattingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)ipAddressesFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100194B10];
}

- (TSKSettingItem)editingItem
{
  return self->_editingItem;
}

- (void)setEditingItem:(id)a3
{
}

- (TSKSettingItemEditingControllerDelegate)editingDelegate
{
  return (TSKSettingItemEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (TVSettingsVPNConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end