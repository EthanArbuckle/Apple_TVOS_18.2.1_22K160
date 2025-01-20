@interface TVMusicInterfaceFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_viewForImageResourceWithURL:(id)a3 withSize:(CGSize)a4 tintColor:(id)a5 existingView:(id)a6;
@end

@implementation TVMusicInterfaceFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicInterfaceFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend( a3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicInterfaceFactory",  @"_viewForImageResourceWithURL:withSize:tintColor:existingView:",  "@",  "{CGSize=dd}",  "@",  "@",  0);
}

- (id)_viewForImageResourceWithURL:(id)a3 withSize:(CGSize)a4 tintColor:(id)a5 existingView:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVMusicInterfaceFactoryAccessibility;
  id v10 = a3;
  id v11 = -[TVMusicInterfaceFactoryAccessibility _viewForImageResourceWithURL:withSize:tintColor:existingView:]( &v18,  "_viewForImageResourceWithURL:withSize:tintColor:existingView:",  v10,  a5,  a6,  width,  height);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "host", v18.receiver, v18.super_class));

  if ([v13 isEqualToString:@"DigitalMasterBadge"])
  {
    v14 = @"oasis.audioBadge.DigitalMaster";
  }

  else if (([v13 isEqualToString:@"DolbyAtmosBadge"] & 1) != 0 {
         || ([v13 isEqualToString:@"DolbyAtmosStackedBadge"] & 1) != 0)
  }
  {
    v14 = @"oasis.audioBadge.DolbyAtmos";
  }

  else if (([v13 isEqualToString:@"DolbyAudioBadge"] & 1) != 0 {
         || ([v13 isEqualToString:@"DolbyAudioStackedBadge"] & 1) != 0)
  }
  {
    v14 = @"oasis.audioBadge.DolbyAudio";
  }

  else if ([v13 isEqualToString:@"HiResLosslessAudioBadge"])
  {
    v14 = @"oasis.audioBadge.HiResLossless";
  }

  else
  {
    v14 = @"oasis.audioBadge.lossless";
  }

  [v12 setIsAccessibilityElement:1];
  id v15 = accessibilityOasisMusicLocalizedString(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 setAccessibilityLabel:v16];

LABEL_10:
  return v12;
}

@end