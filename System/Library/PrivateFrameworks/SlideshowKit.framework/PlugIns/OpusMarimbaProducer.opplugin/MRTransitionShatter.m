@interface MRTransitionShatter
+ (id)shatterDescriptions;
+ (void)initialize;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionShatter)initWithTransitionID:(id)a3;
- (void)_renderSublayer:(id)a3 layerCount:(int64_t)a4 sourceIsText:(BOOL)a5 targetIsText:(BOOL)a6 currentShader:(id)a7 sourceSize:(CGSize)a8 targetSize:(CGSize)a9 atTime:(double)a10 inContext:(id)a11 withArguments:(id)a12;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRTransitionShatter

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionShatter;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0620) {
    qword_2B0620 = -[NSDictionary initWithContentsOfFile:]( [NSDictionary alloc],  "initWithContentsOfFile:",  objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "resourcePathForStyleID:",  @"Shatter"),  "stringByAppendingPathComponent:",  @"MRTransitionShatter.plist"));
  }
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp float\t\tinMin, inMax; \n        uniform lowp float      count, range; \n\t\tconst lowp vec3\t\t\tlumCoeff = vec3(.299, .587, .114); \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tmediump float lum = dot(color.rgb, lumCoeff); \n            lowp float mask = floor(lum * count) * range; \n\t\t\tif ((mask < inMin) || (mask >= inMax)) \n\t\t\t\tdiscard; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"ShatterShader4");
}

+ (id)shatterDescriptions
{
  return (id)qword_2B0620;
}

- (void)setPixelSize:(CGSize)a3
{
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MRTransitionShatter;
    -[MRTransition setPixelSize:](&v15, "setPixelSize:");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    mMasks = self->mMasks;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(mMasks);
          }
          objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "setDefaultSize:",  p_mPixelSize->width,  p_mPixelSize->height);
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
      }

      while (v8);
    }
  }

- (MRTransitionShatter)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionShatter;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result) {
    result->mMasks = 0LL;
  }
  return result;
}

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mMasks = self->mMasks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v4) {
    return 1;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v11;
  unsigned __int8 v7 = 1;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(mMasks);
      }
      if ((v7 & 1) != 0) {
        unsigned __int8 v7 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) isLoaded];
      }
      else {
        unsigned __int8 v7 = 0;
      }
    }

    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  }

  while (v5);
  return v7;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!self->mMasks)
  {
    self->mMasks = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v9 = -4LL;
    do
    {
      __int128 v10 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      -[MRImageProvider setAssetPath:]( v10,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"Shatter",  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"text_mask_%d.png", v9 + 5)));
      -[MRImageProvider setOriginalImageSize:](v10, "setOriginalImageSize:", 1680.0, 1050.0);
      -[MRImageProvider setDefaultSize:]( v10,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      -[NSMutableArray addObject:](self->mMasks, "addObject:", v10);
    }

    while (!__CFADD__(v9++, 1LL));
  }

  if (!self->mIsLoaded)
  {
    id v12 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"layout");
    self->mLayout = (NSDictionary *)[(id)qword_2B0620 objectForKey:v12];
    self->mIsLoaded = 1;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MRTransitionShatter;
  BOOL v13 = -[MRTransition prerenderForTime:inContext:withArguments:]( &v24,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  mMasks = self->mMasks;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(mMasks);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) prerenderForTime:a4 inContext:a5 withArguments:a3];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v16);
  }

  return v13;
}

- (void)unload
{
  self->mIsLoaded = 0;

  self->mLayout = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  mMasks = self->mMasks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mMasks);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) cleanup];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMasks,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  self->mMasks = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRTransitionShatter;
  -[MRTransition unload](&v8, "unload");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  p_mSourceLayerImage = (id *)&self->super.mSourceLayerImage;
  mSourceLayerImage = self->super.mSourceLayerImage;
  if (!mSourceLayerImage)
  {
LABEL_5:
    mSourceLayer = self->super.mSourceLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
    id *p_mSourceLayerImage = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSourceLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
    goto LABEL_6;
  }

  -[MRImage sourceTimestamp](mSourceLayerImage, "sourceTimestamp");
  double v11 = v10;
  -[MRLayer timeStamp](self->super.mSourceLayer, "timeStamp");
  if (v11 != v12
    || ([*p_mSourceLayerImage renderTime], v30 >= 0.0)
    && ([*p_mSourceLayerImage renderTime],
        double v32 = v31,
        -[MRLayerClock externalTime](-[MRLayer clock](self->super.mSourceLayer, "clock"), "externalTime"),
        v32 != v33))
  {
    if (*p_mSourceLayerImage) {
      [*p_mSourceLayerImage releaseByUser];
    }
    goto LABEL_5;
  }

- (void)_renderSublayer:(id)a3 layerCount:(int64_t)a4 sourceIsText:(BOOL)a5 targetIsText:(BOOL)a6 currentShader:(id)a7 sourceSize:(CGSize)a8 targetSize:(CGSize)a9 atTime:(double)a10 inContext:(id)a11 withArguments:(id)a12
{
  double height = a9.height;
  double width = a9.width;
  double v16 = a8.height;
  double v17 = a8.width;
  BOOL v134 = a5;
  BOOL v135 = a6;
  v136 = self;
  id v125 = a3;
  __int128 v169 = 0u;
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  id v129 = [a3 objectForKey:@"animations"];
  id v137 = [v129 countByEnumeratingWithState:&v169 objects:v182 count:16];
  if (v137)
  {
    uint64_t v130 = *(void *)v170;
    double v128 = 0.0;
    double v126 = -1.0;
    double v127 = 1.29999995;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    id v132 = a7;
    id v133 = a11;
    int64_t v131 = a4;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v170 != v130) {
          objc_enumerationMutation(v129);
        }
        uint64_t v141 = v23;
        double v24 = *(void **)(*((void *)&v169 + 1) + 8 * v23);
        unint64_t v25 = (unint64_t)objc_msgSend(objc_msgSend(v24, "objectForKey:", @"keyframeCount"), "integerValue");
        v140 = &v125;
        unint64_t v26 = (8 * v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        id v142 = v24;
        v143 = (double *)((char *)&v125 - v26);
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        id v27 = [v24 objectForKey:@"keyTimes"];
        id v28 = [v27 countByEnumeratingWithState:&v165 objects:v181 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = 0LL;
          uint64_t v31 = *(void *)v166;
          do
          {
            double v32 = 0LL;
            double v33 = &v143[v30];
            do
            {
              if (*(void *)v166 != v31) {
                objc_enumerationMutation(v27);
              }
              [*(id *)(*((void *)&v165 + 1) + 8 * (void)v32) floatValue];
              v33[(void)v32] = v34;
              double v32 = (char *)v32 + 1;
            }

            while (v29 != v32);
            id v29 = [v27 countByEnumeratingWithState:&v165 objects:v181 count:16];
            v30 += (uint64_t)v32;
          }

          while (v29);
        }

        double v35 = (char *)&v125 - v26;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        id v36 = [v142 objectForKey:@"values"];
        id v37 = [v36 countByEnumeratingWithState:&v161 objects:v180 count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = 0LL;
          uint64_t v40 = *(void *)v162;
          do
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v162 != v40) {
                objc_enumerationMutation(v36);
              }
              [*(id *)(*((void *)&v161 + 1) + 8 * (void)i) floatValue];
              *(double *)&v35[8 * v39 + 8 * (void)i] = v42;
            }

            id v38 = [v36 countByEnumeratingWithState:&v161 objects:v180 count:16];
            v39 += (uint64_t)i;
          }

          while (v38);
        }

        v138 = v35;
        unint64_t v139 = v25;
        v146 = &v125 - 2 * (v25 >> 1);
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        id v144 = [v142 objectForKey:@"timingFunctions"];
        double v147 = COERCE_DOUBLE([v144 countByEnumeratingWithState:&v157 objects:v179 count:16]);
        if (v147 != 0.0)
        {
          uint64_t v43 = 0LL;
          uint64_t v145 = *(void *)v158;
          do
          {
            uint64_t v44 = 0LL;
            do
            {
              if (*(void *)v158 != v145) {
                objc_enumerationMutation(v144);
              }
              id v45 = *(void **)(*((void *)&v157 + 1) + 8 * v44);
              __int128 v153 = 0u;
              __int128 v154 = 0u;
              __int128 v155 = 0u;
              __int128 v156 = 0u;
              id v46 = [v45 countByEnumeratingWithState:&v153 objects:v178 count:16];
              if (v46)
              {
                id v47 = v46;
                uint64_t v48 = 0LL;
                uint64_t v49 = *(void *)v154;
                do
                {
                  for (j = 0LL; j != v47; j = (char *)j + 1)
                  {
                    if (*(void *)v154 != v49) {
                      objc_enumerationMutation(v45);
                    }
                    [*(id *)(*((void *)&v153 + 1) + 8 * (void)j) doubleValue];
                    v177[v48 + (void)j] = v51;
                  }

                  id v47 = [v45 countByEnumeratingWithState:&v153 objects:v178 count:16];
                  v48 += (uint64_t)j;
                }

                while (v47);
              }

              __int128 v52 =  -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v177);
              v146[v43++] = v52;
              ++v44;
            }

            while (v44 != *(void *)&v147);
            double v147 = COERCE_DOUBLE([v144 countByEnumeratingWithState:&v157 objects:v179 count:16]);
          }

          while (v147 != 0.0);
        }

        id v53 = [v142 objectForKey:@"key"];
        if ([v53 isEqualToString:@"yRotation"])
        {
          ValueFromBezierPath(v146, v143, 0.0, 1.0, a10, (uint64_t)v138, v139);
          double v22 = v54;
          a7 = v132;
          a11 = v133;
          a4 = v131;
        }

        else
        {
          unsigned int v55 = [v53 isEqualToString:@"xRotation"];
          a7 = v132;
          a11 = v133;
          a4 = v131;
          uint64_t v56 = v139;
          if (v55)
          {
            ValueFromBezierPath(v146, v143, 0.0, 1.0, a10, (uint64_t)v138, v139);
            double v21 = v57;
          }

          else if ([v53 isEqualToString:@"zRotation"])
          {
            ValueFromBezierPath(v146, v143, 0.0, 1.0, a10, (uint64_t)v138, v56);
            double v20 = v58;
          }

          else if ([v53 isEqualToString:@"translateZ"])
          {
            ValueFromBezierPath(v146, v143, 0.0, 1.0, a10, (uint64_t)v138, v56);
            double v128 = v59 * v127;
          }

          else if ([v53 isEqualToString:@"opacity"])
          {
            ValueFromBezierPath(v146, v143, 0.0, 1.0, a10, (uint64_t)v138, v56);
            double v126 = v60;
          }
        }

        uint64_t v23 = v141 + 1;
      }

      while ((id)(v141 + 1) != v137);
      id v137 = [v129 countByEnumeratingWithState:&v169 objects:v182 count:16];
    }

    while (v137);
  }

  else
  {
    double v128 = 0.0;
    double v126 = -1.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
  }

  id v61 = [v125 objectForKey:@"translateZ"];
  if (v61)
  {
    [v61 floatValue];
    double v128 = (float)(v62 * 1.3);
  }

  id v63 = [v125 objectForKey:@"yRotation"];
  if (v63)
  {
    [v63 floatValue];
    double v22 = v64;
  }

  id v65 = [v125 objectForKey:@"xRotation"];
  if (v65)
  {
    [v65 floatValue];
    double v21 = v66;
  }

  id v67 = [v125 objectForKey:@"zRotation"];
  if (v67)
  {
    [v67 floatValue];
    double v20 = v68;
  }

  id v69 = [v125 objectForKey:@"invScale"];
  if (v69)
  {
    [v69 floatValue];
    double v71 = (v128 + (float)(v70 * 1.3)) * -0.577350259 + 1.0;
  }

  else
  {
    double v71 = 1.0;
  }

  double v147 = v71;
  id v72 = v125;
  id v73 = [v125 objectForKey:@"scale"];
  if (v73)
  {
    [v73 floatValue];
    double v147 = v74;
  }

  if (objc_msgSend( objc_msgSend(v72, "objectForKey:", @"alignBottom", MRMatrix_Clear((uint64_t)v177)),  "BOOLValue"))
  {
    [a11 localAspectRatio];
    MRMatrix_Translate((float *)v177, 0.0, 1.0 / v75, 0.0);
    float v76 = v21;
    float v77 = v22;
    float v78 = v20;
    MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v176, v76, v77, v78);
    objc_msgSend(a11, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v177, v176));
    float v80 = -1.0;
LABEL_65:
    MRMatrix_Translate((float *)v177, 0.0, v80 / v79, 0.0);
    goto LABEL_67;
  }

  if (objc_msgSend(objc_msgSend(v72, "objectForKey:", @"alignTop"), "BOOLValue"))
  {
    [a11 localAspectRatio];
    MRMatrix_Translate((float *)v177, 0.0, -1.0 / v81, 0.0);
    float v82 = v21;
    float v83 = v22;
    float v84 = v20;
    MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v176, v82, v83, v84);
    objc_msgSend(a11, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v177, v176));
    float v80 = 1.0;
    goto LABEL_65;
  }

  float v85 = v21;
  float v86 = v22;
  float v87 = v20;
  MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v177, v85, v86, v87);
LABEL_67:
  float v88 = v128;
  MRMatrix_Translate((float *)v177, 0.0, 0.0, v88);
  v89.i32[1] = HIDWORD(v147);
  v89.f32[0] = v147;
  *(float *)&double v90 = MRMatrix_Scale(v177, v89, v89.f32[0], 1.0);
  objc_msgSend(a11, "composeModelViewMatrix:saveTo:", v177, v175, v90);
  double v91 = v126;
  if (v126 >= 0.0)
  {
    [a11 blend:3];
    *(float *)&double v92 = v91;
    LODWORD(v93) = 1.0;
    LODWORD(v94) = 1.0;
    LODWORD(v95) = 1.0;
    [a11 setForeColorRed:v174 green:v93 blue:v94 alpha:v95 saveTo:v92];
  }

  id v96 = v125;
  id v97 = [v125 objectForKey:@"layerIndex"];
  if (v97)
  {
    id v98 = [v97 integerValue];
    unsigned int v99 = objc_msgSend(objc_msgSend(v96, "objectForKey:", @"source"), "BOOLValue");
    v100 = &OBJC_IVAR___MRTransition_mTargetLayerImage;
    BOOL v101 = v135;
    if (v99)
    {
      BOOL v101 = v134;
      v100 = &OBJC_IVAR___MRTransition_mSourceLayerImage;
    }

    uint64_t v102 = *(uint64_t *)((char *)&v136->super.super.isa + *v100);
    if (v101)
    {
      if (([a7 isEqual:@"AlphaMaskPremultiplied"] & 1) == 0)
      {
        if (!a7) {
          [a11 unsetShader];
        }
        [a11 setShader:@"AlphaMaskPremultiplied"];
      }

      [a11 blend:2];
      else {
        id v103 = 0LL;
      }
      id v104 = objc_msgSend( -[NSMutableArray objectAtIndex:](v136->mMasks, "objectAtIndex:", v103),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  a12,  a10);
      [v104 setClampMode:2];
      [v104 setPreservesAspectRatio:0];
      LODWORD(v105) = 0;
      [v104 setOnContext:a11 onTextureUnit:1 withReferenceAspectRatio:&v152 state:v105];
      v106 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      v108 = v106;
      if (v99) {
        double v109 = v17;
      }
      else {
        double v109 = width;
      }
      if (v99) {
        double v110 = v16;
      }
      else {
        double v110 = height;
      }
      LODWORD(v107) = 0;
      -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v106,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v102,  a11,  CGPointZero.x,  CGPointZero.y,  v109,  v110,  v107);

      [v104 unsetOnContext:a11 onTextureUnit:1 state:&v152];
      [v104 releaseByUser];
      [a11 blend:0];
    }

    else
    {
      if ([a7 isEqual:@"ShatterShader4"])
      {
        float v112 = (float)a4;
      }

      else
      {
        if (!a7) {
          [a11 unsetShader];
        }
        [a11 setShader:@"ShatterShader4"];
        float v112 = (float)a4;
        *(float *)&double v113 = 1.0 / (float)a4;
        [a11 setShaderUniformFloat:@"range" forKey:v113];
        *(float *)&double v114 = (float)a4;
        [a11 setShaderUniformFloat:@"count" forKey:v114];
      }

      *(float *)&double v111 = (float)(uint64_t)v98 / v112;
      [a11 setShaderUniformFloat:@"inMin" forKey:v111];
      uint64_t v116 = 1LL;
      if (v98 == (id)(a4 - 1)) {
        uint64_t v116 = 2LL;
      }
      *(float *)&double v115 = (float)((uint64_t)v98 + v116) / v112;
      [a11 setShaderUniformFloat:@"inMax" forKey:v115];
      if (v99) {
        double v117 = v17;
      }
      else {
        double v117 = width;
      }
      if (v99) {
        double v118 = v16;
      }
      else {
        double v118 = height;
      }
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v102,  a11,  CGPointZero.x,  CGPointZero.y,  v117,  v118);
    }

    id v96 = v125;
  }

  id v119 = [v96 objectForKey:@"sublayers"];
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  id v120 = [v119 reverseObjectEnumerator];
  id v121 = [v120 countByEnumeratingWithState:&v148 objects:v173 count:16];
  if (v121)
  {
    id v122 = v121;
    uint64_t v123 = *(void *)v149;
    do
    {
      for (k = 0LL; k != v122; k = (char *)k + 1)
      {
        if (*(void *)v149 != v123) {
          objc_enumerationMutation(v120);
        }
        -[MRTransitionShatter _renderSublayer:layerCount:sourceIsText:targetIsText:currentShader:sourceSize:targetSize:atTime:inContext:withArguments:]( v136,  "_renderSublayer:layerCount:sourceIsText:targetIsText:currentShader:sourceSize:targetSize:atTime:inContext:withArguments:",  *(void *)(*((void *)&v148 + 1) + 8LL * (void)k),  a4,  v134,  v135,  a7,  a11,  v17,  v16,  width,  height,  a10,  a12);
      }

      id v122 = [v120 countByEnumeratingWithState:&v148 objects:v173 count:16];
    }

    while (v122);
  }

  if (v91 >= 0.0)
  {
    [a11 blend:0];
    [a11 restoreForeColor:v174];
  }

  [a11 restoreModelViewMatrix:v175];
}

@end