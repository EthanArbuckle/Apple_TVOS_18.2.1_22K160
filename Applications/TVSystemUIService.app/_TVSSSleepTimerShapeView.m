@interface _TVSSSleepTimerShapeView
+ (Class)layerClass;
- (id)shapeLayer;
@end

@implementation _TVSSSleepTimerShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CAShapeLayer);
}

- (id)shapeLayer
{
  return -[_TVSSSleepTimerShapeView layer](self, "layer", a2, self);
}

@end