@interface TVCKStoreFavoritesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVCKStoreFavoritesViewAccessibility)initWithItemSize:(CGSize)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVCKStoreFavoritesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVCKStoreFavoritesView";
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVCKStoreFavoritesViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVCKStoreFavoritesViewAccessibility;
  -[TVCKStoreFavoritesViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVCKStoreFavoritesViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView"));
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
}

- (TVCKStoreFavoritesViewAccessibility)initWithItemSize:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVCKStoreFavoritesViewAccessibility;
  v3 = -[TVCKStoreFavoritesViewAccessibility initWithItemSize:](&v5, "initWithItemSize:", a3.width, a3.height);
  -[TVCKStoreFavoritesViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end