@interface TVMusicNoMusicViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVMusicNoMusicViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVMusicNoMusicViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicNoMusicView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicNoMusicViewAccessibility;
  -[TVMusicNoMusicViewAccessibility _accessibilityLoadAccessibilityInformation]( &v13,  "_accessibilityLoadAccessibilityInformation");
  char v12 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNoMusicViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_buttonView"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v12) {
    abort();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessibilityLabel]);
  unsigned int v9 = [v8 axContainsString:@""];

  if (v9)
  {
    id v10 = accessibilityLocalizedString(@"empty.library.upsell.button.label");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v7 setAccessibilityLabel:v11];
  }
}

- (TVMusicNoMusicViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicNoMusicViewAccessibility;
  uint64_t v3 = -[TVMusicNoMusicViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVMusicNoMusicViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end