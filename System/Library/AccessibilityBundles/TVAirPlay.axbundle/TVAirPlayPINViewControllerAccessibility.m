@interface TVAirPlayPINViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAirplayPinDescription;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVAirPlayPINViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVAirPlayPINViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVAirPlayPINViewController",  @"pinCode",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVAirPlayPINViewController",  @"digitViewController",  "@",  0);
  [v3 validateClass:@"TVAirPlayPINViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"TVSUIDigitEntryViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"promptLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"digitGroupView",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVAirPlayPINViewControllerAccessibility;
  -[TVAirPlayPINViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v18,  "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"view"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((_BYTE)location) {
    abort();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayPINViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"digitViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"view"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"titleLabel"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"promptLabel"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 safeUIViewForKey:@"digitGroupView"]);
  [v9 setIsAccessibilityElement:0];
  [v10 setIsAccessibilityElement:1];
  [v11 setIsAccessibilityElement:1];
  [v12 setIsAccessibilityElement:1];
  UIAccessibilityTraits v13 = UIAccessibilityTraitHeader;
  [v10 setAccessibilityTraits:UIAccessibilityTraitHeader];
  [v11 setAccessibilityTraits:v13];
  [v12 setAccessibilityTraits:v13];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __85__TVAirPlayPINViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_41F0;
  objc_copyWeak(&v16, &location);
  [v12 _setAccessibilityLabelBlock:v15];
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  3LL,  v10,  v11,  v12));
  [v7 setAccessibilityHeaderElements:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

id __85__TVAirPlayPINViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _accessibilityAirplayPinDescription]);

  return v2;
}

- (id)_accessibilityAirplayPinDescription
{
  char v11 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"pinCode"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v11);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v11) {
    abort();
  }
  if ([v6 length])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v6));
    id v8 = [v7 rangeOfString:v6];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v7, "setAttribute:forKey:withRange:", &__kCFBooleanTrue, UIAccessibilityTokenLiteralText, v8, v9);
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVAirPlayPINViewControllerAccessibility;
  -[TVAirPlayPINViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[TVAirPlayPINViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

- (void)didMoveToParentViewController:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVAirPlayPINViewControllerAccessibility;
  -[TVAirPlayPINViewControllerAccessibility didMoveToParentViewController:](&v13, "didMoveToParentViewController:");
  if (a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayPINViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"digitViewController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 safeUIViewForKey:@"titleLabel"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 safeUIViewForKey:@"promptLabel"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 accessibilityLabel]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayPINViewControllerAccessibility _accessibilityAirplayPinDescription]( self,  "_accessibilityAirplayPinDescription"));
    uint64_t v10 = __UIAXStringForVariables(v8);
    char v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    UIAccessibilitySpeak(v11);
  }

@end