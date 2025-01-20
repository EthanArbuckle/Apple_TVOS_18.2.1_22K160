@interface MRTransitionDroplet
- (MRTransitionDroplet)initWithTransitionID:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionDroplet

- (MRTransitionDroplet)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionDroplet;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result)
  {
    result->mUseLighting = 1;
    result->mAmplitude = 0.95;
  }

  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = v9;
  p_mSourceLayer = (id *)&self->super.mSourceLayer;
  mSourceLayer = self->super.mSourceLayer;
  if (mSourceLayer)
  {
    mTargetLayer = self->super.mTargetLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
    -[MRLayer renderAtTime:inContext:withArguments:](mTargetLayer, "renderAtTime:inContext:withArguments:", a4, a5);
  }

  double v14 = cos(a3 * 1.57079633);
  [a4 blend:3];
  if (!mSourceLayer) {
    p_mSourceLayer = (id *)&self->super.mTargetLayer;
  }
  id v15 = *p_mSourceLayer;
  if (*p_mSourceLayer && (v16 = [*p_mSourceLayer renderingState]) != 0)
  {
    v17 = v16;
    v16[244] = 1;
    objc_msgSend(objc_msgSend(v15, "clock"), "externalTime");
    id v18 = objc_msgSend(v15, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
    v17[244] = 0;
    if (!v18) {
      return;
    }
  }

  else
  {
    id v18 = [a4 retainedByUserBlackImage];
    if (!v18) {
      return;
    }
  }

  double v19 = 1.0 - v14;
  float v20 = 1.0 / v10;
  [a4 setShader:@"ColoredTexture"];
  *(float *)&double v21 = v10;
  [v18 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v69 state:v21];
  float v22 = 1.0 - pow(v19, 1.5);
  if (mSourceLayer) {
    float v23 = v22;
  }
  else {
    float v23 = 1.0 - v22;
  }
  float v24 = sqrtf((float)(v10 * v10) + 1.0);
  if (v20 <= 1.0) {
    float v25 = 1.0 / v10;
  }
  else {
    float v25 = 1.0;
  }
  float v62 = v25;
  float v63 = v24;
  float v26 = self->mAmplitude * 0.1;
  if (v19 < 0.1)
  {
    float v27 = v19 * 10.0 * v26;
    float v26 = v27;
  }

  float v61 = v26;
  if (*(float *)dword_2ACD78 < -1.0)
  {
    for (uint64_t i = 0LL; i != 151; ++i)
    {
      __float2 v29 = __sincosf_stret((float)((float)(int)i * 6.2832) / 150.0);
      dword_2ACD78[i] = LODWORD(v29.__cosval);
      dword_2AE400[i] = LODWORD(v29.__sinval);
    }
  }

  int v30 = 0;
  double v60 = -(v19 * v63);
  float v68 = 0.025;
  double v59 = 1.20000005;
  double v58 = 0.200000003;
  double v57 = 15.7079633;
  float v31 = v61;
  do
  {
    int v32 = v30;
    float v67 = v63 * (float)v30;
    float v33 = v67 * v68;
    float v66 = v63 * (float)++v30;
    float v34 = v66 * v68;
    float v35 = ((float)(v67 * v68) + v60 * v59 + v58) * v57;
    float v36 = ((float)(v66 * v68) + v60 * v59 + v58) * v57;
    __float2 v65 = __sincosf_stret(v35);
    float v64 = (float)(v31 * v65.__sinval) / v35;
    __float2 v37 = __sincosf_stret(v36);
    float v38 = 0.0;
    if (v32) {
      float v38 = v64;
    }
    else {
      float v39 = -(float)(v66 * v68);
    }
    uint64_t v40 = 0LL;
    double v41 = (float)((float)(v31 * (float)-(float)(v65.__sinval - (float)(v35 * v65.__cosval))) / (float)(v35 * v35)) * 7.0;
    float v42 = v62 * (float)(v33 + v38);
    float v43 = v62 * (float)(v34 + v39);
    v44 = (float *)v55;
    v45 = (float *)dword_2AE400;
    v46 = dword_2ACD78;
    do
    {
      float v47 = *(float *)v46++;
      float v48 = v47;
      float v49 = *v45++;
      float v50 = v41 * v48 + 1.0;
      float v51 = (float)((float)(v31 * (float)-(float)(v37.__sinval - (float)(v36 * v37.__cosval))) / (float)(v36 * v36))
          * 7.0
          * v48
          + 1.0;
      *(v44 - 4) = v50;
      *(v44 - 3) = v50;
      *(v44 - 2) = v50;
      *(v44 - 1) = v23;
      v52 = (float *)&v55[v40 + 4824];
      *(v52 - 2) = v20 * (float)(v33 * v48);
      *(v52 - 1) = v33 * v49;
      v53 = (float *)&v56[v40 + 8];
      *(v53 - 2) = v42 * v48;
      *(v53 - 1) = v42 * v49;
      float *v44 = v51;
      v44[1] = v51;
      v44[2] = v51;
      v44[3] = v23;
      float *v52 = v20 * (float)(v34 * v48);
      v52[1] = v34 * v49;
      float *v53 = v43 * v48;
      v53[1] = v43 * v49;
      v40 += 16LL;
      v44 += 8;
    }

    while (v40 != 2416);
    objc_msgSend(a4, "setTextureCoordinatesPointer:onTextureUnit:");
    [a4 setColorsPointer:&v54];
    [a4 setVertex2DPointer:v56];
    [a4 drawTriangleStripFromOffset:0 count:302];
  }

  while (v30 != 40);
  [a4 unsetVertexPointer];
  [a4 unsetColorsPointer];
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [v18 unsetOnContext:a4 onTextureUnit:0 state:&v69];
  [v18 releaseByUser];
  [a4 unsetShader];
}

@end