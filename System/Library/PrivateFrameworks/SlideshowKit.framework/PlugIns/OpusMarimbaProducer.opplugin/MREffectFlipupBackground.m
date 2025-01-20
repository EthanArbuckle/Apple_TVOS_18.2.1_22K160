@interface MREffectFlipupBackground
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectFlipupBackground)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectFlipupBackground

- (MREffectFlipupBackground)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectFlipupBackground;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"gradient.jpg"));
    [*(id *)(v3 + 185) setImageSizeScript:@"layerWidth,layerHeight * .6f"];
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 3840.0, 1264.0);
  }

  return (MREffectFlipupBackground *)v3;
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
  v6.super_class = (Class)&OBJC_CLASS___MREffectFlipupBackground;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "isLoaded", a3);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectFlipupBackground;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 0;
}

- (void)setAttributes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectFlipupBackground;
  -[MREffect setAttributes:](&v3, "setAttributes:", a3);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v6 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  else {
    v7 = @"PlainTexture";
  }
  [a4 setShader:v7];
  [v6 aspectRatio];
  double v9 = 2.0 / v8;
  [a4 localAspectRatio];
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v6,  a4,  0.0,  v9 * v10 * -0.5 + 1.0,  2.0);
  [a4 unsetShader];
  [v6 releaseByUser];
}

- (void)_unload
{
}

@end