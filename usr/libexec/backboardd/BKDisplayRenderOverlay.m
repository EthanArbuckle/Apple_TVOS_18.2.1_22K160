@interface BKDisplayRenderOverlay
- (BKDisplayRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BKDisplayRenderOverlayPersistenceCoordinator)_persistenceCoordinator;
- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties;
- (BKSDisplayRenderOverlayDescriptor)descriptor;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)animates;
- (BOOL)disablesDisplayUpdates;
- (BOOL)isFrozen;
- (BOOL)isInterstitial;
- (BOOL)lockBacklight;
- (BOOL)presentWithAnimationSettings:(id)a3;
- (CADisplay)display;
- (NSString)description;
- (NSString)name;
- (double)_scale;
- (float)level;
- (id)_initWithPersistenceData:(id)a3;
- (id)_persistenceData;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (int64_t)type;
- (void)_setPersistenceCoordinator:(id)a3;
- (void)_setScale:(double)a3;
- (void)_setType:(int64_t)a3;
- (void)_wrapInCATransaction:(id)a3;
- (void)dealloc;
- (void)dismissWithAnimationSettings:(id)a3;
- (void)freeze;
- (void)setAnimates:(BOOL)a3;
@end

@implementation BKDisplayRenderOverlay

- (BKDisplayRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v8 = a3;
  if (!v8)
  {
    BKSDisplayRenderOverlayDescriptor *v19 = [BKSDisplayRenderOverlayDescriptor class];
    v20 = NSStringFromClass(v19);
    v21 = [v20 autorelease];
    v22 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"descriptor", v21];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v26 = [self class];
      v27 = NSStringFromClass(v26);
      v28 = [v27 autorelease];
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      v46 = self;
      LOWORD(v47) = 2114;
      *(void *)((char *)&v47 + 2) = @"BKDisplayRenderOverlay.m";
      WORD5(v47) = 1024;
      HIDWORD(v47) = 35;
      LOWORD(p_scale) = 2114;
      *(void *)((char *)&p_scale + 2) = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100022E68LL);
  }

  v10 = v8;
  BKSDisplayRenderOverlayDescriptor *v11 = [BKSDisplayRenderOverlayDescriptor class];
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v29 = (objc_class *)[v10 classForCoder];
    if (!v29) {
      v29 = [v10 class];
    }
    v31 = NSStringFromClass(v29);
    v32 = v31;
    BKSDisplayRenderOverlayDescriptor *v34 = [BKSDisplayRenderOverlayDescriptor class];
    v35 = NSStringFromClass(v34);
    v36 = [v35 autorelease];
    v37 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"descriptor", v32, v36];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v38 = NSStringFromSelector(a2);
      v39 = [v38 autorelease];
      v41 = [self class];
      v42 = NSStringFromClass(v41);
      v43 = [v42 autorelease];
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2048;
      v46 = self;
      LOWORD(v47) = 2114;
      *(void *)((char *)&v47 + 2) = @"BKDisplayRenderOverlay.m";
      WORD5(v47) = 1024;
      HIDWORD(v47) = 35;
      LOWORD(p_scale) = 2114;
      *(void *)((char *)&p_scale + 2) = v37;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x100022FA4LL);
  }

  v44.receiver = self;
  v44.super_class = [BKDisplayRenderOverlay class];
  BKDisplayRenderOverlay *v12 = [[BKDisplayRenderOverlay alloc] init];
  v13 = v12;
  if (v12)
  {
    v12->_descriptor = a3;
    v13->_level = a4;
    uint64_t v14 = [BKDisplayRenderOverlayPersistenceCoordinator sharedInstance];
    persistenceCoordinator = v13->_persistenceCoordinator;
    v13->_persistenceCoordinator = (BKDisplayRenderOverlayPersistenceCoordinator *)v14;

    v13->_type = 0LL;
    v13->_visible = 0;
    v16 = [v10 display];
    if ([v16 isExternal])
    {
      v17 = [v16 currentMode];
      v13->_scale = (double)(unint64_t)[v17 preferredScale];
    }

    else
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100019A3C;
      v46 = (BKDisplayRenderOverlay *)&unk_1000B5E90;
      __int128 v47 = 0uLL;
      __int128 p_scale = (unint64_t)&v13->_scale;
      uint64_t v49 = 0LL;
      uint64_t v50 = 0LL;
      sub_1000196F4(buf);
    }
  }

  return v13;
}

- (id)_initWithPersistenceData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 descriptor];
    [v4 level];
    int v7 = v6;

    LODWORD(v8) = v7;
    uint64_t v9 = [BKDisplayRenderOverlay initWithOverlayDescriptor:v5 level:v8];

    self = v9;
    v10 = self;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  if (self->_visible)
  {
    id v4 = [NSString stringWithFormat:@"Must dismiss before releasing"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      double v8 = [self class];
      uint64_t v9 = NSStringFromClass(v8);
      v10 = [v9 autorelease];
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDisplayRenderOverlay.m";
      __int16 v20 = 1024;
      int v21 = 66;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x100023198LL);
  }

  v11.receiver = self;
  v11.super_class = [BKDisplayRenderOverlay class];
  [v11 dealloc];
}

- (NSString)name
{
  return [self->_descriptor name];
}

- (CADisplay)display
{
  return [self->_descriptor display];
}

- (int64_t)interfaceOrientation
{
  return [self->_descriptor interfaceOrientation];
}

- (BOOL)lockBacklight
{
  return [self->_descriptor lockBacklight];
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return [self->_descriptor progressIndicatorProperties];
}

- (BOOL)isInterstitial
{
  return [self->_descriptor isInterstitial];
}

- (void)setAnimates:(BOOL)a3
{
  if (self->_animates != a3)
  {
    self->_animates = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100023AC8;
    v3[3] = &unk_1000B8058;
    v3[4] = self;
    [self _wrapInCATransaction:v3];
  }

- (BOOL)presentWithAnimationSettings:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  if (self->_visible) {
    goto LABEL_5;
  }
  id v5 = sub_10003F368();
  int v6 = (os_log_s *)v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)[self succinctDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v7;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Presenting overlay: %{public}@ with animation settings: %{public}@",  buf,  0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100023A78;
  v10[3] = &unk_1000B80D0;
  v12 = &v13;
  v10[4] = self;
  id v11 = v4;
  [self _wrapInCATransaction:v10];
  self->_visible = 1;

  if (*((_BYTE *)v14 + 24))
  {
LABEL_5:
    [CATransaction flush];
    BOOL v8 = *((_BYTE *)v14 + 24) != 0;
  }

  else
  {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)freeze
{
  if (!self->_visible)
  {
    NSString *v7 = [NSString stringWithFormat:@"Can't freeze a hidden overlay"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = NSStringFromSelector(a2);
      uint64_t v9 = [v8 autorelease];
      [self class]
      v12 = NSStringFromClass(v11);
      uint64_t v13 = v12;
      *(_DWORD *)buf = 138544642;
      char v16 = v9;
      __int16 v17 = 2114;
      __int16 v18 = v13;
      __int16 v19 = 2048;
      id v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = @"BKDisplayRenderOverlay.m";
      __int16 v23 = 1024;
      int v24 = 144;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x1000235E0LL);
  }

  if (!self->_frozen)
  {
    self->_frozen = 1;
    id v3 = sub_10003F368();
    id v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [BKDisplayRenderOverlay succinctDescription];
      *(_DWORD *)buf = 138543362;
      char v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Freezing overlay: %{public}@", buf, 0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100023A70;
    v14[3] = &unk_1000B8058;
    v14[4] = self;
    [self _wrapInCATransaction:v14];
  }

- (void)dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  if (self->_visible)
  {
    id v5 = sub_10003F368();
    int v6 = (os_log_s *)v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [self succinctDescription];
      *(_DWORD *)buf = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismissing render overlay %{public}@ with animation settings: %{public}@",  buf,  0x16u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100023A3C;
    v8[3] = &unk_1000B8030;
    v8[4] = self;
    id v9 = v4;
    [self _wrapInCATransaction:v8];
    self->_visible = 0;
  }
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  return 1;
}

- (id)_persistenceData
{
  BKDisplayRenderOverlayPersistenceData *v3 = [[BKDisplayRenderOverlayPersistenceData alloc] init];
  [v3 setOverlayType:[self type]];
  [v3 setDescriptor:self->_descriptor];
  self->_level = v4;
  [v3 setLevel:v4];
  return v3;
}

- (void)_wrapInCATransaction:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(void))a3;
    [CATransaction begin];
    v3[2];

    [CATransaction commit];
  }

- (NSString)description
{
  return [self descriptionWithMultilinePrefix:0LL];
}

- (id)succinctDescription
{
  v2 = [self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendFloat:@"level" withName:0 decimalPrecision:self->_level];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [BKDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000239E4;
  v8[3] = &unk_1000B8030;
  id v5 = [self succinctDescriptionBuilder];
  id v9 = v5;
  uint64_t v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (float)level
{
  return self->_level;
}

- (int64_t)type
{
  return self->_type;
}

- (void)_setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)disablesDisplayUpdates
{
  return self->_disablesDisplayUpdates;
}

- (BOOL)animates
{
  return self->_animates;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BKDisplayRenderOverlayPersistenceCoordinator)_persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (void)_setPersistenceCoordinator:(id)a3
{
}

- (double)_scale
{
  return self->_scale;
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
}

@end