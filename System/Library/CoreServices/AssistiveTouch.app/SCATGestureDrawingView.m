@interface SCATGestureDrawingView
+ (BOOL)_isValidPositionFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6 centerPoint:(CGPoint)a7 frame:(CGRect *)a8;
+ (CGRect)_bestFrameFor90ControlAtAngle:(double)a3 size:(CGSize)a4 centerPoint:(CGPoint)a5;
+ (CGRect)_frameFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6;
+ (CGRect)_frameWithIntegralOrigin:(CGRect)result;
- (BOOL)areFingersHighlighted;
- (BOOL)areFingersPressed;
- (BOOL)showsCurvatureControls;
- (BOOL)showsRotation90Controls;
- (BOOL)showsRotationControls;
- (CGPoint)_tailPoint;
- (CGRect)frameForToolbar;
- (NSArray)fingerPositions;
- (NSArray)rotation90Controls;
- (SCATGestureArrowView)decreaseCurveControl;
- (SCATGestureArrowView)increaseCurveControl;
- (SCATGestureArrowView)rotateClockwiseControl;
- (SCATGestureArrowView)rotateCounterclockwiseControl;
- (SCATGestureArrowView)straightenCurveControl;
- (SCATGestureDrawingView)initWithFrame:(CGRect)a3;
- (SCATOutlineLabel)rotate90ClockwiseButton;
- (SCATOutlineLabel)rotate90CounterclockwiseButton;
- (double)_actualDistanceForFingerTrail;
- (double)_midAngleForCurvedTrailWithTailPoint:(CGPoint)a3 fingerTrailDistance:(double)a4 distanceAlongArc:(double)a5 useSecondIntersectionPointIfNecessary:(BOOL)a6;
- (double)angle;
- (double)curvature;
- (double)previewDistance;
- (id)_newControlArrowForCurvature:(BOOL)a3;
- (id)_newRotate90Button;
- (void)_adjustArrowViewsForNumberOfFingers:(unint64_t)a3;
- (void)_updateControls;
- (void)_updateCurvatureControl:(id)a3 withTailPoint:(CGPoint)a4 tailAngle:(double)a5 distance:(double)a6 curvature:(double)a7;
- (void)_updateCurvatureControls;
- (void)_updateRotation90Controls;
- (void)_updateRotationControls;
- (void)setAngle:(double)a3;
- (void)setCurvature:(double)a3;
- (void)setFingerPositions:(id)a3;
- (void)setFingersHighlighted:(BOOL)a3;
- (void)setFingersPressed:(BOOL)a3;
- (void)setFrameForToolbar:(CGRect)a3;
- (void)setPreviewDistance:(double)a3;
- (void)setShowsCurvatureControls:(BOOL)a3;
- (void)setShowsRotation90Controls:(BOOL)a3;
- (void)setShowsRotationControls:(BOOL)a3;
@end

@implementation SCATGestureDrawingView

- (SCATGestureDrawingView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingView;
  v3 = -[SCATGestureDrawingView initWithFrame:]( &v30,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[SCATGestureDrawingView _newControlArrowForCurvature:](v3, "_newControlArrowForCurvature:", 0LL);
    rotateClockwiseControl = v4->_rotateClockwiseControl;
    v4->_rotateClockwiseControl = v5;

    v7 = -[SCATGestureDrawingView _newControlArrowForCurvature:](v4, "_newControlArrowForCurvature:", 0LL);
    rotateCounterclockwiseControl = v4->_rotateCounterclockwiseControl;
    v4->_rotateCounterclockwiseControl = v7;

    v9 = -[SCATGestureDrawingView _newRotate90Button](v4, "_newRotate90Button");
    rotate90ClockwiseButton = v4->_rotate90ClockwiseButton;
    v4->_rotate90ClockwiseButton = v9;

    v11 = -[SCATGestureDrawingView _newRotate90Button](v4, "_newRotate90Button");
    rotate90CounterclockwiseButton = v4->_rotate90CounterclockwiseButton;
    v4->_rotate90CounterclockwiseButton = v11;

    v13 = -[SCATGestureDrawingView _newControlArrowForCurvature:](v4, "_newControlArrowForCurvature:", 1LL);
    increaseCurveControl = v4->_increaseCurveControl;
    v4->_increaseCurveControl = v13;

    v15 = -[SCATGestureDrawingView _newControlArrowForCurvature:](v4, "_newControlArrowForCurvature:", 1LL);
    decreaseCurveControl = v4->_decreaseCurveControl;
    v4->_decreaseCurveControl = v15;

    v17 = -[SCATGestureDrawingView _newControlArrowForCurvature:](v4, "_newControlArrowForCurvature:", 1LL);
    straightenCurveControl = v4->_straightenCurveControl;
    v4->_straightenCurveControl = v17;

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v31[0] = v4->_rotateCounterclockwiseControl;
    v31[1] = v4->_rotateClockwiseControl;
    v31[2] = v4->_rotate90CounterclockwiseButton;
    v31[3] = v4->_rotate90ClockwiseButton;
    v31[4] = v4->_increaseCurveControl;
    v31[5] = v4->_decreaseCurveControl;
    v31[6] = v4->_straightenCurveControl;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 7LL, 0LL));
    id v20 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          [v24 setHidden:1];
          -[SCATGestureDrawingView addSubview:](v4, "addSubview:", v24);
        }

        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v21);
    }
  }

  return v4;
}

- (void)setFingersPressed:(BOOL)a3
{
  if (self->_fingersPressed != a3)
  {
    BOOL v3 = a3;
    self->_fingersPressed = a3;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v4 = self->_arrowViews;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setPressed:", v3, (void)v9);
          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v6);
    }
  }

- (void)setFingersHighlighted:(BOOL)a3
{
  if (self->_fingersHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_fingersHighlighted = a3;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v4 = self->_arrowViews;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setHighlighted:", v3, (void)v9);
          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v6);
    }
  }

- (void)setShowsRotationControls:(BOOL)a3
{
  if (self->_showsRotationControls != a3)
  {
    self->_showsRotationControls = a3;
    -[SCATGestureDrawingView _updateRotationControls](self, "_updateRotationControls");
  }

- (void)setShowsRotation90Controls:(BOOL)a3
{
  if (self->_showsRotation90Controls != a3)
  {
    self->_showsRotation90Controls = a3;
    -[SCATGestureDrawingView _updateRotation90Controls](self, "_updateRotation90Controls");
  }

- (void)setShowsCurvatureControls:(BOOL)a3
{
  if (self->_showsCurvatureControls != a3)
  {
    self->_showsCurvatureControls = a3;
    -[SCATGestureDrawingView _updateCurvatureControls](self, "_updateCurvatureControls");
  }

- (NSArray)fingerPositions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableArray count](self->_arrowViews, "count")));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_arrowViews;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "tailPoint", (void)v12);
        __int128 v9 = NSStringFromCGPoint(v17);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        [v3 addObject:v10];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setFingerPositions:(id)a3
{
  id v8 = a3;
  -[SCATGestureDrawingView _adjustArrowViewsForNumberOfFingers:]( self,  "_adjustArrowViewsForNumberOfFingers:",  [v8 count]);
  if ([v8 count])
  {
    unint64_t v4 = 0LL;
    do
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_arrowViews, "objectAtIndex:", v4));
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v4]);
      CGPoint v7 = CGPointFromString(v6);
      objc_msgSend(v5, "setTailPoint:", v7.x, v7.y);

      ++v4;
    }

    while (v4 < (unint64_t)[v8 count]);
  }

  -[SCATGestureDrawingView _updateControls](self, "_updateControls");
}

- (double)angle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_arrowViews, "lastObject"));
  [v2 tailAngle];
  double v4 = v3;

  return v4;
}

- (void)setAngle:(double)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setTailAngle:", a3, (void)v10);
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[SCATGestureDrawingView _updateControls](self, "_updateControls");
}

- (double)curvature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_arrowViews, "lastObject"));
  [v2 curvature];
  double v4 = v3;

  return v4;
}

- (void)setCurvature:(double)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setCurvature:", a3, (void)v10);
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[SCATGestureDrawingView _updateControls](self, "_updateControls");
}

- (double)previewDistance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_arrowViews, "lastObject"));
  [v2 distance];
  double v4 = v3;

  return v4;
}

- (void)setPreviewDistance:(double)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setDistance:", a3, (void)v10);
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[SCATGestureDrawingView _updateControls](self, "_updateControls");
}

- (void)setFrameForToolbar:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_frameForToolbar = &self->_frameForToolbar;
  if (!CGRectEqualToRect(self->_frameForToolbar, a3))
  {
    p_frameForToolbar->origin.CGFloat x = x;
    p_frameForToolbar->origin.CGFloat y = y;
    p_frameForToolbar->size.CGFloat width = width;
    p_frameForToolbar->size.CGFloat height = height;
  }

- (id)_newControlArrowForCurvature:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SCATGestureArrowView);
  -[SCATGestureArrowView setIsControlArrow:](v5, "setIsControlArrow:", 1LL);
  -[SCATGestureArrowView setGestureDrawingView:](v5, "setGestureDrawingView:", self);
  if (v3) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 5LL;
  }
  -[SCATGestureArrowView setStyle:](v5, "setStyle:", v6);
  -[SCATGestureArrowView setShouldClearFingerCircle:](v5, "setShouldClearFingerCircle:", v3);
  return v5;
}

- (id)_newRotate90Button
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___SCATOutlineLabel);
  id v4 = sub_10002B014(@"DrawingRotate90");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AXFormatInteger(90LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v7));

  -[SCATOutlineLabel setText:](v3, "setText:", v8);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v2 controlArrowColor]);
  -[SCATOutlineLabel setTextColor:](v3, "setTextColor:", v9);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v2 controlArrowHighlightedColor]);
  -[SCATOutlineLabel setHighlightedTextColor:](v3, "setHighlightedTextColor:", v10);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v2 controlArrowOutlineColor]);
  -[SCATOutlineLabel setOutlineColor:](v3, "setOutlineColor:", v11);

  [v2 controlArrowOutlineThickness];
  -[SCATOutlineLabel setOutlineThickness:](v3, "setOutlineThickness:");
  -[SCATOutlineLabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rotation90ControlFont]);

  -[SCATOutlineLabel setFont:](v3, "setFont:", v13);
  -[SCATOutlineLabel sizeToFit](v3, "sizeToFit");

  return v3;
}

- (void)_adjustArrowViewsForNumberOfFingers:(unint64_t)a3
{
  arrowViews = self->_arrowViews;
  if (!arrowViews)
  {
    uint64_t v6 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    id v7 = self->_arrowViews;
    self->_arrowViews = v6;

    arrowViews = self->_arrowViews;
  }

  id v8 = -[NSMutableArray count](arrowViews, "count");
  unint64_t v9 = a3 - (void)v8;
  if (a3 >= (unint64_t)v8)
  {
    if (a3 > (unint64_t)v8)
    {
      do
      {
        __int128 v12 = objc_alloc_init(&OBJC_CLASS___SCATGestureArrowView);
        -[SCATGestureArrowView setGestureDrawingView:](v12, "setGestureDrawingView:", self);
        -[SCATGestureArrowView setStyle:](v12, "setStyle:", 3LL);
        -[SCATGestureDrawingView addSubview:](self, "addSubview:", v12);
        -[NSMutableArray addObject:](self->_arrowViews, "addObject:", v12);

        --v9;
      }

      while (v9);
    }
  }

  else
  {
    for (unint64_t i = (unint64_t)v8 - 1; i >= a3; --i)
    {
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_arrowViews, "objectAtIndex:", i));
      [v11 removeFromSuperview];
      -[NSMutableArray removeObjectAtIndex:](self->_arrowViews, "removeObjectAtIndex:", i);
    }
  }

- (CGPoint)_tailPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingView fingerPositions](self, "fingerPositions"));
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue([v2 lastObject]);
  CGPoint v4 = CGPointFromString(v3);

  double x = v4.x;
  double y = v4.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_actualDistanceForFingerTrail
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_arrowViews, "lastObject"));
  [v2 actualDistanceForPreview];
  double v4 = v3;

  return v4;
}

- (void)_updateControls
{
}

+ (CGRect)_frameFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  if (a3 == 2)
  {
    double x = a6.x - a5.width;
  }

  else if (a3 == 1)
  {
    double x = a6.x + a5.width * -0.5;
  }

  else
  {
    double x = CGRectZero.origin.x;
    if (!a3) {
      double x = a6.x;
    }
  }

  if (a4 == 2)
  {
    double y = a6.y - a5.height;
  }

  else if (a4 == 1)
  {
    double y = a6.y + a5.height * -0.5;
  }

  else
  {
    double y = CGRectZero.origin.y;
    if (!a4) {
      double y = a6.y;
    }
  }

  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (BOOL)_isValidPositionFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6 centerPoint:(CGPoint)a7 frame:(CGRect *)a8
{
  double y = a7.y;
  double x = a7.x;
  double v11 = a6.y;
  double v12 = a6.x;
  double height = a5.height;
  double width = a5.width;
  if (a3 == 1 && a4 == 1) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureDrawingView.m",  315LL,  "+[SCATGestureDrawingView _isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:]",  @"Should not have tried centering in both directions.  You'll always have a corner sticking into the circle");
  }
  objc_msgSend(a1, "_frameFor90ControlWithXAlignment:yAlignment:size:nearestPoint:", a3, a4, width, height, v12, v11);
  double v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double DistanceToPoint = AX_CGPointGetDistanceToPoint(v12, v11, x, y);
  double v51 = AX_CGPointGetDistanceToPoint(v19, v21, x, y);
  v52.origin.double x = v19;
  v52.origin.double y = v21;
  v52.size.double width = v23;
  v52.size.double height = v25;
  double MidX = CGRectGetMidX(v52);
  v53.origin.double x = v19;
  v53.origin.double y = v21;
  v53.size.double width = v23;
  v53.size.double height = v25;
  double MinY = CGRectGetMinY(v53);
  double v50 = AX_CGPointGetDistanceToPoint(MidX, MinY, x, y);
  v54.origin.double x = v19;
  v54.origin.double y = v21;
  v54.size.double width = v23;
  v54.size.double height = v25;
  double MaxX = CGRectGetMaxX(v54);
  v55.origin.double x = v19;
  v55.origin.double y = v21;
  v55.size.double width = v23;
  v55.size.double height = v25;
  double v30 = CGRectGetMinY(v55);
  double v49 = AX_CGPointGetDistanceToPoint(MaxX, v30, x, y);
  v56.origin.double x = v19;
  v56.origin.double y = v21;
  v56.size.double width = v23;
  v56.size.double height = v25;
  double MinX = CGRectGetMinX(v56);
  v57.origin.double x = v19;
  v57.origin.double y = v21;
  v57.size.double width = v23;
  v57.size.double height = v25;
  double MidY = CGRectGetMidY(v57);
  double v48 = AX_CGPointGetDistanceToPoint(MinX, MidY, x, y);
  v58.origin.double x = v19;
  v58.origin.double y = v21;
  v58.size.double width = v23;
  v58.size.double height = v25;
  double v33 = CGRectGetMaxX(v58);
  v59.origin.double x = v19;
  v59.origin.double y = v21;
  v59.size.double width = v23;
  v59.size.double height = v25;
  double v34 = CGRectGetMidY(v59);
  double v47 = AX_CGPointGetDistanceToPoint(v33, v34, x, y);
  v60.origin.double x = v19;
  v60.origin.double y = v21;
  v60.size.double width = v23;
  v60.size.double height = v25;
  double v35 = CGRectGetMinX(v60);
  v61.origin.double x = v19;
  v61.origin.double y = v21;
  v61.size.double width = v23;
  v61.size.double height = v25;
  double MaxY = CGRectGetMaxY(v61);
  double v46 = AX_CGPointGetDistanceToPoint(v35, MaxY, x, y);
  v62.origin.double x = v19;
  v62.origin.double y = v21;
  v62.size.double width = v23;
  v62.size.double height = v25;
  double v37 = CGRectGetMidX(v62);
  v63.origin.double x = v19;
  v63.origin.double y = v21;
  v63.size.double width = v23;
  v63.size.double height = v25;
  double v38 = CGRectGetMaxY(v63);
  double v45 = AX_CGPointGetDistanceToPoint(v37, v38, x, y);
  v64.origin.double x = v19;
  v64.origin.double y = v21;
  v64.size.double width = v23;
  v64.size.double height = v25;
  double v39 = CGRectGetMaxX(v64);
  v65.origin.double x = v19;
  v65.origin.double y = v21;
  v65.size.double width = v23;
  v65.size.double height = v25;
  double v40 = CGRectGetMaxY(v65);
  double v41 = AX_CGPointGetDistanceToPoint(v39, v40, x, y);
  if (a8)
  {
    double v42 = v19 + 3.0;
    if (a3 != 1) {
      double v42 = v19;
    }
    a8->origin.double x = v42;
    a8->origin.double y = v21;
    a8->size.double width = v23;
    a8->size.double height = v25;
  }

  BOOL v43 = v51 >= DistanceToPoint;
  return v45 >= DistanceToPoint && v43;
}

+ (CGRect)_bestFrameFor90ControlAtAngle:(double)a3 size:(CGSize)a4 centerPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  [v11 rotation90ControlNearestRadius];
  double v13 = v12;
  __double2 v14 = __sincos_stret(a3);
  double v15 = x + v13 * v14.__cosval;
  double v16 = y + v13 * v14.__sinval;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v33 = size;
  if ((objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  1,  0,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  1,  2,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  0,  1,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  2,  1,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,
                        "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",
                        0LL,
                        0LL,
                        &origin,
                        width,
                        height,
                        v15,
                        v16,
                        x,
                        y) & 1) == 0
    && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  0,  2,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  2,  0,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0 && (objc_msgSend( a1,  "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:",  2,  2,  &origin,  width,  height,  v15,  v16,  x,  y) & 1) == 0)
  {
    v34.double x = x;
    v34.double y = y;
    double v18 = NSStringFromCGPoint(v34);
    double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v35.double x = v15;
    v35.double y = v16;
    double v20 = NSStringFromCGPoint(v35);
    double v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v36.double width = width;
    v36.double height = height;
    double v22 = NSStringFromCGSize(v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v22);
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureDrawingView.m",  373LL,  "+[SCATGestureDrawingView _bestFrameFor90ControlAtAngle:size:centerPoint:]",  @"Couldn't find any valid frame.  Is our logic wrong?  Center point %@, nearest point %@, size %@");

    objc_msgSend( a1,  "_frameFor90ControlWithXAlignment:yAlignment:size:nearestPoint:",  1,  0,  width,  height,  v15,  v16,  v19,  v21,  v31);
    origin.double x = v23;
    origin.double y = v24;
    v33.double width = v25;
    v33.double height = v26;
  }

  double v28 = origin.y;
  double v27 = origin.x;
  double v30 = v33.height;
  double v29 = v33.width;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

+ (CGRect)_frameWithIntegralOrigin:(CGRect)result
{
  double v3 = round(result.origin.x);
  double v4 = round(result.origin.y);
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_updateRotation90Controls
{
  if (-[SCATGestureDrawingView showsRotation90Controls](self, "showsRotation90Controls"))
  {
    -[SCATOutlineLabel frame](self->_rotate90ClockwiseButton, "frame");
    double v4 = v3;
    double v6 = v5;
    -[SCATGestureDrawingView _tailPoint](self, "_tailPoint");
    double v8 = v7;
    double v10 = v9;
    *(void *)&double v12 = objc_opt_class(self, v11).n128_u64[0];
    __double2 v14 = v13;
    -[SCATGestureDrawingView angle](self, "angle", v12);
    objc_msgSend(v14, "_bestFrameFor90ControlAtAngle:size:centerPoint:", v15 + 1.57079633, v4, v6, v8, v10);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    objc_opt_class(self, v24);
    objc_msgSend(v25, "_frameWithIntegralOrigin:", v17, v19, v21, v23);
    -[SCATOutlineLabel setFrame:](self->_rotate90ClockwiseButton, "setFrame:");
    *(void *)&double v27 = objc_opt_class(self, v26).n128_u64[0];
    double v29 = v28;
    -[SCATGestureDrawingView angle](self, "angle", v27);
    objc_msgSend(v29, "_bestFrameFor90ControlAtAngle:size:centerPoint:", v30 + -1.57079633, v4, v6, v8, v10);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    objc_opt_class(self, v39);
    objc_msgSend(v40, "_frameWithIntegralOrigin:", v32, v34, v36, v38);
    -[SCATOutlineLabel setFrame:](self->_rotate90CounterclockwiseButton, "setFrame:");
  }

  -[SCATOutlineLabel setHidden:]( self->_rotate90ClockwiseButton,  "setHidden:",  -[SCATGestureDrawingView showsRotation90Controls](self, "showsRotation90Controls") ^ 1);
  -[SCATOutlineLabel setHidden:]( self->_rotate90CounterclockwiseButton,  "setHidden:",  -[SCATGestureDrawingView showsRotation90Controls](self, "showsRotation90Controls") ^ 1);
}

- (double)_midAngleForCurvedTrailWithTailPoint:(CGPoint)a3 fingerTrailDistance:(double)a4 distanceAlongArc:(double)a5 useSecondIntersectionPointIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  CGPoint v26 = CGPointZero;
  -[SCATGestureDrawingView curvature](self, "curvature");
  double v14 = fabs(1.0 / v13);
  -[SCATGestureDrawingView angle](self, "angle");
  double v16 = v15;
  -[SCATGestureDrawingView curvature](self, "curvature");
  +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:]( &OBJC_CLASS___SCATGestureArrowView,  "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadiu s:distanceToMove:onLeft:",  0LL,  0LL,  0LL,  0LL,  &v26,  v17 < 0.0,  v16,  x,  y,  v14,  a5);
  double v18 = atan2(v26.y - y, v26.x - x);
  if (v6)
  {
    objc_msgSend(v12, "controlArrowThickness", v18);
    double v20 = v14 * 6.28318531 - a5;
    if (v20 - (v19 + v19) < a4)
    {
      -[SCATGestureDrawingView angle](self, "angle");
      double v22 = v21;
      -[SCATGestureDrawingView curvature](self, "curvature");
      +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:]( &OBJC_CLASS___SCATGestureArrowView,  "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveR adius:distanceToMove:onLeft:",  0LL,  0LL,  0LL,  0LL,  &v26,  v23 < 0.0,  v22,  x,  y,  v14,  v20);
    }

    double v18 = atan2(v26.y - y, v26.x - x);
  }

  double v24 = v18;

  return v24;
}

- (void)_updateRotationControls
{
  if (-[SCATGestureDrawingView showsRotationControls](self, "showsRotationControls"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    -[SCATGestureDrawingView angle](self, "angle");
    -[SCATGestureArrowView setTailAngle:](self->_rotateClockwiseControl, "setTailAngle:", v4 + 1.57079633);
    [v3 rotationControlAngleAwayFromMidAngle];
    double v6 = v5;
    [v3 rotationControlLength];
    double v8 = v7;
    [v3 rotationControlCurveRadius];
    double v10 = v9;
    -[SCATGestureDrawingView _tailPoint](self, "_tailPoint");
    double v12 = v11;
    double v14 = v13;
    -[SCATGestureDrawingView _tailPoint](self, "_tailPoint");
    double v34 = v16;
    double v35 = v15;
    -[SCATGestureDrawingView angle](self, "angle");
    double v18 = v17;
    -[SCATGestureDrawingView angle](self, "angle");
    double v20 = v19;
    -[SCATGestureDrawingView curvature](self, "curvature");
    if (v21 != 0.0)
    {
      -[SCATGestureDrawingView _actualDistanceForFingerTrail](self, "_actualDistanceForFingerTrail");
      double v23 = v22;
      double v24 = v8;
      if (v10 <= v22) {
        double v25 = v10;
      }
      else {
        double v25 = v22;
      }
      -[SCATGestureDrawingView curvature](self, "curvature");
      -[SCATGestureDrawingView _midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:]( self,  "_midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:",  v26 > 0.0,  v12,  v14,  v23,  v25);
      double v18 = v27;
      -[SCATGestureDrawingView curvature](self, "curvature");
      double v29 = v25;
      double v8 = v24;
      -[SCATGestureDrawingView _midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:]( self,  "_midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:",  v28 < 0.0,  v35,  v34,  v23,  v29);
      double v20 = v30;
    }

    double v31 = v6 + v18;
    __double2 v32 = __sincos_stret(v31);
    -[SCATGestureArrowView setTailPoint:]( self->_rotateClockwiseControl,  "setTailPoint:",  v12 + v10 * v32.__cosval,  v14 + v10 * v32.__sinval);
    -[SCATGestureArrowView setDistance:](self->_rotateClockwiseControl, "setDistance:", v8);
    -[SCATGestureArrowView setTailAngle:](self->_rotateClockwiseControl, "setTailAngle:", v31 + 1.57079633);
    -[SCATGestureArrowView setCurvature:](self->_rotateClockwiseControl, "setCurvature:", 1.0 / v10);
    __double2 v33 = __sincos_stret(v20 - v6);
    -[SCATGestureArrowView setTailPoint:]( self->_rotateCounterclockwiseControl,  "setTailPoint:",  v35 + v10 * v33.__cosval,  v34 + v10 * v33.__sinval);
    -[SCATGestureArrowView setDistance:](self->_rotateCounterclockwiseControl, "setDistance:", v8);
    -[SCATGestureArrowView setTailAngle:](self->_rotateCounterclockwiseControl, "setTailAngle:", v20 - v6 + -1.57079633);
    -[SCATGestureArrowView setCurvature:](self->_rotateCounterclockwiseControl, "setCurvature:", -1.0 / v10);
  }

  -[SCATGestureArrowView setHidden:]( self->_rotateClockwiseControl,  "setHidden:",  -[SCATGestureDrawingView showsRotationControls](self, "showsRotationControls") ^ 1);
  -[SCATGestureArrowView setHidden:]( self->_rotateCounterclockwiseControl,  "setHidden:",  -[SCATGestureDrawingView showsRotationControls](self, "showsRotationControls") ^ 1);
}

- (void)_updateCurvatureControl:(id)a3 withTailPoint:(CGPoint)a4 tailAngle:(double)a5 distance:(double)a6 curvature:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  objc_msgSend(v12, "setTailPoint:", x, y);
  [v12 setTailAngle:a5];
  [v12 setDistance:a6];
  [v12 setCurvature:a7];
}

- (void)_updateCurvatureControls
{
  if (-[SCATGestureDrawingView showsCurvatureControls](self, "showsCurvatureControls"))
  {
    -[SCATGestureDrawingView _tailPoint](self, "_tailPoint");
    double v4 = v3;
    double v6 = v5;
    -[SCATGestureDrawingView angle](self, "angle");
    double v8 = v7;
    -[SCATGestureDrawingView previewDistance](self, "previewDistance");
    double v10 = v9;
    -[SCATGestureDrawingView curvature](self, "curvature");
    double v12 = fmax(v11 * 0.0001, 0.01);
    -[SCATGestureDrawingView curvature](self, "curvature");
    double v14 = v13 + v12;
    if (v14 >= 0.005) {
      double v15 = v14;
    }
    else {
      double v15 = 0.005;
    }
    -[SCATGestureDrawingView curvature](self, "curvature");
    double v17 = v16 - v12;
    if (v17 <= -0.005) {
      double v18 = v17;
    }
    else {
      double v18 = -0.005;
    }
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:]( self,  "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:",  self->_increaseCurveControl,  v4,  v6,  v8,  v10,  v15);
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:]( self,  "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:",  self->_decreaseCurveControl,  v4,  v6,  v8,  v10,  v18);
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:]( self,  "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:",  self->_straightenCurveControl,  v4,  v6,  v8,  v10,  0.0);
  }

  uint64_t v19 = -[SCATGestureDrawingView showsCurvatureControls](self, "showsCurvatureControls") ^ 1;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingView increaseCurveControl](self, "increaseCurveControl"));
  [v20 setHidden:v19];

  uint64_t v21 = -[SCATGestureDrawingView showsCurvatureControls](self, "showsCurvatureControls") ^ 1;
  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingView decreaseCurveControl](self, "decreaseCurveControl"));
  [v22 setHidden:v21];

  if (-[SCATGestureDrawingView showsCurvatureControls](self, "showsCurvatureControls"))
  {
    -[SCATGestureDrawingView curvature](self, "curvature");
    BOOL v24 = v23 == 0.0;
  }

  else
  {
    BOOL v24 = 1LL;
  }

  id v25 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingView straightenCurveControl](self, "straightenCurveControl"));
  [v25 setHidden:v24];
}

- (BOOL)areFingersPressed
{
  return self->_fingersPressed;
}

- (BOOL)areFingersHighlighted
{
  return self->_fingersHighlighted;
}

- (BOOL)showsRotationControls
{
  return self->_showsRotationControls;
}

- (BOOL)showsRotation90Controls
{
  return self->_showsRotation90Controls;
}

- (BOOL)showsCurvatureControls
{
  return self->_showsCurvatureControls;
}

- (SCATGestureArrowView)rotateClockwiseControl
{
  return self->_rotateClockwiseControl;
}

- (SCATGestureArrowView)rotateCounterclockwiseControl
{
  return self->_rotateCounterclockwiseControl;
}

- (SCATOutlineLabel)rotate90ClockwiseButton
{
  return self->_rotate90ClockwiseButton;
}

- (SCATOutlineLabel)rotate90CounterclockwiseButton
{
  return self->_rotate90CounterclockwiseButton;
}

- (SCATGestureArrowView)increaseCurveControl
{
  return self->_increaseCurveControl;
}

- (SCATGestureArrowView)decreaseCurveControl
{
  return self->_decreaseCurveControl;
}

- (SCATGestureArrowView)straightenCurveControl
{
  return self->_straightenCurveControl;
}

- (CGRect)frameForToolbar
{
  double x = self->_frameForToolbar.origin.x;
  double y = self->_frameForToolbar.origin.y;
  double width = self->_frameForToolbar.size.width;
  double height = self->_frameForToolbar.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)rotation90Controls
{
  return self->_rotation90Controls;
}

- (void).cxx_destruct
{
}

@end