@interface SATVNetworkConfigurationWizardViewController
- (SATVNetworkConfigurationWizardDelegate)wizardDelegate;
- (SATVNetworkConfigurationWizardViewController)initWithInitialMode:(unint64_t)a3 networkInterface:(id)a4;
- (TVSEthernetInterface)interface;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)_beginWizardFlowForOption:(int64_t)a3;
- (void)_beginWizardFlowFromCurrentMode;
- (void)_didSelectMenu;
- (void)_disableDHCP;
- (void)_disableDNS;
- (void)_enableDHCP;
- (void)_updateHeaderForMode;
- (void)_wizardCanceled;
- (void)_wizardComplete;
- (void)loadView;
- (void)setInterface:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setWizardDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SATVNetworkConfigurationWizardViewController

- (SATVNetworkConfigurationWizardViewController)initWithInitialMode:(unint64_t)a3 networkInterface:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationWizardViewController;
  v8 = -[SATVTableViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_interface, a4);
  }

  return v9;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVNetworkConfigurationWizardViewController;
  -[SATVTableViewController loadView](&v9, "loadView");
  -[SATVTableViewController setHorizontallyCentered:](self, "setHorizontallyCentered:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(UITableViewCell) forCellReuseIdentifier:@"kNetworkConfigurationChoiceCellIdentifier"];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v4 setDelegate:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v5 setDataSource:self];

  v6 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SATVPreviewTableViewController setBannerView:](self, "setBannerView:", v6);

  -[SATVTableViewController setCustomContentTopInset:](self, "setCustomContentTopInset:", 127.0);
  -[SATVTableViewController setTableViewWidth:](self, "setTableViewWidth:", 950.0);
  -[SATVNetworkConfigurationWizardViewController _updateHeaderForMode](self, "_updateHeaderForMode");
  id v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_didSelectMenu");
  -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_1000D1040);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &__NSArray0__struct);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController view](self, "view"));
  [v8 addGestureRecognizer:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"kNetworkConfigurationChoiceCellIdentifier" forIndexPath:v5]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 textLabel]);
  [v7 setTextAlignment:1];

  if (![v5 row])
  {
    v8 = @"NETWORK_CONFIGURE_MODE_AUTO";
    goto LABEL_5;
  }

  if ([v5 row] == (id)1)
  {
    v8 = @"NETWORK_CONFIGURE_MODE_MANUAL";
LABEL_5:
    id v9 = sub_10000D7CC(v8, @"Localizable");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v6 textLabel]);
    [v11 setText:v10];
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2LL;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 72.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 row])
  {
    if ([v5 row] == (id)1) {
      -[SATVNetworkConfigurationWizardViewController _beginWizardFlowFromCurrentMode]( self,  "_beginWizardFlowFromCurrentMode");
    }
  }

  else
  {
    -[SATVNetworkConfigurationWizardViewController _enableDHCP](self, "_enableDHCP");
    -[SATVNetworkConfigurationWizardViewController _wizardComplete](self, "_wizardComplete");
  }
}

- (void)_enableDHCP
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v3 setShouldUseDHCP:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v4 setShouldUseDefaultDNS:1];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v5 setIPAddress:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v6 setSubnetMask:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v7 setRouterAddress:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v8 setPrimaryDNSAddress:0];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v9 setDnsAddresses:0];
}

- (void)_disableDHCP
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v3 setShouldUseDHCP:0];

  -[SATVNetworkConfigurationWizardViewController _disableDNS](self, "_disableDNS");
}

- (void)_disableDNS
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController interface](self, "interface"));
  [v2 setShouldUseDefaultDNS:0];
}

- (void)_updateHeaderForMode
{
  if (-[SATVNetworkConfigurationWizardViewController mode](self, "mode"))
  {
    if ((id)-[SATVNetworkConfigurationWizardViewController mode](self, "mode") != (id)1)
    {
      id v12 = 0LL;
      id v7 = 0LL;
      goto LABEL_7;
    }

    v3 = @"NETWORK_CONFIGURE_DNS_MESSAGE";
    v4 = @"NETWORK_CONFIGURE_DNS";
  }

  else
  {
    v3 = @"NETWORK_CONFIGURE_IP_MESSAGE";
    v4 = @"NETWORK_CONFIGURE_IP";
  }

  id v5 = sub_10000D7CC(v4, @"Localizable");
  id v12 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = sub_10000D7CC(v3, @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 titleLabel]);
  [v9 setText:v12];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 subtitleLabel]);
  [v11 setText:v7];
}

- (void)_didSelectMenu
{
}

- (void)_wizardComplete
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController wizardDelegate](self, "wizardDelegate"));
  [v3 didCompleteNetworkConfigurationWizard:self];
}

- (void)_wizardCanceled
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController wizardDelegate](self, "wizardDelegate"));
  [v3 didCancelNetworkConfigurationWizard:self];
}

- (void)_beginWizardFlowFromCurrentMode
{
  if (-[SATVNetworkConfigurationWizardViewController mode](self, "mode"))
  {
    if ((id)-[SATVNetworkConfigurationWizardViewController mode](self, "mode") != (id)1) {
      return;
    }
    -[SATVNetworkConfigurationWizardViewController _disableDNS](self, "_disableDNS");
    uint64_t v3 = 5LL;
  }

  else
  {
    -[SATVNetworkConfigurationWizardViewController _disableDHCP](self, "_disableDHCP");
    uint64_t v3 = 1LL;
  }

  -[SATVNetworkConfigurationWizardViewController _beginWizardFlowForOption:](self, "_beginWizardFlowForOption:", v3);
}

- (void)_beginWizardFlowForOption:(int64_t)a3
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  v8[3] = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkConfigurationWizardViewController wizardDelegate](self, "wizardDelegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100034C5C;
  v6[3] = &unk_1000CA168;
  objc_copyWeak(&v7, &location);
  v6[4] = v8;
  [v5 didRequestEntryForOption:a3 completion:v6];

  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);
  objc_destroyWeak(&location);
}

- (SATVNetworkConfigurationWizardDelegate)wizardDelegate
{
  return (SATVNetworkConfigurationWizardDelegate *)objc_loadWeakRetained((id *)&self->_wizardDelegate);
}

- (void)setWizardDelegate:(id)a3
{
}

- (TVSEthernetInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
}

@end