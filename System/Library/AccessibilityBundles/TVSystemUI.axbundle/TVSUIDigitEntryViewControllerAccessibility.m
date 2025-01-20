@interface TVSUIDigitEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityDigitEntryDescription;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation TVSUIDigitEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSUIDigitEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"digitGroupView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"promptLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"accessoryView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitEntryViewController",  @"isEditable",  "B",  0);
  [v3 validateClass:@"TVSUIDigitEntryViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitGroupView",  @"text",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIDigitGroupView",  @"isSecure",  "B",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSUIDigitEntryViewControllerAccessibility;
  id v3 = -[TVSUIDigitEntryViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v14,  "_accessibilityLoadAccessibilityInformation");
  if ((AXProcessIsTVAirPlay(v3) & 1) == 0)
  {
    LOBYTE(location) = 0;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIView, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"view"));
    uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if ((_BYTE)location) {
      abort();
    }
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __88__TVSUIDigitEntryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v11[3] = &unk_4200;
    objc_copyWeak(&v12, &location);
    [v8 _setIsAccessibilityElementBlock:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __88__TVSUIDigitEntryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v9[3] = &unk_4228;
    objc_copyWeak(&v10, &location);
    [v8 _setAccessibilityLabelBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

uint64_t __88__TVSUIDigitEntryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained safeBoolForKey:@"isEditable"];

  return v2 ^ 1;
}

id __88__TVSUIDigitEntryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _accessibilityDigitEntryDescription]);

  return v2;
}

- (id)_accessibilityDigitEntryDescription
{
  char v33 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v33);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v33) {
    goto LABEL_11;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);

  char v32 = 0;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UILabel, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"promptLabel"));
  uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &v32);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v32) {
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accessibilityLabel]);

  char v31 = 0;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___UIView, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"digitGroupView"));
  uint64_t v17 = __UIAccessibilityCastAsClass(v15, v16, 1LL, &v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v31) {
    goto LABEL_11;
  }
  if (([v18 safeBoolForKey:@"isSecure"] & 1) == 0)
  {
    char v30 = 0;
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v18 safeValueForKey:@"text"]);
    uint64_t v23 = __UIAccessibilityCastAsClass(v21, v22, 1LL, &v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (!v30) {
      goto LABEL_7;
    }
LABEL_11:
    abort();
  }

  v20 = 0LL;
LABEL_7:
  uint64_t v24 = __UIAXStringForVariables(v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v25,  v13,  v20,  @"__AXStringForVariablesSentinel"));

  if ([v20 length])
  {
    id v27 = [v26 rangeOfString:v20];
    if (v27 != (id)0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v26, "setAttribute:forKey:withRange:", &__kCFBooleanTrue, UIAccessibilityTokenLiteralText, v27, v28);
    }
  }

  return v26;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSUIDigitEntryViewControllerAccessibility;
  -[TVSUIDigitEntryViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[TVSUIDigitEntryViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityHeaderElements
{
  char v17 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v17
    || (char v16 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UILabel, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIDigitEntryViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"promptLabel")),  uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v16),  v11 = (void *)objc_claimAutoreleasedReturnValue(v10),  v9,  v16))
  {
    abort();
  }

  unint64_t v12 = (unint64_t)[v6 accessibilityTraits];
  UIAccessibilityTraits v13 = UIAccessibilityTraitHeader;
  [v6 setAccessibilityTraits:UIAccessibilityTraitHeader | v12];
  objc_msgSend(v11, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v11, "accessibilityTraits") | v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v6,  v11));

  return v14;
}

@end