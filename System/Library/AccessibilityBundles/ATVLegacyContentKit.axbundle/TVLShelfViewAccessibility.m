@interface TVLShelfViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation TVLShelfViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLShelfView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHeaderElements
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIView, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLShelfViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"superview"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v11) {
    abort();
  }
  id v7 = [v6 _accessibilityDescendantOfType:AXSafeClassFromString(@"TVLDividerView")];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v8));

  return v9;
}

@end