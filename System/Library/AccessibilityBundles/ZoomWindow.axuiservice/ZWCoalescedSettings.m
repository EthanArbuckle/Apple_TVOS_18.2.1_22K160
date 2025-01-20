@interface ZWCoalescedSettings
+ (id)sharedInstance;
- (AXDispatchTimer)dockSizeUpdateTimer;
- (AXDispatchTimer)zoomFactorUpdateTimer;
- (AXDispatchTimer)zoomLensFrameUpdateTimer;
- (AXDispatchTimer)zoomPanOffsetUpdateTimer;
- (AXDispatchTimer)zoomSlugPositionUpdateTimer;
- (BOOL)zoomInStandby;
- (CGPoint)zoomPanOffset;
- (CGPoint)zoomSlugNormalizedPosition;
- (CGRect)zoomWindowFrame;
- (double)dockSize;
- (double)zoomFactor;
- (void)setDockSize:(double)a3;
- (void)setDockSizeUpdateTimer:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomFactorUpdateTimer:(id)a3;
- (void)setZoomInStandby:(BOOL)a3;
- (void)setZoomLensFrameUpdateTimer:(id)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomPanOffsetUpdateTimer:(id)a3;
- (void)setZoomSlugNormalizedPosition:(CGPoint)a3;
- (void)setZoomSlugPositionUpdateTimer:(id)a3;
- (void)setZoomWindowFrame:(CGRect)a3;
@end

@implementation ZWCoalescedSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  return (id)sharedInstance__Shared;
}

void __37__ZWCoalescedSettings_sharedInstance__block_invoke(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___ZWCoalescedSettings);
  v2 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v1;
}

- (CGRect)zoomWindowFrame
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomLensFrameUpdateTimer](self, "zoomLensFrameUpdateTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4)
  {
    CGFloat x = self->_cachedZoomLensFrame.origin.x;
    CGFloat y = self->_cachedZoomLensFrame.origin.y;
    CGFloat width = self->_cachedZoomLensFrame.size.width;
    CGFloat height = self->_cachedZoomLensFrame.size.height;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v9 zoomWindowFrame];
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)setZoomWindowFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_cachedZoomLensFrame = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomLensFrameUpdateTimer](self, "zoomLensFrameUpdateTimer"));

  if (!v8)
  {
    v9 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWCoalescedSettings setZoomLensFrameUpdateTimer:](self, "setZoomLensFrameUpdateTimer:", v9);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v9,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomLensFrameUpdateTimer](self, "zoomLensFrameUpdateTimer"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __42__ZWCoalescedSettings_setZoomWindowFrame___block_invoke;
  v11[3] = &__block_descriptor_64_e5_v8__0l;
  *(CGFloat *)&v11[4] = x;
  *(CGFloat *)&v11[5] = y;
  *(CGFloat *)&v11[6] = width;
  *(CGFloat *)&v11[7] = height;
  [v10 afterDelay:v11 processBlock:1.0];
}

void __42__ZWCoalescedSettings_setZoomWindowFrame___block_invoke(double *a1)
{
  double v1 = a1[4];
  double v2 = a1[5];
  double v3 = a1[6];
  double v4 = a1[7];
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend(v5, "setZoomWindowFrame:", v1, v2, v3, v4);
}

- (double)zoomFactor
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomFactorUpdateTimer](self, "zoomFactorUpdateTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4) {
    return self->_cachedZoomFactor;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 zoomScale];
  double v8 = v7;

  return v8;
}

- (void)setZoomFactor:(double)a3
{
  self->_cachedZoomFactor = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomFactorUpdateTimer](self, "zoomFactorUpdateTimer"));

  if (!v5)
  {
    v6 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWCoalescedSettings setZoomFactorUpdateTimer:](self, "setZoomFactorUpdateTimer:", v6);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v6,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomFactorUpdateTimer](self, "zoomFactorUpdateTimer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __37__ZWCoalescedSettings_setZoomFactor___block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v8[4] = a3;
  [v7 afterDelay:v8 processBlock:1.0];
}

void __37__ZWCoalescedSettings_setZoomFactor___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 setZoomScale:v1];
}

- (double)dockSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings dockSizeUpdateTimer](self, "dockSizeUpdateTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4) {
    return self->_cachedDockSize;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 dockSize];
  double v8 = v7;

  return v8;
}

- (void)setDockSize:(double)a3
{
  self->_cachedDockSize = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings dockSizeUpdateTimer](self, "dockSizeUpdateTimer"));

  if (!v5)
  {
    v6 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWCoalescedSettings setDockSizeUpdateTimer:](self, "setDockSizeUpdateTimer:", v6);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v6,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings dockSizeUpdateTimer](self, "dockSizeUpdateTimer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __35__ZWCoalescedSettings_setDockSize___block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&v8[4] = a3;
  [v7 afterDelay:v8 processBlock:1.0];
}

void __35__ZWCoalescedSettings_setDockSize___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 setDockSize:v1];
}

- (void)setZoomInStandby:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setZoomInStandby:v3];
}

- (BOOL)zoomInStandby
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 zoomInStandby];

  return v3;
}

- (CGPoint)zoomPanOffset
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomPanOffsetUpdateTimer](self, "zoomPanOffsetUpdateTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4)
  {
    CGFloat x = self->_cachedZoomPanOffset.x;
    CGFloat y = self->_cachedZoomPanOffset.y;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v7 zoomPanOffset];
    CGFloat x = v8;
    CGFloat y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_cachedZoomPanOffset = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomPanOffsetUpdateTimer](self, "zoomPanOffsetUpdateTimer"));

  if (!v6)
  {
    double v7 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWCoalescedSettings setZoomPanOffsetUpdateTimer:](self, "setZoomPanOffsetUpdateTimer:", v7);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v7,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomPanOffsetUpdateTimer](self, "zoomPanOffsetUpdateTimer"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __40__ZWCoalescedSettings_setZoomPanOffset___block_invoke;
  v9[3] = &__block_descriptor_48_e5_v8__0l;
  *(CGFloat *)&v9[4] = x;
  *(CGFloat *)&v9[5] = y;
  [v8 afterDelay:v9 processBlock:1.0];
}

void __40__ZWCoalescedSettings_setZoomPanOffset___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend(v3, "setZoomPanOffset:", v1, v2);
}

- (CGPoint)zoomSlugNormalizedPosition
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomSlugPositionUpdateTimer](self, "zoomSlugPositionUpdateTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4)
  {
    CGFloat x = self->_cachedZoomSlugPosition.x;
    CGFloat y = self->_cachedZoomSlugPosition.y;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v7 zoomSlugNormalizedPosition];
    CGFloat x = v8;
    CGFloat y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)setZoomSlugNormalizedPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_cachedZoomSlugPosition = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomSlugPositionUpdateTimer](self, "zoomSlugPositionUpdateTimer"));

  if (!v6)
  {
    double v7 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWCoalescedSettings setZoomSlugPositionUpdateTimer:](self, "setZoomSlugPositionUpdateTimer:", v7);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v7,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCoalescedSettings zoomSlugPositionUpdateTimer](self, "zoomSlugPositionUpdateTimer"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __53__ZWCoalescedSettings_setZoomSlugNormalizedPosition___block_invoke;
  v9[3] = &__block_descriptor_48_e5_v8__0l;
  *(CGFloat *)&v9[4] = x;
  *(CGFloat *)&v9[5] = y;
  [v8 afterDelay:v9 processBlock:1.0];
}

void __53__ZWCoalescedSettings_setZoomSlugNormalizedPosition___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend(v3, "setZoomSlugNormalizedPosition:", v1, v2);
}

- (AXDispatchTimer)zoomLensFrameUpdateTimer
{
  return self->_zoomLensFrameUpdateTimer;
}

- (void)setZoomLensFrameUpdateTimer:(id)a3
{
}

- (AXDispatchTimer)zoomFactorUpdateTimer
{
  return self->_zoomFactorUpdateTimer;
}

- (void)setZoomFactorUpdateTimer:(id)a3
{
}

- (AXDispatchTimer)dockSizeUpdateTimer
{
  return self->_dockSizeUpdateTimer;
}

- (void)setDockSizeUpdateTimer:(id)a3
{
}

- (AXDispatchTimer)zoomPanOffsetUpdateTimer
{
  return self->_zoomPanOffsetUpdateTimer;
}

- (void)setZoomPanOffsetUpdateTimer:(id)a3
{
}

- (AXDispatchTimer)zoomSlugPositionUpdateTimer
{
  return self->_zoomSlugPositionUpdateTimer;
}

- (void)setZoomSlugPositionUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end