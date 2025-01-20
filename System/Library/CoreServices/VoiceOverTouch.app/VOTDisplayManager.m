@interface VOTDisplayManager
+ (id)displayManager;
- (AXUIClient)uiClient;
- (BOOL)_isSystemReadyForUI;
- (BOOL)needToShowVOWarningBanner;
- (BOOL)shouldHideCursor;
- (BOOL)uiServerIsReady;
- (CGPath)currentCursorPath;
- (CGRect)_adjustFrameToFitScreen:(CGRect)a3;
- (CGRect)currentCursorFrame;
- (CGRect)currentSonificationPlaybackBounds;
- (NSString)clientIdentifier;
- (NSString)serviceBundleName;
- (VOTDisplayManager)init;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (unsigned)currentCursorContextID;
- (unsigned)currentCursorDisplayID;
- (void)_handleRotorDidChange:(id)a3;
- (void)_setCursorFrameForElement:(id)a3 animated:(BOOL)a4;
- (void)_tvOS_navigationStyleChanged;
- (void)_updateZoom:(CGRect)a3 element:(id)a4;
- (void)beginSonificationPlaybackFromPosition:(double)a3 withDuration:(double)a4;
- (void)clearCursorFrame;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)convertFrameToCursorSpace:(CGRect)a3 displayID:(id)a4 completion:(id)a5;
- (void)convertFramesToCursorSpace:(id)a3 displayID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)flashBrailleInsertedText:(id)a3;
- (void)hideBrailleUI;
- (void)hideMapsExplorationUI;
- (void)hideSonificationPlayhead;
- (void)hideVoiceOverEnabledWarningBanner;
- (void)highlightBrailleDots:(id)a3;
- (void)highlightMapsExplorationSegmentWithIndex:(int64_t)a3;
- (void)pauseSonificationPlaybackAtPosition:(double)a3;
- (void)setCurrentCursorContextID:(unsigned int)a3;
- (void)setCurrentCursorDisplayID:(unsigned int)a3;
- (void)setCurrentCursorFrame:(CGRect)a3;
- (void)setCurrentCursorPath:(CGPath *)a3;
- (void)setCurrentSonificationPlaybackBounds:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8 animated:(BOOL)a9;
- (void)setCursorFrameForElement:(id)a3;
- (void)setCursorFrameForElement:(id)a3 animated:(BOOL)a4;
- (void)setElementFrames:(id)a3;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
- (void)setNeedToShowVOWarningBanner:(BOOL)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)setShouldHideCursor:(BOOL)a3;
- (void)setSonificationPlayheadPosition:(double)a3;
- (void)setUiClient:(id)a3;
- (void)setUiServerIsReady:(BOOL)a3;
- (void)setVoiceOverCaptionText:(id)a3 withRange:(_NSRange)a4 language:(id)a5 voice:(id)a6;
- (void)showBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5;
- (void)showMapsExplorationUIWithCenter:(CGPoint)a3 andData:(id)a4;
- (void)showSonificationPlayheadInPlaybackBounds:(CGRect)a3 atPosition:(double)a4;
- (void)showUIServerBasedItemChooser:(BOOL)a3 withItems:(id)a4;
- (void)showVoiceOverEnabledWarningBanner;
- (void)shutdown;
- (void)updateBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5;
- (void)updateMapsExplorationUIWithCurrentCenter:(CGPoint)a3;
- (void)updateMapsExplorationUIWithCurrentLocation:(CGPoint)a3;
- (void)updateVisualRotor:(id)a3;
- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4;
@end

@implementation VOTDisplayManager

- (void)setShouldHideCursor:(BOOL)a3
{
  if (self->_shouldHideCursor != a3)
  {
    self->_shouldHideCursor = a3;
    -[VOTDisplayManager currentCursorFrame](self, "currentCursorFrame");
    -[VOTDisplayManager setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:]( self,  "setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:",  -[VOTDisplayManager currentCursorPath](self, "currentCursorPath"),  -[VOTDisplayManager currentCursorContextID](self, "currentCursorContextID"),  -[VOTDisplayManager currentCursorDisplayID](self, "currentCursorDisplayID"),  0LL,  1LL,  v4,  v5,  v6,  v7);
  }

+ (id)displayManager
{
  if ((id)objc_opt_class(&OBJC_CLASS___VOTDisplayManager, a2) == a1
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0
    && (AXDeviceIsAudioAccessory() & 1) == 0
    && qword_1001ACE28 != -1)
  {
    dispatch_once(&qword_1001ACE28, &stru_100177770);
  }

  return (id)qword_1001ACE30;
}

- (VOTDisplayManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VOTDisplayManager;
  v2 = -[VOTDisplayManager init](&v13, "init");
  if (v2)
  {
    v3 = (NSLock *)[objc_allocWithZone(NSLock) init];
    lock = v2->_lock;
    v2->_lock = v3;

    double v5 = objc_alloc(&OBJC_CLASS___AXUIClient);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager clientIdentifier](v2, "clientIdentifier"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager serviceBundleName](v2, "serviceBundleName"));
    v8 = -[AXUIClient initWithIdentifier:serviceBundleName:](v5, "initWithIdentifier:serviceBundleName:", v6, v7);

    -[VOTDisplayManager setUiClient:](v2, "setUiClient:", v8);
    -[AXUIClient setDelegate:](v8, "setDelegate:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"_handleRotorDidChange:" name:@"VOTRotorChangedNotification" object:0];

    dispatch_queue_t v10 = dispatch_queue_create("display-queue", 0LL);
    displayQueue = v2->_displayQueue;
    v2->_displayQueue = (OS_dispatch_queue *)v10;

    -[VOTDisplayManager setUiServerIsReady:](v2, "setUiServerIsReady:", 0LL);
    -[VOTDisplayManager setNeedToShowVOWarningBanner:](v2, "setNeedToShowVOWarningBanner:", 0LL);
  }

  return v2;
}

- (NSString)clientIdentifier
{
  return (NSString *)@"VOTAXUIClientIdentifier";
}

- (NSString)serviceBundleName
{
  return (NSString *)@"VoiceOver";
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"VOTRotorChangedNotification" object:0];

  currentCursorPath = self->_currentCursorPath;
  if (currentCursorPath)
  {
    CFRelease(currentCursorPath);
    self->_currentCursorPath = 0LL;
  }

  displayQueue = self->_displayQueue;
  self->_displayQueue = 0LL;

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v6 setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTDisplayManager;
  -[VOTDisplayManager dealloc](&v7, "dealloc");
}

- (void)shutdown
{
  self->_displayShutdown = 1;
}

- (void)clearCursorFrame
{
}

- (void)setCursorFrameForElement:(id)a3
{
}

- (void)setCursorFrameForElement:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  displayQueue = (dispatch_queue_s *)self->_displayQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AE70;
  block[3] = &unk_100177798;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(displayQueue, block);
}

- (void)_setCursorFrameForElement:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_displayShutdown)
  {
    id v27 = v6;
    if (v6)
    {
      [v6 updateFrame];
      if ([v27 path])
      {
        [v27 updatePaths];
        id v7 = [v27 path];
      }

      else
      {
        id v7 = 0LL;
      }

      [v27 frame];
      double x = v12;
      double y = v13;
      double width = v14;
      double height = v15;
      id v6 = v27;
    }

    else
    {
      id v7 = 0LL;
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }

    id v16 = [v6 windowContextId];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v27 uiElement]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 numberWithAXAttribute:2123]);
    id v19 = [v18 unsignedIntValue];

    if ((_DWORD)v16)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      v21 = v20;
      else {
        objc_msgSend(v20, "convertRect:fromContextId:", v16, x, y, width, height);
      }
      double x = v22;
      double y = v23;
      double width = v24;
      double height = v25;

      if (v7)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
        id v7 = [v26 convertPath:v7 fromContextId:v16 fromDisplayId:v19];
      }
    }

    -[VOTDisplayManager setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:animated:]( self,  "setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:animated:",  v7,  v16,  v19,  v27,  0LL,  v4,  x,  y,  width,  height);
    id v6 = v27;
  }
}

- (void)setCursorFrame:(CGRect)a3
{
}

- (void)_updateZoom:(CGRect)a3 element:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (_AXSZoomTouchEnabled())
  {
    else {
      uint64_t v10 = 1LL;
    }
    if ([v9 doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait])
    {
      [v9 textCursorFrame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
      objc_msgSend( v19,  "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:",  v10,  objc_msgSend(v9, "windowContextId"),  objc_msgSend(v9, "displayId"),  v12,  v14,  v16,  v18);
LABEL_15:

      goto LABEL_16;
    }

    if (AXDeviceIsPhoneIdiom())
    {
      if (width <= 250.0 || [v9 doesHaveTraits:kAXButtonTrait])
      {
        if (width <= 100.0 && height <= 100.0) {
          goto LABEL_14;
        }
        double x = AX_CGRectGetCenter(x, y, width, height) + -2.5;
        double y = v20 + -2.5;
      }

      double width = 5.0;
      double height = 5.0;
    }

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8
{
}

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8 animated:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a7;
  v40.origin.double x = CGRectZero.origin.x;
  v40.origin.double y = CGRectZero.origin.y;
  v40.size.double width = CGRectZero.size.width;
  v40.size.double height = CGRectZero.size.height;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  BOOL v20 = CGRectEqualToRect(v40, v43);
  if ((_DWORD)v11 == 1 && !v20)
  {
    -[VOTDisplayManager _adjustFrameToFitScreen:](self, "_adjustFrameToFitScreen:", x, y, width, height);
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;
  }

  -[NSLock lock](self->_lock, "lock");
  if (v10) {
    goto LABEL_8;
  }
  -[VOTDisplayManager currentCursorFrame](self, "currentCursorFrame");
  v44.origin.double x = v25;
  v44.origin.double y = v26;
  v44.size.double width = v27;
  v44.size.double height = v28;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  BOOL v29 = CGRectEqualToRect(v41, v44);
  if (a4 || !v29 || -[VOTDisplayManager currentCursorPath](self, "currentCursorPath"))
  {
LABEL_8:
    -[VOTDisplayManager setCurrentCursorFrame:](self, "setCurrentCursorFrame:", x, y, width, height);
    -[VOTDisplayManager setCurrentCursorContextID:](self, "setCurrentCursorContextID:", v12);
    -[VOTDisplayManager setCurrentCursorDisplayID:](self, "setCurrentCursorDisplayID:", v11);
    -[VOTDisplayManager setCurrentCursorPath:](self, "setCurrentCursorPath:", a4);
    -[NSLock unlock](self->_lock, "unlock");
    if (-[VOTDisplayManager shouldHideCursor](self, "shouldHideCursor"))
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10003B614;
      v39[3] = &unk_100176D38;
      v39[4] = self;
      v30 = objc_retainBlock(v39);
      ((void (*)(void))v30[2])();
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      NSRect v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
      [v31 setObject:v32 forKeyedSubscript:@"animate"];

      v42.origin.double x = x;
      v42.origin.double y = y;
      v42.size.double width = width;
      v42.size.double height = height;
      v33 = NSStringFromRect(v42);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      [v31 setObject:v34 forKeyedSubscript:@"frame"];

      if (a4)
      {
        uint64_t v35 = AX_CGPathCopyDataRepresentation(a4);
        if (v35)
        {
          v36 = (const void *)v35;
          [v31 setObject:v35 forKeyedSubscript:@"path"];
          CFRelease(v36);
        }
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
      [v31 setObject:v37 forKeyedSubscript:@"display"];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
      [v38 sendAsynchronousMessage:v31 withIdentifier:1 targetAccessQueue:0 completion:0];
    }

    -[VOTDisplayManager _updateZoom:element:](self, "_updateZoom:element:", v19, x, y, width, height);
  }

  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (CGRect)_adjustFrameToFitScreen:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v5 = a3.origin.x + a3.size.width;
  double v6 = a3.origin.y + a3.size.height;
  double v7 = fabs(a3.origin.x) + 1.0;
  if (x > 0.0) {
    double v7 = 0.0;
  }
  double v8 = a3.size.width - v7;
  double v9 = fabs(a3.origin.y) + 1.0;
  if (a3.origin.y > 0.0) {
    double v9 = 0.0;
  }
  double v10 = a3.size.height - v9;
  if (sub_10004B7F8())
  {
    else {
      double v11 = v8;
    }
    else {
      double v12 = v10;
    }
  }

  else
  {
    else {
      double v11 = v8;
    }
    else {
      double v12 = v10;
    }
  }

  double v13 = 1.0;
  if (y <= 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = y;
  }
  if (x > 0.0) {
    double v13 = x;
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)setElementFrames:(id)a3
{
  id v8 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v8 count])
  {
    unint64_t v6 = 0LL;
    do
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v6));
      [v4 addObject:v7];

      [v5 addObject:&stru_10017A920];
      ++v6;
    }

    while ((unint64_t)[v8 count] > v6);
  }

  -[VOTDisplayManager setElementFrames:labels:uiClasses:](self, "setElementFrames:labels:uiClasses:", v8, v4, v5);
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v13[0] = @"elementVisualizationFrames";
  v13[1] = @"elementVisualizationFrameLabels";
  v14[0] = v10;
  v14[1] = v9;
  v13[2] = @"elementVisualizationUIClasses";
  v14[2] = v8;
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));

  [v11 sendAsynchronousMessage:v12 withIdentifier:10 targetAccessQueue:0 completion:0];
}

- (void)convertFrameToCursorSpace:(CGRect)a3 displayID:(id)a4 completion:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v20[0] = @"frame";
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v14 = NSStringFromRect(v22);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v20[1] = @"display";
  v21[0] = v15;
  v21[1] = v12;
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003BB10;
  v18[3] = &unk_1001777C0;
  id v19 = v11;
  id v17 = v11;
  [v13 sendAsynchronousMessage:v16 withIdentifier:13 targetAccessQueue:0 completion:v18];
}

- (void)convertFramesToCursorSpace:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v16[0] = @"frames";
  v16[1] = @"display";
  v17[0] = v10;
  v17[1] = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003BCC4;
  void v14[3] = &unk_1001777C0;
  id v15 = v8;
  id v13 = v8;
  [v11 sendAsynchronousMessage:v12 withIdentifier:14 targetAccessQueue:0 completion:v14];
}

- (void)_handleRotorDidChange:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"kVOTRotorChangedNotificationNewRotor"]);
  unsigned int v6 = [v5 intValue];

  -[VOTDisplayManager setShouldHideCursor:](self, "setShouldHideCursor:", v6 == 54);
}

- (void)updateVisualRotor:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v5 sendAsynchronousMessage:v4 withIdentifier:11 targetAccessQueue:0 completion:0];
}

- (void)showBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
  [v9 notifyZoomWillShowBrailleInputUI];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v16[0] = @"brailleOrientation";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  v17[0] = v11;
  v16[1] = @"brailleDotPositions";
  id v12 = sub_10003BF4C(v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v17[1] = v13;
  void v16[2] = @"brailleTypingMode";
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  void v17[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  [v10 sendAsynchronousMessage:v15 withIdentifier:2 targetAccessQueue:0 completion:0];
}

- (void)hideBrailleUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
  [v3 notifyZoomWillHideBrailleInputUI];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v4 sendAsynchronousMessage:0 withIdentifier:3 targetAccessQueue:0 completion:0];
}

- (void)updateBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v15[0] = @"brailleOrientation";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  v16[0] = v10;
  v15[1] = @"brailleDotPositions";
  id v11 = sub_10003BF4C(v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v16[1] = v12;
  v15[2] = @"brailleTypingMode";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  void v16[2] = v13;
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
  [v9 sendAsynchronousMessage:v14 withIdentifier:5 targetAccessQueue:0 completion:0];
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[VOTDisplayManager _isSystemReadyForUI](self, "_isSystemReadyForUI"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
    id v8 = @"enabled";
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    id v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    [v5 sendAsynchronousMessage:v7 withIdentifier:7 targetAccessQueue:0 completion:0];
  }

- (void)flashBrailleInsertedText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
    double v7 = @"brailleInsertedText";
    id v8 = v4;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    [v5 sendAsynchronousMessage:v6 withIdentifier:6 targetAccessQueue:0 completion:0];
  }
}

- (void)highlightBrailleDots:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  double v7 = @"brailleDotNumbers";
  id v8 = v4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  [v5 sendAsynchronousMessage:v6 withIdentifier:4 targetAccessQueue:0 completion:0];
}

- (void)showMapsExplorationUIWithCenter:(CGPoint)a3 andData:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  v14[0] = @"mapsExplorationCenter";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", x));
  v13[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", y));
  v13[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v14[1] = @"mapsExplorationData";
  v15[0] = v11;
  v15[1] = v7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  [v8 sendAsynchronousMessage:v12 withIdentifier:15 targetAccessQueue:0 completion:0];
}

- (void)hideMapsExplorationUI
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v2 sendAsynchronousMessage:0 withIdentifier:19 targetAccessQueue:0 completion:0];
}

- (void)updateMapsExplorationUIWithCurrentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  id v11 = @"mapsExplorationCenter";
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", x));
  v10[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", y));
  v10[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v12 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  [v5 sendAsynchronousMessage:v9 withIdentifier:17 targetAccessQueue:0 completion:0];
}

- (void)updateMapsExplorationUIWithCurrentLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  id v11 = @"mapsExplorationCurrentLocation";
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", x));
  v10[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", y));
  v10[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v12 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  [v5 sendAsynchronousMessage:v9 withIdentifier:18 targetAccessQueue:0 completion:0];
}

- (void)highlightMapsExplorationSegmentWithIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  id v7 = @"mapsExplorationIndex";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v8 = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v4 sendAsynchronousMessage:v6 withIdentifier:16 targetAccessQueue:0 completion:0];
}

- (BOOL)_isSystemReadyForUI
{
  if (!self->_systemReadyForUI) {
    self->_systemReadyForUI = 1;
  }
  return 1;
}

- (void)setVoiceOverCaptionText:(id)a3 withRange:(_NSRange)a4 language:(id)a5 voice:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003CA5C;
  v18[3] = &unk_1001777E8;
  id v19 = a3;
  BOOL v20 = self;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  id v21 = a5;
  id v22 = a6;
  id v11 = v22;
  id v12 = v21;
  id v13 = v19;
  double v14 = objc_retainBlock(v18);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v14[2])(v14, v15, v16, v17);
}

- (void)showSonificationPlayheadInPlaybackBounds:(CGRect)a3 atPosition:(double)a4
{
}

- (void)setSonificationPlayheadPosition:(double)a3
{
  v10[0] = @"sonificationPlaybackBounds";
  -[VOTDisplayManager currentSonificationPlaybackBounds](self, "currentSonificationPlaybackBounds");
  id v5 = NSStringFromRect(v12);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[1] = @"sonificationPlayheadProgress";
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v9 sendAsynchronousMessage:v8 withIdentifier:21 targetAccessQueue:0 completion:0];
}

- (void)beginSonificationPlaybackFromPosition:(double)a3 withDuration:(double)a4
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = 0.0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v16[0] = @"sonificationPlayheadProgress";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  v17[0] = v8;
  v16[1] = @"sonificationPlaybackBounds";
  -[VOTDisplayManager currentSonificationPlaybackBounds](self, "currentSonificationPlaybackBounds");
  id v9 = NSStringFromRect(v18);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v17[1] = v10;
  void v16[2] = @"sonificationNormalizedPlayheadPosition";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  void v17[2] = v11;
  void v16[3] = @"sonificationDuration";
  NSRect v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  void v17[3] = v12;
  v16[4] = @"sonificationPlaybackStartTime";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
  v17[4] = v13;
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  5LL));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v15 sendAsynchronousMessage:v14 withIdentifier:22 targetAccessQueue:0 completion:0];
}

- (void)pauseSonificationPlaybackAtPosition:(double)a3
{
  v10[0] = @"sonificationPlaybackBounds";
  -[VOTDisplayManager currentSonificationPlaybackBounds](self, "currentSonificationPlaybackBounds");
  id v5 = NSStringFromRect(v12);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[1] = @"sonificationPlayheadProgress";
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v9 sendAsynchronousMessage:v8 withIdentifier:23 targetAccessQueue:0 completion:0];
}

- (void)hideSonificationPlayhead
{
  v7[0] = @"sonificationPlaybackBounds";
  -[VOTDisplayManager currentSonificationPlaybackBounds](self, "currentSonificationPlaybackBounds");
  BOOL v3 = NSStringFromRect(v9);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[1] = @"sonificationPlayheadProgress";
  v8[0] = v4;
  v8[1] = &off_100187538;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v6 sendAsynchronousMessage:v5 withIdentifier:21 targetAccessQueue:0 completion:0];
}

- (void)showVoiceOverEnabledWarningBanner
{
  if (-[VOTDisplayManager uiServerIsReady](self, "uiServerIsReady"))
  {
    -[VOTDisplayManager setNeedToShowVOWarningBanner:](self, "setNeedToShowVOWarningBanner:", 0LL);
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
    [v3 sendAsynchronousMessage:0 withIdentifier:10000 targetAccessQueue:0 completion:0];
  }

  else
  {
    -[VOTDisplayManager setNeedToShowVOWarningBanner:](self, "setNeedToShowVOWarningBanner:", 1LL);
  }

- (void)hideVoiceOverEnabledWarningBanner
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v2 sendAsynchronousMessage:0 withIdentifier:10001 targetAccessQueue:0 completion:0];
}

- (void)_tvOS_navigationStyleChanged
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  id v10 = @"alertText";
  id v3 = off_1001AC148;
  if ([(id)VOTSharedWorkspace tvInteractionMode] == (id)2) {
    id v4 = @"vo.navigation.explore";
  }
  else {
    id v4 = @"vo.navigation.standard";
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  id v6 = sub_10004AE68(v3, v4, 0LL, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v11 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v9 = [v2 sendSynchronousMessage:v8 withIdentifier:24 error:0];
}

- (void)showUIServerBasedItemChooser:(BOOL)a3 withItems:(id)a4
{
  if (a3)
  {
    id v8 = @"items";
    id v9 = a4;
    id v5 = a4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  }

  else
  {
    id v6 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDisplayManager uiClient](self, "uiClient"));
  [v7 sendAsynchronousMessage:v6 withIdentifier:12 targetAccessQueue:0 completion:0];
}

- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4
{
  if (-[VOTDisplayManager needToShowVOWarningBanner](self, "needToShowVOWarningBanner")) {
    -[VOTDisplayManager showVoiceOverEnabledWarningBanner](self, "showVoiceOverEnabledWarningBanner");
  }
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  return 0LL;
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
}

- (CGRect)currentCursorFrame
{
  double x = self->_currentCursorFrame.origin.x;
  double y = self->_currentCursorFrame.origin.y;
  double width = self->_currentCursorFrame.size.width;
  double height = self->_currentCursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentCursorFrame:(CGRect)a3
{
  self->_currentCursorFrame = a3;
}

- (unsigned)currentCursorContextID
{
  return self->_currentCursorContextID;
}

- (void)setCurrentCursorContextID:(unsigned int)a3
{
  self->_currentCursorContextID = a3;
}

- (unsigned)currentCursorDisplayID
{
  return self->_currentCursorDisplayID;
}

- (void)setCurrentCursorDisplayID:(unsigned int)a3
{
  self->_currentCursorDisplayID = a3;
}

- (CGPath)currentCursorPath
{
  return self->_currentCursorPath;
}

- (void)setCurrentCursorPath:(CGPath *)a3
{
}

- (BOOL)shouldHideCursor
{
  return self->_shouldHideCursor;
}

- (AXUIClient)uiClient
{
  return self->_uiClient;
}

- (void)setUiClient:(id)a3
{
}

- (BOOL)uiServerIsReady
{
  return self->_uiServerIsReady;
}

- (void)setUiServerIsReady:(BOOL)a3
{
  self->_uiServerIsReaddouble y = a3;
}

- (BOOL)needToShowVOWarningBanner
{
  return self->_needToShowVOWarningBanner;
}

- (void)setNeedToShowVOWarningBanner:(BOOL)a3
{
  self->_needToShowVOWarningBanner = a3;
}

- (CGRect)currentSonificationPlaybackBounds
{
  double x = self->_currentSonificationPlaybackBounds.origin.x;
  double y = self->_currentSonificationPlaybackBounds.origin.y;
  double width = self->_currentSonificationPlaybackBounds.size.width;
  double height = self->_currentSonificationPlaybackBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentSonificationPlaybackBounds:(CGRect)a3
{
  self->_currentSonificationPlaybackBounds = a3;
}

- (void).cxx_destruct
{
}

@end