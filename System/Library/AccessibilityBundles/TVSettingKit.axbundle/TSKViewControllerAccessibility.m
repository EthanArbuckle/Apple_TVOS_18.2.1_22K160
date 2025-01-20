@interface TSKViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TSKViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TSKViewControllerAccessibility;
  -[TSKViewControllerAccessibility tableView:didSelectRowAtIndexPath:]( &v4,  "tableView:didSelectRowAtIndexPath:",  a3,  a4);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

@end