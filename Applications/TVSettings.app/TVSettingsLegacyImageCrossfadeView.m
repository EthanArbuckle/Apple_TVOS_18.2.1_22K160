@interface TVSettingsLegacyImageCrossfadeView
- (CGSize)_maximumImageSize;
- (NSArray)imageProxies;
- (NSTimer)crossfadeTimer;
- (TVSettingsLegacyImageCrossfadeView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (_TVSettingsImageLoaderQueue)loaderQueue;
- (double)crossfadeDuration;
- (double)crossfadePeriod;
- (double)rotationAngleDegrees;
- (void)_crossfadeToImage:(id)a3;
- (void)_loadNextImage:(id)a3;
- (void)_startTimer;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setCrossfadeDuration:(double)a3;
- (void)setCrossfadePeriod:(double)a3;
- (void)setCrossfadeTimer:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLoaderQueue:(id)a3;
- (void)setRotationAngleDegrees:(double)a3;
@end

@implementation TVSettingsLegacyImageCrossfadeView

- (TVSettingsLegacyImageCrossfadeView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsLegacyImageCrossfadeView;
  v3 = -[TVSettingsLegacyImageCrossfadeView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_crossfadePeriod = 4.0;
    v3->_crossfadeDuration = 0.6;
    v3->_rotationAngleDegrees = 0.0;
    v5 = objc_alloc_init(&OBJC_CLASS____TVSettingsImageLoaderQueue);
    loaderQueue = v4->_loaderQueue;
    v4->_loaderQueue = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v7;

    -[TVSettingsLegacyImageCrossfadeView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsLegacyImageCrossfadeView;
  -[TVSettingsLegacyImageCrossfadeView dealloc](&v3, "dealloc");
}

- (void)didMoveToSuperview
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLegacyImageCrossfadeView superview](self, "superview"));

  if (!v3)
  {
    -[NSTimer invalidate](self->_crossfadeTimer, "invalidate");
    crossfadeTimer = self->_crossfadeTimer;
    self->_crossfadeTimer = 0LL;
  }

- (void)layoutSubviews
{
  double v3 = self->_rotationAngleDegrees * 3.14159265 / 180.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLegacyImageCrossfadeView layer](self, "layer"));
  v5 = v4;
  if (v3 == 0.0)
  {
    __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v57.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v57.CGFloat m33 = v6;
    __int128 v7 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v57.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v57.m43 = v7;
    __int128 v8 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v57.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v57.m13 = v8;
    __int128 v9 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v57.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v57.m23 = v9;
  }

  else
  {
    __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v57.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v57.m23 = v10;
    *(_OWORD *)&v57.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    CGFloat m33 = CATransform3DIdentity.m33;
    __int128 v12 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v57.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v57.m13 = v12;
    v57.CGFloat m33 = m33;
    v57.m34 = -0.00100000005;
    __int128 v13 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v57.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v57.m43 = v13;
  }

  [v4 setSublayerTransform:&v57];

  -[TVSettingsLegacyImageCrossfadeView bounds](self, "bounds");
  double v15 = v14;
  double v51 = v16;
  -[TVSettingsLegacyImageCrossfadeView _maximumImageSize](self, "_maximumImageSize");
  CGFloat v49 = v18;
  CGFloat v50 = v17;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLegacyImageCrossfadeView subviews](self, "subviews"));
  id v20 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v20)
  {
    id v21 = v20;
    double v22 = ceil(v15 * 0.03);
    double v47 = v15 - v22 - v22;
    double v48 = v22;
    uint64_t v23 = *(void *)v54;
    CGFloat y = CGPointZero.y;
    double v46 = CGRectZero.origin.y;
    double height = CGRectZero.size.height;
    double width = CGRectZero.size.width;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v19);
        }
        v26 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___UIImageView);
        if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v26 image]);

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([v26 image]);
            [v29 size];
            CGFloat v31 = v30;
            CGFloat v33 = v32;

            v59.double width = v31;
            v59.double height = v33;
            v61.origin.x = CGPointZero.x;
            v61.origin.CGFloat y = y;
            v61.size.double height = v49;
            v61.size.double width = v50;
            CGRect v60 = AVMakeRectWithAspectRatioInsideRect(v59, v61);
            double v34 = v60.size.width;
            double v35 = v60.size.height;
            double v36 = floor(v48 + (v47 - v60.size.width) * 0.5);
            double v37 = floor((v51 - v60.size.height) * 0.5);
            v38 = (void *)objc_claimAutoreleasedReturnValue([v26 layer]);
            __int128 v39 = *(_OWORD *)&CATransform3DIdentity.m33;
            *(_OWORD *)&v57.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
            *(_OWORD *)&v57.CGFloat m33 = v39;
            __int128 v40 = *(_OWORD *)&CATransform3DIdentity.m43;
            *(_OWORD *)&v57.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
            *(_OWORD *)&v57.m43 = v40;
            __int128 v41 = *(_OWORD *)&CATransform3DIdentity.m13;
            *(_OWORD *)&v57.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
            *(_OWORD *)&v57.m13 = v41;
            __int128 v42 = *(_OWORD *)&CATransform3DIdentity.m23;
            *(_OWORD *)&v57.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
            *(_OWORD *)&v57.m23 = v42;
            [v38 setTransform:&v57];

            objc_msgSend(v26, "setFrame:", v36, v37, v34, v35);
            if (v3 != 0.0)
            {
              CATransform3DMakeRotation(&v57, v3, 0.0, 1.0, 0.0);
              v43 = (void *)objc_claimAutoreleasedReturnValue([v26 layer]);
              CATransform3D v52 = v57;
              [v43 setTransform:&v52];
            }
          }

          else
          {
            objc_msgSend(v26, "setFrame:", CGRectZero.origin.x, v46, width, height);
          }
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }

    while (v21);
  }
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v5;

  -[_TVSettingsImageLoaderQueue setImageProxies:](self->_loaderQueue, "setImageProxies:", self->_imageProxies);
  -[NSTimer invalidate](self->_crossfadeTimer, "invalidate");
  crossfadeTimer = self->_crossfadeTimer;
  self->_crossfadeTimer = 0LL;

  if ([v4 count])
  {
    objc_initWeak(&location, self);
    loaderQueue = self->_loaderQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000133EC;
    v9[3] = &unk_10018E810;
    objc_copyWeak(&v10, &location);
    -[_TVSettingsImageLoaderQueue preloadImageCount:withCompletionHandler:]( loaderQueue,  "preloadImageCount:withCompletionHandler:",  2LL,  v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)setRotationAngleDegrees:(double)a3
{
  if (self->_rotationAngleDegrees != a3)
  {
    self->_rotationAngleDegrees = a3;
    -[TVSettingsLegacyImageCrossfadeView setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)_maximumImageSize
{
  double v3 = (v2 - ceil(v2 * 0.03)) * 0.665;
  double v5 = v4 * 0.665;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)_startTimer
{
  crossfadeTimer = self->_crossfadeTimer;
  if (crossfadeTimer)
  {
    -[NSTimer invalidate](crossfadeTimer, "invalidate");
    double v4 = self->_crossfadeTimer;
    self->_crossfadeTimer = 0LL;
  }

  if (-[NSArray count](self->_imageProxies, "count") >= 2)
  {
    double v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_loadNextImage:",  0LL,  1LL,  self->_crossfadePeriod));
    __int128 v6 = self->_crossfadeTimer;
    self->_crossfadeTimer = v5;
  }

- (void)_loadNextImage:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsImageLoaderQueue popNextImage](self->_loaderQueue, "popNextImage", a3));
  if (v4)
  {
    id v6 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage, "imageWithCGImage:", [v4 image]));
    -[TVSettingsLegacyImageCrossfadeView _crossfadeToImage:](self, "_crossfadeToImage:", v5);

    double v4 = v6;
  }
}

- (void)_crossfadeToImage:(id)a3
{
  id v4 = a3;
  double v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);

  -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);
  id v6 = self->_imageView;
  objc_storeStrong((id *)&self->_imageView, v5);
  -[TVSettingsLegacyImageCrossfadeView insertSubview:aboveSubview:]( self,  "insertSubview:aboveSubview:",  v5,  self->_imageView);
  double crossfadeDuration = self->_crossfadeDuration;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100013720;
  v12[3] = &unk_10018E468;
  __int128 v13 = v5;
  double v14 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100013750;
  v10[3] = &unk_10018EC08;
  v11 = v14;
  __int128 v8 = v14;
  __int128 v9 = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v12,  v10,  crossfadeDuration,  0.0);
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (double)crossfadePeriod
{
  return self->_crossfadePeriod;
}

- (void)setCrossfadePeriod:(double)a3
{
  self->_crossfadePeriod = a3;
}

- (double)crossfadeDuration
{
  return self->_crossfadeDuration;
}

- (void)setCrossfadeDuration:(double)a3
{
  self->_double crossfadeDuration = a3;
}

- (double)rotationAngleDegrees
{
  return self->_rotationAngleDegrees;
}

- (_TVSettingsImageLoaderQueue)loaderQueue
{
  return self->_loaderQueue;
}

- (void)setLoaderQueue:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSTimer)crossfadeTimer
{
  return self->_crossfadeTimer;
}

- (void)setCrossfadeTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end