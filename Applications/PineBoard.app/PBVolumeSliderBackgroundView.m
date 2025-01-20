@interface PBVolumeSliderBackgroundView
+ (Class)layerClass;
- (CABackdropLayer)backdropLayer;
@end

@implementation PBVolumeSliderBackgroundView

+ (Class)layerClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___CABackdropLayer);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (CABackdropLayer)backdropLayer
{
  return (CABackdropLayer *)(id)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView layer](self, "layer"));
}

@end