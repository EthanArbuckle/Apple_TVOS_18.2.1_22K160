@interface TVPImageCrossfadeView
- (NSArray)imageProxies;
- (TVPImageCrossfadeView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)padding;
- (double)crossfadeDuration;
- (double)crossfadePeriod;
- (void)_crossfadeToImage:(id)a3;
- (void)_loadNextImage:(id)a3;
- (void)_startTimer;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setCrossfadeDuration:(double)a3;
- (void)setCrossfadePeriod:(double)a3;
- (void)setImageProxies:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation TVPImageCrossfadeView

- (TVPImageCrossfadeView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPImageCrossfadeView;
  v3 = -[TVPImageCrossfadeView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = (TVPImageCrossfadeView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 72) = 0u;
    *((void *)v3 + 5) = 0x4010000000000000LL;
    *((void *)v3 + 6) = 0x3FF0000000000000LL;
    v5 = objc_alloc_init(&OBJC_CLASS___TVPImageLoaderQueue);
    loaderQueue = v4->_loaderQueue;
    v4->_loaderQueue = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v7;

    -[TVPImageCrossfadeView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (void)didMoveToSuperview
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageCrossfadeView superview](self, "superview"));

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
  double v8 = v7;
  double v10 = v9;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageCrossfadeView subviews](self, "subviews", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 image]);

        if (v20)
        {
          objc_msgSend(v19, "setFrame:", v4, v6, v8, v10);
          [v19 setContentMode:2];
        }

        else
        {
          objc_msgSend(v19, "setFrame:", CGRectZero.origin.x, y, width, height);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  double v5 = (NSArray *)[v4 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v5;

  -[TVPImageLoaderQueue setImageProxies:](self->_loaderQueue, "setImageProxies:", self->_imageProxies);
  -[NSTimer invalidate](self->_crossfadeTimer, "invalidate");
  crossfadeTimer = self->_crossfadeTimer;
  self->_crossfadeTimer = 0LL;

  id v8 = [v4 count];
  if (v8)
  {
    loaderQueue = self->_loaderQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100029330;
    v10[3] = &unk_1000C9528;
    v10[4] = self;
    -[TVPImageLoaderQueue preloadImageCount:withCompletionHandler:]( loaderQueue,  "preloadImageCount:withCompletionHandler:",  2LL,  v10);
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageLoaderQueue popNextImage](self->_loaderQueue, "popNextImage", a3));
  if (v4)
  {
    id v6 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage, "imageWithCGImage:", [v4 image]));
    -[TVPImageCrossfadeView _crossfadeToImage:](self, "_crossfadeToImage:", v5);

    id v4 = v6;
  }
}

- (void)_crossfadeToImage:(id)a3
{
  id v4 = a3;
  double v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);

  -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);
  -[TVPImageCrossfadeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, self->_imageView);
  double crossfadeDuration = self->_crossfadeDuration;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000295C0;
  v10[3] = &unk_1000C9CC8;
  v11 = v5;
  id v12 = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000295FC;
  v8[3] = &unk_1000CA520;
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