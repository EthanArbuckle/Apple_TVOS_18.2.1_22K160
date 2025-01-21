@interface BKDisplayRenderOverlayPinkForTesting
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
+ (void)doItHide;
+ (void)doItShow;
+ (void)doItShowKernel;
- (BKDisplayRenderOverlayPinkForTesting)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)disablesDisplayUpdates;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)dealloc;
@end

@implementation BKDisplayRenderOverlayPinkForTesting

- (BKDisplayRenderOverlayPinkForTesting)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = [BKDisplayRenderOverlayPinkForTesting class];
  BKDisplayRenderOverlay *v4 = [[BKDisplayRenderOverlay alloc] initWithOverlayDescriptor:a3 level:v7];
  v5 = v4;
  if (v4) {
    [v4 _setType:4LL];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = [BKDisplayRenderOverlayPinkForTesting class];
  [v3 dealloc];
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  if (self->_context)
  {
    v28 = [NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"BKDisplayRenderOverlayPinkForTesting.m" lineNumber:57 description:@"Already have a _context"];
  }

  v6 = [NSMutableDictionary dictionary];
  [v6 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v6 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v30 = 1.0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100019A3C;
  v31[3] = &unk_1000B5E90;
  v31[4] = 0LL;
  v31[5] = 0LL;
  v31[6] = &v30;
  memset(&v31[7], 0, 24);
  sub_1000196F4(v31);
  CAContext *v7 = [CAContext remoteContextWithOptions:v6];
  context = self->_context;
  self->_context = v7;

  v9 = self->_context;
  if (!v9)
  {
    v29 = [NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"BKDisplayRenderOverlayPinkForTesting.m" lineNumber:67 description:@"Couldn't create remote context"];

    v9 = self->_context;
  }

  [self level];
  [v9 setLevel:];
  v10 = [CALayer layer];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v12 = DeviceRGB;
    CGColorRef v13 = CGColorCreate(DeviceRGB, dbl_1000DB1C8);
    if (v13)
    {
      CGColorRef v14 = v13;
      [v10 setBackgroundColor:v13];
      CFRelease(v14);
    }

    CFRelease(v12);
  }

  v15 = [BKDisplayRenderOverlay descriptor];
  v16 = [v15 display];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  [v10 setBounds:CGRectMake(v18, v20, v22, v24)];
  [v10 setContentsScale:v30];
  [v10 setHidden:NO];
  [v10 setPosition:CGPointMake(v22 * 0.5, v24 * 0.5)];
  layer = self->_layer;
  self->_layer = v10;
  v26 = v10;

  [self->_context setLayer:self->_layer];
  return 1;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  context = self->_context;
  self->_context = 0LL;

  layer = self->_layer;
  self->_layer = 0LL;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = [BKDisplayRenderOverlayPinkForTesting class];
  id v4 = [BKDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  context = self->_context;
  if (context)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x (%u)",  -[CAContext contextId](context, "contextId"),  -[CAContext contextId](self->_context, "contextId")));
    id v8 = [v5 appendObject:v7 withName:@"contextID"];
  }

  return v5;
}

- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary
{
  BKDisplayRenderOverlayDescriptor *v3 = [self descriptor];
  id v4 = [v3 progressIndicatorProperties];

  if (v4)
  {
    if ([v4 style] == (id)2) {
      int v5 = 22;
    }
    else {
      int v5 = 14;
    }
    v37[0] = v5;
    double v35 = 0.0;
    double v36 = 0.0;
    double v34 = 1.0;
    v6 = [BKDisplayRenderOverlay display];
    objc_super v7 = [v6 uniqueId];
    sub_100019B10(v7, &v36, &v35, &v34, 0LL, 0LL);

    double v8 = v36 / v34;
    double v9 = v35 / v34;
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

    v37[1] = v16;
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

    v37[2] = v20;
    id v23 = sub_10003F368();
    os_log_s *v24 = v23;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v33 = [v4 style];
      *(_DWORD *)buf = 67109632;
      unsigned int v39 = v33;
      __int16 v40 = 1024;
      unsigned int v41 = v16;
      __int16 v42 = 1024;
      unsigned int v43 = v20;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Setting progress indicator (style = %d) for overlay at position (%u, %u).",  buf,  0x14u);
    }

    int v25 = sysctlbyname("kern.progressoptions", 0LL, 0LL, v37, 0x2CuLL);
    BOOL v17 = v25 >= 0;
    id v26 = sub_10003F368();
    v27 = os_log_create(v26, "");
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v25 < 0)
    {
      if (v28)
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v39 = v25;
        v29 = "Unable to apply kernel progress indicator - error %d.";
        double v30 = v27;
        uint32_t v31 = 8;
        goto LABEL_27;
      }
    }

    else if (v28)
    {
      *(_WORD *)buf = 0;
      v29 = "Successfully applied kernel progress indicator.";
      double v30 = v27;
      uint32_t v31 = 2;
LABEL_27:
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v29, buf, v31);
    }

    goto LABEL_25;
  }

  BOOL v17 = 0;
LABEL_25:

  return v17;
}

- (void).cxx_destruct
{
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6 = a4;
  BKSDisplayRenderOverlayDescriptor *v7 = [[BKSDisplayRenderOverlayDescriptor alloc] init];
  double v9 = [a1 class];
  id v10 = NSStringFromClass(v9);
  double v11 = [v10 doubleValue];
  BKSDisplayRenderOverlayDescriptor *v12 = [BKSDisplayRenderOverlayDescriptor initWithName:v11 display:v6];

  [v12 setLockBacklight:NO];
  BKDisplayRenderOverlayPinkForTesting *v13 = [[BKDisplayRenderOverlayPinkForTesting alloc] init];
  *(float *)&double v14 = a3;
  uint64_t v15 = [BKDisplayRenderOverlayPinkForTesting initWithOverlayDescriptor:v12 level:v14];

  return v15;
}

+ (void)doItShowKernel
{
  BKSDisplayRenderOverlayDescriptor *v2 = [[BKSDisplayRenderOverlayDescriptor alloc] init];
  CADisplay *v3 = [CADisplay mainDisplay];
  double v9 = [BKSDisplayRenderOverlayDescriptor initWithName:@"Testing" display:v3];

  BKSDisplayProgressIndicatorProperties *v4 = [BKSDisplayProgressIndicatorProperties progressIndicatorWithStyle:2LL position:CGPointMake(100.0, 175.0)];
  [v9 setProgressIndicatorProperties:v4];
  BKDisplayRenderOverlayPinkForTesting *v5 = [[BKDisplayRenderOverlayPinkForTesting alloc] init];
  LODWORD(v6) = *(_DWORD *)"";
  BKDisplayRenderOverlayPinkForTesting *v7 = [[BKDisplayRenderOverlayPinkForTesting alloc] initWithOverlayDescriptor:v9 level:v6];
  uint64_t v8 = (void *)qword_1000DC178;
  qword_1000DC178 = (uint64_t)v7;

  [(id)qword_1000DC178 presentWithAnimationSettings:0];
}

+ (void)doItShow
{
  BKSDisplayRenderOverlayDescriptor *v2 = [[BKSDisplayRenderOverlayDescriptor alloc] init];
  CADisplay *v3 = [CADisplay mainDisplay];
  uint64_t v8 = [BKSDisplayRenderOverlayDescriptor initWithName:@"Testing" display:v3];

  BKDisplayRenderOverlayPinkForTesting *v4 = [[BKDisplayRenderOverlayPinkForTesting alloc] init];
  LODWORD(v5) = 1161527296;
  BKDisplayRenderOverlayPinkForTesting *v6 = [[BKDisplayRenderOverlayPinkForTesting alloc] initWithOverlayDescriptor:v8 level:v5];
  objc_super v7 = (void *)qword_1000DC178;
  qword_1000DC178 = (uint64_t)v6;

  [(id)qword_1000DC178 presentWithAnimationSettings:0];
}

+ (void)doItHide
{
  if (qword_1000DC178)
  {
    [(id)qword_1000DC178 dismissWithAnimationSettings:0];
    v2 = (void *)qword_1000DC178;
    qword_1000DC178 = 0LL;
  }

@end