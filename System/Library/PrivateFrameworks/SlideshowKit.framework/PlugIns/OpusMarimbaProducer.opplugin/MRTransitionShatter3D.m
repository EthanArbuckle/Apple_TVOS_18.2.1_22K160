@interface MRTransitionShatter3D
+ (void)initialize;
- (MRTransitionShatter3D)initWithTransitionID:(id)a3;
- (void)pinWheelAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)slicesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)spinAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)warpAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)zoomAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionShatter3D

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionShatter3D;
  objc_msgSendSuper2(&v2, "initialize");
}

- (MRTransitionShatter3D)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionShatter3D;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result) {
    result->mLayerCount = 8;
  }
  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mSourceLayerImage = self->super.mSourceLayerImage;
  if (!mSourceLayerImage)
  {
LABEL_5:
    mSourceLayer = self->super.mSourceLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
    self->super.mSourceLayerImage = (MRImage *)-[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSourceLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
    goto LABEL_6;
  }

  -[MRImage sourceTimestamp](mSourceLayerImage, "sourceTimestamp");
  double v11 = v10;
  -[MRLayer timeStamp](self->super.mSourceLayer, "timeStamp");
  if (v11 != v12
    || (-[MRImage renderTime](self->super.mSourceLayerImage, "renderTime"), v21 >= 0.0)
    && (-[MRImage renderTime](self->super.mSourceLayerImage, "renderTime"),
        double v23 = v22,
        -[MRLayerClock externalTime](-[MRLayer clock](self->super.mSourceLayer, "clock"), "externalTime"),
        v23 != v24))
  {
    v13 = self->super.mSourceLayerImage;
    if (v13) {
      -[MRImage releaseByUser](v13, "releaseByUser");
    }
    goto LABEL_5;
  }

- (void)spinAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.5)
  {
    float v9 = 1.0 - a3;
    double v8 = powf(v9, 1.47) * -1.37 + 1.0;
  }

  else
  {
    float v7 = a3;
    double v8 = powf(v7, 1.47) * 1.4;
  }

  if (v8 < 0.5)
  {
    float v14 = v8;
    float v15 = powf(v14, 4.0);
    float v12 = -(float)((float)(v15 * 17.0) - v15);
    double v13 = 90.0;
  }

  else
  {
    float v10 = v8 + -1.0;
    float v11 = powf(v10, 4.0);
    float v12 = -(float)(v11 - (float)(v11 * -17.0));
    double v13 = -90.0;
  }

  float v16 = v13 * v12;
  if (v16 <= 90.0 || v8 < 0.5) {
    float v18 = v16;
  }
  else {
    float v18 = 90.0;
  }
  if (v8 < 0.5) {
    float v19 = v18;
  }
  else {
    float v19 = v18 + -180.0;
  }
  MRMatrix_Clear((uint64_t)v41);
  int v42 = 0x40000000;
  MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v39, v18, 0.0, 0.0);
  v39[14] = -2.0;
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v41, v40, MRMatrix_PostMultiply((uint64_t)v41, v39));
  unint64_t mLayerCount = self->mLayerCount;
  if (self->mLayerCount)
  {
    unint64_t v21 = 0LL;
    double y = CGPointZero.y;
    uint64_t v23 = -1LL;
    do
    {
      unint64_t v24 = mLayerCount + v23;
      if (v8 >= 0.5) {
        unint64_t v25 = v24 + 1;
      }
      else {
        unint64_t v25 = v21;
      }
      float v26 = ((0.5 - v8) * (0.5 - v8) + -0.25) * ((double)v25 + 4.0);
      unint64_t v27 = v21 + 1;
      if ((float)(v19 - (float)(4 * v24)) <= -103.0)
      {
        if (v8 < 0.5) {
          *(float *)&double v29 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v37, 180.0, 0.0, 0.0);
        }
        else {
          double v29 = MRMatrix_Clear((uint64_t)v37);
        }
        float v38 = v26;
        objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v37, v36, v29);
        v30 = &OBJC_IVAR___MRTransition_mTargetLayerImage;
      }

      else
      {
        if (v8 < 0.5) {
          double v28 = MRMatrix_Clear((uint64_t)v37);
        }
        else {
          *(float *)&double v28 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v37, 180.0, 0.0, 0.0);
        }
        float v38 = v26;
        objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v37, v36, v28);
        v30 = &OBJC_IVAR___MRTransition_mSourceLayerImage;
      }

      v31 = (Class *)((char *)&self->super.super.isa + *v30);
      if (*v31)
      {
        [a4 setShader:@"ShatterShader4"];
        LOBYTE(v32) = self->mLayerCount;
        *(float *)&double v33 = (float)v21 / (float)v32;
        [a4 setShaderUniformFloat:@"inMin" forKey:v33];
        LOBYTE(v34) = self->mLayerCount;
        *(float *)&double v35 = (float)v27 / (float)v34;
        [a4 setShaderUniformFloat:@"inMax" forKey:v35];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  *v31,  a4,  CGPointZero.x,  y,  2.0,  2.0);
        [a4 unsetShader];
      }

      [a4 restoreModelViewMatrix:v36];
      unint64_t mLayerCount = self->mLayerCount;
      --v23;
      ++v21;
    }

    while (v27 < mLayerCount);
  }

  [a4 restoreModelViewMatrix:v40];
}

- (void)pinWheelAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.5)
  {
    float v9 = 1.0 - a3;
    double v8 = powf(v9, 1.47) * -1.37 + 1.0;
  }

  else
  {
    float v7 = a3;
    double v8 = powf(v7, 1.47) * 1.4;
  }

  float v10 = v8 + -0.5;
  float v11 = powf(v10, 6.0);
  float v12 = 0.0;
  if (v8 >= 0.75)
  {
    float v13 = (v8 + -0.75) * 4.0 * ((v8 + -0.75) * 4.0);
    float v12 = v13;
  }

  if (v8 <= 0.25)
  {
    float v14 = v8 * 4.0 * -2.0 + v8 * 4.0 * (v8 * 4.0) + 1.0;
    float v15 = v14;
  }

  else
  {
    float v15 = v12;
  }

  float v47 = v15;
  unsigned int mLayerCount = self->mLayerCount;
  if (self->mLayerCount)
  {
    uint64_t v17 = 0LL;
    float v18 = v11 * 64.0 + -1.0 + v11 * 64.0 + -1.0;
    float v46 = v18;
    float v20 = dbl_1FBEE0[v8 >= 0.3];
    float v45 = v20;
    float v21 = dbl_1FBEF0[v8 >= 0.3];
    float v44 = v21;
    float v22 = dbl_1FBF00[v8 >= 0.3];
    float v43 = v22;
    double v23 = 54.0;
    if (v8 >= 0.3) {
      double v23 = 0.1;
    }
    float v24 = v23;
    float v25 = 27.0;
    if (v8 >= 0.3) {
      float v25 = 1.0;
    }
    float v41 = v25;
    float v42 = v24;
    double v26 = 14.2;
    if (v8 >= 0.3) {
      double v26 = 3.0;
    }
    float v27 = v26;
    float v28 = 4.0;
    if (v8 >= 0.3) {
      float v28 = 16.0;
    }
    float v39 = v28;
    float v40 = v27;
    if (v8 < 0.3) {
      double v29 = 5.0;
    }
    else {
      double v29 = 7.0;
    }
    do
    {
      float v30 = 0.0;
      switch(v17)
      {
        case 0LL:
          float v30 = v39;
          break;
        case 1LL:
          float v30 = 7.5;
          break;
        case 2LL:
          float v30 = v40;
          break;
        case 3LL:
          float v30 = v41;
          break;
        case 4LL:
          float v30 = v42;
          break;
        case 5LL:
          float v30 = v43;
          break;
        case 6LL:
          float v30 = v44;
          break;
        case 7LL:
          float v30 = v45;
          break;
        default:
          break;
      }

      float v31 = ((v8 - ((double)v17 * -0.04 + 0.5)) * 0.75 + v30 * pow(v8 - ((double)v17 * -0.04 + 0.5), v29) + 0.5) * 360.0;
      float v32 = 360.0;
      if (v31 <= 360.0) {
        float v32 = v31;
      }
      if (v32 <= 270.0) {
        double v33 = &OBJC_IVAR___MRTransition_mSourceLayerImage;
      }
      else {
        double v33 = &OBJC_IVAR___MRTransition_mTargetLayerImage;
      }
      uint64_t v34 = *(uint64_t *)((char *)&self->super.super.isa + *v33);
      if (v34)
      {
        float v19 = ((0.5 - v8) * (0.5 - v8) + -0.25) * 4.0 * -35.0;
        MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v49, v19, v32, 0.0);
        float v51 = v46;
        float v50 = v47;
        [a4 composeModelViewMatrix:v49 saveTo:v48];
        [a4 setShader:@"ShatterShader4"];
        LOBYTE(v35) = self->mLayerCount;
        *(float *)&double v36 = (float)v17 / (float)v35;
        [a4 setShaderUniformFloat:@"inMin" forKey:v36];
        ++v17;
        LOBYTE(v37) = self->mLayerCount;
        *(float *)&double v38 = (float)v17 / (float)v37;
        [a4 setShaderUniformFloat:@"inMax" forKey:v38];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v34,  a4,  -1.0,  0.0,  2.0,  2.0);
        [a4 unsetShader];
        [a4 restoreModelViewMatrix:v48];
        unsigned int mLayerCount = self->mLayerCount;
      }

      else
      {
        ++v17;
      }
    }

    while (v17 < (unint64_t)mLayerCount);
  }

- (void)zoomAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.5)
  {
    float v9 = 1.0 - a3;
    double v8 = powf(v9, 1.47) * -1.37 + 1.0;
  }

  else
  {
    float v7 = a3;
    double v8 = powf(v7, 1.47) * 1.4;
  }

  if (v8 > 0.85)
  {
    float v11 = 0.0;
    float v10 = 180.0;
  }

  else
  {
    float v10 = 0.0;
    float v11 = 0.0;
    if (v8 > 0.15)
    {
      float v10 = (sin(v8 * 4.49247749 + -2.26194671) * 0.5 + 0.5) * 180.0;
      double v12 = sin(v8 * 3.45575192 + -3.14159265 + -0.15);
      float v11 = pow(v12, 6.0) * 70.0;
    }
  }

  MRMatrix_Clear((uint64_t)v35);
  int v36 = 1082130432;
  MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v33, v11, v10, 0.0);
  double v13 = pow(v8 + -0.5, 6.0);
  double v14 = v13 * -32.0 + 0.5;
  double v15 = v13 * 32.0 + 0.5;
  if (v8 <= 0.38) {
    double v15 = v14;
  }
  float v16 = v15 * 8.0 + -4.0;
  v33[14] = v16;
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v35, v34, MRMatrix_PostMultiply((uint64_t)v35, v33));
  float v17 = v8 + -0.5;
  *(float *)&double v18 = powf(v17, 8.0);
  unsigned int mLayerCount = self->mLayerCount;
  if (self->mLayerCount)
  {
    float v20 = *(float *)&v18;
    uint64_t v21 = 0LL;
    double y = CGPointZero.y;
    uint64_t v23 = -256LL;
    double v18 = 0.4;
    do
    {
      switch(v21)
      {
        case 0LL:
          double v18 = 0.65;
          goto LABEL_20;
        case 1LL:
          double v18 = 0.63;
          goto LABEL_20;
        case 2LL:
          double v18 = 0.61;
          goto LABEL_20;
        case 3LL:
          double v18 = 0.55;
          goto LABEL_20;
        case 4LL:
          double v18 = 0.43;
          goto LABEL_20;
        case 5LL:
          double v18 = 0.41;
          goto LABEL_20;
        case 6LL:
          double v18 = 0.4;
LABEL_20:
          if (v8 > v18) {
            goto LABEL_21;
          }
          goto LABEL_24;
        case 7LL:
          if (v8 <= 0.38) {
            goto LABEL_24;
          }
LABEL_21:
          mTargetLayerImage = self->super.mTargetLayerImage;
          if (!mTargetLayerImage) {
            goto LABEL_27;
          }
          MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v31, 180.0, 0.0, 0.0);
          break;
        default:
LABEL_24:
          mTargetLayerImage = self->super.mSourceLayerImage;
          if (!mTargetLayerImage) {
            goto LABEL_27;
          }
          MRMatrix_Clear((uint64_t)v31);
          break;
      }

      float v25 = ((double)v21 * -0.1 + 1.0 + (float)(v20 * (float)v23)) * -6.0;
      float v32 = v25;
      [a4 composeModelViewMatrix:v31 saveTo:v30];
      [a4 setShader:@"ShatterShader4"];
      LOBYTE(v26) = self->mLayerCount;
      *(float *)&double v27 = (float)v21 / (float)v26;
      [a4 setShaderUniformFloat:@"inMin" forKey:v27];
      LOBYTE(v28) = self->mLayerCount;
      *(float *)&double v29 = (float)(v21 + 1) / (float)v28;
      [a4 setShaderUniformFloat:@"inMax" forKey:v29];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  mTargetLayerImage,  a4,  CGPointZero.x,  y,  2.0,  2.0);
      [a4 unsetShader];
      [a4 restoreModelViewMatrix:v30];
      unsigned int mLayerCount = self->mLayerCount;
LABEL_27:
      ++v21;
      v23 += 25LL;
    }

    while (v21 < (unint64_t)mLayerCount);
  }

  objc_msgSend(a4, "restoreModelViewMatrix:", v34, v18);
}

- (void)slicesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.5)
  {
    float v9 = 1.0 - a3;
    double v8 = powf(v9, 1.47) * -1.37 + 1.0;
  }

  else
  {
    float v7 = a3;
    double v8 = powf(v7, 1.47) * 1.4;
  }

  double v10 = 1.0;
  if (v8 < 0.5)
  {
    if (v8 >= 0.4) {
      double v11 = 1.57079633;
    }
    else {
      double v11 = v8 / 0.4 * 1.57079633;
    }
    double v12 = sin(v11);
    double v10 = pow(v12, 5.0);
  }

  double v40 = v8 + -0.5 + v8 + -0.5;
  if (self->super.mSourceLayerImage && self->mLayerCount)
  {
    uint64_t v13 = 0LL;
    double v41 = v40 * v40 + v40 * v40;
    double y = CGPointZero.y;
    uint64_t v17 = 3LL;
    do
    {
      MRMatrix_Clear((uint64_t)v44);
      float v18 = v10 * (double)v17;
      float v47 = v18;
      float v14 = v10 * 30.0;
      float v15 = v10 * 50.0;
      MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v42, v14, v15, 0.0);
      MRMatrix_PostMultiply((uint64_t)v44, v42);
      double v19 = v46 + v10 * 0.25;
      *(float *)&double v19 = v19;
      float v46 = *(float *)&v19;
      if (v8 >= 0.5)
      {
        LOBYTE(v19) = self->mLayerCount;
        double v20 = v41 * (double)*(unint64_t *)&v19 + -5.0 + v47;
      }

      else
      {
        double v20 = v47 + v10 * -5.0;
      }

      float v21 = v20;
      float v47 = v21;
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v44, v43, *(void *)&v40);
      [a4 setShader:@"ShatterShader4"];
      LOBYTE(v22) = self->mLayerCount;
      *(float *)&double v23 = (float)v13 / (float)v22;
      [a4 setShaderUniformFloat:@"inMin" forKey:v23];
      ++v13;
      LOBYTE(v24) = self->mLayerCount;
      *(float *)&double v25 = (float)v13 / (float)v24;
      [a4 setShaderUniformFloat:@"inMax" forKey:v25];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->super.mSourceLayerImage,  a4,  CGPointZero.x,  y,  2.0,  2.0);
      [a4 unsetShader];
      [a4 restoreModelViewMatrix:v43];
      --v17;
    }

    while (v13 < (unint64_t)self->mLayerCount);
  }

  if (v8 >= 0.5)
  {
    if (self->super.mTargetLayerImage)
    {
      unint64_t mLayerCount = self->mLayerCount;
      if (self->mLayerCount)
      {
        uint64_t v27 = 0LL;
        float v28 = v40;
        double v29 = (float)(v28 * v28);
        double v30 = CGPointZero.y;
        do
        {
          uint64_t v31 = mLayerCount + v27;
          else {
            double v32 = 0.0;
          }
          float v33 = v32 * 90.0;
          MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v44, v33, 0.0, 0.0);
          float v34 = v45 + ((double)v27 * 6.0 + -24.0) * v32;
          float v35 = v47 + v32 * -80.0;
          float v45 = v34;
          float v47 = v35;
          [a4 composeModelViewMatrix:v44 saveTo:v43];
          [a4 setShader:@"ShatterShader4"];
          LOBYTE(v36) = self->mLayerCount;
          *(float *)&double v37 = (float)v27 / (float)v36;
          [a4 setShaderUniformFloat:@"inMin" forKey:v37];
          ++v27;
          LOBYTE(v38) = self->mLayerCount;
          *(float *)&double v39 = (float)v27 / (float)v38;
          [a4 setShaderUniformFloat:@"inMax" forKey:v39];
          +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->super.mTargetLayerImage,  a4,  CGPointZero.x,  v30,  2.0,  2.0);
          [a4 unsetShader];
          [a4 restoreModelViewMatrix:v43];
          unint64_t mLayerCount = self->mLayerCount;
        }

        while (v27 < mLayerCount);
      }
    }
  }

- (void)warpAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.5)
  {
    float v9 = 1.0 - a3;
    double v8 = powf(v9, 1.47) * -1.37 + 1.0;
  }

  else
  {
    float v7 = a3;
    double v8 = powf(v7, 1.47) * 1.4;
  }

  float v10 = v8;
  float v11 = powf(v10, 4.0);
  float v12 = v8 + -1.3;
  float v13 = powf(v12, 6.0);
  if (self->super.mSourceLayerImage && self->mLayerCount)
  {
    uint64_t v14 = 0LL;
    double y = CGPointZero.y;
    do
    {
      MRMatrix_Clear((uint64_t)v41);
      float v16 = (8.0 - (double)v14) * -15.0 * v11;
      float v43 = v16;
      [a4 composeModelViewMatrix:v41 saveTo:v40];
      [a4 setShader:@"ShatterShader4"];
      LOBYTE(v17) = self->mLayerCount;
      *(float *)&double v18 = (float)v14 / (float)v17;
      [a4 setShaderUniformFloat:@"inMin" forKey:v18];
      ++v14;
      LOBYTE(v19) = self->mLayerCount;
      *(float *)&double v20 = (float)v14 / (float)v19;
      [a4 setShaderUniformFloat:@"inMax" forKey:v20];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->super.mSourceLayerImage,  a4,  CGPointZero.x,  y,  2.0,  2.0);
      [a4 unsetShader];
      [a4 restoreModelViewMatrix:v40];
    }

    while (v14 < (unint64_t)self->mLayerCount);
  }

  if (self->super.mTargetLayerImage && self->mLayerCount)
  {
    uint64_t v21 = 0LL;
    double v22 = v13;
    double v23 = CGPointZero.y;
    uint64_t v24 = -1LL;
    __asm
    {
      FMOV            V12.2S, #1.0
      FMOV            V15.2S, #-1.0
    }

    do
    {
      double v31 = (double)v24 * v22 + 1.0;
      double v32 = 0.0;
      if (v31 >= 0.0)
      {
        double v32 = (double)v24 * v22 + 1.0;
        if (v31 > 1.0) {
          double v32 = 1.0;
        }
      }

      MRMatrix_Clear((uint64_t)v41);
      float32x2_t v42 = _D12;
      float v33 = (v32 + -1.0) * 180.0;
      float v34 = (1.0 - v32) * 180.0;
      MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v40, v33, v34, 0.0);
      MRMatrix_PostMultiply((uint64_t)v41, v40);
      float32x2_t v42 = vadd_f32(v42, _D15);
      [a4 composeModelViewMatrix:v41 saveTo:v39];
      [a4 setShader:@"ShatterShader4"];
      LOBYTE(v35) = self->mLayerCount;
      *(float *)&double v36 = (float)v21 / (float)v35;
      [a4 setShaderUniformFloat:@"inMin" forKey:v36];
      LOBYTE(v37) = self->mLayerCount;
      *(float *)&double v38 = (float)(v21 + 1) / (float)v37;
      [a4 setShaderUniformFloat:@"inMax" forKey:v38];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->super.mTargetLayerImage,  a4,  CGPointZero.x,  v23,  2.0,  2.0);
      [a4 unsetShader];
      [a4 restoreModelViewMatrix:v39];
      --v24;
      ++v21;
    }

    while (v21 < (unint64_t)self->mLayerCount);
  }

@end