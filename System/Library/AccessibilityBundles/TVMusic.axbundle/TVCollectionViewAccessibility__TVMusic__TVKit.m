@interface TVCollectionViewAccessibility__TVMusic__TVKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityScannerGroupElements;
@end

@implementation TVCollectionViewAccessibility__TVMusic__TVKit

+ (id)safeCategoryTargetClassName
{
  return @"TVCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityScannerGroupElements
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVCollectionViewAccessibility__TVMusic__TVKit;
  id v3 = -[TVCollectionViewAccessibility__TVMusic__TVKit _accessibilityScannerGroupElements]( &v8,  "_accessibilityScannerGroupElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVCollectionViewAccessibility__TVMusic__TVKit _accessibilityFindSubviewDescendantsPassingTest:]( self,  "_accessibilityFindSubviewDescendantsPassingTest:",  &__block_literal_global_1));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayWithPossiblyNilArrays:]( &OBJC_CLASS___NSArray,  "axArrayWithPossiblyNilArrays:",  2LL,  v5,  v4));

  return v6;
}

@end