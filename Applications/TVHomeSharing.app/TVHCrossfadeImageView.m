@interface TVHCrossfadeImageView
- (NSArray)imageProxies;
- (TVHCrossfadeImageView)initWithFrame:(CGRect)a3;
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

@implementation TVHCrossfadeImageView

- (TVHCrossfadeImageView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHCrossfadeImageView;
  v3 = -[TVHCrossfadeImageView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    imageProxies = v3->_imageProxies;
    v3->_imageProxies = (NSArray *)&__NSArray0__struct;

    *(_OWORD *)&v4->_padding.top = 0u;
    *(_OWORD *)&v4->_padding.bottom = 0u;
    v4->_crossfadePeriod = 4.0;
    v4->_crossfadeDuration = 1.0;
    v6 = objc_alloc_init(&OBJC_CLASS___TVHImageProxyQueueLoader);
    imageProxyLoader = v4->_imageProxyLoader;
    v4->_imageProxyLoader = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v8;

    -[TVHCrossfadeImageView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCrossfadeImageView;
  -[TVHCrossfadeImageView dealloc](&v3, "dealloc");
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v5;

  -[TVHImageProxyQueueLoader setImageProxies:](self->_imageProxyLoader, "setImageProxies:", self->_imageProxies);
  -[NSTimer invalidate](self->_crossfadeTimer, "invalidate");
  crossfadeTimer = self->_crossfadeTimer;
  self->_crossfadeTimer = 0LL;

  if ([v4 count])
  {
    objc_initWeak(&location, self);
    imageProxyLoader = self->_imageProxyLoader;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000674C0;
    v9[3] = &unk_1000FCEF8;
    objc_copyWeak(&v10, &location);
    -[TVHImageProxyQueueLoader preloadImageCount:withCompletionHandler:]( imageProxyLoader,  "preloadImageCount:withCompletionHandler:",  2LL,  v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)didMoveToSuperview
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCrossfadeImageView superview](self, "superview"));

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
  -[TVHCrossfadeImageView padding](self, "padding");
  double v8 = v7;
  -[TVHCrossfadeImageView padding](self, "padding");
  double v10 = v9;
  -[TVHCrossfadeImageView padding](self, "padding");
  double v12 = v11;
  -[TVHCrossfadeImageView padding](self, "padding");
  double v14 = v13;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCrossfadeImageView subviews](self, "subviews"));
  id v16 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v16)
  {
    id v17 = v16;
    double v18 = v4 - v8 - v10;
    double v19 = v6 - v12 - v14;
    double height = CGSizeZero.height;
    uint64_t v20 = *(void *)v47;
    CGFloat y = CGPointZero.y;
    CGFloat x = CGPointZero.x;
    CGFloat width = CGRectZero.size.width;
    CGFloat v44 = CGRectZero.origin.y;
    CGFloat v22 = CGRectZero.size.height;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v15);
        }
        v24 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "image", *(void *)&y, *(void *)&x));

        double v27 = v44;
        double v26 = CGRectZero.origin.x;
        double v28 = width;
        double v29 = v22;
        if (v25)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v24 image]);
          [v30 size];
          double v32 = v31;
          double v34 = v33;

          BOOL v35 = v32 == CGSizeZero.width && v34 == height;
          double v28 = v18;
          double v29 = v19;
          if (!v35)
          {
            v51.CGFloat width = v32;
            v51.double height = v34;
            v53.origin.CGFloat y = y;
            v53.origin.CGFloat x = x;
            v53.size.CGFloat width = v18;
            v53.size.double height = v19;
            CGRect v52 = AVMakeRectWithAspectRatioInsideRect(v51, v53);
            double v28 = v52.size.width;
            double v29 = v52.size.height;
          }

          double v26 = floor((v18 - v28) * 0.5);
          double v27 = floor((v19 - v29) * 0.5);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
          __int128 v37 = *(_OWORD *)&CATransform3DIdentity.m33;
          v45[4] = *(_OWORD *)&CATransform3DIdentity.m31;
          v45[5] = v37;
          __int128 v38 = *(_OWORD *)&CATransform3DIdentity.m43;
          v45[6] = *(_OWORD *)&CATransform3DIdentity.m41;
          v45[7] = v38;
          __int128 v39 = *(_OWORD *)&CATransform3DIdentity.m13;
          v45[0] = *(_OWORD *)&CATransform3DIdentity.m11;
          v45[1] = v39;
          __int128 v40 = *(_OWORD *)&CATransform3DIdentity.m23;
          v45[2] = *(_OWORD *)&CATransform3DIdentity.m21;
          v45[3] = v40;
          [v36 setTransform:v45];
        }

        objc_msgSend(v24, "setFrame:", v26, v27, v28, v29);
      }

      id v17 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }

    while (v17);
  }
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
    double v6 = self->_crossfadeTimer;
    self->_crossfadeTimer = v5;
  }

- (void)_loadNextImage:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageProxyQueueLoader popNextImage](self->_imageProxyLoader, "popNextImage", a3));
  if (v4)
  {
    id v6 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiImage]);
    -[TVHCrossfadeImageView _crossfadeToImage:](self, "_crossfadeToImage:", v5);

    double v4 = v6;
  }
}

- (void)_crossfadeToImage:(id)a3
{
  id v4 = a3;
  double v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);

  -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);
  -[TVHCrossfadeImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, self->_imageView);
  double crossfadeDuration = self->_crossfadeDuration;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100067A34;
  v10[3] = &unk_1000FCDB8;
  double v11 = v5;
  double v12 = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100067A70;
  v8[3] = &unk_1000FDC18;
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