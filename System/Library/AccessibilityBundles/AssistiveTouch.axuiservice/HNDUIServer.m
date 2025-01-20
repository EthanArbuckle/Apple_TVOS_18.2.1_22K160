@interface HNDUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- (HNDScannerInputViewController)scannerInputViewController;
- (NSString)lastShownAlertIdentifier;
- (NSString)lastShownBannerIdentifier;
- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)dealloc;
- (void)hideContentViewController;
- (void)setLastShownAlertIdentifier:(id)a3;
- (void)setLastShownBannerIdentifier:(id)a3;
- (void)setScannerInputViewController:(id)a3;
- (void)showContentViewController;
@end

@implementation HNDUIServer

- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3
{
  return 10000010.0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDUIServer;
  -[HNDUIServer dealloc](&v3, "dealloc");
}

- (void)hideContentViewController
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
  if (v4)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self];

    [v4 hideAlerts];
    -[HNDUIServer setScannerInputViewController:](self, "setScannerInputViewController:", 0LL);
  }
}

- (void)showContentViewController
{
  objc_super v3 = (HNDScannerInputViewController *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
  if (!v3)
  {
    v5 = objc_opt_new(&OBJC_CLASS___HNDScannerInputViewController);
    -[HNDScannerInputViewController setUserInterfaceServer:](v5, "setUserInterfaceServer:", self);
    -[HNDUIServer setScannerInputViewController:](self, "setScannerInputViewController:", v5);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v4 addContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    objc_super v3 = v5;
  }
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1AD0;
  block[3] = &unk_4150;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 1uLL:
      -[HNDUIServer hideContentViewController](self, "hideContentViewController");
      break;
    case 2uLL:
      -[HNDUIServer showContentViewController](self, "showContentViewController");
      break;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input source"]);
      id v13 = [v12 unsignedIntegerValue];

      [v11 hideAlertForSource:v13];
      goto LABEL_17;
    case 4uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input alert"]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input source"]);
      id v16 = [v15 unsignedIntegerValue];

      [v11 showAlert:v14 forSource:v16];
      goto LABEL_8;
    case 5uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input source"]);
      id v18 = [v17 unsignedIntegerValue];

      [v11 hideStateForSource:v18];
      goto LABEL_17;
    case 6uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input state"]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"input source"]);
      id v20 = [v19 unsignedIntegerValue];

      [v11 showState:v14 forSource:v20];
LABEL_8:

      goto LABEL_17;
    case 7uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer lastShownAlertIdentifier](self, "lastShownAlertIdentifier"));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer lastShownAlertIdentifier](self, "lastShownAlertIdentifier"));
        [v21 hideAlertWithIdentifier:v23 forService:self];
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"simple alert text"]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( [v21 showAlertWithText:v24 subtitleText:0 iconImage:0 type:0 forService:self]);
      -[HNDUIServer setLastShownAlertIdentifier:](self, "setLastShownAlertIdentifier:", v25);
      goto LABEL_15;
    case 8uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer lastShownBannerIdentifier](self, "lastShownBannerIdentifier"));

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer lastShownBannerIdentifier](self, "lastShownBannerIdentifier"));
        [v21 hideAlertWithIdentifier:v27 forService:self];
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"simple banner title"]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"simple banner text"]);
      v28 = (void *)objc_claimAutoreleasedReturnValue( [v21 showAlertWithText:v24 subtitleText:v25 iconImage:0 type:2 forService:self]);
      -[HNDUIServer setLastShownBannerIdentifier:](self, "setLastShownBannerIdentifier:", v28);

LABEL_15:
      break;
    case 9uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDUIServer scannerInputViewController](self, "scannerInputViewController"));
      [v11 hideAlerts];
LABEL_17:

      break;
    default:
      break;
  }

  return 0LL;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.assistivetouch.daemon";
}

- (HNDScannerInputViewController)scannerInputViewController
{
  return self->_scannerInputViewController;
}

- (void)setScannerInputViewController:(id)a3
{
}

- (NSString)lastShownAlertIdentifier
{
  return self->_lastShownAlertIdentifier;
}

- (void)setLastShownAlertIdentifier:(id)a3
{
}

- (NSString)lastShownBannerIdentifier
{
  return self->_lastShownBannerIdentifier;
}

- (void)setLastShownBannerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end