@interface MRTransitionPageFlip
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)unload;
@end

@implementation MRTransitionPageFlip

- (void)cleanup
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionPageFlip;
  -[MRTransition cleanup](&v3, "cleanup");
}

- (void)unload
{
  self->_mesh = 0LL;
  meshVertices = self->_meshVertices;
  if (meshVertices)
  {
    free(meshVertices);
    self->_meshVertices = 0LL;
  }

  self->_isCanceling = 0;
  self->_isFinishing = 0;
  self->_isManuallyTransitioning = 0;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionPageFlip;
  -[MRTransition unload](&v4, "unload");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRTransitionPageFlip;
  BOOL result = -[MRTransition prerenderForTime:inContext:withArguments:]( &v7,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  if (!self->_mesh) {
    return 1;
  }
  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!self->_mesh)
  {
    self->_mesh = -[MRMesh initWithContext:andCountOfVertices:]( objc_alloc(&OBJC_CLASS___MRMesh),  "initWithContext:andCountOfVertices:",  a4,  2048LL);
    self->_meshVertices = ($9A3F6720D51884C1BD061C340F5007EE *)calloc(0x18uLL, 0x800uLL);
    -[MRMesh bind](self->_mesh, "bind");
    v9 = (char *)calloc(8uLL, 0x800uLL);
    unsigned int v10 = 0;
    float64x2_t v11 = (float64x2_t)vdupq_n_s64(0x404F800000000000uLL);
    __asm { FMOV            V4.2D, #-1.0 }

    v17.i64[0] = 0x400000004LL;
    v17.i64[1] = 0x400000004LL;
    v18 = v9;
    do
    {
      uint64_t v19 = 0LL;
      double v20 = ((float)v10 + (float)v10) / 31.0 + -1.0;
      *(float *)&double v20 = v20;
      int32x4_t v21 = vdupq_lane_s32(*(int32x2_t *)&v20, 0);
      int32x4_t v22 = (int32x4_t)xmmword_1F6D30;
      do
      {
        float32x4_t v23 = vcvtq_f32_u32((uint32x4_t)v22);
        float64x2_t v24 = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
        float64x2_t v25 = vcvt_hight_f64_f32(v23);
        float32x4_t v26 = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64(vaddq_f64(vdivq_f64(vaddq_f64(v24, v24), v11), _Q4)),  vaddq_f64(vdivq_f64(vaddq_f64(v25, v25), v11), _Q4));
        v27 = (float *)&v18[v19];
        vst2q_f32(v27, *(float32x4x2_t *)(&v21 - 1));
        int32x4_t v22 = vaddq_s32(v22, v17);
        v19 += 32LL;
      }

      while (v19 != 512);
      ++v10;
      v18 += 512;
    }

    while (v10 != 32);
    -[MRMesh setStaticVBOVertexTexturePointer:]( self->_mesh,  "setStaticVBOVertexTexturePointer:",  v9,  31.0,  -1.0,  COERCE_DOUBLE(0x100000000LL));
    -[MRMesh makeRectangularIndexedTriangleStripWithWidth:andHeight:]( self->_mesh,  "makeRectangularIndexedTriangleStripWithWidth:andHeight:",  64LL,  32LL);
    -[MRMesh unbind](self->_mesh, "unbind");
  }

  [a4 localAspectRatio];
  float v29 = v28;
  if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction")) {
    v30 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction"),  "unsignedIntegerValue");
  }
  else {
    v30 = (_BYTE *)(&dword_0 + 1);
  }
  else {
    v31 = v30 - 2;
  }
  float v102 = 1.0 / v29;
  id v101 = a4;
  id v100 = a5;
  if (self->_isManuallyTransitioning || self->_isFinishing || self->_isCanceling)
  {
    double rollOrientation = self->_rollOrientation;
    double v33 = (self->_rollOrientationAim - rollOrientation) * 0.25;
    double v34 = -0.1;
    double v35 = -0.1;
    if (v33 >= -0.1)
    {
      double v35 = (self->_rollOrientationAim - rollOrientation) * 0.25;
      if (v33 > 0.1) {
        double v35 = 0.1;
      }
    }

    self->_double rollOrientation = rollOrientation + v35;
    float v36 = (a3 + -1.0) * 3.14159274 * 0.5;
    double v37 = (sinf(v36) + a3 + 1.0) * 0.5;
    self->_progressAim = v37;
    double progressInternal = self->_progressInternal;
    double v39 = (v37 - progressInternal) * 0.25;
    if (v39 >= -0.1)
    {
      double v34 = v39;
      if (v39 > 0.1) {
        double v34 = 0.1;
      }
    }

    self->_double progressInternal = progressInternal + v34;
    double v40 = self->_rollOrientation;
  }

  else
  {
    float v98 = (a3 + -1.0) * 3.14159274 * 0.5;
    double v99 = (sinf(v98) + a3 + 1.0) * 0.5;
    self->_double progressInternal = v99;
    double v40 = (1.0 - v99) * 0.785398185;
    self->_double rollOrientation = v40;
    if ((unint64_t)v30 >= 2)
    {
      double v40 = -v40;
      self->_double rollOrientation = v40;
    }
  }

  double v41 = self->_progressInternal;
  float v42 = fmax(v41 * -0.200000003 * 2.0 + 0.5, 0.200000003);
  double v43 = v41 * 6.28318548;
  if (v41 * 6.28318548 > 3.14159274) {
    double v43 = 3.14159274;
  }
  float v44 = v43;
  float v45 = sqrt((float)((float)(v102 * v102) + 1.0)) * 0.9;
  float v46 = (v41 * -2.0 + 0.899999976) * v45;
  float v47 = v40;
  __float2 v48 = __sincosf_stret(v47);
  __float2 v49 = __sincosf_stret(v44);
  uint64_t v50 = 0LL;
  unsigned int v51 = 0;
  float v52 = v44 * v42;
  float v104 = 1.0 / v42;
  float v105 = (float)(1.0 - v49.__cosval) * v42;
  float v106 = v42;
  float v103 = v49.__sinval * v42;
  meshVertices = self->_meshVertices;
  float v54 = -1.0;
  v55 = meshVertices;
  do
  {
    uint64_t v56 = 0LL;
    float v57 = v102 * (float)((float)((float)((float)v51 + (float)v51) / 31.0) + v54);
    uint64_t v58 = v50;
    uint64_t v59 = v50;
    do
    {
      float v60 = (float)((float)((float)v56 + (float)v56) / 63.0) + v54;
      float v61 = (float)((float)(v48.__sinval * v57) + (float)(v60 * v48.__cosval)) - v46;
      if (v61 >= 0.0)
      {
        if (v61 >= v52)
        {
          float v70 = v61 - v52;
          float v68 = v105 + (float)(v70 * v49.__sinval);
          float v69 = v103 + (float)(v70 * v49.__cosval);
          float sinval = v49.__sinval;
          float cosval = v49.__cosval;
        }

        else
        {
          __double2 v65 = __sincos_stret((float)(v104 * v61));
          float v54 = -1.0;
          float cosval = v65.__cosval;
          float sinval = v65.__sinval;
          float v68 = (float)(1.0 - cosval) * v106;
          float v69 = v106 * sinval;
        }

        float v71 = (float)(v48.__cosval * v57) - (float)(v60 * v48.__sinval);
        float v72 = v69 + v46;
        float v73 = (float)(v72 * v48.__cosval) - (float)(v71 * v48.__sinval);
        float v74 = (float)(v48.__cosval * v71) + (float)(v72 * v48.__sinval);
        float v63 = -cosval;
        if (v31)
        {
          v75 = (float *)((char *)&meshVertices->var0 + v59);
          float *v75 = v73;
          v75[1] = v74;
          v75[2] = v68;
          v75[3] = -(float)(sinval * v48.__cosval);
          v75[4] = -(float)(sinval * v48.__sinval);
          uint64_t v64 = v56;
        }

        else
        {
          uint64_t v64 = 63 - v56;
          v77 = (float *)((char *)&meshVertices->var0 + v58);
          v77[378] = -v73;
          v77[379] = v74;
          v77[380] = v68;
          v77[381] = -(float)(sinval * v48.__cosval);
          v77[382] = -(float)(sinval * v48.__sinval);
        }
      }

      else if (v31)
      {
        v62 = (float *)((char *)&meshVertices->var0 + v59);
        float *v62 = v60;
        v62[1] = v57;
        *((void *)v62 + 1) = 0LL;
        float v63 = 1.0;
        uint64_t v64 = v56;
        v62[4] = 0.0;
      }

      else
      {
        uint64_t v64 = 63 - v56;
        v76 = (float *)((char *)&meshVertices->var0 + v58);
        v76[378] = -v60;
        v76[379] = v57;
        *((void *)v76 + 190) = 0x3F80000000000000LL;
        v76[382] = 0.0;
        float v63 = 1.0;
      }

      v55[v64].var5 = v63;
      ++v56;
      v59 += 24LL;
      v58 -= 24LL;
    }

    while (v56 != 64);
    ++v51;
    v55 += 64;
    v50 += 1536LL;
  }

  while (v51 != 32);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  -[MRLayer renderAtTime:inContext:withArguments:](mTargetLayer, "renderAtTime:inContext:withArguments:", v101, v100);
  mSourceLayer = self->super.mSourceLayer;
  if (mSourceLayer)
  {
    v80 = -[MRLayer renderingState](mSourceLayer, "renderingState");
    if (v80)
    {
      v81 = v80;
      v80->var19 = 1;
      v82 = self->super.mSourceLayer;
      -[MRLayerClock externalTime](-[MRLayer clock](v82, "clock"), "externalTime");
      id v83 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( v82,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  v101,  v100);
      v81->var19 = 0;
      if (v83)
      {
        v85 = v83;
        *(float *)&double v84 = v29;
        [v83 setOnContext:v101 onTextureUnit:0 withReferenceAspectRatio:v107 state:v84];
        -[MRMesh bind](self->_mesh, "bind");
        -[MRMesh setStreamVBOVertex3DNormalPointer:]( self->_mesh,  "setStreamVBOVertex3DNormalPointer:",  self->_meshVertices);
        [v101 setShader:@"PlainTexture"];
        [v101 cull:2];
        -[MRMesh draw](self->_mesh, "draw");
        [v101 unsetShader];
        [v101 setShader:@"DirectionalSpecularLighting"];
        LODWORD(v86) = 1036831949;
        LODWORD(v87) = 1036831949;
        LODWORD(v88) = 1036831949;
        [v101 setShaderUniformVec3:@"ambientLightColor" :v86 :v87 forKey:v88];
        LODWORD(v89) = 1060320051;
        LODWORD(v90) = 1060320051;
        LODWORD(v91) = 1060320051;
        [v101 setShaderUniformVec3:@"diffuseLightColor" :v89 :v90 forKey:v91];
        LODWORD(v92) = 1041865114;
        LODWORD(v93) = 1041865114;
        LODWORD(v94) = 1041865114;
        [v101 setShaderUniformVec3:@"specularLightColor" :v92 :v93 forKey:v94];
        LODWORD(v95) = -1085485875;
        LODWORD(v96) = 0.5;
        LODWORD(v97) = 1.0;
        [v101 setShaderUniformVec3:@"lightDirection" :v95 :v96 forKey:v97];
        [v101 cull:1];
        -[MRMesh draw](self->_mesh, "draw");
        -[MRMesh unbind](self->_mesh, "unbind");
        [v85 unsetOnContext:v101 onTextureUnit:0 state:v107];
        [v85 releaseByUser];
        [v101 unsetShader];
      }
    }
  }

  [v101 cull:0];
}

- (double)pzrStart:(id)a3
{
  self->_isManuallyTransitioning = 1;
  self->_isCanceling = 0;
  self->_isFinishing = 0;
  double v5 = *((double *)a3 + 8);
  double v6 = *((double *)a3 + 9);
  if (v5 <= 0.0)
  {
    double v6 = -v6;
    double v7 = -v5;
  }

  else
  {
    double v7 = 2.0 - v5;
  }

  self->_rollOrientationAim = atan2(v6, v7);
  if (self->super._progress == 0.0)
  {
    double v8 = 0.0;
    self->_double progressInternal = v8;
    self->_double rollOrientation = self->_rollOrientationAim;
  }

  double v9 = *((double *)a3 + 2);
  self->_x = v9;
  self->_x0 = v9;
  double v10 = *((double *)a3 + 3);
  self->_y = v10;
  self->_y0 = v10;
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  double v5 = *((double *)a3 + 8);
  double v6 = *((double *)a3 + 9);
  double v7 = v6 * v6 + v5 * v5;
  if (v7 > 0.05)
  {
    if (v5 <= 0.0)
    {
      double v6 = -v6;
      double v8 = -v5;
    }

    else
    {
      double v8 = 2.0 - v5;
    }

    double v9 = self->_rollOrientationAim + (atan2(v6, v8) - self->_rollOrientationAim) * fmin(v7 * 0.1, 1.0);
    self->_rollOrientationAim = v9;
    double v10 = 0.785398163;
    if (v9 > 0.785398163 || (double v10 = -0.785398163, v9 < -0.785398163)) {
      self->_rollOrientationAim = v10;
    }
  }

  self->_x = *((double *)a3 + 2);
  self->_y = *((double *)a3 + 3);
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  self->_isManuallyTransitioning = 0;
  self->_isFinishing = 1;
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  self->_isManuallyTransitioning = 0;
  self->_isCanceling = 1;
  return 0.0;
}

@end