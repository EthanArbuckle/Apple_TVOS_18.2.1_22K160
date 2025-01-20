@interface MREffectShowroom
- (BOOL)getVerticesCoordinates:(MREffectShowroom *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectShowroom)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectShowroom

- (MREffectShowroom)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectShowroom;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ShowroomBackground",  @"groundShadow.png"));
    [*(id *)(v3 + 193) setImageSizeScript:@"layerWidth*.2,layerHeight*.2"];
    objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 2400.0, 400.0);
    [*(id *)(v3 + 193) setWantsMonochromatic:1];
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ShowroomBackground",  @"sideShadow.png"));
    [*(id *)(v3 + 201) setImageSizeScript:@"layerWidth*.2,layerHeight*.2"];
    objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 172.0, 26.0);
    [*(id *)(v3 + 201) setWantsMonochromatic:1];
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 217),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ShowroomBackground",  @"mask.png"));
    [*(id *)(v3 + 217) setImageSizeScript:@"layerWidth*.2,layerHeight*.2"];
    objc_msgSend(*(id *)(v3 + 217), "setOriginalImageSize:", 200.0, 200.0);
    [*(id *)(v3 + 217) setWantsMonochromatic:1];
  }

  return (MREffectShowroom *)v3;
}

- (void)_cleanup
{
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->mShadowGroundProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mShadowGroundProvider + 1) = 0LL;
  [*(id *)((char *)&self->mShadowSideProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mShadowSideProvider + 1) = 0LL;
  [*(id *)((char *)&self->mBorderProvider + 1) cleanup];
  *(MRImageProvider **)((char *)&self->mBorderProvider + 1) = 0LL;

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectShowroom;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mShadowGroundProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mShadowSideProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mBorderProvider + 1), "setDefaultSize:", width, height);
}

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectShowroom;
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
      v9.origin.x = 1.0;
      v9.origin.y = 1.0;
      v9.size.double width = 1.0;
      v9.size.double height = 1.0;
    }

    -[NSDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height),  @"backgroundColor");

    self->super.mFlattenedAttributes = v7;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MREffectShowroom;
  -[MREffect prerenderForTime:inContext:withArguments:](&v15, "prerenderForTime:inContext:withArguments:");
  if (*(MRImageProvider **)((char *)&self->mShadowSideProvider + 1))
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
      v13 = @"photoPaper-White.jpg";
LABEL_6:
      *(MRImageProvider **)((char *)&self->mShadowSideProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mShadowSideProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ShowroomBackground",  v13));
      [*(id *)((char *)&self->mShadowSideProvider + 1) setImageSizeScript:@"layerWidth*.5,layerHeight*.5"];
      objc_msgSend(*(id *)((char *)&self->mShadowSideProvider + 1), "setOriginalImageSize:", 1200.0, 1200.0);
      [*(id *)((char *)&self->mShadowSideProvider + 1) setWantsMonochromatic:1];
      -[MREffect pixelSize](self, "pixelSize");
      objc_msgSend(*(id *)((char *)&self->mShadowSideProvider + 1), "setDefaultSize:");
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
      v13 = @"photoPaper-Black.jpg";
      goto LABEL_6;
    }
  }

- (BOOL)isLoadedForTime:(double)a3
{
  if (objc_msgSend(*(id *)((char *)&self->mSprites + 1), "isLoaded", a3)
    && [*(id *)((char *)&self->mShadowGroundProvider + 1) isLoaded]
    && [*(id *)((char *)&self->mShadowSideProvider + 1) isLoaded])
  {
    return [*(id *)((char *)&self->mBorderProvider + 1) isLoaded];
  }

  else
  {
    return 0;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  CGRect v9 = ImageKey(0LL);
  id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v9);
  [v10 imageAspectRatio];
  double v12 = v11;
  [a4 localAspectRatio];
  float v14 = v13;
  id v15 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  CGRect v16 = *(void **)(&self->super._isInInteractiveMode + 1);
  CGRect v17 = (MRCroppingSprite *)[v16 objectForKey:v9];
  if (!v17)
  {
    CGRect v17 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v16 setObject:v17 forKey:v9];
  }

  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v17, "setNeedsInSpriteCoordinates:", 1LL);
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (mPhaseInDuration + mMainDuration <= a3)
    {
      float v23 = ((a3 - (mPhaseInDuration + mMainDuration)) / self->super.mPhaseOutDuration + -0.5) * 3.14159274;
      double v24 = (float)((float)(sinf(v23) + 1.0) * 0.5);
      double v20 = 1.0 - v24;
      double v21 = v24 * 0.05 + 1.05;
    }

    else
    {
      double v20 = 1.0;
      double v21 = (a3 - mPhaseInDuration) / mMainDuration * 0.05 + 1.0;
    }
  }

  else
  {
    float v19 = (a3 / mPhaseInDuration + -0.5) * 3.14159274;
    double v20 = (float)((float)(sinf(v19) + 1.0) * 0.5);
    double v21 = v20 * 0.05 + 0.95;
  }

  float v25 = fmin(v12, 1.7777778);
  double v26 = 1.4 / v14 * v25 * v21;
  double v27 = v21 * 1.4;
  p_mPixelSize = &self->super.mPixelSize;
  double v29 = v26;
  -[MRCroppingSprite setInnerRect:]( v17,  "setInnerRect:",  2.0 / (v26 * self->super.mPixelSize.width * 0.4),  2.0 / (v27 * self->super.mPixelSize.height * 0.4),  1.0 - 4.0 / (v26 * self->super.mPixelSize.width * 0.4),  1.0 - 4.0 / (v27 * self->super.mPixelSize.height * 0.4));
  [a4 blend:2];
  id v30 = [*(id *)((char *)&self->mShadowSideProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  v31 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v31, "setNeedsInSpriteCoordinates:", 1LL);
  [a4 localAspectRatio];
  double v66 = v32;
  double v33 = v27 + v32 * 0.05;
  -[MRCroppingSprite setInnerRect:]( v31,  "setInnerRect:",  2.0 / ((v29 + 0.05) * p_mPixelSize->width * 0.4),  2.0 / (v33 * self->super.mPixelSize.height * 0.4),  1.0 - 4.0 / ((v29 + 0.05) * p_mPixelSize->width * 0.4),  1.0 - 4.0 / (v33 * self->super.mPixelSize.height * 0.4));
  *(float *)&double v34 = v20;
  LODWORD(v35) = 1.0;
  LODWORD(v36) = 1.0;
  LODWORD(v37) = 1.0;
  [a4 composeForeColorRed:v70 green:v35 blue:v36 alpha:v37 saveTo:v34];
  [a4 setShader:@"SoftspritePremultiplied"];
  double v38 = (v29 + 0.05) * self->super.mPixelSize.width * 0.4;
  *(float *)&double v38 = v38;
  double v39 = v33 * self->super.mPixelSize.height * 0.4;
  *(float *)&double v39 = v39;
  [a4 setShaderUniformVec2:@"invRadii" :v38 forKey:v39];
  double y = CGPointZero.y;
  LODWORD(v41) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v31,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v30,  a4,  CGPointZero.x,  y,  v29 + 0.05,  v33,  v41);
  [a4 unsetShader];
  [a4 setShader:@"PlainTexture"];
  LODWORD(v42) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v31,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v30,  a4,  CGPointZero.x,  y,  v29 + 0.05,  v33,  v42);
  [a4 unsetShader];
  [a4 setShader:@"SoftspritePremultiplied"];
  double v43 = v29 * self->super.mPixelSize.width * 0.4;
  *(float *)&double v43 = v43;
  double v44 = v27 * self->super.mPixelSize.height * 0.4;
  *(float *)&double v44 = v44;
  [a4 setShaderUniformVec2:@"invRadii" :v43 forKey:v44];
  LODWORD(v45) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v17,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v15,  a4,  CGPointZero.x,  y,  v29,  v27,  v45);
  [a4 unsetShader];
  [a4 setShader:@"PlainTexture"];
  LODWORD(v46) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v17,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v15,  a4,  CGPointZero.x,  y,  v29,  v27,  v46);
  [a4 unsetShader];

  MRMatrix_Clear((uint64_t)v69);
  MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v69, 0.0, -180.0, 0.0);
  [a4 localAspectRatio];
  float v48 = -(v27 + v66 * 0.05) / v47;
  MRMatrix_Translate(v69, 0.0, v48, 0.0);
  v49 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  v50 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v49, "setNeedsInSpriteCoordinates:", 1LL);
  -[MRCroppingSprite setSpriteCoordinatesFactor:](v49, "setSpriteCoordinatesFactor:", 1.0, -10.0);
  -[MRCroppingSprite setSpriteCoordinatesOffset:](v49, "setSpriteCoordinatesOffset:", 0.0, 1.0);
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v50, "setNeedsInSpriteCoordinates:", 1LL);
  [a4 localAspectRatio];
  -[MRCroppingSprite setSpriteCoordinatesFactor:]( v50,  "setSpriteCoordinatesFactor:",  1.0,  -1.0 / (v51 * -0.03 / v33 * 0.5 + 0.1));
  -[MRCroppingSprite setSpriteCoordinatesOffset:](v50, "setSpriteCoordinatesOffset:", 0.0, 1.0);
  -[MRCroppingSprite setInnerRect:]( v49,  "setInnerRect:",  2.0 / (v29 * p_mPixelSize->width * 0.4),  0.0,  1.0 - 4.0 / (v29 * p_mPixelSize->width * 0.4),  0.1);
  -[MRCroppingSprite setInnerRect:]( v50,  "setInnerRect:",  2.0 / ((v29 + 0.05) * p_mPixelSize->width * 0.4),  0.0,  1.0 - 4.0 / ((v29 + 0.05) * p_mPixelSize->width * 0.4),  0.1);
  [a4 composeModelViewMatrix:v69 saveTo:v68];
  id v52 = [*(id *)((char *)&self->mBorderProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v52 setClampMode:2];
  [v52 setPreservesAspectRatio:0];
  [a4 restoreForeColor:v70];
  double v53 = 0.5;
  double v54 = v20 * 0.5;
  *(float *)&double v55 = v20 * 0.5;
  LODWORD(v54) = 1.0;
  LODWORD(v53) = 1.0;
  LODWORD(v56) = 1.0;
  [a4 composeForeColorRed:v70 green:v54 blue:v53 alpha:v56 saveTo:v55];
  LODWORD(v57) = 0;
  [v52 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v67 state:v57];
  [a4 setShader:@"SoftAlphaMaskPremultiplied"];
  double v58 = (v29 + 0.05) * self->super.mPixelSize.width * 0.4;
  *(float *)&double v58 = v58;
  double v59 = v33 * self->super.mPixelSize.height * 0.4;
  *(float *)&double v59 = v59;
  [a4 setShaderUniformVec2:@"invRadii" :v58 forKey:v59];
  LODWORD(v60) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v50,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v30,  a4,  CGPointZero.x,  y,  v29 + 0.05,  v33,  v60);
  [a4 unsetShader];
  [a4 setShader:@"AlphaMaskPremultiplied"];
  LODWORD(v61) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v50,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v30,  a4,  CGPointZero.x,  y,  v29 + 0.05,  v33,  v61);
  [a4 unsetShader];
  [a4 setShader:@"SoftAlphaMaskPremultiplied"];
  double v62 = v29 * self->super.mPixelSize.width * 0.4;
  *(float *)&double v62 = v62;
  double v63 = v27 * self->super.mPixelSize.height * 0.4;
  *(float *)&double v63 = v63;
  [a4 setShaderUniformVec2:@"invRadii" :v62 forKey:v63];
  LODWORD(v64) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v49,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v15,  a4,  CGPointZero.x,  y,  v29,  v27,  v64);
  [a4 unsetShader];
  [a4 setShader:@"AlphaMaskPremultiplied"];
  LODWORD(v65) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v49,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v15,  a4,  CGPointZero.x,  y,  v29,  v27,  v65);
  [a4 unsetShader];
  [v52 unsetOnContext:a4 onTextureUnit:1 state:&v67];
  [v52 releaseByUser];
  [a4 restoreModelViewMatrix:v68];

  [a4 restoreForeColor:v70];
  [a4 blend:0];
  [v15 releaseByUser];
  [v30 releaseByUser];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    float v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        CGRect v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            float v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            float v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectShowroom *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
}

@end