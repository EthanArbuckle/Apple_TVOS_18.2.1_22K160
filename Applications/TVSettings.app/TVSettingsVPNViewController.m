@interface TVSettingsVPNViewController
- (PBSSuppressVPNBulletinAssertion)suppressBulletinAssertion;
- (TVSettingsVPNViewController)init;
- (id)loadSettingGroups;
- (id)title;
- (void)_configurationSelected:(id)a3;
- (void)_statusItemSelected;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TVSettingsVPNViewController

- (TVSettingsVPNViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsVPNViewController;
  v2 = -[TVSettingsVPNViewController init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PBSSuppressVPNBulletinAssertion);
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[PBSSuppressVPNBulletinAssertion initWithIdentifier:](v3, "initWithIdentifier:", v6);
    suppressBulletinAssertion = v2->_suppressBulletinAssertion;
    v2->_suppressBulletinAssertion = v7;
  }

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsVPNViewController;
  -[TVSettingsVPNViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PBSSuppressVPNBulletinAssertion acquire](self->_suppressBulletinAssertion, "acquire");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsVPNViewController;
  -[TVSettingsVPNViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[PBSSuppressVPNBulletinAssertion relinquish](self->_suppressBulletinAssertion, "relinquish");
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  else {
    v3 = @"VPNSectionTitle";
  }
  uint64_t v4 = TSKLocString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v5 = TSKLocString(@"VPNStatusTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  v3,  @"activeConfiguration.connectionStatus",  self,  "_statusItemSelected"));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVPNFacade connectionStatusFormatter]( &OBJC_CLASS___TVSettingsVPNFacade,  "connectionStatusFormatter"));
  [v7 setLocalizedValueFormatter:v8];

  v31 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v9);

  objc_initWeak(&location, self);
  uint64_t v10 = TSKLocString(@"VPNConfigurationSectionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001BCB0;
  v26[3] = &unk_10018F170;
  objc_copyWeak(&v27, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v11,  v3,  @"configurations",  v26));

  v13 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v14 = TSKLocString(@"VPNConnectionDetailsTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_10001BDA8;
  v24 = &unk_10018EC30;
  id v16 = v3;
  id v25 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v15,  0LL,  v16,  @"activeConfiguration",  &v21));

  objc_msgSend(v17, "setUpdateBlock:", &stru_10018F1B0, v21, v22, v23, v24);
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  -[TSKSettingGroup setSettingItems:](v13, "setSettingItems:", v18);

  v29[0] = v4;
  v29[1] = v12;
  v29[2] = v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

- (void)_statusItemSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 activeConfiguration]);
  if ([v2 connectionStatus] == (id)3) {
    [v2 disconnect];
  }
  else {
    [v2 connect];
  }
}

- (void)_configurationSelected:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  [v4 setActiveConfiguration:v5 presentingViewController:self];
}

- (PBSSuppressVPNBulletinAssertion)suppressBulletinAssertion
{
  return self->_suppressBulletinAssertion;
}

- (void).cxx_destruct
{
}

@end