@interface MREffectDotProgress
- (BOOL)isNative3D;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectDotProgress

- (void)setAttributes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectDotProgress;
  -[MREffect setAttributes:](&v5, "setAttributes:", a3);
  *(_WORD *)(&self->super._isInInteractiveMode + 3) = (unsigned __int16)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"countOfDots"),  "intValue");
  if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"selectedDotIndex")) {
    unsigned __int16 v4 = (unsigned __int16)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"selectedDotIndex"),  "intValue");
  }
  else {
    unsigned __int16 v4 = -1;
  }
  *(_WORD *)(&self->super._isInInteractiveMode + 1) = v4;
}

- (BOOL)isNative3D
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  int v5 = *(__int16 *)(&self->super._isInInteractiveMode + 3);
  if (v5 < 2) {
    return;
  }
  float v10 = 1.0 / (double)v5;
  float v11 = self->super.mPixelSize.height / self->super.mPixelSize.width;
  id v12 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  if (v12)
  {
    v13 = v12;
    [v12 setPreservesAspectRatio:0];
    v14 = &v46[-32 * *(__int16 *)(&self->super._isInInteractiveMode + 3)];
    unint64_t v15 = *(__int16 *)(&self->super._isInInteractiveMode + 3);
    v16 = &v46[-4 * (8 * v15)];
    int v17 = *(__int16 *)(&self->super._isInInteractiveMode + 1);
    uint64_t v18 = *(unsigned __int16 *)(&self->super._isInInteractiveMode + 1);
    if (v17 < 1)
    {
      if ((int)v15 - 1 > v17)
      {
        uint64_t v26 = 0LL;
        uint64_t v18 = (__int16)v18;
        v23 = &v46[-4 * (8 * v15)];
        v22 = (float *)&v46[-32 * *(__int16 *)(&self->super._isInInteractiveMode + 3)];
LABEL_11:
        unint64_t v34 = v18 + 1;
        if (v34 < v15)
        {
          double v35 = v10;
          float v36 = -v11;
          do
          {
            float v37 = ((double)v34 + (double)v34) * v35 + -1.0;
            float *v22 = v37;
            v22[1] = v11;
            v22[2] = v37;
            v22[3] = v36;
            ++v34;
            float v38 = ((double)v34 + (double)v34) * v35 + -1.0;
            v22[4] = v38;
            v22[5] = v11;
            v22[6] = v38;
            v22[7] = v36;
            _OWORD *v23 = xmmword_1FA190;
            v23[1] = xmmword_1FA1A0;
            v23 += 2;
            v26 += 4LL;
            v22 += 8;
          }

          while (v15 != v34);
        }

        goto LABEL_16;
      }

      uint64_t v26 = 0LL;
    }

    else
    {
      unint64_t v19 = 0LL;
      double v20 = v10;
      float v21 = -v11;
      v22 = (float *)(v14 + 16);
      v23 = v16 + 16;
      do
      {
        float v24 = ((double)v19 + (double)v19) * v20 + -1.0;
        *(v22 - 4) = v24;
        *(v22 - 3) = v21;
        *(v22 - 2) = v24;
        *(v22 - 1) = v11;
        ++v19;
        *(v23 - 1) = xmmword_1FA170;
        _OWORD *v23 = xmmword_1FA180;
        float v25 = ((double)v19 + (double)v19) * v20 + -1.0;
        float *v22 = v25;
        v22[1] = v21;
        v22[2] = v25;
        v22[3] = v11;
        v22 += 8;
        v23 += 2;
      }

      while (v18 != v19);
      uint64_t v26 = 4 * v18;
      if ((int)v15 - 1 > v17)
      {
        float v27 = ((double)v17 + (double)v17) * v20 + -1.0;
        *(v22 - 4) = v27;
        *(v22 - 3) = v11;
        float v28 = ((double)(v17 + 1) + (double)(v17 + 1)) * v20 + -1.0;
        *(v22 - 2) = v28;
        *(v22 - 1) = v11;
        __asm { FMOV            V0.4S, #-1.0 }

        *(v23 - 1) = _Q0;
        v26 |= 2uLL;
        goto LABEL_11;
      }
    }

@end