@interface MREffectVignettingOverlay
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectVignettingOverlay)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectVignettingOverlay

- (MREffectVignettingOverlay)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectVignettingOverlay;
  v4 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 185),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"vignette.png"));
    [*(id *)(v4 + 185) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v4 + 185), "setOriginalImageSize:", 2560.0, 1600.0);
  }

  return (MREffectVignettingOverlay *)v4;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectVignettingOverlay;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (void)_unload
{
}

@end