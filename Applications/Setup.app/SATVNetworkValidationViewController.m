@interface SATVNetworkValidationViewController
- (BOOL)_isFactoryActivated;
- (BOOL)isObservingEthernetNetworkInterface;
- (BOOL)isObservingNetworkInterface;
- (BOOL)isObservingWiFiNetworkInterface;
- (BOOL)isPresentingError;
- (BOOL)isStandardNavigation;
- (BOOL)shouldWaitForPhysicalInterface;
- (SATVNetworkValidationViewController)init;
- (TVSEthernetInterface)ethernetInterface;
- (TVSWiFiInterface)wiFiInterface;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIView)activityIndicatorContainerView;
- (id)completionHandler;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_connectionSucceeded;
- (void)_determineActiveInterface;
- (void)_forgetCurrentNetworkAndPushWiFiController;
- (void)_forgetCurrentWiFiNetwork;
- (void)_hideActivityIndicator;
- (void)_observeEthernetInterfaceChanges;
- (void)_observeWiFiInterfaceChanges;
- (void)_pushWiFiController;
- (void)_showActivityIndicator;
- (void)_stopObservingEthernetInterfaceChanges;
- (void)_stopObservingWiFiInterfaceChanges;
- (void)autoAdvance;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActivityIndicatorContainerView:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEthernetInterface:(id)a3;
- (void)setObservingEthernetNetworkInterface:(BOOL)a3;
- (void)setObservingWiFiNetworkInterface:(BOOL)a3;
- (void)setPresentingError:(BOOL)a3;
- (void)setShouldWaitForPhysicalInterface:(BOOL)a3;
- (void)setStandardNavigation:(BOOL)a3;
- (void)setWiFiInterface:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVNetworkValidationViewController

- (SATVNetworkValidationViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  v2 = -[SATVNetworkValidationViewController init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVSEthernetInterface RJ45EthernetInterface](&OBJC_CLASS___TVSEthernetInterface, "RJ45EthernetInterface"));
    ethernetInterface = v2->_ethernetInterface;
    v2->_ethernetInterface = (TVSEthernetInterface *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
    wiFiInterface = v2->_wiFiInterface;
    v2->_wiFiInterface = (TVSWiFiInterface *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100013110,  @"com.apple.HomeCaptiveViewService-UserDismissed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"com.apple.HomeCaptiveViewService-UserDismissed",  0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController dealloc](&v5, "dealloc");
}

- (void)autoAdvance
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController completionHandler](self, "completionHandler"));

  if (v3)
  {
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController completionHandler]( self,  "completionHandler"));
    v4[2](v4, 1LL);
  }

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController loadView](&v25, "loadView");
  uint64_t v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  -[SATVNetworkValidationViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v3);

  double y = CGPointZero.y;
  +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
  double v6 = v5;
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v9, "setFrame:", CGPointZero.x, y, v6, v8);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
  [v10 setAutoresizingMask:18];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v12 = [v11 _graphicsQuality];

  if (v12 == (id)100)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v13));

    v15 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v14);
    -[SATVNetworkValidationViewController setActivityIndicatorContainerView:]( self,  "setActivityIndicatorContainerView:",  v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    objc_msgSend(v16, "setFrame:", CGPointZero.x, y, v6, v8);

    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contentView]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
    [v18 addSubview:v19];
  }

  else
  {
    v20 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", CGPointZero.x, y, v6, v8);
    -[SATVNetworkValidationViewController setActivityIndicatorContainerView:]( self,  "setActivityIndicatorContainerView:",  v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v21 setBackgroundColor:v22];

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
    [v14 addSubview:v17];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v23 addSubview:v24];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVNetworkValidationViewController _showActivityIndicator](self, "_showActivityIndicator");
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (-[SATVNetworkValidationViewController _isFactoryActivated](self, "_isFactoryActivated"))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v4 suspend];
  }

  else
  {
    -[SATVNetworkValidationViewController _observeEthernetInterfaceChanges](self, "_observeEthernetInterfaceChanges");
    -[SATVNetworkValidationViewController _determineActiveInterface](self, "_determineActiveInterface");
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVNetworkValidationViewController _hideActivityIndicator](self, "_hideActivityIndicator");
}

- (void)viewDidLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController viewDidLayoutSubviews](&v29, "viewDidLayoutSubviews");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = UIRectCenteredIntegralRect(v14, v16, v18, v20, v5, v7, v9, v11);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = v12;
  if (off_100108610 == a6)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    unsigned int v15 = [v14 BOOLValue];

    double v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    unsigned int v17 = [v16 BOOLValue];

    if (v15 == v17) {
      goto LABEL_13;
    }
    id v18 = sub_10002AF94();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SATVNetworkValidationViewController observeValueForKeyPath:ofObject:change:context:]";
      __int16 v29 = 1024;
      unsigned int v30 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: received network change KVC notification for ethernet interface. New Value = %{BOOL}d",  buf,  0x12u);
    }

LABEL_12:
    -[SATVNetworkValidationViewController _determineActiveInterface](self, "_determineActiveInterface");
    goto LABEL_13;
  }

  if (off_100108618 == a6)
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    unsigned int v21 = [v20 BOOLValue];

    double v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    unsigned int v23 = [v22 BOOLValue];

    if (v21 == v23) {
      goto LABEL_13;
    }
    id v24 = sub_10002AF94();
    double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SATVNetworkValidationViewController observeValueForKeyPath:ofObject:change:context:]";
      __int16 v29 = 1024;
      unsigned int v30 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: received network change KVC notification for WiFi interface. New Value = %{BOOL}d",  buf,  0x12u);
    }

    -[SATVNetworkValidationViewController _stopObservingWiFiInterfaceChanges]( self,  "_stopObservingWiFiInterfaceChanges");
    goto LABEL_12;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationViewController;
  -[SATVNetworkValidationViewController observeValueForKeyPath:ofObject:change:context:]( &v26,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_13:
}

- (void)_showActivityIndicator
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
  [v2 startAnimating];
}

- (void)_hideActivityIndicator
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController activityIndicatorView](self, "activityIndicatorView"));
  [v2 stopAnimating];
}

- (void)_determineActiveInterface
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "-[SATVNetworkValidationViewController _determineActiveInterface]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Checking active interfaces",  (uint8_t *)&v17,  0xCu);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
  unsigned int v6 = [v5 isActive];

  if (v6)
  {
    id v7 = sub_10002AF94();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 IPAddress]);
      int v17 = 136315650;
      id v18 = "-[SATVNetworkValidationViewController _determineActiveInterface]";
      __int16 v19 = 2112;
      double v20 = v9;
      __int16 v21 = 2112;
      double v22 = v11;
      id v12 = "%s: Ethernet is active. {interface=%@, ipAddress=%@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0x20u);

      goto LABEL_10;
    }

    goto LABEL_10;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
  unsigned int v14 = [v13 isActive];

  id v15 = sub_10002AF94();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 IPAddress]);
      int v17 = 136315650;
      id v18 = "-[SATVNetworkValidationViewController _determineActiveInterface]";
      __int16 v19 = 2112;
      double v20 = v9;
      __int16 v21 = 2112;
      double v22 = v11;
      id v12 = "%s: WiFi is active. {interface=%@, ipAddress=%@}";
      goto LABEL_9;
    }

- (void)_connectionSucceeded
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    double v8 = "-[SATVNetworkValidationViewController _connectionSucceeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Connection successful. Network Validation Complete.",  (uint8_t *)&v7,  0xCu);
  }

  -[SATVNetworkValidationViewController _stopObservingEthernetInterfaceChanges]( self,  "_stopObservingEthernetInterfaceChanges");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    unsigned int v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, 1LL);
  }

- (void)_forgetCurrentNetworkAndPushWiFiController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013D64;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_forgetCurrentWiFiNetwork
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    double v9 = "-[SATVNetworkValidationViewController _forgetCurrentWiFiNetwork]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedNetwork]);

  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
    [v7 disassociateNetwork:v6];
  }
}

- (void)_pushWiFiController
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v22 = "-[SATVNetworkValidationViewController _pushWiFiController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController navigationController](self, "navigationController"));
  unsigned int v6 = (SATVWiFiViewController *)objc_claimAutoreleasedReturnValue([v5 viewControllers]);

  id v8 = -[SATVWiFiViewController countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___SATVWiFiViewController, v7);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = -[SATVWiFiViewController countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:

    unsigned int v6 = objc_alloc_init(&OBJC_CLASS___SATVWiFiViewController);
    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001409C;
    v14[3] = &unk_1000C93C8;
    objc_copyWeak(&v15, (id *)buf);
    -[SATVWiFiViewController setCompletionBlock:](v6, "setCompletionBlock:", v14);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController navigationController](self, "navigationController"));
    [v13 pushViewController:v6 animated:1];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_observeEthernetInterfaceChanges
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SATVNetworkValidationViewController _observeEthernetInterfaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned __int8 v5 = -[SATVNetworkValidationViewController isObservingEthernetNetworkInterface]( self,  "isObservingEthernetNetworkInterface");
  id v6 = sub_10002AF94();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[SATVNetworkValidationViewController _observeEthernetInterfaceChanges]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Already observing physical changes",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      int v11 = 136315650;
      uint64_t v12 = "-[SATVNetworkValidationViewController _observeEthernetInterfaceChanges]";
      __int16 v13 = 2112;
      unsigned int v14 = v9;
      __int16 v15 = 2112;
      __int128 v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: beginning observation of ethernet network interface. Ethernet: %@, WiFi: %@",  (uint8_t *)&v11,  0x20u);
    }

    -[SATVNetworkValidationViewController setObservingEthernetNetworkInterface:]( self,  "setObservingEthernetNetworkInterface:",  1LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
    -[os_log_s addObserver:forKeyPath:options:context:]( v7,  "addObserver:forKeyPath:options:context:",  self,  @"active",  3LL,  off_100108610);
  }
}

- (void)_stopObservingEthernetInterfaceChanges
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    __int16 v13 = "-[SATVNetworkValidationViewController _stopObservingEthernetInterfaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  unsigned int v5 = -[SATVNetworkValidationViewController isObservingEthernetNetworkInterface]( self,  "isObservingEthernetNetworkInterface");
  id v6 = sub_10002AF94();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      int v12 = 136315650;
      __int16 v13 = "-[SATVNetworkValidationViewController _stopObservingEthernetInterfaceChanges]";
      __int16 v14 = 2112;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      __int128 v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: stopping observation of ethernet network interface. Ethernet: %@, WiFi: %@",  (uint8_t *)&v12,  0x20u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController ethernetInterface](self, "ethernetInterface"));
    [v11 removeObserver:self forKeyPath:@"active" context:off_100108610];

    -[SATVNetworkValidationViewController setObservingEthernetNetworkInterface:]( self,  "setObservingEthernetNetworkInterface:",  0LL);
  }

  else
  {
    if (v8)
    {
      int v12 = 136315138;
      __int16 v13 = "-[SATVNetworkValidationViewController _stopObservingEthernetInterfaceChanges]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Not observing, so no need to stop",  (uint8_t *)&v12,  0xCu);
    }
  }

- (void)_observeWiFiInterfaceChanges
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[SATVNetworkValidationViewController _observeWiFiInterfaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  unsigned __int8 v5 = -[SATVNetworkValidationViewController isObservingWiFiNetworkInterface](self, "isObservingWiFiNetworkInterface");
  id v6 = sub_10002AF94();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      int v10 = 136315138;
      int v11 = "-[SATVNetworkValidationViewController _observeWiFiInterfaceChanges]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Already observing WiFi changes",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      int v10 = 136315394;
      int v11 = "-[SATVNetworkValidationViewController _observeWiFiInterfaceChanges]";
      __int16 v12 = 2112;
      __int16 v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: beginning observation of WiFi network interface. WiFi: %@",  (uint8_t *)&v10,  0x16u);
    }

    -[SATVNetworkValidationViewController setObservingWiFiNetworkInterface:]( self,  "setObservingWiFiNetworkInterface:",  1LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
    -[os_log_s addObserver:forKeyPath:options:context:]( v7,  "addObserver:forKeyPath:options:context:",  self,  @"active",  3LL,  off_100108618);
  }
}

- (void)_stopObservingWiFiInterfaceChanges
{
  id v3 = sub_10002AF94();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    __int16 v12 = "-[SATVNetworkValidationViewController _stopObservingWiFiInterfaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v5 = -[SATVNetworkValidationViewController isObservingWiFiNetworkInterface](self, "isObservingWiFiNetworkInterface");
  id v6 = sub_10002AF94();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
      int v11 = 136315394;
      __int16 v12 = "-[SATVNetworkValidationViewController _stopObservingWiFiInterfaceChanges]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: stopping observation of WiFi network interface. WiFi: %@",  (uint8_t *)&v11,  0x16u);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationViewController wiFiInterface](self, "wiFiInterface"));
    [v10 removeObserver:self forKeyPath:@"active" context:off_100108618];

    -[SATVNetworkValidationViewController setObservingWiFiNetworkInterface:]( self,  "setObservingWiFiNetworkInterface:",  0LL);
  }

  else
  {
    if (v8)
    {
      int v11 = 136315138;
      __int16 v12 = "-[SATVNetworkValidationViewController _stopObservingWiFiInterfaceChanges]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Not observing, so no need to stop",  (uint8_t *)&v11,  0xCu);
    }
  }

- (BOOL)_isFactoryActivated
{
  id v2 = sub_10002AF94();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[SATVNetworkValidationViewController _isFactoryActivated]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Checking factory activation", buf, 0xCu);
  }

  id v12 = 0LL;
  double v4 = (void *)MAEGetActivationStateWithError(&v12);
  id v5 = v12;
  if (v5)
  {
    id v6 = sub_10002AF94();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[SATVNetworkValidationViewController _isFactoryActivated]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: ActivationState error: %@", buf, 0x16u);
    }
  }

  unsigned int v8 = [v4 isEqualToString:@"FactoryActivated"];
  if (v8)
  {
    id v9 = sub_10002AF94();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[SATVNetworkValidationViewController _isFactoryActivated]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: is factory activated", buf, 0xCu);
    }
  }

  return v8;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SATVNetworkValidationViewController _applicationDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SATVNetworkValidationViewController _determineActiveInterface](self, "_determineActiveInterface");
}

- (id)completionHandler
{
  return self->completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)isStandardNavigation
{
  return self->standardNavigation;
}

- (void)setStandardNavigation:(BOOL)a3
{
  self->standardNavigation = a3;
}

- (BOOL)isObservingNetworkInterface
{
  return self->_observingNetworkInterface;
}

- (BOOL)shouldWaitForPhysicalInterface
{
  return self->_shouldWaitForPhysicalInterface;
}

- (void)setShouldWaitForPhysicalInterface:(BOOL)a3
{
  self->_shouldWaitForPhysicalInterface = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIView)activityIndicatorContainerView
{
  return self->_activityIndicatorContainerView;
}

- (void)setActivityIndicatorContainerView:(id)a3
{
}

- (TVSEthernetInterface)ethernetInterface
{
  return self->_ethernetInterface;
}

- (void)setEthernetInterface:(id)a3
{
}

- (TVSWiFiInterface)wiFiInterface
{
  return self->_wiFiInterface;
}

- (void)setWiFiInterface:(id)a3
{
}

- (BOOL)isObservingEthernetNetworkInterface
{
  return self->_observingEthernetNetworkInterface;
}

- (void)setObservingEthernetNetworkInterface:(BOOL)a3
{
  self->_observingEthernetNetworkInterface = a3;
}

- (BOOL)isObservingWiFiNetworkInterface
{
  return self->_observingWiFiNetworkInterface;
}

- (void)setObservingWiFiNetworkInterface:(BOOL)a3
{
  self->_observingWiFiNetworkInterface = a3;
}

- (BOOL)isPresentingError
{
  return self->_presentingError;
}

- (void)setPresentingError:(BOOL)a3
{
  self->_presentingError = a3;
}

- (void).cxx_destruct
{
}

@end