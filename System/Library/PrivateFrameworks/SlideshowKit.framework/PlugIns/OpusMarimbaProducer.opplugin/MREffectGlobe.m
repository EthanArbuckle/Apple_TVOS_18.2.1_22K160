@interface MREffectGlobe
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectGlobe)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectGlobe

- (MREffectGlobe)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectGlobe;
  v4 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 185),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"map.jpg"));
    [*(id *)(v4 + 185) setImageSizeScript:@"layerHeight*1.3*3.14*.5*imageAspectRatio,layerHeight*1.3*3.14*.5"];
    objc_msgSend(*(id *)(v4 + 185), "setOriginalImageSize:", 8000.0, 4260.0);
    *(void *)(v4 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 193),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"marker.png"));
    [*(id *)(v4 + 193) setImageSizeScript:@"layerHeight*.2*imageAspectRatio,layerHeight*.2"];
    objc_msgSend(*(id *)(v4 + 193), "setOriginalImageSize:", 112.0, 176.0);
    *(void *)(v4 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 201),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"gradient.png"));
    [*(id *)(v4 + 201) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v4 + 201), "setOriginalImageSize:", 1400.0, 1070.0);
    *(void *)(v4 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 209),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"shading.png"));
    [*(id *)(v4 + 209) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v4 + 209), "setOriginalImageSize:", 1200.0, 1200.0);
    *(void *)(v4 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 217),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"starsLeft.jpg"));
    [*(id *)(v4 + 217) setImageSizeScript:@"layerHeight*imageAspectRatio,layerHeight"];
    objc_msgSend(*(id *)(v4 + 217), "setOriginalImageSize:", 3840.0, 2402.0);
    *(void *)(v4 + 225) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 225),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"starsRight.jpg"));
    [*(id *)(v4 + 225) setImageSizeScript:@"layerHeight*imageAspectRatio,layerHeight"];
    objc_msgSend(*(id *)(v4 + 225), "setOriginalImageSize:", 3840.0, 2402.0);
  }

  return (MREffectGlobe *)v4;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mMapProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mMapProvider + 1) = 0LL;
  [*(id *)((char *)&self->mMarkerProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mMarkerProvider + 1) = 0LL;
  [*(id *)((char *)&self->mGradientProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
  [*(id *)((char *)&self->mStarsLProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mStarsLProvider + 1) = 0LL;
  [*(id *)((char *)&self->mShadingProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mShadingProvider + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectGlobe;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mMapProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mStarsLProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mShadingProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mMarkerProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  if (objc_msgSend(*(id *)((char *)&self->mMapProvider + 1), "isLoaded", a3)
    && [*(id *)(&self->super._isInInteractiveMode + 1) isLoaded]
    && [*(id *)((char *)&self->mShadingProvider + 1) isLoaded]
    && [*(id *)((char *)&self->mStarsLProvider + 1) isLoaded]
    && [*(id *)((char *)&self->mMarkerProvider + 1) isLoaded])
  {
    return [*(id *)((char *)&self->mGradientProvider + 1) isLoaded];
  }

  else
  {
    return 0;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectGlobe;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mMapProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mShadingProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mStarsLProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mMarkerProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGradientProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)setAttributes:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MREffectGlobe;
  -[MREffect setAttributes:](&v28, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    id v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"locations");
    id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          CGPoint v12 = CGPointFromString((NSString *)*(void *)(*((void *)&v24 + 1) + 8LL * (void)i));
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          id v13 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v21;
LABEL_9:
            uint64_t v16 = 0LL;
            while (1)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v20 + 1) + 8 * v16) CGPointValue];
              *(float *)&double v17 = v17 - v12.x;
              *(float *)&double v18 = v18 - v12.y;
              if (v14 == (id)++v16)
              {
                id v14 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
          }

          else
          {
LABEL_15:
            objc_msgSend( v7,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v12.x, v12.y));
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }

      while (v9);
    }

    v19 = (NSDictionary *)-[NSDictionary mutableCopy](self->super.mFlattenedAttributes, "mutableCopy");
    -[NSDictionary setObject:forKey:](v19, "setObject:forKey:", v7, @"locations");

    self->super.mFlattenedAttributes = v19;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( *(id *)((char *)&self->mShadingProvider + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:");
  [v9 setClampMode:2];
  id v10 = [*(id *)((char *)&self->mStarsLProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v10 setClampMode:2];
  double v100 = a3;
  float v11 = a3;
  double v12 = fmodf(v11, 180.0) / 180.0;
  [a4 localAspectRatio];
  double v14 = (float)(2.0 / v13);
  [v9 width];
  double v16 = v15 + v15;
  [v9 height];
  double v18 = v16 / v17;
  double v98 = v12;
  double v19 = v16 / v17 * v14;
  double v20 = v19 * 0.5 + -1.0;
  double v21 = v20 - v19 * v12;
  else {
    __int128 v22 = @"PlainTexture";
  }
  [a4 setShader:v22];
  [*(id *)((char *)&self->mShadingProvider + 1) imageAspectRatio];
  double v24 = v23 + v23;
  [a4 localAspectRatio];
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v9,  a4,  v21 - v19 * 0.5 * 0.5,  0.0,  v24 / v25,  2.0);
  double v26 = v21 + v19 * 0.5 * 0.5;
  [*(id *)((char *)&self->mStarsLProvider + 1) imageAspectRatio];
  double v28 = v27 + v27;
  [a4 localAspectRatio];
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v10,  a4,  v26,  0.0,  v28 / v29,  2.0);
  if (v20 <= v19 * 0.5 + 1.0)
  {
    double v30 = v19 + v20 + -(v18 * v14) * v98;
    [*(id *)((char *)&self->mShadingProvider + 1) imageAspectRatio];
    double v32 = v31 + v31;
    [a4 localAspectRatio];
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v9,  a4,  v30 + -(v19 * 0.5) * 0.5,  0.0,  v32 / v33,  2.0);
    double v34 = v30 + v19 * 0.5 * 0.5;
    [*(id *)((char *)&self->mStarsLProvider + 1) imageAspectRatio];
    double v36 = v35 + v35;
    [a4 localAspectRatio];
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v10,  a4,  v34,  0.0,  v36 / v37,  2.0);
  }

  [v9 releaseByUser];
  [v10 releaseByUser];
  [a4 blend:2];
  [a4 localAspectRatio];
  double v39 = v38 / 1.77778;
  id v40 = [*(id *)((char *)&self->mMarkerProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v100];
  [a4 localAspectRatio];
  double y = CGPointZero.y;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v40,  a4,  CGPointZero.x,  y,  1.72 / v39,  v41 * 1.72 / v39);
  [v40 releaseByUser];
  [a4 unsetShader];
  [a4 blend:0];
  id v43 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"locations");
  float v44 = v100 + v100;
  float v45 = fmodf(v44, 360.0);
  double v46 = MRMatrix_Clear((uint64_t)v109);
  float v110 = 2.0;
  if (objc_msgSend(v43, "count", v46))
  {
    objc_msgSend(objc_msgSend(v43, "objectAtIndex:", 0), "CGPointValue");
    double v49 = 35.0;
    if (v48 <= 35.0)
    {
      double v49 = v48;
      if (v48 < -35.0) {
        double v49 = -35.0;
      }
    }

    double v50 = fabs(v49);
    double v51 = -16.0;
    if (v49 >= 0.0) {
      double v51 = 16.0;
    }
    double v52 = -24.0;
    if (v49 >= 0.0) {
      double v52 = 24.0;
    }
    if (24.0 - v50 > v50 + -16.0) {
      double v53 = v52;
    }
    else {
      double v53 = v51;
    }
    if (v50 < 24.0) {
      double v54 = v53;
    }
    else {
      double v54 = v49;
    }
    if (v50 > 16.0) {
      double v55 = v54;
    }
    else {
      double v55 = v49;
    }
    float v56 = v55;
    float v57 = -v56;
    float v58 = v45 - v47 + self->super.mMainDuration * -2.0;
    float v59 = v57;
  }

  else
  {
    float v59 = -20.0;
    float v58 = v45;
  }

  MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v108, v59, v58, 0.0);
  MRMatrix_PostMultiply((uint64_t)v109, v108);
  MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v108, 0.0, 180.0, 0.0);
  MRMatrix_PostMultiply((uint64_t)v109, v108);
  float v110 = v110 + -2.0;
  [a4 composeModelViewMatrix:v109 saveTo:v107];
  [a4 setShader:@"PositionalSpecularLighting"];
  LODWORD(v60) = 0;
  LODWORD(v61) = 0.5;
  LODWORD(v62) = 0.5;
  [a4 setShaderUniformVec3:@"lightPosition" :v60 :v61 forKey:v62];
  LODWORD(v63) = 1045220557;
  LODWORD(v64) = 1045220557;
  LODWORD(v65) = 1045220557;
  [a4 setShaderUniformVec3:@"ambientLightColor" :v63 :v64 forKey:v65];
  LODWORD(v66) = 1063675494;
  LODWORD(v67) = 1063675494;
  LODWORD(v68) = 1063675494;
  [a4 setShaderUniformVec3:@"diffuseLightColor" :v66 :v67 forKey:v68];
  LODWORD(v69) = 1036831949;
  LODWORD(v70) = 1036831949;
  LODWORD(v71) = 1036831949;
  [a4 setShaderUniformVec3:@"specularLightColor" :v69 :v70 forKey:v71];
  objc_msgSend(a4, "setShaderUniformMat4:forKey:", objc_msgSend(a4, "modelViewMatrix"), @"modelViewMatrix");
  id v72 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v100];
  [v72 setClampMode:2];
  v73 = objc_alloc_init(&OBJC_CLASS___MRSphere);
  double v74 = 1.25 / v39;
  float v75 = 1.25 / v39;
  *(float *)&double v74 = v75;
  -[MRSphere setRadius:](v73, "setRadius:", v74);
  -[MRSphere setLatitudeResolution:](v73, "setLatitudeResolution:", 100LL);
  -[MRSphere setLongitudeResolution:](v73, "setLongitudeResolution:", 100LL);
  v99 = v72;
  -[MRSphere renderDumbImage:inContext:atPosition:andSize:]( v73,  "renderDumbImage:inContext:atPosition:andSize:",  v72,  a4,  CGPointZero.x,  y,  2.0,  2.0);
  [a4 blend:2];
  v76 = self;
  id v77 = [*(id *)((char *)&self->mMapProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v100];
  LODWORD(v78) = 0;
  LODWORD(v79) = 0;
  LODWORD(v80) = 0;
  [a4 setShaderUniformVec3:@"specularLightColor" :v78 :v79 forKey:v80];
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id v81 = [v43 countByEnumeratingWithState:&v101 objects:v105 count:16];
  if (v81)
  {
    id v82 = v81;
    uint64_t v83 = *(void *)v102;
    char v84 = 1;
    do
    {
      for (i = 0LL; i != v82; i = (char *)i + 1)
      {
        if (*(void *)v102 != v83) {
          objc_enumerationMutation(v43);
        }
        [*(id *)(*((void *)&v101 + 1) + 8 * (void)i) CGPointValue];
        double v87 = v86;
        double v89 = v88;
        MRMatrix_Clear((uint64_t)v109);
        float v110 = 2.0;
        float v90 = v87 + -180.0;
        float v91 = 0.675 - v89;
        MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v108, v90, v91, 0.0);
        MRMatrix_PostMultiply((uint64_t)v109, v108);
        float v110 = v110 + -2.0;
        if ((v84 & 1) != 0)
        {
          v92 = v106;
        }

        else
        {
          [a4 restoreModelViewMatrix:v106];
          v92 = 0LL;
        }

        [a4 composeModelViewMatrix:v109 saveTo:v92];
        v93 = objc_alloc_init(&OBJC_CLASS___MRSphere);
        *(float *)&double v94 = 1.25 / v39;
        -[MRSphere setRadius:](v93, "setRadius:", v94);
        -[MRSphere setLatitudeResolution:](v73, "setLatitudeResolution:", 4LL);
        -[MRSphere setLongitudeResolution:](v93, "setLongitudeResolution:", 4LL);
        LODWORD(v95) = 1011666125;
        -[MRSphere setHalfLongitudeAngle:](v93, "setHalfLongitudeAngle:", v95);
        [*(id *)((char *)&v76->mMapProvider + 1) imageAspectRatio];
        double v97 = 0.0125 / v96;
        *(float *)&double v97 = v97;
        -[MRSphere setHalfLatitudeAngle:](v93, "setHalfLatitudeAngle:", v97);
        objc_msgSend(a4, "setShaderUniformMat4:forKey:", objc_msgSend(a4, "modelViewMatrix"), @"modelViewMatrix");
        -[MRSphere renderDumbImage:inContext:atPosition:andSize:]( v93,  "renderDumbImage:inContext:atPosition:andSize:",  v77,  a4,  0.0,  0.0,  2.0,  2.0);

        char v84 = 0;
      }

      id v82 = [v43 countByEnumeratingWithState:&v101 objects:v105 count:16];
      char v84 = 0;
    }

    while (v82);
  }

  [a4 unsetShader];
  [v77 releaseByUser];
  [a4 blend:0];

  [v99 releaseByUser];
  [a4 restoreModelViewMatrix:v107];
}

- (void)_unload
{
}

@end