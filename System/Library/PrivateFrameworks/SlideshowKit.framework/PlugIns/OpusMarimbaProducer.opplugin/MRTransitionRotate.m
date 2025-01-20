@interface MRTransitionRotate
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionRotate)initWithTransitionID:(id)a3;
- (void)_cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRTransitionRotate

- (MRTransitionRotate)initWithTransitionID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionRotate;
  v3 = -[MRTransition initWithTransitionID:](&v5, "initWithTransitionID:", a3);
  if (v3)
  {
    v3->mBoxShadowBig = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( v3->mBoxShadowBig,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"bigShadow.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mBoxShadowBig,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.2,layerHeight * .2");
    -[MRImageProvider setOriginalImageSize:](v3->mBoxShadowBig, "setOriginalImageSize:", 700.0, 718.0);
  }

  return v3;
}

- (void)_cleanup
{
  self->mBoxShadowBig = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionRotate;
  -[MRTransition setPixelSize:](&v6, "setPixelSize:");
  -[MRImageProvider setDefaultSize:](self->mBoxShadowBig, "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return -[MRImageProvider isLoaded](self->mBoxShadowBig, "isLoaded", a3);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRTransitionRotate;
  -[MRTransition prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mBoxShadowBig,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 <= 0.74000001)
  {
    double v10 = a3 * 1.13900006;
  }

  else
  {
    float v9 = (a3 + -0.5) * 3.14159274;
    double v10 = (sinf(v9) + 1.0) * 0.5;
  }

  -[MCPlugSerial transitionDuration]( -[MRLayer plugAsSerial](self->super.mSourceLayer, "plugAsSerial"),  "transitionDuration");
  double v12 = v11;
  double v13 = v11 * a3;
  id v14 = -[MRLayer patchworkAtTime:inContext:withArguments:]( self->super.mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  0.0);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v17 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mTargetLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  v16 - v13);
  id v18 = objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 0), "objectForKey:", @"rectangle");
  if (v18)
  {
    [v18 CGRectValue];
    double width = v19;
  }

  else
  {
    double width = CGRectZero.size.width;
  }

  id v21 = objc_msgSend(objc_msgSend(v17, "objectAtIndex:", 0), "objectForKey:", @"rectangle");
  if (v21)
  {
    [v21 CGRectValue];
    double v23 = v22;
  }

  else
  {
    double v23 = CGRectZero.size.width;
  }

  [v14 removeImages];
  [v17 removeImages];
  id v24 = -[MRLayer patchworkAtTime:inContext:withArguments:]( self->super.mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  v12 * 0.4389);
  v25 = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](v25, "clock"), "externalTime");
  id v27 = -[MRLayer patchworkAtTime:inContext:withArguments:]( v25,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  v26 - v13 + v12 * 0.4389);
  id v28 = objc_msgSend(objc_msgSend(v24, "objectAtIndex:", 0), "objectForKey:", @"rectangle");
  if (v28)
  {
    [v28 CGRectValue];
    double v30 = v29;
  }

  else
  {
    double v30 = CGRectZero.size.width;
  }

  id v31 = objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 0), "objectForKey:", @"rectangle");
  if (v31)
  {
    [v31 CGRectValue];
    double v33 = v32;
  }

  else
  {
    double v33 = CGRectZero.size.width;
  }

  [v24 removeImages];
  [v27 removeImages];
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  id v35 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
  id v36 = objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 0), "objectForKey:", @"rectangle");
  if (v36)
  {
    [v36 CGRectValue];
    double v38 = v37;
    double height = v39;
  }

  else
  {
    double v38 = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  [v35 removeImages];
  id v41 = objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 0), "objectForKey:", @"rects");
  if (width / v23 >= v23 / width) {
    double v42 = v23 / width;
  }
  else {
    double v42 = width / v23;
  }
  v43 = self->super.mSourceLayer;
  if (v43) {
    v44 = -[MRLayer renderingState](v43, "renderingState");
  }
  else {
    v44 = 0LL;
  }
  v45 = (float *)self->super.mTargetLayer;
  if (v45) {
    v45 = (float *)[v45 renderingState];
  }
  double v46 = 1.0 - (v10 * 2.0 + -1.0) * (v10 * 2.0 + -1.0);
  float v47 = v46 * (v33 * 0.5);
  if (v45) {
    v45[2] = v47;
  }
  float v48 = v30 * -0.5 * v46;
  if (v44) {
    v44[2] = v48;
  }
  else {
    float v47 = v48;
  }
  double v49 = fmin(v42 + -0.0500000007, 0.699999988);
  if (v10 >= 0.438899994)
  {
    double v81 = v49 + (1.0 - v10) * (1.0 - v49);
    double v82 = v81 + v81;
    if (v44)
    {
      float v83 = v82;
      float *v44 = v83;
      v44[1] = v83;
    }

    if (v45)
    {
      float v84 = v49 + v10 * (1.0 - v49) + v49 + v10 * (1.0 - v49);
      float *v45 = v84;
      v45[1] = v84;
    }

    float v85 = 1.0;
    if (v10 >= 0.9) {
      float v85 = (v10 + -0.9) / -0.1 + 1.0;
    }
    [a4 blend:3];
    LODWORD(v86) = 1.0;
    LODWORD(v87) = 1.0;
    LODWORD(v88) = 1.0;
    *(float *)&double v89 = v85;
    [a4 composeForeColorRed:v128 green:v86 blue:v87 alpha:v88 saveTo:v89];
    id v118 = a5;
    id v116 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mBoxShadowBig,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    float v90 = v47;
    if (v44) {
      float v90 = v44[2];
    }
    double v91 = v90;
    [a4 localAspectRatio];
    double v93 = (float)(v92 * -0.01) + (v82 - height * v81) * 0.5 + 0.0;
    v94 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v95) = 0;
    v96 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v94,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v91 + (v81 * (v38 + v38 * 0.425000012) - v38 * v81) * 0.5,  v93,  v81 * (v38 + v38 * 0.425000012),  v81 + v81,  v95,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    id v97 = [v41 countByEnumeratingWithState:&v119 objects:v127 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v120;
      do
      {
        for (i = 0LL; i != v98; i = (char *)i + 1)
        {
          if (*(void *)v120 != v99) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v119 + 1) + 8 * (void)i) CGRectValue];
          double v104 = v103;
          double v106 = v105;
          float v107 = v47;
          if (v44) {
            float v107 = v44[2];
          }
          double v108 = v81 * v102;
          double v109 = v81 * v101 + v107;
          v110 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
          LODWORD(v111) = 0;
          v112 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v110,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v109,  v108,  v81 * v104,  v81 * v106,  v111,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          -[MRTiledSprite subtractSprite:](v96, "subtractSprite:", v112);
        }

        id v98 = [v41 countByEnumeratingWithState:&v119 objects:v127 count:16];
      }

      while (v98);
    }

    -[MRTiledSprite renderDumbImage:inContext:](v96, "renderDumbImage:inContext:", v116, a4);

    [v116 releaseByUser];
    v77 = self;
    v113 = self->super.mSourceLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](v113, "clock"), "externalTime");
    id v79 = v118;
    -[MRLayer renderAtTime:inContext:withArguments:](v113, "renderAtTime:inContext:withArguments:", a4, v118);
    [a4 restoreForeColor:v128];
    [a4 blend:0];
    uint64_t v80 = 4LL;
  }

  else
  {
    double v50 = v49 + (1.0 - v10) * (1.0 - v49);
    if (v45)
    {
      float v51 = v49 + v10 * (1.0 - v49) + v49 + v10 * (1.0 - v49);
      float *v45 = v51;
      v45[1] = v51;
    }

    double v52 = v50 + v50;
    if (v44)
    {
      float v53 = v52;
      float *v44 = v53;
      v44[1] = v53;
    }

    [a4 blend:3];
    id v117 = a5;
    id v115 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mBoxShadowBig,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    float v54 = v47;
    if (v44) {
      float v54 = v44[2];
    }
    double v55 = v54;
    [a4 localAspectRatio];
    double v57 = v56 * -0.01 + (v52 - height * v50) * 0.5 + 0.0;
    v58 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v59) = 0;
    v60 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v58,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v55 + (v50 * (v38 + v38 * 0.425) - v38 * v50) * 0.5,  v57,  v50 * (v38 + v38 * 0.425),  v50 + v50,  v59,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    id v61 = [v41 countByEnumeratingWithState:&v123 objects:v129 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v124;
      do
      {
        for (j = 0LL; j != v62; j = (char *)j + 1)
        {
          if (*(void *)v124 != v63) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v123 + 1) + 8 * (void)j) CGRectValue];
          double v68 = v67;
          double v70 = v69;
          float v71 = v47;
          if (v44) {
            float v71 = v44[2];
          }
          double v72 = v50 * v66;
          double v73 = v50 * v65 + v71;
          v74 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
          LODWORD(v75) = 0;
          v76 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v74,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v73,  v72,  v50 * v68,  v50 * v70,  v75,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          -[MRTiledSprite subtractSprite:](v60, "subtractSprite:", v76);
        }

        id v62 = [v41 countByEnumeratingWithState:&v123 objects:v129 count:16];
      }

      while (v62);
    }

    -[MRTiledSprite renderDumbImage:inContext:](v60, "renderDumbImage:inContext:", v115, a4);

    [v115 releaseByUser];
    [a4 blend:0];
    v77 = self;
    v78 = self->super.mTargetLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](v78, "clock"), "externalTime");
    id v79 = v117;
    -[MRLayer renderAtTime:inContext:withArguments:](v78, "renderAtTime:inContext:withArguments:", a4, v117);
    uint64_t v80 = 3LL;
  }

  Class v114 = (&v77->super.super.isa)[v80];
  objc_msgSend(-[objc_class clock](v114, "clock"), "externalTime");
  -[objc_class renderAtTime:inContext:withArguments:](v114, "renderAtTime:inContext:withArguments:", a4, v79);
}

- (void)unload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionRotate;
  -[MRTransition unload](&v3, "unload");
}

@end