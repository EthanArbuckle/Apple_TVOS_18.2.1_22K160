@interface TVSettingsNetworkWiFiConfigurationViewController
- (BOOL)forgettingNetwork;
- (TVSettingsNetworkWiFiConfigurationViewController)initWithStyle:(int64_t)a3;
- (id)interface;
- (id)loadSettingGroups;
- (void)_forgetNetwork:(id)a3;
- (void)_popToMainNetworkController;
- (void)_updateForgetNetworkItem:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setForgettingNetwork:(BOOL)a3;
@end

@implementation TVSettingsNetworkWiFiConfigurationViewController

- (TVSettingsNetworkWiFiConfigurationViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkWiFiConfigurationViewController;
  v3 = -[TVSettingsNetworkWiFiConfigurationViewController initWithStyle:](&v7, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController interface](v3, "interface"));
    [v5 addObserver:v4 forKeyPath:@"associatedNetwork" options:3 context:off_1001DF868];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController interface](self, "interface"));
  [v3 removeObserver:self forKeyPath:@"associatedNetwork" context:off_1001DF868];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkWiFiConfigurationViewController;
  -[TVSettingsNetworkWiFiConfigurationViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController interface](self, "interface"));
  objc_super v4 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v5 = TSKLocString(@"NetworkWiFiForgetNetworkItemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"NetworkWiFiForgetNetworkDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  v8,  v3,  @"networkName",  self,  "_forgetNetwork:"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100037EB4;
  v17[3] = &unk_10018E9B0;
  objc_copyWeak(&v18, &location);
  [v9 setUpdateBlock:v17];
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v10);

  v20 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkWiFiConfigurationViewController;
  id v12 = -[TVSettingsNetworkConfigurationViewController loadSettingGroups](&v16, "loadSettingGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 arrayByAddingObjectsFromArray:v13]);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v14;
}

- (id)interface
{
  return +[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF868 == a6)
  {
    id v11 = a5;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSKeyValueChangeNewKey]);

    if (!v12 || ([v13 isEqual:v12] & 1) == 0) {
      -[TVSettingsNetworkWiFiConfigurationViewController _popToMainNetworkController]( self,  "_popToMainNetworkController");
    }
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVSettingsNetworkWiFiConfigurationViewController;
    id v10 = a5;
    -[TVSettingsNetworkWiFiConfigurationViewController observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  v10,  a6);
  }

- (void)_forgetNetwork:(id)a3
{
  self->_forgettingNetwork = 1;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController interface](self, "interface", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedNetwork]);
  [v5 disassociateNetwork:v4];

  -[TVSettingsNetworkWiFiConfigurationViewController reloadSettings](self, "reloadSettings");
}

- (void)_updateForgetNetworkItem:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController interface](self, "interface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedNetwork]);
  unsigned int v7 = [v6 isManagedByProfile];

  BOOL forgettingNetwork = self->_forgettingNetwork;
}

- (void)_popToMainNetworkController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController navigationController](self, "navigationController"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v3 viewControllers]);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNetworkWiFiConfigurationViewController navigationController](self, "navigationController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
  id v6 = [v5 indexOfObjectPassingTest:&stru_10018FEC8];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkWiFiConfigurationViewController navigationController]( self,  "navigationController"));
    id v8 = [v7 popViewControllerAnimated:1];
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v6]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNetworkWiFiConfigurationViewController navigationController]( self,  "navigationController"));
    id v10 = [v9 popToViewController:v7 animated:1];
  }
}

- (BOOL)forgettingNetwork
{
  return self->_forgettingNetwork;
}

- (void)setForgettingNetwork:(BOOL)a3
{
  self->_BOOL forgettingNetwork = a3;
}

@end