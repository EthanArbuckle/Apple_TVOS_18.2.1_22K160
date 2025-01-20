@interface TVNPRoutingMusicBarsView
- (BOOL)canAnimate;
- (NSArray)barViews;
- (TVNPRoutingMusicBarsView)initWithFrame:(CGRect)a3;
- (unint64_t)internalState;
- (unint64_t)state;
- (void)_addAnimationsWithRepeatCount:(float)a3;
- (void)_removeAnimations;
- (void)_setBarHeights:(double)a3;
- (void)_setSubviewsHidden:(BOOL)a3;
- (void)_updateInternalState;
- (void)setCanAnimate:(BOOL)a3;
- (void)setInternalState:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)tintColorDidChange;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVNPRoutingMusicBarsView

- (TVNPRoutingMusicBarsView)initWithFrame:(CGRect)a3
{
  CGRect v28 = a3;
  SEL v26 = a2;
  v27 = 0LL;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVNPRoutingMusicBarsView;
  v19 = -[TVNPRoutingMusicBarsView initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v27 = v19;
  objc_storeStrong((id *)&v27, v19);
  if (v19)
  {
    -[TVNPRoutingMusicBarsView bounds](v27, "bounds");
    v22[2] = v3;
    v22[3] = v4;
    *(double *)&__int128 v23 = v5;
    *((void *)&v23 + 1) = v6;
    __int128 v24 = v23;
    *(double *)&v22[1] = (v5 - 9.0) / 4.0;
    v22[0] = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 4LL);
    for (int i = 0; i < 4; ++i)
    {
      v17 = objc_alloc(&OBJC_CLASS___UIView);
      sub_35CA0();
      v20 = -[UIView initWithFrame:](v17, "initWithFrame:", v7, v8, v9, v10);
      v18 = -[UIView layer](v20, "layer");
      sub_35CEC();
      -[CALayer setAnchorPoint:](v18, "setAnchorPoint:", v11, v12);

      -[TVNPRoutingMusicBarsView addSubview:](v27, "addSubview:", v20);
      [v22[0] addObject:v20];
      -[UIView setHidden:](v20, "setHidden:", 1LL);
      objc_storeStrong((id *)&v20, 0LL);
    }

    v13 = (NSArray *)[v22[0] copy];
    barViews = v27->_barViews;
    v27->_barViews = v13;

    objc_storeStrong(v22, 0LL);
  }

  v16 = v27;
  objc_storeStrong((id *)&v27, 0LL);
  return v16;
}

  ;
}

  ;
}

- (void)willMoveToWindow:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVNPRoutingMusicBarsView;
  -[TVNPRoutingMusicBarsView willMoveToWindow:](&v3, "willMoveToWindow:", location[0]);
  v5->_canAnimate = location[0] != 0LL;
  -[TVNPRoutingMusicBarsView _updateInternalState](v5, "_updateInternalState");
  objc_storeStrong(location, 0LL);
}

- (void)tintColorDidChange
{
  v14 = self;
  SEL v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVNPRoutingMusicBarsView;
  -[TVNPRoutingMusicBarsView tintColorDidChange](&v12, "tintColorDidChange");
  memset(__b, 0, sizeof(__b));
  obj = v14->_barViews;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(__b[1] + 8 * v6);
      id v3 = -[TVNPRoutingMusicBarsView tintColor](v14, "tintColor", v11);
      objc_msgSend(v2, "setBackgroundColor:");

      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  -[TVNPRoutingMusicBarsView _updateInternalState](self, "_updateInternalState");
}

- (void)setInternalState:(unint64_t)a3
{
  if (self->_internalState != a3)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        -[TVNPRoutingMusicBarsView _removeAnimations](self, "_removeAnimations");
        -[TVNPRoutingMusicBarsView frame](self, "frame");
        -[TVNPRoutingMusicBarsView _setBarHeights:](self, "_setBarHeights:", v3);
        LODWORD(v4) = 2139095040;
        -[TVNPRoutingMusicBarsView _addAnimationsWithRepeatCount:](self, "_addAnimationsWithRepeatCount:", v4);
        -[TVNPRoutingMusicBarsView _setSubviewsHidden:](self, "_setSubviewsHidden:", 0LL);
      }

      else if (a3 == 2)
      {
        -[TVNPRoutingMusicBarsView _setSubviewsHidden:](self, "_setSubviewsHidden:", 0LL);
        -[TVNPRoutingMusicBarsView _removeAnimations](self, "_removeAnimations");
        if (self->_internalState == 1)
        {
          LODWORD(v5) = 1.0;
          -[TVNPRoutingMusicBarsView _addAnimationsWithRepeatCount:](self, "_addAnimationsWithRepeatCount:", v5);
        }

        -[TVNPRoutingMusicBarsView frame](self, "frame", self);
        [v7 _setBarHeights:v6 * 0.3];
      }
    }

    else
    {
      -[TVNPRoutingMusicBarsView _removeAnimations](self, "_removeAnimations");
      -[TVNPRoutingMusicBarsView _setSubviewsHidden:](self, "_setSubviewsHidden:", 1LL);
    }

    self->_internalState = a3;
  }

- (void)_updateInternalState
{
  if (self->_canAnimate) {
    unint64_t state = self->_state;
  }
  else {
    unint64_t state = 0LL;
  }
  -[TVNPRoutingMusicBarsView setInternalState:](self, "setInternalState:", state);
}

- (void)_setSubviewsHidden:(BOOL)a3
{
  SEL v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  memset(__b, 0, sizeof(__b));
  obj = v13->_barViews;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 setHidden:v11];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)_setBarHeights:(double)a3
{
  v19 = self;
  SEL v18 = a2;
  double v17 = a3;
  memset(__b, 0, sizeof(__b));
  obj = v19->_barViews;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v20,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v8);
      [v16 frame];
      double v12 = v3;
      double v13 = v4;
      double v14 = v17;
      -[TVNPRoutingMusicBarsView frame](v19, "frame");
      objc_msgSend(v16, "setFrame:", v12, v5 - v17, v13, v14);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v20,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }
}

- (void)_addAnimationsWithRepeatCount:(float)a3
{
  double v12 = self;
  SEL v11 = a2;
  float v10 = a3;
  barViews = self->_barViews;
  double v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_36654;
  uint64_t v8 = &unk_51200;
  float v9 = a3;
  -[NSArray enumerateObjectsUsingBlock:](barViews, "enumerateObjectsUsingBlock:", &v4);
}

- (void)_removeAnimations
{
  double v12 = self;
  SEL v11 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v12->_barViews;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v13,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      id v2 = [v10 layer];
      [v2 removeAllAnimations];

      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v13,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (unint64_t)state
{
  return self->_state;
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

- (NSArray)barViews
{
  return self->_barViews;
}

- (void).cxx_destruct
{
}

@end