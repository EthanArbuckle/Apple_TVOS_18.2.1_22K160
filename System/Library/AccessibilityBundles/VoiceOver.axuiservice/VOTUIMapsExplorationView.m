@interface VOTUIMapsExplorationView
- (CGPoint)currentCenter;
- (CGPoint)currentLocation;
- (CGPoint)lastLocation;
- (VOTUIMapsExplorationLocationView)currentLocationView;
- (VOTUIMapsExplorationRotaryView)currentRotaryView;
- (VOTUIMapsExplorationView)init;
- (int64_t)currentIndex;
- (int64_t)lastIndex;
- (void)highlightExplorationSegmentWithIndex:(int64_t)a3;
- (void)setCurrentCenter:(CGPoint)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setCurrentLocation:(CGPoint)a3;
- (void)setCurrentLocationView:(id)a3;
- (void)setCurrentRotaryView:(id)a3;
- (void)setLastIndex:(int64_t)a3;
- (void)setLastLocation:(CGPoint)a3;
- (void)updateUIWithCenter:(CGPoint)a3;
- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4;
- (void)updateUIWithCurrentLocation:(CGPoint)a3;
@end

@implementation VOTUIMapsExplorationView

- (VOTUIMapsExplorationView)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTUIMapsExplorationView;
  v2 = -[VOTUIMapsExplorationView init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastIndex = -1LL;
    v2->_currentIndex = -1LL;
    CGPoint v4 = CGPointZero;
    v2->_currentLocation = CGPointZero;
    v2->_lastLocation = v4;
    id v5 = -[VOTUIMapsExplorationView currentRotaryView](v2, "currentRotaryView");
    id v6 = -[VOTUIMapsExplorationView currentLocationView](v3, "currentLocationView");
  }

  return v3;
}

- (VOTUIMapsExplorationLocationView)currentLocationView
{
  currentLocationView = self->_currentLocationView;
  if (!currentLocationView)
  {
    CGPoint v4 = -[VOTUIMapsExplorationLocationView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTUIMapsExplorationLocationView),  "initWithFrame:",  0.0,  0.0,  40.0,  40.0);
    -[VOTUIMapsExplorationView currentLocation](self, "currentLocation");
    -[VOTUIMapsExplorationLocationView setCenter:](v4, "setCenter:");
    id v5 = self->_currentLocationView;
    self->_currentLocationView = v4;
    id v6 = v4;

    -[VOTUIMapsExplorationView addSubview:](self, "addSubview:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentLocationView](self, "currentLocationView"));
    [v7 setAlpha:0.0];

    currentLocationView = self->_currentLocationView;
  }

  return currentLocationView;
}

- (VOTUIMapsExplorationRotaryView)currentRotaryView
{
  currentRotaryView = self->_currentRotaryView;
  if (!currentRotaryView)
  {
    CGPoint v4 = objc_alloc(&OBJC_CLASS___VOTUIMapsExplorationRotaryView);
    -[VOTUIMapsExplorationView currentLocation](self, "currentLocation");
    v7 = -[VOTUIMapsExplorationRotaryView initWithFrame:atCenter:]( v4,  "initWithFrame:atCenter:",  0.0,  0.0,  900.0,  900.0,  v5,  v6);
    objc_super v8 = self->_currentRotaryView;
    self->_currentRotaryView = v7;
    v9 = v7;

    -[VOTUIMapsExplorationView addSubview:](self, "addSubview:", v9);
    currentRotaryView = self->_currentRotaryView;
  }

  return currentRotaryView;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_lastIndex = self->_currentIndex;
  self->_currentIndex = a3;
}

- (void)setCurrentLocation:(CGPoint)a3
{
  self->_lastLocation = self->_currentLocation;
  self->_currentLocation = a3;
}

- (void)updateUIWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTUIMapsExplorationView setCurrentCenter:](self, "setCurrentCenter:");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentRotaryView](self, "currentRotaryView"));
  objc_msgSend(v6, "setCenter:", x, y);
}

- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[VOTUIMapsExplorationView setLastIndex:](self, "setLastIndex:", -1LL);
  -[VOTUIMapsExplorationView setCurrentIndex:](self, "setCurrentIndex:", -1LL);
  -[VOTUIMapsExplorationView setCurrentCenter:](self, "setCurrentCenter:", x, y);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentRotaryView](self, "currentRotaryView"));
  objc_msgSend(v8, "setCenter:", x, y);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentRotaryView](self, "currentRotaryView"));
  [v9 addSubviewsFromExplorationSegments:v7];
}

- (void)updateUIWithCurrentLocation:(CGPoint)a3
{
  CGPoint v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentLocationView](self, "currentLocationView"));

  if (v4)
  {
    -[VOTUIMapsExplorationView currentLocation](self, "currentLocation");
    double v6 = v5;
    -[VOTUIMapsExplorationView lastLocation](self, "lastLocation");
    double v8 = v6 - v7;
    -[VOTUIMapsExplorationView currentLocation](self, "currentLocation");
    double v10 = v9;
    -[VOTUIMapsExplorationView lastLocation](self, "lastLocation");
    double v12 = v10 - v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentLocationView](self, "currentLocationView"));
    [v13 frame];
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    double v19 = v8 + v18;
    double v21 = v12 + v20;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_11D84;
    v24[3] = &unk_247D0;
    v24[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v24, 0.2);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_11DB8;
    v23[3] = &unk_24888;
    v23[4] = self;
    *(double *)&v23[5] = v19;
    *(double *)&v23[6] = v21;
    v23[7] = v15;
    v23[8] = v17;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_11E10;
    v22[3] = &unk_246E0;
    v22[4] = self;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v23,  v22,  0.5);
  }

- (void)highlightExplorationSegmentWithIndex:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIMapsExplorationView currentRotaryView](self, "currentRotaryView"));
  objc_msgSend( v4,  "handleHighlightChangeWithLastIndex:andNewIndex:",  -[VOTUIMapsExplorationView lastIndex](self, "lastIndex"),  -[VOTUIMapsExplorationView currentIndex](self, "currentIndex"));
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (int64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setLastIndex:(int64_t)a3
{
  self->_lastIndedouble x = a3;
}

- (CGPoint)currentCenter
{
  double x = self->_currentCenter.x;
  double y = self->_currentCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentCenter:(CGPoint)a3
{
  self->_currentCenter = a3;
}

- (CGPoint)currentLocation
{
  double x = self->_currentLocation.x;
  double y = self->_currentLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)lastLocation
{
  double x = self->_lastLocation.x;
  double y = self->_lastLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->_lastLocation = a3;
}

- (void)setCurrentLocationView:(id)a3
{
}

- (void)setCurrentRotaryView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end