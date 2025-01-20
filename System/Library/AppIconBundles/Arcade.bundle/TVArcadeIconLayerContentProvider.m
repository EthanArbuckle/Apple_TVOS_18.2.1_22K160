@interface TVArcadeIconLayerContentProvider
+ (id)contentLayerIndexes;
+ (id)imageConfigurationForConfiguration:(id)a3;
- (id)layerForLayerStackIndex:(unint64_t)a3;
@end

@implementation TVArcadeIconLayerContentProvider

+ (id)contentLayerIndexes
{
  if (qword_8810 != -1) {
    dispatch_once(&qword_8810, &stru_4140);
  }
  return (id)qword_8808;
}

+ (id)imageConfigurationForConfiguration:(id)a3
{
  id v3 = [a3 copy];
  [v3 setSpecularOpacity:0.12];
  return v3;
}

- (id)layerForLayerStackIndex:(unint64_t)a3
{
  if (a3 == 1) {
    return objc_alloc_init(&OBJC_CLASS____TVArcadeIconJoystickLayer);
  }
  else {
    return 0LL;
  }
}

@end