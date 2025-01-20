@interface TVSettingsWholeHomeAudioSetupViewController
- (NSString)headlineText;
- (TVSettingsTapToSetupView)tapToSetupView;
- (TVSettingsWholeHomeAudioSetupViewController)initWithAdvertisingType:(int64_t)a3;
- (TVSettingsWholeHomeAudioSetupViewControllerDelegate)delegate;
- (TVSiCloudAccountManager)accountManager;
- (id)previewForItemAtIndexPath:(id)a3;
- (int64_t)advertisingType;
- (int64_t)lastHomeConfigurationState;
- (int64_t)proximitySetupState;
- (void)_abortWaitingForConfigurationStateChange;
- (void)_handleConfigurationInProgressChange;
- (void)_handleHomeConfigurationStateChange;
- (void)_updateAccount:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAdvertisingType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHeadlineText:(id)a3;
- (void)setLastHomeConfigurationState:(int64_t)a3;
- (void)setProximitySetupState:(int64_t)a3;
- (void)setTapToSetupView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsWholeHomeAudioSetupViewController

- (TVSettingsWholeHomeAudioSetupViewController)initWithAdvertisingType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
  v4 = -[TVSettingsWholeHomeAudioSetupViewController initWithStyle:](&v10, "initWithStyle:", 1LL);
  v5 = v4;
  if (v4)
  {
    v4->_proximitySetupState = 0LL;
    v4->_advertisingType = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v6 addObserver:v5 forKeyPath:@"configurationInProgress" options:0 context:off_1001E0C60];
    [v6 addObserver:v5 forKeyPath:@"homeConfigurationState" options:0 context:off_1001E0C68];
    v7 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    accountManager = v5->_accountManager;
    v5->_accountManager = v7;
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"configurationInProgress" context:off_1001E0C60];
  [v3 removeObserver:self forKeyPath:@"homeConfigurationState" context:off_1001E0C68];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
  -[TVSettingsWholeHomeAudioSetupViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
  id v4 = -[TVSettingsWholeHomeAudioSetupViewController viewWillAppear:](&v31, "viewWillAppear:", a3);
  uint64_t v6 = TVCSHomeLog(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000FD474(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  objc_msgSend(v15, "pbs_setNeedsHomeKitAutoOnboarding:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v17 = [v16 isAdvertising];
  if ((_DWORD)v17)
  {
    uint64_t v19 = TVCSHomeLog(v17, v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000FD444(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    id v17 = [v16 stopAdvertisingForProximityKeyTransfer];
  }

  self->_proximitySetupState = 1LL;
  uint64_t v28 = TVCSHomeLog(v17, v18);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Proximity setup state changed to Started.",  v30,  2u);
  }

  [v16 startAdvertisingForProximityKeyTransferWithType:self->_advertisingType];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
  id v3 = -[TVSettingsWholeHomeAudioSetupViewController viewWillDisappear:](&v15, "viewWillDisappear:", a3);
  uint64_t v5 = TVCSHomeLog(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000FD4A4(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v14 stopAdvertisingForProximityKeyTransfer];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
  -[TVSettingsWholeHomeAudioSetupViewController viewDidLoad](&v16, "viewDidLoad");
  id v3 = objc_alloc(&OBJC_CLASS___TVSettingsTapToSetupView);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioSetupViewController view](self, "view"));
  [v4 bounds];
  uint64_t v5 = -[TVSettingsTapToSetupView initWithFrame:](v3, "initWithFrame:");
  tapToSetupView = self->_tapToSetupView;
  self->_tapToSetupView = v5;

  -[TVSettingsTapToSetupView setAutoresizingMask:](self->_tapToSetupView, "setAutoresizingMask:", 18LL);
  uint64_t v7 = self->_tapToSetupView;
  if (self->_headlineText)
  {
    -[TVSettingsTapToSetupView setTitle:](self->_tapToSetupView, "setTitle:");
  }

  else
  {
    uint64_t v8 = TSKLocString(@"WHASetupTitle");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVSettingsTapToSetupView setTitle:](v7, "setTitle:", v9);
  }

  uint64_t v10 = self->_tapToSetupView;
  uint64_t v11 = TSKLocString(@"WHASetupInstructions");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[TVSettingsTapToSetupView setInstructions:](v10, "setInstructions:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioSetupViewController view](self, "view"));
  [v13 addSubview:self->_tapToSetupView];

  accountManager = self->_accountManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E4744;
  v15[3] = &unk_100194E38;
  v15[4] = self;
  -[TVSiCloudAccountManager fetchActiveAccountWithCompletion:](accountManager, "fetchActiveAccountWithCompletion:", v15);
}

- (id)previewForItemAtIndexPath:(id)a3
{
  return 0LL;
}

- (void)setHeadlineText:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_headlineText != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_headlineText, a3);
    unsigned int v6 = -[TVSettingsWholeHomeAudioSetupViewController isViewLoaded](self, "isViewLoaded");
    uint64_t v5 = v7;
    if (v6)
    {
      -[TVSettingsTapToSetupView setTitle:](self->_tapToSetupView, "setTitle:", v7);
      uint64_t v5 = v7;
    }
  }
}

- (void)_abortWaitingForConfigurationStateChange
{
}

- (void)_handleConfigurationInProgressChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  unsigned int v4 = [v3 isAdvertising];
  id v5 = [v3 isConfigurationInProgress];
  char v6 = (char)v5;
  uint64_t v7 = TVCSHomeLog(v5);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v6 & 1) == 0 && v4)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[TVSettingsWholeHomeAudioSetupViewController _handleConfigurationInProgressChange]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s (WHA) No configuration is in progress but we are still advertising.",  buf,  0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E4AF0;
    v15[3] = &unk_10018E440;
    v15[4] = self;
    uint64_t v10 = v15;
LABEL_10:
    dispatch_async(&_dispatch_main_q, v10);
    goto LABEL_14;
  }

  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[TVSettingsWholeHomeAudioSetupViewController _handleConfigurationInProgressChange]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s (WHA) configuration in progress.", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E4B9C;
    block[3] = &unk_10018E440;
    block[4] = self;
    uint64_t v10 = block;
    goto LABEL_10;
  }

  if (v9)
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[TVSettingsWholeHomeAudioSetupViewController _handleConfigurationInProgressChange]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s (WHA) configuration not in progress. Starting configuration update timer.",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v11 = dispatch_time(0LL, 300000000000LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E4B20;
  v13[3] = &unk_10018E810;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_after(v11, &_dispatch_main_q, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_14:
}

- (void)_handleHomeConfigurationStateChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioSetupViewController delegate](self, "delegate"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v5 = [v4 homeConfigurationState];
  uint64_t v6 = TVCSHomeLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = TVCSHomeConfigurationStateToString(v5);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v29 = 136315650;
    v30 = "-[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]";
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2048;
    int64_t v34 = (int64_t)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s (WHA) configuration state change %@ (%lu).",  (uint8_t *)&v29,  0x20u);
  }

  int64_t advertisingType = self->_advertisingType;
  if (advertisingType != 1)
  {
    p_lastHomeConfigurationState = &self->_lastHomeConfigurationState;
    if ((id)self->_lastHomeConfigurationState == v5) {
      goto LABEL_15;
    }
    goto LABEL_7;
  }

  if (self->_proximitySetupState == 3)
  {
    p_lastHomeConfigurationState = &self->_lastHomeConfigurationState;
LABEL_7:
    int64_t *p_lastHomeConfigurationState = (int64_t)v5;
    switch((unint64_t)v5)
    {
      case 0uLL:
      case 1uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        if (advertisingType == 1)
        {
          [v4 stopAdvertisingForProximityKeyTransfer];
          uint64_t v13 = TVCSHomeLog([v4 stopBrowsingForLocalAccessory]);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = TVCSHomeConfigurationStateToString(v5);
            objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            int v29 = 136315650;
            v30 = "-[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]";
            __int16 v31 = 2112;
            id v32 = v16;
            __int16 v33 = 2048;
            int64_t v34 = (int64_t)v5;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s (WHA) dismissing because prox Repair CDP finished - no need to wait for Home setup if it isn't ready. { configurationState=%@(%lu)}",  (uint8_t *)&v29,  0x20u);
          }

          [v3 wholeHomeAudioSetupViewControllerDidTransitionToConfiguredState:self];
        }

        break;
      case 2uLL:
        uint64_t v23 = TVCSHomeLog([v4 stopAdvertisingForProximityKeyTransfer]);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v29 = 136315138;
          v30 = "-[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]";
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s (WHA) entering unconfigured state. Push home/room picker.",  (uint8_t *)&v29,  0xCu);
        }

        [v4 startBrowsingForLocalAccessory];
        break;
      case 3uLL:
        [v4 stopBrowsingForLocalAccessory];
        uint64_t v25 = TVCSHomeLog([v4 stopAdvertisingForProximityKeyTransfer]);
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v29 = 136315138;
          v30 = "-[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]";
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s (WHA) found local unconfigured accessory. Push home/room picker.",  (uint8_t *)&v29,  0xCu);
        }

        [v3 wholeHomeAudioSetupViewControllerDidTransitionToUnconfiguredWithLocalAccessoryState:self];
        break;
      case 4uLL:
        [v4 stopAdvertisingForProximityKeyTransfer];
        uint64_t v27 = TVCSHomeLog([v4 stopBrowsingForLocalAccessory]);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v29 = 136315138;
          v30 = "-[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]";
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s (WHA) dismissing because configuration state was good.",  (uint8_t *)&v29,  0xCu);
        }

        [v3 wholeHomeAudioSetupViewControllerDidTransitionToConfiguredState:self];
        [v4 reloadHomeConfiguration];
        break;
      default:
        goto LABEL_15;
    }

    goto LABEL_15;
  }

  uint64_t v17 = TVCSHomeLog(v10);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = TVCSHomeConfigurationStateToString(v5);
    v20 = (char *)objc_claimAutoreleasedReturnValue(v19);
    int64_t v21 = self->_advertisingType;
    int64_t proximitySetupState = self->_proximitySetupState;
    int v29 = 138544130;
    v30 = v20;
    __int16 v31 = 2048;
    id v32 = v5;
    __int16 v33 = 2048;
    int64_t v34 = v21;
    __int16 v35 = 2048;
    int64_t v36 = proximitySetupState;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Waiting for proximity setup, ignoring state change. {state_str=%{public}@, state=%ld, advertisingType=%ld, proximi tySetupState=%ld}",  (uint8_t *)&v29,  0x2Au);
  }

LABEL_15:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001E0C60 == a6)
  {
    -[TVSettingsWholeHomeAudioSetupViewController _handleConfigurationInProgressChange]( self,  "_handleConfigurationInProgressChange");
    id v13 = v11;
    id v14 = v13;
    int64_t proximitySetupState = self->_proximitySetupState;
    if (proximitySetupState == 1)
    {
      id v16 = [v13 isConfigurationInProgress];
      if ((_DWORD)v16)
      {
        uint64_t v17 = TVCSHomeLog(v16);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Proximity setup state changed to InProgress.",  buf,  2u);
        }

        self->_int64_t proximitySetupState = 2LL;
LABEL_17:

        goto LABEL_18;
      }

      int64_t proximitySetupState = self->_proximitySetupState;
    }

    if (proximitySetupState == 2)
    {
      id v19 = [v14 isConfigurationInProgress];
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = TVCSHomeLog(v19);
        int64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Proximity setup state changed to Finished.",  buf,  2u);
        }

        self->_int64_t proximitySetupState = 3LL;
        if (self->_advertisingType == 1)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000E51F8;
          block[3] = &unk_10018E440;
          block[4] = self;
          dispatch_async(&_dispatch_main_q, block);
        }
      }
    }

    goto LABEL_17;
  }

  if (off_1001E0C68 == a6)
  {
    -[TVSettingsWholeHomeAudioSetupViewController _handleHomeConfigurationStateChange]( self,  "_handleHomeConfigurationStateChange");
  }

  else
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController;
    -[TVSettingsWholeHomeAudioSetupViewController observeValueForKeyPath:ofObject:change:context:]( &v22,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }

- (void)_updateAccount:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = TVCSHomeLog(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
      *(_DWORD *)buf = 136315394;
      id v19 = "-[TVSettingsWholeHomeAudioSetupViewController _updateAccount:error:]";
      __int16 v20 = 2112;
      int64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Loading account '%@'.", buf, 0x16u);
    }
  }

  if (v8)
  {
    uint64_t v12 = TVCSHomeLog(v7);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[TVSettingsWholeHomeAudioSetupViewController _updateAccount:error:]";
      __int16 v20 = 2112;
      int64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Error loading account: '%@'.", buf, 0x16u);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E53B0;
  v15[3] = &unk_10018E468;
  id v16 = v6;
  uint64_t v17 = self;
  id v14 = v6;
  dispatch_async(&_dispatch_main_q, v15);
}

- (NSString)headlineText
{
  return self->_headlineText;
}

- (TVSettingsWholeHomeAudioSetupViewControllerDelegate)delegate
{
  return (TVSettingsWholeHomeAudioSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSettingsTapToSetupView)tapToSetupView
{
  return self->_tapToSetupView;
}

- (void)setTapToSetupView:(id)a3
{
}

- (TVSiCloudAccountManager)accountManager
{
  return self->_accountManager;
}

- (int64_t)advertisingType
{
  return self->_advertisingType;
}

- (void)setAdvertisingType:(int64_t)a3
{
  self->_int64_t advertisingType = a3;
}

- (int64_t)proximitySetupState
{
  return self->_proximitySetupState;
}

- (void)setProximitySetupState:(int64_t)a3
{
  self->_int64_t proximitySetupState = a3;
}

- (int64_t)lastHomeConfigurationState
{
  return self->_lastHomeConfigurationState;
}

- (void)setLastHomeConfigurationState:(int64_t)a3
{
  self->_lastHomeConfigurationState = a3;
}

- (void).cxx_destruct
{
}

@end