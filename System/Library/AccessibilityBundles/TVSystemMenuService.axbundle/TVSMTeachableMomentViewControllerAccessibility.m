@interface TVSMTeachableMomentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TVSMTeachableMomentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMTeachableMomentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMTeachableMomentViewController",  @"viewDidAppear:",  "v",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMTeachableMomentViewController",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMTeachableMomentViewController",  @"messageLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMTeachableMomentViewController",  @"actionLabel",  "@",  0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSMTeachableMomentViewControllerAccessibility;
  -[TVSMTeachableMomentViewControllerAccessibility viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSMTeachableMomentViewControllerAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"titleLabel, messageLabel, actionLabel"));
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v4);
}

@end