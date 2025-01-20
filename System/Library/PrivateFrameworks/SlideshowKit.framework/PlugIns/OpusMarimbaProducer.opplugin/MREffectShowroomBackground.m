@interface MREffectShowroomBackground
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectShowroomBackground)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectShowroomBackground

- (MREffectShowroomBackground)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectShowroomBackground;
  result = -[MREffect initWithEffectID:](&v4, "initWithEffectID:", a3);
  if (result) {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
  }
  return result;
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
  v6.super_class = (Class)&OBJC_CLASS___MREffectShowroomBackground;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "isLoaded", a3);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MREffectShowroomBackground;
  -[MREffect prerenderForTime:inContext:withArguments:](&v15, "prerenderForTime:inContext:withArguments:");
  if (!*(void *)(&self->super._isInInteractiveMode + 1))
  {
    objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"backgroundColor"),  "CGRectValue");
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    v18.origin.CGFloat x = 0.0;
    v18.origin.CGFloat y = 0.0;
    v18.size.CGFloat width = 0.0;
    v18.size.CGFloat height = 1.0;
    if (CGRectEqualToRect(v16, v18))
    {
      v13 = @"ShowroomBG-Dark.jpg";
LABEL_6:
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  v13));
      [*(id *)(&self->super._isInInteractiveMode + 1) setImageSizeScript:@"layerWidth,layerHeight"];
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setOriginalImageSize:", 1920.0, 1200.0);
      -[MREffect pixelSize](self, "pixelSize");
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:");
      goto LABEL_7;
    }

    v19.origin.CGFloat x = 1.0;
    v19.origin.CGFloat y = 1.0;
    v19.size.CGFloat width = 1.0;
    v19.size.CGFloat height = 1.0;
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    if (CGRectEqualToRect(v17, v19))
    {
      v13 = @"ShowroomBG-Light.jpg";
      goto LABEL_6;
    }
  }

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectShowroomBackground;
  -[MREffect setAttributes:](&v8, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    objc_super v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"backgroundColorAsString");
    v7 = (NSDictionary *)-[NSDictionary mutableCopy](self->super.mFlattenedAttributes, "mutableCopy");
    if (v6)
    {
      CGRect v9 = CGRectFromString(v6);
    }

    else
    {
      v9.origin.CGFloat x = 1.0;
      v9.origin.CGFloat y = 1.0;
      v9.size.CGFloat width = 1.0;
      v9.size.CGFloat height = 1.0;
    }

    -[NSDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height),  @"backgroundColor");

    self->super.mFlattenedAttributes = v7;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v5 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v5)
  {
    id v7 = [v5 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    [v7 setClampMode:2];
    else {
      objc_super v8 = @"PlainTexture";
    }
    [a4 setShader:v8];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v7,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
    [a4 unsetShader];
    [v7 releaseByUser];
  }

- (void)_unload
{
}

@end