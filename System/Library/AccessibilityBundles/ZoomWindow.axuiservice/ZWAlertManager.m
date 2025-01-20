@interface ZWAlertManager
- (BOOL)_shouldShowZoomAlert;
- (NSString)currentAlertID;
- (void)setCurrentAlertID:(id)a3;
- (void)showOrbZoomToggleOff;
- (void)showOrbZoomToggleOn;
- (void)showZoomDisabledAlertIfAppropriate;
- (void)showZoomEnabledAlertIfAppropriate;
@end

@implementation ZWAlertManager

- (void)showZoomEnabledAlertIfAppropriate
{
  if (-[ZWAlertManager _shouldShowZoomAlert](self, "_shouldShowZoomAlert"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 zoomShowedBanner];

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
        [v5 hideAlertWithIdentifier:v7 forService:v8];
      }

      id v9 = ZWLocString(@"ZOOM_ENABLED_BANNER");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( [v5 showAlertWithText:v10 subtitleText:0 iconImage:0 type:0 priority:30 duration:v11 forService:2.0]);
      -[ZWAlertManager setCurrentAlertID:](self, "setCurrentAlertID:", v12);
    }
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v13 setZoomShowedBanner:1];
}

- (void)showZoomDisabledAlertIfAppropriate
{
  if (-[ZWAlertManager _shouldShowZoomAlert](self, "_shouldShowZoomAlert"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
      [v3 hideAlertWithIdentifier:v5 forService:v6];
    }

    id v7 = ZWLocString(@"ZOOM_DISABLED_BANNER");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( [v3 showAlertWithText:v8 subtitleText:0 iconImage:0 type:0 priority:30 duration:v9 forService:2.0]);
    -[ZWAlertManager setCurrentAlertID:](self, "setCurrentAlertID:", v10);
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v11 setZoomShowedBanner:0];
}

- (BOOL)_shouldShowZoomAlert
{
  return 0;
}

- (void)showOrbZoomToggleOn
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));

  if (v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
    [v8 hideAlertWithIdentifier:v4 forService:v5];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v8 showAlertWithText:@"Force Touch Zoom Enabled" subtitleText:0 iconImage:0 type:0 priority:30 duration:v6 forService:1.0]);
  -[ZWAlertManager setCurrentAlertID:](self, "setCurrentAlertID:", v7);
}

- (void)showOrbZoomToggleOff
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));

  if (v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAlertManager currentAlertID](self, "currentAlertID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
    [v8 hideAlertWithIdentifier:v4 forService:v5];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWUIServer sharedInstance](&OBJC_CLASS___ZWUIServer, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v8 showAlertWithText:@"Force Touch Zoom Disabled" subtitleText:0 iconImage:0 type:0 priority:30 duration:v6 forService:1.0]);
  -[ZWAlertManager setCurrentAlertID:](self, "setCurrentAlertID:", v7);
}

- (NSString)currentAlertID
{
  return self->_currentAlertID;
}

- (void)setCurrentAlertID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end