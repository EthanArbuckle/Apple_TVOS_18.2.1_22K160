@interface TVSettingsWiFiNetworkPickerViewController
- (TVCSWiFiNetworkViewController)networkViewController;
- (TVSettingsWiFiNetworkPickerViewController)init;
- (void)dealloc;
- (void)setNetworkViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsWiFiNetworkPickerViewController

- (TVSettingsWiFiNetworkPickerViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsWiFiNetworkPickerViewController;
  return -[TVSettingsWiFiNetworkPickerViewController initWithStyle:](&v3, "initWithStyle:", 1LL);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsWiFiNetworkPickerViewController;
  -[TVSettingsWiFiNetworkPickerViewController viewDidLoad](&v9, "viewDidLoad");
  objc_super v3 = objc_alloc(&OBJC_CLASS___TVCSWiFiNetworkViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWiFiNetworkPickerViewController tableView](self, "tableView"));
  v5 = -[TVCSWiFiNetworkViewController initWithTableView:](v3, "initWithTableView:", v4);
  networkViewController = self->_networkViewController;
  self->_networkViewController = v5;

  -[TVCSWiFiNetworkViewController setNetworkDetailsViewControllerClass:]( self->_networkViewController,  "setNetworkDetailsViewControllerClass:",  objc_opt_class(&OBJC_CLASS___TVSettingsNetworkWiFiConfigurationViewController));
  -[TVSettingsWiFiNetworkPickerViewController addChildViewController:]( self,  "addChildViewController:",  self->_networkViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWiFiNetworkPickerViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSWiFiNetworkViewController view](self->_networkViewController, "view"));
  [v7 addSubview:v8];

  -[TVCSWiFiNetworkViewController didMoveToParentViewController:]( self->_networkViewController,  "didMoveToParentViewController:",  self);
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSWiFiNetworkViewController view](self->_networkViewController, "view"));
  [v3 removeFromSuperview];

  -[TVCSWiFiNetworkViewController removeFromParentViewController]( self->_networkViewController,  "removeFromParentViewController");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsWiFiNetworkPickerViewController;
  -[TVSettingsWiFiNetworkPickerViewController dealloc](&v4, "dealloc");
}

- (TVCSWiFiNetworkViewController)networkViewController
{
  return self->_networkViewController;
}

- (void)setNetworkViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end