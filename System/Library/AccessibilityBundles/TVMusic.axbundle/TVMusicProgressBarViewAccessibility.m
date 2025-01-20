@interface TVMusicProgressBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (Class)_accessibilityTVMusicTransportBarViewClass;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TVMusicProgressBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicProgressBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (Class)_accessibilityTVMusicTransportBarViewClass
{
  if (_accessibilityTVMusicTransportBarViewClass_onceToken != -1) {
    dispatch_once(&_accessibilityTVMusicTransportBarViewClass_onceToken, &__block_literal_global);
  }
  return (Class)(id)_accessibilityTVMusicTransportBarViewClass_TVMusicTransportBarViewClass;
}

void __81__TVMusicProgressBarViewAccessibility__accessibilityTVMusicTransportBarViewClass__block_invoke(id a1)
{
  _accessibilityTVMusicTransportBarViewClass_TVMusicTransportBarViewClass = (uint64_t)NSClassFromString(@"TVMusicTransportBarView");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicProgressBarViewAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  -[TVMusicProgressBarViewAccessibility _accessibilityTVMusicTransportBarViewClass]( self,  "_accessibilityTVMusicTransportBarViewClass")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (id)accessibilityAttributedLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicProgressBarViewAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  -[TVMusicProgressBarViewAccessibility _accessibilityTVMusicTransportBarViewClass]( self,  "_accessibilityTVMusicTransportBarViewClass")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityAttributedLabel]);

  return v3;
}

- (id)accessibilityValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicProgressBarViewAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  -[TVMusicProgressBarViewAccessibility _accessibilityTVMusicTransportBarViewClass]( self,  "_accessibilityTVMusicTransportBarViewClass")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityValue]);

  return v3;
}

- (id)accessibilityAttributedValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicProgressBarViewAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  -[TVMusicProgressBarViewAccessibility _accessibilityTVMusicTransportBarViewClass]( self,  "_accessibilityTVMusicTransportBarViewClass")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityAttributedValue]);

  return v3;
}

@end