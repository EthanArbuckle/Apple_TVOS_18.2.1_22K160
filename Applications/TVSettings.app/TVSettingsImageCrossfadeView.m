@interface TVSettingsImageCrossfadeView
- (NSArray)imageProxies;
- (TVSettingsImageCrossfadeView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)padding;
- (double)crossfadeDuration;
- (double)crossfadePeriod;
- (void)_crossfadeToImage:(id)a3;
- (void)_loadNextImage:(id)a3;
- (void)_startTimer;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setCrossfadeDuration:(double)a3;
- (void)setCrossfadePeriod:(double)a3;
- (void)setImageProxies:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation TVSettingsImageCrossfadeView

- (TVSettingsImageCrossfadeView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsImageCrossfadeView;
  v3 = -[TVSettingsImageCrossfadeView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = (TVSettingsImageCrossfadeView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 72) = 0u;
    *((void *)v3 + 5) = 0x4010000000000000LL;
    *((void *)v3 + 6) = 0x3FF0000000000000LL;
    v5 = objc_alloc_init(&OBJC_CLASS____TVSettingsImageLoaderQueue);
    loaderQueue = v4->_loaderQueue;
    v4->_loaderQueue = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v7;

    -[TVSettingsImageCrossfadeView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsImageCrossfadeView;
  -[TVSettingsImageCrossfadeView dealloc](&v3, "dealloc");
}

- (void)didMoveToSuperview
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageCrossfadeView superview](self, "superview"));

  if (!v3)
  {
    -[NSTimer invalidate](self->_crossfadeTimer, "invalidate");
    crossfadeTimer = self->_crossfadeTimer;
    self->_crossfadeTimer = 0LL;
  }

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  -[TVSettingsImageCrossfadeView padding](self, "padding");
  double v8 = v7;
  -[TVSettingsImageCrossfadeView padding](self, "padding");
  double v10 = v9;
  -[TVSettingsImageCrossfadeView padding](self, "padding");
  double v12 = v11;
  -[TVSettingsImageCrossfadeView padding](self, "padding");
  double v14 = v13;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageCrossfadeView subviews](self, "subviews"));
  id v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    double v18 = v4 - v8 - v10;
    double v19 = v6 - v12 - v14;
    uint64_t v20 = *(void *)v45;
    CGFloat y = CGPointZero.y;
    CGFloat x = CGPointZero.x;
    CGFloat width = CGRectZero.size.width;
    CGFloat v42 = CGRectZero.origin.y;
    CGFloat height = CGRectZero.size.height;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v15);
        }
        v24 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "image", *(void *)&y, *(void *)&x));

        double v27 = v42;
        double v26 = CGRectZero.origin.x;
        double v28 = width;
        double v29 = height;
        if (v25)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v24 image]);
          [v30 size];
          CGFloat v32 = v31;
          CGFloat v34 = v33;

          v49.CGFloat width = v32;
          v49.CGFloat height = v34;
          v51.origin.CGFloat y = y;
          v51.origin.CGFloat x = x;
          v51.size.CGFloat width = v18;
          v51.size.CGFloat height = v19;
          CGRect v50 = AVMakeRectWithAspectRatioInsideRect(v49, v51);
          double v28 = v50.size.width;
          double v29 = v50.size.height;
          double v26 = floor((v18 - v50.size.width) * 0.5);
          double v27 = floor((v19 - v50.size.height) * 0.5);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
          __int128 v36 = *(_OWORD *)&CATransform3DIdentity.m33;
          v43[4] = *(_OWORD *)&CATransform3DIdentity.m31;
          v43[5] = v36;
          __int128 v37 = *(_OWORD *)&CATransform3DIdentity.m43;
          v43[6] = *(_OWORD *)&CATransform3DIdentity.m41;
          v43[7] = v37;
          __int128 v38 = *(_OWORD *)&CATransform3DIdentity.m13;
          v43[0] = *(_OWORD *)&CATransform3DIdentity.m11;
          v43[1] = v38;
          __int128 v39 = *(_OWORD *)&CATransform3DIdentity.m23;
          v43[2] = *(_OWORD *)&CATransform3DIdentity.m21;
          v43[3] = v39;
          [v35 setTransform:v43];
        }

        objc_msgSend(v24, "setFrame:", v26, v27, v28, v29);
      }

      id v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v17);
  }
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  double v5 = (NSArray *)[v4 copy];
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
    v9[2] = sub_10004293C;
    v9[3] = &unk_10018E810;
    objc_copyWeak(&v10, &location);
    -[_TVSettingsImageLoaderQueue preloadImageCount:withCompletionHandler:]( loaderQueue,  "preloadImageCount:withCompletionHandler:",  2LL,  v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_startTimer
{
  crossfadeTimer = self->_crossfadeTimer;
  if (crossfadeTimer)
  {
    -[NSTimer invalidate](crossfadeTimer, "invalidate");
    id v4 = self->_crossfadeTimer;
    self->_crossfadeTimer = 0LL;
  }

  if (-[NSArray count](self->_imageProxies, "count") >= 2)
  {
    double v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_loadNextImage:",  0LL,  1LL,  self->_crossfadePeriod));
    double v6 = self->_crossfadeTimer;
    self->_crossfadeTimer = v5;
  }

- (void)_loadNextImage:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsImageLoaderQueue popNextImage](self->_loaderQueue, "popNextImage", a3));
  if (v4)
  {
    id v6 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage, "imageWithCGImage:", [v4 image]));
    -[TVSettingsImageCrossfadeView _crossfadeToImage:](self, "_crossfadeToImage:", v5);

    id v4 = v6;
  }
}

- (void)_crossfadeToImage:(id)a3
{
  id v4 = a3;
  double v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);

  -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);
  -[TVSettingsImageCrossfadeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, self->_imageView);
  double crossfadeDuration = self->_crossfadeDuration;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100042BDC;
  v10[3] = &unk_10018E468;
  double v11 = v5;
  double v12 = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100042C18;
  v8[3] = &unk_10018EFC8;
  v8[4] = self;
  double v9 = v11;
  double v7 = v11;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v10,  v8,  crossfadeDuration);
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
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

- (void).cxx_destruct
{
}

@end