@interface SATVActivationViewController
- (SATVHeaderView)headerView;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIView)activityIndicatorContainerView;
- (id)_localizedMacAddressDescription;
- (id)completionHandler;
- (void)_attemptActivation;
- (void)_beginProcess;
- (void)_forgetCurrentWiFiNetworkIfNeeded;
- (void)_presentActivationErrorController;
- (void)_presentDateAndTimeErrorController;
- (void)_presentNetworkConfigurationController;
- (void)didCompleteNetworkConfiguration;
- (void)loadView;
- (void)setActivityIndicatorContainerView:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SATVActivationViewController

- (void)loadView
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SATVActivationViewController;
  -[SATVActivationViewController loadView](&v28, "loadView");
  v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  -[SATVActivationViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v3);

  double y = CGPointZero.y;
  +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
  double v6 = v5;
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v9, "setFrame:", CGPointZero.x, y, v6, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorView](self, "activityIndicatorView"));
  [v10 setAutoresizingMask:18];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v12 = [v11 _graphicsQuality];

  if (v12 == (id)100)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v13));

    v15 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v14);
    -[SATVActivationViewController setActivityIndicatorContainerView:](self, "setActivityIndicatorContainerView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    objc_msgSend(v16, "setFrame:", CGPointZero.x, y, v6, v8);

    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contentView]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorView](self, "activityIndicatorView"));
    [v18 addSubview:v19];
  }

  else
  {
    v20 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", CGPointZero.x, y, v6, v8);
    -[SATVActivationViewController setActivityIndicatorContainerView:](self, "setActivityIndicatorContainerView:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v21 setBackgroundColor:v22];

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorView](self, "activityIndicatorView"));
    [v14 addSubview:v17];
  }

  v23 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SATVActivationViewController setHeaderView:](self, "setHeaderView:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController headerView](self, "headerView"));
  [v24 addSubview:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorContainerView](self, "activityIndicatorContainerView"));
  [v26 addSubview:v27];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVActivationViewController;
  -[SATVActivationViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorView](self, "activityIndicatorView"));
  [v4 startAnimating];

  -[SATVActivationViewController _beginProcess](self, "_beginProcess");
}

- (void)viewDidLayoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___SATVActivationViewController;
  -[SATVActivationViewController viewDidLayoutSubviews](&v45, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorContainerView](self, "activityIndicatorContainerView"));
  [v12 frame];
  double v17 = UIRectCenteredIntegralRect(v13, v14, v15, v16, v5, v7, v9, v11);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorContainerView](self, "activityIndicatorContainerView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  CGFloat y = CGPointZero.y;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController headerView](self, "headerView"));
  v46.origin.x = v5;
  v46.origin.CGFloat y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  objc_msgSend(v26, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
  double v28 = v27;

  v47.origin.x = v5;
  v47.origin.CGFloat y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  double Width = CGRectGetWidth(v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController activityIndicatorContainerView](self, "activityIndicatorContainerView"));
  [v30 frame];
  double MinY = CGRectGetMinY(v48);
  v49.origin.x = CGPointZero.x;
  v49.origin.CGFloat y = y;
  v49.size.width = Width;
  v49.size.height = v28;
  double v32 = MinY - CGRectGetHeight(v49) + -40.0;

  v50.origin.x = CGPointZero.x;
  v50.origin.CGFloat y = v32;
  v50.size.width = Width;
  v50.size.height = v28;
  if (CGRectGetMinY(v50) < 0.0)
  {
    v51.origin.x = CGPointZero.x;
    v51.origin.CGFloat y = v32;
    v51.size.width = Width;
    v51.size.height = v28;
    double v32 = 50.0;
    double v44 = 50.0 - CGRectGetMinY(v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    [v33 frame];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    objc_msgSend(v42, "setFrame:", v35, v44 + v37, v39, v41);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController headerView](self, "headerView"));
  objc_msgSend(v43, "setFrame:", CGPointZero.x, v32, Width, v28);
}

- (void)_beginProcess
{
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ACTIVATION_TITLE" value:&stru_1000CB560 table:@"Localizable"]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController headerView](self, "headerView"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 titleLabel]);
  [v7 setText:v5];

  double v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  double v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"ACTIVATION_SUBTITLE" value:&stru_1000CB560 table:@"Localizable"]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController headerView](self, "headerView"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subtitleLabel]);
  [v12 setText:v10];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController view](self, "view"));
  [v13 setNeedsLayout];

  -[SATVActivationViewController _attemptActivation](self, "_attemptActivation");
}

- (void)_attemptActivation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SATVActivationManager sharedInstance](&OBJC_CLASS___SATVActivationManager, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController navigationController](self, "navigationController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100036108;
  v5[3] = &unk_1000CA198;
  objc_copyWeak(&v6, &location);
  [v3 requestActivationWithNavigationController:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_forgetCurrentWiFiNetworkIfNeeded
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVSNetworkInterface preferredInterface](&OBJC_CLASS___TVSNetworkInterface, "preferredInterface"));

  v3 = v5;
  if (v5 == v2)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedNetwork]);
    if (v4) {
      [v5 disassociateNetwork:v4];
    }

    v3 = v5;
  }
}

- (id)_localizedMacAddressDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));
  unsigned int v4 = [v3 isActive];

  if (v4) {
    id v5 = @"ACTIVATION_ETHERNET_ADDRESS";
  }
  else {
    id v5 = @"ACTIVATION_WIFI_ADDRESS";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSNetworkInterface preferredInterface](&OBJC_CLASS___TVSNetworkInterface, "preferredInterface"));
  double v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v5 value:&stru_1000CB560 table:@"Localizable"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareAddress]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v10));

  return v11;
}

- (void)_presentActivationErrorController
{
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v27 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ACTIVATION_ERROR_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

  id v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"ACTIVATION_ERROR_SUBTITLE" value:&stru_1000CB560 table:@"Localizable"]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v27,  v26,  1LL));
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController _localizedMacAddressDescription]( self,  "_localizedMacAddressDescription"));
  v35[0] = NSFontAttributeName;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleFootnote));
  v36[0] = v8;
  v35[1] = NSForegroundColorAttributeName;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v36[1] = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));

  double v23 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v25,  v24);
  [v7 _setAttributedDetailMessage:v23];
  objc_initWeak(&location, self);
  double v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ACTIVATION_ERROR_TRY_AGAIN" value:&stru_1000CB560 table:@"Localizable"]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100036878;
  v32[3] = &unk_1000C9418;
  objc_copyWeak(&v33, &location);
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  v32));
  [v7 addAction:v13];

  double v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  double v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ACTIVATION_ERROR_START_OVER" value:&stru_1000CB560 table:@"Localizable"]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000368A8;
  v30[3] = &unk_1000C9418;
  objc_copyWeak(&v31, &location);
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v30));
  [v7 addAction:v17];

  double v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"ACTIVATION_ERROR_NETWORK_SETTINGS" value:&stru_1000CB560 table:@"Localizable"]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10003691C;
  v28[3] = &unk_1000C9418;
  objc_copyWeak(&v29, &location);
  double v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  0LL,  v28));
  [v7 addAction:v21];

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController navigationController](self, "navigationController"));
  [v22 presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)_presentNetworkConfigurationController
{
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SATVNetworkConfigurationViewController);
  -[SATVNetworkConfigurationViewController setConfigurationDelegate:](v4, "setConfigurationDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController navigationController](self, "navigationController"));
  [v3 pushViewController:v4 animated:1];
}

- (void)_presentDateAndTimeErrorController
{
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v23 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ACTIVATION_DATE_TIME_ERROR_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

  id v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double v22 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"ACTIVATION_DATE_TIME_ERROR" value:&stru_1000CB560 table:@"Localizable"]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v23,  v22,  1LL));
  double v21 = (void *)objc_claimAutoreleasedReturnValue( -[SATVActivationViewController _localizedMacAddressDescription]( self,  "_localizedMacAddressDescription"));
  v29[0] = NSFontAttributeName;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleFootnote));
  v30[0] = v8;
  v29[1] = NSForegroundColorAttributeName;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v30[1] = v9;
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));

  double v19 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v21,  v20);
  [v7 _setAttributedDetailMessage:v19];
  objc_initWeak(&location, self);
  double v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ACTIVATION_ERROR_TRY_AGAIN" value:&stru_1000CB560 table:@"Localizable"]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100036DCC;
  v26[3] = &unk_1000C9418;
  objc_copyWeak(&v27, &location);
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  v26));
  [v7 addAction:v13];

  double v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  double v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ACTIVATION_ERROR_START_OVER" value:&stru_1000CB560 table:@"Localizable"]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100036DFC;
  v24[3] = &unk_1000C9418;
  objc_copyWeak(&v25, &location);
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v24));
  [v7 addAction:v17];

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController navigationController](self, "navigationController"));
  [v18 presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)didCompleteNetworkConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationViewController navigationController](self, "navigationController"));
  id v4 = [v3 popToViewController:self animated:1];

  -[SATVActivationViewController _attemptActivation](self, "_attemptActivation");
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SATVHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
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

- (void).cxx_destruct
{
}

@end