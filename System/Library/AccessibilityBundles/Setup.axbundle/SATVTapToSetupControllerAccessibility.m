@interface SATVTapToSetupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFindTitleLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5;
- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5;
- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4;
@end

@implementation SATVTapToSetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVTapToSetupController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVTapToSetupController",  @"tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:",  "v",  "@",  "@",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVTapToSetupController",  @"tapToSetupManager:didBeginConfigurationPhase:withMetadata:",  "v",  "@",  "q",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVTapToSetupController",  @"tapToSetupManager:networkConnectionStateDidChange:",  "v",  "@",  "q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVTapToSetupController",  @"tapToSetupViewController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVTapToSetupViewController",  @"bannerView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVDialogueColumnHeaderView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVDialogueColumnHeaderView",  @"subtitleLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVTapToSetupControllerAccessibility;
  -[SATVTapToSetupControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v9,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVTapToSetupControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"tapToSetupViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"bannerView"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeUIViewForKey:@"subtitleLabel"]);

  objc_initWeak(&location, v5);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __83__SATVTapToSetupControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_81F8;
  objc_copyWeak(&v7, &location);
  [v5 _setAccessibilityLabelBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __83__SATVTapToSetupControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  char v8 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = __UIAccessibilitySafeClass(@"UILabel", WeakRetained, 1LL, &v8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  if (v8) {
    abort();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"([\\d])\\b",  0LL,  0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v4,  0,  0,  objc_msgSend(v4, "length"),  @"$1, "));

  return v6;
}

- (id)_accessibilityFindTitleLabel
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[SATVTapToSetupControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"tapToSetupViewController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"bannerView"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"titleLabel"]);

  return v4;
}

- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVTapToSetupControllerAccessibility;
  -[SATVTapToSetupControllerAccessibility tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:]( &v8,  "tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:",  a3,  a4,  a5);
  UIAccessibilityNotifications v6 = UIAccessibilityScreenChangedNotification;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATVTapToSetupControllerAccessibility _accessibilityFindTitleLabel]( self,  "_accessibilityFindTitleLabel"));
  UIAccessibilityPostNotification(v6, v7);
}

- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVTapToSetupControllerAccessibility;
  -[SATVTapToSetupControllerAccessibility tapToSetupManager:didBeginConfigurationPhase:withMetadata:]( &v8,  "tapToSetupManager:didBeginConfigurationPhase:withMetadata:",  a3,  a4,  a5);
  UIAccessibilityNotifications v6 = UIAccessibilityScreenChangedNotification;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATVTapToSetupControllerAccessibility _accessibilityFindTitleLabel]( self,  "_accessibilityFindTitleLabel"));
  UIAccessibilityPostNotification(v6, v7);
}

- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVTapToSetupControllerAccessibility;
  -[SATVTapToSetupControllerAccessibility tapToSetupManager:networkConnectionStateDidChange:]( &v7,  "tapToSetupManager:networkConnectionStateDidChange:",  a3,  a4);
  UIAccessibilityNotifications v5 = UIAccessibilityScreenChangedNotification;
  UIAccessibilityNotifications v6 = (void *)objc_claimAutoreleasedReturnValue( -[SATVTapToSetupControllerAccessibility _accessibilityFindTitleLabel]( self,  "_accessibilityFindTitleLabel"));
  UIAccessibilityPostNotification(v5, v6);
}

@end