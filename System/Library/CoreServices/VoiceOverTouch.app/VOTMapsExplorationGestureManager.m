@interface VOTMapsExplorationGestureManager
- (BOOL)explorationIsActive;
- (BOOL)explorationIsPending;
- (BOOL)handleSelection;
- (BOOL)handleTracking:(CGPoint)a3;
- (BOOL)handleVerbosityChangeIncreasing:(BOOL)a3;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isRotorDownEvent:(id)a3;
- (BOOL)isRotorLeftEvent:(id)a3;
- (BOOL)isRotorRightEvent:(id)a3;
- (BOOL)isRotorUpEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isTextSelectionBackwardEvent:(id)a3;
- (BOOL)isTextSelectionForwardEvent:(id)a3;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4;
- (VOTMapsExplorationGestureManager)init;
- (VOTMapsExplorationGestureManagerDelegate)mapsExplorationGestureManagerDelegate;
- (id)currentIntersectionInformation;
- (id)currentMap;
- (id)explorationSegmentsForRoadsWithAngles:(id)a3;
- (int64_t)indexForPoint:(CGPoint)a3;
- (void)_playSound:(id)a3;
- (void)_speakText:(id)a3 doesNotInterrupt:(BOOL)a4 cannotBeInterrupted:(BOOL)a5;
- (void)beginExploration;
- (void)endExploration;
- (void)processTouch:(CGPoint)a3;
- (void)setActive:(BOOL)a3;
- (void)setMapsExplorationGestureManagerDelegate:(id)a3;
- (void)updateCurrentLocation;
- (void)updateExplorationSegments;
@end

@implementation VOTMapsExplorationGestureManager

- (VOTMapsExplorationGestureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTMapsExplorationGestureManager;
  v2 = -[VOTGesturedTextInputManager init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    -[VOTMapsExplorationGestureManager updateExplorationSegments](v2, "updateExplorationSegments");
    v3->_currentIndex = -1LL;
    v3->_selectionIndex = -1LL;
    v3->_movedAngle = 0.0;
    v3->_lastAngle = -1.0;
    v3->_recentlyMoved = 0;
    v3->_currentLocation = CGPointZero;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    v3->_currentCenter.x = v6 * 0.5;
    v3->_currentCenter.y = v8 * 0.5;
  }

  return v3;
}

- (id)currentMap
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentElement]);

  uint64_t v4 = kAXMapTrait;
  if (([v3 doesHaveTraits:kAXMapTrait] & 1) != 0
    || (double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 touchContainer]),
        unsigned int v6 = [v5 doesHaveTraits:v4],
        v5,
        v6))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentElement]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 touchContainer]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void)updateExplorationSegments
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  if (v3
    && (uint64_t v4 = (void *)v3,
        double v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace")),
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentElement]),
        v6,
        v5,
        v4,
        v6))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 mapsExplorationCurrentRoadsWithAngles]);

    double v8 = (NSArray *)objc_claimAutoreleasedReturnValue( -[VOTMapsExplorationGestureManager explorationSegmentsForRoadsWithAngles:]( self,  "explorationSegmentsForRoadsWithAngles:",  v12));
    explorationSegments = self->_explorationSegments;
    self->_explorationSegments = v8;

    objc_super v10 = (NSArray *)v12;
  }

  else
  {
    v11 = objc_opt_new(&OBJC_CLASS___NSArray);
    objc_super v10 = self->_explorationSegments;
    self->_explorationSegments = v11;
  }
}

- (void)updateCurrentLocation
{
  p_currentLocation = &self->_currentLocation;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  [v5 mapsExplorationCurrentLocation];
  p_currentLocation->x = v3;
  p_currentLocation->y = v4;
}

- (id)currentIntersectionInformation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  CGFloat v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mapsExplorationCurrentIntersectionDescription]);

  return v3;
}

- (BOOL)explorationIsActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  unsigned __int8 v3 = [v2 mapsExplorationIsActive];

  return v3;
}

- (BOOL)explorationIsPending
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  unsigned __int8 v3 = [v2 mapsExplorationIsPending];

  return v3;
}

- (void)beginExploration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 currentElement]);

  objc_msgSend(v3, "mapsExplorationBeginFromCurrentElement:", objc_msgSend(v3, "mapFeatureType") == (id)1);
}

- (void)endExploration
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  [v2 mapsExplorationEnd];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[VOTGesturedTextInputManager isActive](self, "isActive");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTMapsExplorationGestureManager;
  -[VOTGesturedTextInputManager setActive:](&v9, "setActive:", v3);
  if (!v3 || (v5 & 1) != 0)
  {
    if (!v3 && ((v5 ^ 1) & 1) == 0)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
      [v8 hideMapsExplorationUI];

      if (-[VOTMapsExplorationGestureManager explorationIsActive](self, "explorationIsActive")) {
        -[VOTMapsExplorationGestureManager endExploration](self, "endExploration");
      }
    }
  }

  else
  {
    if (!-[VOTMapsExplorationGestureManager explorationIsActive](self, "explorationIsActive")) {
      -[VOTMapsExplorationGestureManager beginExploration](self, "beginExploration");
    }
    -[VOTMapsExplorationGestureManager updateExplorationSegments](self, "updateExplorationSegments");
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend( v6,  "showMapsExplorationUIWithCenter:andData:",  self->_explorationSegments,  self->_currentCenter.x,  self->_currentCenter.y);

    -[VOTMapsExplorationGestureManager updateCurrentLocation](self, "updateCurrentLocation");
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend(v7, "updateMapsExplorationUIWithCurrentLocation:", self->_currentLocation.x, self->_currentLocation.y);
  }

- (BOOL)handleTracking:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTMapsExplorationGestureManager processTouch:](self, "processTouch:");
  int64_t v6 = -[VOTMapsExplorationGestureManager indexForPoint:](self, "indexForPoint:", x, y);
  if (v6 != self->_currentIndex)
  {
    self->_currentIndedouble x = v6;
    if (v6 != -1)
    {
      self->_selectionIndedouble x = v6;
      id v7 = sub_10004A988(off_1001AC148, @"one.of.many", 0LL);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v8,  self->_selectionIndex + 1,  -[NSArray count](self->_explorationSegments, "count")));

      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_explorationSegments, "objectAtIndex:", self->_selectionIndex));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:2]);

      uint64_t v12 = __AXStringForVariables(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[VOTMapsExplorationGestureManager _speakText:doesNotInterrupt:cannotBeInterrupted:]( self,  "_speakText:doesNotInterrupt:cannotBeInterrupted:",  v13,  0LL,  0LL,  v9,  @"__AXStringForVariablesSentinel");

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
      [v14 highlightMapsExplorationSegmentWithIndex:self->_currentIndex];
    }
  }

  return 1;
}

- (BOOL)handleSelection
{
  if ((self->_selectionIndex & 0x8000000000000000LL) == 0)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidActivateElement](&OBJC_CLASS___VOSOutputEvent, "DidActivateElement"));
    [v3 sendEvent:v4];

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
    [v5 mapsExplorationContinueWithVertexIndex:self->_selectionIndex];

    if (-[VOTMapsExplorationGestureManager explorationIsPending](self, "explorationIsPending"))
    {
      do
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
      while (-[VOTMapsExplorationGestureManager explorationIsPending](self, "explorationIsPending"));
    }

    -[VOTMapsExplorationGestureManager updateExplorationSegments](self, "updateExplorationSegments");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend( v6,  "showMapsExplorationUIWithCenter:andData:",  self->_explorationSegments,  self->_currentCenter.x,  self->_currentCenter.y);

    -[VOTMapsExplorationGestureManager updateCurrentLocation](self, "updateCurrentLocation");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend(v7, "updateMapsExplorationUIWithCurrentLocation:", self->_currentLocation.x, self->_currentLocation.y);

    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTMapsExplorationGestureManager currentIntersectionInformation]( self,  "currentIntersectionInformation"));
    -[VOTMapsExplorationGestureManager _speakText:doesNotInterrupt:cannotBeInterrupted:]( self,  "_speakText:doesNotInterrupt:cannotBeInterrupted:",  v8,  0LL,  0LL);

    self->_recentlyMoved = 1;
    self->_movedAngle = self->_lastAngle;
    self->_lastAngle = -1.0;
    self->_currentIndedouble x = -1LL;
    self->_selectionIndedouble x = -1LL;
  }

  return 1;
}

- (BOOL)handleVerbosityChangeIncreasing:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMapsExplorationGestureManager currentMap](self, "currentMap"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsExplorationChangeVerbosity:v3]);

  -[VOTMapsExplorationGestureManager _speakText:doesNotInterrupt:cannotBeInterrupted:]( self,  "_speakText:doesNotInterrupt:cannotBeInterrupted:",  v6,  0LL,  0LL);
  return 1;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  unsigned int v6 = [v5 isEqualToString:kVOTEventCommandTracking];

  if (v6)
  {
    [v4 touchPoint];
    unsigned __int8 v7 = -[VOTMapsExplorationGestureManager handleTracking:](self, "handleTracking:");
    goto LABEL_13;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  if ([v8 isEqualToString:kVOTEventCommandSplitTapTap])
  {

LABEL_6:
    unsigned __int8 v7 = -[VOTMapsExplorationGestureManager handleSelection](self, "handleSelection");
    goto LABEL_13;
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  unsigned int v10 = [v9 isEqualToString:kVOTEventCommandSimpleTap];

  if (v10) {
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  unsigned int v12 = [v11 isEqualToString:kVOTEventCommandSearchRotorUp];

  if (v12)
  {
    v13 = self;
    uint64_t v14 = 1LL;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
    unsigned int v16 = [v15 isEqualToString:kVOTEventCommandSearchRotorDown];

    if (!v16)
    {
      v19.receiver = self;
      v19.super_class = (Class)&OBJC_CLASS___VOTMapsExplorationGestureManager;
      unsigned __int8 v7 = -[VOTGesturedTextInputManager processEvent:](&v19, "processEvent:", v4);
      goto LABEL_13;
    }

    v13 = self;
    uint64_t v14 = 0LL;
  }

  unsigned __int8 v7 = -[VOTMapsExplorationGestureManager handleVerbosityChangeIncreasing:]( v13,  "handleVerbosityChangeIncreasing:",  v14);
LABEL_13:
  BOOL v17 = v7;

  return v17;
}

- (id)explorationSegmentsForRoadsWithAngles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v9);
        v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 1, (void)v25));
        -[NSMutableArray addObject:](v11, "addObject:", v12);

        -[NSMutableArray addObject:](v4, "addObject:", v11);
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

  uint64_t v13 = (uint64_t)[v5 count];
  if (v13 >= 1)
  {
    uint64_t v14 = v13;
    for (uint64_t i = 0LL; i != v14; ++i)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", i, (void)v25));
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
      [v17 floatValue];
      double v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v4, "objectAtIndex:", i));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 + 0.400000006));
      [v20 insertObject:v21 atIndex:0];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v4, "objectAtIndex:", i));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 + -0.400000006));
      [v22 insertObject:v23 atIndex:0];
    }
  }

  return v4;
}

- (void)processTouch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_currentCenter = &self->_currentCenter;
  double DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints(self->_currentCenter.x, self->_currentCenter.y, a3.x, a3.y);
  if (DistanceBetweenPoints > 200.0)
  {
    double v7 = (x - p_currentCenter->x) / DistanceBetweenPoints;
    double v8 = DistanceBetweenPoints + -200.0;
    double v9 = (y - p_currentCenter->y) / DistanceBetweenPoints;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    double v15 = v12 + -200.0;
    if (v12 + -200.0 >= p_currentCenter->x + v7 * (v8 + 5.0)) {
      double v15 = p_currentCenter->x + v7 * (v8 + 5.0);
    }
    double v16 = fmax(v15, 200.0);
    double v17 = p_currentCenter->y + v9 * (v8 + 5.0);
    if (v14 + -200.0 < v17) {
      double v17 = v14 + -200.0;
    }
    p_currentCenter->double x = v16;
    p_currentCenter->double y = fmax(v17, 200.0);
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend(v18, "updateMapsExplorationUIWithCurrentCenter:", p_currentCenter->x, p_currentCenter->y);
  }

- (int64_t)indexForPoint:(CGPoint)a3
{
  CGFloat v4 = a3.x - self->_currentCenter.x;
  float v5 = a3.y - self->_currentCenter.y;
  float v6 = v4;
  float v7 = atan2f(v5, v6);
  if (v7 <= 0.0) {
    double v8 = v7 + 6.28318531;
  }
  else {
    double v8 = v7;
  }
  if (self->_recentlyMoved)
  {
    if (vabdd_f64(v8, self->_movedAngle) < 0.200000003) {
      return -1LL;
    }
    self->_recentlyMoved = 0;
  }

  uint64_t v9 = -[NSArray count](self->_explorationSegments, "count");
  if (v9 < 1)
  {
LABEL_19:
    self->_double lastAngle = -1.0;
    return -1LL;
  }

  uint64_t v10 = v9;
  int64_t v11 = 0LL;
  float64x2_t v29 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18LL);
  float64x2_t v30 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
  while (1)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndex:]( self->_explorationSegments,  "objectAtIndex:",  v11,  *(_OWORD *)&v29,  *(_OWORD *)&v30));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
    [v13 floatValue];
    unsigned int v32 = v14;

    double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
    [v15 floatValue];
    unsigned int v31 = v16;

    float64x2_t v17 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v31, v32));
    int32x2_t v18 = vcltz_f32((float32x2_t)__PAIR64__(v31, v32));
    v19.i64[0] = v18.i32[0];
    v19.i64[1] = v18.i32[1];
    float64x2_t v20 = (float64x2_t)vbslq_s8(v19, (int8x16_t)vaddq_f64(v17, v30), (int8x16_t)v17);
    int8x16_t v21 = vbslq_s8((int8x16_t)vcgtq_f64(v20, v30), (int8x16_t)vaddq_f64(v20, v29), (int8x16_t)v20);

    if (v10 == ++v11) {
      goto LABEL_19;
    }
  }

  double v24 = (*(double *)v21.i64 + *(double *)&v21.i64[1]) * 0.5;
  if (v24 < 0.0) {
    double v24 = v24 + 6.28318531;
  }
  double lastAngle = self->_lastAngle;
  if (lastAngle != -1.0)
  {
    BOOL v26 = lastAngle <= v24 || v8 > v24;
    if (!v26 || (lastAngle < v24 ? (BOOL v27 = v8 < v24) : (BOOL v27 = 1), !v27)) {
      -[VOTMapsExplorationGestureManager _playSound:](self, "_playSound:", @"Sounds/Edge.aiff");
    }
  }

  self->_double lastAngle = v8;

  return v11;
}

- (void)_speakText:(id)a3 doesNotInterrupt:(BOOL)a4 cannotBeInterrupted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (v9)
  {
    float v7 = objc_opt_new(&OBJC_CLASS___VOTOutputRequest);
    -[VOTOutputRequest setDoesNotInterrupt:](v7, "setDoesNotInterrupt:", v6);
    -[VOTOutputRequest setCannotBeInterrupted:](v7, "setCannotBeInterrupted:", v5);
    id v8 = -[VOTOutputRequest addString:](v7, "addString:", v9);
    -[VOTOutputRequest send](v7, "send");
  }
}

- (void)_playSound:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v4 playSoundFast:v3];
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  return 0;
}

- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4
{
  return 1;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  return 0;
}

- (BOOL)isSpaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorDownEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorLeftEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorRightEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorUpEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionBackwardEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionForwardEvent:(id)a3
{
  return 0;
}

- (VOTMapsExplorationGestureManagerDelegate)mapsExplorationGestureManagerDelegate
{
  return (VOTMapsExplorationGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_mapsExplorationGestureManagerDelegate);
}

- (void)setMapsExplorationGestureManagerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end