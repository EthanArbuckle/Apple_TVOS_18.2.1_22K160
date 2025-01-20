@interface TVSettingsNetworkConfigurationViewController
- (TVSEthernetInterface)interface;
- (id)_autoConfigureViewControllerWithTitle:(id)a3 message:(id)a4 interface:(id)a5 dnsOnly:(BOOL)a6;
- (id)_configureItemFormatter;
- (id)loadSettingGroups;
- (void)_configureInterfaceForDHCP:(id)a3;
- (void)_updateDNSItem:(id)a3 value:(id)a4;
- (void)_updateIPItem:(id)a3 value:(id)a4;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
@end

@implementation TVSettingsNetworkConfigurationViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigurationViewController interface](self, "interface"));
  v51 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v4 = TSKLocString(@"NetworkConfigureEthernetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TSKSettingGroup setLocalizedDescription:](v51, "setLocalizedDescription:", v5);

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = TSKLocString(@"NetworkConfigureIPItemTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = TSKLocString(@"NetworkConfigureEthernetDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1000D743C;
  v63[3] = &unk_100194998;
  objc_copyWeak(&v65, &location);
  id v11 = v3;
  id v64 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v8,  v10,  v11,  @"shouldUseDHCP",  v63));

  [v12 setShouldPresentChildController:1];
  [v12 setEnabledInStoreDemoMode:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigurationViewController _configureItemFormatter]( self,  "_configureItemFormatter"));
  [v12 setLocalizedValueFormatter:v13];

  -[NSMutableArray addObject:](v6, "addObject:", v12);
  uint64_t v14 = TSKLocString(@"NetworkEthernetIPAddressTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = TSKLocString(@"NetworkConfigureIPEntryPrompt");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v15,  v17,  v11,  @"IPAddress",  objc_opt_class(&OBJC_CLASS___TVSettingsIPEditingViewController));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  [v19 setEnabledInStoreDemoMode:0];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1000D74D4;
  v61[3] = &unk_10018E9B0;
  objc_copyWeak(&v62, &location);
  [v19 setUpdateBlock:v61];
  -[NSMutableArray addObject:](v6, "addObject:", v19);
  uint64_t v20 = TSKLocString(@"NetworkEthernetSubnetMaskTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = TSKLocString(@"NetworkConfigureSubnetEntryPrompt");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v21,  v23,  v11,  @"subnetMask",  objc_opt_class(&OBJC_CLASS___TVSettingsSubnetEditingViewController));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  [v25 setEnabledInStoreDemoMode:0];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000D7538;
  v59[3] = &unk_10018E9B0;
  objc_copyWeak(&v60, &location);
  [v25 setUpdateBlock:v59];
  -[NSMutableArray addObject:](v6, "addObject:", v25);
  uint64_t v26 = TSKLocString(@"NetworkEthernetRouterTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = TSKLocString(@"NetworkConfigureRouterEntryPrompt");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v27,  v29,  v11,  @"routerAddress",  objc_opt_class(&OBJC_CLASS___TVSettingsRouterEditingViewController));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  [v31 setEnabledInStoreDemoMode:0];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1000D759C;
  v57[3] = &unk_10018E9B0;
  objc_copyWeak(&v58, &location);
  [v31 setUpdateBlock:v57];
  -[NSMutableArray addObject:](v6, "addObject:", v31);
  -[TSKSettingGroup setSettingItems:](v51, "setSettingItems:", v6);
  v32 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v33 = TSKLocString(@"NetworkConfigureEthernetDNSDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[TSKSettingGroup setLocalizedDescription:](v32, "setLocalizedDescription:", v34);

  v35 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v36 = TSKLocString(@"NetworkConfigureDNSItemTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  uint64_t v38 = TSKLocString(@"NetworkConfigureEthernetDNSDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1000D7600;
  v54[3] = &unk_100194998;
  objc_copyWeak(&v56, &location);
  id v40 = v11;
  id v55 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v37,  v39,  v40,  @"shouldUseDefaultDNS",  v54));

  [v41 setShouldPresentChildController:1];
  [v41 setEnabledInStoreDemoMode:0];
  v42 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigurationViewController _configureItemFormatter]( self,  "_configureItemFormatter"));
  [v41 setLocalizedValueFormatter:v42];

  -[NSMutableArray addObject:](v35, "addObject:", v41);
  uint64_t v43 = TSKLocString(@"NetworkEthernetDNSTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  uint64_t v45 = TSKLocString(@"NetworkConfigureDNSEntryPrompt");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  id v47 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v44,  v46,  v40,  @"primaryDNSAddress",  objc_opt_class(&OBJC_CLASS___TVSettingsDNSEditingViewController));
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

  [v48 setEnabledInStoreDemoMode:0];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000D7698;
  v52[3] = &unk_10018E9B0;
  objc_copyWeak(&v53, &location);
  [v48 setUpdateBlock:v52];
  -[NSMutableArray addObject:](v35, "addObject:", v48);
  -[TSKSettingGroup setSettingItems:](v32, "setSettingItems:", v35);
  v67[0] = v51;
  v67[1] = v32;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&location);
  return v49;
}

- (TVSEthernetInterface)interface
{
  return (TVSEthernetInterface *)+[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface");
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigurationViewController interface](self, "interface"));

  if (v11 == v12)
  {
    +[TSKSettingItem setValue:forSettingItem:](&OBJC_CLASS___TSKSettingItem, "setValue:forSettingItem:", v9, v10);
    objc_initWeak(&location, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigurationViewController interface](self, "interface"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000D7874;
    v15[3] = &unk_10018F498;
    objc_copyWeak(&v16, &location);
    [v13 commitChangesWithCompletion:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkConfigurationViewController;
    -[TVSettingsNetworkConfigurationViewController editingController:didProvideValue:forSettingItem:]( &v14,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
  }
}

- (id)_configureItemFormatter
{
  uint64_t v2 = TSKLocString(@"NetworkConfigureIPAutomatic");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = TSKLocString(@"NetworkConfigureIPManual");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  v3,  v5));

  return v6;
}

- (id)_autoConfigureViewControllerWithTitle:(id)a3 message:(id)a4 interface:(id)a5 dnsOnly:(BOOL)a6
{
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  a3,  a4,  1LL));
  uint64_t v12 = TSKLocString(@"NetworkConfigureIPAutomatic");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000D7AFC;
  v26[3] = &unk_10018F040;
  v26[4] = self;
  id v14 = v10;
  id v27 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v26));

  [v11 addAction:v15];
  uint64_t v16 = TSKLocString(@"NetworkConfigureIPManual");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000D7B08;
  v22[3] = &unk_1001949C0;
  BOOL v25 = a6;
  id v23 = v14;
  id v24 = self;
  id v18 = v14;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v22));

  [v11 addAction:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v11 addAction:v20];

  return v11;
}

- (void)_configureInterfaceForDHCP:(id)a3
{
  id v3 = a3;
  [v3 setShouldUseDHCP:1];
  [v3 setShouldUseDefaultDNS:1];
  [v3 commitChangesWithCompletion:0];
}

- (void)_updateIPItem:(id)a3 value:(id)a4
{
  id v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigurationViewController interface](self, "interface"));
  uint64_t v6 = [v5 shouldUseDHCP] ^ 1;

  [v7 setCanFocus:v6];
  [v7 setEnabled:v6];
  [v7 setAccessoryTypes:v6];
}

- (void)_updateDNSItem:(id)a3 value:(id)a4
{
  id v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigurationViewController interface](self, "interface"));
  uint64_t v6 = [v5 shouldUseDefaultDNS] ^ 1;

  [v7 setCanFocus:v6];
  [v7 setEnabled:v6];
  [v7 setAccessoryTypes:v6];
}

@end