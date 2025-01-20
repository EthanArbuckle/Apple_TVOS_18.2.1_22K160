@interface TVWatchListIconLayerContentProvider
+ (id)contentLayerIndexes;
+ (id)imageConfigurationForConfiguration:(id)a3;
- (id)layerForLayerStackIndex:(unint64_t)a3;
@end

@implementation TVWatchListIconLayerContentProvider

+ (id)contentLayerIndexes
{
  if (qword_87F8 != -1) {
    dispatch_once(&qword_87F8, &stru_4150);
  }
  return (id)qword_87F0;
}

+ (id)imageConfigurationForConfiguration:(id)a3
{
  id v3 = [a3 copy];
  [v3 setSpecularOpacity:0.02];
  return v3;
}

- (id)layerForLayerStackIndex:(unint64_t)a3
{
  if (a3 == 1) {
    return objc_alloc_init(&OBJC_CLASS____TVWatchListIconLogoLayer);
  }
  else {
    return 0LL;
  }
}

@end