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
  v7.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlaySpinny;
  v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4)
  {
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 2LL);
    v5->_background = 0LL;
  }

  return v5;
}

- (void)_startAnimating
{
  v3 = objc_alloc_init(&OBJC_CLASS___CAKeyframeAnimation);
  -[CAKeyframeAnimation setKeyPath:](v3, "setKeyPath:", @"contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allImages]);
  -[CAKeyframeAnimation setValues:](v3, "setValues:", v5);

  -[CAKeyframeAnimation setCalculationMode:](v3, "setCalculationMode:", kCAAnimationDiscrete);
  -[CAKeyframeAnimation setRepeatCount:](v3, "setRepeatCount:", 3.53369517e72);
  -[CAKeyframeAnimation setDuration:](v3, "setDuration:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay contentLayer](self, "contentLayer"));
  [v6 addAnimation:v3 forKey:@"contents"];

  animation = self->_animation;
  self->_animation = v3;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueId]);

  sub_10001A604(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
  objc_super v7 = (CGImage *)[v6 imageAtIndex:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
  -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
  double v10 = v9 * 0.5;
  double v12 = v11 * 0.5;
  double Width = (double)CGImageGetWidth(v7);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v7));
  objc_msgSend(v8, "setPosition:", v10, v12);
  [v8 setContents:v7];

  return v8;
}

- (void)_cleanUpContentLayer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay contentLayer](self, "contentLayer"));
  [v3 removeAllAnimations];

  -[BKDisplayRenderOverlaySpinny _unloadSpinnyImageSequence](self, "_unloadSpinnyImageSequence");
}

- (void)_setScale:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlaySpinny;
  -[BKDisplayRenderOverlay _setScale:](&v7, "_setScale:", a3);
  -[BKDisplayRenderOverlaySpinny _unloadSpinnyImageSequence](self, "_unloadSpinnyImageSequence");
  animation = self->_animation;
  if (animation)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allImages]);
    -[CAKeyframeAnimation setValues:](animation, "setValues:", v6);
  }

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlaySpinny;
  id v4 = -[BKDisplayBootUIRenderOverlay descriptionBuilderWithMultilinePrefix:]( &v8,  "descriptionBuilderWithMultilinePrefix:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 appendUnsignedInteger:self->_background withName:@"_background"];
  return v5;
}

- (id)_spinnyImageSequence
{
  imageSequence = self->_imageSequence;
  if (!imageSequence)
  {
    id v4 = sub_10003F0B0();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      v15 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%p load spinny", (uint8_t *)&v14, 0xCu);
    }

    objc_super v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___BKSDisplayRenderOverlay, v6));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _assetPrefix](self, "_assetPrefix"));
    double v10 = objc_alloc(&OBJC_CLASS___BKImageSequence);
    -[BKDisplayRenderOverlay _scale](self, "_scale");
    double v11 = -[BKImageSequence initWithBasename:bundle:imageCount:scale:]( v10,  "initWithBasename:bundle:imageCount:scale:",  v9,  v8,  24LL);
    double v12 = self->_imageSequence;
    self->_imageSequence = v11;

    imageSequence = self->_imageSequence;
  }

  return imageSequence;
}

- (void)_unloadSpinnyImageSequence
{
  id v3 = sub_10003F0B0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
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
    v5.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlaySpinny;
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
  objc_super v7 = objc_alloc(&OBJC_CLASS___BKSDisplayRenderOverlayDescriptor);
  double v9 = (objc_class *)objc_opt_class(a1, v8);
  double v10 = NSStringFromClass(v9);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  double v12 = -[BKSDisplayRenderOverlayDescriptor initWithName:display:](v7, "initWithName:display:", v11, v6);

  -[BKSDisplayRenderOverlayDescriptor setLockBacklight:](v12, "setLockBacklight:", 0LL);
  v13 = objc_alloc(&OBJC_CLASS___BKDisplayRenderOverlaySpinny);
  *(float *)&double v14 = a3;
  v15 = -[BKDisplayRenderOverlaySpinny initWithOverlayDescriptor:level:]( v13,  "initWithOverlayDescriptor:level:",  v12,  v14);

  return v15;
}

@end