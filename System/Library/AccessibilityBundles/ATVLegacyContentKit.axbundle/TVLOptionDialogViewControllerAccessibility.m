@interface TVLOptionDialogViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation TVLOptionDialogViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLOptionDialogViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVOptionDialogViewController",  @"headerView",  "@",  0);
  [v3 validateClass:@"TVLOptionDialogViewController" isKindOfClass:@"TVOptionDialogViewController"];
  [v3 validateProtocol:@"ATVUpdatable" hasMethod:@"currentFeedElement" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"TVLOptionDialogViewController" conformsToProtocol:@"ATVUpdatable"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLGenericCollectionElement",  @"listDescription",  "@",  0);
  [v3 validateClass:@"TVLOptionDialogElement" isKindOfClass:@"TVLGenericCollectionElement"];
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVLOptionDialogViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"headerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v3));

  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVLOptionDialogViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"currentFeedElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 safeValueForKey:@"listDescription"]);

  if (v6)
  {
    v7 = (UIAccessibilityElement *)objc_claimAutoreleasedReturnValue( -[TVLOptionDialogViewControllerAccessibility _accessibilityValueForKey:]( self,  "_accessibilityValueForKey:",  @"AXElement"));
    if (!v7)
    {
      v7 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      -[TVLOptionDialogViewControllerAccessibility _accessibilitySetRetainedValue:forKey:]( self,  "_accessibilitySetRetainedValue:forKey:",  v7,  @"AXElement");
    }

    -[UIAccessibilityElement setAccessibilityLabel:](v7, "setAccessibilityLabel:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVLOptionDialogViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"headerView"));
    [v8 accessibilityFrame];
    -[UIAccessibilityElement setAccessibilityFrame:](v7, "setAccessibilityFrame:");

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 arrayByAddingObject:v7]);
    v4 = (void *)v9;
  }

  return v4;
}

@end