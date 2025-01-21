@interface BKTouchAnnotationController
+ (id)workQueue;
- (BKDisplayAnnotationController)displayAnnotationController;
- (BKTouchAnnotationController)initWithDisplayUUID:(id)a3;
- (BOOL)shouldVisualizeHitTestRegions;
- (BOOL)shouldVisualizeTouches;
- (OS_dispatch_queue)workQueue;
- (id)_keyPathForTouchIdentifier:(unsigned int)a3;
- (id)_stringByRemovingPrefix:(id)a3 fromString:(id)a4;
- (id)_stringDescribingContextID:(unsigned int)a3 clientPort:(unsigned int)a4;
- (id)_stringDescribingPID:(int)a3;
- (int)_pidForClientPort:(unsigned int)a3;
- (void)_queue_annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6;
- (void)_queue_annotateTouch:(unsigned int)a3 withUniqueString:(id)a4;
- (void)_queue_applyBasicAnnotationTextForTouchIdentifier:(unsigned int)a3 pathIndex:(int64_t)a4;
- (void)_queue_removeAnnotationForTouch:(unsigned int)a3 withUniqueIdentifier:(id)a4;
- (void)_queue_setCenter:(CGPoint)a3 forTouchIdentifier:(unsigned int)a4;
- (void)_queue_touchWasHardCanceled:(unsigned int)a3;
- (void)_queue_touchWasSoftCanceled:(unsigned int)a3;
- (void)_queue_updateHoverStateForTouchIdentifier:(unsigned int)a3 z:(double)a4 maxZ:(double)a5;
- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5;
- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6;
- (void)annotateTouch:(unsigned int)a3 withUniqueString:(id)a4;
- (void)hitTestRegionsDidChange:(id)a3;
- (void)setDisplayAnnotationController:(id)a3;
- (void)setShouldVisualizeHitTestRegions:(BOOL)a3;
- (void)setShouldVisualizeTouches:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)touch:(unsigned int)a3 didAlwaysRouteToContext:(unsigned int)a4 clientPort:(unsigned int)a5;
- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5;
- (void)touch:(unsigned int)a3 didMoveToPoint:(CGPoint)a4 eventMask:(unsigned int)a5 z:(double)a6 maxZ:(double)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidHIDCancel:(unsigned int)a3;
- (void)touchDidSoftCancel:(unsigned int)a3;
- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4;
@end

@implementation BKTouchAnnotationController

- (BKTouchAnnotationController)initWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = [BKTouchAnnotationController class];
  BKTouchAnnotationController *v5 = [[BKTouchAnnotationController alloc] init];
  v7 = v5;
  if (v5)
  {
    id v8 = [v5 workQueue];
    uint64_t v9 = [v8 autorelease];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    id v11 = sub_100019878(v4);
    v12 = [v11 autorelease];
    uint64_t v13 = [BKDisplayAnnotationController annotationControllerForDisplay:v12];
    displayAnnotationController = v7->_displayAnnotationController;
    v7->_displayAnnotationController = (BKDisplayAnnotationController *)v13;
  }

  return v7;
}

- (BOOL)shouldVisualizeTouches
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100025D94;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldVisualizeHitTestRegions
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100025D80;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldVisualizeTouches:(BOOL)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100025D48;
  v4[3] = &unk_1000B7D18;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)setShouldVisualizeHitTestRegions:(BOOL)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100025D10;
  v4[3] = &unk_1000B7D18;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
  id v6 = a4;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025D00;
  block[3] = &unk_1000B80A8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100025CE8;
  v13[3] = &unk_1000B6240;
  unsigned int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  id v10 = a4;
  id v11 = a5;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100025CD4;
  v15[3] = &unk_1000B8140;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  unsigned int v18 = a3;
  int v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(workQueue, v15);
}

- (void)_queue_applyBasicAnnotationTextForTouchIdentifier:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v12 = [NSString stringWithFormat:@"touch.%X.id", a3];
  BKDisplayAnnotation *v7 = [self->_displayAnnotationController annotationForKeyPath:];

  if (!v7)
  {
    id v8 = [NSString stringWithFormat:@"t%X p%d", v5, a4];
    id v9 = [BKDisplayAnnotation annotationWithString:v8];

    BKDisplayAnnotationNullRenderer *v10 = [[BKDisplayAnnotationNullRenderer alloc] init];
    id v11 = [BKDisplayAnnotationStyle colorVariationStyleWithIndex:v5];
    [v9 setStyleModifier:v11];

    [v9 setRenderer:v10];
    [self->_displayAnnotationController setAnnotation:v9 forKeyPath:v12];
  }
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025C8C;
  block[3] = &unk_1000B6268;
  block[4] = self;
  CGPoint v11 = a5;
  unsigned int v15 = a3;
  int64_t v12 = a4;
  double v13 = a7;
  double v14 = a8;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025B4C;
  block[3] = &unk_1000B6290;
  block[4] = self;
  CGPoint v9 = a5;
  int64_t v10 = a4;
  unsigned int v11 = a3;
  unsigned int v12 = a6;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v8 = a4;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100025AAC;
  v11[3] = &unk_1000B6F68;
  v11[4] = self;
  id v12 = v8;
  unsigned int v14 = a3;
  int64_t v13 = a5;
  id v10 = v8;
  dispatch_async(workQueue, v11);
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100025A94;
  v5[3] = &unk_1000B7CF0;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async(workQueue, v5);
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  id v6 = a4;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025A2C;
  block[3] = &unk_1000B80A8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 didMoveToPoint:(CGPoint)a4 eventMask:(unsigned int)a5 z:(double)a6 maxZ:(double)a7
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000259DC;
  v8[3] = &unk_1000B62B8;
  v8[4] = self;
  CGPoint v9 = a4;
  unsigned int v12 = a3;
  double v10 = a7;
  double v11 = a6;
  dispatch_async(workQueue, v8);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002599C;
  v7[3] = &unk_1000B7CF0;
  v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(workQueue, v7);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100025950;
  v6[3] = &unk_1000B7CF0;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(workQueue, v6);
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100025940;
  v4[3] = &unk_1000B7CF0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)touch:(unsigned int)a3 didAlwaysRouteToContext:(unsigned int)a4 clientPort:(unsigned int)a5
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025888;
  block[3] = &unk_1000B62E0;
  block[4] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  unsigned int v9 = a3;
  dispatch_async(workQueue, block);
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100025878;
  v4[3] = &unk_1000B7CF0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)hitTestRegionsDidChange:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100025590;
  v7[3] = &unk_1000B8030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_queue_updateHoverStateForTouchIdentifier:(unsigned int)a3 z:(double)a4 maxZ:(double)a5
{
  uint64_t v5 = *(void *)&a3;
  if (a4 > 0.0 || a5 > 0.0) {
    unsigned int v7 = [@"in range" stringByAppendingFormat:@" max:%.4g z:%.4g", a5, a4];
  }
  else {
    unsigned int v7 = @"in range";
  }
  id v8 = (__CFString *)v7;
  [self _queue_annotateTouch:v5 withString:v7 uniqueIdentifier:@"withinRange" fromPID:0xFFFFFFFFLL];
}

- (void)_queue_annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
}

- (void)_queue_annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  uint64_t v6 = (uint64_t)a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  displayAnnotationController = self->_displayAnnotationController;
  int64_t v13 = [self _keyPathForTouchIdentifier:v8];
  unsigned int v14 = [displayAnnotationController annotationForKeyPath:v13];

  id v15 = sub_10003F198();
  os_log_s *v16 = [v15 autorelease];
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v22 = v8;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 1024;
      int v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "touchIdentifier:%X annotation:%{public}@ pid:%d",  buf,  0x18u);
    }

    id v17 = [NSString stringWithFormat:@"touch.%X.%@", v8, v11];
    if ([v10 length])
    {
      BKDisplayAnnotation *v18 = [BKDisplayAnnotation annotationWithString:v10];
      BKDisplayAnnotationNullRenderer *v19 = [[BKDisplayAnnotationNullRenderer alloc] init];
      [v18 setRenderer:v19];
      if ((int)v6 >= 1)
      {
        v20 = [self _stringDescribingPID:v6];
        [v18 setSection:v20];
      }

      [self->_displayAnnotationController setAnnotation:v18 forKeyPath:v17];
    }

    else
    {
      [self->_displayAnnotationController removeAnnotationsForKeyPath:v17];
    }
  }

  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = v8;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "touchIdentifier %X does not exist; dropping annotation:%{public}@",
      buf,
      0x12u);
  }
}

- (void)_queue_removeAnnotationForTouch:(unsigned int)a3 withUniqueIdentifier:(id)a4
{
}

- (id)_stringByRemovingPrefix:(id)a3 fromString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 length];
  else {
    id v8 = v6;
  }
  unsigned int v9 = v8;

  return v9;
}

- (id)_stringDescribingPID:(int)a3
{
  if (a3 >= 1)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v5 = BSBundleIDForPID(a3, a2);
    id v6 = v5;
    if ([v6 length])
    {
      id v7 = [BKTouchAnnotationController _stringByRemovingPrefix:@"com.apple." fromString:v6];
      id v8 = [v7 stringByAppendingFormat:@" (%d)" v3];
    }

    else
    {
      uint64_t v10 = BSProcessNameForPID(v3);
      id v7 = v10;
      if (![v7 length])
      {
        uint64_t v11 = [NSString stringWithFormat:@"pid %d" v3];
        goto LABEL_8;
      }

      id v8 = [v7 stringByAppendingFormat:@" (%d)" v3];
    }

    uint64_t v11 = v8;
LABEL_8:
    unsigned int v9 = (__CFString *)v11;

    return v9;
  }

  unsigned int v9 = &stru_1000BB628;
  return v9;
}

- (id)_stringDescribingContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [self _pidForClientPort:a4];
  if ((int)v6 < 1)
  {
    int64_t v13 = [NSString stringWithFormat:@"ctx:%X", v4];
  }

  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = BSBundleIDForPID(v6, v7);
    uint64_t v10 = [v9 autorelease];
    uint64_t v11 = [self _stringByRemovingPrefix:@"com.apple." fromString:v10];
    unsigned int v12 = [v11 stringByAppendingFormat:@" (%d)", v8];

    int64_t v13 = [NSString stringWithFormat:@"ctx:%X -- %@", v4, v12];
  }

  return v13;
}

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(self, a2);
  uint64_t v5 = (void *)ClientConnectionManager;
  uint64_t v6 = (void *)[v5 clientForTaskPort:v3];
  uint64_t v7 = v6;
  if (v6) {
    int v8 = [v6 pid];
  }
  else {
    int v8 = -1;
  }

  return v8;
}

- (id)_keyPathForTouchIdentifier:(unsigned int)a3
{
  return [NSString stringWithFormat:@"touch.%X", a3];
}

- (void)_queue_setCenter:(CGPoint)a3 forTouchIdentifier:(unsigned int)a4
{
  double y = a3.y;
  double x = a3.x;
  id v11 = [self _keyPathForTouchIdentifier:a4];
  uint64_t v7 = [self->_displayAnnotationController annotationForKeyPath:];
  if (v7)
  {
    int v8 = [BKDisplayAnnotationLocation centerAtPoint:CGPointMake(x, y)];
    [v7 setLocation:v8];
  }

  else
  {
    BKDisplayAnnotation *v8 = [BKDisplayAnnotation annotationWithEllipseSize:64.0];
    uint64_t v9 = [BKDisplayAnnotationLocation centerAtPoint:CGPointMake(x, y)];
    BKDisplayAnnotationContainedSubnodeRenderer *v10 = [[BKDisplayAnnotationContainedSubnodeRenderer alloc] init];
    [v8 setLocation:v9];
    [v8 setRenderer:v10];
    [self->_displayAnnotationController setAnnotation:v8 forKeyPath:v11];
  }
}

- (void)_queue_touchWasHardCanceled:(unsigned int)a3
{
  id v6 = [self _keyPathForTouchIdentifier:a3];
  uint64_t v4 = [self->_displayAnnotationController annotationForKeyPath:v6];
  uint64_t v5 = [BKDisplayAnnotationStyle canceledStyle];
  [v4 setStyleModifier:v5];

  [self->_displayAnnotationController removeAnnotationsForKeyPath:v6 afterDelay:0.5 queue:self->_workQueue];
}

- (void)_queue_touchWasSoftCanceled:(unsigned int)a3
{
  displayAnnotationController = self->_displayAnnotationController;
  uint64_t v4 = [self _keyPathForTouchIdentifier:a3];
  uint64_t v5 = (void *)[v4 stringByAppendingString:@".ctx"];
  BKDisplayAnnotationController *v6 = [BKDisplayAnnotationController allAnnotationsForKeyPath:v5];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
        int64_t v13 = [BKDisplayAnnotationStyle canceledStyle];
        [v12 setStyleModifier:v13];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:v14 objects:v18 count:16];
    }

    while (v9);
  }
}

- (BKDisplayAnnotationController)displayAnnotationController
{
  return self->_displayAnnotationController;
}

- (void)setDisplayAnnotationController:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)workQueue
{
  if (qword_1000DBFA0 != -1) {
    dispatch_once(&qword_1000DBFA0, &stru_1000B6218);
  }
  return (id)qword_1000DBF98;
}

@end