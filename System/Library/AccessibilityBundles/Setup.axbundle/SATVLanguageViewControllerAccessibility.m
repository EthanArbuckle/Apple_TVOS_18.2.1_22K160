@interface SATVLanguageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation SATVLanguageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVLanguageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVLanguageViewControllerAccessibility;
  -[SATVLanguageViewControllerAccessibility tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v7,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4,  a5);
  if (UIAccessibilityIsVoiceOverRunning() && (objc_opt_respondsToSelector(self, "_updateLabelValue") & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __102__SATVLanguageViewControllerAccessibility_tableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v6[3] = &unk_8248;
    v6[4] = self;
    AXPerformSafeBlock(v6);
  }

id __102__SATVLanguageViewControllerAccessibility_tableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLabelValue];
}

@end