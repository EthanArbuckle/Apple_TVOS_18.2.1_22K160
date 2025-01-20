@interface BKDisplayRenderOverlayImage
- (BKDisplayRenderOverlayImage)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)disablesDisplayUpdates;
- (BOOL)isFrozen;
- (CGImage)image;
- (id)_animationForKeyPath:(id)a3 withSettings:(id)a4;
- (id)_initWithPersistenceData:(id)a3;
- (id)_persistenceData;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanup;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)_freeze;
- (void)dealloc;
- (void)setFrozen:(BOOL)a3;
@end

@implementation BKDisplayRenderOverlayImage

- (BKDisplayRenderOverlayImage)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayImage;
  v4 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4) {
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 1LL);
  }
  return v5;
}

- (id)_initWithPersistenceData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayImage;
    v5 = -[BKDisplayRenderOverlay _initWithPersistenceData:](&v9, "_initWithPersistenceData:", v4);
    if (v5)
    {
      v6 = (CGImage *)[v4 image];
      if (v6)
      {
        v5[7] = CGImageRetain(v6);
        *((_BYTE *)v5 + 64) = [v4 isFrozen];
      }
    }

    self = v5;
    objc_super v7 = self;
  }

  else
  {
    objc_super v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_context)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_context == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      objc_super v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDisplayRenderOverlayImage.m";
      __int16 v20 = 1024;
      int v21 = 59;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x10001B5C0LL);
  }

  CGImageRelease(self->_imageRef);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayImage;
  -[BKDisplayRenderOverlay dealloc](&v11, "dealloc");
}

- (CGImage)image
{
  return self->_imageRef;
}

- (BOOL)disablesDisplayUpdates
{
  if (self->_frozen) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay progressIndicatorProperties](self, "progressIndicatorProperties"));
  BOOL v2 = v3 != 0LL;

  return v2;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  if (self->_context)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Already have a context"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v68 = NSStringFromSelector(a2);
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      v71 = (objc_class *)objc_opt_class(self, v70);
      v72 = NSStringFromClass(v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
      LODWORD(v97.a) = 138544642;
      *(void *)((char *)&v97.a + 4) = v69;
      WORD2(v97.b) = 2114;
      *(void *)((char *)&v97.b + 6) = v73;
      HIWORD(v97.c) = 2048;
      *(void *)&v97.d = self;
      LOWORD(v97.tx) = 2114;
      *(void *)((char *)&v97.tx + 2) = @"BKDisplayRenderOverlayImage.m";
      WORD1(v97.ty) = 1024;
      HIDWORD(v97.ty) = 78;
      __int16 v98 = 2114;
      v99 = v67;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v97,  0x3Au);
    }

    _bs_set_crash_log_message([v67 UTF8String]);
    __break(0);
    JUMPOUT(0x10001BF7CLL);
  }

  v6 = v5;
  uint64_t v89 = 0x3FF0000000000000LL;
  char v88 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayUUID]);

  sub_100019B10(v8, &v91, &v90, (double *)&v89, &v88, 0LL);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 display]);

  if (!v10)
  {
    uint64_t v27 = BKLogDisplay(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v97.a) = 138543362;
      *(void *)((char *)&v97.a + 4) = v8;
      v64 = "[BKDisplayRenderOverlay] No CADisplay found for UUID: %{public}@";
      v65 = v13;
      uint32_t v66 = 12;
      goto LABEL_34;
    }

- (void)_freeze
{
  if (!self->_frozen)
  {
    self->_frozen = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay _persistenceCoordinator](self, "_persistenceCoordinator"));
    [v3 saveOverlay:self];

    -[BKDisplayRenderOverlayImage _applyProgressIndicatorPropertiesToKernelIfNecessary]( self,  "_applyProgressIndicatorPropertiesToKernelIfNecessary");
  }

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[BKDisplayRenderOverlayImage _animationForKeyPath:withSettings:]( self,  "_animationForKeyPath:withSettings:",  @"opacity",  v4));
    [v5 setFromValue:&off_1000C0588];
    [v5 setToValue:&off_1000C0578];
    [v5 setDelegate:self];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
    LODWORD(v7) = 0;
    [v6 setOpacity:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
    [v8 addAnimation:v5 forKey:@"opacity"];
  }

  else
  {
    -[BKDisplayRenderOverlayImage _cleanup](self, "_cleanup");
  }

  imageRef = self->_imageRef;
  if (imageRef)
  {
    CGImageRelease(imageRef);
    self->_imageRef = 0LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay _persistenceCoordinator](self, "_persistenceCoordinator"));
  [v10 destroyOverlay:self];
}

- (id)_persistenceData
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayImage;
  id v3 = -[BKDisplayRenderOverlay _persistenceData](&v6, "_persistenceData");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 setImage:self->_imageRef];
  [v4 setFrozen:self->_frozen];
  return v4;
}

- (void)_cleanup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  [v3 removeAllAnimations];

  -[CAContext setLayer:](self->_context, "setLayer:", 0LL);
  -[CAContext invalidate](self->_context, "invalidate");
  context = self->_context;
  self->_context = 0LL;

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayImage;
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

- (id)_animationForKeyPath:(id)a3 withSettings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = [v5 isSpringAnimation];
  objc_super v9 = &OBJC_CLASS___CASpringAnimation_ptr;
  if (!v7) {
    objc_super v9 = &OBJC_CLASS___CABasicAnimation_ptr;
  }
  id v10 = objc_msgSend((id)objc_opt_class(*v9, v8), "animationWithKeyPath:", v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  [v5 applyToCAAnimation:v11];
  return v11;
}

- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 progressIndicatorProperties]);

  if (v4)
  {
    if ([v4 style] == (id)2) {
      int v5 = 22;
    }
    else {
      int v5 = 14;
    }
    v34[0] = v5;
    double v32 = 0.0;
    double v33 = 0.0;
    double v31 = 1.0;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueId]);
    sub_100019B10(v7, &v33, &v32, &v31, 0LL, 0LL);

    double v8 = v33 / v31;
    double v9 = v32 / v31;
    id v10 = [v4 position];
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = BSFloatEqualToFloat(v10);
    if ((v15 & 1) != 0)
    {
      unsigned int v16 = -1;
    }

    else
    {
      double v18 = fmax(v12 / v8, 0.0);
      if (v18 >= 1.0) {
        double v19 = 4294967300.0;
      }
      else {
        double v19 = v18 * 4294967300.0;
      }
      unsigned int v16 = fmin(fmax(v19, 0.0), 4294967300.0);
    }

    v34[1] = v16;
    if ((BSFloatEqualToFloat(v15) & 1) != 0)
    {
      unsigned int v20 = -1;
    }

    else
    {
      double v21 = fmax(v14 / v9, 0.0);
      if (v21 >= 1.0) {
        double v22 = 4294967300.0;
      }
      else {
        double v22 = v21 * 4294967300.0;
      }
      unsigned int v20 = fmin(fmax(v22, 0.0), 4294967300.0);
    }

    v34[2] = v20;
    id v23 = sub_10003F368();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unsigned int v25 = [v4 style];
      *(_DWORD *)buf = 67109632;
      unsigned int v36 = v25;
      __int16 v37 = 1024;
      unsigned int v38 = v16;
      __int16 v39 = 1024;
      unsigned int v40 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Setting progress indicator (style = %d) for overlay at position (%u, %u).",  buf,  0x14u);
    }

    int v26 = sysctlbyname("kern.progressoptions", 0LL, 0LL, v34, 0x2CuLL);
    BOOL v17 = v26 >= 0;
    id v27 = sub_10003F368();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = v28;
    if (v26 < 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v36 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unable to apply kernel progress indicator - error %d.",  buf,  8u);
      }
    }

    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Successfully applied kernel progress indicator.",  buf,  2u);
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
}

@end