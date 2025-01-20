@interface TVSSWaveformView
- (CALayer)contentLayer;
- (CALayer)fallbackLayer;
- (NSArray)bars;
- (NSString)remoteRouteSymbol;
- (NSTimer)transitionTimer;
- (TVSSWaveformData)waveformData;
- (TVSSWaveformSettings)settings;
- (TVSSWaveformView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (UIColor)fillColor;
- (UIView)barsContainerView;
- (UIView)barsView;
- (unint64_t)context;
- (void)applyContext:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setBars:(id)a3;
- (void)setBarsContainerView:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setFallbackLayer:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setRemoteRouteSymbol:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransitionTimer:(id)a3;
- (void)setWaveformData:(id)a3;
- (void)tintColorDidChange;
- (void)updateLayers;
- (void)updateVisualStyle;
@end

@implementation TVSSWaveformView

- (TVSSWaveformView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  CGRect v34 = a3;
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  v4 = v33;
  v33 = 0LL;
  v31.receiver = v4;
  v31.super_class = (Class)&OBJC_CLASS___TVSSWaveformView;
  v33 = -[TVSSWaveformView initWithFrame:]( &v31,  "initWithFrame:",  v34.origin.x,  v34.origin.y,  v34.size.width,  v34.size.height);
  objc_storeStrong((id *)&v33, v33);
  if (v33)
  {
    v33->_context = 0LL;
    v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.392156863);
    fillColor = v33->_fillColor;
    v33->_fillColor = v5;

    objc_storeStrong((id *)&v33->_settings, location[0]);
    v7 = (TVSSWaveformData *)+[TVSSWaveformData zero](&OBJC_CLASS___TVSSWaveformData, "zero");
    waveformData = v33->_waveformData;
    v33->_waveformData = v7;

    id v24 = -[TVSSWaveformView layer](v33, "layer");
    [v24 setMasksToBounds:1];

    v9 = objc_alloc_init(&OBJC_CLASS___CALayer);
    fallbackLayer = v33->_fallbackLayer;
    v33->_fallbackLayer = v9;

    v11 = -[UIColor CGColor](v33->_fillColor, "CGColor");
    -[CALayer setBackgroundColor:](v33->_fallbackLayer, "setBackgroundColor:", v11);
    -[CALayer setCompositingFilter:](v33->_fallbackLayer, "setCompositingFilter:", kCAFilterMultiplyBlendMode);
    -[CALayer setName:](v33->_fallbackLayer, "setName:", @"fallback");
    v12 = objc_alloc_init(&OBJC_CLASS___CALayer);
    contentLayer = v33->_contentLayer;
    v33->_contentLayer = v12;

    -[CALayer setShouldRasterize:](v33->_contentLayer, "setShouldRasterize:", 1LL);
    -[CALayer setRasterizationScale:](v33->_contentLayer, "setRasterizationScale:", 1.0);
    -[CALayer addSublayer:](v33->_contentLayer, "addSublayer:", v33->_fallbackLayer);
    v14 = objc_alloc_init(&OBJC_CLASS___UIView);
    barsContainerView = v33->_barsContainerView;
    v33->_barsContainerView = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___UIView);
    barsView = v33->_barsView;
    v33->_barsView = v16;

    id v25 = [location[0] stops];
    v26 = (char *)[v25 count] - 1;

    v30 = v26;
    v29 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v26);
    for (unint64_t i = 0LL; i < (unint64_t)v30; ++i)
    {
      v27 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      v21 = -[UIView layer](v27, "layer");
      -[CALayer setCornerCurve:](v21, "setCornerCurve:", kCACornerCurveContinuous);

      v22 = -[UIView layer](v27, "layer");
      -[CALayer setAllowsEdgeAntialiasing:](v22, "setAllowsEdgeAntialiasing:", 1LL);

      id v23 = -[TVSSWaveformView tintColor](v33, "tintColor");
      -[UIView setBackgroundColor:](v27, "setBackgroundColor:");

      -[NSMutableArray addObject:](v29, "addObject:", v27);
      -[UIView addSubview:](v33->_barsView, "addSubview:", v27);
      objc_storeStrong((id *)&v27, 0LL);
    }

    objc_storeStrong((id *)&v33->_bars, v29);
    v20 = -[UIView layer](v33->_barsContainerView, "layer");
    -[CALayer addSublayer:](v20, "addSublayer:", v33->_contentLayer);

    -[UIView addSubview:](v33->_barsContainerView, "addSubview:", v33->_barsView);
    -[TVSSWaveformView addSubview:](v33, "addSubview:", v33->_barsContainerView);
    -[TVSSWaveformView applyContext:](v33, "applyContext:", v33->_context);
    objc_storeStrong((id *)&v29, 0LL);
  }

  v19 = v33;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  return v19;
}

- (void)layoutSubviews
{
  v50 = self;
  SEL v49 = a2;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___TVSSWaveformView;
  -[TVSSWaveformView layoutSubviews](&v48, "layoutSubviews");
  -[TVSSWaveformView bounds](v50, "bounds");
  *(double *)&__int128 v46 = v2;
  *((double *)&v46 + 1) = v3;
  *(double *)&__int128 v47 = v4;
  *((double *)&v47 + 1) = v5;
  barsContainerView = v50->_barsContainerView;
  __int128 v44 = v46;
  __int128 v45 = v47;
  -[UIView setFrame:](barsContainerView, "setFrame:", v2, v3, v4, v5);
  -[TVSSWaveformView bounds](v50, "bounds");
  *(double *)&__int128 v42 = v7;
  *((double *)&v42 + 1) = v8;
  *(double *)&__int128 v43 = v9;
  *((double *)&v43 + 1) = v10;
  barsView = v50->_barsView;
  __int128 v40 = v42;
  __int128 v41 = v43;
  -[UIView setFrame:](barsView, "setFrame:", v7, v8, v9, v10);
  -[TVSSWaveformView bounds](v50, "bounds");
  CGRect v37 = v51;
  CGRect v52 = CGRectInset(v51, -1.0, -1.0);
  *(CGFloat *)&__int128 v38 = v52.origin.x;
  *((void *)&v38 + 1) = *(void *)&v52.origin.y;
  *(CGFloat *)&__int128 v39 = v52.size.width;
  *((void *)&v39 + 1) = *(void *)&v52.size.height;
  fallbackLayer = v50->_fallbackLayer;
  __int128 v35 = v38;
  __int128 v36 = v39;
  -[CALayer setFrame:](fallbackLayer, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
  -[TVSSWaveformView bounds](v50, "bounds");
  uint64_t v30 = v13;
  uint64_t v31 = v14;
  double v32 = v15;
  uint64_t v33 = v16;
  *(float *)&uint64_t v13 = v15;
  float v34 = *(float *)&v13 / (float)-[NSArray count](v50->_bars, "count");
  float v29 = (float)(v34 * 1.0) / 2.0;
  float v28 = v34 - v29;
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v25 = i;
    if (v25 >= -[NSArray count](v50->_bars, "count")) {
      break;
    }
    id v26 = -[NSArray objectAtIndexedSubscript:](v50->_bars, "objectAtIndexedSubscript:", i);
    double v23 = (float)(v29 / 2.0);
    id v24 = [v26 layer];
    [v24 setCornerRadius:v23];

    -[TVSSWaveformView bounds](v50, "bounds");
    CGRectGetMidY(v53);
    sub_10010394C();
    objc_msgSend(v26, "setCenter:", v17, v18);
    [v26 bounds];
    sub_100103978();
    objc_msgSend(v26, "setBounds:", v19, v20, v21, v22);
    objc_storeStrong(&v26, 0LL);
  }

  -[TVSSWaveformView setWaveformData:](v50, "setWaveformData:", v50->_waveformData);
}

  ;
}

  ;
}

- (void)tintColorDidChange
{
  double v8 = self;
  SEL v7 = a2;
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v4 = i;
    if (v4 >= -[NSArray count](v8->_bars, "count")) {
      break;
    }
    id v5 = -[NSArray objectAtIndexedSubscript:](v8->_bars, "objectAtIndexedSubscript:", i);
    id v2 = v5;
    id v3 = -[TVSSWaveformView tintColor](v8, "tintColor");
    objc_msgSend(v2, "setBackgroundColor:");

    objc_storeStrong(&v5, 0LL);
  }

- (void)setRemoteRouteSymbol:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v6->_remoteRouteSymbol != location[0]
    && (-[NSString isEqual:](v6->_remoteRouteSymbol, "isEqual:", location[0]) & 1) == 0)
  {
    id v3 = (NSString *)[location[0] copy];
    remoteRouteSymbol = v6->_remoteRouteSymbol;
    v6->_remoteRouteSymbol = v3;
  }

  objc_storeStrong(location, 0LL);
}

- (void)setFillColor:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[UIColor isEqual:](v5->_fillColor, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_fillColor, location[0]);
    id v3 = -[UIColor CGColor](v5->_fillColor, "CGColor");
    -[CALayer setBackgroundColor:](v5->_fallbackLayer, "setBackgroundColor:", v3);
  }

  objc_storeStrong(location, 0LL);
}

- (void)updateLayers
{
  v11 = self;
  v10[1] = (id)a2;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:");
  LODWORD(v2) = 1.0;
  -[CALayer setOpacity:](v11->_fallbackLayer, "setOpacity:", v2);
  -[NSTimer invalidate](v11->_transitionTimer, "invalidate");
  objc_storeStrong((id *)&v11->_transitionTimer, 0LL);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  double v8 = sub_100103D80;
  double v9 = &unk_1001B77B8;
  v10[0] = v11;
  id v3 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  0.5);
  transitionTimer = v11->_transitionTimer;
  v11->_transitionTimer = v3;

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  objc_storeStrong(v10, 0LL);
}

- (void)applyContext:(unint64_t)a3
{
  if (!a3)
  {
    -[UIView setAlpha:](self->_barsContainerView, "setAlpha:", 1.0);
    LODWORD(v3) = 0;
    -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v3);
  }

- (void)setWaveformData:(id)a3
{
  float v34 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v34->_waveformData, location[0]);
  -[TVSSWaveformView bounds](v34, "bounds");
  uint64_t v28 = v3;
  uint64_t v29 = v4;
  double v30 = v5;
  uint64_t v31 = v6;
  *(float *)&uint64_t v3 = v5;
  float v32 = *(float *)&v3 / (float)-[NSArray count](v34->_bars, "count");
  float v27 = (float)(v32 * 1.0) / 2.0;
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v19 = i;
    if (v19 >= -[NSArray count](v34->_bars, "count")) {
      break;
    }
    id v25 = -[NSArray objectAtIndexedSubscript:](v34->_bars, "objectAtIndexedSubscript:", i);
    id v16 = [location[0] amplitudes];
    id v15 = [v16 objectAtIndexedSubscript:i];
    [v15 floatValue];
    double v17 = v7;

    double v18 = v27;
    -[TVSSWaveformSettings xScaleMultiplier](v34->_settings, "xScaleMultiplier");
    double v24 = v18 + v8 * v17;
    -[TVSSWaveformView bounds](v34, "bounds");
    sub_100103978();
    double v20 = v9;
    double v21 = v10;
    double v22 = v11;
    double v23 = v12;
    id v13 = [v25 layer];
    objc_msgSend(v13, "setBounds:", v20, v21, v22, v23);

    id v14 = [v25 layer];
    [v14 setCornerRadius:v24 / 2.0];

    objc_storeStrong(&v25, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)updateVisualStyle
{
  id v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_bars;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
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
      uint64_t v3 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", v11);
      objc_msgSend(v2, "setBackgroundColor:");

      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }
}

- (TVSSWaveformData)waveformData
{
  return self->_waveformData;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (NSString)remoteRouteSymbol
{
  return self->_remoteRouteSymbol;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CALayer)fallbackLayer
{
  return self->_fallbackLayer;
}

- (void)setFallbackLayer:(id)a3
{
}

- (UIView)barsView
{
  return self->_barsView;
}

- (void)setBarsView:(id)a3
{
}

- (UIView)barsContainerView
{
  return self->_barsContainerView;
}

- (void)setBarsContainerView:(id)a3
{
}

- (NSArray)bars
{
  return self->_bars;
}

- (void)setBars:(id)a3
{
}

- (TVSSWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end