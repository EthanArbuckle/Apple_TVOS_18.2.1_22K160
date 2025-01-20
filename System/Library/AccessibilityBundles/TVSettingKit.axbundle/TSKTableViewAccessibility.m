@interface TSKTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation TSKTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)canBecomeFocused
{
  if ((-[TSKTableViewAccessibility _accessibilityIsFocusForFocusEverywhereRunningForFocusItem]( self,  "_accessibilityIsFocusForFocusEverywhereRunningForFocusItem") & 1) != 0) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TSKTableViewAccessibility;
  return -[TSKTableViewAccessibility canBecomeFocused](&v4, "canBecomeFocused");
}

@end