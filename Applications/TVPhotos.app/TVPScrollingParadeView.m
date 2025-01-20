@interface TVPScrollingParadeView
- (BOOL)isPaused;
- (NSArray)imageProxies;
- (TVPScrollingParadeView)initWithFrame:(CGRect)a3;
- (void)_addImageToAnimationContainer:(id)a3;
- (void)_startAnimations;
- (void)_stopAnimations;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setImageProxies:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation TVPScrollingParadeView

- (TVPScrollingParadeView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPScrollingParadeView;
  v3 = -[TVPScrollingParadeView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    animationGroup = v3->_animationGroup;
    v3->_animationGroup = (OS_dispatch_group *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    imageViews = v3->_imageViews;
    v3->_imageViews = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___TVPImageLoaderQueue);
    loaderQueue = v3->_loaderQueue;
    v3->_loaderQueue = v8;
  }

  return v3;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPScrollingParadeView;
  -[TVPScrollingParadeView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScrollingParadeView window](self, "window"));
  if (v3 && (BOOL paused = self->_paused, v3, !paused))
  {
    -[TVPScrollingParadeView _startAnimations](self, "_startAnimations");
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScrollingParadeView window](self, "window"));

    if (!v5) {
      -[TVPScrollingParadeView _stopAnimations](self, "_stopAnimations");
    }
  }

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVPScrollingParadeView;
  -[TVPScrollingParadeView layoutSubviews](&v20, "layoutSubviews");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v3 = self->_imageViews;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "frame", (void)v16);
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        [v9 setFrame:v7];
        v22.origin.x = v7;
        v22.origin.y = v11;
        v22.size.width = v13;
        v22.size.height = v15;
        double v7 = v7 + CGRectGetWidth(v22);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    }

    while (v5);
  }

  if (!self->_paused)
  {
    -[TVPScrollingParadeView bounds](self, "bounds");
    v24.origin.x = CGRectZero.origin.x;
    v24.origin.y = CGRectZero.origin.y;
    v24.size.width = CGRectZero.size.width;
    v24.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v23, v24)) {
      -[TVPScrollingParadeView _startAnimations](self, "_startAnimations");
    }
  }

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageProxies, "isEqualToArray:", v4))
  {
    id v5 = (NSArray *)[v4 copy];
    imageProxies = self->_imageProxies;
    self->_imageProxies = v5;

    -[TVPImageLoaderQueue setImageProxies:](self->_loaderQueue, "setImageProxies:", self->_imageProxies);
    -[NSMutableArray makeObjectsPerformSelector:]( self->_imageViews,  "makeObjectsPerformSelector:",  "removeFromSuperview");
    if ([v4 count])
    {
      id v7 = [v4 count];
      else {
        uint64_t v8 = (uint64_t)v7;
      }
      objc_initWeak(&location, self);
      loaderQueue = self->_loaderQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100018DBC;
      v10[3] = &unk_1000C9AF0;
      objc_copyWeak(&v11, &location);
      v10[4] = self;
      -[TVPImageLoaderQueue preloadImageCount:withCompletionHandler:]( loaderQueue,  "preloadImageCount:withCompletionHandler:",  v8,  v10);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

    else
    {
      -[TVPScrollingParadeView _stopAnimations](self, "_stopAnimations");
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_BOOL paused = a3;
    if (a3) {
      -[TVPScrollingParadeView _stopAnimations](self, "_stopAnimations");
    }
    else {
      -[TVPScrollingParadeView _startAnimations](self, "_startAnimations");
    }
  }

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (void)_addImageToAnimationContainer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 size];
    double v7 = v5 / v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v8 bounds];
    double Height = CGRectGetHeight(v18);

    double v10 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  0.0,  0.0,  v7 * Height,  Height);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v10, "layer"));
    [v11 setAllowsEdgeAntialiasing:1];

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v10, "layer"));
    [v12 setEdgeAntialiasingMask:15];

    -[UIImageView setImage:](v10, "setImage:", v4);
    CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterMultiplyColor));
    [v13 setName:@"multiply"];
    id v14 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
    objc_msgSend(v13, "setValue:forKey:", objc_msgSend(v14, "CGColor"), @"inputColor");

    CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v10, "layer"));
    __int128 v17 = v13;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    [v15 setFilters:v16];

    -[NSMutableArray addObject:](self->_imageViews, "addObject:", v10);
    -[TVPScrollingParadeView addSubview:](self, "addSubview:", v10);
  }

- (void)_startAnimations
{
  if (!CGRectIsEmpty(v52))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScrollingParadeView window](self, "window"));

    if (v3)
    {
      if (!self->_animating && !self->_paused)
      {
        self->_animating = 1;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray subarrayWithRange:]( self->_imageViews,  "subarrayWithRange:",  0LL,  (char *)-[NSMutableArray count](self->_imageViews, "count") - self->_additionalImageViewCount));
        id v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v48;
          double v8 = 0.0;
          do
          {
            for (i = 0LL; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v48 != v7) {
                objc_enumerationMutation(v4);
              }
              [*(id *)(*((void *)&v47 + 1) + 8 * (void)i) bounds];
              double v8 = v8 + CGRectGetWidth(v53);
            }

            id v6 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
          }

          while (v6);
        }

        else
        {
          double v8 = 0.0;
        }

        +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
        double v10 = (char *)-[NSMutableArray count](self->_imageViews, "count");
        id v11 = &selRef_setDataItemPropertyID_;
        if (v10)
        {
          double v12 = 0LL;
          double v13 = 0.0;
          v43 = v10;
          do
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_imageViews, "objectAtIndex:", v12));
            [v14 bounds];
            double Width = CGRectGetWidth(v54);
            double v16 = floor(Width * 0.5);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position.x"));
            [v17 setDelegate:self];
            CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13 + v16));
            [v17 setFromValue:v18];

            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13 + v16 - v8));
            [v17 setToValue:v19];

            objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionLinear));
            [v17 setTimingFunction:v20];

            [v17 setDuration:v8 / 100.0];
            [v17 setFillMode:kCAFillModeForwards];
            [v17 setRemovedOnCompletion:0];
            v21 = (void *)objc_claimAutoreleasedReturnValue([v14 layer]);
            [v21 addAnimation:v17 forKey:@"positionAnimation"];

            double v22 = (v13 + -1272.0 + v16) / 100.0;
            double v23 = (Width + 1272.0) * 0.5 / 100.0 * 0.5;
            CGRect v24 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"filters.multiply.inputColor"));
            id v25 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
            objc_msgSend(v24, "setToValue:", objc_msgSend(v25, "CGColor"));

            LODWORD(v26) = 0;
            LODWORD(v27) = 1.0;
            LODWORD(v28) = 1051260355;
            LODWORD(v29) = 1059816735;
            v30 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v28,  v26,  v29,  v27));
            [v24 setTimingFunction:v30];

            [v24 setBeginTime:v22 + CACurrentMediaTime()];
            [v24 setDuration:v23];
            [v24 setFillMode:kCAFillModeForwards];
            [v24 setRemovedOnCompletion:0];
            v31 = (void *)objc_claimAutoreleasedReturnValue([v14 layer]);
            [v31 addAnimation:v24 forKey:@"undimmingAnimation"];

            v32 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"filters.multiply.inputColor"));
            v33 = v11;
            id v34 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
            objc_msgSend(v32, "setFromValue:", objc_msgSend(v34, "CGColor"));

            id v35 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
            objc_msgSend(v32, "setToValue:", objc_msgSend(v35, "CGColor"));

            LODWORD(v36) = 0;
            LODWORD(v37) = 1.0;
            LODWORD(v38) = 1061997773;
            LODWORD(v39) = 1059816735;
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v38,  v36,  v39,  v37));
            [v32 setTimingFunction:v40];

            [v32 setBeginTime:v23 + v22 + CACurrentMediaTime()];
            [v32 setDuration:v23];
            [v32 setFillMode:kCAFillModeForwards];
            [v32 setRemovedOnCompletion:0];
            v41 = (void *)objc_claimAutoreleasedReturnValue([v14 layer]);
            [v41 addAnimation:v32 forKey:@"dimmingAnimation"];

            id v11 = v33;
            [v14 frame];
            double v13 = v13 + CGRectGetWidth(v55);
            dispatch_group_enter(*(dispatch_group_t *)((char *)&self->super.super.super.isa + *((int *)v33 + 666)));

            ++v12;
          }

          while (v43 != v12);
        }

        +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
        -[TVPImageLoaderQueue setPauseImageLoad:](self->_loaderQueue, "setPauseImageLoad:", 0LL);
        objc_initWeak(&location, self);
        v42 = *(dispatch_group_s **)((char *)&self->super.super.super.isa + *((int *)v11 + 666));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000198CC;
        block[3] = &unk_1000C9D18;
        objc_copyWeak(&v45, &location);
        dispatch_group_notify(v42, &_dispatch_main_q, block);
        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
      }
    }
  }

- (void)_stopAnimations
{
  self->_animating = 0;
  -[TVPImageLoaderQueue setPauseImageLoad:](self->_loaderQueue, "setPauseImageLoad:", 1LL);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v3 = self->_imageViews;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "layer", (void)v9));
        [v8 removeAnimationForKey:@"positionAnimation"];
        [v8 removeAnimationForKey:@"dimmingAnimation"];
        [v8 removeAnimationForKey:@"undimmingAnimation"];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
}

@end