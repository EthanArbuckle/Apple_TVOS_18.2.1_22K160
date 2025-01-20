@interface TSKTableViewHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TSKTableViewHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKTableViewHeaderFooterView";
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
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TSKTableViewHeaderFooterViewAccessibility;
  id v2 = -[TSKTableViewHeaderFooterViewAccessibility accessibilityLabel](&v7, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  return v5;
}

@end