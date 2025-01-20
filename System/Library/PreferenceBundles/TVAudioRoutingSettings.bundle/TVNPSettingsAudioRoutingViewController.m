@interface TVNPSettingsAudioRoutingViewController
- (BOOL)deepLinked;
- (BOOL)odeonEnabled;
- (BOOL)viewIsOrWillBeVisible;
- (NSObject)adaptiveHomeManagerAssertion;
- (TVNPRoutingController)routingController;
- (TVNPSettingsAudioRoutingViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_temporaryRoutesTitle;
- (id)defaultAudioRouteGroup;
- (id)eARCGroup;
- (id)externalValue;
- (id)legacyAudioRouteGroup;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)temporaryRouteGroup;
- (id)title;
- (void)_toggleRoutePicked:(id)a3;
- (void)_updateDiscoveryMode;
- (void)activateKonamiCode;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)dealloc;
- (void)dismissPlayer;
- (void)displayTriggeredByURL:(id)a3;
- (void)eARCSelected;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pickOrUnpickRoute:(id)a3;
- (void)pickOrUnpickSettingsItem:(id)a3;
- (void)presentPlayerWithAssetPath:(id)a3 fromViewController:(id)a4;
- (void)setAdaptiveHomeManagerAssertion:(id)a3;
- (void)setExternalValue:(id)a3;
- (void)temporaryRouteItemSelected;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVNPSettingsAudioRoutingViewController

- (TVNPSettingsAudioRoutingViewController)initWithStyle:(int64_t)a3
{
  SEL v16 = a2;
  int64_t v15 = a3;
  v17 = 0LL;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
  v12 = -[TVNPSettingsAudioRoutingViewController initWithStyle:](&v14, "initWithStyle:", a3);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext();
    id v13 = (id)MRAVOutputContextGetUniqueIdentifier(SharedAudioPresentationContext);
    v4 = objc_alloc(&OBJC_CLASS___TVNPGroupableRoutingController);
    v5 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:]( v4,  "initWithOutputContextUID:allowsRetargeting:",  v13,  0LL);
    routingController = v17->_routingController;
    v17->_routingController = (TVNPRoutingController *)v5;

    -[TVNPRoutingController addObserver:forKeyPath:options:context:]( v17->_routingController,  "addObserver:forKeyPath:options:context:",  v17,  @"currentRoutes");
    char v7 = _os_feature_enabled_impl("Home", "cce7c4ecef404121ae8971");
    v17->_odeonEnabled = v7 & 1;
    -[TVNPRoutingController addObserver:forKeyPath:options:context:]( v17->_routingController,  "addObserver:forKeyPath:options:context:",  v17,  @"eligibleOdeonRoutes",  0LL,  off_318C8);
    v10 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v10,  "addObserver:selector:name:object:",  v17,  "applicationDidEnterBackground:",  UIApplicationDidEnterBackgroundNotification);

    v11 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v11,  "addObserver:selector:name:object:",  v17,  "applicationDidBecomeActive:",  UIApplicationDidBecomeActiveNotification,  0LL);

    -[TVNPSettingsAudioRoutingViewController _updateDiscoveryMode](v17, "_updateDiscoveryMode");
    objc_storeStrong(&v13, 0LL);
  }

  v9 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  return v9;
}

- (void)dealloc
{
  v6 = self;
  SEL v5 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v6,  UIApplicationDidEnterBackgroundNotification);

  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  v6,  UIApplicationDidBecomeActiveNotification,  0LL);

  -[TVNPRoutingController removeObserver:forKeyPath:context:]( v6->_routingController,  "removeObserver:forKeyPath:context:",  v6,  @"currentRoutes",  off_318C0);
  -[TVNPRoutingController removeObserver:forKeyPath:context:]( v6->_routingController,  "removeObserver:forKeyPath:context:",  v6,  @"eligibleOdeonRoutes",  off_318C8);
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
  -[TVNPSettingsAudioRoutingViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
  -[TVNPSettingsAudioRoutingViewController viewDidLoad](&v6, "viewDidLoad");
  id v5 = -[TVNPSettingsAudioRoutingViewController tableView](v8, "tableView");
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPSettingsRouteTableViewCell);
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPSettingsRouteTableViewCell);
  objc_super v4 = NSStringFromClass(v2);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
  -[TVNPSettingsAudioRoutingViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v9->_viewIsOrWillBeVisible = 1;
  -[TVNPSettingsAudioRoutingViewController _updateDiscoveryMode](v9, "_updateDiscoveryMode");
  if (!v9->_adaptiveHomeManagerAssertion)
  {
    id v5 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    uint64_t v3 =  -[TVCSHomeManager _beginActiveAssertionWithReason:]( v5,  "_beginActiveAssertionWithReason:",  @"com.apple.TVSettings.TVNPSettingsAudioRoutingViewController");
    adaptiveHomeManagerAssertion = v9->_adaptiveHomeManagerAssertion;
    v9->_adaptiveHomeManagerAssertion = v3;
  }

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
  -[TVNPSettingsAudioRoutingViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  v7->_viewIsOrWillBeVisible = 0;
  -[TVNPSettingsAudioRoutingViewController _updateDiscoveryMode](v7, "_updateDiscoveryMode");
  if (v7->_adaptiveHomeManagerAssertion)
  {
    uint64_t v3 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    -[TVCSHomeManager _endActiveAssertion:](v3, "_endActiveAssertion:", v7->_adaptiveHomeManagerAssertion);

    objc_storeStrong((id *)&v7->_adaptiveHomeManagerAssertion, 0LL);
  }

- (id)title
{
  uint64_t v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  objc_super v4 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"RoutingViewControllerTitle",  0LL,  @"Localizable");

  return v4;
}

- (id)loadSettingGroups
{
  id v6 = -[TVNPSettingsAudioRoutingViewController defaultAudioRouteGroup](self, "defaultAudioRouteGroup");
  v8[0] = v6;
  id v5 = -[TVNPSettingsAudioRoutingViewController eARCGroup](self, "eARCGroup");
  v8[1] = v5;
  id v3 = -[TVNPSettingsAudioRoutingViewController temporaryRouteGroup](self, "temporaryRouteGroup");
  v8[2] = v3;
  objc_super v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL);

  return v4;
}

- (id)defaultAudioRouteGroup
{
  v17 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v15 = @"eligibleOdeonRoutes";
  BOOL v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v17));
  objc_super v4 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"DefaultAudioOutputTitle",  0LL,  @"Localizable");
  routingController = v17->_routingController;
  id v6 = v15;
  SEL v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_57AC;
  v12 = &unk_28680;
  objc_copyWeak(v13, location);
  id v14 =  +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  routingController,  v6,  &v8);

  id v3 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_destroyWeak(v13);
  objc_storeStrong(&v15, 0LL);
  objc_destroyWeak(location);
  return v3;
}

- (id)eARCGroup
{
  v22 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v20 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  int v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v22));
  int v9 =  -[NSBundle localizedStringForKey:value:table:]( v10,  "localizedStringForKey:value:table:",  @"PlayTelevisionAudioTitle",  0LL,  @"eARC");
  SEL v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v22));
  BOOL v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"PlayTelevisionAudioDescription",  0LL,  @"eARC");
  id v19 =  +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9);

  id v6 = v19;
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  SEL v16 = sub_6428;
  v17 = &unk_286A8;
  objc_copyWeak(&v18, location);
  [v6 setUpdateBlock:&v13];
  id v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v22));
  id v12 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"AudioReturnChannelTitle",  0LL,  @"eARC");

  id v23 = v19;
  objc_super v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL);
  v11 =  +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v12);

  id v3 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_destroyWeak(location);
  return v3;
}

- (void)eARCSelected
{
  int v10 = self;
  SEL v9 = a2;
  v2 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  id v3 = (char *)-[PBSEARCConfigurator eARCStatus](v2, "eARCStatus");

  SEL v8 = v3;
  if ((unint64_t)(v3 + 1) <= 1)
  {
    char v7 = 0;
  }

  else if ((unint64_t)(v3 - 1) <= 2)
  {
    char v7 = 1;
  }

  unsigned __int8 v6 = (v7 ^ 1) & 1;
  id v5 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v4 =  +[PBSDisplayAssistantPresentationRequest eARCRequestFromSource:shouldEnable:]( &OBJC_CLASS___PBSDisplayAssistantPresentationRequest,  "eARCRequestFromSource:shouldEnable:",  1LL,  v6);
  -[PBSDisplayManager presentDisplayAssistantWithRequest:dismissHandler:]( v5,  "presentDisplayAssistantWithRequest:dismissHandler:",  v4,  &stru_286E8);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong((id *)&v5, 0LL);
}

- (id)temporaryRouteGroup
{
  v24 = self;
  v23[1] = (id)a2;
  id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v23[0] =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"OtherSpeakersDescription",  0LL,  @"Localizable");

  if (MGGetProductType() == 1110205732)
  {
    id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v24));
    v2 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"OtherSpeakersLegacyDescription",  0LL,  @"Localizable");
    id v3 = v23[0];
    v23[0] = v2;
  }

  v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v24));
  int v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"SelectTitle",  0LL,  @"Localizable");
  id v22 =  +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:");

  objc_initWeak(&location, v24);
  id v9 = v22;
  int v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_6F74;
  id v19 = &unk_286A8;
  objc_copyWeak(&v20, &location);
  [v9 setUpdateBlock:&v15];
  [v22 setAccessoryTypes:1];
  SEL v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v24));
  char v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"OtherSpeakersTitle",  0LL,  @"Localizable");
  id v25 = v22;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL);
  int v14 =  +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v7);

  id v5 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  return v5;
}

- (void)temporaryRouteItemSelected
{
  v2 = +[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance");
  -[PBSSystemService presentControlCenterRoutePickerWithCompletion:]( v2,  "presentControlCenterRoutePickerWithCompletion:",  &stru_28728);
}

  ;
}

- (id)legacyAudioRouteGroup
{
  int v16 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v14 = @"availableRoutes";
  routingController = v16->_routingController;
  id v5 = v14;
  unsigned __int8 v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_7220;
  int v10 = &unk_28790;
  v11 = v16;
  objc_copyWeak(&v12, location);
  id v13 =  +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  routingController,  v5,  &v6);
  id v3 = v13;
  objc_storeStrong(&v13, 0LL);
  objc_destroyWeak(&v12);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_destroyWeak(location);
  return v3;
}

- (void)activateKonamiCode
{
  v69 = self;
  v68[1] = (id)a2;
  id v3 = -[TVNPSettingsAudioRoutingViewController routingController](self, "routingController");
  v68[0] = -[TVNPRoutingController homeDestinationController](v3, "homeDestinationController");

  v67 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  id v66 = -[NSUserDefaults integerForKey:](v67, "integerForKey:", @"persistentGroupSize");
  id v65 = -[NSUserDefaults integerForKey:](v67, "integerForKey:", @"persistentGroupType");
  v64 = -[NSUserDefaults stringForKey:](v67, "stringForKey:", @"persistentGroupUUID");
  v63 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", &stru_29998);
  id v4 = v63;
  id v6 = [v68[0] identifier];
  id v5 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Audio Destination Controller Identifier:\n%@\n\n",  v6);
  -[NSMutableString appendString:](v4, "appendString:");

  int v7 = v63;
  id v9 = [v68[0] destination];
  int v8 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Selected Audio Destination:\n%@\n\n",  v9);
  -[NSMutableString appendString:](v7, "appendString:");

  int v10 = v63;
  id v13 = [v68[0] availableDestinations];
  id v12 = objc_msgSend(v13, "componentsJoinedByString:");
  v11 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Available Audio Destinations:\n%@\n\n",  v12);
  -[NSMutableString appendString:](v10, "appendString:");

  id v14 = v63;
  int v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Persistent Group Size: %ld\n\n",  v66);
  -[NSMutableString appendString:](v14, "appendString:");

  int v16 = v63;
  int v17 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Persistent Group Type: %ld\n\n",  v65);
  -[NSMutableString appendString:](v16, "appendString:");

  id v18 = v63;
  id v19 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Persistent Group UUID:\n%@\n\n",  v64);
  -[NSMutableString appendString:](v18, "appendString:");

  id v20 = v63;
  id v23 = -[TVNPRoutingController currentRoutes](v69->_routingController, "currentRoutes");
  id v22 = [v23 componentsJoinedByString:@"\n"];
  v21 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Selected AirPlay Routes:\n%@\n\n",  v22);
  -[NSMutableString appendString:](v20, "appendString:");

  v24 = v63;
  v27 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
  id v26 = (id)TVCSHomeConfigurationStateToString( -[TVCSHomeManager homeConfigurationState]( v27,  "homeConfigurationState"));
  id v25 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HomeKit State:\n%@\n\n",  v26);
  -[NSMutableString appendString:](v24, "appendString:");

  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v62 = [v2 initWithTitle:@"Odeon Debug" text:v63];
  id v61 = objc_msgSend([TVSUITextAlertButton alloc], "initWithType:");
  [v61 setTitle:@"airplayutil ka"];
  [v61 setSelectHandler:&stru_287D0];
  id v60 = [[TVSUITextAlertButton alloc] initWithType:0];
  [v60 setTitle:@"Atmos Leaf"];
  id v28 = v60;
  v53[1] = _NSConcreteStackBlock;
  int v54 = -1073741824;
  int v55 = 0;
  v56 = sub_7FD8;
  v57 = &unk_287F8;
  v58 = v69;
  id v59 = v62;
  objc_msgSend(v28, "setSelectHandler:");
  v53[0] = [[TVSUITextAlertButton alloc] initWithType:0];
  [v53[0] setTitle:@"Atmos Channel ID"];
  id v29 = v53[0];
  v46[1] = _NSConcreteStackBlock;
  int v47 = -1073741824;
  int v48 = 0;
  v49 = sub_803C;
  v50 = &unk_287F8;
  v51 = v69;
  id v52 = v62;
  objc_msgSend(v29, "setSelectHandler:");
  v46[0] = [[TVSUITextAlertButton alloc] initWithType:0];
  [v46[0] setTitle:@"5.1 PCM Channel ID"];
  id v30 = v46[0];
  v39[1] = _NSConcreteStackBlock;
  int v40 = -1073741824;
  int v41 = 0;
  v42 = sub_80A0;
  v43 = &unk_287F8;
  v44 = v69;
  id v45 = v62;
  objc_msgSend(v30, "setSelectHandler:");
  v39[0] = [[TVSUITextAlertButton alloc] initWithType:0];
  [v39[0] setTitle:@"7.1 PCM Channel ID"];
  id v31 = v39[0];
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_8104;
  v36 = &unk_287F8;
  v37 = v69;
  id v38 = v62;
  objc_msgSend(v31, "setSelectHandler:");
  [v62 addButton:v61];
  [v62 addButton:v60];
  [v62 addButton:v53[0]];
  [v62 addButton:v46[0]];
  [v62 addButton:v39[0]];
  [v62 setShouldDismissAutomatically:0];
  [v62 setModalPresentationStyle:8];
  -[TVNPSettingsAudioRoutingViewController presentViewController:animated:completion:]( v69,  "presentViewController:animated:completion:",  v62,  1LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(v39, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong(v46, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  objc_storeStrong(v53, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong((id *)&v58, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong((id *)&v67, 0LL);
  objc_storeStrong(v68, 0LL);
}

- (void)presentPlayerWithAssetPath:(id)a3 fromViewController:(id)a4
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", location[0]);
  id v13 = +[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v14, 0LL);
  id v12 = +[AVPlayerItem playerItemWithAsset:](&OBJC_CLASS___AVPlayerItem, "playerItemWithAsset:", v13);
  v11 = +[AVPlayer playerWithPlayerItem:](&OBJC_CLASS___AVPlayer, "playerWithPlayerItem:", v12);
  int v10 = objc_alloc_init(&OBJC_CLASS___AVPlayerViewController);
  -[AVPlayerViewController setPlayer:](v10, "setPlayer:", v11);
  id v5 = +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance");
  -[AVAudioSession setCategory:mode:options:error:]( v5,  "setCategory:mode:options:error:",  AVAudioSessionCategoryPlayback,  AVAudioSessionModeMoviePlayback,  0LL,  0LL);

  -[AVPlayer play](v11, "play");
  id v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  id v6 = v17;
  int v8 = -[AVPlayerViewController player](v10, "player");
  int v7 = -[AVPlayer currentItem](v8, "currentItem");
  -[NSNotificationCenter addObserver:selector:name:object:]( v9,  "addObserver:selector:name:object:",  v6,  "dismissPlayer",  AVPlayerItemDidPlayToEndTimeNotification);

  [v15 presentViewController:v10 animated:1 completion:0];
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)dismissPlayer
{
  id v2 = -[TVNPSettingsAudioRoutingViewController presentedViewController](self, "presentedViewController");
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPSettingsAudioRoutingViewController _updateDiscoveryMode](v4, "_updateDiscoveryMode");
  objc_storeStrong(location, 0LL);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPSettingsAudioRoutingViewController _updateDiscoveryMode](v4, "_updateDiscoveryMode");
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  int v10 = a6;
  if (a6 == off_318C0 || v10 == off_318C8)
  {
    -[TVNPSettingsAudioRoutingViewController reloadSettingsIfNeeded](v14, "reloadSettingsIfNeeded");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
    -[TVNPSettingsAudioRoutingViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 =  -[TVNPSettingsAudioRoutingViewController settingGroupAtIndex:]( v19,  "settingGroupAtIndex:",  [v17 section]);
  id v15 = -[TVNPSettingsAudioRoutingViewController settingItemAtIndexPath:](v19, "settingItemAtIndexPath:", v17);
  if (v15)
  {
    if ([v17 section])
    {
      id v7 = location[0];
      id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewTextCell);
      int v8 = NSStringFromClass(v5);
      id v12 = objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:");

      [v12 settingItem:v15 didUpdateMetadataWithGroup:v16];
      [v15 setDirty:0];
      id v20 = v12;
      int v13 = 1;
      objc_storeStrong(&v12, 0LL);
    }

    else
    {
      id v9 = location[0];
      id v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPSettingsRouteTableViewCell);
      int v10 = NSStringFromClass(v4);
      id v14 = objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:");

      [v14 settingItem:v15 didUpdateMetadataWithGroup:v16];
      [v15 setDirty:0];
      id v20 = v14;
      int v13 = 1;
      objc_storeStrong(&v14, 0LL);
    }
  }

  else
  {
    id v20 = 0LL;
    int v13 = 1;
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v20;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  if ([v9 section])
  {
    v7.receiver = v11;
    v7.super_class = (Class)&OBJC_CLASS___TVNPSettingsAudioRoutingViewController;
    -[TVNPSettingsAudioRoutingViewController tableView:heightForRowAtIndexPath:]( &v7,  "tableView:heightForRowAtIndexPath:",  location[0],  v9);
    double v12 = v4;
  }

  else
  {
    double v12 = 103.0;
  }

  int v8 = 1;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

- (void)displayTriggeredByURL:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4->_deepLinked = 1;
  objc_storeStrong(location, 0LL);
}

- (id)_temporaryRoutesTitle
{
  id v25 = self;
  v24[1] = (id)a2;
  v24[0] = 0LL;
  id v19 = -[TVNPRoutingController currentRoutes](self->_routingController, "currentRoutes");
  id v20 = (char *)[v19 count];

  unint64_t v23 = (unint64_t)v20;
  if (v20 == (_BYTE *)&dword_0 + 1)
  {
    id v18 = -[TVNPRoutingController currentRoutes](v25->_routingController, "currentRoutes");
    id location = [v18 firstObject];

    if (([location isLocal] & 1) == 0)
    {
      id v2 = [location title];
      id v3 = v24[0];
      v24[0] = v2;
    }

    objc_storeStrong(&location, 0LL);
  }

  else if (v23 == 2)
  {
    id v17 = -[TVNPRoutingController currentDestination](v25->_routingController, "currentDestination");
    id v4 = [v17 destinationName];
    id v5 = v24[0];
    v24[0] = v4;
  }

  else if (v23 > 2)
  {
    id v16 = -[TVNPRoutingController currentDestination](v25->_routingController, "currentDestination");
    id v15 = [v16 routeNames];
    id v21 = [v15 firstObject];

    if (v21)
    {
      id v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v25));
      int v13 =  -[NSBundle localizedStringForKey:value:table:]( v14,  "localizedStringForKey:value:table:",  @"TemporaryRoutesShortTitle",  0LL,  @"Localizable");
      id v6 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v21, v23 - 1);
      id v7 = v24[0];
      v24[0] = v6;
    }

    objc_storeStrong(&v21, 0LL);
  }

  if (!v24[0])
  {
    double v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v25));
    int v8 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"SelectTitle",  0LL,  @"Localizable");
    id v9 = v24[0];
    v24[0] = v8;
  }

  id v11 = v24[0];
  objc_storeStrong(v24, 0LL);
  return v11;
}

- (void)_toggleRoutePicked:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVNPSettingsAudioRoutingViewController odeonEnabled](v9, "odeonEnabled"))
  {
    id v7 = [location[0] representedObject];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPMediaDestinationRoute);
    if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0)
    {
      id v6 = -[TVNPSettingsAudioRoutingViewController routingController](v9, "routingController");
      id v5 = [v7 mediaDestination];
      -[TVNPRoutingController selectOdeonDestination:](v6, "selectOdeonDestination:");
    }

    else
    {
      id v4 = -[TVNPSettingsAudioRoutingViewController routingController](v9, "routingController");
      -[TVNPRoutingController selectOdeonDestination:](v4, "selectOdeonDestination:", 0LL);
    }

    objc_storeStrong(&v7, 0LL);
  }

  else
  {
    -[TVNPSettingsAudioRoutingViewController pickOrUnpickSettingsItem:](v9, "pickOrUnpickSettingsItem:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)pickOrUnpickSettingsItem:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] representedObject];
  -[TVNPSettingsAudioRoutingViewController pickOrUnpickRoute:](v5, "pickOrUnpickRoute:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pickOrUnpickRoute:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] selectionState])
  {
    routingController = v8->_routingController;
    id v10 = location[0];
    id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL);
    -[TVNPRoutingController unpickRoutes:forDestination:](routingController, "unpickRoutes:forDestination:");
  }

  else
  {
    id v3 = v8->_routingController;
    id v9 = location[0];
    id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL);
    -[TVNPRoutingController pickRoutes:forDestination:](v3, "pickRoutes:forDestination:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateDiscoveryMode
{
  id v2 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
  BOOL v3 = (char *)-[UIApplication applicationState](v2, "applicationState") != (char *)&dword_0 + 2;

  uint64_t v4 = 0LL;
  if (v3 && self->_viewIsOrWillBeVisible)
  {
    uint64_t v4 = 2LL;
  }

  else if (v3)
  {
    uint64_t v4 = 1LL;
  }

  -[TVNPRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:", v4);
}

- (id)externalValue
{
  return self->_externalValue;
}

- (void)setExternalValue:(id)a3
{
}

- (BOOL)viewIsOrWillBeVisible
{
  return self->_viewIsOrWillBeVisible;
}

- (BOOL)odeonEnabled
{
  return self->_odeonEnabled;
}

- (BOOL)deepLinked
{
  return self->_deepLinked;
}

- (TVNPRoutingController)routingController
{
  return self->_routingController;
}

- (NSObject)adaptiveHomeManagerAssertion
{
  return self->_adaptiveHomeManagerAssertion;
}

- (void)setAdaptiveHomeManagerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end