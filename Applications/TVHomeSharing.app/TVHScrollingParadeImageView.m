@interface TVHScrollingParadeImageView
- (BOOL)isAnimating;
- (BOOL)isPaused;
- (NSArray)imageProxies;
- (NSMutableArray)imageViews;
- (OS_dispatch_group)animationGroup;
- (TVHImageProxyQueueLoader)imageProxyLoader;
- (TVHScrollingParadeImageView)initWithFrame:(CGRect)a3;
- (unint64_t)additionalImageViewCount;
- (void)_addImage:(id)a3;
- (void)_startAnimations;
- (void)_stopAnimations;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdditionalImageViewCount:(unint64_t)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationGroup:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setImageProxyLoader:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation TVHScrollingParadeImageView

- (TVHScrollingParadeImageView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHScrollingParadeImageView;
  v3 = -[TVHScrollingParadeImageView initWithFrame:]( &v13,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    imageProxies = v3->_imageProxies;
    v3->_imageProxies = (NSArray *)&__NSArray0__struct;

    dispatch_group_t v6 = dispatch_group_create();
    animationGroup = v4->_animationGroup;
    v4->_animationGroup = (OS_dispatch_group *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    imageViews = v4->_imageViews;
    v4->_imageViews = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___TVHImageProxyQueueLoader);
    imageProxyLoader = v4->_imageProxyLoader;
    v4->_imageProxyLoader = v10;
  }

  return v4;
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageProxies, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)[v4 copy];
    imageProxies = self->_imageProxies;
    self->_imageProxies = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageProxyLoader](self, "imageProxyLoader"));
    [v7 setImageProxies:self->_imageProxies];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageViews](self, "imageViews"));
    [v8 makeObjectsPerformSelector:"removeFromSuperview"];
    if ([v4 count])
    {
      id v9 = [v4 count];
      else {
        uint64_t v10 = (uint64_t)v9;
      }
      objc_initWeak(&location, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100007E94;
      v11[3] = &unk_1000FCED0;
      objc_copyWeak(&v15, &location);
      id v12 = v8;
      id v13 = v7;
      v14 = self;
      [v13 preloadImageCount:v10 withCompletionHandler:v11];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    else
    {
      -[TVHScrollingParadeImageView _stopAnimations](self, "_stopAnimations");
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (a3) {
      -[TVHScrollingParadeImageView _stopAnimations](self, "_stopAnimations");
    }
    else {
      -[TVHScrollingParadeImageView _startAnimations](self, "_startAnimations");
    }
  }

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHScrollingParadeImageView;
  -[TVHScrollingParadeImageView didMoveToWindow](&v7, "didMoveToWindow");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView window](self, "window"));
  if (v3
    && (id v4 = (void *)v3, v5 = -[TVHScrollingParadeImageView isPaused](self, "isPaused"), v4, (v5 & 1) == 0))
  {
    -[TVHScrollingParadeImageView _startAnimations](self, "_startAnimations");
  }

  else
  {
    dispatch_group_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView window](self, "window"));

    if (!v6) {
      -[TVHScrollingParadeImageView _stopAnimations](self, "_stopAnimations");
    }
  }

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHScrollingParadeImageView;
  -[TVHScrollingParadeImageView layoutSubviews](&v20, "layoutSubviews");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageViews](self, "imageViews", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
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
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        [v9 frame];
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

      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v5);
  }

  -[TVHScrollingParadeImageView _startAnimations](self, "_startAnimations");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView animationGroup](self, "animationGroup", a3, a4));
  dispatch_group_leave(v4);
}

- (void)_addImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 size];
    if (v6 > 0.0)
    {
      [v5 size];
      double v9 = v7 / v8;
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v10 bounds];
      double Height = CGRectGetHeight(v19);

      double v12 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  0.0,  0.0,  v9 * Height,  Height);
      CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v12, "layer"));
      [v13 setAllowsEdgeAntialiasing:1];
      [v13 setEdgeAntialiasingMask:15];
      -[UIImageView setImage:](v12, "setImage:", v5);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterMultiplyColor));
      [v14 setName:@"multiply"];
      id v15 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
      objc_msgSend(v14, "setValue:forKey:", objc_msgSend(v15, "CGColor"), @"inputColor");

      __int128 v18 = v14;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      [v13 setFilters:v16];

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageViews](self, "imageViews"));
      [v17 addObject:v12];

      -[TVHScrollingParadeImageView addSubview:](self, "addSubview:", v12);
    }
  }
}

- (void)_startAnimations
{
  v60.origin.x = CGRectZero.origin.x;
  v60.origin.y = CGRectZero.origin.y;
  v60.size.width = CGRectZero.size.width;
  v60.size.height = CGRectZero.size.height;
  if (!CGRectEqualToRect(v56, v60))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView window](self, "window"));

    if (v3)
    {
      if (!-[TVHScrollingParadeImageView isAnimating](self, "isAnimating")
        && !-[TVHScrollingParadeImageView isPaused](self, "isPaused"))
      {
        -[TVHScrollingParadeImageView setAnimating:](self, "setAnimating:", 1LL);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageViews](self, "imageViews"));
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v47,  "subarrayWithRange:",  0,  (_BYTE *)objc_msgSend(v47, "count")
                       - (_BYTE *)-[TVHScrollingParadeImageView additionalImageViewCount]( self,  "additionalImageViewCount")));
        id v5 = [v4 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v5)
        {
          uint64_t v6 = *(void *)v52;
          double v7 = 0.0;
          do
          {
            for (i = 0LL; i != v5; i = (char *)i + 1)
            {
              if (*(void *)v52 != v6) {
                objc_enumerationMutation(v4);
              }
              [*(id *)(*((void *)&v51 + 1) + 8 * (void)i) bounds];
              double v7 = v7 + CGRectGetWidth(v57);
            }

            id v5 = [v4 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }

          while (v5);
        }

        else
        {
          double v7 = 0.0;
        }

        +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
        id v45 = -[TVHScrollingParadeImageView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
        v46 = (char *)[v47 count];
        if (v46)
        {
          double v9 = 0LL;
          double v10 = 0.0;
          do
          {
            CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndex:v9]);
            [v11 bounds];
            double Width = CGRectGetWidth(v58);
            double v13 = floor(Width * 0.5);
            if (v45 == (id)1) {
              double v14 = v7 + v10 + Width;
            }
            else {
              double v14 = v10 + v13 - v7;
            }
            if (v45 == (id)1) {
              double v15 = v10 + Width;
            }
            else {
              double v15 = v10 + v13;
            }
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position.x"));
            [v16 setDelegate:self];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
            [v16 setFromValue:v17];

            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
            [v16 setToValue:v18];

            CGRect v19 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionLinear));
            [v16 setTimingFunction:v19];

            [v16 setDuration:v7 / 100.0];
            [v16 setFillMode:kCAFillModeForwards];
            [v16 setRemovedOnCompletion:0];
            objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
            [v20 addAnimation:v16 forKey:@"positionAnimation"];

            v21 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"filters.multiply.inputColor"));
            id v22 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
            objc_msgSend(v21, "setToValue:", objc_msgSend(v22, "CGColor"));

            LODWORD(v23) = 0;
            LODWORD(v24) = 1.0;
            LODWORD(v25) = 1051260355;
            LODWORD(v26) = 1059816735;
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v25,  v23,  v26,  v24));
            [v21 setTimingFunction:v27];

            double v28 = (v10 + -1272.0 + v13) / 100.0;
            [v21 setBeginTime:v28 + CACurrentMediaTime()];
            double v29 = (Width + 1272.0) * 0.5 / 100.0 * 0.5;
            [v21 setDuration:v29];
            [v21 setFillMode:kCAFillModeForwards];
            [v21 setRemovedOnCompletion:0];
            v30 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
            [v30 addAnimation:v21 forKey:@"undimmingAnimation"];

            v31 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"filters.multiply.inputColor"));
            id v32 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
            objc_msgSend(v31, "setFromValue:", objc_msgSend(v32, "CGColor"));

            id v33 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
            objc_msgSend(v31, "setToValue:", objc_msgSend(v33, "CGColor"));

            LODWORD(v34) = 0;
            LODWORD(v35) = 1.0;
            LODWORD(v36) = 1061997773;
            LODWORD(v37) = 1059816735;
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v36,  v34,  v37,  v35));
            [v31 setTimingFunction:v38];

            [v31 setBeginTime:v29 + v28 + CACurrentMediaTime()];
            [v31 setDuration:v29];
            [v31 setFillMode:kCAFillModeForwards];
            [v31 setRemovedOnCompletion:0];
            v39 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
            [v39 addAnimation:v31 forKey:@"dimmingAnimation"];

            [v11 frame];
            double v40 = CGRectGetWidth(v59);
            if (v45 == (id)1) {
              double v41 = -v40;
            }
            else {
              double v41 = v40;
            }
            v42 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView animationGroup](self, "animationGroup"));
            dispatch_group_enter(v42);

            double v10 = v10 + v41;
            ++v9;
          }

          while (v46 != v9);
        }

        +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageProxyLoader](self, "imageProxyLoader"));
        [v43 setPaused:0];

        objc_initWeak(&location, self);
        v44 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView animationGroup](self, "animationGroup"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100008C34;
        block[3] = &unk_1000FCEF8;
        objc_copyWeak(&v49, &location);
        dispatch_group_notify(v44, &_dispatch_main_q, block);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);
      }
    }
  }

- (void)_stopAnimations
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageProxyLoader](self, "imageProxyLoader"));
  [v3 setPaused:1];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScrollingParadeImageView imageViews](self, "imageViews", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) layer]);
        [v9 removeAnimationForKey:@"positionAnimation"];
        [v9 removeAnimationForKey:@"dimmingAnimation"];
        [v9 removeAnimationForKey:@"undimmingAnimation"];

        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (unint64_t)additionalImageViewCount
{
  return self->_additionalImageViewCount;
}

- (void)setAdditionalImageViewCount:(unint64_t)a3
{
  self->_additionalImageViewCount = a3;
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (OS_dispatch_group)animationGroup
{
  return self->_animationGroup;
}

- (void)setAnimationGroup:(id)a3
{
}

- (TVHImageProxyQueueLoader)imageProxyLoader
{
  return self->_imageProxyLoader;
}

- (void)setImageProxyLoader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end