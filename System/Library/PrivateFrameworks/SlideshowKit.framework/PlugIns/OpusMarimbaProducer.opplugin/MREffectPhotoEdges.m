@interface MREffectPhotoEdges
- (BOOL)getVerticesCoordinates:(MREffectPhotoEdges *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectPhotoEdges)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectPhotoEdges

- (MREffectPhotoEdges)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectPhotoEdges;
  v3 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:", a3);
  v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 185) = 0LL;
    *(void *)(v3 + 297) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4[289] = 0;
    v8[0] = xmmword_1FC1F8;
    v8[1] = unk_1FC208;
    *(void *)(v4 + 321) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v8);
    v7[0] = xmmword_1FC218;
    v7[1] = unk_1FC228;
    *(void *)(v4 + 329) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v7);
    *(_OWORD *)(v4 + 193) = 0u;
    *(_OWORD *)(v4 + 209) = 0u;
    *(_OWORD *)(v4 + 225) = 0u;
    *(_OWORD *)(v4 + 241) = 0u;
    *(_OWORD *)(v4 + 257) = 0u;
    *(_OWORD *)(v4 + 273) = 0u;
  }

  return (MREffectPhotoEdges *)v4;
}

- (void)_cleanup
{
  *(void *)(&self->mIsLoaded + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(MRImage **)((char *)&self->mText0Image + 1) = 0LL;
  uint64_t v3 = 0LL;
  *(MRCAMLBezierData **)((char *)&self->mBezierEaseIn + 1) = 0LL;
  BYTE1(self->mBreakProvider[11]) = 0;
  v4 = (char *)&self->mFrameProvider + 1;
  do
  {

    *(void *)&v4[v3] = 0LL;
    v3 += 8LL;
  }

  while (v3 != 96);
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  BOOL v6 = !v5 || ![v5 length] || *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) != 0;
  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break"))
  {
    uint64_t v7 = 0LL;
    LOBYTE(v8) = 1;
    do
    {
      while ((v8 & 1) == 0)
      {
        LOBYTE(v8) = 0;
        BOOL v9 = 0;
        if (++v7 == 12) {
          return v9;
        }
      }

      unsigned int v8 = [*(id *)((char *)&self->mFrameProvider + 8 * v7++ + 1) isLoadedForTime:a3];
    }

    while (v7 != 12);
    if (!v8) {
      return 0;
    }
  }

  v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (!v10)
  {
    if (v6) {
      return !self->super.mNeedsToUpdateTexts;
    }
    return 0;
  }

  return !self->super.mNeedsToUpdateTexts;
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MREffectPhotoEdges;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v20,  "setPhaseInDuration:mainDuration:phaseOutDuration:");
  BOOL v9 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    double v13 = a3 + a4 + a5;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = -[NSDictionary objectForKey:](v9, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14));
        [v15 setShowTime:0.0];
        [v15 setShowDuration:v13];
        v14 = (char *)v14 + 1;
      }

      while (v11 != v14);
      id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    }

    while (v11);
  }

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___MREffectPhotoEdges;
    -[MREffect setPixelSize:](&v19, "setPixelSize:", a3.width, a3.height);
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break"))
    {
      for (uint64_t i = 0LL; i != 96; i += 8LL)
        objc_msgSend(*(id *)((char *)&self->mFrameProvider + i + 1), "setDefaultSize:", width, height);
    }

    id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"itle"))
    {
      [v9 imageAspectRatio];
      if (v10 < 0.5 || v10 > 2.0)
      {
        [v9 imageAspectRatio];
        if (v12 >= 1.0)
        {
          CGFloat v17 = p_mPixelSize->height * 0.5;
          [v9 imageAspectRatio];
          double v13 = v17 * v18;
          double v16 = p_mPixelSize->height * 0.5;
        }

        else
        {
          double v13 = p_mPixelSize->width * 0.5;
          CGFloat v14 = p_mPixelSize->height * 0.5;
          [v9 imageAspectRatio];
          double v16 = v14 / v15;
        }

        objc_msgSend(v9, "setDefaultSize:", v13, v16);
      }
    }
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v5 = a5;
  id v9 = &OBJC_IVAR___MRContextState_backColor;
  if (!BYTE1(self->mBreakProvider[11]))
  {
    id v50 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    double v10 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v52,  v56,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = -[NSDictionary objectForKey:]( v10,  "objectForKey:",  *(void *)(*((void *)&v52 + 1) + 8LL * (void)i));
          [v15 setShowTime:0.0];
          [v15 setShowDuration:self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration];
        }

        id v12 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v52,  v56,  16LL);
      }

      while (v12);
    }

    id v16 = -[NSDictionary objectForKey:](v10, "objectForKey:", @"image0");
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"itle")
      || -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Outro"))
    {
      [v16 imageAspectRatio];
      BOOL v18 = v17 > 2.0 || v17 < 0.5;
    }

    else
    {
      BOOL v18 = 0;
    }

    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break") || v18)
    {
      v48 = v16;
      uint64_t v26 = 0LL;
      v27 = (char *)&self->mFrameProvider + 1;
      if (objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"frameColor"),  "integerValue") == (char *)&dword_0 + 1) {
        v28 = @"black";
      }
      else {
        v28 = @"white";
      }
      do
      {
        if (!*(void *)&v27[8 * v26])
        {
          v29 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"break-%@_%02d.png",  v28,  v26 + 1);
          v30 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
          *(void *)&v27[8 * v26] = v30;
          -[MRImageProvider setDefaultSize:]( v30,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
          objc_msgSend( *(id *)&v27[8 * v26],  "setAssetPath:",  objc_msgSend(v50, "resourcePathForEffectID:andResource:", @"PhotoEdges_Break", v29));
          [*(id *)&v27[8 * v26] setImageSizeScript:@"(layerWidth * .2),(layerWidth * .2)/imageAspectRatio"];
          [*(id *)&v27[8 * v26] setEffectAttributes:self->super.mFlattenedAttributes];
          objc_msgSend(*(id *)&v27[8 * v26], "setOriginalImageSize:", 200.0, 200.0);
        }

        ++v26;
      }

      while (v26 != 12);
      id v5 = a5;
      id v9 = &OBJC_IVAR___MRContextState_backColor;
      if (v18)
      {
        [v48 setImageSizeScript:0];
        [v48 imageAspectRatio];
        if (v31 >= 1.0)
        {
          CGFloat v41 = self->super.mPixelSize.height * 0.5;
          [v48 imageAspectRatio];
          double v37 = v41 * v42;
          double v35 = self->super.mPixelSize.height * 0.5;
          v36 = v48;
        }

        else
        {
          CGFloat v32 = self->super.mPixelSize.width * 0.5;
          CGFloat v33 = self->super.mPixelSize.height * 0.5;
          [v48 imageAspectRatio];
          double v35 = v33 / v34;
          v36 = v48;
          double v37 = v32;
        }

        objc_msgSend(v36, "setDefaultSize:", v37, v35);
      }

      goto LABEL_44;
    }

    id v19 = objc_msgSend( objc_msgSend(v50, "descriptionForEffectID:", self->super.mEffectID),  "objectForKey:",  @"imageProviderInfo");
    objc_super v20 = (char *)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"frameColor"),  "integerValue");
    v21 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
    id v22 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"1"))
    {
      if (v20 == (_BYTE *)&dword_0 + 1) {
        v23 = @"portraitBlack";
      }
      else {
        v23 = @"portraitWhite";
      }
      id v5 = a5;
      if (v21 == (_BYTE *)&dword_0 + 1)
      {
        double v24 = 2372.0;
        double v25 = 1652.0;
LABEL_43:
        id v43 = [v19 objectForKey:v23];
        id v9 = &OBJC_IVAR___MRContextState_backColor;
        *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setAssetPath:",  objc_msgSend( v50,  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  objc_msgSend(v43, "objectForKey:", @"imageName")));
        objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
        objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setImageSizeScript:",  objc_msgSend(v43, "objectForKey:", @"imageSizeScript"));
        [*(id *)(&self->super._isInInteractiveMode + 1) setEffectAttributes:self->super.mFlattenedAttributes];
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setOriginalImageSize:", v25, v24);
LABEL_44:
        BYTE1(self->mBreakProvider[11]) = 1;
        goto LABEL_45;
      }

      BOOL v38 = v20 == (_BYTE *)&dword_0 + 1;
      double v25 = dbl_1FC060[v20 == (_BYTE *)&dword_0 + 1];
      if (v20 == (_BYTE *)&dword_0 + 1) {
        double v24 = 1600.0;
      }
      else {
        double v24 = 2600.0;
      }
      v39 = @"squareWhite";
      v40 = @"squareBlack";
    }

    else
    {
      id v5 = a5;
      if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"2"))
      {
        BOOL v38 = v20 == (_BYTE *)&dword_0 + 1;
        double v24 = dbl_1FC040[v20 == (_BYTE *)&dword_0 + 1];
        double v25 = dbl_1FC050[v20 == (_BYTE *)&dword_0 + 1];
        v39 = @"landscapeWhite";
        v40 = @"landscapeBlack";
      }

      else
      {
        if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Outro"))
        {
          v23 = @"square";
          double v24 = 1630.0;
          double v25 = 1396.0;
          goto LABEL_43;
        }

        if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title"))
        {
          BOOL v38 = v22 == 0LL;
          double v24 = dbl_1FC020[v22 == 0LL];
          double v25 = dbl_1FC030[v22 == 0LL];
          v39 = @"titlePortrait";
          v40 = @"titleLandscape";
        }

        else
        {
          unsigned int v47 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle");
          if (v47) {
            double v24 = 2600.0;
          }
          else {
            double v24 = 2300.0;
          }
          if (v47) {
            double v25 = 3018.0;
          }
          else {
            double v25 = 3300.0;
          }
          v39 = @"squareWhite";
          if (v47) {
            v23 = @"squareWhite";
          }
          else {
            v23 = @"landscapeBlack";
          }
          if ((v47 & 1) != 0 || !v22) {
            goto LABEL_43;
          }
          v40 = @"portraitWhite";
          if (v20 == (_BYTE *)&dword_0 + 1) {
            v40 = @"portraitBlack";
          }
          BOOL v38 = v21 == (_BYTE *)&dword_0 + 1;
          double v24 = dbl_1FC000[v21 == (_BYTE *)&dword_0 + 1];
          double v25 = dbl_1FC010[v21 == (_BYTE *)&dword_0 + 1];
        }
      }
    }

    if (v38) {
      v23 = v40;
    }
    else {
      v23 = v39;
    }
    goto LABEL_43;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v283 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"frameColor"),  "integerValue");
  id v9 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
  id v10 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
  unsigned int v282 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"layoutStyle"),  "intValue");
  double mMainDuration = self->super.mMainDuration;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double mPhaseOutDuration = self->super.mPhaseOutDuration;
  [a4 localAspectRatio];
  double v15 = 1.0;
  if (v14 > 1.6 && v9 == (_BYTE *)&dword_0 + 1)
  {
    [a4 localAspectRatio];
    float v17 = 1.6 / v16;
    double v15 = v17;
  }

  BOOL v18 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  if (!-[NSDictionary count](v18, "count"))
  {
    int v226 = 0;
    BOOL v227 = 0;
    double v55 = 0.0;
    goto LABEL_237;
  }

  double v19 = mMainDuration + mPhaseInDuration + mPhaseOutDuration;
  double v20 = v19 * 0.5 + -0.5;
  double v21 = v19 * 0.5 + 1.25;
  double v258 = v21 + 0.5;
  id v22 = v9;
  BOOL v23 = v21 + 0.5 <= a3;
  double v24 = v21 + -0.5;
  *(float *)&double v21 = a3 - (v21 + -0.5);
  double v308 = a3;
  float v25 = sinf((float)(*(float *)&v21 + -0.5) * 3.1416);
  double v289 = v19 * 0.5 + 0.5;
  BOOL v26 = v289 < a3;
  v297 = v18;
  BOOL v27 = v20 > a3;
  if (v20 > a3) {
    BOOL v26 = 1;
  }
  BOOL v255 = v26;
  float v28 = a3 - v20;
  double v29 = 1.25;
  double v30 = v308;
  float v31 = sinf((float)(v28 + -0.5) * 3.1416);
  int64_t v32 = 0LL;
  BOOL v296 = 0;
  unsigned int v33 = 0;
  BOOL v34 = v308 <= 1.25;
  float v35 = 1.0;
  float v36 = 0.0;
  if (v308 >= 1.25) {
    float v36 = 1.0;
  }
  float v257 = v36;
  if (v308 > 2.5) {
    BOOL v34 = 1;
  }
  BOOL v268 = v34;
  double v37 = -0.01;
  if (v283 == (_BYTE *)&dword_0 + 1) {
    double v37 = 0.0;
  }
  double v288 = v37;
  v286 = v22;
  double v38 = 0.875;
  if (v22 == (_BYTE *)&dword_0 + 1) {
    double v38 = 0.7;
  }
  double v39 = dbl_1FC070[v283 == (_BYTE *)&dword_0 + 1];
  if (v22 == (_BYTE *)&dword_0 + 1) {
    double v39 = 1.095;
  }
  double v284 = v39;
  double v40 = 0.8;
  if (v22 != (_BYTE *)&dword_0 + 1) {
    double v40 = 1.0;
  }
  double v41 = dbl_1FC080[v22 == (_BYTE *)&dword_0 + 1];
  double v42 = v19 + -1.25;
  if (!v10) {
    double v41 = 0.0;
  }
  double v275 = v41;
  double v43 = dbl_1FC090[v22 == (_BYTE *)&dword_0 + 1];
  if (!v10) {
    double v43 = 0.001;
  }
  double v274 = v43;
  if (!v10) {
    double v38 = 1.515;
  }
  double v273 = v38;
  double v44 = dbl_1FC0A0[v22 == (_BYTE *)&dword_0 + 1];
  if (!v10) {
    double v44 = 0.88;
  }
  double v272 = v44;
  double v45 = 1.65;
  if (v10) {
    double v45 = v40;
  }
  double v263 = v45;
  double v46 = dbl_1FC0B0[v22 == (_BYTE *)&dword_0 + 1];
  if (!v10) {
    double v46 = 1.0;
  }
  double v262 = v46;
  BOOL v73 = v24 < v308;
  double v47 = 0.5;
  char v48 = !v73 || v23;
  char v254 = v48;
  float v49 = (v25 + 1.0) * 0.5;
  float v253 = v49;
  double v287 = (v308 - v42) / 1.25;
  double v298 = v19 + -1.25;
  float v50 = (v31 + 1.0) * 0.5;
  float v271 = v50;
  double v256 = v42 + -1.25;
  double v251 = dbl_1FC0C0[v22 == (_BYTE *)&dword_0 + 1];
  double v252 = (v308 - (v42 + -1.25)) / 1.25;
  double v265 = dbl_1FC0F0[v10 == 0LL];
  double v264 = dbl_1FC100[v10 == 0LL];
  double v281 = dbl_1FC120[v283 == (_BYTE *)&dword_0 + 1];
  double v280 = dbl_1FC130[v283 == (_BYTE *)&dword_0 + 1];
  char v51 = v42 < v308 || v27;
  char v267 = v51;
  __int128 v52 = v297;
  double v53 = (double)v282 + -1.0;
  double v279 = dbl_1FC110[v283 == (_BYTE *)&dword_0 + 1] + v53 * 0.1;
  double v269 = -dbl_1FC170[v283 == (_BYTE *)&dword_0 + 1];
  double v270 = v53 * 0.1;
  double v250 = dbl_1FC0D0[v22 == (_BYTE *)&dword_0 + 1];
  double v249 = dbl_1FC0E0[v22 == (_BYTE *)&dword_0 + 1];
  double v261 = dbl_1FC140[v22 == (_BYTE *)&dword_0 + 1];
  double v260 = dbl_1FC150[v22 == (_BYTE *)&dword_0 + 1];
  double v259 = dbl_1FC160[v22 == (_BYTE *)&dword_0 + 1];
  double v277 = dbl_1FC180[v22 == (_BYTE *)&dword_0 + 1];
  double v276 = dbl_1FC190[v22 == (_BYTE *)&dword_0 + 1];
  CGFloat y = CGRectZero.origin.y;
  CGFloat height = CGRectZero.size.height;
  CGFloat width = CGRectZero.size.width;
  double v278 = v19 * 0.5 + -0.5;
  double v266 = v20 + 1.25;
  double v54 = 1.0;
  double v55 = 0.0;
  id v295 = a5;
  double v294 = v15;
  v285 = self;
  do
  {
    if ((char *)-[NSDictionary count](v52, "count", *(void *)&v249, *(void *)&v250) == (char *)&dword_0 + 1)
    {
      if (v30 >= v29)
      {
        float v62 = 1.0;
        double v309 = v15;
        if (v298 >= v30) {
          goto LABEL_56;
        }
LABEL_46:
        v63 = *(MRCAMLBezierData **)((char *)&self->mBezierEaseIn + 1);
        double v64 = v287;
LABEL_47:
        [v63 evaluatAtTime:v64];
        double v309 = (v54 + v65 * 0.2) * v15;
        double v60 = v54 - v65;
        *(float *)&double v59 = v60;
      }

      else
      {
LABEL_40:
        v56 = *(MRImage **)((char *)&self->mText0Image + 1);
        double v57 = v308 / 1.25;
LABEL_41:
        [v56 evaluatAtTime:v57];
        *(float *)&double v59 = v58;
        double v60 = (v58 * 0.1 + 0.899999976) * v15;
        double v309 = v60;
      }

      goto LABEL_48;
    }

    if ((char *)-[NSDictionary count](v52, "count") != (char *)&dword_0 + 2)
    {
      float v62 = 1.0;
      if ((int *)-[NSDictionary count](v52, "count") == &dword_4)
      {
        switch(v33)
        {
          case 0u:
            if (v30 < v29) {
              goto LABEL_40;
            }
            double v60 = v289;
            double v309 = v15;
            if (v289 < v30) {
              goto LABEL_107;
            }
            goto LABEL_56;
          case 1u:
            if (!v268)
            {
              v56 = *(MRImage **)((char *)&self->mText0Image + 1);
              double v57 = (v308 + -1.25) / 1.25;
              goto LABEL_41;
            }

            float v62 = 0.0;
            double v60 = v258;
            double v309 = v15;
            *(float *)&double v59 = v257;
            if (v258 >= v30) {
              goto LABEL_48;
            }
            goto LABEL_203;
          case 2u:
            if ((v267 & 1) != 0) {
              goto LABEL_107;
            }
            double v60 = v256;
            if (v256 < v30)
            {
              v63 = *(MRCAMLBezierData **)((char *)&self->mBezierEaseIn + 1);
              double v64 = v252;
              goto LABEL_47;
            }

            double v309 = v15;
            *(float *)&double v59 = v271;
            if (v255) {
              goto LABEL_56;
            }
            goto LABEL_48;
          case 3u:
            double v60 = v266;
            if (v266 > v30)
            {
LABEL_107:
              float v62 = 0.0;
              goto LABEL_203;
            }

            double v60 = v298;
            if (v298 < v30) {
              goto LABEL_46;
            }
            double v309 = v15;
            *(float *)&double v59 = v253;
            if ((v254 & 1) != 0) {
              goto LABEL_56;
            }
            goto LABEL_48;
          default:
            break;
        }
      }

      double v309 = v15;
      goto LABEL_56;
    }

    if (v30 >= v29)
    {
      LODWORD(v59) = 1.0;
      double v60 = v298;
      double v309 = v15;
      if (v298 < v30)
      {
        objc_msgSend(*(id *)((char *)&self->mBezierEaseIn + 1), "evaluatAtTime:", v287, v59);
        double v309 = (v54 + v83 * 0.2) * v15;
        double v60 = v54 - v83;
        *(float *)&double v59 = v60;
      }
    }

    else
    {
      [*(id *)((char *)&self->mText0Image + 1) evaluatAtTime:v308 / 1.25];
      *(float *)&double v59 = v61;
      double v60 = (v61 * 0.1 + 0.899999976) * v15;
      double v309 = v60;
    }

    float v62 = 0.0;
    if (v33 || (double v60 = v289, v289 > v30))
    {
      if (v33 == 1)
      {
        double v60 = v298;
        if (v298 > v30)
        {
          double v60 = v278;
          if (v278 > v30) {
            goto LABEL_203;
          }
          float v62 = 1.0;
          double v60 = v289;
          *(float *)&double v59 = v271;
          if (v289 <= v30)
          {
LABEL_56:
            v66 = ImageKey(v32);
            id v67 = objc_msgSend( -[NSDictionary objectForKey:](v52, "objectForKey:", v66),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v30);
            [v67 aspectRatio];
            double v55 = v60;
            if (!v67) {
              goto LABEL_203;
            }
            if (v62 < v35)
            {
              LODWORD(v60) = 1.0;
              LODWORD(v68) = 1.0;
              LODWORD(v69) = 1.0;
              *(float *)&double v70 = v62;
              [a4 composeForeColorRed:v313 green:v60 blue:v68 alpha:v69 saveTo:v70];
            }

            float v305 = v62;
            double v71 = self->super.mMainDuration;
            if (v71 + -1.0 >= v30) {
              double v72 = 0.0;
            }
            else {
              double v72 = v54;
            }
            BOOL v73 = v71 + -1.0 < v30 || v30 < v54;
            if (!v73)
            {
              float v74 = ((v308 + -1.0) / (v71 + -2.0) + -0.5) * 3.14159274;
              double v72 = (sinf(v74) + v54) * v47;
            }

            BOOL v75 = v55 > 2.0 || v55 < v47;
            double v306 = v55;
            if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"1"))
            {
              if (v286 == (_BYTE *)&dword_0 + 1)
              {
                double v76 = v30;
                double v77 = dbl_1FC1B0[(v33 & 1) == 0];
                double v78 = 0.002;
                double v79 = 0.7;
              }

              else
              {
                double v76 = v30;
                if (v283 == (_BYTE *)&dword_0 + 1)
                {
                  double v77 = dbl_1FC1A0[(v33 & 1) == 0];
                  double v78 = 0.002;
                }

                else
                {
                  double v77 = -0.472;
                  if ((v33 & 1) == 0) {
                    double v77 = v47;
                  }
                  double v78 = 0.007;
                }

                double v79 = 0.8;
              }

              double v81 = v288 + v77;
              double v80 = v309 * v79;
              double v82 = v284 * v309;
              goto LABEL_114;
            }

            if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"2"))
            {
              double v76 = v30;
              double v78 = v281;
              double v80 = v280 * v309;
              double v81 = v279;
              double v82 = v309 * 0.965;
              goto LABEL_114;
            }

            if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"3"))
            {
              double v76 = v30;
              if (v282 == 2)
              {
                double v84 = v265;
              }

              else
              {
                double v84 = 0.0;
                if (!v282) {
                  double v84 = v264;
                }
              }

              double v78 = v274;
              double v81 = v275 + v84;
              double v80 = v273 * v309;
              double v82 = v272 * v309;
LABEL_114:
              double x = CGRectZero.origin.x;
              double v302 = y;
              double v96 = width;
              double v307 = height;
LABEL_115:
              v97 = self;
              v98 = *(void **)(&self->mIsLoaded + 1);
              v99 = (MRCroppingSprite *)[v98 objectForKey:v66];
              if (!v99)
              {
                v99 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
                [v98 setObject:v99 forKey:v66];
              }

              else {
                v100 = @"PlainTexture";
              }
              [a4 setShader:v100];
              BOOL v296 = v75;
              unsigned int v101 = -[NSString hasSuffix:](v97->super.mEffectID, "hasSuffix:", @"Break") || v75;
              self = v97;
              if (v101 == 1) {
                [v67 setScale:1.0];
              }
              [a4 localAspectRatio];
              double v103 = v78 * v102;
              [a4 localAspectRatio];
              -[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( v99,  "renderImage:inContext:atPosition:andSize:",  v67,  a4,  v81,  v103,  v80,  v82 * v104);
              [v67 releaseByUser];
              a5 = v295;
              if (v101)
              {
                [a4 localAspectRatio];
                double v299 = v96;
                double v106 = v309 * (float)(v105 * 0.048);
                MRMatrix_Clear((uint64_t)v312);
                float v107 = v309 * -0.00499999989;
                float v108 = v309 * 0.00400000019;
                *(float *)&double v109 = MRMatrix_Translate(v312, v107, v108, 0.0);
                objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v312, v311, v109);
                v110 = (id *)((char *)&self->mFrameProvider + 1);
                id v111 = [*(id *)((char *)&self->mFrameProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v76];
                double v112 = v309 * 0.2;
                [v111 aspectRatio];
                double v114 = 0.2 / v113;
                [a4 localAspectRatio];
                double v116 = v309 * (v114 * v115);
                double v117 = x - v96 * 0.5;
                double v118 = v76;
                [a4 localAspectRatio];
                double v304 = v309 * 0.0399999991 + v117;
                double v120 = (v302 + v307 * 0.5) * v119 - v106;
                +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v111,  a4);
                [v111 releaseByUser];
                id v121 = [*(id *)((char *)&self->mBreakProvider[2] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v118];
                [a4 localAspectRatio];
                double v123 = x + v299 * 0.5 - v309 * 0.0399999991;
                double v124 = v106;
                double v301 = v106;
                double v290 = (v302 + v307 * 0.5) * v122 - v106;
                +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v121,  a4,  v123);
                [v121 releaseByUser];
                id v125 = [*(id *)((char *)&self->mBreakProvider[7] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v118];
                double v126 = v302 - v307 * 0.5;
                [a4 localAspectRatio];
                double v128 = v124 + v126 * v127;
                +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v125,  a4,  v304,  v128,  v309 * 0.2,  v116);
                [v125 releaseByUser];
                id v129 = [*(id *)((char *)&self->mBreakProvider[10] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                [a4 localAspectRatio];
                double v303 = v123;
                double v300 = v301 + v126 * v130;
                +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v129,  a4,  v123);
                [v129 releaseByUser];
                id v131 = [*(id *)((char *)self->mBreakProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                id v132 = [*(id *)((char *)&self->mBreakProvider[1] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                uint64_t v133 = (uint64_t)((v299 - v112 * 2.0 - v309 * 0.0399999991 * 2.0) / v112);
                double v134 = v304 + v309 * 0.2 * 0.5;
                if (v133 >= 1)
                {
                  uint64_t v135 = 0LL;
                  double v136 = v304 + v112 * 0.5;
                  do
                  {
                    if ((v135 & 1) != 0) {
                      id v137 = v132;
                    }
                    else {
                      id v137 = v131;
                    }
                    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v137,  a4,  v136 + v112 * 0.5,  v120,  v112,  v116);
                    double v136 = v112 + v136;
                    ++v135;
                  }

                  while (v133 != v135);
                }

                double v138 = v299 - v112 + -(v309 * 0.0399999991) * 2.0 - (double)v133 * v112;
                if ((v133 & 1) != 0) {
                  id v139 = v132;
                }
                else {
                  id v139 = v131;
                }
                double v310 = v303 + -(v309 * 0.2) * 0.5 - v138 * 0.5;
                +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v139,  a4);
                [v131 releaseByUser];
                [v132 releaseByUser];
                id v140 = [*(id *)((char *)&self->mBreakProvider[8] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                id v141 = [*(id *)((char *)&self->mBreakProvider[9] + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                if (v133 >= 1)
                {
                  for (uint64_t i = 0LL; i != v133; ++i)
                  {
                    if ((i & 1) != 0) {
                      id v143 = v141;
                    }
                    else {
                      id v143 = v140;
                    }
                    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v143,  a4,  v134 + v112 * 0.5,  v128,  v112,  v116);
                    double v134 = v112 + v134;
                  }
                }

                if ((v133 & 1) != 0) {
                  id v144 = v141;
                }
                else {
                  id v144 = v140;
                }
                +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v144,  a4,  v310,  v300,  v138,  v116);
                [v140 releaseByUser];
                [v141 releaseByUser];
                id v145 = [v110[4] retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                id v146 = [v110[6] retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                [a4 localAspectRatio];
                double v148 = v307 - (v116 + v116) / v147;
                [a4 localAspectRatio];
                uint64_t v150 = (uint64_t)(v148 / (v116 / v149));
                double v151 = -v116;
                if (v150 >= 1)
                {
                  uint64_t v152 = 0LL;
                  double v153 = v120 + v151 * 0.5;
                  do
                  {
                    if ((v152 & 1) != 0) {
                      id v154 = v146;
                    }
                    else {
                      id v154 = v145;
                    }
                    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v154,  a4,  v304,  v153 + v151 * 0.5,  v112,  v116);
                    double v153 = v153 - v116;
                    ++v152;
                  }

                  while (v150 != v152);
                }

                [a4 localAspectRatio];
                double v156 = v307 - v116 / v155;
                [a4 localAspectRatio];
                double v158 = v156 - (v301 + v301) / v157;
                [a4 localAspectRatio];
                double v160 = v158 - (double)v150 * (v116 / v159);
                if ((v150 & 1) != 0) {
                  id v161 = v146;
                }
                else {
                  id v161 = v145;
                }
                [a4 localAspectRatio];
                double v163 = v128 + v116 * 0.5 + v160 * 0.5 * v162;
                [a4 localAspectRatio];
                +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v161,  a4,  v304,  v163,  v112,  v160 * v164);
                [v145 releaseByUser];
                [v146 releaseByUser];
                id v165 = [v110[5] retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                id v166 = [v110[7] retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v308];
                double v47 = 0.5;
                if (v150 >= 1)
                {
                  uint64_t v167 = 0LL;
                  double v168 = v290 + v151 * 0.5;
                  do
                  {
                    if ((v167 & 1) != 0) {
                      id v169 = v166;
                    }
                    else {
                      id v169 = v165;
                    }
                    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v169,  a4,  v303,  v168 + v151 * 0.5,  v112,  v116);
                    double v168 = v168 - v116;
                    ++v167;
                  }

                  while (v150 != v167);
                }

                if ((v150 & 1) != 0) {
                  id v170 = v166;
                }
                else {
                  id v170 = v165;
                }
                [a4 localAspectRatio];
                double v172 = v300 + v116 * 0.5 + v160 * 0.5 * v171;
                [a4 localAspectRatio];
                +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v170,  a4,  v303,  v172,  v112,  v160 * v173);
                [v165 releaseByUser];
                [v166 releaseByUser];
                [a4 restoreModelViewMatrix:v311];
                self = v285;
                double v30 = v308;
                double v15 = v294;
                __int128 v52 = v297;
                double v29 = 1.25;
                float v35 = 1.0;
                double v54 = 1.0;
              }

              else
              {
                double v30 = v76;
                id v174 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:v295 withArguments:v76];
                double v15 = v294;
                __int128 v52 = v297;
                double v47 = 0.5;
                double v29 = 1.25;
                float v35 = 1.0;
                double v54 = 1.0;
                if (v174)
                {
                  v175 = v174;
                  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"1"))
                  {
                    double v176 = v288 + dbl_1FC1C0[(v33 & 1) == 0];
                    double v177 = 0.0;
                    double v178 = v276;
                    double v179 = v277;
                  }

                  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"2"))
                  {
                    double v178 = 1.1;
                    double v176 = v270;
                    double v179 = 1.65;
                    double v177 = v269;
                  }

                  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"3"))
                  {
                    double v177 = 0.0;
                    if (v282 == 2)
                    {
                      double v178 = v262;
                      double v179 = v263;
                      double v176 = v265;
                    }

                    else
                    {
                      double v178 = v262;
                      double v179 = v263;
                      if (v282) {
                        double v176 = 0.0;
                      }
                      else {
                        double v176 = v264;
                      }
                    }
                  }

                  else
                  {
                    unsigned __int8 v180 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title");
                    double v176 = -0.25;
                    double v178 = v259;
                    double v179 = v260;
                    double v177 = v261;
                    if ((v180 & 1) == 0)
                    {
                      unsigned int v181 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle", v259, v260);
                      double v178 = 0.972;
                      if (v181) {
                        double v178 = 0.801;
                      }
                      double v179 = 0.841;
                      if (v181)
                      {
                        double v179 = 0.9;
                        double v177 = -0.004;
                      }

                      else
                      {
                        double v177 = 0.0;
                      }

                      if (v181) {
                        double v176 = -0.4;
                      }
                      else {
                        double v176 = 0.3;
                      }
                    }
                  }

                  double v194 = v309 * v179;
                  double v195 = v309 * v178;
                  [a4 localAspectRatio];
                  double v197 = v177 * v196;
                  [a4 localAspectRatio];
                  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v175,  a4,  v176,  v197,  v194,  v195 * v198);
                  [v175 releaseByUser];
                  double v30 = v308;
                  double v47 = 0.5;
                  double v29 = 1.25;
                }
              }

              [a4 unsetShader];
              float v62 = v305;
              double v55 = v306;
              if (v305 < v35) {
                [a4 restoreForeColor:v313];
              }
              goto LABEL_203;
            }

            if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break"))
            {
              [v67 aspectRatio];
              double v85 = 1.0;
              if (v86 >= 1.0)
              {
                [v67 aspectRatio];
                double v88 = v87 * 1.6;
                [a4 localAspectRatio];
                double v85 = v88 / v89;
              }

              [v67 aspectRatio];
              if (v90 >= v54)
              {
                [a4 localAspectRatio];
                double v92 = 1.6 / v182;
              }

              else
              {
                [v67 aspectRatio];
                double v92 = v54 / v91;
              }

              double v80 = v309 * v85;
              double v82 = v309 * v92;
              [v67 aspectRatio];
              if (v183 < v54)
              {
                [a4 localAspectRatio];
                double v81 = 0.0;
                BOOL v73 = v92 * v184 < 1.95000005;
                double v185 = 0.0;
                if (!v73)
                {
                  objc_msgSend(a4, "localAspectRatio", 0.0);
                  double v187 = (float)(1.0 / v186) + v82 * -0.5;
                  [a4 localAspectRatio];
                  double v189 = v187 + (float)(-0.1 / v188);
                  [a4 localAspectRatio];
                  double v185 = v189 + (v82 + (float)(-1.8 / v190)) * v72;
                }

                double v78 = v185 + v185 - v185 * v309;
                double x = 0.0;
                goto LABEL_226;
              }

              double v78 = 0.0;
              double v193 = 0.0;
              double v76 = v308;
              if (v85 >= 1.95000005) {
                double v193 = v80 * 0.5 + -1.0 + 0.100000001 - (v80 + -1.79999995) * v72;
              }
              double v81 = v193 + v193 - v193 * v309;
              double x = v81;
              double v302 = 0.0;
LABEL_230:
              double v96 = v80;
              double v307 = v82;
              goto LABEL_115;
            }

            if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title"))
            {
              if (!v75)
              {
                double v76 = v30;
                double v78 = v251;
                double v80 = v250 * v309;
                double v82 = v249 * v309;
                double v81 = -0.2525;
                goto LABEL_114;
              }

              [v67 aspectRatio];
              if (v93 >= v54)
              {
                [v67 aspectRatio];
                double v94 = v199 * 0.619;
              }

              else
              {
                double v94 = 0.61;
              }

              [v67 aspectRatio];
              if (v200 >= v54)
              {
                double v202 = 0.619;
              }

              else
              {
                [v67 aspectRatio];
                double v202 = 0.61 / v201;
              }

              double v80 = v309 * v94;
              double v82 = v309 * v202;
              [v67 aspectRatio];
              if (v203 < v54)
              {
                [a4 localAspectRatio];
                double v205 = v202 * v204;
                double v206 = 0.0;
                if (v205 >= 1.95000005)
                {
                  objc_msgSend(a4, "localAspectRatio", 0.0);
                  double v208 = (float)(1.0 / v207) + v82 * -0.5;
                  [a4 localAspectRatio];
                  double v210 = v208 + (float)(-0.1 / v209);
                  [a4 localAspectRatio];
                  double v206 = v210 + (v82 + (float)(-1.8 / v211)) * v72;
                }

                double v78 = v206 + v206 - v206 * v309;
                double v81 = -0.2525;
LABEL_225:
                double x = v81;
LABEL_226:
                double v302 = v78;
                double v96 = v80;
                double v307 = v82;
                double v76 = v308;
                goto LABEL_115;
              }
            }

            else
            {
              if (!-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle") && !v75)
              {
                double v76 = v30;
                double v80 = v309 * 0.738;
                double v82 = v309 * 0.851;
                double v78 = 0.0;
                double v81 = 0.307;
                goto LABEL_114;
              }

              if (!v75)
              {
                double v76 = v30;
                double v80 = v309 * 0.7875;
                double v82 = v309 * 0.6875;
                double v81 = -0.39;
                double v78 = 0.005;
                goto LABEL_114;
              }

              unsigned int v191 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Outro");
              [v67 aspectRatio];
              if (v192 >= v54)
              {
                [v67 aspectRatio];
                double v94 = v212 * 0.619;
              }

              else
              {
                double v94 = 0.61;
              }

              [v67 aspectRatio];
              if (v213 >= v54)
              {
                double v215 = 0.619;
              }

              else
              {
                [v67 aspectRatio];
                double v215 = 0.61 / v214;
              }

              double v80 = v309 * v94;
              double v82 = v309 * v215;
              [v67 aspectRatio];
              if (v216 < v54)
              {
                if (v191) {
                  double v81 = 0.307;
                }
                else {
                  double v81 = -0.385;
                }
                [a4 localAspectRatio];
                double v218 = v215 * v217;
                double v219 = 0.0;
                if (v218 >= 1.95000005)
                {
                  objc_msgSend(a4, "localAspectRatio", 0.0);
                  double v221 = (float)(1.0 / v220) + v82 * -0.5;
                  [a4 localAspectRatio];
                  double v223 = v221 + (float)(-0.1 / v222);
                  [a4 localAspectRatio];
                  double v219 = v223 + (v82 + (float)(-1.8 / v224)) * v72;
                }

                double v78 = v219 + v219 - v219 * v309;
                goto LABEL_225;
              }
            }

            double v225 = 0.0;
            double v76 = v308;
            if (v94 >= 1.95000005) {
              double v225 = v80 * 0.5 + -1.0 + 0.100000001 - (v80 + -1.79999995) * v72;
            }
            double v81 = v225 + v225 - v225 * v309;
            double v78 = 0.107500002;
            double x = v81;
            double v302 = 0.107500002;
            goto LABEL_230;
          }
        }
      }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = *(void **)(&self->mIsLoaded + 1);
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v11) {
    return 0LL;
  }
  id v12 = v11;
  uint64_t v13 = 0LL;
  uint64_t v14 = *(void *)v21;
  do
  {
    for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v10);
      }
      float v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      if ((!v13
         || [v13 hasPrefix:@"image"]
         && [v16 hasPrefix:@"text"])
        && objc_msgSend( objc_msgSend(*(id *)(&self->mIsLoaded + 1), "objectForKey:", v16),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  x,  y))
      {
        if (v16)
        {
          if ([v16 hasPrefix:@"text"])
          {
            uint64_t v13 = v16;
          }

          else
          {
            objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v16),  "imageAspectRatio");
            if (v17 > 2.0 || v17 < 0.5) {
              uint64_t v13 = 0LL;
            }
            else {
              uint64_t v13 = v16;
            }
          }
        }

        else
        {
          uint64_t v13 = 0LL;
        }
      }
    }

    id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }

  while (v12);
  return v13;
}

- (BOOL)getVerticesCoordinates:(MREffectPhotoEdges *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  return objc_msgSend( objc_msgSend(*(id *)(&self->mIsLoaded + 1), "objectForKey:", a5),  "getVerticesCoordinates:withMatrix:",  a3,  a4);
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  uint64_t v7 = *(MRTextRenderer **)((char *)&self->mText0Renderer + 1);
  if (v7)
  {
    objc_msgSend(v7, "releaseByUser", a4, a5, a3);
    *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) = 0LL;
  }

  unsigned int v8 = (char *)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"aspect",  a5,  a3),  "integerValue");
  id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  id v10 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v9)
  {
    id v11 = v9;
    if (!v10) {
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v11 length]) {
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mSprites + 1) setText:v11];
    [*(id *)((char *)&self->mSprites + 1) setTruncate:1];
    [*(id *)((char *)&self->mSprites + 1) setMaxNumberOfLines:3];
    unsigned int v12 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title");
    double width = self->super.mPixelSize.width;
    if (v12)
    {
      double v14 = 0.4;
      if (v8 != (_BYTE *)&dword_0 + 1) {
        double v14 = 0.5;
      }
      double v15 = v14 * width;
      double height = self->super.mPixelSize.height * 0.25;
    }

    else
    {
      double v15 = width * 0.35;
      double height = self->super.mPixelSize.height;
    }

    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setDefinedSize:", v15, height);
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setScale:");
    double v17 = (CGContext *)[*(id *)((char *)&self->mSprites + 1) retainedContext];
    if (v17)
    {
      BOOL v18 = v17;
      double v19 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v17);
      *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) = v19;
      -[MRTextRenderer setLabel:](v19, "setLabel:", @"Marimba PhotoEdges Text");
      CGContextRelease(v18);
    }
  }

  else
  {
    if (v10)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
    }

    [*(id *)(&self->mIsLoaded + 1) removeObjectForKey:@"text0"];
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  v4 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title"))
  {
    double v5 = 0.4;
    if (v4 != (_BYTE *)&dword_0 + 1) {
      double v5 = 0.5;
    }
    double v6 = v5 * self->super.mPixelSize.width;
    double height = self->super.mPixelSize.height * 0.25;
  }

  else
  {
    -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle");
    double height = self->super.mPixelSize.height;
    double v6 = self->super.mPixelSize.width * 0.35;
  }

  result.double height = height;
  result.double width = v6;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_unload
{
  uint64_t v3 = 0LL;
  BYTE1(self->mBreakProvider[11]) = 0;
  v4 = (char *)&self->mFrameProvider + 1;
  do
  {
    [*(id *)&v4[v3] unload];

    *(void *)&v4[v3] = 0LL;
    v3 += 8LL;
  }

  while (v3 != 96);
  double v5 = *(MRTextRenderer **)((char *)&self->mText0Renderer + 1);
  if (v5)
  {
    [v5 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) = 0LL;
  }

  double v6 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v6)
  {
    [v6 cleanup];

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  }

  [*(id *)(&self->super._isInInteractiveMode + 1) unload];

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)(&self->mIsLoaded + 1) removeAllObjects];
}

@end