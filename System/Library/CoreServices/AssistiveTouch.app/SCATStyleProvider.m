@interface SCATStyleProvider
+ (id)sharedStyleProvider;
+ (int64_t)theme;
- (BOOL)_useVibrantBlendMode;
- (CGImage)bezelItemBackgroundImage;
- (CGImage)bezelItemSelectedBackgroundImage;
- (CGPath)gridCenterPointPathWithAvailableFrame:(CGRect)a3;
- (CGRect)bezelItemBackgroundImageContentsCenter;
- (CGRect)gridCenterPointFrameWithAvailableFrame:(CGRect)a3;
- (CGSize)gridShadowOffset;
- (CGSize)previewShadowOffset;
- (double)_gridImageShadowBlur;
- (double)arrowHeadBaseAngle;
- (double)arrowHeadBaseOffset;
- (double)arrowHeadBaseRadius;
- (double)arrowHeadTipOffset;
- (double)controlArrowHeadLargeSideLength;
- (double)controlArrowHeadSmallSideLength;
- (double)controlArrowOutlineThickness;
- (double)controlArrowThickness;
- (double)cursorBackgroundBorderWidth;
- (double)cursorContainerOpacity;
- (double)cursorElementPadding;
- (double)cursorForegroundBorderWidth;
- (double)cursorHighVisibilityMultiplier;
- (double)cursorRoundedRectCornerRadius;
- (double)grayFingerInnerCircleInnerRadius;
- (double)grayFingerInnerCircleOuterRadius;
- (double)grayFingerInnerRadius;
- (double)grayFingerOuterRadius;
- (double)gridLineThickness;
- (double)menuKnockoutBorderOpacity;
- (double)menuPageControlHighlightedBorderLineWidth;
- (double)minimumGridSquareWidth;
- (double)pointPickerPromptCornerRadius;
- (double)pointPickerPromptPadding;
- (double)previewLineThickness;
- (double)previewOutlineThickness;
- (double)previewShadowBlur;
- (double)rotation90ControlNearestRadius;
- (double)rotationControlAngleAwayFromMidAngle;
- (double)rotationControlCurveRadius;
- (double)rotationControlLength;
- (double)scannerCursorOutlineThickness;
- (double)scannerCursorThickness;
- (id)atvMenuFocusedItemColor;
- (id)atvMenuUnfocusedItemColor;
- (id)controlArrowColor;
- (id)controlArrowHighlightedColor;
- (id)controlArrowOutlineColor;
- (id)grayFingerInnerFill;
- (id)gridCenterPointImageWithAvailableSize:(CGSize)a3;
- (id)gridColor;
- (id)gridShadowColor;
- (id)menuKnockoutColor;
- (id)menuPageControlHighlightedBorderColor;
- (id)pointPickerPromptFont;
- (id)pointPickerPromptTextColor;
- (id)previewColor;
- (id)previewOutlineColor;
- (id)previewShadowColor;
- (id)rotation90ControlFont;
- (id)scannerBlueColor;
- (int64_t)menuKnockoutBorderOverlayBlendMode;
- (int64_t)pointPickerPromptBackdropStyle;
- (void)_drawCrosshairWithSize:(CGSize)a3 lineThickness:(double)a4;
- (void)dealloc;
- (void)unloadResources;
@end

@implementation SCATStyleProvider

+ (int64_t)theme
{
  return 0LL;
}

+ (id)sharedStyleProvider
{
  if (qword_100157748 != -1) {
    dispatch_once(&qword_100157748, &stru_1001245D0);
  }
  return (id)qword_100157740;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATStyleProvider;
  -[SCATStyleProvider dealloc](&v3, "dealloc");
}

- (id)scannerBlueColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.250980392,  0.670588235,  0.992156863,  1.0);
}

- (id)menuKnockoutColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

- (double)menuKnockoutBorderOpacity
{
  return 0.3;
}

- (BOOL)_useVibrantBlendMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v3 = [v2 _graphicsQuality];

  BOOL v4 = !UIAccessibilityIsReduceTransparencyEnabled();
  return v3 != (id)10 && v4;
}

- (int64_t)menuKnockoutBorderOverlayBlendMode
{
  if (-[SCATStyleProvider _useVibrantBlendMode](self, "_useVibrantBlendMode")) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

- (id)atvMenuFocusedItemColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

- (id)atvMenuUnfocusedItemColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.8,  0.8,  0.8,  1.0);
}

- (double)scannerCursorThickness
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 3.0;
  if (v3) {
    return 12.0;
  }
  return result;
}

- (double)scannerCursorOutlineThickness
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 6.0;
  if (v3) {
    return 15.0;
  }
  return result;
}

- (double)cursorForegroundBorderWidth
{
  return 2.0;
}

- (double)cursorBackgroundBorderWidth
{
  return 2.0;
}

- (double)cursorHighVisibilityMultiplier
{
  return 4.0;
}

- (double)cursorRoundedRectCornerRadius
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 8.0;
  if (v4)
  {
    -[SCATStyleProvider cursorHighVisibilityMultiplier](self, "cursorHighVisibilityMultiplier", 8.0);
    return v6 * 0.5 * 8.0;
  }

  return result;
}

- (double)cursorContainerOpacity
{
  return 0.3;
}

- (double)cursorElementPadding
{
  return 9.0;
}

- (double)menuPageControlHighlightedBorderLineWidth
{
  return 1.0;
}

- (id)menuPageControlHighlightedBorderColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

- (id)pointPickerPromptTextColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

- (double)pointPickerPromptPadding
{
  return 20.0;
}

- (id)pointPickerPromptFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 20.0);
}

- (int64_t)pointPickerPromptBackdropStyle
{
  return 11060LL;
}

- (double)pointPickerPromptCornerRadius
{
  return 10.0;
}

- (id)gridColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
}

- (id)gridShadowColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
}

- (CGSize)gridShadowOffset
{
  double v2 = 2.0;
  double v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)gridLineThickness
{
  return 2.0;
}

- (double)_gridImageShadowBlur
{
  return 2.0;
}

- (void)_drawCrosshairWithSize:(CGSize)a3 lineThickness:(double)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  CGFloat v7 = (a3.width - a4) * 0.5;
  uint64_t v8 = 0LL;
  double v9 = height;
  UIRectFill(*(CGRect *)(&a4 - 2));
  v10.origin.y = (height - a4) * 0.5;
  v10.origin.x = 0.0;
  v10.size.CGFloat width = width;
  v10.size.double height = a4;
  UIRectFill(v10);
}

- (CGRect)gridCenterPointFrameWithAvailableFrame:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  CGFloat v4 = fmin(height * 0.6, 100.0);
  v5.origin.x = a3.origin.x + (a3.size.width - v4) * 0.5;
  v5.origin.y = a3.origin.y + (a3.size.height - v4) * 0.5;
  v5.size.CGFloat width = v4;
  v5.size.double height = v4;
  return CGRectIntegral(v5);
}

- (CGPath)gridCenterPointPathWithAvailableFrame:(CGRect)a3
{
  double v4 = v3 * 0.5;
  *(float *)&double v3 = v3 * 0.5;
  id v6 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1LL, v4, v5 * 0.5, roundf(*(float *)&v3), 0.0, 6.28318531));
  CGFloat v7 = (CGPath *)[v6 CGPath];

  return v7;
}

- (id)gridCenterPointImageWithAvailableSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.CGFloat width = a3.height;
  }
  double v4 = a3.width * 0.6;
  p_cachedGridCenterPointImage = &self->_cachedGridCenterPointImage;
  double v6 = a3.width * 0.6;
  if (a3.width * 0.6 >= 100.0)
  {
    if (*p_cachedGridCenterPointImage)
    {
      CGFloat v7 = *p_cachedGridCenterPointImage;
      return v7;
    }

    double v6 = 100.0;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 scale];
  CGFloat v11 = v10;
  v18.CGFloat width = v6;
  v18.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v12 set];

  [v8 scannerCursorOutlineThickness];
  -[SCATStyleProvider _drawCrosshairWithSize:lineThickness:](self, "_drawCrosshairWithSize:lineThickness:", v6, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 scannerBlueColor]);
  [v14 set];

  [v8 scannerCursorThickness];
  -[SCATStyleProvider _drawCrosshairWithSize:lineThickness:](self, "_drawCrosshairWithSize:lineThickness:", v6, v6, v15);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  CGFloat v7 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  if (v4 >= 100.0) {
    objc_storeStrong((id *)p_cachedGridCenterPointImage, v7);
  }
  UIGraphicsEndImageContext();

  return v7;
}

- (double)minimumGridSquareWidth
{
  return 10.0;
}

- (id)previewColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.8, 1.0);
}

- (id)previewOutlineColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
}

- (double)previewOutlineThickness
{
  return 1.0;
}

- (id)previewShadowColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.1);
}

- (double)previewShadowBlur
{
  return 2.0;
}

- (CGSize)previewShadowOffset
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)previewLineThickness
{
  return 3.0;
}

- (double)arrowHeadBaseOffset
{
  return 5.0;
}

- (double)arrowHeadBaseAngle
{
  return 0.785398163;
}

- (double)arrowHeadBaseRadius
{
  return 10.0;
}

- (double)arrowHeadTipOffset
{
  return 10.0;
}

- (id)controlArrowColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.6, 1.0);
}

- (id)controlArrowHighlightedColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

- (double)controlArrowThickness
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (id)controlArrowOutlineColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.8);
}

- (double)controlArrowOutlineThickness
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (double)controlArrowHeadLargeSideLength
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 12.0;
  if (IsPad) {
    return 18.0;
  }
  return result;
}

- (double)controlArrowHeadSmallSideLength
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 7.0;
  if (IsPad) {
    return 10.5;
  }
  return result;
}

- (double)grayFingerInnerRadius
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 25.5;
  if (!IsPad) {
    return 17.0;
  }
  return result;
}

- (double)grayFingerOuterRadius
{
  double v4 = v3;
  -[SCATStyleProvider controlArrowThickness](self, "controlArrowThickness");
  return v4 + v5;
}

- (id)grayFingerInnerFill
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
}

- (double)grayFingerInnerCircleOuterRadius
{
  double v4 = v3;
  -[SCATStyleProvider controlArrowThickness](self, "controlArrowThickness");
  return v4 + v5;
}

- (double)grayFingerInnerCircleInnerRadius
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (double)rotationControlCurveRadius
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 43.5;
  if (!IsPad) {
    return 29.0;
  }
  return result;
}

- (double)rotationControlLength
{
  return v2 * 1.57079633;
}

- (double)rotationControlAngleAwayFromMidAngle
{
  return 0.785398163;
}

- (double)rotation90ControlNearestRadius
{
  int IsPad = AXDeviceIsPad(self, a2);
  double result = 34.0;
  if (IsPad) {
    return 51.0;
  }
  return result;
}

- (id)rotation90ControlFont
{
  return +[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 14.0);
}

- (CGImage)bezelItemBackgroundImage
{
  double result = self->_bezelItemBackgroundImage;
  if (!result)
  {
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    id v7 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0));
    uint64_t v8 = (CGColor *)[v7 CGColor];
    id v9 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0));
    self->_bezelItemBackgroundImage = sub_10008858C( v8,  (CGColor *)[v9 CGColor],  0.0,  0.0,  200.0,  200.0,  CGRectZero.origin.x,  y,  width,  height,  1.0,  5.0,  3.5);

    return self->_bezelItemBackgroundImage;
  }

  return result;
}

- (CGImage)bezelItemSelectedBackgroundImage
{
  double result = self->_bezelItemSelectedBackgroundImage;
  if (!result)
  {
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    id v7 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.352941185, 0.352941176, 0.352941176, 1.0));
    uint64_t v8 = (CGColor *)[v7 CGColor];
    id v9 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.352941185, 0.352941176, 0.352941176, 1.0));
    self->_bezelItemSelectedBackgroundImage = sub_10008858C( v8,  (CGColor *)[v9 CGColor],  0.0,  0.0,  200.0,  200.0,  CGRectZero.origin.x,  y,  width,  height,  1.0,  5.0,  3.5);

    return self->_bezelItemSelectedBackgroundImage;
  }

  return result;
}

- (CGRect)bezelItemBackgroundImageContentsCenter
{
  double v2 = 0.03;
  double v3 = 0.94;
  double v4 = 0.03;
  double v5 = 0.94;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v4;
  result.origin.x = v2;
  return result;
}

- (void)unloadResources
{
  bezelItemBackgroundImage = self->_bezelItemBackgroundImage;
  if (bezelItemBackgroundImage)
  {
    CGImageRelease(bezelItemBackgroundImage);
    self->_bezelItemBackgroundImage = 0LL;
  }

  bezelItemSelectedBackgroundImage = self->_bezelItemSelectedBackgroundImage;
  if (bezelItemSelectedBackgroundImage)
  {
    CGImageRelease(bezelItemSelectedBackgroundImage);
    self->_bezelItemSelectedBackgroundImage = 0LL;
  }

  cachedGridCenterPointImage = self->_cachedGridCenterPointImage;
  self->_cachedGridCenterPointImage = 0LL;
}

- (void).cxx_destruct
{
}

@end