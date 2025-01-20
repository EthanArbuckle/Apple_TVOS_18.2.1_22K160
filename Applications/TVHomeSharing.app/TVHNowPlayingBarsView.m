@interface TVHNowPlayingBarsView
- (BOOL)canAnimate;
- (NSArray)barViews;
- (NSMutableDictionary)animators;
- (TVHNowPlayingBarsView)initWithFrame:(CGRect)a3;
- (unint64_t)internalState;
- (unint64_t)state;
- (void)_createAnimationForBarIndex:(unint64_t)a3;
- (void)_setInternalState:(unint64_t)a3;
- (void)_setSubviewsHidden:(BOOL)a3;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)_updateInternalState;
- (void)setCanAnimate:(BOOL)a3;
- (void)setInternalState:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)tintColorDidChange;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVHNowPlayingBarsView

- (TVHNowPlayingBarsView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVHNowPlayingBarsView;
  v3 = -[TVHNowPlayingBarsView initWithFrame:]( &v21,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVHNowPlayingBarsView tvh_setDebugLayoutColorType:](v3, "tvh_setDebugLayoutColorType:", 6LL);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    animators = v4->_animators;
    v4->_animators = v5;

    -[TVHNowPlayingBarsView bounds](v4, "bounds");
    double v8 = v7;
    double v10 = (v9 + -9.0) * 0.25;
    double v11 = v7 * 0.3;
    v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 4LL);
    unint64_t v13 = 0LL;
    double v14 = v8 - v11;
    do
    {
      v15 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  (v10 + 3.0) * (double)v13,  v14,  v10,  v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
      objc_msgSend(v16, "setAnchorPoint:", 0.5, 1.0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
      [v17 setCornerRadius:1.0];

      -[TVHNowPlayingBarsView addSubview:](v4, "addSubview:", v15);
      -[NSMutableArray addObject:](v12, "addObject:", v15);
      -[UIView setHidden:](v15, "setHidden:", 1LL);

      ++v13;
    }

    while (v13 != 4);
    v18 = (NSArray *)-[NSMutableArray copy](v12, "copy");
    barViews = v4->_barViews;
    v4->_barViews = v18;
  }

  return v4;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  -[TVHNowPlayingBarsView _updateInternalState](self, "_updateInternalState");
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHNowPlayingBarsView;
  -[TVHNowPlayingBarsView willMoveToWindow:](&v5, "willMoveToWindow:");
  -[TVHNowPlayingBarsView setCanAnimate:](self, "setCanAnimate:", a3 != 0LL);
  -[TVHNowPlayingBarsView _updateInternalState](self, "_updateInternalState");
}

- (void)tintColorDidChange
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHNowPlayingBarsView;
  -[TVHNowPlayingBarsView tintColorDidChange](&v13, "tintColorDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView tintColor](self, "tintColor"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView barViews](self, "barViews", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setBackgroundColor:v3];
        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)_updateInternalState
{
  if (-[TVHNowPlayingBarsView canAnimate](self, "canAnimate")) {
    unint64_t state = self->_state;
  }
  else {
    unint64_t state = 0LL;
  }
  -[TVHNowPlayingBarsView _setInternalState:](self, "_setInternalState:", state);
}

- (void)_setInternalState:(unint64_t)a3
{
  if (self->_internalState != a3)
  {
    if (a3 == 2)
    {
      -[TVHNowPlayingBarsView _stopAnimating](self, "_stopAnimating");
    }

    else
    {
      if (a3 != 1)
      {
        if (a3)
        {
LABEL_10:
          self->_internalState = a3;
          return;
        }

        -[TVHNowPlayingBarsView _stopAnimating](self, "_stopAnimating");
        uint64_t v5 = 1LL;
LABEL_9:
        -[TVHNowPlayingBarsView _setSubviewsHidden:](self, "_setSubviewsHidden:", v5);
        goto LABEL_10;
      }

      -[TVHNowPlayingBarsView _startAnimating](self, "_startAnimating");
    }

    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

- (void)_setSubviewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = self->_barViews;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setHidden:", v3, (void)v9);
        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }
}

- (void)_startAnimating
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView barViews](self, "barViews"));
  id v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0LL;
    do
    {
      -[TVHNowPlayingBarsView _createAnimationForBarIndex:](self, "_createAnimationForBarIndex:", v5++);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView barViews](self, "barViews"));
      id v7 = [v6 count];
    }

    while (v5 < (unint64_t)v7);
  }

- (void)_createAnimationForBarIndex:(unint64_t)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView barViews](self, "barViews"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView animators](self, "animators"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (v9 && [v9 state] == (id)1) {
    [v9 stopAnimation:1];
  }
  [v6 frame];
  CGFloat Width = CGRectGetWidth(v27);
  -[TVHNowPlayingBarsView bounds](self, "bounds");
  CGFloat Height = CGRectGetHeight(v28);
  __int128 v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006654C;
  v23[3] = &unk_1000FDBF0;
  id v13 = v6;
  id v24 = v13;
  CGFloat v25 = Width;
  CGFloat v26 = Height;
  double v14 = -[UIViewPropertyAnimator initWithDuration:dampingRatio:animations:]( v12,  "initWithDuration:dampingRatio:animations:",  v23,  2.0 / ((double)a3 + 1.0),  1.0);
  -[UIViewPropertyAnimator setScrubsLinearly:](v14, "setScrubsLinearly:", 0LL);
  objc_initWeak(&location, self);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100066780;
  v20 = &unk_1000FED60;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  -[UIViewPropertyAnimator addCompletion:](v14, "addCompletion:", &v17);
  -[UIViewPropertyAnimator startAnimation](v14, "startAnimation", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView animators](self, "animators"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v15 setObject:v14 forKey:v16];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)_stopAnimating
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView animators](self, "animators"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v10 = [v9 integerValue];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_barViews, "objectAtIndex:", v10));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView animators](self, "animators"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v9]);

        if ([v13 state] == (id)1) {
          [v13 stopAnimation:1];
        }
        double v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100066A1C;
        v19[3] = &unk_1000FCDB8;
        id v20 = v11;
        objc_super v21 = self;
        id v15 = v11;
        v16 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v14,  "initWithDuration:curve:animations:",  2LL,  v19,  0.35);

        -[UIViewPropertyAnimator startAnimation](v16, "startAnimation");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsView animators](self, "animators"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
        [v17 setObject:v16 forKey:v18];
      }

      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v6);
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NSArray)barViews
{
  return self->_barViews;
}

- (NSMutableDictionary)animators
{
  return self->_animators;
}

- (BOOL)canAnimate
{
  return self->_canAnimate;
}

- (void)setCanAnimate:(BOOL)a3
{
  self->_canAnimate = a3;
}

- (unint64_t)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(unint64_t)a3
{
  self->_internalState = a3;
}

- (void).cxx_destruct
{
}

@end