@interface MREffectHangingPicturesBackgroundLights
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectHangingPicturesBackgroundLights)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectHangingPicturesBackgroundLights

- (MREffectHangingPicturesBackgroundLights)initWithEffectID:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundLights;
  v3 = -[MREffect initWithEffectID:](&v9, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v5 = [v4 descriptionForEffectID:*((void *)v3 + 4)];
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    id v6 = objc_msgSend( objc_msgSend(v5, "objectForKey:", @"imageProviderInfo"),  "objectForKey:",  @"background");
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend(v4, "resourcePathForEffectID:andResource:", *((void *)v3 + 4), @"GrayBackground-iOS.jpg"));
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 1280.0, 800.0);
    objc_msgSend(*(id *)(v3 + 185), "setImageSizeScript:", objc_msgSend(v6, "objectForKey:", @"imageSizeScript"));
    [*(id *)(v3 + 185) setWantsMipmap:0];
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    id v7 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"imageProviderInfo"), "objectForKey:", @"bokeh");
    objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v7, "objectForKey:", @"imageName")));
    objc_msgSend(*(id *)(v3 + 193), "setImageSizeScript:", objc_msgSend(v7, "objectForKey:", @"imageSizeScript"));
    [*(id *)(v3 + 193) setWantsMipmap:0];
    objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 816.0, 864.0);
  }

  return (MREffectHangingPicturesBackgroundLights *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mBackgroundImageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBackgroundImageProvider + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundLights;
    -[MREffect setPixelSize:](&v7, "setPixelSize:", a3.width, a3.height);
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mBackgroundImageProvider + 1), "setDefaultSize:", width, height);
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundLights;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mBackgroundImageProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:");
  else {
    objc_super v10 = @"PlainTexture";
  }
  [a4 setShader:v10];
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v9,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
  [a4 unsetShader];
  [v9 releaseByUser];
  [a5 unalteredTime];
  double v12 = v11;
  [a4 blend:4];
  id v13 = [*(id *)((char *)&self->mBackgroundImageProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v13 setClampMode:2];
  LODWORD(v14) = 0;
  [v13 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v158 state:v14];
  [a4 setShader:@"PlainTexture"];
  v163[0] = xmmword_1F78B0;
  v163[1] = unk_1F78C0;
  v163[2] = xmmword_1F78D0;
  v163[3] = unk_1F78E0;
  [a4 setTextureCoordinatesPointer:v163 onTextureUnit:0];
  __int128 v162 = xmmword_1F78F0;
  float v15 = v12;
  float v16 = *(float *)[a4 foreColor] / 255.0;
  float v17 = fmodf(v15, 20.0);
  if (v17 > 10.0) {
    float v17 = 20.0 - v17;
  }
  float v18 = v17 / 10.0;
  double v19 = v18;
  if (v18 <= 0.5) {
    double v20 = (v19 + v19) * v19;
  }
  else {
    double v20 = (v19 + v19) * (2.0 - v18) + -1.0;
  }
  float v21 = v20;
  float v145 = v21;
  float v22 = (float)((float)(v21 * 0.005) + 0.0) * 125.663706;
  double v23 = sinf(v22);
  float v24 = v23 * 0.025 + -0.725;
  *(float *)&double v23 = v23 * 0.025 + 0.125;
  float v152 = *(float *)&v23;
  float v153 = v24;
  float v25 = fmodf(v15, 60.0);
  if (v25 > 30.0) {
    float v25 = 60.0 - v25;
  }
  float v26 = ((float)(v25 / 30.0) + -0.5) * 3.14159265;
  float v27 = (sinf(v26) + 1.0) * 0.5;
  float v28 = (float)((float)(v27 * 10.0) + 0.0) * 0.0698131701;
  __float2 v29 = __sincosf_stret(v28);
  float v30 = v29.__sinval * 90.0 + 45.0;
  float v151 = v30;
  float v31 = (v19 + -0.5) * 3.14159265;
  float v32 = (sinf(v31) + 1.0) * 0.5;
  float v127 = v32;
  double v33 = (float)((float)(v32 * 0.05) + 0.1) + 0.4;
  float v34 = fmodf(v15, 14.0);
  if (v34 > 7.0) {
    float v34 = 14.0 - v34;
  }
  float v35 = v34 / 7.0;
  double v36 = (float)(v34 / 7.0);
  float v37 = (v36 + -0.5) * 3.14159265;
  float v38 = (sinf(v37) + 1.0) * 0.5;
  float v39 = (float)(v38 + 0.0) * 6.28318531;
  __float2 v40 = __sincosf_stret(v39);
  double sinval = v40.__sinval;
  float v41 = v33 + v40.__sinval * 0.25;
  float v150 = v41;
  float v42 = fmodf(v15, 22.0);
  if (v42 > 11.0) {
    float v42 = 22.0 - v42;
  }
  float v43 = ((float)(v42 / 11.0) + -0.5) * 3.14159265;
  float v44 = (sinf(v43) + 1.0) * 0.5;
  float v45 = (float)((float)(v44 * 0.005) + 0.0) * 125.663706;
  double v46 = cosf(v45);
  float v47 = v46 * 0.025 + 0.875;
  float v149 = v47;
  *(float *)&double v46 = v46 * 0.025 + 0.225;
  float v148 = *(float *)&v46;
  *(float *)&double v46 = v29.__sinval * 90.0 + 35.0;
  float v147 = *(float *)&v46;
  double v48 = (v36 + v36) * (2.0 - v36) + -1.0;
  if (v35 <= 0.5) {
    double v48 = (v36 + v36) * v36;
  }
  float v49 = v48;
  float v50 = (float)(v49 + 0.0) * 6.28318531;
  double v126 = sinf(v50);
  float v51 = (float)((float)(v145 * 0.1) + 0.05) + 0.35 + v126 * 0.3;
  float v146 = v51;
  float v52 = fmodf(v15, 10.0);
  if (v52 > 5.0) {
    float v52 = 10.0 - v52;
  }
  float v53 = ((float)(v52 / 5.0) + -0.5) * 3.14159265;
  float v54 = (sinf(v53) + 1.0) * 0.5;
  float v55 = (float)(v54 + 0.0) * 6.28318531;
  __float2 v56 = __sincosf_stret(v55);
  float v57 = v56.__sinval * 0.25 + 0.5;
  float v144 = v57;
  float v58 = fmodf(v15, 28.0);
  if (v58 > 14.0) {
    float v58 = 28.0 - v58;
  }
  float v59 = v58 / 14.0;
  double v60 = v59;
  double v61 = (v60 + v60) * v60;
  double v62 = (v60 + v60) * (2.0 - v59) + -1.0;
  if (v59 <= 0.5) {
    double v63 = v61;
  }
  else {
    double v63 = v62;
  }
  float v64 = v63;
  double v65 = (float)((float)(v64 * 0.005) + 0.0);
  float v66 = v65 * 125.663706;
  double v67 = sinf(v66);
  float v68 = v67 * -0.025 + 0.775;
  float v143 = v68;
  float v69 = v65 * 62.8318531;
  __float2 v70 = __sincosf_stret(v69);
  float v71 = v70.__sinval * 0.05 + -0.13;
  float v142 = v71;
  float v72 = sinval * 0.25 + 0.46;
  float v141 = v72;
  float v73 = v70.__cosval * -0.05 + 0.81;
  float v74 = v70.__sinval * 0.05 + -0.05;
  float v139 = v74;
  float v140 = v73;
  float v75 = fmodf(v15, 18.0);
  if (v75 > 9.0) {
    float v75 = 18.0 - v75;
  }
  float v76 = ((float)(v75 / 9.0) + -0.5) * 3.14159265;
  float v77 = (sinf(v76) + 1.0) * 0.5;
  float v78 = (float)(v77 + 0.0) * 6.28318531;
  __float2 v79 = __sincosf_stret(v78);
  float v80 = v79.__cosval * 0.25 + 0.5;
  float v155 = v80;
  float v81 = v56.__sinval * 0.3 + 0.44;
  float v138 = v81;
  float v82 = sinval * 0.25 + 0.55;
  float v83 = v56.__cosval * 0.25 + 0.5;
  float v135 = v83;
  float v137 = v82;
  float v84 = v79.__sinval * 0.25 + 0.45;
  float v134 = v84;
  float v85 = v29.__sinval * 90.0 + 5.0;
  float v86 = v40.__cosval * 0.3 + 0.5;
  float v132 = v86;
  float v133 = v85;
  float v87 = v67 * 0.025 + 0.125;
  float v131 = v87;
  float v88 = v67 * 0.025 + -0.075;
  float v130 = v88;
  float v89 = v29.__cosval * 90.0 + 15.0;
  float v129 = v89;
  float v90 = v127;
  float v91 = (float)((float)(v127 * 0.15) + 0.1) + 0.4 + v56.__cosval * 0.15;
  float v128 = v91;
  float v154 = v12;
  float v92 = fmodf(v154, 24.0);
  if (v92 > 12.0) {
    float v92 = 24.0 - v92;
  }
  float v93 = v92 / 12.0;
  double v94 = v93;
  double v95 = (v94 + v94) * v94;
  double v96 = (v94 + v94) * (2.0 - v93) + -1.0;
  if (v93 <= 0.5) {
    double v97 = v95;
  }
  else {
    double v97 = v96;
  }
  float v98 = v97;
  float v99 = (float)((float)(v98 * 0.005) + 0.0) * 125.663706;
  uint64_t v100 = 0LL;
  double v101 = cosf(v99);
  float v103 = v101 * 0.025 + -0.425;
  float v157 = v103;
  float v104 = v101 * 0.025 + -0.075;
  float v156 = v104;
  double v106 = v126;
  double v107 = 0.55;
  double v108 = v126 * 0.23 + 0.55;
  float v109 = v108;
  do
  {
    if (((0xAF2uLL >> v100) & 1) != 0)
    {
      float v110 = flt_1F7820[v100];
      float v111 = flt_1F7854[v100];
      float v112 = 0.0;
      switch((int)v100)
      {
        case 0:
          float v90 = v109;
          break;
        case 1:
          float v110 = v157;
          float v112 = v29.__cosval * 90.0;
          float v111 = v156;
          float v105 = (float)((float)(v127 * 0.1) + 0.1) + 0.4 + v56.__sinval * 0.2;
          float v90 = v105;
          break;
        case 2:
          float v111 = v130;
          float v110 = v131;
          float v90 = v128;
          float v112 = v129;
          break;
        case 3:
          float v90 = v132;
          float v112 = v133;
          break;
        case 4:
          float v90 = v134;
          break;
        case 5:
          float v90 = v135;
          break;
        case 6:
          float v90 = v137;
          break;
        case 7:
          float v90 = v138;
          break;
        case 8:
          float v111 = v139;
          float v110 = v140;
          float v90 = v155;
          break;
        case 9:
          float v111 = v142;
          float v110 = v143;
          float v90 = v141;
          break;
        case 10:
          float v90 = v144;
          break;
        case 11:
          float v111 = v148;
          float v110 = v149;
          float v90 = v146;
          float v112 = v147;
          break;
        case 12:
          float v111 = v152;
          float v110 = v153;
          float v90 = v150;
          float v112 = v151;
          break;
        default:
          break;
      }

      v113 = (char *)&unk_1F7888 + 3 * v100;
      LOBYTE(v108) = *v113;
      *(float *)&double v108 = v16 * (float)LODWORD(v108);
      LOBYTE(v106) = v113[1];
      *(float *)&double v106 = v16 * (float)LODWORD(v106);
      LOBYTE(v107) = v113[2];
      *(float *)&double v107 = v16 * (float)LODWORD(v107);
      else {
        v114 = 0LL;
      }
      *(float *)&double v102 = v90;
      [a4 setForeColorRed:v114 green:v108 blue:v106 alpha:v107 saveTo:v102];
      MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v161, 0.0, 0.0, v112);
      *(float *)&double v115 = MRMatrix_Translate(v161, v110, v111, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v161, v160, v115);
      uint64_t v116 = 0LL;
      double v117 = flt_1F77EC[v100];
      double v118 = flt_1F77B8[v100];
      do
      {
        v119 = (const float *)&v163[v116];
        float32x4x2_t v164 = vld2q_f32(v119);
        __asm { FMOV            V6.2D, #-0.5 }

        v165.val[0] = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64(vmulq_n_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v164.val[0].f32), _Q6), v118)),  vmulq_n_f64(vaddq_f64(vcvt_hight_f64_f32(v164.val[0]), _Q6), v118));
        v165.val[1] = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64(vmulq_n_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v164.val[1].f32), _Q6), v117)),  vmulq_n_f64(vaddq_f64(vcvt_hight_f64_f32(v164.val[1]), _Q6), v117));
        v125 = (float *)&v159[v116 * 16];
        vst2q_f32(v125, v165);
        v116 += 2LL;
      }

      while (v116 != 4);
      [a4 setVertex2DPointer:v159];
      [a4 drawTriangleStripFromOffset:0 count:8];
      [a4 unsetVertexPointer];
      [a4 restoreModelViewMatrix:v160];
    }

    ++v100;
  }

  while (v100 != 13);
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a4 unsetShader];
  [v13 unsetOnContext:a4 onTextureUnit:0 state:&v158];
  [v13 releaseByUser];
  [a4 restoreForeColor:&v162];
  [a4 blend:0];
}

- (void)_unload
{
}

@end