@interface BKDisplayAnnotationStyle
+ (id)canceledStyle;
+ (id)colorVariationStyleWithIndex:(int64_t)a3;
+ (id)crosshatchedBackgroundStyle;
+ (id)ellipseStyle;
+ (id)emphasizedStyle;
+ (id)minimalStyle;
+ (id)pointerStyle;
+ (id)rectangleStyle;
+ (id)textBackgroundStyle;
+ (id)textStyle;
@end

@implementation BKDisplayAnnotationStyle

+ (id)minimalStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationMinimalStyle);
}

+ (id)ellipseStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationEllipseStyle);
}

+ (id)rectangleStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationRectangleStyle);
}

+ (id)pointerStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationPointerStyle);
}

+ (id)textStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationTextStyle);
}

+ (id)textBackgroundStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationTextBackgroundStyle);
}

+ (id)emphasizedStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationEmphasizedStyle);
}

+ (id)crosshatchedBackgroundStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationCrosshatchedBackgroundStyle);
}

+ (id)canceledStyle
{
  return objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationCanceledStyle);
}

+ (id)colorVariationStyleWithIndex:(int64_t)a3
{
  return +[BKDisplayAnnotationColorVariationStyle colorVariationWithIndex:]( &OBJC_CLASS___BKDisplayAnnotationColorVariationStyle,  "colorVariationWithIndex:",  a3);
}

@end