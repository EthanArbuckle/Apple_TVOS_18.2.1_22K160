@interface HNDScannerInputViewController
- (BOOL)_canShowWhileLocked;
- (CALayer)cameraInputSourceStateLeftLayer;
- (CALayer)cameraInputSourceStateRightLayer;
- (HNDUIServer)userInterfaceServer;
- (NSString)cameraInputSourceAlertIdentifier;
- (NSString)hardwareInputSourceAlertIdentifier;
- (NSString)screenInputSourceAlertIdentifier;
- (void)_hideAlertsForAllSources;
- (void)_hideStateForAllSources;
- (void)dealloc;
- (void)hideAlertForSource:(unint64_t)a3;
- (void)hideAlerts;
- (void)hideStateForSource:(unint64_t)a3;
- (void)setCameraInputSourceAlertIdentifier:(id)a3;
- (void)setCameraInputSourceStateLeftLayer:(id)a3;
- (void)setCameraInputSourceStateRightLayer:(id)a3;
- (void)setHardwareInputSourceAlertIdentifier:(id)a3;
- (void)setScreenInputSourceAlertIdentifier:(id)a3;
- (void)setUserInterfaceServer:(id)a3;
- (void)showAlert:(id)a3 forSource:(unint64_t)a4;
- (void)showState:(id)a3 forSource:(unint64_t)a4;
@end

@implementation HNDScannerInputViewController

- (void)_hideAlertsForAllSources
{
}

- (void)_hideStateForAllSources
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDScannerInputViewController;
  -[HNDScannerInputViewController dealloc](&v3, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)hideAlerts
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceAlertIdentifier]( self,  "cameraInputSourceAlertIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController userInterfaceServer](self, "userInterfaceServer"));
  [v9 hideAlertWithIdentifier:v3 forService:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController hardwareInputSourceAlertIdentifier]( self,  "hardwareInputSourceAlertIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController userInterfaceServer](self, "userInterfaceServer"));
  [v9 hideAlertWithIdentifier:v5 forService:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController screenInputSourceAlertIdentifier]( self,  "screenInputSourceAlertIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController userInterfaceServer](self, "userInterfaceServer"));
  [v9 hideAlertWithIdentifier:v7 forService:v8];

  -[HNDScannerInputViewController setScreenInputSourceAlertIdentifier:]( self,  "setScreenInputSourceAlertIdentifier:",  0LL);
  -[HNDScannerInputViewController setCameraInputSourceAlertIdentifier:]( self,  "setCameraInputSourceAlertIdentifier:",  0LL);
  -[HNDScannerInputViewController setHardwareInputSourceAlertIdentifier:]( self,  "setHardwareInputSourceAlertIdentifier:",  0LL);
}

- (void)hideAlertForSource:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController userInterfaceServer](self, "userInterfaceServer"));
  switch(a3)
  {
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController screenInputSourceAlertIdentifier]( self,  "screenInputSourceAlertIdentifier"));
      [v8 hideAlertWithIdentifier:v6 forService:v5];
      -[HNDScannerInputViewController setScreenInputSourceAlertIdentifier:]( self,  "setScreenInputSourceAlertIdentifier:",  0LL);
      break;
    case 2uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController hardwareInputSourceAlertIdentifier]( self,  "hardwareInputSourceAlertIdentifier"));
      [v8 hideAlertWithIdentifier:v6 forService:v5];
      -[HNDScannerInputViewController setHardwareInputSourceAlertIdentifier:]( self,  "setHardwareInputSourceAlertIdentifier:",  0LL);
      break;
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceAlertIdentifier]( self,  "cameraInputSourceAlertIdentifier"));
      [v8 hideAlertWithIdentifier:v6 forService:v5];
      -[HNDScannerInputViewController setCameraInputSourceAlertIdentifier:]( self,  "setCameraInputSourceAlertIdentifier:",  0LL);
      break;
    default:
      char v7 = 1;
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v7,  @"Could not hide alert for unsupported source: %lu",  a3);
      goto LABEL_9;
  }

LABEL_9:
}

- (void)showAlert:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController userInterfaceServer](self, "userInterfaceServer"));
  id v9 = HNDLocString(@"SWITCH_OVER_TITLE");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v6;
  id v15 = v11;
  switch(a4)
  {
    case 3uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController screenInputSourceAlertIdentifier]( self,  "screenInputSourceAlertIdentifier"));
      [v7 hideAlertWithIdentifier:v12 forService:v8];
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 showAlertWithText:v10 subtitleText:v15 iconImage:0 type:2 priority:30 duration:v8 forService:AXUIAlertDisplayTimeForever]);
      -[HNDScannerInputViewController setScreenInputSourceAlertIdentifier:]( self,  "setScreenInputSourceAlertIdentifier:",  v13);
      break;
    case 2uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController hardwareInputSourceAlertIdentifier]( self,  "hardwareInputSourceAlertIdentifier"));
      [v7 hideAlertWithIdentifier:v12 forService:v8];
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 showAlertWithText:v10 subtitleText:v15 iconImage:0 type:2 priority:30 duration:v8 forService:AXUIAlertDisplayTimeForever]);
      -[HNDScannerInputViewController setHardwareInputSourceAlertIdentifier:]( self,  "setHardwareInputSourceAlertIdentifier:",  v13);
      break;
    case 1uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceAlertIdentifier]( self,  "cameraInputSourceAlertIdentifier"));
      [v7 hideAlertWithIdentifier:v12 forService:v8];
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 showAlertWithText:v10 subtitleText:v15 iconImage:0 type:2 priority:30 duration:v8 forService:AXUIAlertDisplayTimeForever]);
      -[HNDScannerInputViewController setCameraInputSourceAlertIdentifier:]( self,  "setCameraInputSourceAlertIdentifier:",  v13);
      break;
    default:
      char v14 = 1;
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v14,  @"Could not show alert: %@, for unsupported source: %lu",  v11);
      goto LABEL_9;
  }

LABEL_9:
}

- (void)hideStateForSource:(unint64_t)a3
{
  if (a3 - 2 >= 2)
  {
    if (a3 == 1)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceStateLeftLayer]( self,  "cameraInputSourceStateLeftLayer"));
      if (v7)
      {
        [v7 removeFromSuperlayer];
        -[HNDScannerInputViewController setCameraInputSourceStateLeftLayer:]( self,  "setCameraInputSourceStateLeftLayer:",  0LL);
      }

      v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceStateRightLayer]( self,  "cameraInputSourceStateRightLayer"));
      v5 = v4;
      if (v4)
      {
        [v4 removeFromSuperlayer];
        -[HNDScannerInputViewController setCameraInputSourceStateRightLayer:]( self,  "setCameraInputSourceStateRightLayer:",  0LL);
      }
    }

    else
    {
      char v6 = 1;
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v6,  @"Could not hide state for unsupported source: %lu",  a3);
    }
  }

- (void)showState:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 2 >= 2)
  {
    id v28 = v6;
    if (a4 == 1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDScannerInputViewController view](self, "view"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
      [v9 floatValue];
      float v11 = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:1]);
      [v12 floatValue];
      float v14 = v13;

      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceStateLeftLayer]( self,  "cameraInputSourceStateLeftLayer"));
      if (!v15)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
        objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        id v17 = [v16 assistiveTouchCursorColor];

        v18 = +[UIColor colorWithCGColor:]( &OBJC_CLASS___UIColor,  "colorWithCGColor:",  AXSAssistiveTouchCursorColor(v17));
        id v19 = objc_claimAutoreleasedReturnValue(v18);
        objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

        [v8 bounds];
        objc_msgSend(v15, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v29));
        LODWORD(v20) = 0.5;
        [v15 setOpacity:v20];
        objc_msgSend(v15, "setPosition:", 0.0, 0.0);
        -[HNDScannerInputViewController setCameraInputSourceStateLeftLayer:]( self,  "setCameraInputSourceStateLeftLayer:",  v15);
        [v8 addSublayer:v15];
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( -[HNDScannerInputViewController cameraInputSourceStateRightLayer]( self,  "cameraInputSourceStateRightLayer"));
      if (!v21)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
        objc_msgSend(v21, "setAnchorPoint:", 0.0, 0.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        id v23 = [v22 assistiveTouchCursorColor];

        v24 = +[UIColor colorWithCGColor:]( &OBJC_CLASS___UIColor,  "colorWithCGColor:",  AXSAssistiveTouchCursorColor(v23));
        id v25 = objc_claimAutoreleasedReturnValue(v24);
        objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

        [v8 bounds];
        objc_msgSend(v21, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v30));
        LODWORD(v26) = 0.5;
        [v21 setOpacity:v26];
        [v8 bounds];
        objc_msgSend(v21, "setPosition:", CGRectGetWidth(v31) + -7.5, 0.0);
        -[HNDScannerInputViewController setCameraInputSourceStateRightLayer:]( self,  "setCameraInputSourceStateRightLayer:",  v21);
        [v8 addSublayer:v21];
      }

      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      [v8 bounds];
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v32));
      objc_msgSend(v15, "setPosition:", v11 * -7.5 + 0.0, 0.0);
      [v8 bounds];
      objc_msgSend(v21, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v33));
      [v8 bounds];
      objc_msgSend(v21, "setPosition:", CGRectGetWidth(v34) + -7.5 + v14 * 7.5, 0.0);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }

    else
    {
      char v27 = 1;
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v27,  @"Could not show state: %@, for unsupported source: %lu",  v6);
    }

    id v6 = v28;
  }
}

- (HNDUIServer)userInterfaceServer
{
  return (HNDUIServer *)objc_loadWeakRetained((id *)&self->_userInterfaceServer);
}

- (void)setUserInterfaceServer:(id)a3
{
}

- (NSString)cameraInputSourceAlertIdentifier
{
  return self->_cameraInputSourceAlertIdentifier;
}

- (void)setCameraInputSourceAlertIdentifier:(id)a3
{
}

- (NSString)hardwareInputSourceAlertIdentifier
{
  return self->_hardwareInputSourceAlertIdentifier;
}

- (void)setHardwareInputSourceAlertIdentifier:(id)a3
{
}

- (NSString)screenInputSourceAlertIdentifier
{
  return self->_screenInputSourceAlertIdentifier;
}

- (void)setScreenInputSourceAlertIdentifier:(id)a3
{
}

- (CALayer)cameraInputSourceStateLeftLayer
{
  return self->_cameraInputSourceStateLeftLayer;
}

- (void)setCameraInputSourceStateLeftLayer:(id)a3
{
}

- (CALayer)cameraInputSourceStateRightLayer
{
  return self->_cameraInputSourceStateRightLayer;
}

- (void)setCameraInputSourceStateRightLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end