@interface VOTUIMapsExplorationRotaryView
- (NSMutableArray)segmentViews;
- (VOTUIMapsExplorationRotaryView)initWithFrame:(CGRect)a3 atCenter:(CGPoint)a4;
- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4;
- (id)_segmentImageFrom:(double)a3 to:(double)a4;
- (void)addSubviewsFromExplorationSegments:(id)a3;
- (void)handleHighlightChangeWithLastIndex:(int64_t)a3 andNewIndex:(int64_t)a4;
- (void)setSegmentViews:(id)a3;
@end

@implementation VOTUIMapsExplorationRotaryView

- (VOTUIMapsExplorationRotaryView)initWithFrame:(CGRect)a3 atCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTUIMapsExplorationRotaryView;
  v6 = -[VOTUIMapsExplorationRotaryView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v7 = v6;
  if (v6)
  {
    -[VOTUIMapsExplorationRotaryView setCenter:](v6, "setCenter:", x, y);
    v8 = v7;
  }

  return v7;
}

- (void)addSubviewsFromExplorationSegments:(id)a3
{
  id v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationRotaryView segmentViews](self, "segmentViews"));
  [v4 makeObjectsPerformSelector:"removeFromSuperview"];

  v6 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
  -[VOTUIMapsExplorationRotaryView setSegmentViews:](self, "setSegmentViews:", v6);

  v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  v9 = (char *)[v23 count];
  if ((uint64_t)v9 >= 1)
  {
    objc_super v10 = v9;
    for (i = 0LL; i != v10; ++i)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:i]);
      v13 = objc_alloc(&OBJC_CLASS___UIImageView);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      [v14 floatValue];
      double v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
      [v17 floatValue];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationRotaryView _segmentImageFrom:to:](self, "_segmentImageFrom:to:", v16, v18));
      v20 = -[UIImageView initWithImage:](v13, "initWithImage:", v19);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v20,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[UIImageView setAlpha:](v20, "setAlpha:", 0.300000012);
      -[UIImageView setClipsToBounds:](v20, "setClipsToBounds:", 0LL);
      -[VOTUIMapsExplorationRotaryView addSubview:](self, "addSubview:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationRotaryView segmentViews](self, "segmentViews"));
      [v21 addObject:v20];

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIMapsExplorationRotaryView _constraintsToCenterItem:withItem:]( self,  "_constraintsToCenterItem:withItem:",  v20,  self));
      [v8 addObjectsFromArray:v22];
    }
  }

  -[VOTUIMapsExplorationRotaryView addConstraints:](self, "addConstraints:", v8);
}

- (id)_segmentImageFrom:(double)a3 to:(double)a4
{
  double v8 = v7;
  -[VOTUIMapsExplorationRotaryView frame](self, "frame");
  double v10 = v9;
  float v11 = a3;
  __float2 v12 = __sincosf_stret(v11);
  double v39 = v10 + (float)(v12.__sinval * 50.0);
  double v40 = v8 + (float)(v12.__cosval * 50.0);
  float v13 = a4;
  __float2 v14 = __sincosf_stret(v13);
  double v15 = (a4 - a3) * 0.5;
  float v16 = v15;
  double v41 = (float)(tanf(v16) * 50.0);
  float v17 = v15;
  double v18 = (float)(50.0 / cosf(v17));
  float v19 = v15 + a3;
  __float2 v20 = __sincosf_stret(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v21 scale];
  CGFloat v23 = v22;
  v43.width = v8 + v8;
  v43.height = v10 + v10;
  UIGraphicsBeginImageContextWithOptions(v43, 0, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  objc_msgSend(v24, "moveToPoint:", v40, v39);
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10);
  objc_msgSend(v24, "addLineToPoint:", v8 + (float)(v14.__cosval * 50.0), v10 + (float)(v14.__sinval * 50.0));
  objc_msgSend( v24,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v8 + v18 * v20.__cosval,  v10 + v18 * v20.__sinval,  v41,  0.0,  6.28318531);
  objc_msgSend(v24, "addLineToPoint:", v40, v39);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CurrentContext = UIGraphicsGetCurrentContext();
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor"));
  id v28 = objc_claimAutoreleasedReturnValue([v27 colorWithAlphaComponent:1.0]);
  id v29 = [v28 CGColor];
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v31 = objc_claimAutoreleasedReturnValue([v30 colorWithAlphaComponent:0.0]);
  v32 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  v29,  [v31 CGColor],  0));

  *(_OWORD *)locations = xmmword_1BB70;
  v33 = CGGradientCreateWithColors(DeviceRGB, v32, locations);
  CGContextSaveGState(CurrentContext);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 colorWithAlphaComponent:0.0]);
  [v35 set];

  [v24 fill];
  [v24 addClip];
  v44.double x = v8;
  v44.double y = v10;
  v45.double x = v8;
  v45.double y = v10;
  CGContextDrawRadialGradient(CurrentContext, v33, v44, 0.0, v45, 450.0, 2u);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v37 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v33);
  UIGraphicsEndImageContext();

  return v37;
}

- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  9LL,  0LL,  v5,  9LL,  1.0,  0.0));
  v11[0] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  10LL,  0LL,  v5,  10LL,  1.0,  0.0));

  v11[1] = v8;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  return v9;
}

- (void)handleHighlightChangeWithLastIndex:(int64_t)a3 andNewIndex:(int64_t)a4
{
  if (a3 != -1)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationRotaryView segmentViews](self, "segmentViews"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:a3]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_12BA4;
    v15[3] = &unk_247D0;
    id v16 = v8;
    id v9 = v8;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v15, 0.5);
  }

  if (a4 != -1)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationRotaryView segmentViews](self, "segmentViews"));
    float v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:a4]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_12BB4;
    v13[3] = &unk_247D0;
    id v14 = v11;
    id v12 = v11;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v13, 0.5);
  }

- (NSMutableArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end