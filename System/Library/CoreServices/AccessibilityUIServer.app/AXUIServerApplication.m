@interface AXUIServerApplication
- (AXUIServerApplication)init;
- (BOOL)_accessibilityIsAccessibilityUIServer;
- (BOOL)_accessibilityIsLaunchAngel;
- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (BOOL)_shouldAllowKeyboardArbiter;
- (CGRect)accessibilityFrame;
- (id)_accessibilityIsolatedWindows;
- (id)accessibilityLabel;
- (int64_t)_accessibilityOrientationForCompareGeometry;
- (void)sendEvent:(id)a3;
@end

@implementation AXUIServerApplication

- (AXUIServerApplication)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXUIServerApplication;
  v2 = -[AXUIServerApplication init](&v6, "init");
  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIServiceManager sharedServiceManager](&OBJC_CLASS___AXUIServiceManager, "sharedServiceManager"));
    if (v3)
    {
      v4 = v3;
      [v3 _startLaunchAngel];
    }
  }

  return v2;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIEventManager sharedEventManager](&OBJC_CLASS___AXUIEventManager, "sharedEventManager"));
  unsigned __int8 v6 = [v5 _handleUIEvent:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___AXUIServerApplication;
    -[AXUIServerApplication sendEvent:](&v7, "sendEvent:", v4);
  }
}

- (id)accessibilityLabel
{
  return &stru_1000083E0;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (BOOL)_accessibilityIsLaunchAngel
{
  return 1;
}

- (BOOL)_accessibilityIsAccessibilityUIServer
{
  return 1;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (int64_t)_accessibilityOrientationForCompareGeometry
{
  if ((AXInPreboardScenario(self, a2) & 1) != 0) {
    return 1LL;
  }
  else {
    return (int64_t)-[AXUIServerApplication activeInterfaceOrientation](self, "activeInterfaceOrientation");
  }
}

- (CGRect)accessibilityFrame
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_accessibilityIsolatedWindows
{
  if ((objc_opt_respondsToSelector(UIApp, "_accessibilityAllWindowsOnlyVisibleWindows:") & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v9 = 0LL;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  double v12 = sub_1000034F8;
  double v13 = sub_100003508;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003510;
  v8[3] = &unk_100008270;
  v8[4] = &v9;
  AXPerformSafeBlock(v8);
  id v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (!v2)
  {
LABEL_3:
    uint64_t v9 = 0LL;
    double v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    double v12 = sub_1000034F8;
    double v13 = sub_100003508;
    id v14 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100003554;
    v7[3] = &unk_100008270;
    v7[4] = &v9;
    AXPerformSafeBlock(v7);
    id v2 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003598;
  v5[3] = &unk_100008298;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = v3;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  return v3;
}

@end