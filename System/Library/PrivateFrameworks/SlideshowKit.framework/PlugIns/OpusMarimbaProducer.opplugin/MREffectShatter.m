@interface MREffectShatter
- (BOOL)getVerticesCoordinates:(MREffectShatter *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectShatter)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectShatter

- (MREffectShatter)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectShatter;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3[194] = 0;
    *(void *)(v3 + 201) = 0LL;
    *(void *)(v3 + 209) = 0LL;
    *(void *)(v3 + 217) = 0LL;
    *(void *)(v3 + 225) = 0LL;
    *(void *)(v3 + 233) = 0LL;
    *(void *)(v3 + 241) = 0LL;
    *(void *)(v3 + 249) = 0LL;
    *(void *)(v3 + 257) = 0LL;
    *(_OWORD *)(v3 + 265) = 0u;
    *(_OWORD *)(v3 + 281) = 0u;
    *(_OWORD *)(v3 + 297) = 0u;
    *(_OWORD *)(v3 + 313) = 0u;
    *(_OWORD *)(v3 + 329) = 0u;
    *(_OWORD *)(v3 + 345) = 0u;
  }

  return (MREffectShatter *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  BYTE1(self->mSprites) = 0;
  BYTE2(self->mSprites) = 0;

  *(void *)&self->mSkipPanorama = 0LL;
  *(MRCAMLBezierData **)((char *)self->mZCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mZCurves[1] + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)self->mXRotCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mXRotCurves[1] + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)self->mPosCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mPosCurves[1] + 1) = 0LL;
  uint64_t v3 = 0LL;
  *(MRCAMLBezierData **)((char *)self->mYRotCurves + 1) = 0LL;
  v4 = (char *)&self->mYRotCurves[1] + 1;
  do
  {
    objc_super v5 = &v4[v3];

    *(void *)objc_super v5 = 0LL;
    *((void *)v5 + 1) = 0LL;
    v3 += 16LL;
  }

  while (v3 != 96);
}

- (void)setPixelSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectShatter;
  -[MREffect setPixelSize:](&v3, "setPixelSize:", a3.width, a3.height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v8 = self;
  if (!BYTE1(self->mSprites))
  {
    id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
    [v9 imageAspectRatio];
    if (v10 < 0.5 || v10 > 2.0)
    {
      id v23 = v9;
      id v25 = a5;
      v28[0] = xmmword_1F6250;
      v28[1] = unk_1F6260;
      v27[0] = xmmword_1F6270;
      v27[1] = unk_1F6280;
      [v9 imageAspectRatio];
      v24 = v8;
      if (v12 < 1.0)
      {
        *(_OWORD *)((char *)&v8->mZValues[2] + 1) = xmmword_1F6160;
        *(double *)((char *)&v8->mXRotKeyTimes[1] + 1) = 1.0;
        *(_OWORD *)((char *)&v8->mXRotKeyTimes[2] + 1) = xmmword_1F61C0;
        *(double *)((char *)&v8->mXRotValues[1] + 1) = 0.0;
        *(MRCAMLBezierData **)((char *)&v8->mZCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
        *(MRCAMLBezierData **)((char *)v8->mXRotCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
        *(_OWORD *)((char *)&v8->mXRotValues[2] + 1) = xmmword_1F6160;
        *(double *)((char *)&v8->mPosKeyTimes[1] + 1) = 1.0;
        *(_OWORD *)((char *)&v8->mPosKeyTimes[2] + 1) = xmmword_1F61D0;
        *(double *)((char *)&v8->mPosXValues[1] + 1) = 0.0;
        *(_OWORD *)((char *)&v8->mPosXValues[2] + 1) = xmmword_1F6190;
        *(double *)((char *)&v8->mPosYValues[1] + 1) = 1.0;
        *(MRCAMLBezierData **)((char *)&v8->mXRotCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
        *(MRCAMLBezierData **)((char *)v8->mPosCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
        *(_OWORD *)((char *)&v8->mLayerZCurves[5][1] + 1) = xmmword_1F6160;
        *(double *)((char *)&v8->mZKeyTimes[1] + 1) = 1.0;
        *(_OWORD *)((char *)&v8->mZKeyTimes[2] + 1) = xmmword_1F61E0;
        *(double *)((char *)&v8->mZValues[1] + 1) = 0.0;
        *(void *)&v8->mSkipPanorama = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
        *(MRCAMLBezierData **)((char *)v8->mZCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
        *(_OWORD *)((char *)&v8->mPosYValues[2] + 1) = xmmword_1F6160;
        *(double *)((char *)&v8->mYRotKeyTimes[1] + 1) = 1.0;
        *(_OWORD *)((char *)&v8->mYRotKeyTimes[2] + 1) = xmmword_1F61F0;
        *(double *)((char *)&v8->mYRotValues[1] + 1) = 0.0;
        *(MRCAMLBezierData **)((char *)&v8->mPosCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
        uint64_t v13 = 0LL;
        *(MRCAMLBezierData **)((char *)v8->mYRotCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
        p_mDescription = &v8->super.mDescription;
        while (1)
        {
          *(NSDictionary **)((char *)p_mDescription + 257) = (NSDictionary *)-[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
          *(NSDictionary **)((char *)p_mDescription + 265) = (NSDictionary *)-[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
          *(_OWORD *)((char *)&v8->mYRotValues[2] + 1) = xmmword_1F6160;
          *(double *)((char *)&v8->mLayerZKeyTimes[0][1] + 1) = 1.0;
          *(double *)((char *)&v8->mLayerZKeyTimes[5][2] + 1) = 0.0;
          *(double *)((char *)&v8->mLayerZValues[0][1] + 1) = 0.0;
          double v10 = -0.914062466;
          switch(v13)
          {
            case 0LL:
              goto LABEL_13;
            case 1LL:
              double v10 = -0.54843748;
              goto LABEL_13;
            case 2LL:
              double v10 = -0.182812493;
              goto LABEL_13;
            case 3LL:
              double v10 = 0.182812493;
              goto LABEL_13;
            case 4LL:
              double v10 = 0.54843748;
LABEL_13:
              *(double *)((char *)&v8->mLayerZValues[0][0] + 1) = v10;
              goto LABEL_14;
            case 5LL:
              v8 = v24;
              *(double *)((char *)&v24->mLayerZValues[5][0] + 1) = 0.914062466;
              goto LABEL_23;
            default:
LABEL_14:
              ++v13;
              v8 = (MREffectShatter *)((char *)v8 + 24);
              p_mDescription += 2;
              break;
          }
        }
      }

      *(_OWORD *)((char *)&v8->mLayerZCurves[5][1] + 1) = xmmword_1F6160;
      *(double *)((char *)&v8->mZKeyTimes[1] + 1) = 1.0;
      *(_OWORD *)((char *)&v8->mZKeyTimes[2] + 1) = xmmword_1F6170;
      *(double *)((char *)&v8->mZValues[1] + 1) = 0.0;
      *(void *)&v8->mSkipPanorama = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
      *(MRCAMLBezierData **)((char *)v8->mZCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
      *(_OWORD *)((char *)&v8->mZValues[2] + 1) = xmmword_1F6160;
      *(double *)((char *)&v8->mXRotKeyTimes[1] + 1) = 1.0;
      *(_OWORD *)((char *)&v8->mXRotKeyTimes[2] + 1) = xmmword_1F6180;
      *(double *)((char *)&v8->mXRotValues[1] + 1) = 0.0;
      *(MRCAMLBezierData **)((char *)&v8->mZCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
      *(MRCAMLBezierData **)((char *)v8->mXRotCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
      *(_OWORD *)((char *)&v8->mXRotValues[2] + 1) = xmmword_1F6160;
      *(double *)((char *)&v8->mPosKeyTimes[1] + 1) = 1.0;
      *(_OWORD *)((char *)&v8->mPosKeyTimes[2] + 1) = xmmword_1F6190;
      *(double *)((char *)&v8->mPosXValues[1] + 1) = 1.0;
      *(_OWORD *)((char *)&v8->mPosXValues[2] + 1) = xmmword_1F61A0;
      *(double *)((char *)&v8->mPosYValues[1] + 1) = 0.0;
      *(MRCAMLBezierData **)((char *)&v8->mXRotCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
      *(MRCAMLBezierData **)((char *)v8->mPosCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
      *(_OWORD *)((char *)&v8->mPosYValues[2] + 1) = xmmword_1F6160;
      *(double *)((char *)&v8->mYRotKeyTimes[1] + 1) = 1.0;
      *(_OWORD *)((char *)&v8->mYRotKeyTimes[2] + 1) = xmmword_1F61B0;
      *(double *)((char *)&v8->mYRotValues[1] + 1) = 0.0;
      *(MRCAMLBezierData **)((char *)&v8->mPosCurves[1] + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
      uint64_t v15 = 0LL;
      *(MRCAMLBezierData **)((char *)v8->mYRotCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
      v16 = &v8->super.mDescription;
      while (1)
      {
        *(NSDictionary **)((char *)v16 + 257) = (NSDictionary *)-[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v28);
        *(NSDictionary **)((char *)v16 + 265) = (NSDictionary *)-[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v27);
        *(_OWORD *)((char *)&v8->mYRotValues[2] + 1) = xmmword_1F6160;
        *(double *)((char *)&v8->mLayerZKeyTimes[0][1] + 1) = 1.0;
        *(double *)((char *)&v8->mLayerZKeyTimes[5][2] + 1) = 0.0;
        *(double *)((char *)&v8->mLayerZValues[0][1] + 1) = 0.0;
        double v10 = -0.243749991;
        switch(v15)
        {
          case 0LL:
            goto LABEL_19;
          case 1LL:
            double v10 = -0.081249997;
            goto LABEL_19;
          case 2LL:
            double v10 = 0.081249997;
LABEL_19:
            *(double *)((char *)&v8->mLayerZValues[0][0] + 1) = v10;
            goto LABEL_20;
          case 3LL:
            v8 = v24;
            *(double *)((char *)&v24->mLayerZValues[3][0] + 1) = 0.243749991;
LABEL_23:
            a5 = v25;
            id v9 = v23;
            goto LABEL_24;
          default:
LABEL_20:
            ++v15;
            v8 = (MREffectShatter *)((char *)v8 + 24);
            v16 += 2;
            break;
        }
      }
    }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = ImageKey(0LL);
  id v10 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v9),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  v11 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v12 = (MRCroppingSprite *)[v11 objectForKey:v9];
  if (!v12)
  {
    double v12 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v11 setObject:v12 forKey:v9];
  }

  [v10 aspectRatio];
  double v14 = v13;
  double y = CGPointZero.y;
  if (v13 <= 0.0 || (v13 >= 0.5 ? (BOOL v16 = v13 <= 2.0) : (BOOL v16 = 0), v16 || BYTE2(self->mSprites)))
  {
    double v17 = 2.0;
    if (v13 < 1.0)
    {
      [v10 aspectRatio];
      double v19 = v18 + v18;
      [a4 localAspectRatio];
      double v17 = v19 / v20;
    }

    [a4 setShader:@"PlainTexture"];
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( v12,  "renderImage:inContext:atPosition:andSize:",  v10,  a4,  CGPointZero.x,  y,  v17,  2.0);
    [a4 unsetShader];
    [v10 releaseByUser];
    return;
  }

  [a4 localAspectRatio];
  double v22 = v21;
  double v23 = (v14 + v14) / v22;
  double v24 = 1.0 / v14 * v22;
  if (v14 < 1.0) {
    double v25 = 1.0;
  }
  else {
    double v25 = v23;
  }
  if (v14 < 1.0) {
    double v26 = v24;
  }
  else {
    double v26 = 2.0;
  }
  [v10 setScale:1.0];
  double mMainDuration = self->super.mMainDuration;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  [a4 localAspectRatio];
  double v28 = v27;
  double v29 = (float)(v27 * 0.5);
  if (v14 >= 1.0) {
    double v30 = v14;
  }
  else {
    double v30 = v29;
  }
  if (v14 >= 1.0) {
    double v31 = v28;
  }
  else {
    double v31 = v14;
  }
  double v90 = v31;
  double v91 = v30;
  [v10 aspectRatio];
  double v94 = v25;
  if (v32 >= 1.0) {
    double v33 = v25;
  }
  else {
    double v33 = v26;
  }
  double v34 = self->super.mPhaseInDuration;
  if (v34 > a3)
  {
    double v35 = 0.0;
    if (v14 >= 1.0) {
      double v36 = 0.0;
    }
    else {
      double v36 = -(v26 * 0.5 + -1.0);
    }
    if (v14 >= 1.0) {
      double v37 = v25 * 0.5 + -1.0;
    }
    else {
      double v37 = 0.0;
    }
    goto LABEL_66;
  }

  double v87 = v25 * 0.5 + -1.0;
  double v38 = v33 + -2.0;
  if (v34 + self->super.mMainDuration > a3)
  {
    double v39 = fmin(v90 / v91, 0.5);
    float v40 = 1.0 / v39;
    float v41 = ceilf(v40);
    double v36 = 0.0;
    if ((float)(v41 + 1.0) <= 1.0)
    {
LABEL_50:
      double v37 = 0.0;
      double v35 = 0.0;
    }

    else
    {
      double v92 = v38;
      uint64_t v42 = 0LL;
      double v43 = a3 - mPhaseInDuration;
      double v44 = (float)(v41 + 1.0);
      double v45 = (float)(v41 + -1.0);
      double v46 = mMainDuration + -1.0;
      double v47 = v44 + -1.0;
      double v48 = 1.0;
      while (1)
      {
        double v49 = v39 * v48 * v46 + -0.5;
        if (v43 >= v49 && v43 < v39 * v48 * v46 + 0.5 && v47 != v48)
        {
          double v35 = v43 - v49;
          if (v14 <= 1.0) {
            v53 = &OBJC_IVAR___MREffectShatter_mPosYValues;
          }
          else {
            v53 = &OBJC_IVAR___MREffectShatter_mPosXValues;
          }
          double v37 = 0.0;
          ValueFromBezierPath( (id *)((char *)&self->mXRotCurves[1] + 1),  (double *)((char *)&self->mXRotValues[2] + 1),  0.0,  1.0,  v35,  (uint64_t)self + *v53,  3LL);
          double v55 = v92 * ((double)v42 / v45) + (v92 * (v48 / v45) - v92 * ((double)v42 / v45)) * v54;
          if (v14 <= 1.0)
          {
            double v36 = v55 - (v26 * 0.5 + -1.0);
          }

          else
          {
            double v37 = v87 - v55;
            double v36 = 0.0;
          }

          goto LABEL_66;
        }

        if (v43 < v49 || v47 == v48) {
          break;
        }
        double v48 = (double)(v42 + 2);
        ++v42;
        if (v48 >= v44) {
          goto LABEL_50;
        }
      }

      double v56 = (double)v42 / v45;
      double v57 = v87 - v92 * v56;
      double v58 = v92 * v56 - (v26 * 0.5 + -1.0);
      double v35 = 0.0;
      if (v14 <= 1.0) {
        double v36 = v58;
      }
      else {
        double v36 = 0.0;
      }
      if (v14 <= 1.0) {
        double v37 = 0.0;
      }
      else {
        double v37 = v57;
      }
    }

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v5, "addObject:", @"isPhoto");
  return v5;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    double v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        BOOL v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            double v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            double v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectShatter *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
  BYTE1(self->mSprites) = 0;
  BYTE2(self->mSprites) = 0;

  *(void *)&self->mSkipPanorama = 0LL;
  *(MRCAMLBezierData **)((char *)self->mZCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mZCurves[1] + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)self->mXRotCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mXRotCurves[1] + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)self->mPosCurves + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)&self->mPosCurves[1] + 1) = 0LL;
  uint64_t v3 = 0LL;
  *(MRCAMLBezierData **)((char *)self->mYRotCurves + 1) = 0LL;
  v4 = (char *)&self->mYRotCurves[1] + 1;
  do
  {
    objc_super v5 = &v4[v3];

    *(void *)objc_super v5 = 0LL;
    *((void *)v5 + 1) = 0LL;
    v3 += 16LL;
  }

  while (v3 != 96);
}

@end