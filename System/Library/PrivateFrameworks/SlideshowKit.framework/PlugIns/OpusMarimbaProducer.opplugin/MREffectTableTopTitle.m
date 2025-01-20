@interface MREffectTableTopTitle
- (BOOL)getVerticesCoordinates:(MREffectTableTopTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectTableTopTitle)init;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)cacheRenderedWords;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectTableTopTitle

- (MREffectTableTopTitle)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectTableTopTitle;
  v2 = -[MREffectTableTopTitle init](&v4, "init");
  if (v2)
  {
    *(void *)(v2 + 185) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    *(void *)(v2 + 193) = 0LL;
    *(void *)(v2 + 225) = 0LL;
    *(void *)(v2 + 233) = 0LL;
    *(void *)(v2 + 241) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  }

  return (MREffectTableTopTitle *)v2;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  *(int64_t *)((char *)&self->mNumberOfLetters + 1) = 0LL;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mNumberOfLetters + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectTableTopTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mNumberOfLetters + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  return (!v4
       || ![v4 length]
       || *(MRTextRenderer **)((char *)&self->mTextRenderer + 1)
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  v6 = *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1);
  if (v6)
  {
    CFRelease(v6);
    *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1) = 0LL;

    *(NSMutableArray **)((char *)&self->mLetterFrames + 1) = 0LL;
  }

  v7 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v7)
  {
    objc_msgSend(v7, "releaseByUser", a4, a5, a3);
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unsigned int v8 = *(MRImage **)((char *)&self->mImage + 1);
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  *(MRImage **)((char *)&self->mImage + 1) = 0LL;
  *(CGContext **)((char *)&self->mCachedRenderedText + 1) = 0LL;
  id v13 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  if (![v13 length]) {
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
  }
  objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:1];
  objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.949999988,  self->super.mPixelSize.height);
  [*(id *)(&self->super._isInInteractiveMode + 1) setText:v13];
  -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
  +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
  [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = v14;
  *(void *)((char *)&self->mSizeOfText.width + 1) = v15;
  if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
    || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
  {
    *(CGContext **)((char *)&self->mCachedRenderedText + 1) = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) countOfGlyphs];
    *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1) = (NSMutableArray *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    -[MREffectTableTopTitle cacheRenderedWords](self, "cacheRenderedWords");
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double height = self->super.mPixelSize.height;
  double v4 = self->super.mPixelSize.width * 0.949999988;
  result.double height = height;
  result.width = v4;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 1LL;
}

- (void)_unload
{
  v3 = *(CGContext **)((char *)&self->mCachedRenderedLetters + 1);
  if (v3)
  {
    CGContextRelease(v3);
    *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1) = 0LL;
  }

  double v4 = *(NSMutableArray **)((char *)&self->mLetterFrames + 1);
  if (v4)
  {

    *(NSMutableArray **)((char *)&self->mLetterFrames + 1) = 0LL;
  }

  v5 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v5)
  {
    [v5 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  v6 = *(MRImage **)((char *)&self->mImage + 1);
  if (v6)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) removingFromCollection];
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }

    *(MRImage **)((char *)&self->mImage + 1) = 0LL;
  }

  uint64_t v11 = *(NSMutableArray **)((char *)&self->mLetterImages + 1);
  if (v11)
  {

    *(NSMutableArray **)((char *)&self->mLetterImages + 1) = 0LL;
  }

- (void)cacheRenderedWords
{
  if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
    || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
  {
    v3 = *(NSMutableArray **)((char *)&self->mLetterFrames + 1);
    if (v3) {

    }
    *(NSMutableArray **)((char *)&self->mLetterFrames + 1) = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  *(CGContext **)((char *)&self->mCachedRenderedText + 1));
    double v4 = *(NSMutableArray **)((char *)&self->mLetterImages + 1);
    if (v4) {

    }
    *(NSMutableArray **)((char *)&self->mLetterImages + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [*(id *)(&self->super._isInInteractiveMode + 1) cacheText];
    if (*(uint64_t *)((char *)&self->mCachedRenderedText + 1) >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        v6 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContextOfGlyphAtIndex:v5];
        if (v6)
        {
          id v7 = v6;
          [*(id *)((char *)&self->mLetterFrames + 1) addObject:v6];
          CGBitmapContextGetWidth(v7);
          CGBitmapContextGetHeight(v7);
          [*(id *)(&self->super._isInInteractiveMode + 1) originOfGlyphAtIndex:v5];
          objc_msgSend( *(id *)((char *)&self->mLetterImages + 1),  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
          CFRelease(v7);
        }

        ++v5;
      }

      while (v5 < *(uint64_t *)((char *)&self->mCachedRenderedText + 1));
    }

    [*(id *)(&self->super._isInInteractiveMode + 1) clearCache];
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
    || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
  {
    if (*(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1)
      || (-[MREffect loadForTime:inContext:withArguments:now:]( self,  "loadForTime:inContext:withArguments:now:",  a4,  a5,  1LL,  a3),  *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1)))
    {
      id v10 = (MRTextRenderer *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1));
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v10;
      -[MRTextRenderer setLabel:](v10, "setLabel:", @"Marimba WaterColor Title");
      CGContextRelease(*(CGContextRef *)((char *)&self->mCachedRenderedLetters + 1));
      *(NSMutableArray **)((char *)&self->mCachedRenderedLetters + 1) = 0LL;
      *(MRImage **)((char *)&self->mImage + 1) = (MRImage *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v11 = (char *)[*(id *)((char *)&self->mLetterFrames + 1) count];
      if ((uint64_t)v11 >= 1)
      {
        __int128 v12 = v11;
        for (i = 0LL; i != v12; ++i)
        {
          id v14 = objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  objc_msgSend(*(id *)((char *)&self->mLetterFrames + 1), "objectAtIndex:", i));
          [v14 setLabel:@"Marimba TableTop Title Letter"];
          objc_msgSend(*(id *)((char *)&self->mImage + 1), "addObject:", objc_msgSend(v14, "insertingInCollection"));
          [v14 releaseByUser];
        }
      }

      *(NSMutableArray **)((char *)&self->mLetterFrames + 1) = 0LL;
    }
  }

  if (*(MRTextRenderer **)((char *)&self->mTextRenderer + 1))
  {
LABEL_11:
    id v15 = +[MURandom randomGeneratorWithSeed:]( &OBJC_CLASS___MURandom,  "randomGeneratorWithSeed:",  self->super.mSeed,  a5);
    [a4 blend:2];
    if (a3 < 1.0)
    {
      float v16 = (a3 + -0.5) * 3.14159265;
      uint64_t v121 = 0LL;
      int v122 = 0;
      float v17 = (sinf(v16) + 1.0) * -0.5 + 1.0;
      float v123 = v17;
      [a4 composeForeColor:&v121 saveTo:v120];
      __int128 v118 = xmmword_1FBBBC;
      __int128 v119 = unk_1FBBCC;
      [a4 setVertex2DPointer:&v118];
      [a4 setShader:@"PlainTexture"];
      [a4 drawTriangleStripFromOffset:0 count:4];
      [a4 unsetShader];
      [a4 unsetVertexPointer];
      [a4 restoreForeColor:v120];
    }

    double mPhaseInDuration = self->super.mPhaseInDuration;
    if (a3 <= 0.25 || mPhaseInDuration <= a3)
    {
      if (mPhaseInDuration <= a3)
      {
        p_mPixelSize = &self->super.mPixelSize;
        objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
        double v22 = v21;
        double v24 = v23;
        if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
          || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
        {
          if ([*(id *)((char *)&self->mImage + 1) count])
          {
            else {
              v25 = @"PlainTexture";
            }
            [a4 setShader:v25];
            if (*(uint64_t *)((char *)&self->mCachedRenderedText + 1) >= 1)
            {
              uint64_t v26 = 0LL;
              do
              {
                objc_msgSend( objc_msgSend(*(id *)((char *)&self->mLetterImages + 1), "objectAtIndex:", v26),  "CGRectValue");
                double height = self->super.mPixelSize.height;
                double v29 = v28 / p_mPixelSize->width;
                double v30 = v29 + v29;
                double v32 = v31 / height;
                double v33 = v32 + v32;
                double v35 = v29 + v22 * -0.5 + v34 / p_mPixelSize->width * 2.0;
                double v37 = v32 + v24 * -0.5 + v36 / height * 2.0 + -0.389999986;
                id v38 = [*(id *)((char *)&self->mImage + 1) objectAtIndex:v26];
                +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v38,  a4,  v35,  v37,  v30,  v33);
                [v38 width];
                ++v26;
              }

              while (v26 < *(uint64_t *)((char *)&self->mCachedRenderedText + 1));
            }

            [a4 unsetShader];
          }
        }
      }
    }

    else
    {
      double v39 = (a3 + -0.25) / (mPhaseInDuration + -0.25) + -0.5;
      float v40 = v39 * 3.14159265;
      double v114 = (sinf(v40) + 1.0) * 0.5;
      v41 = &self->super.mPixelSize;
      double v42 = (1.0 - v114) * 3.0 * self->super.mPixelSize.width * 0.001;
      if (*(uint64_t *)((char *)&self->mCachedRenderedText + 1) < 1)
      {
        double v52 = 0.0;
        double v51 = 0.0;
      }

      else
      {
        unsigned int v43 = 0;
        unsigned int v44 = 0;
        uint64_t v45 = 0LL;
        do
        {
          objc_msgSend(objc_msgSend(*(id *)((char *)&self->mLetterImages + 1), "objectAtIndex:", v45), "CGRectValue");
          float v47 = v46;
          unsigned int v43 = (float)(ceilf(v47) + (float)v43);
          objc_msgSend(objc_msgSend(*(id *)((char *)&self->mLetterImages + 1), "objectAtIndex:", v45), "CGRectValue");
          float v49 = v48;
          unsigned int v50 = vcvtps_u32_f32(v49);
          if (v44 <= v50) {
            unsigned int v44 = v50;
          }
          ++v45;
        }

        while (v45 < *(uint64_t *)((char *)&self->mCachedRenderedText + 1));
        double v51 = (double)v43;
        double v52 = (double)v44;
      }

      float v53 = fmin(v42, 1.0);
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      float v54 = v42;
      ComputeGaussian((float *)&v118, &v116, v54, v53);
      v120[0] = 0LL;
      v120[1] = 0LL;
      id v55 = objc_msgSend(a4, "beginLocalContextWithSize:backgroundColor:state:", v120, &v121, v51, v52);
      [v55 setShader:@"GaussianBlurS4"];
      for (uint64_t j = 0LL; j != 4; ++j)
      {
        int v57 = *((_DWORD *)&v118 + j);
        v58 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"coeffs[%d]", j);
        LODWORD(v59) = v57;
        [v55 setShaderUniformFloat:v58 forKey:v59];
      }

      LODWORD(v61) = 0;
      *(float *)&double v60 = v53;
      [v55 setShaderUniformVec2:@"sStep" :v60 forKey:v61];
      if (*(uint64_t *)((char *)&self->mCachedRenderedText + 1) >= 1)
      {
        uint64_t v62 = 0LL;
        double v63 = 0.0;
        do
        {
          id v64 = [*(id *)((char *)&self->mImage + 1) objectAtIndex:v62];
          objc_msgSend(v64, "relativeSizeInContextPixelSize:", v51, v52);
          +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v64,  v55,  (v63 + v63) / v51 + v65 * 0.5 + -1.0,  0.0,  v65,  v66);
          [v64 width];
          double v63 = v63 + v67;
          ++v62;
        }

        while (v62 < *(uint64_t *)((char *)&self->mCachedRenderedText + 1));
      }

      [v55 unsetShader];
      id v68 = [a4 retainedByUserImageByEndingLocalContext:v55 andRestoreState:&v121];
      objc_msgSend(a4, "setForeColor:saveTo:", objc_msgSend(a4, "foreColor"), v117);
      [a4 setShader:@"GaussianBlurS4"];
      for (uint64_t k = 0LL; k != 4; ++k)
      {
        int v70 = *((_DWORD *)&v118 + k);
        v71 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"coeffs[%d]", k);
        LODWORD(v72) = v70;
        [a4 setShaderUniformFloat:v71 forKey:v72];
      }

      LODWORD(v73) = 0;
      *(float *)&double v74 = v53;
      [a4 setShaderUniformVec2:@"sStep" :v73 forKey:v74];
      if (*(uint64_t *)((char *)&self->mCachedRenderedText + 1) >= 1)
      {
        uint64_t v75 = 0LL;
        double v111 = v114 * -0.5 + 1.5;
        double v112 = v114 * -0.2 + 1.2;
        double v76 = 0.0;
        double v113 = v51;
        do
        {
          id v77 = [*(id *)((char *)&self->mImage + 1) objectAtIndex:v75];
          objc_msgSend(objc_msgSend(*(id *)((char *)&self->mLetterImages + 1), "objectAtIndex:", v75), "CGRectValue");
          double v79 = v78;
          double v81 = v80;
          double v83 = v82;
          double v85 = v84;
          double v86 = v82 / v41->width + v82 / v41->width;
          double v87 = v84 / self->super.mPixelSize.height + v84 / self->super.mPixelSize.height;
          objc_msgSend(*(id *)((char *)&self->mTextRenderer + 1), "relativeSizeInContextPixelSize:");
          double v89 = v83 / v41->width + v88 * -0.5 + v79 / v41->width * 2.0;
          double v115 = v85 / self->super.mPixelSize.height
               + v90 * -0.5
               + v81 / self->super.mPixelSize.height * 2.0
               + -0.389999986;
          [v15 randomFloatInRange:1.0 :2.0];
          double v92 = v91;
          *(float *)&double v91 = (v39 + (v91 + -1.0) / -10.0) * 3.14159265;
          float v93 = sinf(*(float *)&v91);
          float v94 = v92;
          float v95 = powf(v93 + 1.0, v94) * 0.5;
          double v96 = v39;
          if (v95 < 1.0) {
            float v97 = v95;
          }
          else {
            float v97 = 1.0;
          }
          unint64_t v98 = (unint64_t)[v15 randomInt] & 0x8000000000000001;
          double v99 = v112;
          if (v98 != 1) {
            double v99 = 1.0;
          }
          double v100 = v89 * v99;
          uint64_t v101 = (uint64_t)[v15 randomInt] % 5;
          double v105 = v111;
          if (v101 != 1) {
            double v105 = 1.0;
          }
          double v106 = v86 * v105;
          double v107 = v87 * v105;
          LODWORD(v105) = v117[0];
          LODWORD(v102) = v117[1];
          LODWORD(v103) = v117[2];
          *(float *)&double v104 = *(float *)&v117[3] * v97;
          double v39 = v96;
          [a4 setForeColorRed:0 green:v105 blue:v102 alpha:v103 saveTo:v104];
          [v77 width];
          double v109 = v108;
          [v68 setCenterX:(v76 + v108 * 0.5 + v76 + v108 * 0.5) / v113 + -1.0];
          [v68 setScale:v113 / v109];
          +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v68,  a4,  v100,  v115,  v106,  v107);
          double v76 = v76 + v109;
          ++v75;
        }

        while (v75 < *(uint64_t *)((char *)&self->mCachedRenderedText + 1));
      }

      [a4 unsetShader];
      [a4 restoreForeColor:v117];
      [v68 releaseByUser];
    }

    [a4 blend:0];
  }

  float64x2_t v110 = vdivq_f64(*(float64x2_t *)((char *)&self->mTextSprite + 1), (float64x2_t)self->super.mPixelSize);
  LODWORD(v9) = 0;
  objc_msgSend( *(id *)((char *)&self->mNumberOfLetters + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.0,  -0.39,  vaddq_f64(v110, v110),  v9);
}

@end