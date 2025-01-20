@interface TVSettingsNetworkConfigureIPWizardViewController
- (BOOL)becomeFirstResponder;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (TVSEthernetInterface)interface;
- (TVSettingsIPEntryViewController)currentViewController;
- (TVSettingsNetworkConfigureIPWizardViewController)initWithInterface:(id)a3;
- (id)_configureDNSAddressVC;
- (id)_configureIPAddressVC;
- (id)_configureRouterAddressVC;
- (id)_configureSubnetMaskVC;
- (id)_viewControllerForState:(int64_t)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_initialState;
- (int64_t)currentState;
- (void)_menuPressed:(id)a3;
- (void)_setAutomaticConfigurationEnabled:(BOOL)a3;
- (void)_transitionFrom:(id)a3 to:(id)a4;
- (void)ipEntryViewControllerDidFinish:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsNetworkConfigureIPWizardViewController

- (TVSettingsNetworkConfigureIPWizardViewController)initWithInterface:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkConfigureIPWizardViewController;
  v6 = -[TVSettingsNetworkConfigureIPWizardViewController init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interface, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 IPAddress]);
    v9 = (NSString *)[v8 copy];
    ipAddress = v7->_ipAddress;
    v7->_ipAddress = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 subnetMask]);
    v12 = (NSString *)[v11 copy];
    subnetMask = v7->_subnetMask;
    v7->_subnetMask = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 routerAddress]);
    v15 = (NSString *)[v14 copy];
    routerAddress = v7->_routerAddress;
    v7->_routerAddress = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsAddresses]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
    v19 = (NSString *)[v18 copy];
    primaryDNSAddress = v7->_primaryDNSAddress;
    v7->_primaryDNSAddress = v19;

    v7->_currentState = -[TVSettingsNetworkConfigureIPWizardViewController _initialState](v7, "_initialState");
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkConfigureIPWizardViewController;
  -[TVSettingsNetworkConfigureIPWizardViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (TVSettingsIPEntryViewController *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _viewControllerForState:]( self,  "_viewControllerForState:",  -[TVSettingsNetworkConfigureIPWizardViewController currentState]( self,  "currentState")));
  currentViewController = self->_currentViewController;
  self->_currentViewController = v3;

  -[TVSettingsNetworkConfigureIPWizardViewController addChildViewController:]( self,  "addChildViewController:",  self->_currentViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController view](self->_currentViewController, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController view](self, "view"));
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController view](self->_currentViewController, "view"));
  [v7 addSubview:v8];

  -[TVSettingsIPEntryViewController didMoveToParentViewController:]( self->_currentViewController,  "didMoveToParentViewController:",  self);
  v9 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v9, "setAllowedPressTypes:", &off_1001AEE00);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v9, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[UITapGestureRecognizer setDelegate:](v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController view](self, "view"));
  [v10 addGestureRecognizer:v9];
}

- (BOOL)becomeFirstResponder
{
  return -[TVSettingsIPEntryViewController becomeFirstResponder](self->_currentViewController, "becomeFirstResponder");
}

- (id)preferredFocusEnvironments
{
  return -[TVSettingsIPEntryViewController preferredFocusEnvironments]( self->_currentViewController,  "preferredFocusEnvironments");
}

- (void)ipEntryViewControllerDidFinish:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 ipAddress]);
  id obj = [v4 copy];

  if (!-[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState"))
  {
    id v5 = &OBJC_IVAR___TVSettingsNetworkConfigureIPWizardViewController__ipAddress;
    uint64_t v6 = 1LL;
    goto LABEL_7;
  }

  if ((id)-[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState") == (id)1)
  {
    id v5 = &OBJC_IVAR___TVSettingsNetworkConfigureIPWizardViewController__subnetMask;
    uint64_t v6 = 2LL;
LABEL_7:
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v5), obj);
    -[TVSettingsNetworkConfigureIPWizardViewController setCurrentState:](self, "setCurrentState:", v6);
    goto LABEL_8;
  }

  if ((id)-[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState") == (id)2)
  {
    id v5 = &OBJC_IVAR___TVSettingsNetworkConfigureIPWizardViewController__routerAddress;
    uint64_t v6 = 3LL;
    goto LABEL_7;
  }

  if ((id)-[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState") == (id)3)
  {
    objc_storeStrong((id *)&self->_primaryDNSAddress, obj);
    -[TVSettingsNetworkConfigureIPWizardViewController _setAutomaticConfigurationEnabled:]( self,  "_setAutomaticConfigurationEnabled:",  0LL);
    goto LABEL_9;
  }

- (void)_menuPressed:(id)a3
{
  uint64_t v4 = -[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState", a3);
  if (v4 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  -[TVSettingsNetworkConfigureIPWizardViewController setCurrentState:](self, "setCurrentState:", v5 - 1);
  uint64_t v6 = (TVSettingsIPEntryViewController *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _viewControllerForState:]( self,  "_viewControllerForState:",  -[TVSettingsNetworkConfigureIPWizardViewController currentState]( self,  "currentState")));
  v7 = self->_currentViewController;
  -[TVSettingsNetworkConfigureIPWizardViewController _transitionFrom:to:](self, "_transitionFrom:to:", v7, v6);
  currentViewController = self->_currentViewController;
  self->_currentViewController = v6;
  v9 = v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int64_t v4 = -[TVSettingsNetworkConfigureIPWizardViewController _initialState](self, "_initialState", a3);
  return v4 != -[TVSettingsNetworkConfigureIPWizardViewController currentState](self, "currentState");
}

- (int64_t)_initialState
{
  return 0LL;
}

- (void)_setAutomaticConfigurationEnabled:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController interface](self, "interface"));
  uint64_t v6 = v5;
  if (a3)
  {
    [v5 setShouldUseDHCP:1];
    [v6 setShouldUseDefaultDNS:1];
  }

  else
  {
    [v5 setPrimaryDNSAddress:self->_primaryDNSAddress];
    [v6 setShouldUseDefaultDNS:0];
    if ((id)-[TVSettingsNetworkConfigureIPWizardViewController _initialState](self, "_initialState") != (id)3)
    {
      [v6 setShouldUseDHCP:0];
      [v6 setIPAddress:self->_ipAddress];
      [v6 setSubnetMask:self->_subnetMask];
      [v6 setRouterAddress:self->_routerAddress];
    }
  }

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007CA80;
  v7[3] = &unk_10018F498;
  objc_copyWeak(&v8, &location);
  [v6 commitChangesWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_viewControllerForState:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _configureIPAddressVC]( self,  "_configureIPAddressVC",  v3,  v4));
      break;
    case 1LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _configureSubnetMaskVC]( self,  "_configureSubnetMaskVC",  v3,  v4));
      break;
    case 2LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _configureRouterAddressVC]( self,  "_configureRouterAddressVC",  v3,  v4));
      break;
    case 3LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkConfigureIPWizardViewController _configureDNSAddressVC]( self,  "_configureDNSAddressVC",  v3,  v4));
      break;
    default:
      uint64_t v5 = 0LL;
      break;
  }

  return v5;
}

- (id)_configureIPAddressVC
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsIPEntryViewController);
  uint64_t v4 = TSKLocString(@"NetworkConfigureIPEntryTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsIPEntryViewController setTitle:](v3, "setTitle:", v5);

  uint64_t v6 = TSKLocString(@"NetworkConfigureIPEntryPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVSettingsIPEntryViewController setPrompt:](v3, "setPrompt:", v7);

  -[TVSettingsIPEntryViewController setIpAddress:](v3, "setIpAddress:", self->_ipAddress);
  -[TVSettingsIPEntryViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_configureSubnetMaskVC
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsIPEntryViewController);
  uint64_t v4 = TSKLocString(@"NetworkConfigureSubnetEntryTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsIPEntryViewController setTitle:](v3, "setTitle:", v5);

  uint64_t v6 = TSKLocString(@"NetworkConfigureSubnetEntryPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVSettingsIPEntryViewController setPrompt:](v3, "setPrompt:", v7);

  -[TVSettingsIPEntryViewController setIpAddress:](v3, "setIpAddress:", self->_subnetMask);
  -[TVSettingsIPEntryViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_configureRouterAddressVC
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsIPEntryViewController);
  uint64_t v4 = TSKLocString(@"NetworkConfigureRouterEntryTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsIPEntryViewController setTitle:](v3, "setTitle:", v5);

  uint64_t v6 = TSKLocString(@"NetworkConfigureRouterEntryPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVSettingsIPEntryViewController setPrompt:](v3, "setPrompt:", v7);

  -[TVSettingsIPEntryViewController setIpAddress:](v3, "setIpAddress:", self->_routerAddress);
  -[TVSettingsIPEntryViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_configureDNSAddressVC
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsIPEntryViewController);
  uint64_t v4 = TSKLocString(@"NetworkConfigureDNSEntryTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsIPEntryViewController setTitle:](v3, "setTitle:", v5);

  uint64_t v6 = TSKLocString(@"NetworkConfigureDNSEntryPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVSettingsIPEntryViewController setPrompt:](v3, "setPrompt:", v7);

  -[TVSettingsIPEntryViewController setIpAddress:](v3, "setIpAddress:", self->_primaryDNSAddress);
  -[TVSettingsIPEntryViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)_transitionFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[TVSettingsNetworkConfigureIPWizardViewController addChildViewController:](self, "addChildViewController:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController view](self, "view"));
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  [v10 setAlpha:0.0];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkConfigureIPWizardViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  [v11 addSubview:v12];

  [v6 willMoveToParentViewController:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007CF58;
  v19[3] = &unk_10018E468;
  id v20 = v7;
  id v21 = v6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007CFB4;
  v15[3] = &unk_100191BB8;
  id v16 = v20;
  v17 = self;
  id v18 = v21;
  id v13 = v21;
  id v14 = v20;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v19,  v15,  0.5,  0.0);
}

- (TVSEthernetInterface)interface
{
  return self->_interface;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (TVSettingsIPEntryViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end