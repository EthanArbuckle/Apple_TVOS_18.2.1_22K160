@interface AXTouchAccommodationsViewController
- (BOOL)_canShowWhileLocked;
- (CGPath)_drawFullCircleWithRadius:(double)a3;
- (id)_createLayerAtPoint:(CGPoint)a3;
- (id)_createProgressLayerWithColor:(id)a3 withFilterName:(id)a4 forHoldDuration:(BOOL)a5;
- (id)_createTransformLayerForHoldDuration:(BOOL)a3;
- (void)removeAllHandTouchMarkers;
- (void)resetProgressTrackOfHandTouchMarkerAtPoints:(id)a3;
- (void)updateLocationOfHandTouchMarkerAtPoints:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTouchAccommodationsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTouchAccommodationsViewController;
  -[AXTouchAccommodationsViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  -[AXTouchAccommodationsViewController setView:](self, "setView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
  [v6 setUserInteractionEnabled:0];
}

- (void)resetProgressTrackOfHandTouchMarkerAtPoints:(id)a3
{
  id v24 = a3;
  -[AXTouchAccommodationsViewController updateLocationOfHandTouchMarkerAtPoints:]( self,  "updateLocationOfHandTouchMarkerAtPoints:");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CATransformLayer sublayers](self->_transformLayer, "sublayers"));
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    objc_super v7 = 0LL;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        unsigned int v12 = [v11 isEqualToString:@"tapAssistanceProgressTrack"];

        if (v12)
        {
          id v13 = v10;

          objc_super v7 = v13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v6);
  }

  else
  {
    objc_super v7 = 0LL;
  }

  [v7 removeFromSuperlayer];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v15 = (char *)[v14 touchAccommodationsTapActivationMethod];

  if (v15 == (_BYTE *)&dword_0 + 2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v16 touchAccommodationsTapActivationTimeout];
    double v18 = v17;

    if (v18 <= 0.289999992)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      v21 = self;
      v22 = v19;
      uint64_t v20 = 0LL;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      uint64_t v20 = kCAFilterNormalBlendMode;
      v21 = self;
      v22 = v19;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsViewController _createProgressLayerWithColor:withFilterName:forHoldDuration:]( v21,  "_createProgressLayerWithColor:withFilterName:forHoldDuration:",  v22,  v20,  0LL));

    [v23 setName:@"tapAssistanceProgressTrack"];
    -[CATransformLayer addSublayer:](self->_transformLayer, "addSublayer:", v23);
  }
}

- (void)updateLocationOfHandTouchMarkerAtPoints:(id)a3
{
  id v33 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sublayers]);
  objc_super v7 = [v6 count];
  uint64_t v8 = [v33 count];

  id v9 = [v33 count];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sublayers]);
  id v13 = [v12 count];

  if (v9 < v13)
  {
    int64_t v14 = v7 - v8;
    if (v7 - v8 >= 1)
    {
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
        double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sublayers]);
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastObject]);
        [v18 removeFromSuperlayer];

        --v14;
      }

      while (v14);
    }
  }

  if ([v33 count])
  {
    unint64_t v19 = 0LL;
    do
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 layer]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sublayers]);
      id v23 = [v22 count];

      if ((unint64_t)v23 <= v19)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 layer]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v19]);
        [v31 CGPointValue];
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController _createLayerAtPoint:](self, "_createLayerAtPoint:"));
        [v30 addSublayer:v32];
      }

      else
      {
        +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
        +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sublayers]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndex:v19]);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v19]);
        [v28 CGPointValue];
        objc_msgSend(v27, "setPosition:");

        +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
        +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 0LL);
      }

      ++v19;
    }

    while ((unint64_t)[v33 count] > v19);
  }
}

- (id)_createLayerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v7 = [v6 touchAccommodationsHoldDurationEnabled];

  if (v7)
  {
    uint64_t v8 = self;
    uint64_t v9 = 1LL;
LABEL_5:
    unsigned int v12 = (CATransformLayer *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsViewController _createTransformLayerForHoldDuration:]( v8,  "_createTransformLayerForHoldDuration:",  v9));
    transformLayer = self->_transformLayer;
    self->_transformLayer = v12;

    goto LABEL_6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v11 = [v10 touchAccommodationsTapActivationMethod];

  if (v11)
  {
    uint64_t v8 = self;
    uint64_t v9 = 0LL;
    goto LABEL_5;
  }

- (id)_createTransformLayerForHoldDuration:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CATransformLayer layer](&OBJC_CLASS___CATransformLayer, "layer"));
  id v6 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  -[CAShapeLayer setPath:]( v6,  "setPath:",  -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 50.0));
  -[CAShapeLayer setName:](v6, "setName:", @"shapeLayerDisc");
  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  -[CAShapeLayer setPath:]( v7,  "setPath:",  -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 5.0));
  -[CAShapeLayer setName:](v7, "setName:", @"shapeLayerDot");
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  -[CAShapeLayer setPath:]( v8,  "setPath:",  -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 45.0));
  id v9 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[CAShapeLayer setFillColor:](v8, "setFillColor:", [v9 CGColor]);

  -[CAShapeLayer setLineWidth:](v8, "setLineWidth:", 2.5);
  -[CAShapeLayer setName:](v8, "setName:", @"shapeLayerEmptyTrack");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v11 = v10;
  if (v3)
  {
    [v10 touchAccommodationsHoldDuration];
    double v13 = v12;

    if (v13 <= 0.289999992)
    {
      id v14 = 0LL;
      double v15 = 0.0;
      double v16 = 0.0;
    }

    else
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[CAFilter filterWithType:]( &OBJC_CLASS___CAFilter,  "filterWithType:",  kCAFilterPlusD));
      double v15 = 0.25;
      double v16 = 0.300000012;
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  v15));
    id v19 = v14;
    double v20 = v16;
  }

  else
  {
    [v10 touchAccommodationsTapActivationTimeout];
    double v18 = v17;

    if (v18 <= 0.289999992)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      id v14 = 0LL;
      id v19 = 0LL;
      double v16 = 0.0;
      double v20 = 0.0;
    }

    else
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
      double v20 = 0.5;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  0.5));
      id v14 = 0LL;
      double v16 = 0.300000012;
    }
  }

  id v22 = v21;
  -[CAShapeLayer setStrokeColor:](v8, "setStrokeColor:", [v22 CGColor]);

  id v23 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v20));
  -[CAShapeLayer setFillColor:](v6, "setFillColor:", [v23 CGColor]);

  -[CAShapeLayer setCompositingFilter:](v6, "setCompositingFilter:", v19);
  id v24 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v16));
  -[CAShapeLayer setFillColor:](v7, "setFillColor:", [v24 CGColor]);

  -[CAShapeLayer setCompositingFilter:](v7, "setCompositingFilter:", v19);
  -[CAShapeLayer setCompositingFilter:](v8, "setCompositingFilter:", v14);
  [v5 addSublayer:v6];
  [v5 addSublayer:v7];
  [v5 addSublayer:v8];

  return v5;
}

- (id)_createProgressLayerWithColor:(id)a3 withFilterName:(id)a4 forHoldDuration:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  -[CAShapeLayer setPosition:](v10, "setPosition:", CGPointZero.x, CGPointZero.y);
  -[CAShapeLayer setPath:]( v10,  "setPath:",  -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 45.0));
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_3614;
  v25[3] = &unk_C498;
  BOOL v26 = v5;
  v25[4] = self;
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v25);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v13 = v12;
  if (v5)
  {
    [v12 touchAccommodationsHoldDuration];
    double v15 = v14 + -0.100000001;
  }

  else
  {
    unsigned int v16 = [v12 touchAccommodationsHoldDurationEnabled];

    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v13 touchAccommodationsTapActivationTimeout];
    if (!v16) {
      double v15 = v15 + -0.100000001;
    }
  }

  [v11 setDuration:v15];

  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  [v11 setFromValue:v17];

  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v11 setToValue:v18];

  -[CAShapeLayer addAnimation:forKey:](v10, "addAnimation:forKey:", v11, @"drawCircleAnimation");
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  id v19 = v9;
  id v20 = [v19 CGColor];

  -[CAShapeLayer setStrokeColor:](v10, "setStrokeColor:", v20);
  id v21 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[CAShapeLayer setFillColor:](v10, "setFillColor:", [v21 CGColor]);

  if (v8)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v8));
    -[CAShapeLayer setCompositingFilter:](v10, "setCompositingFilter:", v22);
  }

  else
  {
    -[CAShapeLayer setCompositingFilter:](v10, "setCompositingFilter:", 0LL);
  }

  -[CAShapeLayer setLineWidth:](v10, "setLineWidth:", 2.5);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v23 scale];
  -[CAShapeLayer setContentsScale:](v10, "setContentsScale:");

  return v10;
}

- (CGPath)_drawFullCircleWithRadius:(double)a3
{
  id v3 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1LL, CGPointZero.x, CGPointZero.y, a3, -1.57079633, 4.71238898));
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

- (void)removeAllHandTouchMarkers
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsViewController view](self, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sublayers]);
  [v3 makeObjectsPerformSelector:"removeFromSuperlayer"];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end