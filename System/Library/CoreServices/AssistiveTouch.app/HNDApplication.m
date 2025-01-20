@interface HNDApplication
+ (BOOL)usesScenes;
+ (double)preferredWindowLevel;
- (BOOL)_accessibilityApplicationDidBecomeFocused;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_supportedOnLockScreen;
- (BOOL)isSuspended;
- (HNDApplication)init;
- (id)_accessibilityMainWindow;
- (id)_accessibilityScannerCurrentFocusContext;
- (id)_accessibilityScannerCurrentLoopElements;
- (id)_accessibilityScannerCurrentLoopElementsForFocusContext:(id)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (unint64_t)_accessibilityScannerCurrentLoopIndex;
@end

@implementation HNDApplication

- (HNDApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HNDApplication;
  v2 = -[HNDApplication init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v3 performValidations:&stru_1001238A8 withPreValidationHandler:&stru_1001238C8 postValidationHandler:0];
  }

  return v2;
}

+ (BOOL)usesScenes
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HNDApplication;
  return objc_msgSendSuper2(&v3, "usesScenes");
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)_supportedOnLockScreen
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (id)_accessibilityScannerCurrentFocusContext
{
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  if (IsSwitchControlRunning)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeScannerDriver]);

    if ([v4 isActive])
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusContext]);
    }

    else
    {
      _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Someone tried to get info about the current Switch Control loop, but the scanner was not active.");
      objc_super v5 = 0LL;
    }
  }

  else
  {
    _AXLogWithFacility( IsSwitchControlRunning,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Someone tried to get info about the current Switch Control loop, but it was not running!");
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)_accessibilityScannerCurrentLoopElements
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[HNDApplication _accessibilityScannerCurrentFocusContext]( self,  "_accessibilityScannerCurrentFocusContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDApplication _accessibilityScannerCurrentLoopElementsForFocusContext:]( self,  "_accessibilityScannerCurrentLoopElementsForFocusContext:",  v3));

  return v4;
}

- (id)_accessibilityScannerCurrentLoopElementsForFocusContext:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);
    if ([v4 selectBehavior] == 4)
    {
      if (([v5 isGroup] & 1) == 0) {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDApplication.m",  154LL,  "-[HNDApplication _accessibilityScannerCurrentLoopElementsForFocusContext:]",  @"Should not have been able to drill out of a single element");
      }
      id v6 = v5;
    }

    else
    {
      int v18 = 0;
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v5));
      char v17 = 0;
      id v7 = v5;
      v8 = v7;
      do
      {
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeElementManager]);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v11 siblingOfElement:v8 inDirection:0 didWrap:&v17 options:&v18]);

        if (v17) {
          break;
        }
        [v6 addObject:v8];
      }

      while (!v17);
      char v17 = 0;
      id v12 = v7;

      while (!v17)
      {
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activeElementManager]);
        id v12 = (id)objc_claimAutoreleasedReturnValue([v15 siblingOfElement:v12 inDirection:1 didWrap:&v17 options:&v18]);

        if (v17) {
          break;
        }
        [v6 insertObject:v12 atIndex:0];
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (unint64_t)_accessibilityScannerCurrentLoopIndex
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[HNDApplication _accessibilityScannerCurrentFocusContext]( self,  "_accessibilityScannerCurrentFocusContext"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDApplication _accessibilityScannerCurrentLoopElementsForFocusContext:]( self,  "_accessibilityScannerCurrentLoopElementsForFocusContext:",  v3));
    if ([v3 selectBehavior] == 4)
    {
      unint64_t v5 = (unint64_t)[v4 count];
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);
      unint64_t v5 = (unint64_t)[v4 indexOfObject:v6];

      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDApplication.m",  206LL,  "-[HNDApplication _accessibilityScannerCurrentLoopIndex]",  @"Something's weird--we were unable to find the current element in the scan loop.");
        unint64_t v5 = 0x7FFFFFFFLL;
      }
    }
  }

  else
  {
    unint64_t v5 = 0x7FFFFFFFLL;
  }

  return v5;
}

- (id)_accessibilityMainWindow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainWindow]);

  return v3;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v6 = [v5 appValidationTestingMode];

  if ((v6 & 1) != 0) {
    return 0LL;
  }
  if (a3 > 1992)
  {
    if (a3 == 1993)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 recentSpeechOutputStrings]);
    }

    else
    {
      if (a3 != 5060) {
        goto LABEL_10;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 nubbitVisible]));
    }
  }

  else
  {
    if (a3 != 1990)
    {
      if (a3 == 1991)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[HNDApplication _accessibilityScannerCurrentLoopIndex]( self,  "_accessibilityScannerCurrentLoopIndex")));
        return v8;
      }

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HNDApplication;
  return -[HNDApplication _iosAccessibilityPerformAction:withValue:fencePort:]( &v6,  "_iosAccessibilityPerformAction:withValue:fencePort:",  *(void *)&a3,  a4,  *(void *)&a5);
}

- (BOOL)_accessibilityApplicationDidBecomeFocused
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDApplication _accessibilityNativeFocusElement](self, "_accessibilityNativeFocusElement"));
  if (!v3)
  {
    uint64_t v4 = FKALogCommon();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Manually poking focus system in AssistiveTouch because no focused item was found.",  v7,  2u);
    }

    AXPerformSafeBlock(&stru_1001238E8);
    -[HNDApplication _accessibilityMoveFocusWithHeading:](self, "_accessibilityMoveFocusWithHeading:", 16LL);
  }

  return 1;
}

+ (double)preferredWindowLevel
{
  return 10000010.0;
}

@end