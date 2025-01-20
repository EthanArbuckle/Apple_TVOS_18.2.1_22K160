@interface HBTopShelfLabeledContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation HBTopShelfLabeledContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfLabeledContentView";
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
  id v2 = -[HBTopShelfLabeledContentViewAccessibility _accessibilityDescendantOfType:]( self,  "_accessibilityDescendantOfType:",  NSClassFromString(@"HBTopShelfSectionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v3));

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HBTopShelfLabeledContentViewAccessibility;
  id v4 = -[HBTopShelfLabeledContentViewAccessibility collectionView:cellForItemAtIndexPath:]( &v7,  "collectionView:cellForItemAtIndexPath:",  a3,  a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setAccessibilityIdentifier:@"LabeledContentTopShelfCell"];
  return v5;
}

@end