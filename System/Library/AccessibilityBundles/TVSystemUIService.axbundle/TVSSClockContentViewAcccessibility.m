@interface TVSSClockContentViewAcccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVSSClockContentViewAcccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSClockContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSClockContentViewAcccessibility;
  -[TVSSClockContentViewAcccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __80__TVSSClockContentViewAcccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v3[3] = &unk_8278;
  objc_copyWeak(&v4, &location);
  -[TVSSClockContentViewAcccessibility _setAccessibilityLabelBlock:](self, "_setAccessibilityLabelBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

id __80__TVSSClockContentViewAcccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _accessibilityDescendantOfType:AXSafeClassFromString(@"UILabel")];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

@end