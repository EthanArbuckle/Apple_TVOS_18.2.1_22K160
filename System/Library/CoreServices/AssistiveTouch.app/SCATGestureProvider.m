@interface SCATGestureProvider
- (BOOL)_isPerformingContinuousGesture;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)allowsDwellSelection;
- (BOOL)canBeActiveElementManager;
- (BOOL)drawingViewController:(id)a3 moveFingersToPoints:(id)a4;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)isHidden;
- (BOOL)isPinching;
- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4;
- (BOOL)shouldAllowFingersForContinuousGesture;
- (BOOL)shouldKeepScannerAwake;
- (CGPoint)_startingPointForGestures;
- (CGPoint)currentHoldPoint;
- (CGPoint)endPointForLineGesture;
- (CGPoint)pinchFulcrum;
- (CGPoint)startingScreenPointForGestures;
- (CGRect)_rectForFingers:(id)a3;
- (CGRect)_rectToClearForPinchGesture;
- (CGRect)rectToClearForFingersWithGestureSheet:(BOOL)a3;
- (CGRect)rectToClearForStop:(id)a3;
- (NSArray)panFingerPositions;
- (NSArray)pinchFingerOriginalPositions;
- (SCATElement)elementForFingers;
- (SCATElementManager)currentSwitchController;
- (SCATGestureArrowView)arrowView;
- (SCATGestureProvider)initWithMenu:(id)a3;
- (SCATGestureProviderDelegate)delegate;
- (double)_pinchAngleAdjustedByDelta:(double)a3;
- (double)_pinchRadiusAdjustedByDelta:(double)a3;
- (double)alphaForFingers;
- (double)pinchAngle;
- (double)pinchRadius;
- (id)_fingerController;
- (id)_panPositionsAdjustedByDelta:(CGSize)a3;
- (id)_pinchPositionsWithRadius:(double)a3 angle:(double)a4;
- (id)_promptForLineGesture:(unint64_t)a3;
- (id)_repositionedGestureFromOriginalGesture:(id)a3;
- (id)_startingPointsAsStrings;
- (id)contextForCustomGestureItemsViewController:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)gesturesSheet;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)nameForConfirmationButton:(id)a3;
- (unint64_t)_numberOfFingers;
- (unint64_t)_numberOfFingersWithGestureSheet:(BOOL)a3;
- (unint64_t)lineGestureState;
- (unint64_t)lineGestureType;
- (unint64_t)numberOfFingers;
- (unsigned)startingDisplayIDForGestures;
- (void)_addPointsToContinuousGestureData:(id)a3;
- (void)_clearArrowView;
- (void)_clearLineGestureState;
- (void)_clearTellMeWhenTimer;
- (void)_didChooseFlickWithAngle:(double)a3 name:(id)a4;
- (void)_didChoosePanWithName:(id)a3 selector:(SEL)a4;
- (void)_didChoosePinchItemWithName:(id)a3 selector:(SEL)a4;
- (void)_endPinchMode;
- (void)_finishLineGesture;
- (void)_handleCompletedContinuousGesture;
- (void)_initializeContinuousGestureDataWithName:(id)a3 points:(id)a4;
- (void)_panByDelta:(CGSize)a3;
- (void)_panDown;
- (void)_panLeft;
- (void)_panRight;
- (void)_panUp;
- (void)_performFlickGestureWithAngle:(double)a3 name:(id)a4;
- (void)_performForceTouchGesture;
- (void)_performGesture:(id)a3;
- (void)_performTapGestureForDoubleTap:(BOOL)a3;
- (void)_pinchIn;
- (void)_pinchOut;
- (void)_prepareToBeginContinuousGesture;
- (void)_requestSwitchControllerPrivileges;
- (void)_resetContinuousGestureData;
- (void)_resignSwitchControllerPrivileges;
- (void)_rotateClockwise;
- (void)_rotateCounterclockwise;
- (void)_saveRecentGesture:(id)a3;
- (void)_setNumberOfFingersForGestures:(unint64_t)a3;
- (void)_setShowsFingers:(BOOL)a3;
- (void)_startConfirmingLineGestureWithEndpoint:(CGPoint)a3;
- (void)_startPickingEndPointForLineGesture:(unint64_t)a3;
- (void)_startPinchMode;
- (void)_startTellMeWhenTimerWithSelector:(SEL)a3;
- (void)_startTellMeWhenTimerWithSelector:(SEL)a3 interval:(double)a4;
- (void)_updatePinchPositionsWithAttemptedRadiusDelta:(double)a3 angleDelta:(double)a4;
- (void)_updateShowsFingers;
- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3;
- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3 forDisplayID:(unsigned int)a4;
- (void)_updateVisibleFingers;
- (void)customGestureItemsViewController:(id)a3 didChooseGesture:(id)a4;
- (void)dealloc;
- (void)didActivateFingersElement:(id)a3;
- (void)didChooseAddRecentInCustomGestureItemsViewController:(id)a3;
- (void)didChooseArbitraryFlick:(id)a3;
- (void)didChooseCreateInCustomGestureItemsViewController:(id)a3;
- (void)didChooseDoubleTapGesture:(id)a3;
- (void)didChooseDragGesture:(id)a3;
- (void)didChooseDrawingGesture:(id)a3;
- (void)didChooseFavorites:(id)a3;
- (void)didChooseFingers:(id)a3;
- (void)didChooseFlickDown:(id)a3;
- (void)didChooseFlickGesture:(id)a3;
- (void)didChooseFlickLeft:(id)a3;
- (void)didChooseFlickRight:(id)a3;
- (void)didChooseFlickUp:(id)a3;
- (void)didChooseForceTouchGesture:(id)a3;
- (void)didChooseHoldAndDragGesture:(id)a3;
- (void)didChoosePanDown:(id)a3;
- (void)didChoosePanGesture:(id)a3;
- (void)didChoosePanLeft:(id)a3;
- (void)didChoosePanRight:(id)a3;
- (void)didChoosePanUp:(id)a3;
- (void)didChoosePinchGesture:(id)a3;
- (void)didChoosePinchIn:(id)a3;
- (void)didChoosePinchOut:(id)a3;
- (void)didChooseRotateClockwise:(id)a3;
- (void)didChooseRotateCounterclockwise:(id)a3;
- (void)didChooseStop:(id)a3;
- (void)didConfirmGesture:(id)a3;
- (void)didPushPinchItemsViewController:(id)a3;
- (void)didRequestRedoGesture:(id)a3;
- (void)drawingViewController:(id)a3 shouldResetScanningFromElement:(id)a4;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)exitDrawingViewController:(id)a3;
- (void)fingerItemsViewController:(id)a3 didChooseNumberOfFingers:(unint64_t)a4;
- (void)fingersElement:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuDidAppear:(id)a3;
- (void)menuDidDisappear:(id)a3;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillAppear:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)performHoldAtPoint:(CGPoint)a3 isDown:(BOOL)a4;
- (void)performTap;
- (void)performTapAndHold;
- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4;
- (void)replayGesture:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setAlphaForFingers:(double)a3;
- (void)setArrowView:(id)a3;
- (void)setCurrentHoldPoint:(CGPoint)a3;
- (void)setCurrentSwitchController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndPointForLineGesture:(CGPoint)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsPinching:(BOOL)a3;
- (void)setLineGestureState:(unint64_t)a3;
- (void)setLineGestureType:(unint64_t)a3;
- (void)setPanFingerPositions:(id)a3;
- (void)setPinchAngle:(double)a3;
- (void)setPinchFingerOriginalPositions:(id)a3;
- (void)setPinchFulcrum:(CGPoint)a3;
- (void)setPinchRadius:(double)a3;
- (void)setShouldAllowFingersForContinuousGesture:(BOOL)a3;
- (void)setStartingDisplayIDForGestures:(unsigned int)a3;
- (void)setStartingScreenPointForGestures:(CGPoint)a3;
- (void)touchDownForDrawingViewController:(id)a3;
- (void)touchUpForDrawingViewController:(id)a3;
@end

@implementation SCATGestureProvider

- (SCATGestureProvider)initWithMenu:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATGestureProvider;
  v6 = -[SCATGestureProvider init](&v13, "init");
  if (v6)
  {
    if (!v5) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  187LL,  "-[SCATGestureProvider initWithMenu:]",  @"Gesture Provider must be initialized with a menu object. However, menu was nil");
    }
    objc_storeStrong((id *)v6 + 5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferenceForKey:@"ScannerNumberOfFingers"]);

    if (v8) {
      uint64_t v9 = (uint64_t)[v8 integerValue];
    }
    else {
      uint64_t v9 = 1LL;
    }
    *((void *)v6 + 13) = v9;
    [v5 registerMenuObserver:v6];
    *(_OWORD *)(v6 + 296) = AXSwitchRecipeHoldPointNone;
    *((void *)v6 + 30) = 0x3FF0000000000000LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mainDisplayManager]);
    *((_DWORD *)v6 + 41) = [v11 displayID];
  }

  return (SCATGestureProvider *)v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATGestureProvider;
  -[SCATGestureProvider dealloc](&v3, "dealloc");
}

- (void)orientationDidChange:(id)a3
{
  menu = self->_menu;
  id v5 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](menu, "element"));
  if (v14)
  {
    [v14 scatFrame];
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    double MidX = CGRectGetMidX(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    v11 = +[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", MidX, CGRectGetMidY(v16));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[SCATGestureProvider _updateStartingPointForGesturesWithScreenPoint:]( self,  "_updateStartingPointForGesturesWithScreenPoint:",  v12);
  }

  -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureDrawingElementManager drawingViewController]( self->_drawingElementManager,  "drawingViewController"));
  [v13 orientationDidChange:v5];
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    BOOL v3 = a3;
    self->_hidden = a3;
    -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider arrowView](self, "arrowView"));
    [v5 setHidden:v3];
  }

- (void)setAlphaForFingers:(double)a3
{
  if (self->_alphaForFingers != a3)
  {
    self->_alphaForFingers = a3;
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
  }

- (SCATElement)elementForFingers
{
  elementForFingers = self->_elementForFingers;
  if (!elementForFingers)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SCATGestureFingersElement);
    id v5 = self->_elementForFingers;
    self->_elementForFingers = v4;

    -[SCATGestureFingersElement setDelegate:](self->_elementForFingers, "setDelegate:", self);
    elementForFingers = self->_elementForFingers;
  }

  return (SCATElement *)elementForFingers;
}

- (id)identifier
{
  return off_100157160[0];
}

- (void)setStartingDisplayIDForGestures:(unsigned int)a3
{
  if (a3) {
    self->_startingDisplayIDForGestures = a3;
  }
}

- (id)_fingerController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "displayManagerForDisplayId:",  -[SCATGestureProvider startingDisplayIDForGestures](self, "startingDisplayIDForGestures")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fingerController]);

  return v5;
}

- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3
{
}

- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v14 = v6;
  if (v6)
  {
    [v6 pointValue];
    double Center = v7;
    double v10 = v9;
LABEL_5:
    -[SCATGestureProvider setStartingScreenPointForGestures:](self, "setStartingScreenPointForGestures:", Center, v10);
    -[SCATGestureProvider setStartingDisplayIDForGestures:](self, "setStartingDisplayIDForGestures:", v4);
    goto LABEL_6;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self->_menu, "element"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self->_menu, "element"));
    double Center = AX_CGRectGetCenter([v12 scatFrame]);
    double v10 = v13;

    goto LABEL_5;
  }

- (CGPoint)_startingPointForGestures
{
  if (v4 == AXSwitchRecipeHoldPointNone[0] && v3 == AXSwitchRecipeHoldPointNone[1])
  {
    -[SCATGestureProvider startingScreenPointForGestures](self, "startingScreenPointForGestures");
    double v9 = v8;
    double v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewForGestureProvider:self]);
    +[HNDScreen convertPoint:toView:](&OBJC_CLASS___HNDScreen, "convertPoint:toView:", v13, v9, v11);
    double v15 = v14;
    double v17 = v16;

    double v6 = v15;
    double v7 = v17;
  }

  else
  {
    -[SCATGestureProvider currentHoldPoint](self, "currentHoldPoint");
  }

  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (id)_startingPointsAsStrings
{
  double v4 = v3;
  double v6 = v5;
  unint64_t v7 = -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerContainerView]);
  [v9 bounds];
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:",  v7,  v4,  v6,  v10,  v11,  v12,  v13));

  return v14;
}

- (BOOL)_isPerformingContinuousGesture
{
  return self->_continuousGestureName != 0LL;
}

- (void)_resetContinuousGestureData
{
  continuousGestureName = self->_continuousGestureName;
  self->_continuousGestureName = 0LL;

  continuousGesturePoints = self->_continuousGesturePoints;
  self->_continuousGesturePoints = 0LL;

  continuousGestureTimes = self->_continuousGestureTimes;
  self->_continuousGestureTimes = 0LL;
}

- (void)_prepareToBeginContinuousGesture
{
  double v2 = 0.0;
  if (!self->_drawingElementManager) {
    double v2 = 1.0;
  }
  -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", v2);
}

- (void)_initializeContinuousGestureDataWithName:(id)a3 points:(id)a4
{
  id v23 = a3;
  id v7 = a4;
  -[SCATGestureProvider _resetContinuousGestureData](self, "_resetContinuousGestureData");
  objc_storeStrong((id *)&self->_continuousGestureName, a3);
  id v8 = [v7 count];
  double v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v8);
  continuousGesturePoints = self->_continuousGesturePoints;
  self->_continuousGesturePoints = v9;

  double v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v8);
  continuousGestureTimes = self->_continuousGestureTimes;
  self->_continuousGestureTimes = v11;

  double v13 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v7;
  id v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = self->_continuousGesturePoints;
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v18),  v23));
        -[NSMutableArray addObject:](v19, "addObject:", v20);

        v21 = self->_continuousGestureTimes;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v14));
        -[NSMutableArray addObject:](v21, "addObject:", v22);

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v16);
  }
}

- (void)_addPointsToContinuousGestureData:(id)a3
{
  id v13 = a3;
  double v4 = (char *)[v13 count];
  double v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[NSMutableArray count](self->_continuousGesturePoints, "count") != v4)
  {
    double v11 = v4;
    id v12 = -[NSMutableArray count](self->_continuousGesturePoints, "count");
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  383LL,  "-[SCATGestureProvider _addPointsToContinuousGestureData:]",  @"Should have array of %lu fingers in continuous gesture data, but had %lu.");
  }

  if (v4)
  {
    for (i = 0LL; i != v4; ++i)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_continuousGesturePoints, "objectAtIndex:", i, v11, v12));
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_continuousGestureTimes, "objectAtIndex:", i));
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:i]);
      [v8 addObject:v10];

      [v9 addObject:v6];
    }
  }
}

- (void)_handleCompletedContinuousGesture
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 legacyLiftFingersUp]);

  -[SCATGestureProvider _addPointsToContinuousGestureData:](self, "_addPointsToContinuousGestureData:", v5);
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture gestureWithPoints:times:forces:]( &OBJC_CLASS___AXNamedReplayableGesture,  "gestureWithPoints:times:forces:",  self->_continuousGesturePoints,  self->_continuousGestureTimes,  0LL));
  [v4 setName:self->_continuousGestureName];
  [v4 setShouldPerformAtOriginalLocation:1];
  [v4 setHasLocalizableName:1];
  -[SCATGestureProvider _saveRecentGesture:](self, "_saveRecentGesture:", v4);
  -[SCATGestureProvider _resetContinuousGestureData](self, "_resetContinuousGestureData");
  self->_isReversingContinuousGesture = 0;
  -[SCATGestureProvider setPanFingerPositions:](self, "setPanFingerPositions:", 0LL);
  -[SCATGestureProvider setShouldAllowFingersForContinuousGesture:]( self,  "setShouldAllowFingersForContinuousGesture:",  0LL);
  -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
}

- (void)_saveRecentGesture:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assistiveTouchRecentGestures]);
  id v8 = [v5 mutableCopy];

  if (v8) {
    [v8 removeObject:v3];
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  }
  [v8 insertObject:v3 atIndex:0];

  double v6 = (char *)[v8 count];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v7 setAssistiveTouchRecentGestures:v8];
}

- (void)_performGesture:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v5 addReasonToDisableScanning:@"PerformingGesture"];
  -[SCATGestureProvider replayGesture:](self, "replayGesture:", v4);
  -[SCATGestureProvider _saveRecentGesture:](self, "_saveRecentGesture:", v4);

  +[HNDDisplayManager fadeDuration](&OBJC_CLASS___HNDDisplayManager, "fadeDuration");
  double v7 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005AE0C;
  v10[3] = &unk_100121D18;
  id v11 = v5;
  id v8 = v5;
  AXPerformBlockOnMainThreadAfterDelay(v10, v9, v7);
}

- (void)_performTapGestureForDoubleTap:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:isDoubleTap:numberOfFingers:",  v3,  -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers"),  v5,  v6));
  id v9 = v7;
  id v8 = &off_1001243D0;
  if (!v3) {
    id v8 = &off_100124348;
  }
  [v7 setName:*v8];
  [v9 setHasLocalizableName:1];
  [v9 setShouldPerformAtOriginalLocation:1];
  -[SCATGestureProvider _performGesture:](self, "_performGesture:", v9);
}

- (void)_performFlickGestureWithAngle:(double)a3 name:(id)a4
{
  id v6 = a4;
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture flickGestureAtPoint:angle:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "flickGestureAtPoint:angle:numberOfFingers:",  -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers"),  v7,  v8,  a3));
  [v9 setName:v6];

  [v9 setHasLocalizableName:1];
  [v9 setShouldPerformAtOriginalLocation:1];
  -[SCATGestureProvider _performGesture:](self, "_performGesture:", v9);
}

- (void)_performForceTouchGesture
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture forceTouchGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "forceTouchGestureAtPoint:"));
  [v3 setName:@"FORCE_TOUCH"];
  [v3 setHasLocalizableName:1];
  [v3 setShouldPerformAtOriginalLocation:1];
  -[SCATGestureProvider _performGesture:](self, "_performGesture:", v3);
}

- (id)_pinchPositionsWithRadius:(double)a3 angle:(double)a4
{
  double v8 = v7;
  __double2 v9 = __sincos_stret(a4);
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  CGFloat v11 = v10 + a3 * v9.__sinval;
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  double v13 = v12;
  __double2 v14 = __sincos_stret(a4 + 3.14159265);
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  CGFloat v16 = v15 + a3 * v14.__sinval;
  v23.CGFloat x = v8 + a3 * v9.__cosval;
  v23.CGFloat y = v11;
  uint64_t v17 = NSStringFromCGPoint(v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v24.CGFloat x = v13 + a3 * v14.__cosval;
  v24.CGFloat y = v16;
  v19 = NSStringFromCGPoint(v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v18, v20, 0LL));

  return v21;
}

- (double)_pinchRadiusAdjustedByDelta:(double)a3
{
  if (self->_isReversingContinuousGesture) {
    double v4 = -1.0;
  }
  else {
    double v4 = 1.0;
  }
  -[SCATGestureProvider pinchRadius](self, "pinchRadius");
  return v5 + a3 * v4;
}

- (double)_pinchAngleAdjustedByDelta:(double)a3
{
  if (self->_isReversingContinuousGesture) {
    double v4 = -1.0;
  }
  else {
    double v4 = 1.0;
  }
  -[SCATGestureProvider pinchAngle](self, "pinchAngle");
  return v5 + a3 * v4;
}

- (void)_updatePinchPositionsWithAttemptedRadiusDelta:(double)a3 angleDelta:(double)a4
{
  double v8 = v7;
  -[SCATGestureProvider _pinchAngleAdjustedByDelta:](self, "_pinchAngleAdjustedByDelta:", a4);
  double v10 = v9;
  id v29 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider pinchFingerOriginalPositions](self, "pinchFingerOriginalPositions"));
  if (v8 < 20.0 || v8 > 200.0)
  {
    double v12 = 0LL;
    goto LABEL_8;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider _pinchPositionsWithRadius:angle:]( self,  "_pinchPositionsWithRadius:angle:",  v8,  v10));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  unsigned __int8 v14 = [v13 moveFingersToPoints:v12];

  if ((v14 & 1) == 0)
  {
LABEL_8:
    if (self->_isReversingContinuousGesture)
    {
      BOOL v15 = 0;
    }

    else
    {
      -[SCATGestureProvider pinchRadius](self, "pinchRadius");
      double v17 = v16;
      -[SCATGestureProvider pinchAngle](self, "pinchAngle");
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider _pinchPositionsWithRadius:angle:]( self,  "_pinchPositionsWithRadius:angle:",  v17,  v18));
      unsigned __int8 v20 = [v19 isEqualToArray:v29];

      if ((v20 & 1) != 0) {
        goto LABEL_20;
      }
      BOOL v15 = !self->_isReversingContinuousGesture;
    }

    self->_BOOL isReversingContinuousGesture = v15;
    -[SCATGestureProvider _pinchRadiusAdjustedByDelta:](self, "_pinchRadiusAdjustedByDelta:", a3);
    double v8 = v21;
    -[SCATGestureProvider _pinchAngleAdjustedByDelta:](self, "_pinchAngleAdjustedByDelta:", a4);
    double v10 = v22;
    if (v8 >= 20.0 && v8 <= 200.0)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _pinchPositionsWithRadius:angle:](self, "_pinchPositionsWithRadius:angle:", v8, v22));

      CGPoint v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
      unsigned __int8 v25 = [v24 moveFingersToPoints:v23];

      double v12 = (void *)v23;
      if ((v25 & 1) != 0) {
        goto LABEL_15;
      }
    }

    __int128 v27 = v12;
    BOOL isReversingContinuousGesture = self->_isReversingContinuousGesture;
    id v26 = v29;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  545LL,  "-[SCATGestureProvider _updatePinchPositionsWithAttemptedRadiusDelta:angleDelta:]",  @"We should have been able to move one direction or the other.  Otherwise how did we start moving in the first place?  Original points %@, new finger positions %@, isReversing %i");
LABEL_20:
    -[SCATGestureProvider _clearTellMeWhenTimer](self, "_clearTellMeWhenTimer", v26, v27, isReversingContinuousGesture);
    goto LABEL_21;
  }

- (void)_pinchOut
{
}

- (void)_pinchIn
{
}

- (void)_rotateClockwise
{
}

- (void)_rotateCounterclockwise
{
}

- (id)_panPositionsAdjustedByDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider panFingerPositions](self, "panFingerPositions"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));

  if (self->_isReversingContinuousGesture) {
    double v8 = -1.0;
  }
  else {
    double v8 = 1.0;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider panFingerPositions](self, "panFingerPositions", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        CGPoint v14 = CGPointFromString((NSString *)*(void *)(*((void *)&v18 + 1) + 8LL * (void)i));
        v23.CGFloat x = v14.x + width * v8;
        v23.CGFloat y = v14.y + height * v8;
        BOOL v15 = NSStringFromCGPoint(v23);
        double v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v7 addObject:v16];
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  return v7;
}

- (void)_panByDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _panPositionsAdjustedByDelta:](self, "_panPositionsAdjustedByDelta:"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _startingPointsAsStrings](self, "_startingPointsAsStrings"));
  if ([v6 isEqualToArray:v7])
  {
    if (!self->_isReversingContinuousGesture) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  613LL,  "-[SCATGestureProvider _panByDelta:]",  @"Should only have gotten back to our fingers' original points if we were reversing the gesture.");
    }
    self->_BOOL isReversingContinuousGesture = 0;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  unsigned __int8 v9 = [v8 moveFingersToPoints:v6];

  if ((v9 & 1) != 0)
  {
    id v18 = v6;
LABEL_7:
    -[SCATGestureProvider setPanFingerPositions:](self, "setPanFingerPositions:", v6);
    -[SCATGestureProvider _addPointsToContinuousGestureData:](self, "_addPointsToContinuousGestureData:", v6);
    goto LABEL_12;
  }

  if (!self->_isReversingContinuousGesture)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider panFingerPositions](self, "panFingerPositions"));
    unsigned __int8 v11 = [v10 isEqualToArray:v7];

    if ((v11 & 1) == 0)
    {
      self->_BOOL isReversingContinuousGesture = 1;
      id v18 = (id)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider _panPositionsAdjustedByDelta:]( self,  "_panPositionsAdjustedByDelta:",  width,  height));

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
      unsigned __int8 v13 = [v12 moveFingersToPoints:v18];

      if ((v13 & 1) == 0)
      {
        BOOL isReversingContinuousGesture = self->_isReversingContinuousGesture;
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  631LL,  "-[SCATGestureProvider _panByDelta:]",  @"Should have been able to move after reversing the gesture.  Otherwise how did we get here?  Starting positions %@, new finger positions %@, isReversing %i");
        -[SCATGestureProvider _clearTellMeWhenTimer]( self,  "_clearTellMeWhenTimer",  v7,  v18,  isReversingContinuousGesture);
        goto LABEL_12;
      }

      id v6 = v18;
      goto LABEL_7;
    }
  }

  id v18 = v6;
  -[SCATGestureProvider _clearTellMeWhenTimer](self, "_clearTellMeWhenTimer", v14, v15, v16);
LABEL_12:
}

- (void)_panLeft
{
}

- (void)_panRight
{
}

- (void)_panUp
{
}

- (void)_panDown
{
}

- (void)_finishLineGesture
{
  double v4 = v3;
  double v6 = v5;
  -[SCATGestureProvider endPointForLineGesture](self, "endPointForLineGesture");
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = -[SCATGestureProvider lineGestureType](self, "lineGestureType");
  if (v11 == 2)
  {
    double v19 = AX_CGPointGetDistanceToPoint(v4, v6, v8, v10) / 80.0;
    v28.CGFloat x = v4;
    v28.CGFloat y = v6;
    __int128 v20 = NSStringFromCGPoint(v28);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v29.CGFloat x = v8;
    v29.CGFloat y = v10;
    double v22 = NSStringFromCGPoint(v29);
    CGPoint v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    CGPoint v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v21, v23, 0LL));
    id v25 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:]( &OBJC_CLASS___AXNamedReplayableGesture,  "lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:",  v24,  -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers"),  v19,  0.5));

    id v18 = &off_100124380;
  }

  else if (v11 == 1)
  {
    id v25 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:",  -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers"),  v4,  v6,  v8,  v10));
    id v18 = &off_100124370;
  }

  else
  {
    if (v11)
    {
      id v25 = 0LL;
      goto LABEL_9;
    }

    double v12 = AX_CGPointGetDistanceToPoint(v4, v6, v8, v10) / 80.0;
    v26.CGFloat x = v4;
    v26.CGFloat y = v6;
    unsigned __int8 v13 = NSStringFromCGPoint(v26);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v27.CGFloat x = v8;
    v27.CGFloat y = v10;
    uint64_t v15 = NSStringFromCGPoint(v27);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v14, v16, 0LL));
    id v25 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture lineGestureBetweenPoints:duration:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "lineGestureBetweenPoints:duration:numberOfFingers:",  v17,  -[SCATGestureProvider _numberOfFingers](self, "_numberOfFingers"),  v12));

    id v18 = &off_100124378;
  }

  [v25 setName:*v18];
LABEL_9:
  [v25 setHasLocalizableName:1];
  [v25 setShouldPerformAtOriginalLocation:1];
  -[SCATGestureProvider _performGesture:](self, "_performGesture:", v25);
}

- (void)_startPinchMode
{
  double v4 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerContainerView]);
  [v6 setAlpha:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  objc_msgSend(v7, "showPinchFingersAnimated:midpoint:", 1);
}

- (void)_endPinchMode
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1);

  -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
}

- (void)_updateVisibleFingers
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  id v4 = [v3 isPerformingGesture];
  if ((_DWORD)v4)
  {
    uint64_t v5 = ASTLogCommon(v4);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGPoint v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not updating visible fingers because a gesture is in progress",  v23,  2u);
    }

    goto LABEL_17;
  }

  id v7 = [v3 numberOfFingers];
  if (self->_showsFingers)
  {
    id v8 = v7;
    -[SCATGestureProvider alphaForFingers](self, "alphaForFingers");
    double v10 = v9;
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerContainerView]);
    [v11 setAlpha:v10];

    drawingElementManager = self->_drawingElementManager;
    if (!drawingElementManager)
    {
      -[SCATGestureProvider currentHoldPoint](self, "currentHoldPoint");
      if (v18 == AXSwitchRecipeHoldPointNone[0] && v17 == AXSwitchRecipeHoldPointNone[1])
      {
        BOOL v20 = v8 == 0LL;
        if (-[SCATGestureProvider isPinching](self, "isPinching"))
        {
          -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
          objc_msgSend(v3, "showPinchFingersAnimated:midpoint:", v20);
          goto LABEL_18;
        }

        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _startingPointsAsStrings](self, "_startingPointsAsStrings"));
        uint64_t v21 = objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities fingerModelsForPointStrings:]( &OBJC_CLASS___AXPIFingerUtilities,  "fingerModelsForPointStrings:",  v6));
      }

      else
      {
        BOOL v20 = v8 == 0LL;
        -[SCATGestureProvider currentHoldPoint](self, "currentHoldPoint");
        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:"));
        CGPoint v24 = v6;
        uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      }

      double v22 = (void *)v21;
      objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v21, v20, CGPointZero.x, CGPointZero.y);

LABEL_17:
      goto LABEL_18;
    }

    BOOL v13 = v8 == 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureDrawingElementManager drawingViewController]( drawingElementManager,  "drawingViewController"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerPositions]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities fingerModelsForPointStrings:]( &OBJC_CLASS___AXPIFingerUtilities,  "fingerModelsForPointStrings:",  v15));
    objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v16, v13, CGPointZero.x, CGPointZero.y);
  }

  else
  {
    -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
    objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1);
  }

- (void)_clearTellMeWhenTimer
{
  tellMeWhenGestureTimer = self->_tellMeWhenGestureTimer;
  self->_tellMeWhenGestureTimer = 0LL;
}

- (void)_startTellMeWhenTimerWithSelector:(SEL)a3
{
}

- (void)_startTellMeWhenTimerWithSelector:(SEL)a3 interval:(double)a4
{
  if (self->_tellMeWhenGestureTimer) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  796LL,  "-[SCATGestureProvider _startTellMeWhenTimerWithSelector:interval:]",  @"Should have cleared tell-me-when timer before starting a new gesture.");
  }
  if (a4 == 0.0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    a4 = dbl_100118030[[v7 switchControlScanningStyle] == 0];
  }

  id v8 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  a3,  0LL,  1LL,  a4));
  tellMeWhenGestureTimer = self->_tellMeWhenGestureTimer;
  self->_tellMeWhenGestureTimer = v8;
}

- (void)_clearArrowView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider arrowView](self, "arrowView"));
  [v3 removeFromSuperview];

  -[SCATGestureProvider setArrowView:](self, "setArrowView:", 0LL);
}

- (void)_setNumberOfFingersForGestures:(unint64_t)a3
{
  if (self->_numberOfFingersForGestures != a3)
  {
    self->_numberOfFingersForGestures = a3;
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v5 setPreference:v4 forKey:@"ScannerNumberOfFingers"];
  }

- (unint64_t)_numberOfFingersWithGestureSheet:(BOOL)a3
{
  if (a3) {
    return self->_numberOfFingersForGestures;
  }
  if (-[SCATGestureProvider lineGestureState](self, "lineGestureState")) {
    return self->_numberOfFingersForGestures;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));

  if (v4) {
    return self->_numberOfFingersForGestures;
  }
  else {
    return 1LL;
  }
}

- (unint64_t)_numberOfFingers
{
  return -[SCATGestureProvider _numberOfFingersWithGestureSheet:]( self,  "_numberOfFingersWithGestureSheet:",  -[SCATMenu containsGestureSheet](self->_menu, "containsGestureSheet"));
}

- (void)_setShowsFingers:(BOOL)a3
{
  if (self->_showsFingers != a3)
  {
    BOOL v3 = a3;
    self->_showsFingers = a3;
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureProvider:self didShowFingers:v3];
  }

- (void)_updateShowsFingers
{
  unsigned int v3 = -[SCATGestureProvider isHidden](self, "isHidden");
  if ((v3 & 1) != 0
    || (id)-[SCATMenu tipObject](self->_menu, "tipObject") == (id)1
    || -[SCATGestureProvider lineGestureState](self, "lineGestureState"))
  {
    -[SCATGestureProvider _setShowsFingers:](self, "_setShowsFingers:", v3 ^ 1);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
    if (v5) {
      BOOL v4 = 1LL;
    }
    else {
      BOOL v4 = -[SCATGestureProvider shouldAllowFingersForContinuousGesture](self, "shouldAllowFingersForContinuousGesture");
    }
    -[SCATGestureProvider _setShowsFingers:](self, "_setShowsFingers:", v4);
  }

- (CGRect)_rectForFingers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  [v5 rectForFingersAtPoints:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_rectToClearForPinchGesture
{
  double v4 = v3;
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  [v8 bounds];
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultPinchLocationsAroundPoint:withinBounds:",  v4,  v6,  v9,  v10,  v11,  v12));
  -[SCATGestureProvider _rectForFingers:](self, "_rectForFingers:", v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)rectToClearForFingersWithGestureSheet:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = -[SCATGestureProvider _numberOfFingersWithGestureSheet:](self, "_numberOfFingersWithGestureSheet:", v3);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerContainerView]);
  [v11 bounds];
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:",  v9,  v6,  v8,  v12,  v13,  v14,  v15));

  -[SCATGestureProvider _rectForFingers:](self, "_rectForFingers:", v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)_clearLineGestureState
{
  if (-[SCATGestureProvider lineGestureState](self, "lineGestureState"))
  {
    -[SCATGestureProvider setLineGestureState:](self, "setLineGestureState:", 0LL);
    BOOL v3 = (SCATPointPicker *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
    lineGesturePointPicker = self->_lineGesturePointPicker;

    if (v3 == lineGesturePointPicker)
    {
      -[SCATGestureProvider setCurrentSwitchController:](self, "setCurrentSwitchController:", 0LL);
      double v5 = self->_lineGesturePointPicker;
      self->_lineGesturePointPicker = 0LL;
    }

    else
    {
      -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
    }

    -[SCATGestureProvider _clearArrowView](self, "_clearArrowView");
  }

- (id)_promptForLineGesture:(unint64_t)a3
{
  if (a3 > 2) {
    return 0LL;
  }
  id v3 = sub_10002B014(off_100123998[a3]);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)_startPickingEndPointForLineGesture:(unint64_t)a3
{
  if (-[SCATGestureProvider lineGestureState](self, "lineGestureState")
    && (id)-[SCATGestureProvider lineGestureState](self, "lineGestureState") != (id)2)
  {
    unint64_t v13 = -[SCATGestureProvider lineGestureState](self, "lineGestureState");
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  937LL,  "-[SCATGestureProvider _startPickingEndPointForLineGesture:]",  @"Was in unexpected state %lu before trying to pick a point for a line gesture");
  }

  -[SCATGestureProvider setLineGestureState:](self, "setLineGestureState:", 1LL, v13);
  -[SCATGestureProvider setLineGestureType:](self, "setLineGestureType:", a3);
  lineGesturePointPicker = self->_lineGesturePointPicker;
  if (!lineGesturePointPicker)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v7 = [v6 assistiveTouchScanningMode];

    if (v7) {
      double v8 = (SCATPointPicker *)objc_claimAutoreleasedReturnValue( +[SCATPointPicker mostSuitablePointPickerWithMenu:]( &OBJC_CLASS___SCATPointPicker,  "mostSuitablePointPickerWithMenu:",  self->_menu));
    }
    else {
      double v8 = (SCATPointPicker *)objc_claimAutoreleasedReturnValue( +[SCATPointPicker pointPickerWithMode:menu:]( &OBJC_CLASS___SCATPointPicker,  "pointPickerWithMode:menu:",  1LL,  self->_menu));
    }
    unint64_t v9 = v8;
    -[SCATPointPicker setShouldKeepScannerAwake:](v8, "setShouldKeepScannerAwake:", 1LL);
    -[SCATPointPicker setDelegate:](v9, "setDelegate:", self);
    double v10 = self->_lineGesturePointPicker;
    self->_lineGesturePointPicker = v9;

    lineGesturePointPicker = self->_lineGesturePointPicker;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](lineGesturePointPicker, "visualProvider"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _promptForLineGesture:](self, "_promptForLineGesture:", a3));
  [v11 setPrompt:v12];

  -[SCATGestureProvider _clearArrowView](self, "_clearArrowView");
  -[SCATGestureProvider setCurrentSwitchController:](self, "setCurrentSwitchController:", self->_lineGesturePointPicker);
}

- (void)_startConfirmingLineGestureWithEndpoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((id)-[SCATGestureProvider lineGestureState](self, "lineGestureState") != (id)1)
  {
    unint64_t v14 = -[SCATGestureProvider lineGestureState](self, "lineGestureState");
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  1011LL,  "-[SCATGestureProvider _startConfirmingLineGestureWithEndpoint:]",  @"Was in unexpected state %lu before trying to pick a point for a line gesture");
  }

  -[SCATGestureProvider setLineGestureState:](self, "setLineGestureState:", 2LL, v14);
  lineGesturePointPicker = self->_lineGesturePointPicker;
  self->_lineGesturePointPicker = 0LL;

  -[SCATGestureProvider setCurrentSwitchController:](self, "setCurrentSwitchController:", 0LL);
  -[SCATGestureProvider setEndPointForLineGesture:](self, "setEndPointForLineGesture:", x, y);
  double v15 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuConfirmGestureSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuConfirmGestureSheet setDelegate:](v15, "setDelegate:", self);
  -[SCATMenu presentWithRootLevelSheet:useCurrentElementAndPoint:]( self->_menu,  "presentWithRootLevelSheet:useCurrentElementAndPoint:",  v15,  1LL);
  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_alloc_init(&OBJC_CLASS___SCATGestureArrowView);
  -[SCATGestureArrowView setStyle:](v11, "setStyle:", 6LL);
  -[SCATGestureArrowView setStartPoint:endPoint:](v11, "setStartPoint:endPoint:", v8, v10, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewForGestureProvider:self]);

  [v13 insertSubview:v11 atIndex:0];
  -[SCATGestureProvider setArrowView:](self, "setArrowView:", v11);
}

- (void)didChooseFavorites:(id)a3
{
  double v4 = -[SCATModernMenuCustomGesturesSheet initWithType:menu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuCustomGesturesSheet),  "initWithType:menu:",  0LL,  self->_menu);
  -[SCATModernMenuCustomGesturesSheet setDelegate:](v4, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (void)didChooseFlickGesture:(id)a3
{
  double v4 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuGestureFlickSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuGestureFlickSheet setDelegate:](v4, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (void)didChoosePanGesture:(id)a3
{
  double v4 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuGesturePanSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuGesturePanSheet setDelegate:](v4, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (void)didChoosePinchGesture:(id)a3
{
  double v4 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuGesturePinchSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuGesturePinchSheet setDelegate:](v4, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (void)didChooseDragGesture:(id)a3
{
}

- (void)didChooseHoldAndDragGesture:(id)a3
{
}

- (void)didChooseDoubleTapGesture:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 menu]);
  -[SCATGestureProvider setStartingDisplayIDForGestures:]( self,  "setStartingDisplayIDForGestures:",  [v4 currentDisplayID]);

  -[SCATGestureProvider _performTapGestureForDoubleTap:](self, "_performTapGestureForDoubleTap:", 1LL);
  -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
}

- (void)didChooseFingers:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 menu]);
  -[SCATGestureProvider setStartingDisplayIDForGestures:]( self,  "setStartingDisplayIDForGestures:",  [v4 currentDisplayID]);

  double v5 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuGestureFingersSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuGestureFingersSheet setDelegate:](v5, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v5);
}

- (void)didChooseDrawingGesture:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 menu]);
  -[SCATGestureProvider setStartingDisplayIDForGestures:]( self,  "setStartingDisplayIDForGestures:",  [v4 currentDisplayID]);

  double v5 = objc_alloc(&OBJC_CLASS___SCATGestureDrawingElementManager);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _startingPointsAsStrings](self, "_startingPointsAsStrings"));
  double v7 = -[SCATGestureDrawingElementManager initWithStartingFingerPositions:menu:]( v5,  "initWithStartingFingerPositions:menu:",  v6,  self->_menu);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](v7, "drawingViewController"));
  [v8 setDelegate:self];

  -[SCATGestureProvider setCurrentSwitchController:](self, "setCurrentSwitchController:", v7);
  drawingElementManager = self->_drawingElementManager;
  self->_drawingElementManager = v7;

  -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", 0.0);
}

- (unint64_t)numberOfFingers
{
  return self->_numberOfFingersForGestures;
}

- (void)_didChooseFlickWithAngle:(double)a3 name:(id)a4
{
}

- (void)didChooseFlickDown:(id)a3
{
}

- (void)didChooseFlickUp:(id)a3
{
}

- (void)didChooseFlickLeft:(id)a3
{
}

- (void)didChooseFlickRight:(id)a3
{
}

- (void)didChooseArbitraryFlick:(id)a3
{
}

- (void)didChooseForceTouchGesture:(id)a3
{
}

- (void)_didChoosePanWithName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  double v10 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuStopContinuousGestureSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuStopContinuousGestureSheet setDelegate:](v10, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v10);
  -[SCATGestureProvider _prepareToBeginContinuousGesture](self, "_prepareToBeginContinuousGesture");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 legacyPressFingersDown]);

  -[SCATGestureProvider _startTellMeWhenTimerWithSelector:](self, "_startTellMeWhenTimerWithSelector:", a4);
  -[SCATGestureProvider _initializeContinuousGestureDataWithName:points:]( self,  "_initializeContinuousGestureDataWithName:points:",  v6,  v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _startingPointsAsStrings](self, "_startingPointsAsStrings"));
  -[SCATGestureProvider setPanFingerPositions:](self, "setPanFingerPositions:", v9);
}

- (void)didChoosePanLeft:(id)a3
{
}

- (void)didChoosePanRight:(id)a3
{
}

- (void)didChoosePanUp:(id)a3
{
}

- (void)didChoosePanDown:(id)a3
{
}

- (void)_didChoosePinchItemWithName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  double v18 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuStopContinuousGestureSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuStopContinuousGestureSheet setDelegate:](v18, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v18);
  -[SCATGestureProvider _prepareToBeginContinuousGesture](self, "_prepareToBeginContinuousGesture");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 legacyPressFingersDown]);

  -[SCATGestureProvider _startTellMeWhenTimerWithSelector:](self, "_startTellMeWhenTimerWithSelector:", a4);
  -[SCATGestureProvider _initializeContinuousGestureDataWithName:points:]( self,  "_initializeContinuousGestureDataWithName:points:",  v6,  v8);

  if ([v8 count] != (id)2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  1278LL,  "-[SCATGestureProvider _didChoosePinchItemWithName:selector:]",  @"Should always have two fingers when pinching.");
  }
  double v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
  CGPoint v10 = CGPointFromString(v9);

  double v11 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
  CGPoint v12 = CGPointFromString(v11);

  AX_CGPointGetMidpointToPoint(v10.x, v10.y, v12.x, v12.y);
  -[SCATGestureProvider setPinchFulcrum:](self, "setPinchFulcrum:");
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  double v14 = v10.y - v13;
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  -[SCATGestureProvider setPinchAngle:](self, "setPinchAngle:", atan2(v14, v10.x - v15));
  -[SCATGestureProvider pinchFulcrum](self, "pinchFulcrum");
  -[SCATGestureProvider setPinchRadius:](self, "setPinchRadius:", AX_CGPointGetDistanceToPoint(v10.x, v10.y, v16, v17));
  -[SCATGestureProvider setPinchFingerOriginalPositions:](self, "setPinchFingerOriginalPositions:", v8);
}

- (void)didChoosePinchIn:(id)a3
{
}

- (void)didChoosePinchOut:(id)a3
{
}

- (void)didChooseRotateClockwise:(id)a3
{
}

- (void)didChooseRotateCounterclockwise:(id)a3
{
}

- (void)didPushPinchItemsViewController:(id)a3
{
}

- (void)didChooseStop:(id)a3
{
}

- (CGRect)rectToClearForStop:(id)a3
{
  if (-[SCATGestureProvider isPinching](self, "isPinching", a3))
  {
    -[SCATGestureProvider _rectToClearForPinchGesture](self, "_rectToClearForPinchGesture");
  }

  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }

  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)nameForConfirmationButton:(id)a3
{
  unint64_t v3 = -[SCATGestureProvider lineGestureType](self, "lineGestureType", a3);
  if (v3 > 2)
  {
    double v5 = 0LL;
  }

  else
  {
    id v4 = sub_10002B014(off_1001239B0[v3]);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v5;
}

- (void)didConfirmGesture:(id)a3
{
}

- (void)didRequestRedoGesture:(id)a3
{
}

- (void)fingerItemsViewController:(id)a3 didChooseNumberOfFingers:(unint64_t)a4
{
}

- (id)contextForCustomGestureItemsViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewForGestureProvider:self]);

  return v5;
}

- (id)_repositionedGestureFromOriginalGesture:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  [v5 midpointOfStartingFingersForGesture:v4];
  double v7 = v6;
  double v9 = v8;

  -[SCATGestureProvider _startingPointForGestures](self, "_startingPointForGestures");
  CGPoint v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureShiftedByOffset:", v10 - v7, v11 - v9));

  [v12 setShouldPerformAtOriginalLocation:1];
  return v12;
}

- (void)customGestureItemsViewController:(id)a3 didChooseGesture:(id)a4
{
  id v11 = a4;
  if ([a3 type] == 1)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assistiveTouchSavedGestures]);
    double v8 = (NSMutableArray *)[v7 mutableCopy];

    if (!v8) {
      double v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
    }
    -[NSMutableArray addObject:](v8, "addObject:", v11);
    [v6 setAssistiveTouchSavedGestures:v8];
    -[SCATMenu popSheet](self->_menu, "popSheet");
  }

  else
  {
    if ([v11 shouldPerformAtOriginalLocation])
    {
      id v9 = v11;
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( -[SCATGestureProvider _repositionedGestureFromOriginalGesture:]( self,  "_repositionedGestureFromOriginalGesture:",  v11));

      id v9 = (id)v10;
    }

    id v11 = v9;
    -[SCATGestureProvider _performGesture:](self, "_performGesture:", v9);
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
  }
}

- (void)didChooseAddRecentInCustomGestureItemsViewController:(id)a3
{
  id v4 = -[SCATModernMenuCustomGesturesSheet initWithType:menu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuCustomGesturesSheet),  "initWithType:menu:",  1LL,  self->_menu);
  -[SCATModernMenuCustomGesturesSheet setDelegate:](v4, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (void)didChooseCreateInCustomGestureItemsViewController:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider delegate](self, "delegate", a3));
  [v4 didChooseCreateCustomGestureFromGestureProvider:self];
}

- (void)setShouldAllowFingersForContinuousGesture:(BOOL)a3
{
  if (self->_shouldAllowFingersForContinuousGesture != a3)
  {
    self->_shouldAllowFingersForContinuousGesture = a3;
    -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
  }

- (void)performTapAndHold
{
  double v5 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuStopContinuousGestureSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuStopContinuousGestureSheet setDelegate:](v5, "setDelegate:", self);
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v5);
  -[SCATGestureProvider setShouldAllowFingersForContinuousGesture:]( self,  "setShouldAllowFingersForContinuousGesture:",  1LL);
  -[SCATGestureProvider _prepareToBeginContinuousGesture](self, "_prepareToBeginContinuousGesture");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 legacyPressFingersDown]);

  -[SCATGestureProvider _initializeContinuousGestureDataWithName:points:]( self,  "_initializeContinuousGestureDataWithName:points:",  @"TAP_AND_HOLD",  v4);
}

- (void)performTap
{
}

- (id)gesturesSheet
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___SCATModernMenuGesturesSheet);
  menu = self->_menu;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 switchControlGesturesMenuItems]);
  double v7 = -[SCATModernMenuSimpleSheet initWithMenu:menuItemDictionaryArray:]( v3,  "initWithMenu:menuItemDictionaryArray:",  menu,  v6);

  return v7;
}

- (void)replayGesture:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005D3C8;
  v6[3] = &unk_100121D40;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  id v5 = v7;
  [v5 performGesture:v4 completion:v6];
}

- (void)performHoldAtPoint:(CGPoint)a3 isDown:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = SWCHLogCommon(self);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000AF750(v4, v9, x, y);
  }

  double v11 = AXSwitchRecipeHoldPointNone[0];
  double v10 = AXSwitchRecipeHoldPointNone[1];
  if (x == AXSwitchRecipeHoldPointNone[0] && y == v10) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  1495LL,  "-[SCATGestureProvider performHoldAtPoint:isDown:]",  @"Should not have passed in a nonexistent point to the long press perform method.");
  }
  id v13 = -[SCATGestureProvider currentHoldPoint](self, "currentHoldPoint");
  if (v4)
  {
    if (v14 != v11 || v15 != v10)
    {
      uint64_t v17 = SWCHLogCommon(v13);
      double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000AF678(self, v18);
      }

      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
      [v19 liftFingersUpAnimated:1];
    }

    -[SCATGestureProvider setCurrentHoldPoint:](self, "setCurrentHoldPoint:", x, y);
    -[SCATGestureProvider _setShowsFingers:](self, "_setShowsFingers:", 1LL);
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
    [v20 pressFingersDownAnimated:1];
  }

  else
  {
    if (v14 == x && v15 == y)
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
      [v21 liftFingersUpAnimated:1];

      -[SCATGestureProvider _setShowsFingers:](self, "_setShowsFingers:", 0LL);
      -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
      -[SCATGestureProvider setCurrentHoldPoint:](self, "setCurrentHoldPoint:", v11, v10);
      return;
    }

    uint64_t v22 = SWCHLogCommon(v13);
    double v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000AF710((os_log_t)v20);
    }
  }
}

- (void)menuWillAppear:(id)a3
{
  id v5 = a3;
  if ((id)-[SCATGestureProvider lineGestureState](self, "lineGestureState") != (id)2)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 screenPoint]);
    -[SCATGestureProvider _updateStartingPointForGesturesWithScreenPoint:forDisplayID:]( self,  "_updateStartingPointForGesturesWithScreenPoint:forDisplayID:",  v4,  [v5 currentDisplayID]);
  }

  -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
}

- (void)menuDidAppear:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 currentSheet]);
  unsigned int v5 = [v4 allowsExitAction];

  double v6 = 1.0;
  if (v5) {
    double v6 = 0.5;
  }
  -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", v6);
}

- (void)menuWillDisappear:(id)a3
{
}

- (void)menuDidDisappear:(id)a3
{
  if ((id)-[SCATGestureProvider lineGestureState](self, "lineGestureState", a3) == (id)2) {
    -[SCATGestureProvider _clearLineGestureState](self, "_clearLineGestureState");
  }
  if (-[SCATGestureProvider _isPerformingContinuousGesture](self, "_isPerformingContinuousGesture"))
  {
    -[SCATGestureProvider _clearTellMeWhenTimer](self, "_clearTellMeWhenTimer");
    -[SCATGestureProvider _handleCompletedContinuousGesture](self, "_handleCompletedContinuousGesture");
  }

  else
  {
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
  }

  if (-[SCATGestureProvider isPinching](self, "isPinching")) {
    -[SCATGestureProvider _endPinchMode](self, "_endPinchMode");
  }
  -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
}

- (void)menuDidFinishTransition:(id)a3
{
  if (!-[SCATGestureProvider _isPerformingContinuousGesture](self, "_isPerformingContinuousGesture", a3)) {
    -[SCATGestureProvider _updateVisibleFingers](self, "_updateVisibleFingers");
  }
}

- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4
{
}

- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4
{
  return 0;
}

- (void)touchDownForDrawingViewController:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController", a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 legacyPressFingersDown]);

  -[SCATGestureProvider _initializeContinuousGestureDataWithName:points:]( self,  "_initializeContinuousGestureDataWithName:points:",  @"DRAWING",  v5);
}

- (void)touchUpForDrawingViewController:(id)a3
{
  if (-[SCATGestureProvider _isPerformingContinuousGesture](self, "_isPerformingContinuousGesture", a3)) {
    -[SCATGestureProvider _handleCompletedContinuousGesture](self, "_handleCompletedContinuousGesture");
  }
}

- (BOOL)drawingViewController:(id)a3 moveFingersToPoints:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider _fingerController](self, "_fingerController"));
  unsigned int v7 = [v6 moveFingersToPoints:v5];

  if (v7 && -[SCATGestureProvider _isPerformingContinuousGesture](self, "_isPerformingContinuousGesture")) {
    -[SCATGestureProvider _addPointsToContinuousGestureData:](self, "_addPointsToContinuousGestureData:", v5);
  }

  return v7;
}

- (void)exitDrawingViewController:(id)a3
{
  drawingElementManager = self->_drawingElementManager;
  if (drawingElementManager)
  {
    self->_drawingElementManager = 0LL;

    -[SCATGestureProvider setCurrentSwitchController:](self, "setCurrentSwitchController:", 0LL);
  }

- (void)drawingViewController:(id)a3 shouldResetScanningFromElement:(id)a4
{
  id v9 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a3 drawingElementManager]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));

  if (v6 == v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureProvider:self shouldResetScanningFromElement:v9];
  }
}

- (void)setCurrentSwitchController:(id)a3
{
  id v5 = (SCATElementManager *)a3;
  p_currentSwitchController = &self->_currentSwitchController;
  if (self->_currentSwitchController != v5)
  {
    uint64_t v8 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&self->_currentSwitchController, a3);
      -[SCATGestureProvider _requestSwitchControllerPrivileges](self, "_requestSwitchControllerPrivileges");
    }

    else
    {
      -[SCATGestureProvider _resignSwitchControllerPrivileges](self, "_resignSwitchControllerPrivileges");
      unsigned int v7 = *p_currentSwitchController;
      *p_currentSwitchController = 0LL;
    }

    -[SCATGestureProvider _updateShowsFingers](self, "_updateShowsFingers");
    id v5 = v8;
  }
}

- (void)_requestSwitchControllerPrivileges
{
  self->_needsScanning = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldStartScanningGestureProvider:self];
}

- (void)_resignSwitchControllerPrivileges
{
  self->_needsScanning = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldEndScanningGestureProvider:self];
}

- (BOOL)canBeActiveElementManager
{
  return self->_needsScanning;
}

- (id)firstElementWithOptions:(int *)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstElementWithOptions:a3]);

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElementWithOptions:a3]);

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementAfter:v8 didWrap:a4 options:a5]);

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementBefore:v8 didWrap:a4 options:a5]);

  return v10;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  [v5 scannerWillMakeManagerActive:v4];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  [v7 scannerWillMakeManagerActive:v6 forDisplayID:v4];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  [v8 scannerWillMakeManagerInactive:v7 activeElementManager:v6];
}

- (BOOL)shouldKeepScannerAwake
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  unsigned __int8 v3 = [v2 shouldKeepScannerAwake];

  return v3;
}

- (BOOL)allowsDwellSelection
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  unsigned __int8 v3 = [v2 allowsDwellSelection];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  unsigned __int8 v3 = [v2 allowsDwellScanningToAbortAfterTimeout];

  return v3;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureProvider currentSwitchController](self, "currentSwitchController"));
  unsigned __int8 v9 = [v8 handleInputAction:v7 withElement:v6];

  return v9;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATGestureProvider;
  id v6 = a4;
  id v7 = a3;
  -[SCATElementManager driver:willFocusOnContext:](&v9, "driver:willFocusOnContext:", v7, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider currentSwitchController]( self,  "currentSwitchController",  v9.receiver,  v9.super_class));
  [v8 driver:v7 willFocusOnContext:v6];
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATGestureProvider;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[SCATElementManager driver:didFocusOnContext:oldContext:](&v12, "driver:didFocusOnContext:oldContext:", v10, v9, v8);
  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider currentSwitchController]( self,  "currentSwitchController",  v12.receiver,  v12.super_class));
  [v11 driver:v10 didFocusOnContext:v9 oldContext:v8];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATGestureProvider;
  id v6 = a4;
  id v7 = a3;
  -[SCATElementManager driver:willUnfocusFromContext:](&v9, "driver:willUnfocusFromContext:", v7, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureProvider currentSwitchController]( self,  "currentSwitchController",  v9.receiver,  v9.super_class));
  [v8 driver:v7 willUnfocusFromContext:v6];
}

- (void)fingersElement:(id)a3 didBecomeFocused:(BOOL)a4
{
  if (a4) {
    -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", a3, 1.0);
  }
  else {
    -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", a3, 0.5);
  }
}

- (void)didActivateFingersElement:(id)a3
{
}

- (SCATGestureProviderDelegate)delegate
{
  return (SCATGestureProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (CGPoint)startingScreenPointForGestures
{
  double x = self->_startingScreenPointForGestures.x;
  double y = self->_startingScreenPointForGestures.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingScreenPointForGestures:(CGPoint)a3
{
  self->_startingScreenPointForGestures = a3;
}

- (SCATElementManager)currentSwitchController
{
  return self->_currentSwitchController;
}

- (SCATGestureArrowView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
}

- (unsigned)startingDisplayIDForGestures
{
  return self->_startingDisplayIDForGestures;
}

- (NSArray)panFingerPositions
{
  return self->_panFingerPositions;
}

- (void)setPanFingerPositions:(id)a3
{
}

- (BOOL)isPinching
{
  return self->_isPinching;
}

- (void)setIsPinching:(BOOL)a3
{
  self->_isPinching = a3;
}

- (NSArray)pinchFingerOriginalPositions
{
  return self->_pinchFingerOriginalPositions;
}

- (void)setPinchFingerOriginalPositions:(id)a3
{
}

- (CGPoint)pinchFulcrum
{
  double x = self->_pinchFulcrum.x;
  double y = self->_pinchFulcrum.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPinchFulcrum:(CGPoint)a3
{
  self->_pinchFulcrum = a3;
}

- (double)pinchRadius
{
  return self->_pinchRadius;
}

- (void)setPinchRadius:(double)a3
{
  self->_pinchRadius = a3;
}

- (double)pinchAngle
{
  return self->_pinchAngle;
}

- (void)setPinchAngle:(double)a3
{
  self->_pinchAngle = a3;
}

- (unint64_t)lineGestureState
{
  return self->_lineGestureState;
}

- (void)setLineGestureState:(unint64_t)a3
{
  self->_lineGestureState = a3;
}

- (unint64_t)lineGestureType
{
  return self->_lineGestureType;
}

- (void)setLineGestureType:(unint64_t)a3
{
  self->_lineGestureType = a3;
}

- (CGPoint)endPointForLineGesture
{
  double x = self->_endPointForLineGesture.x;
  double y = self->_endPointForLineGesture.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPointForLineGesture:(CGPoint)a3
{
  self->_endPointForLineGesture = a3;
}

- (BOOL)shouldAllowFingersForContinuousGesture
{
  return self->_shouldAllowFingersForContinuousGesture;
}

- (double)alphaForFingers
{
  return self->_alphaForFingers;
}

- (CGPoint)currentHoldPoint
{
  double x = self->_currentHoldPoint.x;
  double y = self->_currentHoldPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentHoldPoint:(CGPoint)a3
{
  self->_currentHoldPoint = a3;
}

- (void).cxx_destruct
{
}

@end