@interface TVSUITextAlertControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation TVSUITextAlertControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSUITextAlertController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUITextAlertController",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUITextAlertController",  @"textView",  "@",  0);
  [v3 validateClass:@"TVSUITextAlertController" isKindOfClass:@"UIViewController"];
}

- (id)accessibilityHeaderElements
{
  char v17 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUITextAlertControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v17
    || (char v16 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITextView, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUITextAlertControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"textView")),  uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v16),  v11 = (void *)objc_claimAutoreleasedReturnValue(v10),  v9,  v16))
  {
    abort();
  }

  unint64_t v12 = (unint64_t)[v6 accessibilityTraits];
  UIAccessibilityTraits v13 = UIAccessibilityTraitHeader;
  [v6 setAccessibilityTraits:UIAccessibilityTraitHeader | v12];
  objc_msgSend(v11, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v11, "accessibilityTraits") | v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v6,  v11));

  return v14;
}

@end