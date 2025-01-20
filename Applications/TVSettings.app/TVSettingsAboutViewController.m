@interface TVSettingsAboutViewController
- (BOOL)_hasTiltID;
- (BOOL)_showWiFiSettings;
- (BOOL)showPartNumberAndFirmwareVersion;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (TSKSettingItem)wifiSignalStrengthItem;
- (TSKSettingItemEditingController)nameViewController;
- (TVSettingsAboutViewController)initWithStyle:(int64_t)a3;
- (TVSettingsDiagnosticsController)diagnostics;
- (UIAlertController)diagnosticsTicketController;
- (UIGestureRecognizer)downButtonRecognizer;
- (UIGestureRecognizer)playPauseButtonRecognizer;
- (id)_nameViewControllerForItem:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)currentMoreInfoItemType;
- (void)_advanceMoreInfoItem;
- (void)_handleDownGesture:(id)a3;
- (void)_handlePlayPauseGesture:(id)a3;
- (void)_handleUpGesture:(id)a3;
- (void)_presentSetAccessoryNameFailedViewControllerWithError:(id)a3;
- (void)_setDeviceName:(id)a3;
- (void)_updateDiagnosticsItem:(id)a3;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentMoreInfoItemType:(unint64_t)a3;
- (void)setDiagnostics:(id)a3;
- (void)setDiagnosticsTicketController:(id)a3;
- (void)setDownButtonRecognizer:(id)a3;
- (void)setNameViewController:(id)a3;
- (void)setPlayPauseButtonRecognizer:(id)a3;
- (void)setShowPartNumberAndFirmwareVersion:(BOOL)a3;
- (void)setWifiSignalStrengthItem:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsAboutViewController

- (TVSettingsAboutViewController)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
  v3 = -[TVSettingsAboutViewController initWithStyle:](&v9, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"networkUpdated:" name:kATVPhysicalNetworkStateChanged object:0];

    v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsDiagnosticsController);
    -[TVSettingsAboutViewController setDiagnostics:](v3, "setDiagnostics:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](v3, "diagnostics"));
    [v6 addObserver:v3 forKeyPath:@"sessionState" options:0 context:off_1001DF9F8];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v7 reloadHomeConfiguration];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
  [v4 removeObserver:self forKeyPath:@"sessionState"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
  -[TVSettingsAboutViewController dealloc](&v6, "dealloc");
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
  -[TVSettingsAboutViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleUpGesture:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AECC8);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleDownGesture:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1001AECE0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[TVSettingsAboutViewController setDownButtonRecognizer:](self, "setDownButtonRecognizer:", v5);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController view](self, "view"));
  [v6 addGestureRecognizer:v5];

  v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayPauseGesture:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_1001AECF8);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v7, "setNumberOfTapsRequired:", 3LL);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[TVSettingsAboutViewController setPlayPauseButtonRecognizer:](self, "setPlayPauseButtonRecognizer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController view](self, "view"));
  [v8 addGestureRecognizer:v7];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController tableView](self, "tableView"));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
  v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 registerClass:v10 forCellReuseIdentifier:v13];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
  -[TVSettingsAboutViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
  [v4 pollForSession];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCertificateTrustFacade sharedInstance]( &OBJC_CLASS___TVSettingsCertificateTrustFacade,  "sharedInstance"));
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = TSKLocString(@"AboutNameTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 availableNames]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v6,  0LL,  v3,  @"name",  v7));

  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472LL;
  v124[2] = sub_10004BB60;
  v124[3] = &unk_10018E9D8;
  objc_copyWeak(&v125, &location);
  [v8 setChildControllerBlock:v124];
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472LL;
  v122[2] = sub_10004BBB4;
  v122[3] = &unk_10018E608;
  id v95 = v3;
  id v123 = v95;
  [v8 setUpdateBlock:v122];
  [v8 setShouldPresentChildController:0];
  -[NSMutableArray addObject:](v4, "addObject:", v8);
  uint64_t v9 = TSKLocString(@"AboutDiagnosticsStartTitle");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  v11,  "launch"));

  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472LL;
  v120[2] = sub_10004BBF8;
  v120[3] = &unk_10018E9B0;
  objc_copyWeak(&v121, &location);
  [v12 setUpdateBlock:v120];
  [v12 setHidden:1];
  -[NSMutableArray addObject:](v4, "addObject:", v12);
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v4));
  v91 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  uint64_t v14 = TSKLocString(@"AboutMarketingPartNumberTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v15,  0LL,  v95,  @"marketingNumber"));

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472LL;
  v118[2] = sub_10004BC40;
  v118[3] = &unk_10018E9B0;
  objc_copyWeak(&v119, &location);
  [v16 setUpdateBlock:v118];
  -[NSMutableArray addObject:](v13, "addObject:", v16);
  uint64_t v17 = TSKLocString(@"AboutModelTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v18,  0LL,  v95,  @"modelDescription"));

  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472LL;
  v116[2] = sub_10004BC90;
  v116[3] = &unk_10018E9B0;
  objc_copyWeak(&v117, &location);
  [v19 setUpdateBlock:v116];
  -[NSMutableArray addObject:](v13, "addObject:", v19);
  uint64_t v20 = TSKLocString(@"AboutSerialNumberTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v21,  0LL,  v95,  @"serialNumber"));

  -[NSMutableArray addObject:](v13, "addObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v23 systemName]);

  uint64_t v24 = TSKLocString(v90);
  uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v25,  0LL,  v95,  @"systemSoftwareVersion"));

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472LL;
  v114[2] = sub_10004BD0C;
  v114[3] = &unk_10018E9B0;
  objc_copyWeak(&v115, &location);
  [v26 setUpdateBlock:v114];
  -[NSMutableArray addObject:](v13, "addObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v95 HDMIFirmwareVersion]);
  LOBYTE(v25) = [v27 length] == 0;

  if ((v25 & 1) != 0)
  {
    v30 = v26;
  }

  else
  {
    uint64_t v28 = TSKLocString(@"AboutHDMIFirmwareTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v29,  0LL,  v95,  @"HDMIFirmwareVersion"));

    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472LL;
    v112[2] = sub_10004BD90;
    v112[3] = &unk_10018E9B0;
    objc_copyWeak(&v113, &location);
    [v30 setUpdateBlock:v112];
    -[NSMutableArray addObject:](v13, "addObject:", v30);
    objc_destroyWeak(&v113);
  }

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  uint64_t v31 = TSKLocString(@"AboutResolutionTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v32,  0LL,  v89,  @"currentDisplayMode"));

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayManager displayResolutionFormatter]( &OBJC_CLASS___PBSDisplayManager,  "displayResolutionFormatter"));
  [v33 setLocalizedValueFormatter:v34];

  -[NSMutableArray addObject:](v13, "addObject:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472LL;
  v110[2] = sub_10004BDE0;
  v110[3] = &unk_10018E9B0;
  objc_copyWeak(&v111, &location);
  v94 = objc_retainBlock(v110);
  uint64_t v36 = TSKWiFiLocString(@"AboutWifiNetworkTitle_WIFI");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v37,  0LL,  v35,  @"networkName"));

  [v38 setUpdateBlock:v94];
  -[NSMutableArray addObject:](v13, "addObject:", v38);
  uint64_t v39 = TSKLocString(@"AboutIPTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v40,  0LL,  v35,  @"IPAddress"));

  [v41 setUpdateBlock:v94];
  -[NSMutableArray addObject:](v13, "addObject:", v41);
  uint64_t v42 = TSKWiFiLocString(@"AboutWifiAddressTitle_WIFI");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v43,  0LL,  v35,  @"hardwareAddress"));

  [v44 setUpdateBlock:v94];
  -[NSMutableArray addObject:](v13, "addObject:", v44);
  uint64_t v45 = TSKLocString(@"AboutSignalStrengthTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v46,  0LL,  v35,  @"associatedNetwork.signalStrength"));

  [v47 setUpdateBlock:v94];
  -[NSMutableArray addObject:](v13, "addObject:", v47);
  objc_storeStrong((id *)&self->_wifiSignalStrengthItem, v47);
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472LL;
  v108[2] = sub_10004BE30;
  v108[3] = &unk_10018E9B0;
  objc_copyWeak(&v109, &location);
  v92 = objc_retainBlock(v108);
  uint64_t v48 = TSKLocString(@"AboutIPTitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v49,  0LL,  v93,  @"IPAddress"));

  [v50 setUpdateBlock:v92];
  -[NSMutableArray addObject:](v13, "addObject:", v50);
  uint64_t v51 = TSKLocString(@"AboutEthernetAddressTitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v52,  0LL,  v93,  @"hardwareAddress"));

  [v53 setUpdateBlock:v92];
  -[NSMutableArray addObject:](v13, "addObject:", v53);
  if ((+[TVSDevice isActivated](&OBJC_CLASS___TVSDevice, "isActivated") & 1) == 0)
  {
    uint64_t v54 = TSKLocString(@"AboutActivationTitle");
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v55,  0LL,  0LL,  0LL));

    [v56 setUpdateBlock:&stru_100190780];
    -[NSMutableArray addObject:](v13, "addObject:", v56);
  }

  uint64_t v57 = TSKWiFiLocString(@"AboutWiFiBSSIDTitle_WIFI");
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v58,  0LL,  v35,  @"associatedNetwork.networkBSSID"));

  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472LL;
  v106[2] = sub_10004BED0;
  v106[3] = &unk_10018E9B0;
  objc_copyWeak(&v107, &location);
  [v59 setUpdateBlock:v106];
  -[NSMutableArray addObject:](v13, "addObject:", v59);
  uint64_t v60 = TSKWiFiLocString(@"AboutWiFiChannelTitle_WIFI");
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v61,  0LL,  v35,  @"associatedNetwork.channel"));

  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472LL;
  v104[2] = sub_10004BF24;
  v104[3] = &unk_10018E9B0;
  objc_copyWeak(&v105, &location);
  [v62 setUpdateBlock:v104];
  -[NSMutableArray addObject:](v13, "addObject:", v62);
  uint64_t v63 = TSKLocString(@"AboutBonjourIDTitle");
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  id v65 = +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v64,  0LL,  objc_opt_class(&OBJC_CLASS___TVSDevice),  @"bonjourID");
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_10004BF78;
  v102[3] = &unk_10018E9B0;
  objc_copyWeak(&v103, &location);
  [v66 setUpdateBlock:v102];
  -[NSMutableArray addObject:](v13, "addObject:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v68 = TSKLocStringFromBundleCachingKey(@"AboutThreadIDTitle", v67, 1LL, 0LL, @"Localizable-j305");
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v69,  0LL,  v95,  @"threadID"));

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_10004BFCC;
  v100[3] = &unk_10018E9B0;
  objc_copyWeak(&v101, &location);
  [v70 setUpdateBlock:v100];
  -[NSMutableArray addObject:](v13, "addObject:", v70);
  uint64_t v71 = TSKLocString(@"AboutAdvertisingIDItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[ASIdentifierManager sharedManager](&OBJC_CLASS___ASIdentifierManager, "sharedManager"));
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v72,  0LL,  v73,  @"advertisingIdentifier"));

  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472LL;
  v98[2] = sub_10004C020;
  v98[3] = &unk_10018E9B0;
  objc_copyWeak(&v99, &location);
  [v74 setUpdateBlock:v98];
  -[NSMutableArray addObject:](v13, "addObject:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[TVPMusicSettings sharedInstance](&OBJC_CLASS___TVPMusicSettings, "sharedInstance"));
  uint64_t v76 = TSKLocString(@"AboutTiltIDItem");
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v77,  0LL,  v75,  @"musicAdvertisingIdentifier"));

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_10004C0A0;
  v96[3] = &unk_10018E9B0;
  objc_copyWeak(&v97, &location);
  [v78 setUpdateBlock:v96];
  -[NSMutableArray addObject:](v13, "addObject:", v78);
  -[NSMutableArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", &stru_1001907A0);
  -[TSKSettingGroup setSettingItems:](v91, "setSettingItems:", v13);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  uint64_t v80 = TSKLocString(@"AboutCertificateTrustTitle");
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  id v82 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v81,  0LL,  v88,  @"trustCertificates",  objc_opt_class(&OBJC_CLASS___TVSettingsCertificateTrustViewController));
  v83 = (void *)objc_claimAutoreleasedReturnValue(v82);

  [v83 setUpdateBlock:&stru_1001907C0];
  [v79 addObject:v83];
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v79));
  v127[0] = v87;
  v127[1] = v91;
  v127[2] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 3LL));

  objc_destroyWeak(&v97);
  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v107);

  objc_destroyWeak(&v109);
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v115);
  objc_destroyWeak(&v117);
  objc_destroyWeak(&v119);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&v125);

  objc_destroyWeak(&location);
  return v85;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController nameViewController](self, "nameViewController"));

  if (v11 == v8)
  {
    -[TVSettingsAboutViewController _setDeviceName:](self, "_setDeviceName:", v10);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
    -[TVSettingsAboutViewController editingController:didProvideValue:forSettingItem:]( &v12,  "editingController:didProvideValue:forSettingItem:",  v8,  v10,  v9);
  }
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
  id v3 = -[TVSettingsAboutViewController previewForItemAtIndexPath:](&v13, "previewForItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    NSAttributedStringKey v14 = NSFontAttributeName;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

    id v8 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v9 = TSKLocString(@"AboutCopyrightString");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = -[NSAttributedString initWithString:attributes:](v8, "initWithString:attributes:", v10, v7);

    [v4 setAttributedDescriptionText:v11];
  }

  return v4;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 canFocus];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  if (v8 == self->_wifiSignalStrengthItem)
  {
    objc_super v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsSignalStrengthCell);
    objc_super v13 = NSStringFromClass(v12);
    NSAttributedStringKey v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7]);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedTitle](v8, "localizedTitle"));
    [v15 setText:v16];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", v8));
    [v11 floatValue];
    objc_msgSend(v10, "setSignalStrength:");
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
    id v9 = -[TVSettingsAboutViewController tableView:cellForRowAtIndexPath:]( &v18,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
    [v11 setAdjustsFontSizeToFitWidth:1];
  }

  return v10;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnosticsTicketController](self, "diagnosticsTicketController"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 actions]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 text]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
    id v10 = [v9 checkTicketNumber:v8];

    [v7 setEnabled:v10];
    if ((_DWORD)v10)
    {
      uint64_t v11 = TSKLocString(@"AboutDiagnosticsTicketDescription");
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v5 setMessage:v12];
    }

    else
    {
      uint64_t v13 = TSKLocString(@"AboutDiagnosticsTicketError");
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      NSAttributedStringKey v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\n%@", v12));
      [v5 setMessage:v14];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF9F8 == a6)
  {
    -[TVSettingsAboutViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsAboutViewController;
    -[TVSettingsAboutViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_handleDownGesture:(id)a3
{
}

- (void)_handleUpGesture:(id)a3
{
}

- (void)_handlePlayPauseGesture:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  uint64_t v5 = TSKLocString(@"AboutDiagnosticsTicketTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"AboutDiagnosticsTicketDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

  objc_initWeak(&from, v9);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10004C990;
  v23[3] = &unk_1001907E8;
  objc_copyWeak(&v24, location);
  [v9 addTextFieldWithConfigurationHandler:v23];
  uint64_t v10 = TSKLocString(@"AboutDiagnosticsTicketStartTitle");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004CA08;
  v19[3] = &unk_100190810;
  objc_copyWeak(&v21, location);
  id v12 = v9;
  id v20 = v12;
  objc_copyWeak(&v22, &from);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v19));

  [v13 setEnabled:0];
  [v12 addAction:v13];
  uint64_t v14 = TSKLocString(@"Cancel");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004CAC0;
  v18[3] = &unk_10018F018;
  v18[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  v18));

  [v12 addAction:v16];
  -[TVSettingsAboutViewController setDiagnosticsTicketController:](self, "setDiagnosticsTicketController:", v12);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController navigationController](self, "navigationController"));
  [v17 presentViewController:v12 animated:1 completion:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);

  objc_destroyWeak(location);
}

- (void)_updateDiagnosticsItem:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController diagnostics](self, "diagnostics"));
  id v5 = [v4 sessionState];

  if (v5 == (id)1)
  {
    id v8 = @"AboutDiagnosticsStartTitle";
LABEL_6:
    uint64_t v9 = TSKLocString(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v11 setLocalizedTitle:v10];

    [v11 setHidden:0];
    goto LABEL_7;
  }

  if (v5)
  {
    id v8 = @"AboutDiagnosticsResumeTitle";
    goto LABEL_6;
  }

  [v11 setHidden:1];
  uint64_t v6 = TSKLocString(@"AboutDiagnosticsStartTitle");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v11 setLocalizedTitle:v7];

LABEL_7:
}

- (BOOL)_showWiFiSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  char v3 = [v2 isActive] ^ 1;

  return v3;
}

- (BOOL)_hasTiltID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPMusicSettings sharedInstance](&OBJC_CLASS___TVPMusicSettings, "sharedInstance"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 musicAdvertisingIdentifier]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_advanceMoreInfoItem
{
  do
  {
    while (1)
    {
      while (1)
      {
        unint64_t v3 = (self->_currentMoreInfoItemType + 1) % 7;
        self->_currentMoreInfoItemType = v3;
        if (v3 - 1 >= 2) {
          break;
        }
        if (-[TVSettingsAboutViewController _showWiFiSettings](self, "_showWiFiSettings")) {
          return;
        }
      }

      if (v3 != 4) {
        break;
      }
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 threadID]);
      id v6 = [v5 length];

      if (v6) {
        return;
      }
    }
  }

  while (v3 == 6 && !-[TVSettingsAboutViewController _hasTiltID](self, "_hasTiltID"));
}

- (id)_nameViewControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  uint64_t v6 = TSKLocString(@"NameChooseDeviceName");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TSKTextInputViewController setHeaderText:](v5, "setHeaderText:", v7);

  uint64_t v8 = TSKLocString(@"NameEnterNameText");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[TSKTextInputViewController setMessageText:](v5, "setMessageText:", v9);

  -[TSKTextInputViewController setEditingDelegate:](v5, "setEditingDelegate:", self);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedValueForSettingItem:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedValueForSettingItem:",  v4));

  if ((TVCSIsStringAppleTV(v10) & 1) == 0) {
    -[TSKTextInputViewController setInitialText:](v5, "setInitialText:", v10);
  }
  -[TVSettingsAboutViewController setNameViewController:](self, "setNameViewController:", v5);

  return v5;
}

- (void)_setDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  if (![v6 length])
  {

    uint64_t v6 = 0LL;
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004D040;
  v18[3] = &unk_100190838;
  v18[4] = self;
  uint64_t v7 = objc_retainBlock(v18);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  if ([v8 homeConfigurationState] == (id)4)
  {
    uint64_t v10 = TVCSHomeLog(4LL, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[TVSettingsAboutViewController _setDeviceName:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Setting local accessory name.",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004D0C4;
    v15[3] = &unk_100190860;
    v15[4] = self;
    uint64_t v17 = v7;
    id v16 = v8;
    [v12 setConfiguredName:v6 completionHandler:v15];
  }

  else if (v6)
  {
    ((void (*)(void *, void *))v7[2])(v7, v6);
  }

  else
  {
    uint64_t v13 = TSKLocString(@"DefaultName");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(void *, void *))v7[2])(v7, v14);
  }
}

- (void)_presentSetAccessoryNameFailedViewControllerWithError:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TVCSHomeKitErrorUtilities localizedMessageForHomeKitError:]( &OBJC_CLASS___TVCSHomeKitErrorUtilities,  "localizedMessageForHomeKitError:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  1LL));
  uint64_t v5 = TSKLocString(@"OK");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  0LL));
  [v4 addAction:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAboutViewController navigationController](self, "navigationController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topViewController]);
  [v9 presentViewController:v4 animated:1 completion:0];
}

- (BOOL)showPartNumberAndFirmwareVersion
{
  return self->_showPartNumberAndFirmwareVersion;
}

- (void)setShowPartNumberAndFirmwareVersion:(BOOL)a3
{
  self->_showPartNumberAndFirmwareVersion = a3;
}

- (TSKSettingItem)wifiSignalStrengthItem
{
  return self->_wifiSignalStrengthItem;
}

- (void)setWifiSignalStrengthItem:(id)a3
{
}

- (unint64_t)currentMoreInfoItemType
{
  return self->_currentMoreInfoItemType;
}

- (void)setCurrentMoreInfoItemType:(unint64_t)a3
{
  self->_currentMoreInfoItemType = a3;
}

- (UIGestureRecognizer)downButtonRecognizer
{
  return self->_downButtonRecognizer;
}

- (void)setDownButtonRecognizer:(id)a3
{
}

- (UIGestureRecognizer)playPauseButtonRecognizer
{
  return self->_playPauseButtonRecognizer;
}

- (void)setPlayPauseButtonRecognizer:(id)a3
{
}

- (UIAlertController)diagnosticsTicketController
{
  return self->_diagnosticsTicketController;
}

- (void)setDiagnosticsTicketController:(id)a3
{
}

- (TVSettingsDiagnosticsController)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (TSKSettingItemEditingController)nameViewController
{
  return (TSKSettingItemEditingController *)objc_loadWeakRetained((id *)&self->_nameViewController);
}

- (void)setNameViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end