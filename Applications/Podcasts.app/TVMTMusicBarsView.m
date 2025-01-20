@interface TVMTMusicBarsView
- (TVMTMusicBarsView)initWithFrame:(CGRect)a3;
- (id)_createBarViews;
- (unint64_t)musicBarsStyle;
- (void)_addAnimations;
- (void)_addAnimationsWithRepeatCount:(float)a3;
- (void)_removeAnimations;
- (void)_setBarHeights:(double)a3;
- (void)_updateMusicBarsStyle;
- (void)resumeAnimating;
- (void)setMusicBarsStyle:(unint64_t)a3;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVMTMusicBarsView

- (TVMTMusicBarsView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMTMusicBarsView;
  v3 = -[TVMTMusicBarsView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMTMusicBarsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTMusicBarsView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TVMTMusicBarsView _createBarViews](v3, "_createBarViews"));
    barViews = v3->_barViews;
    v3->_barViews = (NSArray *)v6;

    -[TVMTMusicBarsView setMusicBarsStyle:](v3, "setMusicBarsStyle:", 0LL);
    v3->_repeatCount = INFINITY;
  }

  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    *(float *)&double v5 = self->_repeatCount;
    -[TVMTMusicBarsView _addAnimationsWithRepeatCount:](self, "_addAnimationsWithRepeatCount:", v5);
  }

- (void)stopAnimating
{
  if (self->_repeatCount == INFINITY)
  {
    -[TVMTMusicBarsView _removeAnimations](self, "_removeAnimations");
    LODWORD(v3) = 1.0;
    -[TVMTMusicBarsView _addAnimationsWithRepeatCount:](self, "_addAnimationsWithRepeatCount:", v3);
    -[TVMTMusicBarsView frame](self, "frame");
    -[TVMTMusicBarsView _setBarHeights:](self, "_setBarHeights:", v4 * 0.3);
  }

- (void)resumeAnimating
{
  if (self->_repeatCount != INFINITY)
  {
    -[TVMTMusicBarsView _removeAnimations](self, "_removeAnimations");
    -[TVMTMusicBarsView frame](self, "frame");
    -[TVMTMusicBarsView _setBarHeights:](self, "_setBarHeights:", v3);
    -[TVMTMusicBarsView _addAnimations](self, "_addAnimations");
  }

- (void)setMusicBarsStyle:(unint64_t)a3
{
  self->_musicBarsStyle = a3;
  -[TVMTMusicBarsView _updateMusicBarsStyle](self, "_updateMusicBarsStyle");
}

- (void)_updateMusicBarsStyle
{
  unint64_t musicBarsStyle = self->_musicBarsStyle;
  if (!musicBarsStyle)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
    id v6 = [v5 userInterfaceStyle];

    if (v6 == (id)2) {
      unint64_t musicBarsStyle = 1LL;
    }
    else {
      unint64_t musicBarsStyle = 2LL;
    }
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v7 = self->_barViews;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v19 = kCAFilterPlusD;
    uint64_t v11 = kCAFilterPlusL;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (musicBarsStyle == 2)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
          [v13 setBackgroundColor:v17];

          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 layer]);
          uint64_t v16 = v19;
        }

        else
        {
          if (musicBarsStyle != 1) {
            continue;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
          [v13 setBackgroundColor:v14];

          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 layer]);
          uint64_t v16 = v11;
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v16));
        [v15 setCompositingFilter:v18];
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v9);
  }
}

- (unint64_t)musicBarsStyle
{
  return self->_musicBarsStyle;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTMusicBarsView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7 && !-[TVMTMusicBarsView musicBarsStyle](self, "musicBarsStyle")) {
    -[TVMTMusicBarsView _updateMusicBarsStyle](self, "_updateMusicBarsStyle");
  }
}

- (void)_setBarHeights:(double)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  double v5 = self->_barViews;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "frame", (void)v16);
        double v12 = v11;
        double v14 = v13;
        -[TVMTMusicBarsView frame](self, "frame");
        objc_msgSend(v10, "setFrame:", v12, v15 - a3, v14, a3);
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v7);
  }
}

- (id)_createBarViews
{
  double v4 = v3;
  double v6 = (v5 + -6.0) / 3.0;
  int v7 = 3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  double v9 = 0.0;
  do
  {
    uint64_t v10 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  (v6 + 3.0) * v9,  v4 * 0.5,  v6,  v4);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v10, "layer"));
    objc_msgSend(v11, "setAnchorPoint:", 0.5, 1.0);

    -[TVMTMusicBarsView addSubview:](self, "addSubview:", v10);
    [v8 addObject:v10];

    double v9 = v9 + 1.0;
    --v7;
  }

  while (v7);
  id v12 = [v8 copy];

  return v12;
}

- (void)_addAnimations
{
  LODWORD(v2) = 2139095040;
  -[TVMTMusicBarsView _addAnimationsWithRepeatCount:](self, "_addAnimationsWithRepeatCount:", v2);
}

- (void)_removeAnimations
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  double v2 = self->_barViews;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      double v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "layer", (void)v8));
        [v7 removeAllAnimations];

        double v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v4);
  }
}

- (void)_addAnimationsWithRepeatCount:(float)a3
{
  barViews = self->_barViews;
  if (!barViews) {
    sub_10017C638();
  }
  if (-[NSArray count](barViews, "count"))
  {
    uint64_t v6 = 0LL;
    do
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_barViews, "objectAtIndexedSubscript:", v6));
      __int128 v8 = objc_opt_new(&OBJC_CLASS___CAKeyframeAnimation);
      [v7 bounds];
      double v10 = v9;
      double v12 = v11;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, 0.0));
      v21[0] = v13;
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, 0.0, v10, v12));
      v21[1] = v14;
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  0.0,  0.0,  v10,  v12 * 5.0 / 12.0));
      v21[2] = v15;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));

      -[CAKeyframeAnimation setKeyPath:](v8, "setKeyPath:", @"bounds");
      -[CAKeyframeAnimation setValues:](v8, "setValues:", v16);
      -[CAKeyframeAnimation setKeyTimes:](v8, "setKeyTimes:", &off_1002552D8);
      -[CAKeyframeAnimation setDuration:](v8, "setDuration:", 1.0);
      *(float *)&double v17 = (float)v6 + 1.0;
      -[CAKeyframeAnimation setSpeed:](v8, "setSpeed:", v17);
      *(float *)&double v18 = a3;
      -[CAKeyframeAnimation setRepeatCount:](v8, "setRepeatCount:", v18);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BarAnimation_%ld",  ++v6));
      [v19 addAnimation:v8 forKey:v20];
    }

    while (v6 < -[NSArray count](self->_barViews, "count"));
  }

  self->_repeatCount = a3;
}

- (void).cxx_destruct
{
}

@end