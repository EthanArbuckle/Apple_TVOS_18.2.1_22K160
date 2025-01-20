@interface BKDisplayBootUIRenderOverlay
- (BKDisplayBootUIRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)_useLightBackground;
- (BOOL)disablesDisplayUpdates;
- (CALayer)contentLayer;
- (CGRect)_bounds;
- (id)_animationForBackgroundLayerCrossfading:(id)a3;
- (id)_animationForContentLayerCrossfading:(id)a3;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanup;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)_setBounds:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation BKDisplayBootUIRenderOverlay

- (BKDisplayBootUIRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v7 = a3;
  if (!v7)
  {
    v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___BKSDisplayRenderOverlayDescriptor, v8);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was unexpectedly nil. Expected %@.",  @"descriptor",  v16));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v21 = (objc_class *)objc_opt_class(self, v20);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138544642;
      v41 = v19;
      __int16 v42 = 2114;
      v43 = v23;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      v47 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v48 = 1024;
      int v49 = 35;
      __int16 v50 = 2114;
      v51 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x100013D4CLL);
  }

  v9 = v7;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___BKSDisplayRenderOverlayDescriptor, v8);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v24 = (objc_class *)[v9 classForCoder];
    if (!v24) {
      v24 = (objc_class *)objc_opt_class(v9, v25);
    }
    v26 = NSStringFromClass(v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v29 = (objc_class *)objc_opt_class(&OBJC_CLASS___BKSDisplayRenderOverlayDescriptor, v28);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was of unexpected class %@. Expected %@.",  @"descriptor",  v27,  v31));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v36 = (objc_class *)objc_opt_class(self, v35);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138544642;
      v41 = v34;
      __int16 v42 = 2114;
      v43 = v38;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      v47 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v48 = 1024;
      int v49 = 35;
      __int16 v50 = 2114;
      v51 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x100013E88LL);
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___BKDisplayBootUIRenderOverlay;
  *(float *)&double v11 = a4;
  v12 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v39, "initWithOverlayDescriptor:level:", v9, v11);
  if (v12) {
    v12->_lightBackground = MGGetSInt32Answer(@"DeviceColorMapPolicy", 0LL) == 1;
  }

  return v12;
}

- (BOOL)_useLightBackground
{
  return self->_lightBackground;
}

- (CGRect)_bounds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 display]);
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](&OBJC_CLASS___BSPlatform, "sharedInstance"));
  LODWORD(v3) = [v12 deviceClass];

  if ((_DWORD)v3 == 3 && (v9 < 1920.0 || v11 < 1080.0))
  {
    double v5 = 0.0;
    double v11 = 1080.0;
    double v9 = 1920.0;
    double v7 = 0.0;
  }

  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = a3.size.width * 0.5;
  double v9 = a3.size.height * 0.5;
  id v10 = sub_10003F0B0();
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218240;
    double v15 = v8;
    __int16 v16 = 2048;
    double v17 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "midBounds:%g,%g", (uint8_t *)&v14, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  objc_msgSend(v12, "setBounds:", x, y, width, height);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  objc_msgSend(v13, "setPosition:", v8, v9);

  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:", x, y, width, height);
  -[CALayer setPosition:](self->_backgroundLayer, "setPosition:", v8, v9);
  -[CALayer setPosition:](self->_contentLayer, "setPosition:", v8, v9);
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  id v6 = sub_10003F0B0();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v57 = 134217984;
    v58 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%p present", (uint8_t *)&v57, 0xCu);
  }

  if (self->_context)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Already have a context"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      v38 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v37);
      v40 = (objc_class *)objc_opt_class(self, v39);
      v41 = NSStringFromClass(v40);
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      int v57 = 138544642;
      v58 = v38;
      __int16 v59 = 2114;
      v60 = v42;
      __int16 v61 = 2048;
      v62 = self;
      __int16 v63 = 2114;
      v64 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v65 = 1024;
      int v66 = 89;
      __int16 v67 = 2114;
      v68 = v36;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v57,  0x3Au);
    }

    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x1000144F0LL);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 display]);
  [v9 addObserver:self forKeyPath:@"bounds" options:0 context:0];

  id v10 = (CALayer *)objc_claimAutoreleasedReturnValue( -[BKDisplayBootUIRenderOverlay _prepareContentLayerForPresentation:]( self,  "_prepareContentLayerForPresentation:",  v5));
  contentLayer = self->_contentLayer;
  self->_contentLayer = v10;

  if (!self->_contentLayer)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Content layer not set"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int16 v44 = NSStringFromSelector(a2);
      v45 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v44);
      v47 = (objc_class *)objc_opt_class(self, v46);
      __int16 v48 = NSStringFromClass(v47);
      int v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      int v57 = 138544642;
      v58 = v45;
      __int16 v59 = 2114;
      v60 = v49;
      __int16 v61 = 2048;
      v62 = self;
      __int16 v63 = 2114;
      v64 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v65 = 1024;
      int v66 = 94;
      __int16 v67 = 2114;
      v68 = v43;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v57,  0x3Au);
    }

    _bs_set_crash_log_message([v43 UTF8String]);
    __break(0);
    JUMPOUT(0x1000145DCLL);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v12 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v12 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v13 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](&OBJC_CLASS___CAContext, "remoteContextWithOptions:", v12));
  context = self->_context;
  self->_context = v13;

  double v15 = self->_context;
  if (!v15)
  {
    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't create remote context"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      v52 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v51);
      v54 = (objc_class *)objc_opt_class(self, v53);
      v55 = NSStringFromClass(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      int v57 = 138544642;
      v58 = v52;
      __int16 v59 = 2114;
      v60 = v56;
      __int16 v61 = 2048;
      v62 = self;
      __int16 v63 = 2114;
      v64 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v65 = 1024;
      int v66 = 101;
      __int16 v67 = 2114;
      v68 = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v57,  0x3Au);
    }

    _bs_set_crash_log_message([v50 UTF8String]);
    __break(0);
    JUMPOUT(0x1000146C8LL);
  }

  -[BKDisplayRenderOverlay level](self, "level");
  -[CAContext setLevel:](v15, "setLevel:");
  -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = v20 * 0.5;
  double v25 = v22 * 0.5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
  objc_msgSend(v26, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v26, "setPosition:", v24, v25);
  -[CAContext setLayer:](self->_context, "setLayer:", v26);
  v27 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
  -[CALayer setBounds:](v27, "setBounds:", v17, v19, v21, v23);
  -[CALayer setPosition:](v27, "setPosition:", v24, v25);
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v29 = DeviceRGB;
    if (-[BKDisplayBootUIRenderOverlay _useLightBackground](self, "_useLightBackground")) {
      v30 = (const CGFloat *)&unk_1000DA7B0;
    }
    else {
      v30 = (const CGFloat *)&unk_1000DA7D0;
    }
    CGColorRef v31 = CGColorCreate(v29, v30);
    if (v31)
    {
      CGColorRef v32 = v31;
      -[CALayer setBackgroundColor:](v27, "setBackgroundColor:", v31);
      CFRelease(v32);
    }

    CFRelease(v29);
  }

  [v26 addSublayer:v27];
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = v27;
  v34 = v27;

  [v26 addSublayer:self->_contentLayer];
  return 1;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003F0B0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134217984;
    double v16 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%p dismiss", (uint8_t *)&v15, 0xCu);
  }

  if (v4)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( -[BKDisplayBootUIRenderOverlay _animationForContentLayerCrossfading:]( self,  "_animationForContentLayerCrossfading:",  v4));
    LODWORD(v8) = 0;
    -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v8);
    contentLayer = self->_contentLayer;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 keyPath]);
    -[CALayer addAnimation:forKey:](contentLayer, "addAnimation:forKey:", v7, v10);

    double v11 = (void *)objc_claimAutoreleasedReturnValue( -[BKDisplayBootUIRenderOverlay _animationForBackgroundLayerCrossfading:]( self,  "_animationForBackgroundLayerCrossfading:",  v4));
    LODWORD(v12) = 0;
    -[CALayer setOpacity:](self->_backgroundLayer, "setOpacity:", v12);
    backgroundLayer = self->_backgroundLayer;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 keyPath]);
    -[CALayer addAnimation:forKey:](backgroundLayer, "addAnimation:forKey:", v11, v14);

    self->_outstandingAnimationsCount += 2LL;
  }

  else
  {
    -[BKDisplayBootUIRenderOverlay _cleanup](self, "_cleanup");
  }
}

- (void)_cleanup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 display]);
  [v4 removeObserver:self forKeyPath:@"bounds"];

  -[BKDisplayBootUIRenderOverlay _cleanUpContentLayer](self, "_cleanUpContentLayer");
  -[CALayer removeAllAnimations](self->_backgroundLayer, "removeAllAnimations");
  id v5 = sub_10003F0B0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    int v10 = 138412546;
    double v11 = self;
    __int16 v12 = 2112;
    double v13 = context;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleaning up %@ - Destroying context: %@",  (uint8_t *)&v10,  0x16u);
  }

  -[CAContext setLayer:](self->_context, "setLayer:", 0LL);
  -[CAContext invalidate](self->_context, "invalidate");
  double v8 = self->_context;
  self->_context = 0LL;

  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = 0LL;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  return self->_contentLayer;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  unint64_t outstandingAnimationsCount = self->_outstandingAnimationsCount;
  if (outstandingAnimationsCount)
  {
    unint64_t v7 = outstandingAnimationsCount - 1;
    self->_unint64_t outstandingAnimationsCount = v7;
    if (!v7)
    {
      id v8 = v5;
      -[BKDisplayBootUIRenderOverlay _cleanup](self, "_cleanup");
      id v5 = v8;
    }
  }
}

- (id)_animationForContentLayerCrossfading:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  [v4 duration];
  double v7 = v6;

  [v5 setDuration:v7 * 0.5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
  [v5 applyToCAAnimation:v8];
  [v8 setFromValue:&off_1000C0558];
  [v8 setToValue:&off_1000C0568];
  [v8 setDelegate:self];

  return v8;
}

- (id)_animationForBackgroundLayerCrossfading:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKDisplayBootUIRenderOverlay _animationForContentLayerCrossfading:]( self,  "_animationForContentLayerCrossfading:",  a3));
  [v3 setBeginTimeMode:kCAAnimationRelative];
  [v3 duration];
  objc_msgSend(v3, "setBeginTime:");
  [v3 setFillMode:kCAFillModeBoth];
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BKDisplayBootUIRenderOverlay;
  id v4 = -[BKDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:]( &v10,  "descriptionBuilderWithMultilinePrefix:",  a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  context = self->_context;
  if (context)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x (%u)",  -[CAContext contextId](context, "contextId"),  -[CAContext contextId](self->_context, "contextId")));
    id v8 = [v5 appendObject:v7 withName:@"contextID"];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"bounds", a4, a5, a6))
  {
    -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    -[BKDisplayBootUIRenderOverlay _setBounds:](self, "_setBounds:");
    id v11 = sub_10003F0B0();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218496;
      int v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "-----------> %p: bounds of display changed: size.width: %f size.height: %f, updating overlay position",  (uint8_t *)&v13,  0x20u);
    }
  }

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void).cxx_destruct
{
}

@end