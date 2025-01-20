@interface PBAirPlayManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dismissWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentUIProvider:(id)a3 completion:(id)a4;
@end

@implementation PBAirPlayManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBAirPlayManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAirPlayManager",  @"presentUIProvider:completion:",  "v",  "@",  "@?",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAirPlayManager",  @"_dismissWithReason:animated:completion:",  "v",  "@",  "B",  "@?",  0);
}

- (void)presentUIProvider:(id)a3 completion:(id)a4
{
  v8[1] = 3221225472LL;
  v8[2] = __62__PBAirPlayManagerAccessibility_presentUIProvider_completion___block_invoke;
  v8[3] = &unk_8338;
  id v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAirPlayManagerAccessibility;
  v8[0] = _NSConcreteStackBlock;
  id v6 = v9;
  -[PBAirPlayManagerAccessibility presentUIProvider:completion:](&v7, "presentUIProvider:completion:", a3, v8);
}

void __62__PBAirPlayManagerAccessibility_presentUIProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  id v3 = accessibilityLocalizedString(@"present.airplay.announcement");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  UIAccessibilityPostNotification(v2, v4);
}

- (void)_dismissWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v10[1] = 3221225472LL;
  v10[2] = __72__PBAirPlayManagerAccessibility__dismissWithReason_animated_completion___block_invoke;
  v10[3] = &unk_8360;
  id v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAirPlayManagerAccessibility;
  v10[0] = _NSConcreteStackBlock;
  id v8 = v11;
  -[PBAirPlayManagerAccessibility _dismissWithReason:animated:completion:]( &v9,  "_dismissWithReason:animated:completion:",  a3,  v5,  v10);
}

void __72__PBAirPlayManagerAccessibility__dismissWithReason_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  id v3 = accessibilityLocalizedString(@"dismiss.airplay.announcement");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  UIAccessibilityPostNotification(v2, v4);
}

@end