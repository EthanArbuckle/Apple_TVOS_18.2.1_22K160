@interface TVMusicPlaylistLockupViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicPlaylistLockupViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicPlaylistLockupViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicPlaylistLockupViewCell",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicPlaylistLockupViewCell",  @"subtitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicPlaylistLockupViewCell",  @"floatingView",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlaylistLockupViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlaylistLockupViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);
  uint64_t v6 = __UIAXStringForVariables(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_accessibilityFrameDelegate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlaylistLockupViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"floatingView"));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistLockupViewCellAccessibility;
    id v6 = -[TVMusicPlaylistLockupViewCellAccessibility _accessibilityFrameDelegate](&v9, "_accessibilityFrameDelegate");
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  v7 = v5;

  return v7;
}

@end