@interface TVSettingsSystemPairingsViewController
+ (void)initialize;
- (BOOL)isScanning;
- (BOOL)wasScanningOnBackground;
- (TVSettingsSystemPairingsFacade)systemPairingsFacade;
- (TVSettingsSystemPairingsViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_startPairingServices;
- (void)_stopPairingServices;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsScanning:(BOOL)a3;
- (void)setSystemPairingsFacade:(id)a3;
- (void)setWasScanningOnBackground:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsSystemPairingsViewController

+ (void)initialize
{
  if (qword_1001E1800 != -1) {
    dispatch_once(&qword_1001E1800, &stru_100191148);
  }
}

- (TVSettingsSystemPairingsViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
  v3 = -[TVSettingsSystemPairingsViewController initWithStyle:](&v8, "initWithStyle:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVSettingsSystemPairingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsSystemPairingsFacade,  "sharedInstance"));
    systemPairingsFacade = v3->_systemPairingsFacade;
    v3->_systemPairingsFacade = (TVSettingsSystemPairingsFacade *)v4;

    -[TVSettingsSystemPairingsFacade addObserver:forKeyPath:options:context:]( v3->_systemPairingsFacade,  "addObserver:forKeyPath:options:context:",  v3,  @"pairedDevicesInDisplayOrder",  0LL,  off_1001DFCB8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v3 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v6 addObserver:v3 selector:"_applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  -[TVSettingsSystemPairingsFacade removeObserver:forKeyPath:context:]( self->_systemPairingsFacade,  "removeObserver:forKeyPath:context:",  self,  @"pairedDevicesInDisplayOrder",  off_1001DFCB8);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
  -[TVSettingsSystemPairingsViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
  -[TVSettingsSystemPairingsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TVSettingsSystemPairingsViewController _startPairingServices](self, "_startPairingServices");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
  -[TVSettingsSystemPairingsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSettingsSystemPairingsViewController _stopPairingServices](self, "_stopPairingServices");
}

- (void)_startPairingServices
{
  v3 = (os_log_s *)qword_1001E17F8;
  if (os_log_type_enabled((os_log_t)qword_1001E17F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting system pairing services.", v6, 2u);
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  -[TVSettingsSystemPairingsFacade startScanningIfNeeded](self->_systemPairingsFacade, "startScanningIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLockdownPairingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsLockdownPairingsFacade,  "sharedInstance"));
  [v5 setLockdownPairingEnabled:1];

  self->_isScanning = 1;
}

- (void)_stopPairingServices
{
  v3 = (os_log_s *)qword_1001E17F8;
  if (os_log_type_enabled((os_log_t)qword_1001E17F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping system pairing services.", v5, 2u);
  }

  -[TVSettingsSystemPairingsFacade stopAdvertising](self->_systemPairingsFacade, "stopAdvertising");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLockdownPairingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsLockdownPairingsFacade,  "sharedInstance"));
  [v4 setLockdownPairingEnabled:0];

  self->_isScanning = 0;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  if (self->_wasScanningOnBackground)
  {
    v5 = (os_log_s *)qword_1001E17F8;
    if (os_log_type_enabled((os_log_t)qword_1001E17F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Resume after backgrounding.", v6, 2u);
    }

    -[TVSettingsSystemPairingsViewController _startPairingServices](self, "_startPairingServices");
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = (os_log_s *)qword_1001E17F8;
  if (os_log_type_enabled((os_log_t)qword_1001E17F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancel for backgrounding.", v5, 2u);
  }

  self->_wasScanningOnBackground = self->_isScanning;
  -[TVSettingsSystemPairingsViewController _stopPairingServices](self, "_stopPairingServices");
}

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"SystemPairingsMyDevicesSectionTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  self->_systemPairingsFacade,  @"pairedDevicesInDisplayOrder",  &stru_100191188));

  uint64_t v6 = TSKLocString(@"DevicesPageDescriptionFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setLocalizedDescription:v7];

  [v5 setAutoHide:1];
  v10 = v5;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFCB8 == a6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSystemPairingsViewController navigationController]( self,  "navigationController",  a3,  a4,  a5));
    id v17 = (id)objc_claimAutoreleasedReturnValue([v7 viewControllers]);

    objc_super v8 = (char *)[v17 indexOfObjectIdenticalTo:self] + 1;
    if (v8 >= [v17 count]) {
      v9 = 0LL;
    }
    else {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v8]);
    }
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVSettingsSystemPairingDetailViewController);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSystemPairingsFacade pairedDevicesInDisplayOrder]( self->_systemPairingsFacade,  "pairedDevicesInDisplayOrder"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
      unsigned __int8 v13 = [v11 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingsViewController navigationController](self, "navigationController"));
        [v14 dismissViewControllerAnimated:0 completion:0];

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingsViewController navigationController](self, "navigationController"));
        id v16 = [v15 popToViewController:self animated:0];
      }
    }
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
    -[TVSettingsSystemPairingsViewController observeValueForKeyPath:ofObject:change:context:]( &v18,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)previewForItemAtIndexPath:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsSystemPairingsViewController;
  id v4 = -[TVSettingsSystemPairingsViewController previewForItemAtIndexPath:](&v12, "previewForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingsViewController visibleSettingGroups](self, "visibleSettingGroups"));
    id v8 = [v7 count];

    if (!v8)
    {
      uint64_t v9 = TSKLocString(@"DevicesPageDescriptionFormat");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [v5 setDescriptionText:v10];
    }
  }

  return v5;
}

- (TVSettingsSystemPairingsFacade)systemPairingsFacade
{
  return self->_systemPairingsFacade;
}

- (void)setSystemPairingsFacade:(id)a3
{
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (BOOL)wasScanningOnBackground
{
  return self->_wasScanningOnBackground;
}

- (void)setWasScanningOnBackground:(BOOL)a3
{
  self->_wasScanningOnBackground = a3;
}

- (void).cxx_destruct
{
}

@end