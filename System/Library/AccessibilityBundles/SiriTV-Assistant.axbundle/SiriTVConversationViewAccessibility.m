@interface SiriTVConversationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityContainer;
@end

@implementation SiriTVConversationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriTV.ConversationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityContainer
{
  return 0LL;
}

@end