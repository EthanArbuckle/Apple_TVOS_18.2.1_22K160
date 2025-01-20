@interface SATVNetworkConfigurationViewController
- (BOOL)_isCellEnabledForConfigurationOption:(int64_t)a3;
- (SATVNetworkConfigurationDelegate)configurationDelegate;
- (SATVNetworkConfigurationViewController)init;
- (TVSEthernetInterface)activeInterface;
- (UIButton)doneButton;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_detailTextForConfigurationOption:(int64_t)a3;
- (id)_ipValueForConfigurationOption:(int64_t)a3;
- (id)_keyPathForConfigurationOption:(int64_t)a3;
- (id)_titleForActiveInterface;
- (id)_titleForConfigurationOption:(int64_t)a3;
- (id)ipEntryCompletionBlock;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_cellAccessoryTypeForConfigurationOption:(int64_t)a3;
- (int64_t)currentlyEditedConfigurationOption;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didSelectMenu;
- (void)_doneButtonSelected:(id)a3;
- (void)_handleInactiveInterfaceIfNeeded;
- (void)_setIPValue:(id)a3 forNetworkConfigurationOption:(int64_t)a4;
- (void)_setupObserversForInterface:(id)a3;
- (void)_teardownObserversForInterface:(id)a3;
- (void)_updateTableCellForKeyPath:(id)a3;
- (void)dealloc;
- (void)didCancelNetworkConfigurationWizard:(id)a3;
- (void)didCompleteNetworkConfigurationWizard:(id)a3;
- (void)didRequestEntryForOption:(int64_t)a3 completion:(id)a4;
- (void)ipEntryViewControllerDidFinish:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveInterface:(id)a3;
- (void)setConfigurationDelegate:(id)a3;
- (void)setCurrentlyEditedConfigurationOption:(int64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setIpEntryCompletionBlock:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVNetworkConfigurationViewController

- (SATVNetworkConfigurationViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationViewController;
  v2 = -[SATVTableViewController init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
    if ([v3 isActive])
    {
      v5 = v3;
    }

    else
    {
      unsigned int v6 = [v4 isActive];
      v5 = v4;
      if (!v6)
      {
LABEL_6:
        -[SATVNetworkConfigurationViewController _setupObserversForInterface:]( v2,  "_setupObserversForInterface:",  v2->_activeInterface);
        v2->_currentlyEditedConfigurationOption = 999LL;

        return v2;
      }
    }

    v7 = v5;
    activeInterface = v2->_activeInterface;
    v2->_activeInterface = v7;

    goto LABEL_6;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
  -[SATVNetworkConfigurationViewController _teardownObserversForInterface:](self, "_teardownObserversForInterface:", v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationViewController;
  -[SATVNetworkConfigurationViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationViewController;
  -[SATVPreviewTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVNetworkConfigurationViewController _handleInactiveInterfaceIfNeeded](self, "_handleInactiveInterfaceIfNeeded");
}

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationViewController;
  -[SATVTableViewController loadView](&v25, "loadView");
  -[SATVTableViewController setHorizontallyCentered:](self, "setHorizontallyCentered:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v3 setDelegate:self];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v4 setDataSource:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend( v5,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(_SATVNetworkConfigurationCell, v6),  @"kNetworkConfigurationCellIdentifier");

  -[SATVTableViewController setTableViewWidth:](self, "setTableViewWidth:", 950.0);
  v7 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SATVPreviewTableViewController setBannerView:](self, "setBannerView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController _titleForActiveInterface](self, "_titleForActiveInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 titleLabel]);
  [v10 setText:v8];

  -[SATVTableViewController setCustomContentTopInset:](self, "setCustomContentTopInset:", 127.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
  -[SATVNetworkConfigurationViewController setDoneButton:](self, "setDoneButton:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  id v13 = sub_10000D7CC(@"NETWORK_CONFIGURE_DONE", @"Localizable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setTitle:v14 forState:0];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 titleLabel]);
  [v17 setFont:v15];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 titleLabel]);
  [v19 setTextAlignment:1];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  [v20 addTarget:self action:"_doneButtonSelected:" forControlEvents:0x2000];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  [v21 addSubview:v22];

  v23 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_didSelectMenu");
  -[UITapGestureRecognizer setAllowedPressTypes:](v23, "setAllowedPressTypes:", &off_1000D0FB0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v23, "setAllowedTouchTypes:", &__NSArray0__struct);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController view](self, "view"));
  [v24 addGestureRecognizer:v23];
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationViewController;
  -[SATVTableViewController viewDidLayoutSubviews](&v34, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController view](self, "view"));
  [v3 bounds];
  double v32 = v5;
  double v33 = v4;
  double v31 = v6;
  double v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setFrame:", v11, v13, v15, 640.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  objc_msgSend(v17, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v19 = v18;
  double v21 = v20;

  v35.origin.x = v11;
  v35.origin.y = v13;
  v35.size.width = v15;
  v35.size.height = 640.0;
  double MaxY = CGRectGetMaxY(v35);
  double v23 = UIRectCenteredXInRect(CGPointZero.x, MaxY, v19, v21, v33, v32, v31, v8);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController doneButton](self, "doneButton"));
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)_didSelectMenu
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController configurationDelegate](self, "configurationDelegate"));
  [v2 didCompleteNetworkConfiguration];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"kNetworkConfigurationCellIdentifier" forIndexPath:v6]);
  objc_msgSend( v7,  "setAccessoryType:",  -[SATVNetworkConfigurationViewController _cellAccessoryTypeForConfigurationOption:]( self,  "_cellAccessoryTypeForConfigurationOption:",  objc_msgSend(v6, "row")));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _titleForConfigurationOption:]( self,  "_titleForConfigurationOption:",  [v6 row]));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v9 setText:v8];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v10 setTextAlignment:0];

  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _detailTextForConfigurationOption:]( self,  "_detailTextForConfigurationOption:",  [v6 row]));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 detailTextLabel]);
  [v12 setText:v11];

  id v13 = [v6 row];
  objc_msgSend( v7,  "setEnabled:",  -[SATVNetworkConfigurationViewController _isCellEnabledForConfigurationOption:]( self,  "_isCellEnabledForConfigurationOption:",  v13));
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 7LL;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    if ([v7 row] != (id)4)
    {
      objc_initWeak(&location, self);
      id v15 = [v7 row];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000101A8;
      v16[3] = &unk_1000C93A0;
      objc_copyWeak(&v17, &location);
      -[SATVNetworkConfigurationViewController didRequestEntryForOption:completion:]( self,  "didRequestEntryForOption:completion:",  v15,  v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      goto LABEL_8;
    }

    double v8 = objc_alloc(&OBJC_CLASS___SATVNetworkConfigurationWizardViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
    double v10 = v8;
    uint64_t v11 = 1LL;
  }

  else
  {
    double v12 = objc_alloc(&OBJC_CLASS___SATVNetworkConfigurationWizardViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
    double v10 = v12;
    uint64_t v11 = 0LL;
  }

  id v13 = -[SATVNetworkConfigurationWizardViewController initWithInitialMode:networkInterface:]( v10,  "initWithInitialMode:networkInterface:",  v11,  v9);

  -[SATVNetworkConfigurationWizardViewController setWizardDelegate:](v13, "setWizardDelegate:", self);
  if (v13)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController navigationController](self, "navigationController"));
    [v14 pushViewController:v13 animated:1];
  }

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 72.0;
}

- (void)didRequestEntryForOption:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  -[SATVNetworkConfigurationViewController setCurrentlyEditedConfigurationOption:]( self,  "setCurrentlyEditedConfigurationOption:",  a3);
  -[SATVNetworkConfigurationViewController setIpEntryCompletionBlock:](self, "setIpEntryCompletionBlock:", v6);

  double v19 = objc_alloc_init(&OBJC_CLASS___SATVIPEntryViewController);
  -[SATVIPEntryViewController setDelegate:](v19, "setDelegate:", self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _titleForConfigurationOption:]( self,  "_titleForConfigurationOption:",  a3));
  -[SATVIPEntryViewController setTitle:](v19, "setTitle:", v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _ipValueForConfigurationOption:]( self,  "_ipValueForConfigurationOption:",  a3));
  -[SATVIPEntryViewController setIpAddress:](v19, "setIpAddress:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController navigationController](self, "navigationController"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 topViewController]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SATVIPEntryViewController, v11);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v12);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController navigationController](self, "navigationController"));
  id v15 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 viewControllers]);
    id v17 = [v16 mutableCopy];

    objc_msgSend(v17, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v17, "count") - 1, v19);
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController navigationController](self, "navigationController"));
    [v18 setViewControllers:v17 animated:1];

    id v15 = v17;
  }

  else
  {
    [v14 pushViewController:v19 animated:1];
  }
}

- (void)didCompleteNetworkConfigurationWizard:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010494;
  v6[3] = &unk_1000C93C8;
  objc_copyWeak(&v7, &location);
  [v5 commitChangesWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)didCancelNetworkConfigurationWizard:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface", a3));
  [v4 discardChanges];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTableViewController navigationController](self, "navigationController"));
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)ipEntryViewControllerDidFinish:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController ipEntryCompletionBlock](self, "ipEntryCompletionBlock"));

  if (v4)
  {
    id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController ipEntryCompletionBlock]( self,  "ipEntryCompletionBlock"));
    -[SATVNetworkConfigurationViewController setIpEntryCompletionBlock:](self, "setIpEntryCompletionBlock:", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 ipAddress]);
    -[SATVNetworkConfigurationViewController _setIPValue:forNetworkConfigurationOption:]( self,  "_setIPValue:forNetworkConfigurationOption:",  v6,  -[SATVNetworkConfigurationViewController currentlyEditedConfigurationOption]( self,  "currentlyEditedConfigurationOption"));

    -[SATVNetworkConfigurationViewController setCurrentlyEditedConfigurationOption:]( self,  "setCurrentlyEditedConfigurationOption:",  999LL);
    v5[2](v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  else {
    -[SATVNetworkConfigurationViewController _updateTableCellForKeyPath:](self, "_updateTableCellForKeyPath:", v7);
  }
}

- (void)_updateTableCellForKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0LL;
  while (1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _keyPathForConfigurationOption:]( self,  "_keyPathForConfigurationOption:",  v5));
    unsigned int v7 = [v4 isEqualToString:v6];

    if (v7) {
      break;
    }
    if (++v5 == 7) {
      goto LABEL_6;
    }
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v5,  0LL));
  uint64_t v11 = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v8 reloadRowsAtIndexPaths:v10 withRowAnimation:100];

LABEL_6:
}

- (void)_setupObserversForInterface:(id)a3
{
  id v6 = a3;
  [v6 addObserver:self forKeyPath:@"active" options:1 context:off_100108488];
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _keyPathForConfigurationOption:]( self,  "_keyPathForConfigurationOption:",  i));
    [v6 addObserver:self forKeyPath:v5 options:3 context:off_100108488];
  }
}

- (void)_teardownObserversForInterface:(id)a3
{
  id v6 = a3;
  [v6 removeObserver:self forKeyPath:@"active" context:off_100108488];
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController _keyPathForConfigurationOption:]( self,  "_keyPathForConfigurationOption:",  i));
    [v6 removeObserver:self forKeyPath:v5 context:off_100108488];
  }
}

- (id)_keyPathForConfigurationOption:(int64_t)a3
{
  else {
    return *(&off_1000C96F0 + a3);
  }
}

- (id)_titleForConfigurationOption:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      v3 = @"NETWORK_CONFIGURE_IP";
      goto LABEL_9;
    case 1LL:
      v3 = @"NETWORK_IP_ADDRESS";
      goto LABEL_9;
    case 2LL:
      v3 = @"NETWORK_SUBNET_MASK";
      goto LABEL_9;
    case 3LL:
      v3 = @"NETWORK_ROUTER";
      goto LABEL_9;
    case 4LL:
      v3 = @"NETWORK_CONFIGURE_DNS";
      goto LABEL_9;
    case 5LL:
      v3 = @"NETWORK_DNS";
LABEL_9:
      id v5 = sub_10000D7CC(v3, @"Localizable");
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6LL:
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
      else {
        double v8 = @"NETWORK_WIFI_ADDRESS";
      }
      id v9 = sub_10000D7CC(v8, @"Localizable");
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v9);

      break;
    default:
      id v4 = 0LL;
      break;
  }

  return v4;
}

- (id)_detailTextForConfigurationOption:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      unsigned int v4 = [v3 shouldUseDHCP];
      goto LABEL_8;
    case 1LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 IPAddress]);
      goto LABEL_14;
    case 2LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 subnetMask]);
      goto LABEL_14;
    case 3LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 routerAddress]);
      goto LABEL_14;
    case 4LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      unsigned int v4 = [v3 shouldUseDefaultDNS];
LABEL_8:
      if (v4) {
        unsigned int v7 = @"NETWORK_CONFIGURE_MODE_AUTO";
      }
      else {
        unsigned int v7 = @"NETWORK_CONFIGURE_MODE_MANUAL";
      }
      id v8 = sub_10000D7CC(v7, @"Localizable");
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v8);
      goto LABEL_14;
    case 5LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 primaryDNSAddress]);
      goto LABEL_14;
    case 6LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 hardwareAddress]);
LABEL_14:
      id v5 = (void *)v6;

      break;
    default:
      id v5 = 0LL;
      break;
  }

  return v5;
}

- (void)_setIPValue:(id)a3 forNetworkConfigurationOption:(int64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    switch(a4)
    {
      case 1LL:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
        [v7 setIPAddress:v6];
        goto LABEL_6;
      case 2LL:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
        [v7 setSubnetMask:v6];
        goto LABEL_6;
      case 3LL:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
        [v7 setRouterAddress:v6];
LABEL_6:

        break;
      case 5LL:
        id v10 = v6;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
        [v9 setDnsAddresses:v8];

        break;
      default:
        break;
    }
  }
}

- (id)_ipValueForConfigurationOption:(int64_t)a3
{
  v3 = 0LL;
  switch(a3)
  {
    case 1LL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 IPAddress]);
      goto LABEL_6;
    case 2LL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 subnetMask]);
      goto LABEL_6;
    case 3LL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 routerAddress]);
      goto LABEL_6;
    case 5LL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 primaryDNSAddress]);
LABEL_6:
      v3 = (void *)v5;

      break;
    default:
      return v3;
  }

  return v3;
}

- (id)_titleForActiveInterface
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSWiFiInterface, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
  }

  else
  {
    id v9 = sub_10000D7CC(@"NETWORK_CONFIGURE_ETHERNET_TITLE", @"Localizable");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v8;
}

- (BOOL)_isCellEnabledForConfigurationOption:(int64_t)a3
{
  if (a3 == 6) {
    return 0;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  uint64_t v18 = v3;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
    return 1;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
  unsigned int v13 = [v12 shouldUseDHCP];
  if ((unint64_t)(a3 - 1) <= 2 && v13)
  {

    return 0;
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkConfigurationViewController activeInterface]( self,  "activeInterface",  v6,  v16,  v17,  v18,  v7,  v8));
  unsigned int v15 = [v14 shouldUseDefaultDNS];

  BOOL result = 1;
  if (a3 == 5 && v15) {
    return 0;
  }
  return result;
}

- (int64_t)_cellAccessoryTypeForConfigurationOption:(int64_t)a3
{
  return a3 != 6;
}

- (void)_handleInactiveInterfaceIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController activeInterface](self, "activeInterface"));
  unsigned __int8 v4 = [v3 isActive];

  if ((v4 & 1) == 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController configurationDelegate](self, "configurationDelegate"));
    [v5 didCompleteNetworkConfiguration];
  }

- (void)_doneButtonSelected:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationViewController configurationDelegate](self, "configurationDelegate", a3));
  [v3 didCompleteNetworkConfiguration];
}

- (SATVNetworkConfigurationDelegate)configurationDelegate
{
  return (SATVNetworkConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_configurationDelegate);
}

- (void)setConfigurationDelegate:(id)a3
{
}

- (TVSEthernetInterface)activeInterface
{
  return self->_activeInterface;
}

- (void)setActiveInterface:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (id)ipEntryCompletionBlock
{
  return self->_ipEntryCompletionBlock;
}

- (void)setIpEntryCompletionBlock:(id)a3
{
}

- (int64_t)currentlyEditedConfigurationOption
{
  return self->_currentlyEditedConfigurationOption;
}

- (void)setCurrentlyEditedConfigurationOption:(int64_t)a3
{
  self->_currentlyEditedConfigurationOption = a3;
}

- (void).cxx_destruct
{
}

@end