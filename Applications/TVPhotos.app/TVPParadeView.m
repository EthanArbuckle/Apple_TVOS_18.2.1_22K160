@interface TVPParadeView
- (BOOL)isInOrder;
- (BOOL)isPaused;
- (BOOL)isPreviewPaused;
- (BOOL)isShuffled;
- (CGRect)animationBounds;
- (CGRect)maximumImageBounds;
- (NSArray)depthKeyframes;
- (NSArray)imageProxies;
- (NSArray)positionKeyframes;
- (NSArray)shuffledImageProxies;
- (NSArray)transformKeyframes;
- (TVPImageLoaderQueue)loaderQueue;
- (TVPParadeView)initWithFrame:(CGRect)a3;
- (id)_createLayerForImage:(CGImage *)a3;
- (id)_imageProxiesToLoad;
- (id)_sublayerWithAnimation:(id)a3;
- (int64_t)_maximumImageCount;
- (void)_applicationDidFinishSuspensionNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_stopAnimations;
- (void)_updateAnimationForLayer:(id)a3 timeOffset:(double)a4;
- (void)_updateAnimations;
- (void)_updateKeyframes;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setAnimationBounds:(CGRect)a3;
- (void)setDepthKeyframes:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setInOrder:(BOOL)a3;
- (void)setLoaderQueue:(id)a3;
- (void)setMaximumImageBounds:(CGRect)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPositionKeyframes:(id)a3;
- (void)setShuffled:(BOOL)a3;
- (void)setShuffledImageProxies:(id)a3;
- (void)setTransformKeyframes:(id)a3;
@end

@implementation TVPParadeView

- (TVPParadeView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVPParadeView;
  v3 = -[TVPParadeView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_paused = 0;
    v3->_shuffled = 0;
    v3->_inOrder = 1;
    v5 = objc_alloc_init(&OBJC_CLASS___TVPImageLoaderQueue);
    loaderQueue = v4->_loaderQueue;
    v4->_loaderQueue = v5;

    CGPoint origin = CGRectZero.origin;
    CGSize size = CGRectZero.size;
    v4->_animationBounds.CGPoint origin = CGRectZero.origin;
    v4->_animationBounds.CGSize size = size;
    v4->_maximumImageBounds.CGPoint origin = origin;
    v4->_maximumImageBounds.CGSize size = size;
    -[TVPParadeView setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](v4, "layer"));
    __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m23;
    v19[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v19[3] = v10;
    v19[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    CGFloat m33 = CATransform3DIdentity.m33;
    __int128 v12 = *(_OWORD *)&CATransform3DIdentity.m13;
    v19[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v19[1] = v12;
    CGFloat v20 = m33;
    unint64_t v21 = 0xBF50624DD2F1A9FCLL;
    __int128 v13 = *(_OWORD *)&CATransform3DIdentity.m43;
    __int128 v22 = *(_OWORD *)&CATransform3DIdentity.m41;
    __int128 v23 = v13;
    [v9 setSublayerTransform:v19];

    -[TVPParadeView _updateKeyframes](v4, "_updateKeyframes");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v15 = _UIApplicationDidFinishSuspensionSnapshotNotification;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v14 addObserver:v4 selector:"_applicationDidFinishSuspensionNotification:" name:v15 object:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v14 addObserver:v4 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:v17];
  }

  return v4;
}

- (void)layoutSubviews
{
  p_animationBounds = &self->_animationBounds;
  -[TVPParadeView bounds](self, "bounds");
  v12.origin.x = v4;
  v12.origin.y = v5;
  v12.size.width = v6;
  v12.size.height = v7;
  if (!CGRectEqualToRect(*p_animationBounds, v12))
  {
    -[TVPParadeView bounds](self, "bounds");
    p_animationBounds->origin.x = v8;
    p_animationBounds->origin.y = v9;
    p_animationBounds->size.width = v10;
    p_animationBounds->size.height = v11;
    -[TVPParadeView _updateKeyframes](self, "_updateKeyframes");
    -[TVPParadeView _updateAnimations](self, "_updateAnimations");
  }

- (void)didMoveToSuperview
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView superview](self, "superview"));

  if (!v3) {
    -[TVPParadeView _stopAnimations](self, "_stopAnimations");
  }
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  if (-[TVPParadeView isPaused](self, "isPaused", a3) && self->_pausedForResignActive) {
    -[TVPParadeView setPaused:](self, "setPaused:", 0LL);
  }
  self->_pausedForResignActive = 0;
}

- (void)_applicationDidFinishSuspensionNotification:(id)a3
{
  if (!-[TVPParadeView isPaused](self, "isPaused", a3))
  {
    -[TVPParadeView setPaused:](self, "setPaused:", 1LL);
    self->_pausedForResignActive = 1;
  }

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  CGFloat v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_randomizedArray"));
  shuffledImageProxies = self->_shuffledImageProxies;
  self->_shuffledImageProxies = v5;

  CGFloat v7 = (NSArray *)[v4 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v7;

  loaderQueue = self->_loaderQueue;
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView _imageProxiesToLoad](self, "_imageProxiesToLoad"));
  -[TVPImageLoaderQueue setImageProxies:](loaderQueue, "setImageProxies:", v10);

  if ([v4 count])
  {
    CGFloat v11 = (char *)-[TVPParadeView _maximumImageCount](self, "_maximumImageCount") + 1;
    objc_initWeak(&location, self);
    CGRect v12 = self->_loaderQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B624;
    v13[3] = &unk_1000C9AF0;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    -[TVPImageLoaderQueue preloadImageCount:withCompletionHandler:]( v12,  "preloadImageCount:withCompletionHandler:",  v11,  v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVPParadeView _stopAnimations](self, "_stopAnimations");
  }
}

- (BOOL)isPreviewPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (a3) {
      -[TVPParadeView _stopAnimations](self, "_stopAnimations");
    }
    else {
      -[TVPParadeView _updateAnimations](self, "_updateAnimations");
    }
  }

- (void)setShuffled:(BOOL)a3
{
  self->_shuffled = a3;
  loaderQueue = self->_loaderQueue;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPParadeView _imageProxiesToLoad](self, "_imageProxiesToLoad"));
  -[TVPImageLoaderQueue setImageProxies:](loaderQueue, "setImageProxies:", v4);
}

- (void)setInOrder:(BOOL)a3
{
  self->_inOrder = a3;
  -[TVPImageLoaderQueue setRandomized:](self->_loaderQueue, "setRandomized:", !a3);
}

- (int64_t)_maximumImageCount
{
  return 5LL;
}

- (id)_imageProxiesToLoad
{
  if (self->_shuffled) {
    v2 = &OBJC_IVAR___TVPParadeView__shuffledImageProxies;
  }
  else {
    v2 = &OBJC_IVAR___TVPParadeView__imageProxies;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)_createLayerForImage:(CGImage *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
  [v4 setContents:a3];
  double Width = (double)CGImageGetWidth(a3);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(a3));
  return v4;
}

- (void)_updateKeyframes
{
  double width = self->_animationBounds.size.width;
  float v3 = width * 0.680000007;
  float v4 = ceilf(v3);
  float v5 = self->_animationBounds.size.height * 0.685000002;
  self->_maximumImageBounds.origin.x = (width - v4) * 0.5;
  self->_maximumImageBounds.origin.y = 0.0;
  self->_maximumImageBounds.size.double width = v4;
  self->_maximumImageBounds.size.height = floorf(v5);
  CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  for (uint64_t i = 0LL; i != 80; i += 16LL)
  {
    float v10 = *(float *)((char *)&unk_100097978 + i);
    float v11 = *(float *)((char *)&unk_100097978 + i + 8);
    CGRect v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithCGPoint:]( &OBJC_CLASS___NSValue,  "valueWithCGPoint:",  ceilf(v4 * *(float *)((char *)&unk_100097978 + i + 4)),  0.0));
    [v6 addObject:v12];

    *(float *)&double v13 = ceilf(v11 * 1000.0);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
    [v7 addObject:v14];

    float v15 = (float)(v10 / 180.0) * 3.14159265;
    CATransform3DMakeRotation(&v22, v15, 0.0, 1.0, 0.0);
    CATransform3D v21 = v22;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", &v21));
    [v8 addObject:v16];
  }

  id v17 = [v6 copy];
  -[TVPParadeView setPositionKeyframes:](self, "setPositionKeyframes:", v17);

  id v18 = [v7 copy];
  -[TVPParadeView setDepthKeyframes:](self, "setDepthKeyframes:", v18);

  id v19 = [v8 copy];
  -[TVPParadeView setTransformKeyframes:](self, "setTransformKeyframes:", v19);
}

- (void)_updateAnimations
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](self, "layer", 0LL));
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sublayers]);

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    double v8 = 22.5;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (v8 <= 0.0) {
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) removeFromSuperlayer];
        }
        else {
          -[TVPParadeView _updateAnimationForLayer:timeOffset:]( self,  "_updateAnimationForLayer:timeOffset:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  v8);
        }
        double v8 = v8 + -4.5;
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)_updateAnimationForLayer:(id)a3 timeOffset:(double)a4
{
  CGFloat v6 = self->_animationBounds.size.height * 0.5;
  id v7 = a3;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10000C158;
  v54[3] = &unk_1000C9B10;
  *(CGFloat *)&v54[4] = v6;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView positionKeyframes](self, "positionKeyframes"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "tvs_arrayByMappingObjectsUsingBlock:", v54));
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"position"));
  [v9 setValues:v8];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"zPosition"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView depthKeyframes](self, "depthKeyframes"));
  [v10 setValues:v11];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"transform"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView transformKeyframes](self, "transformKeyframes"));
  [v12 setValues:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
  LODWORD(v15) = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
  [v14 setFromValue:v16];

  LODWORD(v17) = 1.0;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
  [v14 setToValue:v18];

  [v14 setDuration:4.5];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView positionKeyframes](self, "positionKeyframes"));
  double v20 = (double)(unint64_t)[v19 count] * 4.5;

  CATransform3D v21 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](&OBJC_CLASS___CAAnimationGroup, "animation"));
  v55[0] = v9;
  v55[1] = v10;
  v55[2] = v12;
  v55[3] = v14;
  CATransform3D v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 4LL));
  [v21 setAnimations:v22];

  [v21 setDuration:v20];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseIn));
  [v21 setTimingFunction:v23];

  [v21 setBeginTime:CACurrentMediaTime() - a4];
  [v21 setRemovedOnCompletion:0];
  [v21 setFillMode:kCAFillModeBoth];
  [v21 setDelegate:self];
  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView positionKeyframes](self, "positionKeyframes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
  [v25 CGPointValue];
  double v27 = v26;
  double v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView depthKeyframes](self, "depthKeyframes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]);
  [v31 floatValue];
  float v33 = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView transformKeyframes](self, "transformKeyframes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 firstObject]);
  v36 = v35;
  if (v35)
  {
    [v35 CATransform3DValue];
  }

  else
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
  }

  v37 = (CGImage *)[v7 contents];
  CGFloat Width = (double)CGImageGetWidth(v37);
  v56.CGFloat height = (double)CGImageGetHeight(v37);
  v56.double width = Width;
  CGRect v57 = AVMakeRectWithAspectRatioInsideRect(v56, self->_maximumImageBounds);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat v41 = v57.size.width;
  CGFloat height = v57.size.height;
  double v43 = CGRectGetWidth(v57);
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = v41;
  v58.size.CGFloat height = height;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v43, CGRectGetHeight(v58));
  objc_msgSend(v7, "setPosition:", v27, v29);
  [v7 setZPosition:v33];
  v45[4] = v50;
  v45[5] = v51;
  v45[6] = v52;
  v45[7] = v53;
  v45[0] = v46;
  v45[1] = v47;
  v45[2] = v48;
  v45[3] = v49;
  [v7 setTransform:v45];
  [v7 addAnimation:v21 forKey:@"ParadeAnimation"];
}

- (void)_stopAnimations
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](self, "layer", 0LL));
  float v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sublayers]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeAnimationForKey:@"ParadeAnimation"];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVPParadeView _sublayerWithAnimation:](self, "_sublayerWithAnimation:", a3));
    [v14 removeFromSuperlayer];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](self, "layer"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sublayers]);
    id v7 = [v6 count];

    BOOL v8 = v7 >= (id)-[TVPParadeView _maximumImageCount](self, "_maximumImageCount");
    __int128 v9 = v14;
    if (!v8)
    {
      id v10 = objc_claimAutoreleasedReturnValue(-[TVPImageLoaderQueue popNextImage](self->_loaderQueue, "popNextImage"));
      id v11 = [v10 image];
      if (v11)
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView _createLayerForImage:](self, "_createLayerForImage:", v11));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](self, "layer"));
        [v13 addSublayer:v12];

        -[TVPParadeView _updateAnimationForLayer:timeOffset:](self, "_updateAnimationForLayer:timeOffset:", v12, 0.0);
      }

      __int128 v9 = v14;
    }
  }

- (id)_sublayerWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPParadeView layer](self, "layer"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sublayers]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000C44C;
  v11[3] = &unk_1000C9B38;
  id v12 = v4;
  id v7 = v4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_objectsPassingTest:", v11));

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  return v9;
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isShuffled
{
  return self->_shuffled;
}

- (BOOL)isInOrder
{
  return self->_inOrder;
}

- (TVPImageLoaderQueue)loaderQueue
{
  return self->_loaderQueue;
}

- (void)setLoaderQueue:(id)a3
{
}

- (NSArray)shuffledImageProxies
{
  return self->_shuffledImageProxies;
}

- (void)setShuffledImageProxies:(id)a3
{
}

- (CGRect)animationBounds
{
  double x = self->_animationBounds.origin.x;
  double y = self->_animationBounds.origin.y;
  double width = self->_animationBounds.size.width;
  double height = self->_animationBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimationBounds:(CGRect)a3
{
  self->_animationBounds = a3;
}

- (CGRect)maximumImageBounds
{
  double x = self->_maximumImageBounds.origin.x;
  double y = self->_maximumImageBounds.origin.y;
  double width = self->_maximumImageBounds.size.width;
  double height = self->_maximumImageBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMaximumImageBounds:(CGRect)a3
{
  self->_maximumImageBounds = a3;
}

- (NSArray)positionKeyframes
{
  return self->_positionKeyframes;
}

- (void)setPositionKeyframes:(id)a3
{
}

- (NSArray)depthKeyframes
{
  return self->_depthKeyframes;
}

- (void)setDepthKeyframes:(id)a3
{
}

- (NSArray)transformKeyframes
{
  return self->_transformKeyframes;
}

- (void)setTransformKeyframes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end