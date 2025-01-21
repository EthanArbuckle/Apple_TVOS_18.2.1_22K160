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
    BKSDisplayRenderOverlayDescriptor *v14 = [BKSDisplayRenderOverlayDescriptor class];
    v15 = NSStringFromClass(v14);
    v16 = [v15 autorelease];
    v17 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"descriptor", v16];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (void *)[v18 autorelease];
      v21 = [self class];
      v22 = NSStringFromClass(v21);
      v23 = v22;
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
  BKSDisplayRenderOverlayDescriptor *v10 = [BKSDisplayRenderOverlayDescriptor class];
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v24 = (objc_class *)[v9 classForCoder];
    if (!v24) {
      v24 = [v9 class];
    }
    v26 = NSStringFromClass(v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    BKSDisplayRenderOverlayDescriptor *v29 = [BKSDisplayRenderOverlayDescriptor class];
    v30 = NSStringFromClass(v29);
    v31 = [v30 autorelease];
    v32 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@." descriptor v27 v31];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(a2);
      v34 = [v33 autorelease];
      v36 = [self class];
      v37 = NSStringFromClass(v36);
      v38 = v37;
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
  [v39 setSuperclass:[BKDisplayBootUIRenderOverlay class]];
  *(float *)&double v11 = a4;
  BKDisplayRenderOverlay *v12 = [[BKDisplayRenderOverlay alloc] initWithOverlayDescriptor:v9 level:v11];
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
  BKDisplayRenderOverlay *v2 = [BKDisplayRenderOverlay descriptor];
  v3 = [v2 display];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  BSPlatform *v12 = [BSPlatform sharedInstance];
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
  double v11 = [v10];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218240;
    double v15 = v8;
    __int16 v16 = 2048;
    double v17 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "midBounds:%g,%g", (uint8_t *)&v14, 0x16u);
  }

  v12 = [self->_context layer];
  [v12 setBounds:CGRectMake(x, y, width, height)];

  double v13 = [self->_context layer];
  [v13 setPosition:CGPointMake(v8, v9)];

  [self->_backgroundLayer setBounds:CGRectMake(x, y, width, height)];
  [self->_backgroundLayer setPosition:CGPointMake(v8, v9)];
  [self->_contentLayer setPosition:CGPointMake(v8, v9)];
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  id v6 = sub_10003F0B0();
  double v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v57 = 134217984;
    v58 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%p present", (uint8_t *)&v57, 0xCu);
  }

  if (self->_context)
  {
    v36 = [NSString stringWithFormat:@"Already have a context"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      BKDisplayBootUIRenderOverlay *v38 = [v37 autorelease];
      v40 = [self class];
      v41 = NSStringFromClass(v40);
      __int16 v42 = [v41 autorelease];
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

  double v8 = [BKDisplayRenderOverlay descriptor];
  double v9 = [v8 display];
  [v9 addObserver:self forKeyPath:@"bounds" options:0 context:0];

  id v10 = [self _prepareContentLayerForPresentation:v5];
  contentLayer = self->_contentLayer;
  self->_contentLayer = v10;

  if (!self->_contentLayer)
  {
    v43 = [NSString stringWithFormat:@"Content layer not set"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int16 v44 = NSStringFromSelector(a2);
      v45 = (BKDisplayBootUIRenderOverlay *)[v44 autorelease];
      v47 = [self class];
      __int16 v48 = NSStringFromClass(v47);
      int v49 = [v48 autorelease];
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

  v12 = [NSMutableDictionary dictionary];
  [v12 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v12 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v13 = [CAContext remoteContextWithOptions:v12];
  context = self->_context;
  self->_context = v13;

  double v15 = self->_context;
  if (!v15)
  {
    NSString *v50 = [NSString stringWithFormat:@"Couldn't create remote context"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      v52 = [v51 autorelease];
      v54 = [self class];
      v55 = NSStringFromClass(v54);
      v56 = [v55 autorelease];
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

  [self level];
  [v15 setLevel:];
  [self _bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = v20 * 0.5;
  double v25 = v22 * 0.5;
  v26 = [CALayer layer];
  [v26 setBounds:CGRectMake(v17, v19, v21, v23)];
  [v26 setPosition:CGPointMake(v24, v25)];
  [self->_context setLayer:v26];
  v27 = [CALayer layer];
  [v27 setBounds:CGRectMake(v17, v19, v21, v23)];
  [v27 setPosition:CGPointMake(v24, v25)];
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
      [v27 setBackgroundColor:v31];
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
  id v6 = (os_log_s *)v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134217984;
    double v16 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%p dismiss", (uint8_t *)&v15, 0xCu);
  }

  if (v4)
  {
    double v7 = [self _animationForContentLayerCrossfading:v4];
    LODWORD(v8) = 0;
    [self->_contentLayer setOpacity:v8];
    contentLayer = self->_contentLayer;
    id v10 = [v7 keyPath];
    [contentLayer addAnimation:v7 forKey:v10];

    double v11 = [self _animationForBackgroundLayerCrossfading:v4];
    LODWORD(v12) = 0;
    [self->_backgroundLayer setOpacity:v12];
    backgroundLayer = self->_backgroundLayer;
    int v14 = (void *)[v11 keyPath];
    [backgroundLayer addAnimation:v11 forKey:v14];

    self->_outstandingAnimationsCount += 2LL;
  }

  else
  {
    [self _cleanup];
  }
}

- (void)_cleanup
{
  v3 = [BKDisplayRenderOverlay descriptor];
  id v4 = [v3 display];
  [v4 removeObserver:self forKeyPath:@"bounds"];

  [self _cleanUpContentLayer];
  [self->_backgroundLayer removeAllAnimations];
  id v5 = sub_10003F0B0();
  os_log_s *v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    int v10 = 138412546;
    double v11 = self;
    __int16 v12 = 2112;
    double v13 = context;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleaning up %@ - Destroying context: %@",  (uint8_t *)&v10,  0x16u);
  }

  [self->_context setLayer:nil];
  [self->_context invalidate];
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
      [self _cleanup];
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
  id v8 = [CABasicAnimation animationWithKeyPath:@"opacity"];
  [v5 applyToCAAnimation:v8];
  [v8 setFromValue:&off_1000C0558];
  [v8 setToValue:&off_1000C0568];
  [v8 setDelegate:self];

  return v8;
}

- (id)_animationForBackgroundLayerCrossfading:(id)a3
{
  v3 = [self _animationForContentLayerCrossfading:a3];
  [v3 setBeginTimeMode:kCAAnimationRelative];
  [v3 duration];
  [v3 setBeginTime:];
  [v3 setFillMode:kCAFillModeBoth];
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = [BKDisplayBootUIRenderOverlay class];
  NSString *v4 = [v10 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  context = self->_context;
  if (context)
  {
    NSString *v7 = [NSString stringWithFormat:@"%x (%u)", [context contextId], [self->_context contextId]];
    id v8 = [v5 appendObject:v7 withName:@"contextID"];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"bounds", a4, a5, a6))
  {
    [self _bounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    [self _setBounds:];
    id v11 = sub_10003F0B0();
    os_log_s *v12 = [v11 autorelease];
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