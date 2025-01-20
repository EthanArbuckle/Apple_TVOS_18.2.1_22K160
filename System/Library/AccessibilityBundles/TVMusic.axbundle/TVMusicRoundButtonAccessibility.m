@interface TVMusicRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicRoundButtonAccessibility;
  return UIAccessibilityTraitButton | -[TVMusicRoundButtonAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityLabel
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel"));
  if ([v3 length])
  {
    id v5 = v3;
  }

  else
  {
    char v16 = 0;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIImageView, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", @"imageView"));
    uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v16) {
      abort();
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 image]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessibilityLabel]);

    if (![v11 length])
    {
      v15.receiver = self;
      v15.super_class = (Class)&OBJC_CLASS___TVMusicRoundButtonAccessibility;
      id v14 = -[TVMusicRoundButtonAccessibility accessibilityLabel](&v15, "accessibilityLabel");
      id v5 = (id)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_7;
    }

    id v5 = v11;
  }

  v11 = v5;
LABEL_7:
  v12 = v5;

  return v12;
}

@end