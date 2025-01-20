@interface TVSettingsNetworkViewController
- (NSFormatter)dnsValueFormatter;
- (NSFormatter)emptyValueFormatter;
- (NSURL)lastDeepLinkURL;
- (TSKSettingItem)pivotItem;
- (TSKSettingItem)secureWiFiItem;
- (TSKSettingItem)wifiSignalStrengthItem;
- (TVSettingsNetworkViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleToggleHiddenRecognizer:(id)a3;
- (void)_updateEthernetItem:(id)a3 value:(id)a4;
- (void)_updateWiFiItem:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)presentActionForDisplayedDeepLinkURL;
- (void)setDnsValueFormatter:(id)a3;
- (void)setEmptyValueFormatter:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setSecureWiFiItem:(id)a3;
- (void)setWifiSignalStrengthItem:(id)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)viewDidLoad;
@end

@implementation TVSettingsNetworkViewController

- (TVSettingsNetworkViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
  v3 = -[TVSettingsNetworkViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"networkUpdated:" name:kATVInternetAvailabilityChanged object:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v3 selector:"networkUpdated:" name:kATVPhysicalNetworkStateChanged object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
  -[TVSettingsNetworkViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
  -[TVSettingsNetworkViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleToggleHiddenRecognizer:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AEC38);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 4LL);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController tableView](self, "tableView"));
  [v4 addGestureRecognizer:v3];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  objc_super v5 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v6 = TSKLocString(@"NetworkConnectionTitle");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v92 = -[TSKSettingGroup initWithTitle:](v5, "initWithTitle:", v7);

  v93 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = TSKLocString(@"NetworkEthernetItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v9,  0LL,  v3,  @"isActive",  0LL));

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_10003BB50;
  v100[3] = &unk_10018E9B0;
  objc_copyWeak(&v101, &location);
  [v10 setUpdateBlock:v100];
  -[NSMutableArray addObject:](v93, "addObject:", v10);
  uint64_t v11 = TSKWiFiLocString(@"NetworkWiFiItem_WIFI");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v12,  0LL,  v4,  @"networkName",  0LL));

  [v13 setEnabledInStoreDemoMode:0];
  [v13 setDeepLinkKey:@"WIFI_PICKER"];
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472LL;
  v98[2] = sub_10003BBB4;
  v98[3] = &unk_10018E9B0;
  objc_copyWeak(&v99, &location);
  [v13 setUpdateBlock:v98];
  -[NSMutableArray addObject:](v93, "addObject:", v13);
  uint64_t v14 = TSKLocString(@"NetworkTroubleshootingItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = TSKLocString(@"NetworkTroubleshootingItemDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_10003BC18;
  v96[3] = &unk_10018EC30;
  id v18 = v3;
  id v97 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v15,  v17,  0LL,  0LL,  v96));

  [v19 setUpdateBlock:&stru_100190020];
  [v19 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v93, "addObject:", v19);
  uint64_t v20 = TSKLocString(@"NetworkSecureWiFiItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = TSKLocString(@"NetworkSecureWiFiItemDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v21,  v23,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsSecureWiFiViewController));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  [v25 setHidden:1];
  objc_storeStrong((id *)&self->_secureWiFiItem, v25);
  -[NSMutableArray addObject:](v93, "addObject:", v25);
  -[TSKSettingGroup setSettingItems:](v92, "setSettingItems:", v93);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  else {
    v27 = @"VPNSectionTitle";
  }
  uint64_t v28 = TSKLocString(v27);
  v91 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v29 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", v91);
  uint64_t v30 = TSKLocString(@"VPNSectionDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  0LL,  v31,  v26,  @"activeConfiguration",  objc_opt_class(&OBJC_CLASS___TVSettingsVPNViewController));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = sub_10003BD24;
  v94[3] = &unk_100190048;
  id v90 = v26;
  id v95 = v90;
  [v33 setUpdateBlock:v94];
  objc_storeStrong((id *)&self->_pivotItem, v33);
  v104 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v104, 1LL));
  -[TSKSettingGroup setSettingItems:](v29, "setSettingItems:", v34);

  v35 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v36 = TSKLocString(@"NetworkStatusTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = -[TSKSettingGroup initWithTitle:](v35, "initWithTitle:", v37);

  v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v40 = TSKLocString(@"NetworkWiFiNetworkNameTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v41,  0LL,  v4,  @"networkName"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v42 setLocalizedValueFormatter:v43];

  [v42 setUpdateBlock:&stru_100190068];
  -[NSMutableArray addObject:](v39, "addObject:", v42);
  uint64_t v44 = TSKLocString(@"NetworkWiFiIPAddressTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v45,  0LL,  v4,  @"IPAddress"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v46 setLocalizedValueFormatter:v47];

  [v46 setUpdateBlock:&stru_100190088];
  -[NSMutableArray addObject:](v39, "addObject:", v46);
  uint64_t v48 = TSKLocString(@"NetworkWiFiSubnetMaskTitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v49,  0LL,  v4,  @"subnetMask"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v50 setLocalizedValueFormatter:v51];

  [v50 setUpdateBlock:&stru_1001900A8];
  -[NSMutableArray addObject:](v39, "addObject:", v50);
  uint64_t v52 = TSKLocString(@"NetworkWiFiRouterTitle");
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v53,  0LL,  v4,  @"routerAddress"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v54 setLocalizedValueFormatter:v55];

  [v54 setUpdateBlock:&stru_1001900C8];
  -[NSMutableArray addObject:](v39, "addObject:", v54);
  uint64_t v56 = TSKLocString(@"NetworkWiFiDNSTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v57,  0LL,  v4,  @"dnsAddresses"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController dnsValueFormatter](self, "dnsValueFormatter"));
  [v58 setLocalizedValueFormatter:v59];

  [v58 setUpdateBlock:&stru_1001900E8];
  -[NSMutableArray addObject:](v39, "addObject:", v58);
  uint64_t v60 = TSKLocString(@"NetworkSignalStrengthTitle");
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v61,  0LL,  v4,  @"associatedNetwork.signalStrength"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v62 setLocalizedValueFormatter:v63];

  [v62 setUpdateBlock:&stru_100190108];
  -[NSMutableArray addObject:](v39, "addObject:", v62);
  objc_storeStrong((id *)&self->_wifiSignalStrengthItem, v62);
  uint64_t v64 = TSKWiFiLocString(@"NetworkWiFiWiFiAddressTitle_WIFI");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v65,  0LL,  v4,  @"hardwareAddress"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v66 setLocalizedValueFormatter:v67];

  [v66 setUpdateBlock:&stru_100190128];
  -[NSMutableArray addObject:](v39, "addObject:", v66);
  uint64_t v68 = TSKLocString(@"NetworkEthernetIPAddressTitle");
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v69,  0LL,  v18,  @"IPAddress"));

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v70 setLocalizedValueFormatter:v71];

  [v70 setUpdateBlock:&stru_100190148];
  -[NSMutableArray addObject:](v39, "addObject:", v70);
  uint64_t v72 = TSKLocString(@"NetworkEthernetSubnetMaskTitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v73,  0LL,  v18,  @"subnetMask"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v74 setLocalizedValueFormatter:v75];

  [v74 setUpdateBlock:&stru_100190168];
  -[NSMutableArray addObject:](v39, "addObject:", v74);
  uint64_t v76 = TSKLocString(@"NetworkEthernetRouterTitle");
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v77,  0LL,  v18,  @"routerAddress"));

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v78 setLocalizedValueFormatter:v79];

  [v78 setUpdateBlock:&stru_100190188];
  -[NSMutableArray addObject:](v39, "addObject:", v78);
  uint64_t v80 = TSKLocString(@"NetworkEthernetDNSTitle");
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v81,  0LL,  v18,  @"dnsAddresses"));

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController dnsValueFormatter](self, "dnsValueFormatter"));
  [v82 setLocalizedValueFormatter:v83];

  [v82 setUpdateBlock:&stru_1001901A8];
  -[NSMutableArray addObject:](v39, "addObject:", v82);
  uint64_t v84 = TSKLocString(@"NetworkEthernetAddressTitle");
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v85,  0LL,  v18,  @"hardwareAddress"));

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController emptyValueFormatter](self, "emptyValueFormatter"));
  [v86 setLocalizedValueFormatter:v87];

  [v86 setUpdateBlock:&stru_1001901C8];
  -[NSMutableArray addObject:](v39, "addObject:", v86);
  -[NSMutableArray enumerateObjectsUsingBlock:](v39, "enumerateObjectsUsingBlock:", &stru_100190208);
  -[TSKSettingGroup setSettingItems:](v38, "setSettingItems:", v39);
  v103[0] = v92;
  v103[1] = v29;
  v103[2] = v38;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v103, 3LL));

  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);

  objc_destroyWeak(&location);
  return v88;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
  -[TVSettingsNetworkViewController loadView](&v8, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
  objc_super v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
  uint64_t v6 = NSStringFromClass(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (void)presentActionForDisplayedDeepLinkURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v3 = [v2 containsString:@"cfuAction=launchCaptive"];

  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___PBSCaptiveNetworkService);
    [v4 launchHomeCaptiveViewServiceIfNeeded];
  }

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v7));
  if (v8 == self->_wifiSignalStrengthItem)
  {
    uint64_t v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v13 forIndexPath:v7]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedTitle](v8, "localizedTitle"));
    [v14 setText:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", v8));
    [v16 floatValue];
    objc_msgSend(v10, "setSignalStrength:");
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
    id v9 = -[TVSettingsNetworkViewController tableView:cellForRowAtIndexPath:]( &v18,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkViewController;
  id v8 = a4;
  -[TVSettingsNetworkViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v16,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v8,  a5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v9));
  uint64_t v11 = (void *)v10;
  pivotItem = self->_pivotItem;
  if (pivotItem) {
    BOOL v13 = v10 == (void)pivotItem;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003C5CC;
    v14[3] = &unk_10018E468;
    v14[4] = self;
    id v15 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v14,  0LL,  0.4,  0.0);
  }
}

- (NSFormatter)emptyValueFormatter
{
  emptyValueFormatter = self->_emptyValueFormatter;
  if (!emptyValueFormatter)
  {
    id v4 = (NSFormatter *)[[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190228];
    objc_super v5 = self->_emptyValueFormatter;
    self->_emptyValueFormatter = v4;

    emptyValueFormatter = self->_emptyValueFormatter;
  }

  return emptyValueFormatter;
}

- (NSFormatter)dnsValueFormatter
{
  dnsValueFormatter = self->_dnsValueFormatter;
  if (!dnsValueFormatter)
  {
    id v4 = (NSFormatter *)[[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190268];
    objc_super v5 = self->_dnsValueFormatter;
    self->_dnsValueFormatter = v4;

    dnsValueFormatter = self->_dnsValueFormatter;
  }

  return dnsValueFormatter;
}

- (void)_updateEthernetItem:(id)a3 value:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  else {
    id v6 = @"NetworkEthernetInactiveTitle";
  }
  uint64_t v7 = TSKLocString(v6);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  [v12 setLocalizedValue:v8];

  LOBYTE(v8) = [v5 BOOLValue];
  if ((v8 & 1) != 0) {
    uint64_t v9 = TSKLocString(@"NetworkEthernetActiveItemDescription");
  }
  else {
    uint64_t v9 = TSKWiFiLocString(@"NetworkEthernetInactiveItemDescription_WIFI");
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v12 setLocalizedDescription:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  objc_msgSend(v12, "setHidden:", objc_msgSend(v11, "isActive") ^ 1);

  [v12 setChildControllerClass:objc_opt_class(TVSettingsNetworkConfigurationViewController)];
}

- (void)_updateWiFiItem:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v15 = v5;
  if (a4)
  {
    [v5 setLocalizedValue:a4];
    id v6 = @"NetworkWifiItemDescription_WIFI";
  }

  else
  {
    uint64_t v7 = TSKLocString(@"NetworkWifiNoNetworkTitle");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v15 setLocalizedValue:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
    if (!v9)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v14 = TSKLocStringFromBundleCachingKey( @"NetworkWifiNoNetworkItemDescriptionWiFiOnlyDevice_WIFI",  v13,  1LL,  1LL,  @"Localizable-J255");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v14);

      goto LABEL_6;
    }

    id v6 = @"NetworkWifiNoNetworkItemDescription_WIFI";
  }

  uint64_t v10 = TSKWiFiLocString(v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_6:
  [v15 setLocalizedDescription:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  objc_msgSend(v15, "setHidden:", objc_msgSend(v12, "isActive"));

  [v15 setChildControllerClass:objc_opt_class(TVSettingsWiFiNetworkPickerViewController)];
}

- (void)_handleToggleHiddenRecognizer:(id)a3
{
}

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (TSKSettingItem)wifiSignalStrengthItem
{
  return self->_wifiSignalStrengthItem;
}

- (void)setWifiSignalStrengthItem:(id)a3
{
}

- (TSKSettingItem)secureWiFiItem
{
  return self->_secureWiFiItem;
}

- (void)setSecureWiFiItem:(id)a3
{
}

- (TSKSettingItem)pivotItem
{
  return self->_pivotItem;
}

- (void)setEmptyValueFormatter:(id)a3
{
}

- (void)setDnsValueFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end