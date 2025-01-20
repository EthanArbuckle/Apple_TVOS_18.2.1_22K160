@interface MRTransitionRevolutionsFlip2
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionRevolutionsFlip2

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  unsigned __int8 v9 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
  [a4 depthTest:1];
  self->_unint64_t numberOfElements = 7;
  float v10 = a3 * 7.0;
  unint64_t v11 = vcvtms_u32_f32(v10);
  float v12 = -((double)v11 - a3 * 7.0);
  float v13 = v12 * 1.57079633;
  __float2 v14 = __sincosf_stret(v13);
  [a4 localAspectRatio];
  float v16 = v15;
  LODWORD(v17) = 1.0;
  *(float *)&double v18 = 1.0 / v15;
  unint64_t numberOfElements = self->_numberOfElements;
  double v21 = (double)numberOfElements;
  float v20 = ((float)(1.0 / v15) + (float)(1.0 / v15)) / (double)numberOfElements;
  double v24 = 2.0 / (double)numberOfElements;
  *(float *)&double v21 = v24;
  *(float *)&double v22 = -*(float *)&v18;
  LODWORD(v23) = -1.0;
  *(float *)&double v24 = -v20;
  if ((v9 & 2) != 0)
  {
    *(float *)&double v21 = -*(float *)&v21;
    *(float *)&double v22 = *(float *)&v18;
    *(float *)&double v18 = -v20;
  }

  else
  {
    *(float *)&double v17 = -1.0;
    *(float *)&double v18 = v20;
  }

  if (self->_numberOfElements)
  {
    uint64_t v25 = 0LL;
    unint64_t v26 = 0LL;
    double v23 = (float)(v14.__cosval - v14.__sinval) + -1.0;
    double v27 = *(float *)&v18 * -0.5;
    double v28 = v20 * 0.5;
    double v29 = (float)(v14.__cosval + v14.__sinval) + -1.0;
    float v30 = v29 * v28;
    float v31 = v23 * v28;
    float v32 = ((float)(v14.__sinval - v14.__cosval) + -1.0) * v28;
    v33 = v50;
    do
    {
      v34 = &v52[v25];
      if (v26 >= v11)
      {
        *(_DWORD *)v34 = -1082130432;
        if (v26 <= v11)
        {
          float v37 = *(float *)&v22 + v27 * v23;
          *((float *)v34 + 1) = v37;
          *((float *)v34 + 2) = v30;
          *((_DWORD *)v34 + 3) = -1082130432;
          *((float *)v34 + 4) = v37;
          *((float *)v34 + 5) = v30;
          *((_DWORD *)v34 + 6) = 1065353216;
          *((float *)v34 + 7) = v37;
          *((float *)v34 + 8) = v30;
          *((_DWORD *)v34 + 9) = -1082130432;
          float v38 = *(float *)&v22 + v27 * ((float)((float)-v14.__sinval - v14.__cosval) + -1.0);
          *((float *)v34 + 10) = v38;
          *((float *)v34 + 11) = v31;
          *((_DWORD *)v34 + 12) = 1065353216;
          *((float *)v34 + 13) = v38;
          *((float *)v34 + 14) = v31;
          *((_DWORD *)v34 + 15) = 1065353216;
          *((float *)v34 + 16) = v38;
          *((float *)v34 + 17) = v31;
          v39 = (float *)&v51[v25];
          float *v39 = -1.0;
          float v40 = *(float *)&v22 + v27 * v29;
          v39[1] = v40;
          v39[2] = v32;
          v39[3] = -1.0;
          v39[4] = v40;
          v39[5] = v32;
          v39[6] = 1.0;
          v39[7] = v40;
          v39[8] = v32;
          v39[9] = -1.0;
          v39[10] = v37;
          v39[11] = v30;
          v39[12] = 1.0;
          v39[13] = v37;
          v39[14] = v30;
          v39[15] = 1.0;
          *(float *)&double v22 = *(float *)&v18 + *(float *)&v22;
          v39[16] = v37;
          v39[17] = v30;
        }

        else
        {
          *((_DWORD *)v34 + 1) = LODWORD(v22);
          *((void *)v34 + 1) = 0xBF80000000000000LL;
          *((_DWORD *)v34 + 4) = LODWORD(v22);
          *(void *)(v34 + 20) = 0x3F80000000000000LL;
          *((_DWORD *)v34 + 7) = LODWORD(v22);
          *((void *)v34 + 4) = 0xBF80000000000000LL;
          v36 = &v51[v25];
          *((_DWORD *)v36 + 10) = LODWORD(v22);
          *((_DWORD *)v36 + 13) = LODWORD(v22);
          *((_DWORD *)v36 + 16) = LODWORD(v22);
          *((float *)v34 + 10) = *(float *)&v18 + *(float *)&v22;
          *(void *)(v34 + 44) = 0x3F80000000000000LL;
          *((float *)v34 + 13) = *(float *)&v18 + *(float *)&v22;
          *((void *)v34 + 7) = 0x3F80000000000000LL;
          *((float *)v34 + 16) = *(float *)&v18 + *(float *)&v22;
          *((_DWORD *)v34 + 17) = 0;
          *(_DWORD *)v36 = -1082130432;
          *((_DWORD *)v36 + 1) = LODWORD(v22);
          *((_DWORD *)v36 + 2) = LODWORD(v24);
          *((_DWORD *)v36 + 3) = -1082130432;
          *((_DWORD *)v36 + 4) = LODWORD(v22);
          *((_DWORD *)v36 + 5) = LODWORD(v24);
          *((_DWORD *)v36 + 6) = 1065353216;
          *((_DWORD *)v36 + 7) = LODWORD(v22);
          *((_DWORD *)v36 + 8) = LODWORD(v24);
          *((_DWORD *)v36 + 9) = -1082130432;
          *(void *)(v36 + 44) = 0x3F80000000000000LL;
          *((void *)v36 + 7) = 0x3F80000000000000LL;
          *(float *)&double v22 = *(float *)&v18 + *(float *)&v22;
          *((_DWORD *)v36 + 17) = 0;
        }
      }

      else
      {
        *(_DWORD *)v34 = -1082130432;
        *((_DWORD *)v34 + 1) = LODWORD(v22);
        *((_DWORD *)v34 + 2) = LODWORD(v24);
        *((_DWORD *)v34 + 3) = -1082130432;
        *((_DWORD *)v34 + 4) = LODWORD(v22);
        *((_DWORD *)v34 + 5) = LODWORD(v24);
        *((_DWORD *)v34 + 6) = 1065353216;
        *((_DWORD *)v34 + 7) = LODWORD(v22);
        *((_DWORD *)v34 + 8) = LODWORD(v24);
        *((_DWORD *)v34 + 9) = -1082130432;
        *((_DWORD *)v34 + 10) = LODWORD(v22);
        *(void *)(v34 + 44) = 0x3F80000000000000LL;
        *((_DWORD *)v34 + 13) = LODWORD(v22);
        *((void *)v34 + 7) = 0x3F80000000000000LL;
        *((_DWORD *)v34 + 16) = LODWORD(v22);
        *((_DWORD *)v34 + 17) = 0;
        v35 = &v51[v25];
        *(_DWORD *)v35 = -1082130432;
        *((_DWORD *)v35 + 1) = LODWORD(v22);
        *((void *)v35 + 1) = 0xBF80000000000000LL;
        *((_DWORD *)v35 + 4) = LODWORD(v22);
        *(void *)(v35 + 20) = 0x3F80000000000000LL;
        *((_DWORD *)v35 + 7) = LODWORD(v22);
        *((void *)v35 + 4) = 0xBF80000000000000LL;
        *(float *)&double v22 = *(float *)&v18 + *(float *)&v22;
        *((_DWORD *)v35 + 10) = LODWORD(v22);
        *(void *)(v35 + 44) = 0x3F80000000000000LL;
        *((_DWORD *)v35 + 13) = LODWORD(v22);
        *((void *)v35 + 7) = 0x3F80000000000000LL;
        *((_DWORD *)v35 + 16) = LODWORD(v22);
        *((_DWORD *)v35 + 17) = 0;
      }

      _DWORD *v33 = -1082130432;
      v33[1] = LODWORD(v17);
      v33[2] = -1082130432;
      v33[3] = LODWORD(v17);
      v33[4] = 1065353216;
      v33[5] = LODWORD(v17);
      v33[6] = -1082130432;
      *(float *)&double v17 = *(float *)&v21 + *(float *)&v17;
      v33[7] = LODWORD(v17);
      v33[8] = 1065353216;
      v33[9] = LODWORD(v17);
      ++v26;
      v25 += 72LL;
      v33[10] = 1065353216;
      v33[11] = LODWORD(v17);
      v33 += 12;
    }

    while (v26 < numberOfElements);
  }

  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock", v24, v21, v17, v18, v22, v23), "externalTime");
  id v42 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSourceLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  if (v42)
  {
    id v43 = v42;
    [v43 releaseByUser];
  }

  id v43 = [a4 retainedByUserBlackImage];
LABEL_16:
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v45 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mTargetLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  if (!v45)
  {
LABEL_19:
    id v46 = [a4 retainedByUserBlackImage];
    goto LABEL_20;
  }

  id v46 = v45;
  if ([v45 isEmpty])
  {
    [v46 releaseByUser];
    goto LABEL_19;
  }

@end