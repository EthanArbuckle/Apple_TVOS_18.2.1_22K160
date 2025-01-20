@interface _TVRatingViewControllerStarCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_isAccessibilityExplorerElement;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation _TVRatingViewControllerStarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVRatingViewControllerStarCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVRatingViewControllerStarCellAccessibility;
  v3 = (char *)-[_TVRatingViewControllerStarCellAccessibility accessibilityRowRange](&v10, "accessibilityRowRange") + 1;
  if ((unint64_t)v3 > 0x7FFFFFFFFFFFFFFELL)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS____TVRatingViewControllerStarCellAccessibility;
    id v8 = -[_TVRatingViewControllerStarCellAccessibility accessibilityLabel](&v9, "accessibilityLabel");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v4 = accessibilityLocalizedString(@"star.rating.tvkit");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v3));

    return v6;
  }

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"star.rating.hint");
}

- (BOOL)_isAccessibilityExplorerElement
{
  return 0;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2 = 0x7FFFFFFFLL;
  NSUInteger v3 = 0LL;
  result.length = v3;
  result.location = v2;
  return result;
}

@end