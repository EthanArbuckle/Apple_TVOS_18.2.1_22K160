@interface MREffectWatercolorBackground
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectWatercolorBackground)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectWatercolorBackground

- (MREffectWatercolorBackground)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectWatercolorBackground;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"Plasma.jpg"));
    [*(id *)(v3 + 185) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 3840.0, 2400.0);
  }

  return (MREffectWatercolorBackground *)v3;
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
  v6.super_class = (Class)&OBJC_CLASS___MREffectWatercolorBackground;
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
  v10.super_class = (Class)&OBJC_CLASS___MREffectWatercolorBackground;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectWatercolorBackground;
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
      v9.size.double height = 1.0;
      v9.size.double width = 0.694;
      v9.origin.y = 0.588;
      v9.origin.x = 0.851;
    }

    -[NSDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height),  @"backgroundColor");

    self->super.mFlattenedAttributes = v7;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = v9;
  float v12 = v11;
  *(float *)v50 = v10;
  *(float *)&v50[1] = v12;
  float v14 = v13;
  *(float *)&double v9 = v15;
  *(float *)&v50[2] = v14;
  v50[3] = LODWORD(v9);
  id v16 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v16 setClampMode:2];
  uint64_t v17 = 0LL;
  float v18 = v12 * 0.587 + v10 * 0.299 + v14 * 0.114;
  double v19 = v18;
  float v20 = v19 * 1.5 + 0.3;
  *(float *)&double v19 = 0.4 - v19;
  double v21 = *(float *)&v19;
  double v22 = v20;
  double v23 = v21 + v20 * -0.5;
  do
  {
    double v24 = *(float *)&v50[v17];
    double v25 = 1.0 - v24;
    *(float *)&double v24 = v24 + v23 * (1.0 - v24);
    v49[v17] = LODWORD(v24);
    *(float *)&double v24 = v25 * v22;
    v48[v17++] = LODWORD(v24);
  }

  while (v17 != 3);
  [a4 setShader:@"Linear"];
  LODWORD(v26) = v49[0];
  LODWORD(v27) = v49[1];
  LODWORD(v28) = v49[2];
  LODWORD(v29) = 0;
  [a4 setShaderUniformVec4:@"offset" :v26 :v27 :v28 forKey:v29];
  LODWORD(v30) = v48[0];
  LODWORD(v31) = v48[1];
  LODWORD(v32) = v48[2];
  LODWORD(v33) = 1.0;
  [a4 setShaderUniformVec4:@"factor" :v30 :v31 :v32 forKey:v33];
  LODWORD(v34) = 0;
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v16,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v34);
  [a4 unsetShader];
  [v16 releaseByUser];
  if (a3 < 2.0)
  {
    float v35 = a3 * 0.5 + -1.0;
    double v36 = (float)(1.0 - (float)(v35 * v35));
    double v37 = v36 * 2.1 + -1.2;
    double v38 = -1.4;
LABEL_5:
    double v39 = v36 * v38 + 0.9;
    goto LABEL_13;
  }

  if (a3 >= 12.0)
  {
    if (a3 >= 26.0)
    {
      double v37 = -1.2;
      double v39 = 0.9;
      if (a3 >= 56.0 && a3 < 70.0)
      {
        float v42 = (a3 + -56.0) / 14.0 + -1.0;
        double v36 = (float)(1.0 - (float)(v42 * v42));
        double v37 = v36 * 2.335 + -1.2;
        double v38 = -1.7;
        goto LABEL_5;
      }
    }

    else
    {
      float v40 = (a3 + -12.0) / 14.0;
      double v41 = (float)(v40 * v40);
      double v37 = v41 * -2.1 + 0.9;
      double v39 = v41 * 1.4 + -0.5;
    }
  }

  else
  {
    double v39 = -0.5;
    double v37 = 0.9;
  }

- (void)_unload
{
}

@end