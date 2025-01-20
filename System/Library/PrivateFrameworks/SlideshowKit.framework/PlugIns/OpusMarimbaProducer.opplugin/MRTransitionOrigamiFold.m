@interface MRTransitionOrigamiFold
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (MRTransitionOrigamiFold)initWithTransitionID:(id)a3;
- (void)_cleanupSwingTimings;
- (void)_setupSwingTimings;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionOrigamiFold

- (MRTransitionOrigamiFold)initWithTransitionID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFold;
  v3 = -[MRTransition initWithTransitionID:](&v6, "initWithTransitionID:", a3);
  v4 = v3;
  if (v3) {
    -[MRTransitionOrigamiFold _setupSwingTimings](v3, "_setupSwingTimings");
  }
  return v4;
}

- (void)cleanup
{
  if (self->super.mDescription)
  {
    -[MRTransitionOrigamiFold _cleanupSwingTimings](self, "_cleanupSwingTimings");
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFold;
    -[MRTransition cleanup](&v3, "cleanup");
  }

- (void)_setupSwingTimings
{
  self->mBigSwing = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  1LL);
  self->mSideSwing = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  2LL);
}

- (void)_cleanupSwingTimings
{
  self->mBigSwing = 0LL;

  self->mSideSwing = 0LL;
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFold;
  -[MRTransition setAttributes:](&v4, "setAttributes:", a3);
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFold;
  return -[MRTransition prerenderForTime:inContext:withArguments:]( &v6,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = 1.0 / v9;
  uint64_t v11 = self->super._direction - 1LL;
  else {
    LOBYTE(v12) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
  }
  unsigned int v13 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numberOfFoldings"),  "unsignedCharValue");
  if ((v12 & 1) != 0) {
    float v15 = 1.0;
  }
  else {
    float v15 = v10;
  }
  unsigned int v16 = (v13 + 1);
  float v17 = a3;
  float v18 = v17 * (float)v16;
  signed int v19 = vcvtms_s32_f32(v18);
  signed int v20 = v13 - 1;
  else {
    unsigned __int8 v21 = v19;
  }
  LODWORD(v69) = v21;
  float v22 = v18 - (float)v21;
  if (v20 <= v19)
  {
    v26 = &OBJC_IVAR___MRTransitionOrigamiFold_mSideSwing;
    int v23 = v12 & 1;
    if ((v12 & 1) == 0) {
      v26 = &OBJC_IVAR___MRTransitionOrigamiFold_mBigSwing;
    }
    v27 = *(Class *)((char *)&self->super.super.isa + *v26);
    float v28 = v22 * 0.5;
    *(float *)&double v14 = v22 * 0.5;
    objc_msgSend(v27, "valueAtTime:", v14, v69);
    float v25 = 3.1416 - v29;
    [v27 timeFirstAtRestValue];
    BOOL v24 = v28 >= *(float *)&v14;
  }

  else
  {
    int v23 = v12 & 1;
    BOOL v24 = 0;
  }

  HIDWORD(v69) = v12 & 0xFE;
  *(float *)&double v14 = (float)(v15 + v15) / (float)v16;
  float32x2_t v71 = *(float32x2_t *)&v14;
  __float2 v31 = __sincosf_stret(v25);
  float sinval = v31.__sinval;
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  id v70 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v34 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mTargetLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
  if (!v24)
  {
    float v36 = -v15;
    float v37 = (float)(int)(~(_DWORD)v69 + v16);
    float v38 = -(float)(v15 - (float)(v71.f32[0] * v37));
    float v39 = v15 - (float)(v71.f32[0] * v37);
    if (HIDWORD(v69))
    {
      float v40 = v38;
    }

    else
    {
      float v36 = v39;
      float v40 = v15;
    }

    LOWORD(v75) = 2;
    BYTE2(v75) = v23;
    *((float *)&v75 + 1) = v36;
    *((void *)&v75 + 1) = LODWORD(v36);
    LOBYTE(v76) = 0;
    *((float *)&v76 + 1) = v40;
    *((void *)&v76 + 1) = LODWORD(v40);
    LOBYTE(v77) = 0;
    RenderPatchworkWithMesh(v70, (unsigned __int16 *)&v75, a4);
  }

  if (v20 <= v19)
  {
    int v42 = v23;
    if (v23) {
      uint64_t v43 = 1LL;
    }
    else {
      uint64_t v43 = 2LL;
    }
    objc_msgSend(a4, "cull:", v43, v69);
    unsigned int v41 = 3;
  }

  else
  {
    unsigned int v41 = 2;
    int v42 = v23;
  }

  BOOL v44 = v24;
  LOWORD(v75) = v41;
  BYTE2(v75) = v42;
  if (!HIDWORD(v69))
  {
    *((float *)&v75 + 1) = -v15;
    *((float *)&v75 + 2) = -v15;
    HIDWORD(v75) = 0;
    LOBYTE(v76) = 0;
    int v46 = v69;
    *((float *)&v76 + 1) = -(float)(v15 - (float)(v71.f32[0] * (float)(v69 + 1)));
    *((float *)&v76 + 2) = *((float *)&v76 + 1);
    HIDWORD(v76) = 0;
    LOBYTE(v77) = 0;
    *((float *)&v77 + 1) = v71.f32[0] - (float)(v15 - (float)(v71.f32[0] * (float)(v69 + 1)));
    *((float *)&v77 + 2) = (float)(v71.f32[0] * v31.__cosval) - (float)(v15 - (float)(v71.f32[0] * (float)(v69 + 1)));
    *((float *)&v77 + 3) = v71.f32[0] * v31.__sinval;
    v50 = v78;
    goto LABEL_32;
  }

  *((float *)&v75 + 4 * ((v41 - 1) & 3) + 1) = v15;
  char v45 = v41;
  int v46 = v69;
  *(float *)v35.i32 = (float)(v69 + 1);
  v47 = (float *)&v75 + 4 * v41 + 1;
  *(v47 - 3) = v15;
  *(v47 - 2) = 0.0;
  *(float32x2_t *)((char *)&v75 + 16 * v41 - 28) = vmls_lane_f32( *(float32x2_t *)((char *)&v75 + 16 * v41 - 12),  (float32x2_t)vdup_lane_s32(v35, 0),  v71,  0);
  *((_BYTE *)v47 - 4) = 0;
  v48 = (char *)&v75 + 16 * v41 - 28;
  *((_DWORD *)v48 + 2) = 0;
  v48[12] = 0;
  if (v20 <= v19)
  {
    float v49 = *((float *)v48 + 1);
    *((float *)&v75 + 1) = *((float *)&v75 + 4 * (v45 & 1) + 1) - v71.f32[0];
    *((float *)&v75 + 2) = v49 + (float)((float)-v71.f32[0] * v31.__cosval);
    *((float *)&v75 + 3) = v71.f32[0] * v31.__sinval;
    v50 = &v76;
LABEL_32:
    *(_BYTE *)v50 = 0;
  }

  *(_OWORD *)&v74[96] = v78[5];
  *(_OWORD *)&v74[112] = v78[6];
  *(_DWORD *)&v74[128] = v79;
  *(_OWORD *)&v74[32] = v78[1];
  *(_OWORD *)&v74[48] = v78[2];
  *(_OWORD *)&v74[64] = v78[3];
  *(_OWORD *)&v74[80] = v78[4];
  __int128 v72 = v75;
  __int128 v73 = v76;
  *(_OWORD *)v74 = v77;
  *(_OWORD *)&v74[16] = v78[0];
  RenderPatchworkWithMesh(v34, (unsigned __int16 *)&v72, a4);
  if (!v44)
  {
    if (v20 > v19)
    {
      *(float *)&uint64_t v69 = v31.__sinval;
      float v51 = v15 - (float)(v71.f32[0] * (float)(v46 + 1));
      if (HIDWORD(v69)) {
        float v52 = v15 - (float)(v71.f32[0] * (float)(v46 + 1));
      }
      else {
        float v52 = (float)-v51 - v71.f32[0];
      }
      if (HIDWORD(v69)) {
        float v53 = v15 - (float)(v71.f32[0] * (float)(v46 + 1));
      }
      else {
        float v53 = (float)(v71.f32[0] * v31.__cosval) - v51;
      }
      if (HIDWORD(v69)) {
        float v54 = 0.0;
      }
      else {
        float v54 = v71.f32[0] * v31.__sinval;
      }
      if (HIDWORD(v69)) {
        float v55 = v71.f32[0] + v51;
      }
      else {
        float v55 = -v51;
      }
      if (HIDWORD(v69)) {
        float v56 = v51 - (float)(v71.f32[0] * v31.__cosval);
      }
      else {
        float v56 = -v51;
      }
      if (HIDWORD(v69)) {
        float v57 = v71.f32[0] * v31.__sinval;
      }
      else {
        float v57 = 0.0;
      }
      if (v19)
      {
        if (v42) {
          uint64_t v58 = 2LL;
        }
        else {
          uint64_t v58 = 1LL;
        }
        objc_msgSend(a4, "cull:", v58, v69);
      }

      LOWORD(v72) = 2;
      BYTE2(v72) = v42;
      *(void *)((char *)&v72 + 4) = __PAIR64__(LODWORD(v53), LODWORD(v52));
      *((float *)&v72 + 3) = v54;
      LOBYTE(v73) = 0;
      *(void *)((char *)&v73 + 4) = __PAIR64__(LODWORD(v56), LODWORD(v55));
      *((float *)&v73 + 3) = v57;
      v74[0] = 0;
      RenderPatchworkWithMesh(v70, (unsigned __int16 *)&v72, a4);
      float sinval = *(float *)&v69;
    }

    if (v46)
    {
      float v59 = v71.f32[0] * sinval;
      float v60 = v15 - (float)(v71.f32[0] * (float)(v46 - 1));
      float v61 = v15 - (float)(v71.f32[0] * (float)(v46 + 1));
      if (HIDWORD(v69)) {
        float v62 = v60 - v71.f32[0];
      }
      else {
        float v62 = -v60;
      }
      if (HIDWORD(v69)) {
        float v63 = v61 - (float)(v71.f32[0] * v31.__cosval);
      }
      else {
        float v63 = -v61;
      }
      if (HIDWORD(v69)) {
        float v64 = v59;
      }
      else {
        float v64 = 0.0;
      }
      if (HIDWORD(v69)) {
        float v65 = v60;
      }
      else {
        float v65 = v71.f32[0] - v60;
      }
      if (HIDWORD(v69)) {
        float v66 = v61;
      }
      else {
        float v66 = (float)(v71.f32[0] * v31.__cosval) - v61;
      }
      if (HIDWORD(v69)) {
        float v67 = 0.0;
      }
      else {
        float v67 = v59;
      }
      if (v42) {
        uint64_t v68 = 2LL;
      }
      else {
        uint64_t v68 = 1LL;
      }
      objc_msgSend(a4, "cull:", v68, v69);
      LOWORD(v72) = 2;
      BYTE2(v72) = v42;
      *(void *)((char *)&v72 + 4) = __PAIR64__(LODWORD(v63), LODWORD(v62));
      *((float *)&v72 + 3) = v64;
      LOBYTE(v73) = 0;
      *(_WORD *)((char *)&v73 + 1) = v80;
      BYTE3(v73) = v81;
      *(void *)((char *)&v73 + 4) = __PAIR64__(LODWORD(v66), LODWORD(v65));
      *((float *)&v73 + 3) = v67;
      v74[0] = 0;
      *(_OWORD *)&v74[1] = v82;
      *(_OWORD *)&v74[65] = v86;
      *(_OWORD *)&v74[49] = v85;
      *(_OWORD *)&v74[33] = v84;
      *(_OWORD *)&v74[17] = v83;
      *(_DWORD *)&v74[128] = *(_DWORD *)&v89[15];
      *(_OWORD *)&v74[113] = *(_OWORD *)v89;
      *(_OWORD *)&v74[97] = v88;
      *(_OWORD *)&v74[81] = v87;
      RenderPatchworkWithMesh(v70, (unsigned __int16 *)&v72, a4);
    }
  }

  objc_msgSend(a4, "cull:", 0, v69);
  [v70 removeImages];
  [v34 removeImages];
}

@end