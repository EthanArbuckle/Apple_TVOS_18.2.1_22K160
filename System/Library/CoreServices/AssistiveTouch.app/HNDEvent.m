@interface HNDEvent
- (BOOL)isEyeTrackingEvent;
- (BOOL)isGamepadEvent;
- (BOOL)isVirtualTrackpadEvent;
- (CGPoint)location;
- (HNDEvent)init;
- (NSString)actionOverride;
- (NSString)description;
- (NSString)hardwareIdentifier;
- (double)deltaX;
- (double)deltaY;
- (int)type;
- (int64_t)buttonNumber;
- (void)setActionOverride:(id)a3;
- (void)setButtonNumber:(int64_t)a3;
- (void)setDeltaX:(double)a3;
- (void)setDeltaY:(double)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setIsEyeTrackingEvent:(BOOL)a3;
- (void)setIsGamepadEvent:(BOOL)a3;
- (void)setIsVirtualTrackpadEvent:(BOOL)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setType:(int)a3;
@end

@implementation HNDEvent

- (int)type
{
  v2 = (int *)((char *)self + OBJC_IVAR___HNDEvent_type);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_type, v4, 0LL, 0LL);
  return *v2;
}

- (void)setType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___HNDEvent_type);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_type, v5, 1LL, 0LL);
  int *v4 = a3;
}

- (CGPoint)location
{
  v2 = (double *)((char *)self + OBJC_IVAR___HNDEvent_location);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_location, v5, 0LL, 0LL);
  double v3 = *v2;
  double v4 = v2[1];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___HNDEvent_location);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_location, v6, 1LL, 0LL);
  CGFloat *v5 = x;
  v5[1] = y;
}

- (double)deltaX
{
  v2 = (double *)((char *)self + OBJC_IVAR___HNDEvent_deltaX);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_deltaX, v4, 0LL, 0LL);
  return *v2;
}

- (void)setDeltaX:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___HNDEvent_deltaX);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_deltaX, v5, 1LL, 0LL);
  double *v4 = a3;
}

- (double)deltaY
{
  v2 = (double *)((char *)self + OBJC_IVAR___HNDEvent_deltaY);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_deltaY, v4, 0LL, 0LL);
  return *v2;
}

- (void)setDeltaY:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___HNDEvent_deltaY);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_deltaY, v5, 1LL, 0LL);
  double *v4 = a3;
}

- (int64_t)buttonNumber
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HNDEvent_buttonNumber);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_buttonNumber, v4, 0LL, 0LL);
  return *v2;
}

- (void)setButtonNumber:(int64_t)a3
{
  double v4 = (int64_t *)((char *)self + OBJC_IVAR___HNDEvent_buttonNumber);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_buttonNumber, v5, 1LL, 0LL);
  int64_t *v4 = a3;
}

- (NSString)actionOverride
{
  return (NSString *)sub_1000AC920((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HNDEvent_actionOverride);
}

- (void)setActionOverride:(id)a3
{
}

- (NSString)hardwareIdentifier
{
  return (NSString *)sub_1000AC920((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HNDEvent_hardwareIdentifier);
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (BOOL)isEyeTrackingEvent
{
  v2 = (BOOL *)self + OBJC_IVAR___HNDEvent_isEyeTrackingEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isEyeTrackingEvent, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsEyeTrackingEvent:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___HNDEvent_isEyeTrackingEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isEyeTrackingEvent, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (BOOL)isVirtualTrackpadEvent
{
  v2 = (BOOL *)self + OBJC_IVAR___HNDEvent_isVirtualTrackpadEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isVirtualTrackpadEvent, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsVirtualTrackpadEvent:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___HNDEvent_isVirtualTrackpadEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isVirtualTrackpadEvent, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (BOOL)isGamepadEvent
{
  v2 = (BOOL *)self + OBJC_IVAR___HNDEvent_isGamepadEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isGamepadEvent, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsGamepadEvent:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___HNDEvent_isGamepadEvent;
  swift_beginAccess((char *)self + OBJC_IVAR___HNDEvent_isGamepadEvent, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (HNDEvent)init
{
  return (HNDEvent *)sub_1000ACBBC();
}

- (NSString)description
{
  v2 = self;
  sub_1000ACD54();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void).cxx_destruct
{
}

@end