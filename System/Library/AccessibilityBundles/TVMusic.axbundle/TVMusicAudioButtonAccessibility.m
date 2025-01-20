@interface TVMusicAudioButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityButtonType;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicAudioButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicAudioButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVMusicAudioButton" isKindOfClass:@"UIView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicAudioButton",  @"buttonType",  "q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicAudioButton",  @"label",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  switch(-[TVMusicAudioButtonAccessibility _accessibilityButtonType](self, "_accessibilityButtonType"))
  {
    case 1LL:
      id v3 = @"oasis.audioBadge.lossless";
      goto LABEL_8;
    case 2LL:
      id v3 = @"oasis.audioBadge.HiResLossless";
      goto LABEL_8;
    case 3LL:
      id v3 = @"oasis.audioBadge.DolbyAtmos";
      goto LABEL_8;
    case 4LL:
      id v3 = @"oasis.audioBadge.DolbyAudio";
LABEL_8:
      id v7 = accessibilityOasisMusicLocalizedString(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    default:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", @"label"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityLabel]);

      if ([v5 length])
      {
        id v6 = v5;
      }

      else
      {
        v11.receiver = self;
        v11.super_class = (Class)&OBJC_CLASS___TVMusicAudioButtonAccessibility;
        id v10 = -[TVMusicAudioButtonAccessibility accessibilityLabel](&v11, "accessibilityLabel");
        id v6 = (id)objc_claimAutoreleasedReturnValue(v10);
      }

      v8 = v6;

      break;
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  if (-[TVMusicAudioButtonAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"userInteractionEnabled"))
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVMusicAudioButtonAccessibility;
    return UIAccessibilityTraitButton | -[TVMusicAudioButtonAccessibility accessibilityTraits]( &v5,  "accessibilityTraits");
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___TVMusicAudioButtonAccessibility;
    return -[TVMusicAudioButtonAccessibility accessibilityTraits](&v4, "accessibilityTraits");
  }

- (int64_t)_accessibilityButtonType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioButtonAccessibility safeValueForKey:](self, "safeValueForKey:", @"buttonType"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

@end