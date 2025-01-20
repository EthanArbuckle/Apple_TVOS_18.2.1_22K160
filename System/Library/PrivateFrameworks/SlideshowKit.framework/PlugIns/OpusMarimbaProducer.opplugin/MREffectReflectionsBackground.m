@interface MREffectReflectionsBackground
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectReflectionsBackground)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)endMorphing;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectReflectionsBackground

- (MREffectReflectionsBackground)initWithEffectID:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectReflectionsBackground;
  v3 = -[MREffect initWithEffectID:](&v10, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"gradient.jpg"));
    [*(id *)(v3 + 185) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 2560.0, 1600.0);
    __asm { FMOV            V0.2D, #1.0 }

    *(_OWORD *)(v3 + 193) = _Q0;
    *(_OWORD *)(v3 + 209) = _Q0;
  }

  return (MREffectReflectionsBackground *)v3;
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
  v6.super_class = (Class)&OBJC_CLASS___MREffectReflectionsBackground;
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
  v10.super_class = (Class)&OBJC_CLASS___MREffectReflectionsBackground;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)setAttributes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MREffectReflectionsBackground;
  -[MREffect setAttributes:](&v13, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    objc_super v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"backgroundColorAsString");
    v7 = (NSDictionary *)-[NSDictionary mutableCopy](self->super.mFlattenedAttributes, "mutableCopy");
    if (v6)
    {
      CGRect v14 = CGRectFromString(v6);
    }

    else
    {
      v14.origin.x = 1.0;
      v14.origin.y = 1.0;
      v14.size.double width = 1.0;
      v14.size.double height = 1.0;
    }

    -[NSDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  v14.origin.x,  v14.origin.y,  v14.size.width,  v14.size.height),  @"backgroundColor");

    self->super.mFlattenedAttributes = v7;
    v8 = (MRImageProvider **)((char *)&self->mGradientProvider + 1);
    objc_msgSend(-[NSDictionary objectForKey:](v7, "objectForKey:", @"backgroundColor"), "CGRectValue");
    void *v8 = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(void *)&v12.origin.x = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
  v12.origin.y = *(CGFloat *)((char *)&self->mColor.origin.x + 1);
  v12.size.double width = *(CGFloat *)((char *)&self->mColor.origin.y + 1);
  v12.size.double height = *(CGFloat *)((char *)&self->mColor.size.width + 1);
  v11.origin.x = 1.0;
  v11.origin.y = 1.0;
  v11.size.double width = 1.0;
  v11.size.double height = 1.0;
  if (CGRectEqualToRect(v11, v12))
  {
    id v9 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    [v9 setClampMode:2];
    else {
      uint64_t v10 = @"PlainTexture";
    }
    [a4 setShader:v10];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v9,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
    [a4 unsetShader];
    [v9 releaseByUser];
  }

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
}

- (void)endMorphing
{
}

- (void)_unload
{
}

@end