@interface TVSettingKit_UIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)__accessibilityPreviewRootViewLabel;
- (id)accessibilityLabel;
@end

@implementation TVSettingKit_UIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingKit_UIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"PreviewRootView"];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingKit_UIViewAccessibility __accessibilityPreviewRootViewLabel]( self,  "__accessibilityPreviewRootViewLabel"));
    BOOL v6 = [v5 length] != 0;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingKit_UIViewAccessibility;
    return -[TVSettingKit_UIViewAccessibility isAccessibilityElement](&v8, "isAccessibilityElement");
  }

  return v6;
}

- (id)accessibilityLabel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingKit_UIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"PreviewRootView"];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingKit_UIViewAccessibility __accessibilityPreviewRootViewLabel]( self,  "__accessibilityPreviewRootViewLabel"));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingKit_UIViewAccessibility;
    id v6 = -[TVSettingKit_UIViewAccessibility accessibilityLabel](&v8, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingKit_UIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  unsigned __int8 v4 = [v3 isEqualToString:@"PreviewRootView"];

  if ((v4 & 1) != 0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingKit_UIViewAccessibility;
  return -[TVSettingKit_UIViewAccessibility accessibilityRespondsToUserInteraction]( &v6,  "accessibilityRespondsToUserInteraction");
}

- (id)__accessibilityPreviewRootViewLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingKit_UIViewAccessibility _accessibilityViewController](self, "_accessibilityViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"descriptionLabel"]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  return v4;
}

@end