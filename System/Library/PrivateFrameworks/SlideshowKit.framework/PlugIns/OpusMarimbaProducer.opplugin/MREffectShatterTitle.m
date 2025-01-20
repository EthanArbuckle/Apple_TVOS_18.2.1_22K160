@interface MREffectShatterTitle
- (BOOL)getVerticesCoordinates:(MREffectShatterTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectShatterTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectShatterTitle

- (MREffectShatterTitle)initWithEffectID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectShatterTitle;
  v3 = -[MREffect initWithEffectID:](&v7, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    for (uint64_t i = 0LL; i != 9; ++i)
    {
      *(void *)&v3[8 * i + 185] = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      [*(id *)&v3[8 * i + 185] setAssetPath:objc_msgSend( v4, "resourcePathForEffectID:andResource:", *((void *)v3 + 4), +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"shatterTitleMask0%d.png", i + 1))];
      [*(id *)&v3[8 * i + 185] setImageSizeScript:@"(layerWidth*.95),layerHeight;"];
      objc_msgSend(*(id *)&v3[8 * i + 185], "setOriginalImageSize:", 1980.0, 296.0);
      [*(id *)&v3[8 * i + 185] setWantsMonochromatic:1];
    }

    *(void *)(v3 + 257) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    *(void *)(v3 + 273) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  }

  return (MREffectShatterTitle *)v3;
}

- (void)_cleanup
{
  uint64_t v3 = 0LL;
  id v4 = &self->super._isInInteractiveMode + 1;
  do
  {

    *(void *)&v4[v3] = 0LL;
    v3 += 8LL;
  }

  while (v3 != 72);
  [*(id *)((char *)&self->mMasks[8] + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mMasks[8] + 1) = 0LL;
  *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectShatterTitle;
  -[MREffect setPixelSize:](&v8, "setPixelSize:");
  uint64_t v6 = 0LL;
  objc_super v7 = &self->super._isInInteractiveMode + 1;
  do
  {
    objc_msgSend(*(id *)&v7[v6], "setDefaultSize:", width, height);
    v6 += 8LL;
  }

  while (v6 != 72);
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectShatterTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mTextImage + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  BOOL v5 = !v4 || ![v4 length] || *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) != 0;
  unint64_t v6 = 0LL;
  do
  {
    BOOL result = [*(id *)(&self->super._isInInteractiveMode + 8 * v6 + 1) isLoaded];
    if (v6 > 7) {
      break;
    }
    ++v6;
  }

  while (result);
  if (!v5) {
    return 0;
  }
  if (self->super.mNeedsToUpdateTexts) {
    return 0;
  }
  return result;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MREffectShatterTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v12, "prerenderForTime:inContext:withArguments:");
  uint64_t v9 = 0LL;
  v10 = &self->super._isInInteractiveMode + 1;
  do
  {
    [*(id *)&v10[v9] prerenderForTime:a4 inContext:a5 withArguments:a3];
    v9 += 8LL;
  }

  while (v9 != 72);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(MRTextRenderer **)((char *)&self->mTextRenderer + 1))
  {
    -[MREffect _computePhaseTimeForTime:](self, "_computePhaseTimeForTime:");
    double v9 = v8;
    objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    double v11 = v10;
    double v56 = v12;
    if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      [a4 blend:2];
      if (objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"isSubtitle"),  "BOOLValue"))
      {
        double mPhaseInDuration = self->super.mPhaseInDuration;
        double v14 = 0.0;
        if (mPhaseInDuration <= a3)
        {
          double mMainDuration = self->super.mMainDuration;
          double v14 = 1.0;
          if (mMainDuration > 1.0) {
            double mMainDuration = 1.0;
          }
          if (mPhaseInDuration + mMainDuration > a3) {
            double v14 = (a3 - mPhaseInDuration) / mMainDuration;
          }
        }
      }

      else
      {
        double mDefaultPhaseInDuration = self->super.mDefaultPhaseInDuration;
        double v14 = 1.0;
        if (v9 < mDefaultPhaseInDuration) {
          double v14 = v9 / mDefaultPhaseInDuration;
        }
      }

      float v17 = v14;
      float v18 = v17 * 0.33;
      [a4 setShader:@"AlphaMaskPremultiplied"];
      uint64_t v19 = 0LL;
      v20 = (double *)&unk_1F9A58;
      v21 = (char *)&unk_1F9B78;
      v22 = (char *)&unk_1F9C98;
      double v23 = v18;
      double y = CGPointZero.y;
      __asm { FMOV            V0.4S, #1.0 }

      int32x4_t v53 = _Q0;
      double v29 = a3;
      while (1)
      {
        id v30 = objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 8 * v19 + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3,  *(_OWORD *)&v53);
        [v30 setClampMode:2];
        [v30 setPreservesAspectRatio:0];
        LODWORD(v31) = 0;
        [v30 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v57 state:v31];
        double v32 = dbl_1F99A8[v19];
        double v33 = dbl_1F99F0[v19];
        objc_msgSend(*(id *)((char *)&self->mTextImage + 1), "setInnerRect:", v32, 0.0, v33, 1.0);
        if (!v19) {
          break;
        }
        if ((v19 & 0xD) == 1)
        {
          float v34 = ShatterSpline(2u, dbl_1F9E00, (uint64_t)&unk_1F9E10, (uint64_t)&unk_1F9E20, (uint64_t)&unk_1F9EE0, v23);
          int v35 = v19 & 0xE;
          goto LABEL_23;
        }

        int v35 = v19 & 0xE;
        if (v19 == 8 || (v19 & 0xB) == 2 || v35 == 4)
        {
          float v34 = ShatterSpline(2u, dbl_1F9E40, (uint64_t)&unk_1F9E50, (uint64_t)&unk_1F9E60, (uint64_t)&unk_1F9E30, v23);
LABEL_23:
          if (v35 == 2)
          {
LABEL_24:
            double v37 = v23;
            v38 = (double *)&unk_1F9EC0;
            v39 = &unk_1F9ED0;
            v40 = &unk_1F9EB0;
          }

          else
          {
            float v36 = 0.0;
            if (v19 != 4) {
              goto LABEL_26;
            }
            double v37 = v23;
            v38 = dbl_1F9EF0;
            v39 = &unk_1F9F00;
            v40 = &unk_1F9EE0;
          }

          float v36 = ShatterSpline(2u, dbl_1F9EF0, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40, v37);
          goto LABEL_26;
        }

        float v34 = 0.0;
        if (v19 != 7) {
          goto LABEL_23;
        }
        float v34 = ShatterSpline(2u, dbl_1F9E80, (uint64_t)&unk_1F9E90, (uint64_t)&unk_1F9EA0, (uint64_t)&unk_1F9E70, v23);
        float v36 = 0.0;
LABEL_26:
        float v41 = ShatterSpline(4u, v20, (uint64_t)v21, (uint64_t)v22, (uint64_t)&unk_1F9A38, v23) + 0.0925;
        MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v62, v34, v36, 0.0);
        __int128 v61 = xmmword_1F9F10;
        MRMatrix_TransformVector(v62, (float *)&v61, v60);
        *(float *)&double v42 = MRMatrix_Translate(v62, 0.0, v41, 0.0);
        if (v19) {
          v43 = 0LL;
        }
        else {
          v43 = v63;
        }
        objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v62, v43, v42);
        float v44 = v11 * (v32 + v33 * 0.5 + -0.5);
        float v46 = fabsf(v45);
        int32x4_t v47 = v53;
        *(float *)v47.i32 = v46;
        int32x4_t v48 = vzip1q_s32(v47, v47);
        *(float *)&v48.i32[2] = v46;
        int32x4_t v58 = v48;
        [a4 composeForeColor:&v58 saveTo:v59];
        LODWORD(v49) = 0;
        objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  CGPointZero.x,  y,  v11,  v56,  v49);
        [v30 unsetOnContext:a4 onTextureUnit:1 state:&v57];
        [v30 releaseByUser];
        [a4 restoreForeColor:v59];
        [a4 restoreModelViewMatrix:v63];
        ++v19;
        v20 += 4;
        v21 += 32;
        v22 += 32;
        a3 = v29;
        if (v19 == 9)
        {
          [a4 unsetShader];
          [a4 blend:0];
          goto LABEL_33;
        }
      }

      float v34 = ShatterSpline(2u, dbl_1F9DD0, (uint64_t)&unk_1F9DE0, (uint64_t)&unk_1F9DF0, (uint64_t)&unk_1F9DC0, v23);
      goto LABEL_24;
    }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mNeedsToUpdateTexts || !*(MRTextRenderer **)((char *)&self->mTextRenderer + 1))
  {
    self->super.mNeedsToUpdateTexts = 0;
    objc_super v7 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
    if (v7)
    {
      objc_msgSend(v7, "releaseByUser", a4, a5, a3);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
    }

    id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
    if (![v8 length]) {
      objc_msgSend( *(id *)((char *)&self->mMasks[8] + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mMasks[8] + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mMasks[8] + 1) setMaxNumberOfLines:1];
    objc_msgSend( *(id *)((char *)&self->mMasks[8] + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.949999988,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mMasks[8] + 1) setText:v8];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mMasks[8] + 1), "setScale:");
    double v9 = (CGContext *)[*(id *)((char *)&self->mMasks[8] + 1) retainedContext];
    if (v9)
    {
      double v10 = v9;
      double v11 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v9);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v11;
      -[MRTextRenderer setLabel:](v11, "setLabel:", @"Marimba SlidingPanels Title");
      CGContextRelease(v10);
    }
  }

- (void)_unload
{
  uint64_t v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  uint64_t v4 = 0LL;
  BOOL v5 = &self->super._isInInteractiveMode + 1;
  do
  {
    [*(id *)&v5[v4] unload];
    v4 += 8LL;
  }

  while (v4 != 72);
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double height = self->super.mPixelSize.height;
  double v4 = self->super.mPixelSize.width * 0.949999988;
  result.double height = height;
  result.double width = v4;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 1LL;
}

@end