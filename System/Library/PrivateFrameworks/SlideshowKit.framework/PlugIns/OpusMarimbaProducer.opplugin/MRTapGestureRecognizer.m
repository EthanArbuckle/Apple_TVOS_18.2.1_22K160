@interface MRTapGestureRecognizer
- (void)_addSpecificObjectToAction:(id)a3;
- (void)recognize;
- (void)touchBegan:(id)a3;
- (void)touchEnded:(id)a3;
- (void)touchMoved:(id)a3;
@end

@implementation MRTapGestureRecognizer

- (void)touchBegan:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTapGestureRecognizer;
  -[MRGestureRecognizer touchBegan:](&v5, "touchBegan:", a3);
  if (!self->super._state)
  {
    NSUInteger v4 = -[NSSet count](-[MRTouchSet touches](self->super._touchSet, "touches"), "count");
    if (v4 == -[MRGestureRecognizer requiredTouchCount](self, "requiredTouchCount"))
    {
      self->super._state = 1;
      -[MRGestureRecognizer _sendStartActions](self, "_sendStartActions");
    }
  }

- (void)touchMoved:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRTapGestureRecognizer;
  -[MRGestureRecognizer touchMoved:](&v7, "touchMoved:");
  self->super._state |= 2u;
  -[MRGestureRecognizer _sendUpdateActions](self, "_sendUpdateActions");
  [a3 timestamp];
  if (v5 - self->super._startTime > 0.5
    || (double v6 = self->super._referenceScale * 20.0,
        self->super._referenceSize.width
      * vabdd_f64(self->super._centroidStartLocation.x, self->super._centroidLocation.x) > v6)
    || self->super._referenceSize.height
     * vabdd_f64(self->super._centroidStartLocation.y, self->super._centroidLocation.y) > v6)
  {
    -[MRGestureRecognizer abort](self, "abort");
  }

- (void)touchEnded:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTapGestureRecognizer;
  -[MRGestureRecognizer touchEnded:](&v6, "touchEnded:", a3);
  if (!-[NSSet count](-[MRTouchSet touches](self->super._touchSet, "touches"), "count"))
  {
    int state = self->super._state;
    if ((state & 1) != 0)
    {
      self->super._int state = state | 0xC;
      LOBYTE(v4) = self->super._requiredTouchCount;
      self->super._score = (double)v4;
    }

    else
    {
      -[MRGestureRecognizer abort](self, "abort");
    }
  }

- (void)recognize
{
  self->super._int state = self->super._state & 0xFFFFFFE7 | 0x10;
  -[MRGestureRecognizer _sendEndActions](self, "_sendEndActions");
}

- (void)_addSpecificObjectToAction:(id)a3
{
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___MRGesturePanZoomRotation);
  [a3 time];
  v6->time = v5;
  *(CGPoint *)&v6->x = self->super._centroidLocation;
  v6->countOfTouches = -[NSSet count](-[MRTouchSet touches](self->super._touchSet, "touches"), "count");
  v6->okToAnimate = 1;
  objc_msgSend(a3, "setSpecificObject:");
}

@end