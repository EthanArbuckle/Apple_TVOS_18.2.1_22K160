@interface HNDGamePadDevice
- (BOOL)_astGameControllerEnabled;
- (BOOL)isCurrentlyTappingAndHolding;
- (BOOL)isIgnoringInputs;
- (CADisplayLink)displayLink;
- (HNDGamePadDevice)init;
- (float)currentLeftXDisplacement;
- (float)currentLeftYDisplacement;
- (float)currentRightXDisplacement;
- (float)currentRightYDisplacement;
- (float)currentXDisplacement;
- (float)currentYDisplacement;
- (void)_sendEventForButtonNumber:(unint64_t)a3 value:(BOOL)a4;
- (void)_sendEventForCurrentDisplacement:(id)a3;
- (void)_toggleIgnoreInputs;
- (void)dealloc;
- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5;
- (void)handleValueCallback:(__IOHIDValue *)a3;
- (void)setCurrentLeftXDisplacement:(float)a3;
- (void)setCurrentLeftYDisplacement:(float)a3;
- (void)setCurrentRightXDisplacement:(float)a3;
- (void)setCurrentRightYDisplacement:(float)a3;
- (void)setCurrentXDisplacement:(float)a3;
- (void)setCurrentYDisplacement:(float)a3;
- (void)setCurrentlyTappingAndHolding:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setIgnoringInputs:(BOOL)a3;
@end

@implementation HNDGamePadDevice

- (HNDGamePadDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HNDGamePadDevice;
  v2 = -[HNDGamePadDevice init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  v2,  "_sendEventForCurrentDisplacement:"));
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v3;

    CAFrameRateRange v9 = CAFrameRateRangeMake(5.0, 30.0, 30.0);
    -[CADisplayLink setPreferredFrameRateRange:]( v2->_displayLink,  "setPreferredFrameRateRange:",  *(double *)&v9.minimum,  *(double *)&v9.maximum,  *(double *)&v9.preferred);
    v5 = v2->_displayLink;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, NSRunLoopCommonModes);
  }

  return v2;
}

- (void)_sendEventForCurrentDisplacement:(id)a3
{
  float v5 = v4;
  -[HNDGamePadDevice currentLeftYDisplacement](self, "currentLeftYDisplacement");
  float v7 = v6;
  -[HNDGamePadDevice currentRightXDisplacement](self, "currentRightXDisplacement");
  float v9 = v8;
  -[HNDGamePadDevice currentRightYDisplacement](self, "currentRightYDisplacement");
  float v10 = -*(float *)&v11;
  HIDWORD(v11) = 1069128089;
  BOOL v12 = fabsf(v5) > 0.1;
  int v13 = fabsf(v7) > 0.1 || v12;
  if (v13) {
    double v14 = 5.0;
  }
  else {
    double v14 = 0.8;
  }
  if (((v13 & 1) != 0 || fabsf(v9) > 0.1 || fabsf(v10) > 0.1)
    && !-[HNDGamePadDevice isIgnoringInputs](self, "isIgnoringInputs"))
  {
    if (v13) {
      float v18 = v5;
    }
    else {
      float v18 = v9;
    }
    double v19 = v14 * v18;
    *(float *)&double v19 = v19;
    if (v13) {
      float v20 = -v7;
    }
    else {
      float v20 = v10;
    }
    *(float *)&double v15 = -v7;
    -[HNDGamePadDevice setCurrentXDisplacement:](self, "setCurrentXDisplacement:", v19, v15);
    double v17 = v14 * v20;
    float v16 = v17;
  }

  else
  {
    float v16 = 0.0;
    LODWORD(v11) = 0;
    -[HNDGamePadDevice setCurrentXDisplacement:](self, "setCurrentXDisplacement:", v11);
  }

  *(float *)&double v17 = v16;
  -[HNDGamePadDevice setCurrentYDisplacement:](self, "setCurrentYDisplacement:", v17);
  -[HNDGamePadDevice currentXDisplacement](self, "currentXDisplacement");
  if (v21 != 0.0 || (-[HNDGamePadDevice currentYDisplacement](self, "currentYDisplacement"), v22 != 0.0))
  {
    id v26 = [objc_allocWithZone((Class)HNDEvent) init];
    [v26 setType:3];
    -[HNDGamePadDevice currentXDisplacement](self, "currentXDisplacement");
    [v26 setDeltaX:v23];
    -[HNDGamePadDevice currentYDisplacement](self, "currentYDisplacement");
    [v26 setDeltaY:v24];
    [v26 setIsGamepadEvent:1];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice delegate](self, "delegate"));
    [v25 device:self didPostEvent:v26];
  }

- (void)_sendEventForButtonNumber:(unint64_t)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[HNDGamePadDevice isIgnoringInputs](self, "isIgnoringInputs"))
  {
    if (v4) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    if (a3 == 4 && v4)
    {
      -[HNDGamePadDevice setCurrentlyTappingAndHolding:]( self,  "setCurrentlyTappingAndHolding:",  -[HNDGamePadDevice isCurrentlyTappingAndHolding](self, "isCurrentlyTappingAndHolding") ^ 1);
      int v13 = objc_opt_new(&OBJC_CLASS___HNDEvent);
      if (-[HNDGamePadDevice isCurrentlyTappingAndHolding](self, "isCurrentlyTappingAndHolding")) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      -[HNDEvent setType:](v13, "setType:", v8);
      -[HNDEvent setButtonNumber:](v13, "setButtonNumber:", 1LL);
      float v9 = self;
      unint64_t v10 = 1LL;
      goto LABEL_14;
    }

    if (a3 != 4)
    {
      int v13 = objc_opt_new(&OBJC_CLASS___HNDEvent);
      -[HNDEvent setType:](v13, "setType:", v7);
      -[HNDEvent setButtonNumber:](v13, "setButtonNumber:", a3);
      float v9 = self;
      unint64_t v10 = a3;
LABEL_14:
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice actionOverrideForUsagePage:usage:](v9, "actionOverrideForUsagePage:usage:", 0LL, v10));
      -[HNDEvent setActionOverride:](v13, "setActionOverride:", v11);

      -[HNDEvent setIsGamepadEvent:](v13, "setIsGamepadEvent:", 1LL);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice delegate](self, "delegate"));
      [v12 device:self didPostEvent:v13];
    }
  }

- (BOOL)_astGameControllerEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 assistiveTouchGameControllerEnabled];
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (!-[HNDGamePadDevice _astGameControllerEnabled](self, "_astGameControllerEnabled"))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___HNDGamePadDevice;
    -[HNDDevice handleReportCallback:report:reportLength:](&v9, "handleReportCallback:report:reportLength:", v7, a4, a5);
  }

- (void)handleValueCallback:(__IOHIDValue *)a3
{
  if (!-[HNDGamePadDevice _astGameControllerEnabled](self, "_astGameControllerEnabled"))
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___HNDGamePadDevice;
    -[HNDDevice handleValueCallback:](&v5, "handleValueCallback:", a3);
  }

- (void)_toggleIgnoreInputs
{
  unsigned int v3 = -[HNDGamePadDevice isIgnoringInputs](self, "isIgnoringInputs");
  -[HNDGamePadDevice setIgnoringInputs:](self, "setIgnoringInputs:", v3 ^ 1);
  if (v3) {
    uint64_t v4 = @"GAME_MODE_DISABLED";
  }
  else {
    uint64_t v4 = @"GAME_MODE_ENABLED";
  }
  id v5 = sub_10002B014(v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v5);
  float v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentDisplayManager]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rocker]);
  [v8 showBannerWithText:v9];
}

- (void)setCurrentlyTappingAndHolding:(BOOL)a3
{
  if (self->_currentlyTappingAndHolding != a3)
  {
    self->_currentlyTappingAndHolding = a3;
    if (a3) {
      unsigned int v3 = @"TAP_AND_HOLD_ENABLED";
    }
    else {
      unsigned int v3 = @"TAP_AND_HOLD_DISABLED";
    }
    id v4 = sub_10002B014(v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDisplayManager]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rocker]);
    [v7 showBannerWithText:v8];
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDGamePadDevice;
  -[HNDDevice dealloc](&v3, "dealloc");
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (float)currentLeftXDisplacement
{
  return self->_currentLeftXDisplacement;
}

- (void)setCurrentLeftXDisplacement:(float)a3
{
  self->_currentLeftXDisplacement = a3;
}

- (float)currentLeftYDisplacement
{
  return self->_currentLeftYDisplacement;
}

- (void)setCurrentLeftYDisplacement:(float)a3
{
  self->_currentLeftYDisplacement = a3;
}

- (float)currentRightXDisplacement
{
  return self->_currentRightXDisplacement;
}

- (void)setCurrentRightXDisplacement:(float)a3
{
  self->_currentRightXDisplacement = a3;
}

- (float)currentRightYDisplacement
{
  return self->_currentRightYDisplacement;
}

- (void)setCurrentRightYDisplacement:(float)a3
{
  self->_currentRightYDisplacement = a3;
}

- (float)currentXDisplacement
{
  return self->_currentXDisplacement;
}

- (void)setCurrentXDisplacement:(float)a3
{
  self->_currentXDisplacement = a3;
}

- (float)currentYDisplacement
{
  return self->_currentYDisplacement;
}

- (void)setCurrentYDisplacement:(float)a3
{
  self->_currentYDisplacement = a3;
}

- (BOOL)isCurrentlyTappingAndHolding
{
  return self->_currentlyTappingAndHolding;
}

- (BOOL)isIgnoringInputs
{
  return self->_ignoringInputs;
}

- (void)setIgnoringInputs:(BOOL)a3
{
  self->_ignoringInputs = a3;
}

- (void).cxx_destruct
{
}

@end