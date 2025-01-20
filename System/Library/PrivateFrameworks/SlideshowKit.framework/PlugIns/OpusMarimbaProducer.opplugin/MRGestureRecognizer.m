@interface MRGestureRecognizer
- (CGPoint)_localPointFromTouchPoint:(CGPoint)a3;
- (CGSize)referenceSize;
- (MCAction)cancelAction;
- (MCAction)endAction;
- (MCAction)startAction;
- (MCAction)updateAction;
- (MRGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 andSender:(id)a5;
- (NSArray)matrixChain;
- (NSSet)touches;
- (double)referenceScale;
- (double)score;
- (id)description;
- (id)sender;
- (int)state;
- (unsigned)requiredTouchCount;
- (void)_sendAction:(id)a3;
- (void)_sendCancelActions;
- (void)_sendEndActions;
- (void)_sendStartActions;
- (void)_sendUpdateActions;
- (void)abort;
- (void)cleanup;
- (void)recognize;
- (void)setCancelAction:(id)a3;
- (void)setEndAction:(id)a3;
- (void)setMatrixChain:(id)a3;
- (void)setReferenceScale:(double)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRequiredTouchCount:(unsigned __int8)a3;
- (void)setScore:(double)a3;
- (void)setStartAction:(id)a3;
- (void)setState:(int)a3;
- (void)setUpdateAction:(id)a3;
- (void)touchBegan:(id)a3;
- (void)touchEnded:(id)a3;
- (void)touchMoved:(id)a3;
@end

@implementation MRGestureRecognizer

- (MRGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 andSender:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRGestureRecognizer;
  v8 = -[MRGestureRecognizer init](&v13, "init");
  if (v8)
  {
    v8->_renderer = (MRRenderer *)a3;
    v8->_sender = a5;
    -[MRGestureRecognizer setStartAction:](v8, "setStartAction:", a4);
    -[MRRenderer size](v8->_renderer, "size");
    BOOL v10 = v9 <= 1500.0;
    double v11 = 1.0;
    if (!v10) {
      double v11 = 2.0;
    }
    v8->_referenceScale = v11;
  }

  return v8;
}

- (void)cleanup
{
  self->_renderer = 0LL;

  self->_automaticStartAction = 0LL;
  self->_automaticUpdateAction = 0LL;

  self->_automaticEndAction = 0LL;
  self->_automaticCancelAction = 0LL;

  self->_startAction = 0LL;
  self->_updateAction = 0LL;

  self->_endAction = 0LL;
  self->_cancelAction = 0LL;

  self->_sender = 0LL;
  self->_matrixChain = 0LL;

  self->_touchSet = 0LL;
}

- (MCAction)startAction
{
  return -[MRAction mcAction](self->_startAction, "mcAction");
}

- (void)setStartAction:(id)a3
{
  if (a3)
  {
    v4 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self->_renderer);
    self->_startAction = v4;
    -[MRAction setSender:](v4, "setSender:", self->_sender);
  }

- (MCAction)updateAction
{
  return -[MRAction mcAction](self->_updateAction, "mcAction");
}

- (void)setUpdateAction:(id)a3
{
  if (a3)
  {
    v4 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self->_renderer);
    self->_updateAction = v4;
    -[MRAction setSender:](v4, "setSender:", self->_sender);
  }

- (MCAction)endAction
{
  return -[MRAction mcAction](self->_endAction, "mcAction");
}

- (void)setEndAction:(id)a3
{
  if (a3)
  {
    v4 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self->_renderer);
    self->_endAction = v4;
    -[MRAction setSender:](v4, "setSender:", self->_sender);
  }

- (MCAction)cancelAction
{
  return -[MRAction mcAction](self->_cancelAction, "mcAction");
}

- (void)setCancelAction:(id)a3
{
  if (a3)
  {
    v4 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self->_renderer);
    self->_cancelAction = v4;
    -[MRAction setSender:](v4, "setSender:", self->_sender);
  }

- (NSSet)touches
{
  return -[MRTouchSet touches](self->_touchSet, "touches");
}

- (void)touchBegan:(id)a3
{
  if ((self->_state & 0x24) == 0)
  {
    [a3 addGestureRecognizer:self];
    touchSet = self->_touchSet;
    if (touchSet)
    {
      -[MRTouchSet addTouch:](touchSet, "addTouch:", a3);
      if (self->_requiredTouchCount
        && -[MRTouchSet countOfActiveTouches](self->_touchSet, "countOfActiveTouches") > self->_requiredTouchCount)
      {
        -[MRGestureRecognizer abort](self, "abort");
      }

      else
      {
        -[MRTouchSet centroid](self->_touchSet, "centroid");
        -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
        v7.f64[1] = v6;
        self->_offsetFromCentroid = (CGPoint)vaddq_f64( (float64x2_t)self->_offsetFromCentroid,  vsubq_f64((float64x2_t)self->_centroidLocation, v7));
        double scale = self->_scale;
        -[MRTouchSet scale](self->_touchSet, "scale");
        self->_ratioFromScale = scale / v9;
        double rotation = self->_rotation;
        -[MRTouchSet rotation](self->_touchSet, "rotation");
        self->_offsetFromRotation = rotation - v11;
      }
    }

    else
    {
      self->_touchSet = -[MRTouchSet initWithTouch:](objc_alloc(&OBJC_CLASS___MRTouchSet), "initWithTouch:", a3);
      [a3 timestamp];
      self->_hitTime = v12;
      self->_previousHitTime = v12;
      self->_startTime = v12;
      -[MRTouchSet centroid](self->_touchSet, "centroid");
      -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
      self->_previousCentroidLocation.x = v13;
      self->_previousCentroidLocation.y = v14;
      CGPoint previousCentroidLocation = self->_previousCentroidLocation;
      self->_centroidStartLocation = previousCentroidLocation;
      self->_centroidLocation = previousCentroidLocation;
      self->_ratioFromScale = 1.0;
      __asm { FMOV            V0.2D, #1.0 }

      *(_OWORD *)&self->_double scale = _Q0;
    }
  }

- (void)touchMoved:(id)a3
{
  double hitTime = self->_hitTime;
  if (v6 != hitTime)
  {
    self->_previousHitTime = hitTime;
    [a3 timestamp];
    self->_double hitTime = v7;
    self->_CGPoint previousCentroidLocation = self->_centroidLocation;
    -[MRTouchSet centroid](self->_touchSet, "centroid");
    -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
    self->_centroidLocation.x = v8;
    self->_centroidLocation.y = v9;
    self->_previousScale = self->_scale;
    -[MRTouchSet scale](self->_touchSet, "scale");
    double rotation = self->_rotation;
    self->_double scale = v11 * self->_ratioFromScale;
    self->_previousRotation = rotation;
    double v12 = 6.28318531 / (double)-[MRTouchSet countOfActiveTouches](self->_touchSet, "countOfActiveTouches");
    -[MRTouchSet rotation](self->_touchSet, "rotation");
    for (double i = v13 + self->_offsetFromRotation; i - rotation >= v12 * 0.5; double i = i - v12)
      ;
    self->_double rotation = i;
    if (i - rotation <= v12 * -0.5)
    {
      do
        double i = v12 + i;
      while (i - rotation <= v12 * -0.5);
      self->_double rotation = i;
    }
  }

- (void)touchEnded:(id)a3
{
  if (-[NSSet count](-[MRTouchSet touches](self->_touchSet, "touches"), "count"))
  {
    -[MRTouchSet centroid](self->_touchSet, "centroid");
    -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
    v6.f64[1] = v5;
    self->_offsetFromCentroid = (CGPoint)vaddq_f64( (float64x2_t)self->_offsetFromCentroid,  vsubq_f64((float64x2_t)self->_centroidLocation, v6));
    double scale = self->_scale;
    -[MRTouchSet scale](self->_touchSet, "scale");
    self->_ratioFromScale = scale / v8;
    double rotation = self->_rotation;
    -[MRTouchSet rotation](self->_touchSet, "rotation");
    self->_offsetFromRotation = rotation + v10;
  }

- (void)recognize
{
  self->_state = self->_state & 0xFFFFFFE7 | 0x10;
}

- (void)abort
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = -[MRTouchSet touches](self->_touchSet, "touches", 0LL);
  id v4 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeGestureRecognizer:self];
        double v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[MRTouchSet removeAllTouches](self->_touchSet, "removeAllTouches");
  if ((self->_state & 1) != 0) {
    -[MRGestureRecognizer _sendCancelActions](self, "_sendCancelActions");
  }
  self->_state = 32;
}

- (id)description
{
  int state = self->_state;
  if ((state & 1) != 0)
  {
    id v4 = (__CFString *)[@"{ " stringByAppendingString:@"started "];
    int state = self->_state;
    if ((state & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v4 = @"{ ";
  if ((state & 2) != 0)
  {
LABEL_5:
    id v4 = (__CFString *)-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"updated ");
    int state = self->_state;
  }

- (void)_sendStartActions
{
  if (self->_automaticStartAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_startAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendUpdateActions
{
  if (self->_automaticUpdateAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_updateAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendEndActions
{
  if (self->_automaticEndAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_endAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendCancelActions
{
  if (self->_automaticCancelAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_cancelAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendAction:(id)a3
{
  sender = self->_sender;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRLayer, a2);
  if ((objc_opt_isKindOfClass(sender, v6) & 1) != 0)
  {
    double v7 = (NSMutableDictionary *)-[NSObject persistentState](self->_sender, "persistentState");
    if (v7) {
      double v7 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7);
    }
  }

  else
  {
    double v7 = 0LL;
  }

  [a3 setStates:v7];
  -[MRRenderer time](self->_renderer, "time");
  objc_msgSend(a3, "setTime:");
  -[MRGestureRecognizer _addSpecificObjectToAction:](self, "_addSpecificObjectToAction:", a3);
  -[MRRenderer doAction:](self->_renderer, "doAction:", a3);
  -[MRRenderer requestRendering:](self->_renderer, "requestRendering:", 0LL);
}

- (CGPoint)_localPointFromTouchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[MRRenderer size](self->_renderer, "size");
  double v7 = -(v6 - x * 2.0);
  -[MRRenderer size](self->_renderer, "size");
  double v9 = v7 / v8;
  -[MRRenderer size](self->_renderer, "size");
  double v11 = -(v10 - y * 2.0);
  -[MRRenderer size](self->_renderer, "size");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  matrixChain = self->_matrixChain;
  double v14 = v11 / v13;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( matrixChain,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (double i = 0LL; i != v16; double i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(matrixChain);
        }
        double v9 = MRMatrix_UnprojectPoint( (float *)[*(id *)(*((void *)&v22 + 1) + 8 * (void)i) bytes],  v9,  v14);
        double v14 = v19;
      }

      id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( matrixChain,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v16);
  }

  double v20 = v9 + self->_offsetFromCentroid.x;
  double v21 = v14 * (self->_referenceSize.width / self->_referenceSize.height) + self->_offsetFromCentroid.y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (id)sender
{
  return self->_sender;
}

- (NSArray)matrixChain
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setMatrixChain:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (double)referenceScale
{
  return self->_referenceScale;
}

- (void)setReferenceScale:(double)a3
{
  self->_referenceScale = a3;
}

- (unsigned)requiredTouchCount
{
  return self->_requiredTouchCount;
}

- (void)setRequiredTouchCount:(unsigned __int8)a3
{
  self->_requiredTouchCount = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

@end