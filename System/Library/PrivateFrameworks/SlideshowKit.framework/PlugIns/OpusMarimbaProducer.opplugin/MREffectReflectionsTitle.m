@interface MREffectReflectionsTitle
- (BOOL)getVerticesCoordinates:(MREffectReflectionsTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectReflectionsTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_applySizeScripts:(double)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)cacheRenderedWords;
- (void)render1SlideAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6 tilt:(int64_t)a7 phaseOutType:(int64_t)a8 direction:(int64_t)a9;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderKey:(id)a3 size:(CGSize)a4 position:(CGPoint)a5 yRot:(double)a6 tX:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10 light:(BOOL)a11 shadow:(BOOL)a12;
- (void)renderTextAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectReflectionsTitle

- (MREffectReflectionsTitle)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectReflectionsTitle;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    *(void *)(v3 + 225) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    v3[337] = 0;
    *(void *)(v3 + 297) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 297),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"mask.png"));
    [*(id *)(v3 + 297) setImageSizeScript:@"layerWidth*.2,layerHeight*.2"];
    objc_msgSend(*(id *)(v3 + 297), "setOriginalImageSize:", 200.0, 200.0);
    [*(id *)(v3 + 297) setWantsMonochromatic:1];
    *(void *)(v3 + 305) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 305),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowMiddle.png"));
    [*(id *)(v3 + 305) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 305), "setOriginalImageSize:", 200.0, 800.0);
    *(void *)(v3 + 313) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 313),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowCapLeft.png"));
    [*(id *)(v3 + 313) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 313), "setOriginalImageSize:", 200.0, 800.0);
    *(void *)(v3 + 321) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 321),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowCapRight.png"));
    [*(id *)(v3 + 321) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 321), "setOriginalImageSize:", 200.0, 800.0);
  }

  return (MREffectReflectionsTitle *)v3;
}

- (void)_cleanup
{
  *(MRImageProvider **)((char *)&self->mMaskProvider + 1) = 0LL;
  [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGroundShadowCenterProvider + 1) = 0LL;
  [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGroundShadowLeftProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextImageSize.height + 1) cleanup];

  *(CGFloat *)((char *)&self->mTextImageSize.height + 1) = 0.0;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mTextMain + 1) cleanup];

  *(double *)((char *)&self->mTextMain + 1) = 0.0;
  [*(id *)((char *)&self->mTextRenderer + 1) cleanup];

  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v3)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  *(NSMutableArray **)((char *)&self->mWordImages + 1) = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
  *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = 0LL;
  BYTE1(self->mBreakInformation) = 0;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectReflectionsTitle;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mMaskProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mGroundShadowCenterProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mGroundShadowLeftProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mTextImageSize.height + 1), "setDefaultSize:", width, height);
}

- (void)_applySizeScripts:(double)a3
{
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
  [v5 imageAspectRatio];
  if (v6 >= 0.5)
  {
    [v5 imageAspectRatio];
    double v7 = fmin(v8, 1.77777779);
  }

  else
  {
    double v7 = 0.666666687;
  }

  if (a3 >= 1.0)
  {
    double v10 = 1.6 / a3 * v7 * 0.5;
    double v9 = 0.8;
  }

  else
  {
    double v9 = 1.6 / v7 * a3 * 0.5;
    double v10 = 0.8;
  }

  [v5 setImageSizeScript:0];
  objc_msgSend(v5, "setDefaultSize:", v10 * self->super.mPixelSize.width, v9 * self->super.mPixelSize.height);
}

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectReflectionsTitle;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    double v6 = *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1);
    if (v6)
    {

      *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = (MRImageProvider *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!BYTE1(self->mBreakInformation))
  {
    [a4 localAspectRatio];
    -[MREffectReflectionsTitle _applySizeScripts:](self, "_applySizeScripts:", v9);
    BYTE1(self->mBreakInformation) = 1;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MREffectReflectionsTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v11, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  [*(id *)((char *)&self->mMaskProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mTextImageSize.height + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 1LL;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  if ((!v4 || ![v4 length] || *(NSMutableArray **)((char *)&self->mWordFrames + 1))
    && !self->super.mNeedsToUpdateTexts
    && [*(id *)((char *)&self->mTextImageSize.height + 1) isLoaded]
    && [*(id *)((char *)&self->mMaskProvider + 1) isLoaded]
    && [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) isLoaded])
  {
    return [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) isLoaded];
  }

  else
  {
    return 0;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(double *)((char *)&self->mImageMain + 1) = 2.0;
  *(double *)&self->mSpeedUpRight = self->super.mPhaseInDuration
                                  + self->super.mMainDuration
                                  + self->super.mPhaseOutDuration
                                  + self->super.mPhaseInDuration * -3.0
                                  + -2.0;
  [a4 blend:2];
  if (a3 <= 4.0)
  {
    double mPhaseOutDuration = self->super.mPhaseOutDuration;
    HIDWORD(v11) = 1071225241;
    double v12 = self->super.mPhaseInDuration + *(double *)((char *)&self->mImageMain + 1) + mPhaseOutDuration * 0.4;
    LODWORD(v9) = 1.0;
    if (v12 < a3)
    {
      double v13 = (a3 - v12) / (mPhaseOutDuration * 0.35);
      double v14 = (1.0 - v13 + -0.5) * 3.14159265;
      BOOL v15 = v13 <= 1.0;
      double v16 = -1.57079633;
      if (v15) {
        double v16 = v14;
      }
      float v17 = v16;
      float v18 = sinf(v17);
      double v12 = 0.5;
      double mPhaseOutDuration = (v18 + 1.0) * 0.5;
      *(float *)&double v9 = mPhaseOutDuration;
    }

    LODWORD(mPhaseOutDuration) = 1.0;
    LODWORD(v12) = 1.0;
    LODWORD(v11) = 1.0;
    [a4 composeForeColorRed:v54 green:mPhaseOutDuration blue:v12 alpha:v11 saveTo:v9];
    double v19 = a3
        / (self->super.mPhaseInDuration + *(double *)((char *)&self->mImageMain + 1) + self->super.mPhaseOutDuration)
        * 0.04
        + 0.96;
    BYTE1(self->mSprites) = 0;
    -[MREffectReflectionsTitle renderTextAtTime:inContext:withArguments:scale:]( self,  "renderTextAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v19);
    LODWORD(v20) = 1050253722;
    LODWORD(v21) = 1.0;
    LODWORD(v22) = 1.0;
    LODWORD(v23) = 1.0;
    [a4 composeForeColorRed:0 green:v21 blue:v22 alpha:v23 saveTo:v20];
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v53, 180.0, 0.0, 180.0);
    double height = self->super.mPixelSize.height;
    double v25 = *(double *)((char *)&self->mTextSize.width + 1) / height
        + *(double *)((char *)&self->mTextSize.width + 1) / height;
    double v27 = v26 + v26;
    double v28 = v19 * v25;
    [a4 localAspectRatio];
    double v30 = v28 / v29;
    [a4 localAspectRatio];
    float v32 = v30 - v19 * v27 / v31;
    *(float *)&double v33 = MRMatrix_Translate(v53, 0.0, -v32, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v53, v52, v33);
    BYTE1(self->mSprites) = 1;
    -[MREffectReflectionsTitle renderTextAtTime:inContext:withArguments:scale:]( self,  "renderTextAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v19);
    [a4 restoreModelViewMatrix:v52];
    [a4 restoreForeColor:v54];
  }

  double v34 = self->super.mPhaseInDuration + *(double *)((char *)&self->mImageMain + 1);
  if (v34 < a3)
  {
    double v35 = a3 - v34;
    id v36 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    BOOL v37 = ((unint64_t)[v36 randomInt] & 0x8000000000000001) != 1;
    BYTE2(self->mSprites) = ((unint64_t)[v36 randomInt] & 0x8000000000000001) == 1;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    if (v35 >= mPhaseInDuration)
    {
      double v40 = *(double *)&self->mSpeedUpRight;
      if (v35 < mPhaseInDuration + v40)
      {
        double v39 = (v35 - mPhaseInDuration) / v40 * 0.04 + 0.78;
      }

      else
      {
        double v41 = (v35 - mPhaseInDuration - v40) / self->super.mPhaseOutDuration;
        if (v41 >= 0.5)
        {
          double v43 = v41 * 1.5 + -0.25;
        }

        else
        {
          float v42 = (v41 + -0.5) * 3.14159265;
          double v43 = (sinf(v42) + 1.0) * 0.5;
        }

        double v39 = v43 * 0.78 + 0.82;
      }
    }

    else
    {
      double v39 = 0.78;
    }

    double v44 = v39 + 0.2;
    BYTE1(self->mSprites) = 0;
    -[MREffectReflectionsTitle render1SlideAtTime:inContext:withArguments:scale:tilt:phaseOutType:direction:]( self,  "render1SlideAtTime:inContext:withArguments:scale:tilt:phaseOutType:direction:",  a4,  a5,  1LL,  1LL,  v37,  v35,  v39 + 0.2);
    LODWORD(v45) = 1045220557;
    LODWORD(v46) = 1.0;
    LODWORD(v47) = 1.0;
    LODWORD(v48) = 1.0;
    [a4 composeForeColorRed:v54 green:v46 blue:v47 alpha:v48 saveTo:v45];
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v53, 180.0, 0.0, 180.0);
    [a4 localAspectRatio];
    float v50 = v44 * -1.6 / v49;
    *(float *)&double v51 = MRMatrix_Translate(v53, 0.0, v50, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v53, v52, v51);
    BYTE1(self->mSprites) = 1;
    -[MREffectReflectionsTitle render1SlideAtTime:inContext:withArguments:scale:tilt:phaseOutType:direction:]( self,  "render1SlideAtTime:inContext:withArguments:scale:tilt:phaseOutType:direction:",  a4,  a5,  1LL,  1LL,  v37,  v35,  v44);
    [a4 restoreModelViewMatrix:v52];
    [a4 restoreForeColor:v54];
  }

  [a4 blend:0];
}

- (void)renderTextAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  double v10 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  if (v10) {
    goto LABEL_6;
  }
  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = (MRTextRenderer *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v11 = (char *)[*(id *)((char *)&self->mWordFrames + 1) count];
  if ((uint64_t)v11 >= 1)
  {
    double v12 = v11;
    for (i = 0LL; i != v12; ++i)
    {
      id v14 = objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  objc_msgSend(*(id *)((char *)&self->mWordFrames + 1), "objectAtIndex:", i));
      [v14 setLabel:@"Marimba Reflections Title Word"];
      objc_msgSend(*(id *)((char *)&self->mWordRenderer + 1), "addObject:", objc_msgSend(v14, "insertingInCollection"));
      [v14 releaseByUser];
    }
  }

  double v10 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  if (v10)
  {
LABEL_6:
    id v15 = [v10 count];
    uint64_t v16 = (uint64_t)v15;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    double v18 = mPhaseInDuration;
    if (v18 >= 5.0) {
      double v18 = mPhaseInDuration / ((double)(uint64_t)v15 + -1.15);
    }
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0"))
    {
      unsigned __int8 v20 = -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing");
      if (v16 < 1 || (v20 & 1) != 0)
      {
LABEL_30:
        if (!BYTE1(self->mSprites))
        {
          float64x2_t v48 = vdivq_f64(*(float64x2_t *)((char *)&self->mTextSize.height + 1), (float64x2_t)self->super.mPixelSize);
          float64x2_t v55 = vaddq_f64(v48, v48);
          float v49 = *(void **)(&self->super._isInInteractiveMode + 1);
          float v50 = (MRCroppingSprite *)[v49 objectForKey:@"text0"];
          if (!v50)
          {
            float v50 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
            [v49 setObject:v50 forKey:@"text0"];
          }

          LODWORD(v51) = 0;
          -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v50,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.0,  (*(double *)((char *)&self->mTextSize.width + 1) + *(double *)((char *)&self->mCachedRenderedWords + 1))
          / self->super.mPixelSize.height
          * 0.5,
            *(_OWORD *)&v55,
            v51);
        }

        return;
      }
    }

    else if (v16 < 1)
    {
      goto LABEL_30;
    }

    uint64_t v21 = 0LL;
    double v54 = v18 * 0.25;
    double v22 = 1.0;
    double v52 = 3.14159265;
    do
    {
      double v23 = v54 * (double)v21;
      double v24 = v18;
      double v25 = v18 + v23;
      HIDWORD(v26) = 0;
      if (v23 <= a3) {
        double v27 = v22;
      }
      else {
        double v27 = 0.0;
      }
      if (v23 <= a3 && v25 > a3)
      {
        float v29 = ((a3 - v23) / (v25 - v23) + -0.5) * v52;
        double v23 = sinf(v29) + v22;
        double v27 = v23 * 0.5;
      }

      *(float *)&double v19 = v27;
      LODWORD(v23) = 1.0;
      LODWORD(v25) = 1.0;
      LODWORD(v26) = 1.0;
      objc_msgSend(a4, "composeForeColorRed:green:blue:alpha:saveTo:", v57, v23, v25, v26, v19, *(void *)&v52);
      id v30 = [*(id *)((char *)&self->mWordRenderer + 1) objectAtIndex:v21];
      objc_msgSend(objc_msgSend(*(id *)((char *)&self->mWordImages + 1), "objectAtIndex:", v21), "CGRectValue");
      p_mPixelSize = &self->super.mPixelSize;
      double v35 = *(double *)((char *)&self->mTextSize.width + 1);
      double v36 = v35 + *(double *)((char *)&self->mCachedRenderedWords + 1);
      if (BYTE1(self->mSprites)) {
        double v36 = -v36;
      }
      double height = self->super.mPixelSize.height;
      double v38 = v32 / p_mPixelSize->width + v32 / p_mPixelSize->width;
      double v39 = v36 / height * 0.5 + v35 / height * 1.5 * (v22 - v27);
      double v40 = v38 * a6;
      double v41 = (v33 / height + v33 / height) * a6;
      double v42 = (-*(double *)((char *)&self->mTextYOffset + 1) / p_mPixelSize->width
           + v31 / p_mPixelSize->width * 2.0
           + v38 * 0.5)
          * a6;
      double v43 = v39 * a6;
      if (BYTE1(self->mSprites))
      {
        [a4 setShader:@"AlphaMaskPremultiplied"];
        id v44 = [*(id *)((char *)&self->mTextImageSize.height + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
        [v44 setClampMode:2];
        [v44 setPreservesAspectRatio:0];
        LODWORD(v45) = 0;
        [v44 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v56 state:v45];
        double v46 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
        LODWORD(v47) = 0;
        -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v46,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v30,  a4,  v42,  v43,  v40,  v41,  v47);

        [v44 unsetOnContext:a4 onTextureUnit:1 state:&v56];
        [v44 releaseByUser];
      }

      else
      {
        [a4 setShader:@"PlainTexture"];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v30,  a4,  v42,  v43,  v40,  v41);
      }

      [a4 unsetShader];
      [a4 restoreForeColor:v57];
      ++v21;
      double v18 = v24;
      double v22 = 1.0;
    }

    while (v16 != v21);
    goto LABEL_30;
  }

- (void)render1SlideAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6 tilt:(int64_t)a7 phaseOutType:(int64_t)a8 direction:(int64_t)a9
{
  *(float *)&double v17 = fmin(v17, 1.7777778);
  double v18 = fminf(*(float *)&v17, 1.7778);
  else {
    double v19 = 0.666666687;
  }
  [a4 localAspectRatio];
  float v21 = v20;
  [a4 localAspectRatio];
  if (v22 >= 1.0)
  {
    double v25 = 1.6;
    double v23 = 1.6 / v21 * v19;
  }

  else
  {
    double v23 = 1.6;
    [a4 localAspectRatio];
    double v25 = 1.6 / v19 * v24;
  }

  double x = CGPointZero.x;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v28 = *(double *)&self->mSpeedUpRight;
  double v29 = mPhaseInDuration + v28;
  double v30 = v23 * a6;
  double v31 = v25 * a6;
  if (mPhaseInDuration > a3)
  {
    float v37 = (a3 / mPhaseInDuration + -0.5) * 3.14159265;
    double v38 = (sinf(v37) + 1.0) * -0.5 + 1.0;
    [a4 localAspectRatio];
    double y = v38 * (v39 + v31 * 0.5 * 0.5);
    double v40 = v38 * 1.5;
    double v41 = fmin(v40 + v40, 2.0);
    if (!BYTE2(self->mSprites)) {
      double v41 = -v41;
    }
    float v42 = v41;
    float v43 = fmin(v40 * 5.0, 5.0);
    *(float *)&double v44 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v60, v42, -v43, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v60, v61, v44);
    double x = CGPointZero.x;
    uint64_t v45 = 0LL;
    double v33 = 0.0;
    goto LABEL_15;
  }

  double y = CGPointZero.y;
  double v33 = 0.0;
  if (v29 > a3)
  {
    uint64_t v45 = 0LL;
LABEL_15:
    double v46 = 0.0;
    goto LABEL_33;
  }

  double v34 = (a3 - v28 - mPhaseInDuration) / self->super.mPhaseOutDuration;
  if (v34 >= 0.5)
  {
    double v36 = v34 * 1.5 + -0.25;
  }

  else
  {
    float v35 = (v34 + -0.5) * 3.14159265;
    double v36 = (sinf(v35) + 1.0) * 0.5;
  }

  if (a8 == 1)
  {
    double v47 = 3.5;
    if (!a9) {
      double v47 = -3.0;
    }
    double v48 = v47 * v36;
    int64_t v49 = a7 == 0;
    double v50 = 0.8;
    if (!a7) {
      double v50 = 1.0;
    }
    double v46 = v50 * v48;
    if (!BYTE1(self->mSprites)) {
      int64_t v49 = a7;
    }
    double v51 = -1.0;
    if (!v49) {
      double v51 = 1.0;
    }
    double v33 = v36 * 40.0 * v51 + -360.0;
    uint64_t v45 = 1LL;
  }

  else
  {
    [a4 localAspectRatio];
    double y = v36 * (v52 + v31 * 0.5 * 0.5);
    if (!a8)
    {
      double v53 = v36 * 1.5;
      double v54 = fmin(v53 + v53, 2.0);
      if (!BYTE2(self->mSprites)) {
        double v54 = -v54;
      }
      float v55 = v54;
      float v56 = fmin(v53 * 5.0, 5.0);
      *(float *)&double v57 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v60, v55, -v56, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v60, v61, v57);
    }

    uint64_t v45 = 1LL;
    double v46 = 0.0;
  }

  double x = CGPointZero.x;
LABEL_33:
  -[MREffectReflectionsTitle renderKey:size:position:yRot:tX:time:inContext:withArguments:light:shadow:]( self,  "renderKey:size:position:yRot:tX:time:inContext:withArguments:light:shadow:",  @"image0",  a4,  a5,  v45,  mPhaseInDuration <= a3,  v30,  v31,  x,  y,  v33,  v46,  a3);
  if (v29 <= a3 && a8 == 0 || mPhaseInDuration > a3) {
    [a4 restoreModelViewMatrix:v61];
  }
}

- (void)renderKey:(id)a3 size:(CGSize)a4 position:(CGPoint)a5 yRot:(double)a6 tX:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10 light:(BOOL)a11 shadow:(BOOL)a12
{
  BOOL v12 = a12;
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  id v20 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  a3,  a9,  a10,  a11),  "objectForKey:",  a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  self->super.mPhaseInDuration + *(double *)((char *)&self->mImageMain + 1) + a8);
  [v20 setUsesBackgroundColorAsBorderColor:1];
  float v21 = *(void **)(&self->super._isInInteractiveMode + 1);
  float v22 = (MRCroppingSprite *)[v21 objectForKey:a3];
  if (!v22)
  {
    float v22 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v21 setObject:v22 forKey:a3];
  }

  -[MRCroppingSprite setInnerRect:]( v22,  "setInnerRect:",  2.0 / (width * self->super.mPixelSize.width * 0.4),  2.0 / (height * self->super.mPixelSize.height * 0.4),  1.0 - 4.0 / (width * self->super.mPixelSize.width * 0.4),  1.0 - 4.0 / (height * self->super.mPixelSize.height * 0.4));
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v22, "setNeedsInSpriteCoordinates:", 1LL);
  [a9 localAspectRatio];
  float v24 = v23;
  [v20 aspectRatio];
  double v26 = v25;
  if (v25 < 0.5 || v25 > 2.0)
  {
    double v27 = width / height * v24;
    if ((v25 >= 1.0 || v27 <= 1.0) && (v25 <= 1.0 || v27 >= 1.0))
    {
      double v28 = v25 >= 1.0 ? v25 / v27 : v27 / v25;
      if (v28 >= 1.1)
      {
        [v20 centerX];
        double v30 = v29;
        [v20 centerY];
        double v32 = v31;
        if (objc_msgSend( objc_msgSend( objc_msgSend(*(id *)((char *)&self->mGroundShadowRightProvider + 1), "objectForKey:", a3),  "objectForKey:",  @"panEndDirection"),  "integerValue") == (id)-1) {
          double v33 = -1.0;
        }
        else {
          double v33 = 1.0;
        }
        double mPhaseInDuration = self->super.mPhaseInDuration;
        double v35 = *(double *)&self->mSpeedUpRight;
        double mPhaseOutDuration = self->super.mPhaseOutDuration;
        double v37 = mPhaseInDuration + v35 + mPhaseOutDuration;
        if (v26 <= 2.0)
        {
          double v38 = 0.0;
          double v40 = a8;
          if (v26 < 0.5) {
            double v38 = 1.0 - v26 / v27;
          }
          double v39 = mPhaseInDuration + 0.5;
          if (v39 > a8)
          {
            double v32 = -(v38 * v33);
            goto LABEL_30;
          }

          if (v37 - mPhaseOutDuration + -0.5 < a8)
          {
            double v32 = v33 * v38;
            goto LABEL_30;
          }
        }

        else
        {
          double v38 = 1.0 - v27 / v26;
          double v39 = mPhaseInDuration + 0.5;
          double v40 = a8;
          if (v39 > a8)
          {
            double v30 = -(v38 * v33);
LABEL_30:
            [v20 setCenterX:v30];
            [v20 setCenterY:v32];
            double v43 = v26 / v27;
            if (v26 / v27 < 1.0) {
              double v43 = 1.0;
            }
            [v20 setScale:v43];
            goto LABEL_33;
          }

          if (v37 - mPhaseOutDuration + -0.5 < a8)
          {
            double v30 = v33 * v38;
            goto LABEL_30;
          }
        }

        float v41 = ((v40 - v39) / (v35 + -1.0) + -0.5) * 3.14159274;
        double v42 = v33 * -(v38 - (sinf(v41) + 1.0) * 0.5 * (v38 + v38));
        if (v26 > 2.0) {
          double v30 = v42;
        }
        else {
          double v32 = v42;
        }
        goto LABEL_30;
      }
    }
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    double v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            double v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            double v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectReflectionsTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  double v6 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v6)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
  id v12 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  if (![v12 length]) {
    objc_msgSend( *(id *)((char *)&self->mTextMain + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
  }
  [*(id *)((char *)&self->mTextMain + 1) setMaxNumberOfLines:1];
  objc_msgSend( *(id *)((char *)&self->mTextMain + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  [*(id *)((char *)&self->mTextMain + 1) setText:v12];
  -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
  +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
  objc_msgSend(*(id *)((char *)&self->mTextMain + 1), "setScale:");
  double width = self->super.mPixelSize.width;
  CGFloat v14 = self->super.mPixelSize.height * 0.5;
  objc_msgSend(*(id *)((char *)&self->mTextMain + 1), "setDefinedSize:", width, v14);
  [*(id *)((char *)&self->mTextMain + 1) tightFrameOfLineAtIndex:0];
  *(NSMutableArray **)((char *)&self->mCachedRenderedWords + 1) = v15;
  [*(id *)((char *)&self->mTextRenderer + 1) setMaxNumberOfLines:1];
  objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "setText:",  -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0"));
  objc_msgSend(*(id *)((char *)&self->mTextRenderer + 1), "setDefinedSize:", width, v14);
  -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
  +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
  objc_msgSend(*(id *)((char *)&self->mTextRenderer + 1), "setScale:");
  [*(id *)((char *)&self->mTextMain + 1) sizeOfContext];
  *(void *)((char *)&self->mTextSize.height + 1) = v16;
  *(void *)((char *)&self->mTextImageSize.width + 1) = v17;
  *(void *)((char *)&self->mTextYOffset + 1) = v16;
  *(void *)((char *)&self->mTextSize.width + 1) = v17;
  -[MREffectReflectionsTitle cacheRenderedWords](self, "cacheRenderedWords");
}

- (void)cacheRenderedWords
{
  if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
    || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
  {
    v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
    if (v3) {

    }
    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v4 = *(NSMutableArray **)((char *)&self->mWordImages + 1);
    if (v4) {

    }
    *(NSMutableArray **)((char *)&self->mWordImages + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (char *)[*(id *)((char *)&self->mTextMain + 1) countOfWords];
    if ((uint64_t)v5 >= 1)
    {
      double v6 = v5;
      for (i = 0LL; i != v6; ++i)
      {
        id v8 = (CGContext *)objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "retainedContextOfWordsInRange:",  i,  1);
        if (v8)
        {
          id v9 = v8;
          [*(id *)((char *)&self->mWordFrames + 1) addObject:v8];
          CGContextRelease(v9);
          CGBitmapContextGetWidth(v9);
          CGBitmapContextGetHeight(v9);
          [*(id *)((char *)&self->mTextMain + 1) originOfWordAtIndex:i];
          objc_msgSend( *(id *)((char *)&self->mWordImages + 1),  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
        }
      }
    }
  }

- (void)_unload
{
  *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = 0LL;
  [*(id *)((char *)&self->mMaskProvider + 1) unload];
  [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) unload];
  [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) unload];
  [*(id *)((char *)&self->mTextImageSize.height + 1) unload];
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];
  [*(id *)((char *)&self->mTextMain + 1) setText:0];
  [*(id *)((char *)&self->mTextRenderer + 1) setText:0];
  v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v3)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
  id v9 = *(NSMutableArray **)((char *)&self->mWordImages + 1);
  if (v9)
  {

    *(NSMutableArray **)((char *)&self->mWordImages + 1) = 0LL;
  }

  BYTE1(self->mBreakInformation) = 0;
}

@end