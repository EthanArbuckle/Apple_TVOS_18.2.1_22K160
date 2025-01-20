@interface MRTransitionShortMapZoom
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionShortMapZoom)initWithTransitionID:(id)a3;
- (void)_cleanup;
- (void)drawSortedPins:(id)a3 providers:(id)a4 attributes:(id)a5 offset:(CGPoint)a6 outro:(BOOL)a7 atTime:(double)a8 inContext:(id)a9 withArguments:(id)a10;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRTransitionShortMapZoom

- (MRTransitionShortMapZoom)initWithTransitionID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRTransitionShortMapZoom;
  v3 = -[MRTransition initWithTransitionID:](&v8, "initWithTransitionID:", a3);
  if (v3)
  {
    v3->mGradientProvider = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( v3->mGradientProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"shadow.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mGradientProvider,  "setImageSizeScript:",  @"layerWidth,layerHeight");
    -[MRImageProvider setOriginalImageSize:](v3->mGradientProvider, "setOriginalImageSize:", 3360.0, 2100.0);
    v4 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    v3->mPinProvider = v4;
    -[MRImageProvider setWantsMipmap:](v4, "setWantsMipmap:", 1LL);
    -[MRImageProvider setAssetPath:]( v3->mPinProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"pinShaftAndShadow.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mPinProvider,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.14,layerHeight * .14");
    -[MRImageProvider setOriginalImageSize:](v3->mPinProvider, "setOriginalImageSize:", 438.0, 390.0);
    v5 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    v3->mYellowPinProvider = v5;
    -[MRImageProvider setWantsMipmap:](v5, "setWantsMipmap:", 1LL);
    -[MRImageProvider setAssetPath:]( v3->mYellowPinProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"pinHead-Yellow.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mYellowPinProvider,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.14,layerHeight * .14");
    -[MRImageProvider setOriginalImageSize:](v3->mYellowPinProvider, "setOriginalImageSize:", 240.0, 240.0);
    v6 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    v3->mRedPinProvider = v6;
    -[MRImageProvider setWantsMipmap:](v6, "setWantsMipmap:", 1LL);
    -[MRImageProvider setAssetPath:]( v3->mRedPinProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"pinHead-Red.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mRedPinProvider,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.14,layerHeight * .14");
    -[MRImageProvider setOriginalImageSize:](v3->mRedPinProvider, "setOriginalImageSize:", 240.0, 240.0);
    v3->mBoxShadowSmall = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( v3->mBoxShadowSmall,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"smallShadow.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mBoxShadowSmall,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.2,layerHeight * .2");
    -[MRImageProvider setOriginalImageSize:](v3->mBoxShadowSmall, "setOriginalImageSize:", 800.0, 800.0);
  }

  return v3;
}

- (void)_cleanup
{
  self->mGradientProvider = 0LL;
  -[MRImageProvider cleanup](self->mPinProvider, "cleanup");

  self->mPinProvider = 0LL;
  -[MRImageProvider cleanup](self->mYellowPinProvider, "cleanup");

  self->mYellowPinProvider = 0LL;
  -[MRImageProvider cleanup](self->mRedPinProvider, "cleanup");

  self->mRedPinProvider = 0LL;
  -[MRImageProvider cleanup](self->mBoxShadowSmall, "cleanup");

  self->mBoxShadowSmall = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionShortMapZoom;
  -[MRTransition setPixelSize:](&v6, "setPixelSize:");
  -[MRImageProvider setDefaultSize:](self->mGradientProvider, "setDefaultSize:", width, height);
  -[MRImageProvider setDefaultSize:](self->mPinProvider, "setDefaultSize:", width, height);
  -[MRImageProvider setDefaultSize:](self->mYellowPinProvider, "setDefaultSize:", width, height);
  -[MRImageProvider setDefaultSize:](self->mRedPinProvider, "setDefaultSize:", width, height);
  -[MRImageProvider setDefaultSize:](self->mBoxShadowSmall, "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return -[MRImageProvider isLoaded](self->mGradientProvider, "isLoaded", a3);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRTransitionShortMapZoom;
  -[MRTransition prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mGradientProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mPinProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mYellowPinProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mRedPinProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mBoxShadowSmall,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  return 1;
}

- (void)setAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRTransitionShortMapZoom;
  -[MRTransition setAttributes:](&v11, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    objc_super v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"map0Point");
    v7 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"map1Point");
    objc_super v8 = (NSDictionary *)-[NSDictionary mutableCopy](self->super.mFlattenedAttributes, "mutableCopy");
    CGPoint v9 = CGPointFromString(v6);
    -[NSDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v9.x, v9.y),  @"map0Point");
    CGPoint v10 = CGPointFromString(v7);
    -[NSDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v10.x, v10.y),  @"map1Point");

    self->super.mFlattenedAttributes = v8;
  }

- (void)drawSortedPins:(id)a3 providers:(id)a4 attributes:(id)a5 offset:(CGPoint)a6 outro:(BOOL)a7 atTime:(double)a8 inContext:(id)a9 withArguments:(id)a10
{
  BOOL v11 = a7;
  id v14 = [a5 objectForKey:@"pinInformation"];
  if (v11) {
    id v15 = objc_msgSend(objc_msgSend(objc_msgSend(v14, "lastObject"), "objectForKey:", @"index"), "integerValue");
  }
  else {
    id v15 = 0LL;
  }
  [a9 setShader:@"PlainTexture2D"];
  -[MRImageProvider imageAspectRatio](self->mPinProvider, "imageAspectRatio");
  double v146 = v16 * 0.0500000007;
  [a9 localAspectRatio];
  double v18 = (float)(v17 * 0.05);
  [a9 localAspectRatio];
  BOOL v20 = v19 > 1.51;
  float v21 = 35.0;
  if (!v20) {
    float v21 = 28.0;
  }
  float v158 = v21;
  id v22 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mPinProvider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
  id v23 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mYellowPinProvider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
  id v156 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mRedPinProvider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
  [a9 blend:2];
  [a9 localAspectRatio];
  float v25 = v24;
  [a9 localAspectRatio];
  float v27 = v26;
  __int128 v164 = 0u;
  __int128 v165 = 0u;
  __int128 v166 = 0u;
  __int128 v167 = 0u;
  id v28 = [a3 countByEnumeratingWithState:&v164 objects:v173 count:16];
  if (v28)
  {
    id v29 = v28;
    id v143 = v23;
    BOOL v144 = v11;
    v148 = self;
    v30 = 0LL;
    double v31 = (float)(v27 * 0.038);
    double v155 = (float)(v25 * 0.022);
    uint64_t v32 = *(void *)v165;
    double v33 = v146 * -0.24 + v146 * 0.5;
    double v34 = v18 * 0.5;
    do
    {
      v35 = 0LL;
      v36 = v30;
      do
      {
        if (*(void *)v165 != v32) {
          objc_enumerationMutation(a3);
        }
        v30 = *(void **)(*((void *)&v164 + 1) + 8LL * (void)v35);
        objc_msgSend(objc_msgSend(v30, "objectForKey:", @"location"), "CGPointValue");
        CGFloat v39 = a6.y + v38 * 1.39999998;
        double v40 = v33 + a6.x + v37 * 1.39999998;
        [a9 localAspectRatio];
        CGFloat v42 = v39 + v34 / v41;
        objc_msgSend(a9, "localAspectRatio", MRMatrix_Clear((uint64_t)v172));
        float v44 = v34 / v43 - v42;
        MRMatrix_Translate(v172, 0.0, v44, 0.0);
        MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v171, 0.0, v158, 0.0);
        objc_msgSend(a9, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v172, v171));
        float v46 = v42 - v34 / v45;
        *(float *)&double v47 = MRMatrix_Translate(v172, 0.0, v46, 0.0);
        objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v172, v170, v47);
        [a9 localAspectRatio];
        double v49 = v42 * v48 + -0.0125000002;
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v22,  a9,  v40,  v49,  0.0379999988,  v31);
        if (objc_msgSend(objc_msgSend(v30, "objectForKey:", @"index"), "integerValue") != v15)
        {
          +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v156,  a9,  v40 + -0.0148199995,  v49 + v31 * 0.5,  0.0219999999,  v155);
          v30 = v36;
        }

        [a9 restoreModelViewMatrix:v170];
        v35 = (char *)v35 + 1;
        v36 = v30;
      }

      while (v29 != v35);
      id v29 = [a3 countByEnumeratingWithState:&v164 objects:v173 count:16];
    }

    while (v29);
    self = v148;
    BOOL v11 = v144;
    id v23 = v143;
    if (v30)
    {
      objc_msgSend(objc_msgSend(v30, "objectForKey:", @"location"), "CGPointValue");
      CGFloat v52 = a6.y + v51 * 1.39999998;
      double v53 = v33 + a6.x + v50 * 1.39999998;
      [a9 localAspectRatio];
      CGFloat v55 = v52 + v34 / v54;
      objc_msgSend(a9, "localAspectRatio", MRMatrix_Clear((uint64_t)v172));
      float v57 = v34 / v56 - v55;
      MRMatrix_Translate(v172, 0.0, v57, 0.0);
      MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v171, 0.0, v158, 0.0);
      objc_msgSend(a9, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v172, v171));
      float v59 = v55 - v34 / v58;
      *(float *)&double v60 = MRMatrix_Translate(v172, 0.0, v59, 0.0);
      objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v172, v170, v60);
      [a9 localAspectRatio];
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v143,  a9,  v53 + -0.0148199995,  v55 * v61 + -0.0125000002 + v31 * 0.5,  0.0219999999,  v155);
      [a9 restoreModelViewMatrix:v170];
    }
  }

  [a9 unsetShader];
  [a9 blend:0];
  [v23 releaseByUser];
  [v156 releaseByUser];
  [v22 releaseByUser];
  if (v11)
  {
    NSRange v62 = NSRangeFromString((NSString *)[a5 objectForKey:@"pinRange"]);
    id v63 = [a5 objectForKey:@"extraPinLocations"];
    id v149 = [a5 objectForKey:@"flippedBoxes"];
    id v153 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mBoxShadowSmall,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
    [a9 setShader:@"PlainTexture"];
    __int128 v162 = 0u;
    __int128 v163 = 0u;
    __int128 v160 = 0u;
    __int128 v161 = 0u;
    id v64 = [a3 countByEnumeratingWithState:&v160 objects:v169 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v161;
      double v145 = v18 * 0.5;
      double v147 = v146 * -0.24 + v146 * 0.5;
      double v141 = -0.0075;
      do
      {
        for (i = 0LL; i != v65; i = (char *)i + 1)
        {
          if (*(void *)v161 != v66) {
            objc_enumerationMutation(a3);
          }
          v68 = *(void **)(*((void *)&v160 + 1) + 8LL * (void)i);
          id v69 = objc_msgSend(objc_msgSend(v68, "objectForKey:", @"index", *(void *)&v141), "integerValue");
          NSUInteger v70 = (NSUInteger)v69 - v62.location;
          BOOL v72 = (unint64_t)v69 >= v62.location && v70 < v62.length;
          unsigned int v73 = [v63 containsIndex:v69];
          if (v72 || v73)
          {
            objc_msgSend(objc_msgSend(v68, "objectForKey:", @"location"), "CGPointValue");
            double v154 = v74;
            CGFloat v76 = a6.y + v75 * 1.39999998;
            [a9 localAspectRatio];
            double v78 = v76 + v145 / v77;
            objc_msgSend(a9, "localAspectRatio", MRMatrix_Clear((uint64_t)v172));
            float v80 = v145 / v79 - v78;
            MRMatrix_Translate(v172, 0.0, v80, 0.0);
            MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v171, 0.0, v158, 0.0);
            objc_msgSend(a9, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v172, v171));
            float v82 = v78 - v145 / v81;
            *(float *)&double v83 = MRMatrix_Translate(v172, 0.0, v82, 0.0);
            objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v172, v170, v83);
            [a9 localAspectRatio];
            float v85 = v84;
            if (v72) {
              v86 = (char *)(v70 + v62.length);
            }
            else {
              v86 = (char *)[v63 locationOfIndex:v69] + 2 * v62.length;
            }
            id v87 = [a4 objectForKey:ImageKey((int64_t)v86)];
            [v87 imageAspectRatio];
            double v89 = v88;
            [a9 localAspectRatio];
            double v91 = v90;
            double v92 = 2.0;
            if (v89 <= v91)
            {
              objc_msgSend(a9, "localAspectRatio", 2.0);
              double v92 = (v89 + v89) / v93;
            }

            double v94 = v78 * v85;
            double v95 = v92 / v89;
            double v96 = dbl_1F6AE0[v89 < 1.0];
            double v97 = v96 * v92;
            double v98 = v96 * v95;
            double v99 = v89 + (v89 + -1.0) * -0.0;
            if (v89 < 1.0) {
              double v100 = 1.0;
            }
            else {
              double v100 = v89 + (v89 + -1.0) * -0.0;
            }
            if (v89 < 1.0) {
              double v101 = 1.0;
            }
            else {
              double v101 = v89;
            }
            if (v89 < 1.0) {
              double v99 = v89 + (1.0 - v89) * 0.0;
            }
            double v102 = v97 * 0.0949999988 * 0.5;
            double v103 = v98 * 0.0949999988 * 0.5;
            double v104 = 1.0 / v89;
            BOOL v105 = v89 < 1.0;
            if (v89 >= 1.0) {
              double v104 = 1.0;
            }
            double v106 = v103 / v104;
            if (v89 < 1.0) {
              double v107 = 1.0 / v99;
            }
            else {
              double v107 = 1.0;
            }
            float v108 = v103 / v107;
            double v109 = v102 / v101 / 0.0949999988 - v102 / v101 / 0.0949999988 * 0.0 + 0.0;
            float v110 = v108 / v109;
            double v111 = v106 / v109;
            if (v105) {
              double v112 = 1.0;
            }
            else {
              double v112 = 1.0 / v99;
            }
            if (v105) {
              double v113 = v99;
            }
            else {
              double v113 = 1.0;
            }
            objc_msgSend(v87, "setSizeFactor:", v112, v113);
            unsigned int v114 = [v149 containsIndex:v69];
            double v115 = v110;
            [a9 localAspectRatio];
            float v117 = v116;
            if (v114)
            {
              double v142 = v100;
              [a9 localAspectRatio];
              double v119 = (float)(v118 * -0.05);
              [a9 localAspectRatio];
              double v121 = v120;
              if (v111 <= v115) {
                double v122 = v94 - v111 * v117;
              }
              else {
                double v122 = v94 - (float)(v117 * v110);
              }
              double v124 = v122 + v119 * 0.5 + v121 * v141;
              double v100 = v142;
            }

            else
            {
              if (v111 <= v115) {
                double v123 = v94 + v111 * v116;
              }
              else {
                double v123 = v94 + (float)(v116 * v110);
              }
              [a9 localAspectRatio];
              double v126 = v123 + (float)(v125 * 0.05) * 0.5;
              [a9 localAspectRatio];
              double v124 = v126 + v127 * 0.0075;
            }

            float v128 = v102 / v100;
            float v129 = v128 / v109;
            float v130 = v147 + a6.x + v154 * 1.39999998 + -0.0125000002;
            float v131 = v124;
            id v132 = [v87 retainedByUserRenderedImageAtTime:a9 inContext:a10 withArguments:a8];
            [a9 blend:2];
            double v133 = v129;
            [a9 localAspectRatio];
            double v135 = (v115 + v115) * v134;
            double v136 = v130;
            +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v153,  a9,  v136 + 0.0460000001,  v131 + 0.03,  v133 + v133 + 0.100000001,  v135 + 0.0700000003);
            [a9 unsetShader];
            [a9 setShader:@"RoundedCorners"];
            LODWORD(v137) = 10.0;
            LODWORD(v138) = 10.0;
            [a9 setShaderUniformVec2:@"invRadii" :v137 forKey:v138];
            double v139 = v129 * 0.1 / v115;
            *(float *)&double v140 = v139;
            LODWORD(v139) = 1036831949;
            [a9 setShaderUniformVec2:@"radius" :v139 forKey:v140];
            v168[0] = xmmword_1F6AF0;
            v168[1] = unk_1F6B00;
            [a9 setInSpriteCoordinatesPointer:v168];
            +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v132,  a9,  v136,  v131,  v133 + v133,  v135);
            [a9 unsetInSpriteCoordinatesPointer];
            [a9 unsetShader];
            [a9 setShader:@"PlainTexture"];
            [a9 blend:0];
            [v132 releaseByUser];
            [a9 restoreModelViewMatrix:v170];
          }
        }

        id v65 = [a3 countByEnumeratingWithState:&v160 objects:v169 count:16];
      }

      while (v65);
    }

    [a9 unsetShader];
    [v153 releaseByUser];
  }

- (void)unload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionShortMapZoom;
  -[MRTransition unload](&v3, "unload");
}

@end