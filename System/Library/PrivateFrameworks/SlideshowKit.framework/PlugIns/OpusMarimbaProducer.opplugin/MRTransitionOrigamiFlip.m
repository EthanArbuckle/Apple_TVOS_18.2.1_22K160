@interface MRTransitionOrigamiFlip
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (MRTransitionOrigamiFlip)initWithTransitionID:(id)a3;
- (void)_cleanupSwingTimings;
- (void)_setupSwingTimings;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionOrigamiFlip

- (MRTransitionOrigamiFlip)initWithTransitionID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFlip;
  v3 = -[MRTransition initWithTransitionID:](&v6, "initWithTransitionID:", a3);
  v4 = v3;
  if (v3) {
    -[MRTransitionOrigamiFlip _setupSwingTimings](v3, "_setupSwingTimings");
  }
  return v4;
}

- (void)cleanup
{
  if (self->super.mDescription)
  {
    -[MRTransitionOrigamiFlip _cleanupSwingTimings](self, "_cleanupSwingTimings");
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFlip;
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
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFlip;
  -[MRTransition setAttributes:](&v4, "setAttributes:", a3);
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionOrigamiFlip;
  return -[MRTransition prerenderForTime:inContext:withArguments:]( &v6,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = 1.0 / v9;
  uint64_t v11 = self->super._direction - 1LL;
  else {
    unsigned int v12 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
  }
  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"offsetFromMiddle"),  "floatValue");
  float v14 = v13;
  double v15 = v13;
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  id v17 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v19 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mTargetLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
  int v21 = v12 & 1;
  v22 = &OBJC_IVAR___MRTransitionOrigamiFlip_mSideSwing;
  if ((v12 & 1) != 0) {
    float v23 = 1.0;
  }
  else {
    float v23 = v10;
  }
  if ((v12 & 1) == 0) {
    v22 = &OBJC_IVAR___MRTransitionOrigamiFlip_mBigSwing;
  }
  v24 = *(Class *)((char *)&self->super.super.isa + *v22);
  if ((v12 & 1) != 0) {
    uint64_t v25 = 1LL;
  }
  else {
    uint64_t v25 = 2LL;
  }
  *(float *)&double v20 = a3;
  objc_msgSend(v24, "valueAtTime:", v20, *(void *)&a3);
  if (v12 >= 2) {
    v27 = v19;
  }
  else {
    v27 = v17;
  }
  if (v12 >= 2)
  {
    float v28 = 3.14159265 - v26;
    float v29 = v28;
  }

  else
  {
    id v17 = v19;
    float v29 = v26;
  }

  __float2 v30 = __sincosf_stret(v29);
  [a4 cull:v25];
  double v31 = v23;
  double v47 = v15;
  double v32 = (v15 + (1.0 - v15) * (float)-v30.__cosval) * v23;
  double v33 = (1.0 - v15) * v30.__sinval * v23;
  if (v14 <= 0.0)
  {
    if (v14 >= 0.0)
    {
      double v36 = 1.57079637;
      goto LABEL_26;
    }

    BOOL v34 = v21 == 0;
    v35 = (double *)&unk_1F6360;
  }

  else
  {
    BOOL v34 = v21 == 0;
    v35 = (double *)&unk_1F6370;
  }

  double v36 = v35[v34];
LABEL_26:
  float v37 = v23 * v14;
  float v38 = v32;
  float v39 = v33;
  float v48 = v38;
  float v49 = v39;
  double v40 = v29;
  double v41 = v36;
  if (v36 >= v40)
  {
    if (v12 >= 2)
    {
      [v24 timeFirstAtRestValue];
      if (v42 <= v46) {
        goto LABEL_32;
      }
    }

    unsigned __int16 v50 = 3;
    char v51 = v12 & 1;
    float v52 = -v23;
    float v53 = -v23;
    float v54 = 0.0;
    char v55 = 0;
    float v56 = v37;
    float v57 = v37;
    int v58 = 0;
    char v59 = 0;
    float v60 = v23;
    float v61 = v48;
    float v62 = v49;
    char v63 = 0;
    RenderPatchworkWithMesh(v17, &v50, a4);
  }

  if (v12 > 1 || ([v24 timeFirstAtRestValue], v43 > v46))
  {
LABEL_32:
    float v44 = (v47 + (v47 + 1.0) * (float)-v30.__cosval) * v31;
    float v45 = (v47 + 1.0) * v30.__sinval * v31;
    unsigned __int16 v50 = 3;
    char v51 = v12 & 1;
    float v52 = -v23;
    float v53 = v44;
    float v54 = v45;
    char v55 = 0;
    float v56 = v37;
    float v57 = v37;
    int v58 = 0;
    char v59 = 0;
    float v60 = v23;
    float v61 = v23;
    float v62 = 0.0;
    char v63 = 0;
    RenderPatchworkWithMesh(v27, &v50, a4);
  }

  if (v41 < v40)
  {
    unsigned __int16 v50 = 3;
    char v51 = v12 & 1;
    float v52 = -v23;
    float v53 = -v23;
    float v54 = 0.0;
    char v55 = 0;
    float v56 = v37;
    float v57 = v37;
    int v58 = 0;
    char v59 = 0;
    float v60 = v23;
    float v61 = v48;
    float v62 = v49;
    char v63 = 0;
    RenderPatchworkWithMesh(v17, &v50, a4);
  }

  [a4 cull:0];
  [v17 removeImages];
  [v27 removeImages];
}

@end