@interface PineBoardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityNativeFocusPreferredElement;
- (void)activateAppSwitcher;
@end

@implementation PineBoardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PineBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PineBoard",  @"activateAppSwitcher",  "v",  0);
  [v3 validateClass:@"PBWindowManager"];
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"PBWindowManager",  @"sharedInstance",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBWindowManager",  @"shouldForwardSystemAppEvent",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBWindowManager",  @"activeWindow",  "@",  0);
  [v3 validateClass:@"PBPresentationElementViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBPresentationElementViewController",  @"contentViewController",  "@",  0);
  [v3 validateClass:@"PBViewServiceContentPresentingViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBViewServiceContentPresentingViewController",  @"remoteViewController",  "@",  0);
  [v3 validateClass:@"PBSimpleRemoteViewController" isKindOfClass:@"_UIRemoteViewController"];
  [v3 validateClass:@"_UIRemoteViewController" hasInstanceVariable:@"_sizeTrackingView" withType:"_UISizeTrackingView"];
}

- (void)activateAppSwitcher
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PineBoardAccessibility;
  -[PineBoardAccessibility activateAppSwitcher](&v4, "activateAppSwitcher");
  id v2 = accessibilityLocalizedString(@"app.switcher");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (id)_accessibilityNativeFocusPreferredElement
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v3 = [(id)AXSafeClassFromString(@"PBWindowManager") safeValueForKey:@"sharedInstance"];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if ([v4 safeBoolForKey:@"shouldForwardSystemAppEvent"])
    {
      char v25 = 0;
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIWindow, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"activeWindow"]);
      uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      if (v25) {
        abort();
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rootViewController]);
      uint64_t v11 = AXSafeClassFromString(@"PBPresentationElementViewController");
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"contentViewController"]);
        uint64_t v13 = AXSafeClassFromString(@"PBViewServiceContentPresentingViewController");
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 safeValueForKey:@"remoteViewController"]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 safeValueForKey:@"_sizeTrackingView"]);
          id v16 = [v15 _accessibilityRemotePid];
          if ((int)v16 > 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
            uint64_t v18 = AXConvertPidToAXElement();
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

            return v19;
          }
        }
      }
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXPineBoardServer server](&OBJC_CLASS___AXPineBoardServer, "server"));
  unsigned __int8 v22 = [v21 isControlCenterVisible];

  if ((v22 & 1) != 0) {
    return 0LL;
  }
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PineBoardAccessibility;
  id v23 = -[PineBoardAccessibility _accessibilityNativeFocusPreferredElement]( &v24,  "_accessibilityNativeFocusPreferredElement");
  return (id)objc_claimAutoreleasedReturnValue(v23);
}

@end