@interface HUDTheme
+ (id)darkModeTheme;
+ (id)lightModeTheme;
- (CAFilter)textColorCriticalVibrantFilter;
- (CAFilter)textColorSevereVibrantFilter;
- (CGColor)backgroundColor;
- (CGColor)currentHangCriticalTextColor;
- (CGColor)currentHangSevereTextColor;
- (CGColor)currentHangTextColor;
- (CGColor)currentHangTextColorForStatus:(int64_t)a3;
- (CGColor)currentProcessExitTextColor;
- (CGColor)previousHangCriticalTextColor;
- (CGColor)previousHangSevereTextColor;
- (CGColor)previousHangTextColor;
- (CGColor)previousHangTextColorForStatus:(int64_t)a3;
- (CGColor)processExitReasonNamespaceTextColor;
- (CGColor)translucentBackgroundColor;
- (HUDTheme)initWithPreviousHangTextColor:(CGColor *)a3 currentHangTextColor:(CGColor *)a4 currentHangSevereTextColor:(CGColor *)a5 previousHangSevereTextColor:(CGColor *)a6 currentHangCriticalTextColor:(CGColor *)a7 previousHangCriticalTextColor:(CGColor *)a8 backgroundColor:(CGColor *)a9 translucentBackgroundColor:(CGColor *)a10 textColorSevereVibrantFilter:(id)a11 textColorCriticalVibrantFilter:(id)a12 currentProcessExitTextColor:(CGColor *)a13 processExitReasonNamespaceTextColor:(CGColor *)a14;
- (id)textColorVibrantFilterForStatus:(int64_t)a3;
- (void)dealloc;
@end

@implementation HUDTheme

- (HUDTheme)initWithPreviousHangTextColor:(CGColor *)a3 currentHangTextColor:(CGColor *)a4 currentHangSevereTextColor:(CGColor *)a5 previousHangSevereTextColor:(CGColor *)a6 currentHangCriticalTextColor:(CGColor *)a7 previousHangCriticalTextColor:(CGColor *)a8 backgroundColor:(CGColor *)a9 translucentBackgroundColor:(CGColor *)a10 textColorSevereVibrantFilter:(id)a11 textColorCriticalVibrantFilter:(id)a12 currentProcessExitTextColor:(CGColor *)a13 processExitReasonNamespaceTextColor:(CGColor *)a14
{
  id v20 = a11;
  id v21 = a12;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___HUDTheme;
  v22 = -[HUDTheme init](&v25, "init");
  if (v22)
  {
    v22->_previousHangTextColor = CGColorRetain(a3);
    v22->_currentHangTextColor = CGColorRetain(a4);
    v22->_currentHangSevereTextColor = CGColorRetain(a5);
    v22->_previousHangSevereTextColor = CGColorRetain(a6);
    v22->_currentHangCriticalTextColor = CGColorRetain(a7);
    v22->_previousHangCriticalTextColor = CGColorRetain(a8);
    v22->_backgroundColor = CGColorRetain(a9);
    v22->_currentProcessExitTextColor = CGColorRetain(a13);
    v22->_processExitReasonNamespaceTextColor = CGColorRetain(a14);
    v22->_translucentBackgroundColor = CGColorRetain(a10);
    objc_storeStrong((id *)&v22->_textColorSevereVibrantFilter, a11);
    objc_storeStrong((id *)&v22->_textColorCriticalVibrantFilter, a12);
  }

  return v22;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HUDTheme;
  -[HUDTheme dealloc](&v3, "dealloc");
}

+ (id)lightModeTheme
{
  if (qword_1000366A8 != -1) {
    dispatch_once(&qword_1000366A8, &stru_100029BA0);
  }
  return (id)qword_1000366B0;
}

+ (id)darkModeTheme
{
  if (qword_1000366B8 != -1) {
    dispatch_once(&qword_1000366B8, &stru_100029BC0);
  }
  return (id)qword_1000366C0;
}

- (CGColor)currentHangTextColorForStatus:(int64_t)a3
{
  return v3;
}

- (CGColor)previousHangTextColorForStatus:(int64_t)a3
{
  return v3;
}

- (id)textColorVibrantFilterForStatus:(int64_t)a3
{
  else {
    id v5 = 0LL;
  }
  return v5;
}

- (CGColor)previousHangTextColor
{
  return self->_previousHangTextColor;
}

- (CGColor)currentHangTextColor
{
  return self->_currentHangTextColor;
}

- (CGColor)currentHangSevereTextColor
{
  return self->_currentHangSevereTextColor;
}

- (CGColor)previousHangSevereTextColor
{
  return self->_previousHangSevereTextColor;
}

- (CGColor)currentHangCriticalTextColor
{
  return self->_currentHangCriticalTextColor;
}

- (CGColor)previousHangCriticalTextColor
{
  return self->_previousHangCriticalTextColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)currentProcessExitTextColor
{
  return self->_currentProcessExitTextColor;
}

- (CGColor)processExitReasonNamespaceTextColor
{
  return self->_processExitReasonNamespaceTextColor;
}

- (CGColor)translucentBackgroundColor
{
  return self->_translucentBackgroundColor;
}

- (CAFilter)textColorSevereVibrantFilter
{
  return self->_textColorSevereVibrantFilter;
}

- (CAFilter)textColorCriticalVibrantFilter
{
  return self->_textColorCriticalVibrantFilter;
}

- (void).cxx_destruct
{
}

@end