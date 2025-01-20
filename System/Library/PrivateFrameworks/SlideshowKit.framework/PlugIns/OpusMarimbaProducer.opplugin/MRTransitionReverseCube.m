@interface MRTransitionReverseCube
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionReverseCube)initWithTransitionID:(id)a3;
- (void)_cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRTransitionReverseCube

- (MRTransitionReverseCube)initWithTransitionID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionReverseCube;
  v3 = -[MRTransition initWithTransitionID:](&v5, "initWithTransitionID:", a3);
  if (v3)
  {
    v3->mWallProvider = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( v3->mWallProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PictureFrames_10",  @"wall.jpg"));
    -[MRImageProvider setImageSizeScript:](v3->mWallProvider, "setImageSizeScript:", @"layerWidth,layerHeight");
    -[MRImageProvider setOriginalImageSize:](v3->mWallProvider, "setOriginalImageSize:", 2240.0, 1680.0);
    v3->mGradientProvider = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( v3->mGradientProvider,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PictureFrames_10",  @"gradient.png"));
    -[MRImageProvider setImageSizeScript:]( v3->mGradientProvider,  "setImageSizeScript:",  @"layerWidth*.22*.5,layerHeight*.5");
    -[MRImageProvider setOriginalImageSize:](v3->mGradientProvider, "setOriginalImageSize:", 500.0, 1650.0);
  }

  return v3;
}

- (void)_cleanup
{
  self->mWallProvider = 0LL;
  -[MRImageProvider cleanup](self->mGradientProvider, "cleanup");

  self->mGradientProvider = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionReverseCube;
  -[MRTransition setPixelSize:](&v6, "setPixelSize:");
  -[MRImageProvider setDefaultSize:](self->mWallProvider, "setDefaultSize:", width, height);
  -[MRImageProvider setDefaultSize:](self->mGradientProvider, "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  BOOL v4 = -[MRImageProvider isLoaded](self->mWallProvider, "isLoaded", a3);
  if (v4) {
    LOBYTE(v4) = -[MRImageProvider isLoaded](self->mGradientProvider, "isLoaded");
  }
  return v4;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRTransitionReverseCube;
  -[MRTransition prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mWallProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  -[MRImageProvider prerenderForTime:inContext:withArguments:]( self->mGradientProvider,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v9 = a3;
  float v10 = 0.0;
  BOOL v11 = v9 > 0.0 && v9 < 1.0;
  float v12 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  float v15 = 0.0;
  float v16 = 0.0;
  if (v11)
  {
    float v17 = (sinf((float)(v9 + -0.5) * 3.1416) + 1.0) * 0.5;
    float v18 = v17 * 1.5708;
    __float2 v19 = __sincosf_stret(v17 * 1.5708);
    float v16 = -v19.__sinval;
    float v15 = -(float)(v19.__cosval + -1.0);
    float v20 = v18 + -1.5708;
    __float2 v21 = __sincosf_stret(v18 + -1.5708);
    float v10 = -v21.__sinval;
    float v13 = -(float)(v21.__cosval + -1.0);
    float v14 = v18 * 57.296;
    float v12 = v20 * 57.296;
  }

  mSourceLayer = self->super.mSourceLayer;
  if (mSourceLayer)
  {
    v23 = -[MRLayer renderingState](mSourceLayer, "renderingState");
    if (v23)
    {
      v23->var15 = 1;
      v23->var2 = v16;
      v23->var4 = v15;
      v23->var7 = 0.0;
      v23->var8 = v14;
      v23->var9 = 0.0;
    }
  }

  mTargetLayer = self->super.mTargetLayer;
  if (mTargetLayer)
  {
    v25 = -[MRLayer renderingState](mTargetLayer, "renderingState");
    if (v25)
    {
      v25->var15 = 1;
      v25->var2 = v10;
      v25->var4 = v13;
      v25->var7 = 0.0;
      v25->var8 = v12;
      v25->var9 = 0.0;
    }
  }

  [a4 cull:2];
  else {
    v26 = @"PlainTexture";
  }
  [a4 setShader:v26];
  -[MRImageProvider imageAspectRatio](self->mWallProvider, "imageAspectRatio");
  double v28 = v27 + v27;
  [a4 localAspectRatio];
  double v30 = v28 / v29;
  id v31 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mWallProvider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  v32 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  -[MRCroppingSprite setInnerRect:](v32, "setInnerRect:", 0.0, 0.100000001, 1.0, 0.800000012);
  LODWORD(v33) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v32,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v31,  a4,  v30 * -0.5,  0.0,  v30,  2.0,  v33);
  LODWORD(v34) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v32,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v31,  a4,  v30 * 0.5,  0.0,  v30,  2.0,  v34);

  [v31 releaseByUser];
  id v35 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mGradientProvider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  if (self->super.mSourceLayer)
  {
    *(float *)&double v36 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v39, v14, 0.0, 0.0);
    float v40 = v16;
    int v41 = 0;
    float v42 = v15;
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v39, v43, v36);
    [a4 blend:2];
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v35,  a4,  0.889999986,  0.0,  0.219999999,  3.0);
    [a4 blend:0];
    [a4 unsetShader];
    [a4 restoreModelViewMatrix:v43];
    v37 = self->super.mSourceLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](v37, "clock"), "externalTime");
    -[MRLayer renderAtTime:inContext:withArguments:](v37, "renderAtTime:inContext:withArguments:", a4, a5);
  }

  v38 = self->super.mTargetLayer;
  if (v38)
  {
    -[MRLayerClock externalTime](-[MRLayer clock](v38, "clock"), "externalTime");
    -[MRLayer renderAtTime:inContext:withArguments:](v38, "renderAtTime:inContext:withArguments:", a4, a5);
  }

  [a4 unsetShader];
  [v35 releaseByUser];
  [a4 cull:0];
}

- (void)unload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionReverseCube;
  -[MRTransition unload](&v3, "unload");
}

@end