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
  BKDisplayAnnotationMinimalStyle *return = [[BKDisplayAnnotationMinimalStyle alloc] init];
}

+ (id)ellipseStyle
{
  BKDisplayAnnotationEllipseStyle *return = [[BKDisplayAnnotationEllipseStyle alloc] init];
}

+ (id)rectangleStyle
{
  BKDisplayAnnotationRectangleStyle *return = [[BKDisplayAnnotationRectangleStyle alloc] init];
}

+ (id)pointerStyle
{
  BKDisplayAnnotationPointerStyle *return = [[BKDisplayAnnotationPointerStyle alloc] init];
}

+ (id)textStyle
{
  BKDisplayAnnotationTextStyle *return = [[BKDisplayAnnotationTextStyle alloc] init];
}

+ (id)textBackgroundStyle
{
  BKDisplayAnnotationTextBackgroundStyle *return = [[BKDisplayAnnotationTextBackgroundStyle alloc] init];
}

+ (id)emphasizedStyle
{
  BKDisplayAnnotationEmphasizedStyle *return = [[BKDisplayAnnotationEmphasizedStyle alloc] init];
}

+ (id)crosshatchedBackgroundStyle
{
  BKDisplayAnnotationCrosshatchedBackgroundStyle *return = [[BKDisplayAnnotationCrosshatchedBackgroundStyle alloc] init];
}

+ (id)canceledStyle
{
  BKDisplayAnnotationCanceledStyle *return = [[BKDisplayAnnotationCanceledStyle alloc] init];
}

+ (id)colorVariationStyleWithIndex:(int64_t)a3
{
  return [BKDisplayAnnotationColorVariationStyle colorVariationWithIndex:a3];
}

@end