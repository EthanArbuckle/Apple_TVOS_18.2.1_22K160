@interface SCATCustomFocusingView
+ (double)focusedGroupStateBorderThickness;
+ (double)focusedStateBorderThickness;
+ (double)roundedRectCornerRadius;
+ (double)unfocusedStateBorderThickness;
+ (id)focusedGroupStateColor;
+ (id)focusedGroupStateFillColor;
+ (id)focusedStateColor;
+ (id)focusedStateContentsColor;
+ (id)focusedStateFillColor;
+ (id)unfocusedStateColor;
+ (id)unfocusedStateFillColor;
- (BOOL)updateFocusState:(int64_t)a3;
- (SCATCustomFocusingView)initWithFrame:(CGRect)a3;
- (int64_t)focusState;
- (void)setFocusState:(int64_t)a3;
@end

@implementation SCATCustomFocusingView

+ (id)focusedStateColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

+ (id)focusedGroupStateColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  1.0);
}

+ (id)unfocusedStateColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.8,  0.8,  0.8,  1.0);
}

+ (id)focusedStateFillColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

+ (id)focusedGroupStateFillColor
{
  return +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
}

+ (id)unfocusedStateFillColor
{
  return +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
}

+ (id)focusedStateContentsColor
{
  return +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
}

+ (double)focusedStateBorderThickness
{
  return 5.0;
}

+ (double)focusedGroupStateBorderThickness
{
  return 5.0;
}

+ (double)unfocusedStateBorderThickness
{
  return 2.0;
}

+ (double)roundedRectCornerRadius
{
  return 15.0;
}

- (SCATCustomFocusingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATCustomFocusingView;
  result = -[SCATCustomFocusingView initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result) {
    result->_focusState = -1LL;
  }
  return result;
}

- (BOOL)updateFocusState:(int64_t)a3
{
  int64_t focusState = self->_focusState;
  if (focusState != a3) {
    self->_int64_t focusState = a3;
  }
  return focusState != a3;
}

- (int64_t)focusState
{
  return self->_focusState;
}

- (void)setFocusState:(int64_t)a3
{
  self->_int64_t focusState = a3;
}

@end