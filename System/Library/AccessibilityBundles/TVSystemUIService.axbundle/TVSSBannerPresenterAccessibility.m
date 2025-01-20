@interface TVSSBannerPresenterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
@end

@implementation TVSSBannerPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSBannerPresenter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSBannerTemplatePresentableViewController",  @"pillContentView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSBannerTemplatePresentableViewController",  @"marqueable",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPToastView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPToastView",  @"subtitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPToastView",  @"footerLabel",  "@",  0);
}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSSBannerPresenterAccessibility;
  -[TVSSBannerPresenterAccessibility presentPresentable:withOptions:userInfo:]( &v24,  "presentPresentable:withOptions:userInfo:",  v8,  a4,  a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"pillContentView"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 safeValueForKey:@"accessibilityContentViewLabel"]);
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"marqueable"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"titleLabel"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accessibilityLabel]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"subtitleLabel"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityLabel]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"footerLabel"]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v16 accessibilityLabel]);
    v23 = @"__AXStringForVariablesSentinel";
    v21 = v15;
    uint64_t v17 = __UIAXStringForVariables(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  if (objc_msgSend(v10, "length", v21, v22, v23))
  {
    id v18 = accessibilityLocalizedString(@"alert.notification");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v19, v10));
    UIAccessibilityATVPostAnnouncementNotification(v20, kAXAnnouncementTypeAlertSound, 1LL);
  }
}

@end