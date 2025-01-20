@interface MRTransitionHyperGridWipe
- (BOOL)controlsLayersTime;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionHyperGridWipe)initWithTransitionID:(id)a3;
- (void)_cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionHyperGridWipe

- (MRTransitionHyperGridWipe)initWithTransitionID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionHyperGridWipe;
  v3 = -[MRTransition initWithTransitionID:](&v5, "initWithTransitionID:", a3);
  if (v3)
  {
    __int128 v6 = xmmword_1F6FA0;
    __int128 v7 = xmmword_1F6FB0;
    v3->mCurves[0] = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
    __int128 v6 = xmmword_1F6FC0;
    __int128 v7 = xmmword_1F6FD0;
    v3->mCurves[1] = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
  }

  return v3;
}

- (void)_cleanup
{
  mCurves = self->mCurves;

  *mCurves = 0LL;
  mCurves[1] = 0LL;
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionHyperGridWipe;
  -[MRTransition prerenderForTime:inContext:withArguments:]( &v6,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  unsigned __int8 v9 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "integerValue");
  ValueFromBezierPath((id *)self->mCurves, dbl_2AD290, 1.0, 2.0, a3, (uint64_t)&unk_2AD2A8, 3LL);
  mSourceLayer = self->super.mSourceLayer;
  if (mSourceLayer)
  {
    double v12 = v10;
    v13 = -[MRLayer renderingState](mSourceLayer, "renderingState");
    if (v13)
    {
      v13->var15 = 1;
      float v14 = v12;
      v13->var5 = v14;
      switch(v9)
      {
        case 1u:
          float v15 = v12 + -1.0;
          double v16 = 1.0 - v12;
          goto LABEL_10;
        case 2u:
          double v17 = 1.0 - v12;
          goto LABEL_8;
        case 3u:
          double v17 = v12 + -1.0;
LABEL_8:
          float v18 = v17;
          float v19 = v17 * 3.0;
          v13->var2 = v18;
          v13->var3 = v19;
          break;
        case 4u:
          float v15 = 1.0 - v12;
          double v16 = v12 + -1.0;
LABEL_10:
          float v20 = v16 * 3.0;
          v13->var2 = v15;
          v13->var3 = v20;
          break;
        default:
          NSLog(@"HypergridWipe: unsupported direction");
          break;
      }
    }

    v21 = self->super.mSourceLayer;
    if (v21)
    {
      -[MRLayerClock externalTime](-[MRLayer clock](v21, "clock"), "externalTime");
      -[MRLayer renderAtTime:inContext:withArguments:](v21, "renderAtTime:inContext:withArguments:", a4, a5);
    }
  }

  mTargetLayer = self->super.mTargetLayer;
  if (mTargetLayer)
  {
    v23 = -[MRLayer renderingState](mTargetLayer, "renderingState");
    if (v23)
    {
      v24 = v23;
      ValueFromBezierPath((id *)self->mCurves, dbl_2AD290, 2.0, 4.0, a3, (uint64_t)&unk_2AD2A8, 3LL);
      v24->var15 = 1;
      float v26 = v25;
      v24->var5 = v26;
      switch(v9)
      {
        case 1u:
          float v27 = v25 + -1.0;
          double v28 = 1.0 - v25;
          goto LABEL_22;
        case 2u:
          double v28 = 1.0 - v25;
          goto LABEL_20;
        case 3u:
          double v28 = v25 + -1.0;
LABEL_20:
          float v27 = v28;
          goto LABEL_22;
        case 4u:
          float v27 = 1.0 - v25;
          double v28 = v25 + -1.0;
LABEL_22:
          float v29 = v28 * 3.0;
          v24->var2 = v27;
          v24->var3 = v29;
          break;
        default:
          NSLog(@"HypergridWipe: unsupported direction");
          break;
      }
    }

    v30 = self->super.mTargetLayer;
    if (v30)
    {
      -[MRLayerClock externalTime](-[MRLayer clock](v30, "clock"), "externalTime");
      -[MRLayer renderAtTime:inContext:withArguments:](v30, "renderAtTime:inContext:withArguments:", a4, a5);
    }
  }

@end