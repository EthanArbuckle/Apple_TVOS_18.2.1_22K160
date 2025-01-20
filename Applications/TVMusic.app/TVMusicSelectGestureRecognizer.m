@interface TVMusicSelectGestureRecognizer
+ (int64_t)horizontalTouchAreaForLocation:(CGPoint)a3;
- (BOOL)alwaysReceiveEvents;
- (BOOL)shouldReceiveEvent:(id)a3;
- (TVMusicSelectGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)horizontalTouchArea;
- (void)setAlwaysReceiveEvents:(BOOL)a3;
@end

@implementation TVMusicSelectGestureRecognizer

- (TVMusicSelectGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicSelectGestureRecognizer;
  v4 = -[TVMusicSelectGestureRecognizer initWithTarget:action:](&v7, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4) {
    -[TVMusicSelectGestureRecognizer setMaximumPressDuration:](v4, "setMaximumPressDuration:", 0.9);
  }
  return v5;
}

+ (int64_t)horizontalTouchAreaForLocation:(CGPoint)a3
{
  double x = a3.x;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice", a3.x, a3.y));
  double v5 = dbl_1001E8080[[v4 _remoteTouchSurfaceType] == (id)2];

  if (x < v5) {
    return 1LL;
  }
  if (x <= 1.0 - v5) {
    return 0LL;
  }
  return 2LL;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicSelectGestureRecognizer;
  if (!-[TVMusicSelectGestureRecognizer shouldReceiveEvent:](&v7, "shouldReceiveEvent:", a3)) {
    return 0;
  }
  if (-[TVMusicSelectGestureRecognizer alwaysReceiveEvents](self, "alwaysReceiveEvents")) {
    return 1;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v4 = [v5 _remoteTouchSurfaceType] != (id)2;

  return v4;
}

- (int64_t)horizontalTouchArea
{
  return +[TVMusicSelectGestureRecognizer horizontalTouchAreaForLocation:]( &OBJC_CLASS___TVMusicSelectGestureRecognizer,  "horizontalTouchAreaForLocation:");
}

- (BOOL)alwaysReceiveEvents
{
  return self->_alwaysReceiveEvents;
}

- (void)setAlwaysReceiveEvents:(BOOL)a3
{
  self->_alwaysReceiveEvents = a3;
}

@end