@interface BKDisplayRenderOverlaySpinny
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
- (BKDisplayRenderOverlaySpinny)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_useLightBackground;
- (id)_assetPrefix;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)_spinnyImageSequence;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)background;
- (void)_cleanUpContentLayer;
- (void)_setScale:(double)a3;
- (void)_startAnimating;
- (void)_unloadSpinnyImageSequence;
- (void)setBackground:(unint64_t)a3;
@end

@implementation BKDisplayRenderOverlaySpinny

- (BKDisplayRenderOverlaySpinny)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = [BKDisplayRenderOverlaySpinny class];
  BKDisplayBootUIRenderOverlay *v4 = [[BKDisplayBootUIRenderOverlay alloc] initWithOverlayDescriptor:a3 level:0];
  v5 = v4;
  if (v4)
  {
    [v4 _setType:2LL];
    v5->_background = 0LL;
  }

  return v5;
}

- (void)_startAnimating
{
  CAKeyframeAnimation *v3 = [[CAKeyframeAnimation alloc] init];
  [v3 setKeyPath:@"contents"];
  v4 = [self _spinnyImageSequence];
  v5 = (void *)[v4 allImages];
  [v3 setValues:v5];

  [v3 setCalculationMode:kCAAnimationDiscrete];
  [v3 setRepeatCount:3.53369517e72];
  [v3 setDuration:1.0];
  v6 = [BKDisplayBootUIRenderOverlay contentLayer];
  [v6 addAnimation:v3 forKey:@"contents"];

  animation = self->_animation;
  self->_animation = v3;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  v4 = [BKDisplayRenderOverlay display];
  v5 = [v4 uniqueId];

  sub_10001A604(v5);
  v6 = [BKDisplayRenderOverlaySpinny _spinnyImageSequence];
  objc_super v7 = (CGImage *)[v6 imageAtIndex:0];

  v8 = [CALayer layer];
  [BKDisplayBootUIRenderOverlay bounds];
  double v10 = v9 * 0.5;
  double v12 = v11 * 0.5;
  double Width = (double)CGImageGetWidth(v7);
  [v8 setBounds:CGRectMake(0.0, 0.0, Width, (double)CGImageGetHeight(v7))];
  [v8 setPosition:CGPointMake(v10, v12)];
  [v8 setContents:v7];

  return v8;
}

- (void)_cleanUpContentLayer
{
  BKDisplayBootUIRenderOverlay *v3 = [BKDisplayBootUIRenderOverlay contentLayer];
  [v3 removeAllAnimations];

  [self _unloadSpinnyImageSequence];
}

- (void)_setScale:(double)a3
{
  v7.receiver = self;
  v7.super_class = [BKDisplayRenderOverlaySpinny class];
  [v7 _setScale:a3];
  [self _unloadSpinnyImageSequence];
  animation = self->_animation;
  if (animation)
  {
    v5 = [BKDisplayRenderOverlaySpinny _spinnyImageSequence];
    v6 = [v5 allImages];
    [animation setValues:v6];
  }

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = [BKDisplayRenderOverlaySpinny class];
  id v4 = [BKDisplayBootUIRenderOverlay descriptionBuilderWithMultilinePrefix:a3];
  v5 = [v4 autorelease];
  id v6 = [v5 appendUnsignedInteger:self->_background withName:@"_background"];
  return v5;
}

- (id)_spinnyImageSequence
{
  imageSequence = self->_imageSequence;
  if (!imageSequence)
  {
    id v4 = sub_10003F0B0();
    v5 = (os_log_s *)v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      v15 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%p load spinny", (uint8_t *)&v14, 0xCu);
    }

    NSBundle *v7 = [NSBundle bundleForClass:[BKSDisplayRenderOverlay class]];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    double v9 = [BKDisplayRenderOverlaySpinny _assetPrefix];
    BKImageSequence *v10 = [[BKImageSequence alloc] init];
    [self _scale];
    BKImageSequence *v11 = [[BKImageSequence alloc] initWithBasename:v9 bundle:v8 imageCount:24 scale:1.0];
    double v12 = self->_imageSequence;
    self->_imageSequence = v11;

    imageSequence = self->_imageSequence;
  }

  return imageSequence;
}

- (void)_unloadSpinnyImageSequence
{
  id v3 = sub_10003F0B0();
  os_log_s *v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    objc_super v7 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%p unload spinny", (uint8_t *)&v6, 0xCu);
  }

  imageSequence = self->_imageSequence;
  self->_imageSequence = 0LL;
}

- (BOOL)_useLightBackground
{
  unint64_t background = self->_background;
  if (!background)
  {
    v5.receiver = self;
    [v5 super_class] = [BKDisplayRenderOverlaySpinny class];
    if (-[BKDisplayBootUIRenderOverlay _useLightBackground](&v5, "_useLightBackground")) {
      return 1;
    }
    unint64_t background = self->_background;
  }

  return background == 2;
}

- (id)_assetPrefix
{
  return @"gear";
}

- (unint64_t)background
{
  return self->_background;
}

- (void)setBackground:(unint64_t)a3
{
  self->_unint64_t background = a3;
}

- (void).cxx_destruct
{
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6 = a4;
  BKSDisplayRenderOverlayDescriptor *v7 = [[BKSDisplayRenderOverlayDescriptor alloc] init];
  double v9 = [a1 class];
  double v10 = NSStringFromClass(v9);
  double v11 = [v10 doubleValue];
  double v12 = [BKSDisplayRenderOverlayDescriptor initWithName:v11 display:v6];

  [v12 setLockBacklight:NO];
  BKDisplayRenderOverlaySpinny *v13 = [[BKDisplayRenderOverlaySpinny alloc] init];
  *(float *)&double v14 = a3;
  BKDisplayRenderOverlaySpinny *v15 = [[BKDisplayRenderOverlaySpinny alloc] initWithOverlayDescriptor:v12 level:v14];

  return v15;
}

@end