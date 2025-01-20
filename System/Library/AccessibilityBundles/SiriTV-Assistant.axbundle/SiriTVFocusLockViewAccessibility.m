@interface SiriTVFocusLockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityUnderlyingElementForFocusItem;
@end

@implementation SiriTVFocusLockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriTV.FocusLockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SiriTV.ContentPlattersView"];
  [v3 validateClass:@"SiriTV.ConversationView"];
  [v3 validateClass:@"SiriTV.ContentPlattersView" hasSwiftField:@"conversationView" withSwiftType:"Optional<UIView>"];
}

- (id)_accessibilityUnderlyingElementForFocusItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SiriTVFocusLockViewAccessibility _accessibilityFindViewAncestor:startWithSelf:]( self,  "_accessibilityFindViewAncestor:startWithSelf:",  &__block_literal_global_1,  0LL));
  char v12 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIView, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeSwiftValueForKey:@"conversationView"]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v12);
  v8 = (SiriTVFocusLockViewAccessibility *)objc_claimAutoreleasedReturnValue(v7);

  if (v12) {
    abort();
  }
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = self;
  }
  v10 = v9;

  return v10;
}

BOOL __79__SiriTVFocusLockViewAccessibility__accessibilityUnderlyingElementForFocusItem__block_invoke( id a1,  id a2,  BOOL *a3)
{
  id v3 = a2;
  uint64_t v4 = AXSafeClassFromString(@"SiriTV.ContentPlattersView");
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

@end