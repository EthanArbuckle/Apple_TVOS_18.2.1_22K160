@interface MREffectOrigami
+ (BOOL)hasCustomTiming;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (void)initialize;
- (BOOL)_checkPanoramaAbsoluteSizeForImage:(id)a3 inRect:(CGRect *)a4;
- (BOOL)_needsRenderingAtTime:(double)a3 remainingStillDurationAfter:(double *)a4;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)getVerticesCoordinates:(MREffectOrigami *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectOrigami)initWithEffectID:(id)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (id)_retainedByUserBackColorImageInContext:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_cleanup;
- (void)_cleanupSwingTimings;
- (void)_renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)_renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)_setTargetSizeOfImageProviders;
- (void)_setupBreakInfos:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setupSwingTimings;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)render1To3DownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)render1To3LeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderBreakAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFall2AtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFallAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFallBreakAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFlipDiagonalAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFlipDownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFlipLeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFold4LeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFoldDownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderFoldLeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderStillAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderUnfoldingFlowerAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)updateSizes;
@end

@implementation MREffectOrigami

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectOrigami;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0668) {
    qword_2B0668 = -[NSDictionary initWithContentsOfFile:]( [NSDictionary alloc],  "initWithContentsOfFile:",  objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "resourcePathForStyleID:",  @"Origami"),  "stringByAppendingPathComponent:",  @"MREffectOrigami.plist"));
  }
}

- (MREffectOrigami)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectOrigami;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 193) = 0LL;
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3[255] = objc_msgSend( objc_msgSend( objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "descriptionForEffectID:",  *((void *)v3 + 4)),  "objectForKey:",  @"orientation"),  "isEqualToString:",  @"landscape");
    v3[253] = [*((id *)v3 + 4) hasPrefix:@"Origami2"];
    *(_DWORD *)(v3 + 233) = -1082130432;
    v6[0] = xmmword_1F7F30;
    v6[1] = xmmword_1F7D70;
    *(void *)(v3 + 257) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v6);
    [v3 _setupSwingTimings];
    *(void *)(v3 + 305) = malloc(0x80uLL);
    *(void *)(v3 + 313) = 0LL;
    *(void *)(v3 + 321) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return (MREffectOrigami *)v3;
}

- (void)_cleanup
{
  *(unint64_t *)((char *)&self->mTotalNumberOfFolds + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mSpriteKeysWatcher + 1) = 0LL;
  *(NSArray **)((char *)&self->mAnimationTimeBounds + 1) = 0LL;

  *(void *)((char *)&self->mPixelUnit + 1) = 0LL;
  v3 = *(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingBottom + 1);
  if (v3)
  {
    free(v3);
    *(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingBottom + 1) = 0LL;
  }

  -[MREffectOrigami _cleanupSwingTimings](self, "_cleanupSwingTimings");
}

- (void)_unload
{
  v3 = *(void **)((char *)&self->mDurationStretchFactor + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(double *)((char *)&self->mDurationStretchFactor + 1) = 0.0;
  }

  *(_DWORD *)((char *)&self->mBackColorImage + 1) = -1082130432;
}

- (void)_setupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = (MRCAMLBezierData *)-[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  0LL);
  *(MROrigamiAnimationPath **)((char *)&self->mLittleSwing + 1) = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  1LL);
  *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  2LL);
  *(MROrigamiAnimationPath **)((char *)&self->mSideSwing + 1) = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  3LL);
  *(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingTop + 1) = -[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  4LL);
}

- (void)_cleanupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = 0LL;

  *(MROrigamiAnimationPath **)((char *)&self->mLittleSwing + 1) = 0LL;
  *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = 0LL;

  *(MROrigamiAnimationPath **)((char *)&self->mSideSwing + 1) = 0LL;
  *(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingTop + 1) = 0LL;
}

- (void)_setTargetSizeOfImageProviders
{
  if (-[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami-JustASlide"))
  {
    double width = self->super.mPixelSize.width;
    double height = self->super.mPixelSize.height;
LABEL_3:
    p_mEffectLayer = &self->super.mEffectLayer;
    v6 = @"image0";
LABEL_30:
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v6),  "setDefaultSize:",  width,  height);
    return;
  }

  mEffectID = self->super.mEffectID;
  if (!BYTE1(self->mDescriptionAspectRatio))
  {
    if (-[NSString isEqualToString:](mEffectID, "isEqualToString:", @"Origami1"))
    {
      CGFloat v8 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v8 * 0.833333313,  v8 * 0.5);
      CGFloat v9 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v9 * 1.33333337,  v9 * 0.833333313);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 0.5,  self->super.mPixelSize.width * 0.5 * 0.5);
      CGFloat v10 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v10 * 0.666666687,  v10 * 1.33333337);
      CGFloat v11 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v11 * 1.33333337,  v11 * 0.833333313);
      CGFloat v12 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  v12 * 0.666666687,  v12 * 0.5);
      CGFloat v13 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image6"),  "setDefaultSize:",  v13 * 0.666666687,  v13 * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image7"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 1.33333337,  self->super.mPixelSize.width * 0.5 * 1.33333337);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image8"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 0.666666687,  self->super.mPixelSize.width * 0.5 * 0.666666687);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image9"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 0.666666687,  self->super.mPixelSize.width * 0.5 * 0.666666687);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image10"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 1.33333337,  self->super.mPixelSize.width * 0.5 * 1.33333337);
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2"))
    {
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5 * 1.33333337,  self->super.mPixelSize.width * 0.5 * 1.33333337);
      CGFloat v14 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v14 * 0.666666687,  v14 * 1.33333337);
      CGFloat v15 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v15 * 0.666666687,  v15 * 0.444444448);
      CGFloat v16 = self->super.mPixelSize.width * 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v16 * 0.666666687,  v16 * 0.444444448);
      CGFloat v17 = self->super.mPixelSize.width * 0.5;
      double width = v17 * 0.666666687;
      double height = v17 * 0.444444448;
LABEL_12:
      v6 = @"image4";
      goto LABEL_30;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3"))
    {
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
      double v24 = self->super.mPixelSize.height;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width - v24 * 0.5,  v24 * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height * 0.5);
      double v25 = self->super.mPixelSize.height;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width - v25,  v25 * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
      double v26 = self->super.mPixelSize.height;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.width - v26,  v26 * 0.5);
      double v27 = self->super.mPixelSize.height;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image6"),  "setDefaultSize:",  self->super.mPixelSize.width - v27,  v27 * 0.5);
      double width = self->super.mPixelSize.height;
      goto LABEL_17;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami4"))
    {
      double v28 = 0.5;
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.75,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
      double v29 = self->super.mPixelSize.height;
      double width = self->super.mPixelSize.width * 0.25;
LABEL_23:
      double height = v29 * v28;
LABEL_24:
      v6 = @"image6";
      goto LABEL_30;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V2"))
    {
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.5);
      double width = self->super.mPixelSize.width;
      double height = self->super.mPixelSize.height * 0.5;
      goto LABEL_29;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V3"))
    {
      double v31 = 0.5;
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
      double v32 = self->super.mPixelSize.height;
      double width = self->super.mPixelSize.width * 0.5;
      goto LABEL_35;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V4"))
    {
      p_mPixelSize = &self->super.mPixelSize;
      double v41 = 0.5;
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
      double v42 = self->super.mPixelSize.height;
      double v43 = self->super.mPixelSize.width * 0.5;
      double v44 = 0.25;
LABEL_41:
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v43,  v42 * v44);
      double width = p_mPixelSize->width * v41;
      double height = p_mPixelSize->height * v44;
      goto LABEL_20;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V5"))
    {
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.333333343);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.666666687);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.333333343);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.333333343);
      double width = self->super.mPixelSize.width * 0.666666687;
      double height = self->super.mPixelSize.height * 0.666666687;
      goto LABEL_12;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V6"))
    {
      v49 = &self->super.mPixelSize;
      double v50 = 0.5;
      double v51 = 0.25;
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.25);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.25);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.width);
      double v52 = self->super.mPixelSize.width;
    }

    else
    {
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V7"))
      {
        p_mEffectLayer = &self->super.mEffectLayer;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.25);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.25);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.25);
        double width = self->super.mPixelSize.width * 0.333333343;
        double height = self->super.mPixelSize.height * 0.25;
        goto LABEL_24;
      }

      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V8"))
      {
        p_mEffectLayer = &self->super.mEffectLayer;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height - self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height - self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height - self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height - self->super.mPixelSize.width);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image6"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height - self->super.mPixelSize.width);
        double width = self->super.mPixelSize.width * 0.333333343;
        double height = self->super.mPixelSize.height - self->super.mPixelSize.width;
        v6 = @"image7";
        goto LABEL_30;
      }

      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H4"))
      {
        p_mEffectLayer = &self->super.mEffectLayer;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
        double width = self->super.mPixelSize.width * 0.5;
        double height = self->super.mPixelSize.height * 0.5;
        goto LABEL_53;
      }

      if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H6"))
      {
        if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H7"))
        {
          if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H8")) {
            return;
          }
          p_mEffectLayer = &self->super.mEffectLayer;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image6"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
          double width = self->super.mPixelSize.height * 0.5;
LABEL_17:
          v6 = @"image7";
          double height = width;
          goto LABEL_30;
        }

        double v64 = self->super.mPixelSize.height;
        double v28 = 0.5;
        p_mEffectLayer = &self->super.mEffectLayer;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width - v64 * 0.5,  v64 * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
        double v65 = self->super.mPixelSize.height;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width - v65,  v65 * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height * 0.5);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
        double v66 = self->super.mPixelSize.height;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  self->super.mPixelSize.width - v66,  v66 * 0.5);
        double v29 = self->super.mPixelSize.height;
        double width = self->super.mPixelSize.width - v29;
        goto LABEL_23;
      }

      v49 = &self->super.mPixelSize;
      double v50 = 0.25;
      double v51 = 0.5;
      p_mEffectLayer = &self->super.mEffectLayer;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
      double v52 = self->super.mPixelSize.height;
    }

    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v52,  v52);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v49->width * v50,  v49->height * v51);
    double width = v49->width * v50;
    double height = v49->height * v51;
LABEL_53:
    v6 = @"image5";
    goto LABEL_30;
  }

  if (-[NSString isEqualToString:](mEffectID, "isEqualToString:", @"Origami2-LS1"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
    double height = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width - height;
LABEL_7:
    v6 = @"image2";
    goto LABEL_30;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS2"))
  {
    v18 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
    double v19 = self->super.mPixelSize.height;
    CGFloat v20 = self->super.mPixelSize.width - v19;
    double v21 = v19 * 0.5;
    v22 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    v6 = @"image2";
    objc_msgSend(-[NSDictionary objectForKey:](v22, "objectForKey:", @"image2"), "setDefaultSize:", v20, v21);
    double v23 = v18->height;
    double width = v18->width - v23 * 0.5;
    double height = v23 * 0.5;
    goto LABEL_30;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS3"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.height * 0.5,  self->super.mPixelSize.height * 0.5);
    double height = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width - height;
LABEL_20:
    v6 = @"image3";
    goto LABEL_30;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS4"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
    double height = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width - height;
LABEL_29:
    v6 = @"image1";
    goto LABEL_30;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS5"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.height,  self->super.mPixelSize.height);
    double v30 = self->super.mPixelSize.height;
    double v31 = 0.5;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width - v30,  v30 * 0.5);
    double v32 = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width - v32;
LABEL_35:
    double height = v32 * v31;
    goto LABEL_7;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT1"))
  {
    v33 = &self->super.mPixelSize;
    double v34 = 0.333333343;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height);
    CGFloat v35 = self->super.mPixelSize.height;
    CGFloat v36 = self->super.mPixelSize.width * 0.333333343;
    id v37 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1");
    double v38 = v36;
    double v39 = v35;
LABEL_38:
    objc_msgSend(v37, "setDefaultSize:", v38, v39);
    double height = v33->height;
    double width = v33->width * v34;
    goto LABEL_7;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT2"))
  {
    v45 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height);
    double v46 = 0.666666687;
LABEL_44:
    double height = v45->height;
    double width = v45->width * v46;
    goto LABEL_29;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT3"))
  {
    v47 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    double v48 = 0.666666687;
LABEL_49:
    double height = v47->height;
    double width = v47->width * v48;
    goto LABEL_7;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT4"))
  {
    v53 = &self->super.mPixelSize;
    double v54 = 0.333333343;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    double v55 = self->super.mPixelSize.width * 0.666666687;
    double v56 = self->super.mPixelSize.height * 0.5;
LABEL_56:
    id v57 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2");
    double v58 = v55;
    double v59 = v56;
LABEL_61:
    objc_msgSend(v57, "setDefaultSize:", v58, v59);
    double height = v53->height;
    double width = v53->width * v54;
    goto LABEL_20;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT5"))
  {
    v53 = &self->super.mPixelSize;
    double v54 = 0.333333343;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    CGFloat v60 = self->super.mPixelSize.height;
    CGFloat v61 = self->super.mPixelSize.width * 0.333333343;
    id v57 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2");
    double v58 = v61;
    double v59 = v60;
    goto LABEL_61;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT6"))
  {
    v62 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.333333343);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.333333343);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.333333343);
    double v63 = 0.666666687;
LABEL_66:
    double height = v62->height;
    double width = v62->width * v63;
    goto LABEL_20;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT7"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height * 0.5);
    double width = self->super.mPixelSize.width * 0.666666687;
    double height = self->super.mPixelSize.height * 0.5;
    goto LABEL_7;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT8"))
  {
    p_mPixelSize = &self->super.mPixelSize;
    double v41 = 0.333333343;
    double v44 = 0.5;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.333333343,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height * 0.5);
    double v42 = self->super.mPixelSize.height;
    double v43 = self->super.mPixelSize.width * 0.666666687;
    goto LABEL_41;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ1"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
    double height = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width * 0.5;
    goto LABEL_29;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ2"))
  {
    v33 = &self->super.mPixelSize;
    double v34 = 0.5;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
    CGFloat v67 = self->super.mPixelSize.width * 0.5;
    CGFloat v68 = self->super.mPixelSize.height * 0.5;
    id v37 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1");
    double v38 = v67;
    double v39 = v68;
    goto LABEL_38;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ3"))
  {
    v53 = &self->super.mPixelSize;
    double v54 = 0.5;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
    double v55 = self->super.mPixelSize.width * 0.5;
    double v56 = self->super.mPixelSize.height * 0.5;
    goto LABEL_56;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ4"))
  {
    v47 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.5);
    double v48 = 0.75;
    goto LABEL_49;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ5"))
  {
    v62 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.333333343);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.333333343);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.25,  self->super.mPixelSize.height * 0.333333343);
    double v63 = 0.75;
    goto LABEL_66;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ6"))
  {
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.5);
    double width = self->super.mPixelSize.width * 0.5;
    double height = self->super.mPixelSize.height * 0.5;
    goto LABEL_20;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-Intro-P1"))
  {
    double height = self->super.mPixelSize.height;
    double width = self->super.mPixelSize.width * 0.333333343;
    goto LABEL_3;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-Intro-LP1"))
  {
    v45 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height);
    double v46 = 0.333333343;
    goto LABEL_44;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-Intro-L3"))
  {
    v69 = &self->super.mPixelSize;
    p_mEffectLayer = &self->super.mEffectLayer;
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.666666687,  self->super.mPixelSize.height);
    CGFloat v70 = self->super.mPixelSize.width * 0.333333343;
    CGFloat v71 = self->super.mPixelSize.height * 0.5;
    v72 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    v6 = @"image1";
    objc_msgSend(-[NSDictionary objectForKey:](v72, "objectForKey:", @"image1"), "setDefaultSize:", v70, v71);
    double width = v69->width * 0.333333343;
    double height = v69->height * 0.5;
    goto LABEL_30;
  }

- (void)setPixelSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectOrigami;
  -[MREffect setPixelSize:](&v4, "setPixelSize:", a3.width, a3.height);
  BYTE2(self->mDescriptionAspectRatio) = self->super.mPixelSize.width >= self->super.mPixelSize.height;
  BYTE2(self->mDescriptionAspectRatio) = HIBYTE(self->mDescriptionAspectRatio);
  BYTE1(self->_offsetsForTransitions) = 1;
}

- (void)updateSizes
{
  BYTE1(self->_offsetsForTransitions) = 0;
  -[MREffectOrigami setPhaseInDuration:mainDuration:phaseOutDuration:]( self,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->super.mPhaseInDuration,  self->super.mMainDuration,  self->super.mPhaseOutDuration);
  BOOL v3 = BYTE2(self->mDescriptionAspectRatio) == HIBYTE(self->mDescriptionAspectRatio);
  p_mEffectLayer = &self->super.mEffectLayer;
  int v5 = v3 ^ (objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "imageSizeScript") != 0);
  if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") <= 2) {
    unsigned int v6 = -[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami2");
  }
  else {
    unsigned int v6 = 1;
  }
  if ((v5 & v6) != 1) {
    return;
  }
  if (HIBYTE(self->mDescriptionAspectRatio) != BYTE2(self->mDescriptionAspectRatio))
  {
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    CGFloat v13 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs", 0LL),  "objectEnumerator");
    id v14 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v90,  v98,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v91;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v91 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * (void)i) setImageSizeScript:0];
        }

        id v15 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v90,  v98,  16LL);
      }

      while (v15);
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V3"))
    {
      p_mPixelSize = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  p_mPixelSize->width * 0.75,  p_mPixelSize->height);
      double v19 = 0.25;
      double height = p_mPixelSize->height;
      double v21 = p_mPixelSize->width * 0.25;
      double v22 = 0.5;
LABEL_23:
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v21,  height * v22);
      double v23 = p_mPixelSize->height;
      double width = p_mPixelSize->width * v19;
LABEL_24:
      double v25 = v23 * v22;
LABEL_25:
      double v26 = @"image2";
LABEL_43:
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v26),  "setDefaultSize:",  width,  v25);
      return;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V4"))
    {
      double v27 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v27->width * 0.75,  v27->height);
      double v28 = 0.25;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v27->width * 0.25,  v27->height * 0.5);
      double v29 = v27->width * 0.25;
      double v30 = v27->height * 0.25;
LABEL_28:
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v29,  v30);
      double width = v27->width * v28;
      double v25 = v27->height * v28;
LABEL_29:
      double v26 = @"image3";
      goto LABEL_43;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V5"))
    {
      double v31 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v31->width * 0.333333343,  v31->height);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v31->width * 0.333333343,  v31->height);
      double v25 = v31->height;
      double width = v31->width * 0.333333343;
LABEL_32:
      double v26 = @"image4";
      goto LABEL_43;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V6"))
    {
      double v32 = &self->super.mPixelSize;
      double v33 = 0.5;
      CGFloat v34 = v32->height;
      double v35 = v32->width * 0.5;
      id v36 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3");
      double v37 = v35;
      double v38 = v34;
LABEL_35:
      objc_msgSend(v36, "setDefaultSize:", v37, v38);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v32->width * v33,  v32->height * v33);
      double width = v32->width * v33;
      double v25 = v32->height * v33;
LABEL_36:
      double v26 = @"image5";
      goto LABEL_43;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V7"))
    {
      double v39 = &self->super.mPixelSize;
      double v40 = 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v39->width,  v39->height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v39->width * 0.333333343,  v39->height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  v39->width * 0.333333343,  v39->height * 0.5);
      double v41 = v39->height;
      double width = v39->width * 0.333333343;
LABEL_39:
      double v25 = v41 * v40;
      double v26 = @"image6";
      goto LABEL_43;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-V8"))
    {
      double v42 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v42->width * 0.75,  v42->height);
      double v43 = 0.25;
      double v44 = v42->height;
      double v45 = v42->width * 0.25;
      double v46 = 0.333333343;
LABEL_42:
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  v45,  v44 * v46);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image6"),  "setDefaultSize:",  v42->width * v43,  v42->height * v46);
      double width = v42->width * v43;
      double v25 = v42->height * v46;
      double v26 = @"image7";
      goto LABEL_43;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H3")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H3b"))
    {
      p_mPixelSize = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  p_mPixelSize->width,  p_mPixelSize->height * 0.75);
      double v19 = 0.5;
      double height = p_mPixelSize->height;
      double v21 = p_mPixelSize->width * 0.5;
      double v22 = 0.25;
      goto LABEL_23;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H3c")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H3d"))
    {
      v47 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v47->width,  v47->height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v47->width * 0.5,  v47->height * 0.5);
      double width = v47->width * 0.5;
      double v25 = v47->height * 0.5;
      goto LABEL_25;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H4"))
    {
      double v48 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v48->width,  v48->height * 0.5);
      double width = v48->width;
      double v25 = v48->height * 0.5;
      goto LABEL_36;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H4a"))
    {
      v49 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v49->width * 0.5,  v49->height * 0.333333343);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v49->width * 0.5,  v49->height * 0.333333343);
      double width = v49->width;
      double v25 = v49->height * 0.666666687;
      goto LABEL_29;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H5"))
    {
      double v50 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v50->width,  v50->height * 0.75);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v50->width * 0.333333343,  v50->height * 0.25);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v50->width * 0.333333343,  v50->height * 0.25);
      double width = v50->width * 0.333333343;
      double v25 = v50->height * 0.25;
      goto LABEL_32;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H6"))
    {
      double v32 = &self->super.mPixelSize;
      double v51 = v32->width;
      double v33 = 0.5;
      double v52 = v32->height * 0.5;
      id v36 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3");
      double v37 = v51;
      double v38 = v52;
      goto LABEL_35;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H6a")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H6b"))
    {
      v53 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v53->width,  v53->height * 0.666666687);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v53->width * 0.5,  v53->height * 0.333333343);
      double width = v53->width * 0.5;
      double v25 = v53->height * 0.333333343;
      goto LABEL_36;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H7"))
    {
      double v54 = &self->super.mPixelSize;
      double v40 = 0.5;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v54->width,  v54->height * 0.5);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image5"),  "setDefaultSize:",  v54->width * 0.5,  v54->height * 0.5);
      double v41 = v54->height;
      double width = v54->width * 0.5;
      goto LABEL_39;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-H8"))
    {
      double v42 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image4"),  "setDefaultSize:",  v42->width,  v42->height * 0.75);
      double v43 = 0.333333343;
      double v44 = v42->height;
      double v45 = v42->width * 0.333333343;
      double v46 = 0.25;
      goto LABEL_42;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-L1")) {
      goto LABEL_67;
    }
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-P1"))
    {
      double v25 = self->super.mPixelSize.height;
      double width = self->super.mPixelSize.width * 0.333333343;
      goto LABEL_73;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-L2")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-P2"))
    {
LABEL_72:
      double width = self->super.mPixelSize.width;
      double v25 = self->super.mPixelSize.height;
      goto LABEL_73;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS1"))
    {
      double v55 = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v55->width * 0.5,  v55->height * 0.333333343);
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v55->width * 0.5,  v55->height * 0.333333343);
      double width = v55->width;
      double v25 = v55->height * 0.666666687;
      goto LABEL_25;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS2")) {
      goto LABEL_77;
    }
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS3")) {
      goto LABEL_80;
    }
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS4")) {
      goto LABEL_83;
    }
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS5")) {
      goto LABEL_77;
    }
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT1"))
    {
LABEL_87:
      p_mPixelSize = &self->super.mPixelSize;
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  p_mPixelSize->width,  p_mPixelSize->height * 0.666666687);
      double v19 = 0.5;
      double height = p_mPixelSize->height;
      double v21 = p_mPixelSize->width * 0.5;
      double v22 = 0.333333343;
      goto LABEL_23;
    }

    if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT2"))
    {
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT3")) {
        goto LABEL_77;
      }
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT4")
        || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT5"))
      {
        double v27 = &self->super.mPixelSize;
        double v28 = 0.5;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v27->width * 0.5,  v27->height * 0.25);
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v27->width,  v27->height * 0.5);
        double v29 = v27->width * 0.5;
        double v30 = v27->height * 0.25;
        goto LABEL_28;
      }

      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT6")) {
        goto LABEL_80;
      }
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT7")) {
        goto LABEL_87;
      }
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT8"))
      {
LABEL_80:
        double v59 = &self->super.mPixelSize;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v59->width,  v59->height * 0.25);
        double v60 = 0.5;
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v59->width * 0.5,  v59->height * 0.25);
        double v61 = v59->width * 0.5;
        double v62 = v59->height * 0.25;
        double v63 = -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs");
        double v64 = @"image2";
LABEL_81:
        objc_msgSend(-[NSDictionary objectForKey:](v63, "objectForKey:", v64), "setDefaultSize:", v61, v62);
        double width = v59->width;
        double v25 = v59->height * v60;
        goto LABEL_29;
      }

      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LT9")) {
        goto LABEL_77;
      }
      if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ1"))
      {
        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ2")) {
          goto LABEL_87;
        }
        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ3"))
        {
          double v59 = &self->super.mPixelSize;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v59->width,  v59->height * 0.25);
          double v60 = 0.5;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v59->width * 0.5,  v59->height * 0.25);
          double v61 = v59->width * 0.5;
          double v62 = v59->height * 0.25;
          double v63 = -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs");
          double v64 = @"image1";
          goto LABEL_81;
        }

        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ4"))
        {
          double v66 = &self->super.mPixelSize;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v66->width,  v66->height * 0.5);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v66->width * 0.5,  v66->height * 0.5);
          double width = v66->width * 0.5;
          double v25 = v66->height * 0.5;
          goto LABEL_84;
        }

        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ5"))
        {
          CGFloat v67 = &self->super.mPixelSize;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.25);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height * 0.25);
          CGFloat v68 = self->super.mPixelSize.width * 0.5;
          CGFloat v69 = self->super.mPixelSize.height * 0.25;
          double v26 = @"image2";
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v68,  v69);
          double width = v67->width * 0.5;
          double v25 = v67->height * 0.5;
          goto LABEL_43;
        }

        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LQ6"))
        {
          CGFloat v70 = &self->super.mPixelSize;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v70->width,  v70->height * 0.25);
          double v71 = 0.5;
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v70->width * 0.5,  v70->height * 0.25);
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v70->width * 0.5,  v70->height * 0.25);
          double v72 = v70->height;
          double width = v70->width * 0.5;
LABEL_107:
          double v25 = v72 * v71;
          goto LABEL_29;
        }

        if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LS1S4")
          && !-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LP1"))
        {
          if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LP2"))
          {
            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LP3"))
            {
              v73 = &self->super.mPixelSize;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "setDefaultSize:",  v73->width,  v73->height * 0.25);
              double v22 = 0.5;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v73->width * 0.5,  v73->height * 0.25);
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v73->width * 0.5,  v73->height * 0.25);
              double v23 = v73->height;
              double width = v73->width * 0.5;
              goto LABEL_24;
            }

            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LP4"))
            {
LABEL_114:
              v74 = &self->super.mPixelSize;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v74->width,  v74->height * 0.666666687);
              double width = v74->width;
              double v25 = v74->height * 0.333333343;
              goto LABEL_84;
            }

            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PS1")) {
              goto LABEL_72;
            }
            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PS2"))
            {
              v75 = &self->super.mPixelSize;
              double v76 = 0.5;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v75->width * 0.5,  v75->height * 0.5);
              double v77 = v75->width * 0.5;
              double v78 = v75->height * 0.5;
              id v79 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1");
              double v80 = v77;
              double v81 = v78;
LABEL_118:
              objc_msgSend(v79, "setDefaultSize:", v80, v81);
              double v25 = v75->height;
              double width = v75->width * v76;
              goto LABEL_25;
            }

            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PS3"))
            {
              v82 = &self->super.mPixelSize;
              double v71 = 0.5;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v82->width * 0.333333343,  v82->height * 0.5);
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v82->width * 0.666666687,  v82->height * 0.5);
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v82->width * 0.666666687,  v82->height * 0.5);
              double v72 = v82->height;
              double width = v82->width * 0.333333343;
              goto LABEL_107;
            }

            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PT1"))
            {
              v83 = &self->super.mPixelSize;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v83->width * 0.333333343,  v83->height * 0.5);
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v83->width * 0.333333343,  v83->height * 0.5);
              double v25 = v83->height;
              double width = v83->width * 0.666666687;
              goto LABEL_25;
            }

            if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PT2"))
            {
LABEL_124:
              v84 = &self->super.mPixelSize;
              objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v84->width * 0.5,  v84->height);
              double v25 = v84->height;
              double width = v84->width * 0.5;
              goto LABEL_84;
            }

            if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PT3"))
            {
              if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PQ1")) {
                goto LABEL_124;
              }
              if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PQ2"))
              {
                if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PQ3"))
                {
                  v85 = &self->super.mPixelSize;
                  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v85->width * 0.333333343,  v85->height * 0.5);
                  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v85->width * 0.333333343,  v85->height * 0.5);
                  double v86 = v85->height;
                  double v87 = v85->width * 0.666666687;
                  goto LABEL_135;
                }

                if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PP1")) {
                  goto LABEL_124;
                }
                if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PP2"))
                {
                  if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-PP3"))
                  {
                    if (-[NSString isEqualToString:]( self->super.mEffectID,  "isEqualToString:",  @"Origami2-Intro-L1"))
                    {
LABEL_67:
                      double width = self->super.mPixelSize.width;
                      double v25 = self->super.mPixelSize.height * 0.333333343;
LABEL_73:
                      double v26 = @"image0";
                      goto LABEL_43;
                    }

                    if (!-[NSString isEqualToString:]( self->super.mEffectID,  "isEqualToString:",  @"Origami2-Intro-LP1"))
                    {
                      if (!-[NSString isEqualToString:]( self->super.mEffectID,  "isEqualToString:",  @"Origami2-Intro-L3")) {
                        return;
                      }
                      double v56 = &self->super.mPixelSize;
                      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v56->width,  v56->height * 0.666666687);
                      double v58 = v56->width;
                      double v57 = v56->height;
                      goto LABEL_78;
                    }

                    goto LABEL_114;
                  }

                  v85 = &self->super.mPixelSize;
                  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "setDefaultSize:",  v85->width * 0.333333343,  v85->height * 0.5);
                  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "setDefaultSize:",  v85->width * 0.333333343,  v85->height * 0.5);
                  double v86 = v85->height;
                  double v87 = v85->width * 0.333333343;
LABEL_135:
                  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v87,  v86);
                  double v25 = v85->height;
                  double width = v85->width * 0.333333343;
                  goto LABEL_29;
                }
              }
            }

            v75 = &self->super.mPixelSize;
            double v76 = 0.333333343;
            objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "setDefaultSize:",  v75->width * 0.333333343,  v75->height);
            CGFloat v88 = v75->height;
            double v89 = v75->width * 0.333333343;
            id v79 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](*p_mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1");
            double v80 = v89;
            double v81 = v88;
            goto LABEL_118;
          }

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  id v8 = -[MREffectOrigamiTiming initWithEffectID:]( objc_alloc(&OBJC_CLASS___MREffectOrigamiTiming),  "initWithEffectID:",  a3);
  id v9 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
  [v9 defaultPhaseInDurationForEffectID:a3];
  double v11 = v10;
  [v9 defaultMainDurationForEffectID:a3];
  double v13 = v12;
  [v9 defaultPhaseOutDurationForEffectID:a3];
  -[MREffectOrigamiTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( v8,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v11,  v13,  v14);
  return v8;
}

- (id)_retainedByUserBackColorImageInContext:(id)a3
{
  int v5 = [a3 backColor];
  id v7 = *(void **)((char *)&self->mDurationStretchFactor + 1);
  if (v7)
  {
    LODWORD(v6) = *v5;
    if (*(float *)v5 == *(float *)((char *)&self->mBackColorImage + 1))
    {
      LODWORD(v6) = v5[1];
      if (*(float *)&v6 == *(float *)((char *)&self->mBackColorImage + 5))
      {
        LODWORD(v6) = v5[2];
      }
    }

    objc_msgSend(v7, "releaseByUser", v6);
  }

  LODWORD(v6) = *v5;
  if (*(float *)v5 <= 0.0 && (LODWORD(v6) = v5[1], *(float *)&v6 <= 0.0) && (LODWORD(v6) = v5[2], *(float *)&v6 <= 0.0))
  {
    *(void *)((char *)&self->mDurationStretchFactor + 1) = [a3 retainedByUserBlackImage];
  }

  else
  {
    id v8 = objc_msgSend(objc_msgSend(a3, "imageManager", v6), "retainedByUserImageWithSize:andColor:", v5, 1.0, 1.0);
    *(void *)((char *)&self->mDurationStretchFactor + 1) = v8;
    [v8 setLabel:@"Marimba Origami Background"];
    [*(id *)((char *)&self->mDurationStretchFactor + 1) setClampMode:2];
  }

  *(_DWORD *)((char *)&self->mBackColorImage + 1) = *v5;
  *(_DWORD *)((char *)&self->mBackColorImage + 5) = v5[1];
  *(float *)((char *)self->mBackColorForImage + 1) = (float)v5[2];
  id v7 = *(void **)((char *)&self->mDurationStretchFactor + 1);
  return [v7 retainByUser];
}

- (void)_setupBreakInfos:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v8 = v7;
  id v9 = [(id)qword_2B0668 objectForKey:self->super.mEffectID];
  double v10 = v9;
  if (HIBYTE(self->mDescriptionAspectRatio) != BYTE2(self->mDescriptionAspectRatio))
  {
    id v11 = objc_msgSend(objc_msgSend(v9, "objectAtIndex:", 0), "objectForKey:", @"fallback");
    if (v11) {
      double v10 = v11;
    }
  }

  uint64_t v12 = 0LL;
  double v13 = v8;
  double v14 = 1.77777778;
  if (!BYTE2(self->mDescriptionAspectRatio)) {
    double v14 = 0.5625;
  }
  double v15 = 1.33333333;
  if (!BYTE2(self->mDescriptionAspectRatio)) {
    double v15 = 0.75;
  }
  if (!BYTE1(self->mDescriptionAspectRatio)) {
    double v14 = v15;
  }
  float v16 = v14;
  *(float *)((char *)&self->mBackColorForImage[1] + 1) = v16;
  *($0AC6E346AE4835514AAA8AC86D8F4844 **)((char *)&self->mBreakInfos + 1) = 0LL;
  do
  {
    CGFloat v17 = &(&(*(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingBottom + 1))->super.isa)[v12];
    *CGFloat v17 = (Class)-1LL;
    v17[1] = (Class)-1LL;
    v12 += 2LL;
  }

  while (v12 != 16);
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v18 = [v10 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (!v18) {
    goto LABEL_53;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v70;
  BOOL v65 = 1;
  double v21 = 0.5;
  double v22 = 2.0;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v70 != v20) {
        objc_enumerationMutation(v10);
      }
      double v24 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
      if (objc_msgSend( objc_msgSend(v24, "objectForKey:", @"subEffectID"),  "isEqualToString:",  @"pstill"))
      {
        double v25 = v10;
        if ([v24 objectForKey:@"aspectRatio"])
        {
          objc_msgSend(objc_msgSend(v24, "objectForKey:", @"aspectRatio"), "floatValue");
          *(_DWORD *)((char *)&self->mBackColorForImage[1] + 1) = v26;
        }

        id v27 = [v24 objectForKey:@"attributes"];
        sscanf( (const char *)objc_msgSend(objc_msgSend(v24, "objectForKey:", @"rectangle"), "UTF8String"),  "{{%lf, %lf}, {%lf, %lf}}",  &v73,  &v74,  &v75,  &v76);
        if (BYTE1(self->mDescriptionAspectRatio))
        {
          double v28 = dbl_1FB9B0[BYTE2(self->mDescriptionAspectRatio) == 0];
          double v73 = (v73 + -432.0) * 0.00231481481;
          double v74 = (v74 + -432.0) * v28;
          double v75 = v75 * 0.00231481481;
          double v76 = v76 * v28;
        }

        int64_t v29 = (int)objc_msgSend( objc_msgSend( v27,  "objectForKey:",  @"slideIndex",  StretchRectangle( &v73,  (char)objc_msgSend(objc_msgSend(v24, "objectForKey:", @"stretchFlags"), "intValue"),  *(float *)((char *)&self->mBackColorForImage[1] + 1),  v13)),  "intValue");
        id v30 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v29)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
        if (v30)
        {
          double v31 = v30;
          [v30 aspectRatio];
          if (v32 < v21 || v32 > v22)
          {
            double v34 = v75 / v76;
            if (v32 >= 1.0 || v34 <= 1.0)
            {
              BOOL v36 = v32 > 1.0 && v34 < 1.0;
              if (!v36)
              {
                BOOL v36 = v32 < 1.0;
                double v37 = v32 / v34;
                double v38 = v34 / v32;
                if (!v36) {
                  double v38 = v37;
                }
                if (v38 >= 1.1)
                {
                  [v31 width];
                  double v40 = v39;
                  [v31 height];
                  double v42 = v41;
                  -[MREffectOrigami _checkPanoramaAbsoluteSizeForImage:inRect:]( self,  "_checkPanoramaAbsoluteSizeForImage:inRect:",  v31,  &v73);
                  float v43 = v75;
                  float v44 = v76;
                  if (v43 >= v44) {
                    float v45 = v76;
                  }
                  else {
                    float v45 = v75;
                  }
                  float v66 = v45;
                  BOOL v65 = v40 <= v42;
                  if (v40 <= v42)
                  {
                    [v31 height];
                    double v47 = v46;
                    [v31 width];
                    double v52 = v47 * v43 - v48 * v44;
                    [v31 width];
                  }

                  else
                  {
                    [v31 width];
                    double v50 = v49;
                    [v31 height];
                    double v52 = v50 * v44 - v51 * v43;
                    [v31 height];
                  }

                  double v54 = v52 / (v53 * v66);
                  float v55 = v54;
                  double v56 = (objc_class *)vcvtps_u32_f32(v55);
                  if (v54 <= 0.0) {
                    double v56 = 0LL;
                  }
                  (&(*(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingBottom + 1))->super.isa)[2 * v29] = v56;
                  *($0AC6E346AE4835514AAA8AC86D8F4844 **)((char *)&self->mBreakInfos + 1) = ($0AC6E346AE4835514AAA8AC86D8F4844 *)(*(char **)((char *)&self->mBreakInfos + 1) + (unint64_t)v56);
                  double v21 = 0.5;
                  double v22 = 2.0;
                }
              }
            }
          }

          [v31 releaseByUser];
        }

        double v10 = v25;
      }
    }

    id v19 = [v10 countByEnumeratingWithState:&v69 objects:v77 count:16];
  }

  while (v19);
  if (!v65)
  {
    uint64_t v61 = 0LL;
    uint64_t v62 = 0LL;
    uint64_t v63 = *(uint64_t *)((char *)&self->mThirdsSwingBottom + 1);
    do
    {
      uint64_t v64 = *(void *)(v63 + v61 + 112);
      if ((v64 & 0x8000000000000000LL) == 0)
      {
        *(void *)(v63 + v61 + 120) = v62;
        v62 += v64;
      }

      v61 -= 16LL;
    }

    while (v61 != -128);
  }

  else
  {
LABEL_53:
    uint64_t v57 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v59 = *(uint64_t *)((char *)&self->mThirdsSwingBottom + 1);
    do
    {
      uint64_t v60 = *(void *)(v59 + v57);
      if ((v60 & 0x8000000000000000LL) == 0)
      {
        *(void *)(v59 + v57 + 8) = v58;
        v58 += v60;
      }

      v57 += 16LL;
    }

    while (v57 != 128);
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectOrigami;
  uint64_t v11 = 0LL;
  unsigned int v7 = -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:", a4, a5);
  if (BYTE1(self->_offsetsForTransitions)) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  if (BYTE1(self->_offsetsForTransitions)) {
    -[MREffectOrigami updateSizes](self, "updateSizes");
  }
  if (-[MRLayer isActivated](self->super.mEffectLayer, "isActivated"))
  {
    if (a3 >= 0.0) {
      return v8 | -[MREffectOrigami _needsRenderingAtTime:remainingStillDurationAfter:]( self,  "_needsRenderingAtTime:remainingStillDurationAfter:",  &v11,  a3);
    }
  }

  else
  {
    [*(id *)((char *)&self->mTotalNumberOfFolds + 1) removeAllObjects];
  }

  return v8;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.0
    && self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration > a3
    && -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"))
  {
    float v8 = self->super.mPixelSize.width * 0.5;
    *(float *)((char *)&self->mBackColorForImage[2] + 1) = v8;
    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)+[NSMutableArray arrayWithArray:]( NSMutableArray,  "arrayWithArray:",  [*(id *)(&self->super._isInInteractiveMode + 1) allKeys]);
    [a4 localAspectRatio];
    double v10 = v9;
    double v11 = 2.0 / v9;
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami4"))
    {
      -[MREffectOrigami renderFold4LeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFold4LeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  0LL,  a3,  a3 / (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration),  -1.0,  v11 * -0.5,  2.0,  v11);
      goto LABEL_67;
    }

    if (-[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami-JustASlide"))
    {
      -[MREffectOrigami renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  0LL,  a3,  a3 / (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration),  -1.0,  v11 * -0.5,  2.0,  v11);
      goto LABEL_67;
    }

    -[MREffectOrigami _setupBreakInfos:inContext:withArguments:]( self,  "_setupBreakInfos:inContext:withArguments:",  a4,  a5,  a3);
    id v12 = [(id)qword_2B0668 objectForKey:self->super.mEffectID];
    double v13 = v12;
    if (HIBYTE(self->mDescriptionAspectRatio) != BYTE2(self->mDescriptionAspectRatio))
    {
      id v14 = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "objectForKey:", @"fallback");
      if (v14) {
        double v13 = v14;
      }
    }

    double v15 = 1.77777778;
    if (!BYTE2(self->mDescriptionAspectRatio)) {
      double v15 = 0.5625;
    }
    double v16 = 1.33333333;
    if (!BYTE2(self->mDescriptionAspectRatio)) {
      double v16 = 0.75;
    }
    if (!BYTE1(self->mDescriptionAspectRatio)) {
      double v15 = v16;
    }
    float v17 = v15;
    *(float *)((char *)&self->mBackColorForImage[1] + 1) = v17;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v18 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v18)
    {
      id v19 = v18;
      int v20 = 0;
      uint64_t v21 = *(void *)v45;
      do
      {
        double v22 = 0LL;
        do
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v13);
          }
          double v23 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v22);
          id v24 = [*(id *)((char *)&self->mAnimationTimeBounds + 1) objectAtIndex:(v20 + (_DWORD)v22)];
          objc_msgSend(objc_msgSend(v24, "objectForKey:", @"startTime"), "doubleValue");
          double v26 = v25;
          objc_msgSend(objc_msgSend(v24, "objectForKey:", @"endTime"), "doubleValue");
          double v28 = v27 - v26;
          double v29 = v26 + v27 - v26;
          if (v26 <= a3 && v29 > a3)
          {
            id v31 = v19;
            double v32 = v13;
            if (objc_msgSend(v23, "objectForKey:", @"aspectRatio", v29))
            {
              objc_msgSend(objc_msgSend(v23, "objectForKey:", @"aspectRatio"), "floatValue");
              *(_DWORD *)((char *)&self->mBackColorForImage[1] + 1) = v33;
            }

            id v34 = [v23 objectForKey:@"subEffectID"];
            id v43 = [v23 objectForKey:@"attributes"];
            sscanf( (const char *)objc_msgSend(objc_msgSend(v23, "objectForKey:", @"rectangle"), "UTF8String"),  "{{%lf, %lf}, {%lf, %lf}}",  &v48,  &v49,  &v50,  &v51);
            if (BYTE1(self->mDescriptionAspectRatio))
            {
              double v35 = dbl_1FB9B0[BYTE2(self->mDescriptionAspectRatio) == 0];
              double v48 = (v48 + -432.0) * 0.00231481481;
              double v49 = (v49 + -432.0) * v35;
              double v50 = v50 * 0.00231481481;
              double v51 = v51 * v35;
            }

            if (objc_msgSend( v34,  "isEqualToString:",  @"fall",  StretchRectangle( &v48,  (char)objc_msgSend( objc_msgSend(v23, "objectForKey:", @"stretchFlags"),  "intValue"),  *(float *)((char *)&self->mBackColorForImage[1] + 1),  v10)))
            {
              -[MREffectOrigami renderFallAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFallAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              goto LABEL_41;
            }

            if ([v34 isEqualToString:@"pfall"])
            {
              -[MREffectOrigami renderFallBreakAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFallBreakAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              goto LABEL_41;
            }

            if ([v34 isEqualToString:@"fall2"])
            {
              -[MREffectOrigami renderFall2AtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFall2AtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              goto LABEL_41;
            }

            if (objc_msgSend(objc_msgSend(v24, "objectForKey:", @"isStill"), "BOOLValue"))
            {
              -[MREffectOrigami renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              goto LABEL_41;
            }

            if ([v34 isEqualToString:@"pstill"])
            {
              -[MREffectOrigami renderBreakAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderBreakAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              goto LABEL_41;
            }

            if ([v34 isEqualToString:@"flip"])
            {
              id v36 = objc_msgSend( objc_msgSend(v23, "objectForKey:", @"attributes"),  "objectForKey:",  @"direction");
              double v13 = v32;
              if ([v36 isEqualToString:@"left"])
              {
                -[MREffectOrigami renderFlipLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFlipLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
                goto LABEL_42;
              }

              id v19 = v31;
              if ([v36 isEqualToString:@"down"])
              {
                -[MREffectOrigami renderFlipDownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFlipDownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              }

              else if ([v36 isEqualToString:@"right"])
              {
                double v41 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v43);
                -[NSMutableDictionary setObject:forKey:]( v41,  "setObject:forKey:",  [v43 objectForKey:@"recto"],  @"verso");
                -[NSMutableDictionary setObject:forKey:]( v41,  "setObject:forKey:",  [v43 objectForKey:@"verso"],  @"recto");
                -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", &__kCFBooleanTrue, @"invert");
                -[MREffectOrigami renderFlipLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFlipLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v41,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              }
            }

            else if ([v34 isEqualToString:@"fold"])
            {
              id v37 = objc_msgSend( objc_msgSend(v23, "objectForKey:", @"attributes"),  "objectForKey:",  @"direction");
              if ([v37 isEqualToString:@"left"])
              {
                -[MREffectOrigami renderFoldLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFoldLeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
                goto LABEL_41;
              }

              double v13 = v32;
              id v19 = v31;
              if ([v37 isEqualToString:@"down"]) {
                -[MREffectOrigami renderFoldDownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFoldDownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              }
            }

            else if ([v34 isEqualToString:@"1To3"])
            {
              id v38 = objc_msgSend( objc_msgSend(v23, "objectForKey:", @"attributes"),  "objectForKey:",  @"direction");
              if ([v38 isEqualToString:@"left"])
              {
                -[MREffectOrigami render1To3LeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "render1To3LeftAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
                goto LABEL_41;
              }

              double v13 = v32;
              id v19 = v31;
              if ([v38 isEqualToString:@"down"]) {
                -[MREffectOrigami render1To3DownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "render1To3DownAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              }
            }

            else
            {
              if ([v34 isEqualToString:@"flipDiagonal"])
              {
                -[MREffectOrigami renderFlipDiagonalAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderFlipDiagonalAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
LABEL_41:
                double v13 = v32;
LABEL_42:
                id v19 = v31;
                goto LABEL_43;
              }

              unsigned int v39 = [v34 isEqualToString:@"flower"];
              double v13 = v32;
              id v19 = v31;
              if (v39) {
                -[MREffectOrigami renderUnfoldingFlowerAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderUnfoldingFlowerAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a4,  a5,  v43,  a3,  (a3 - v26) / v28,  v48,  v49,  v50,  v51);
              }
            }
          }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v10 = *(void **)(&self->super._isInInteractiveMode + 1);
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
        double v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
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

- (BOOL)getVerticesCoordinates:(MREffectOrigami *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___MREffectOrigami;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v80,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);

  id v6 = [(id)qword_2B0668 objectForKey:self->super.mEffectID];
  id v7 = v6;
  if (HIBYTE(self->mDescriptionAspectRatio) != BYTE2(self->mDescriptionAspectRatio))
  {
    id v8 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 0), "objectForKey:", @"fallback");
    if (v8) {
      id v7 = v8;
    }
  }

  double v79 = 0.0;
  *(NSMutableArray **)((char *)&self->mSpriteKeysWatcher + 1) = (NSMutableArray *)ComputeAnimationTimeBounds(v7, &v79);
  *(double *)((char *)&self->mItemInfos + 1) = (self->super.mPhaseInDuration
                                              + self->super.mMainDuration
                                              + self->super.mPhaseOutDuration
                                              - v79)
                                             / (self->super.mDefaultPhaseInDuration
                                              + self->super.mDefaultMainDuration
                                              + self->super.mDefaultPhaseOutDuration
                                              - v79);
  if (-[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami-JustASlide"))
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    float v9 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectEnumerator");
    id v10 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v75,  v84,  16LL);
    if (!v10) {
      goto LABEL_35;
    }
    id v11 = v10;
    id v12 = v7;
    uint64_t v13 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v76 != v13) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
        [v15 setShowTime:0.0];
        [v15 setShowDuration:self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration];
      }

      id v11 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v75,  v84,  16LL);
    }

    while (v11);
    goto LABEL_34;
  }

  if (HIBYTE(self->mDescriptionAspectRatio) == BYTE2(self->mDescriptionAspectRatio))
  {
    __int128 v73 = 0uLL;
    __int128 v74 = 0uLL;
    __int128 v71 = 0uLL;
    __int128 v72 = 0uLL;
    obj = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectEnumerator");
    id v16 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v83,  16LL);
    if (!v16) {
      goto LABEL_35;
    }
    id v17 = v16;
    id v58 = v7;
    uint64_t v18 = *(void *)v72;
    while (1)
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v72 != v18) {
          objc_enumerationMutation(obj);
        }
        CGPoint v20 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)j);
        __int128 v21 = +[MRUtilities executeScript:withHeader:andAttributes:]( MRUtilities,  "executeScript:withHeader:andAttributes:",  [v20 showTimeScript],  0,  0);
        if (!v21)
        {
          double width = 0.0;
LABEL_23:
          double height = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration - width;
          goto LABEL_24;
        }

        CGSize v22 = CGSizeFromString(v21);
        double width = v22.width;
        double height = v22.height;
        if (v22.height < 0.0) {
          goto LABEL_23;
        }
LABEL_24:
        StretchTime( *(void **)((char *)&self->mSpriteKeysWatcher + 1),  width,  *(double *)((char *)&self->mItemInfos + 1));
        double v26 = v25;
        objc_msgSend(v20, "setShowTime:");
        StretchTime( *(void **)((char *)&self->mSpriteKeysWatcher + 1),  width + height,  *(double *)((char *)&self->mItemInfos + 1));
        [v20 setShowDuration:v27 - v26];
      }

      id v17 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v83,  16LL);
      if (!v17)
      {
        id v7 = v58;
        goto LABEL_35;
      }
    }
  }

  __int128 v69 = 0uLL;
  __int128 v70 = 0uLL;
  __int128 v67 = 0uLL;
  __int128 v68 = 0uLL;
  double v28 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectEnumerator");
  id v29 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v67,  v82,  16LL);
  if (!v29) {
    goto LABEL_35;
  }
  id v30 = v29;
  id v12 = v7;
  uint64_t v31 = *(void *)v68;
  do
  {
    for (k = 0LL; k != v30; k = (char *)k + 1)
    {
      if (*(void *)v68 != v31) {
        objc_enumerationMutation(v28);
      }
      int v33 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)k);
      [v33 setShowTime:0.0];
      [v33 setShowDuration:self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration];
    }

    id v30 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v67,  v82,  16LL);
  }

  while (v30);
LABEL_34:
  id v7 = v12;
LABEL_35:
  uint64_t v34 = 209LL;
  double v35 = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  if (v35) {
    [v35 removeAllObjects];
  }
  else {
    *(NSArray **)((char *)&self->mAnimationTimeBounds + 1) = (NSArray *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id obja = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
  if (obja)
  {
    id v36 = @"startTime";
    id v59 = v7;
    uint64_t v60 = *(void *)v64;
    do
    {
      for (m = 0LL; m != obja; m = (char *)m + 1)
      {
        uint64_t v38 = v34;
        if (*(void *)v64 != v60) {
          objc_enumerationMutation(v59);
        }
        unsigned int v39 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)m);
        id v40 = v36;
        objc_msgSend(objc_msgSend(v39, "objectForKey:", v36), "doubleValue");
        double v42 = v41;
        objc_msgSend(objc_msgSend(v39, "objectForKey:", @"duration"), "doubleValue");
        double v44 = v42 + v43;
        StretchTime(*(void **)((char *)&self->mSpriteKeysWatcher + 1), v42, *(double *)((char *)&self->mItemInfos + 1));
        double v46 = v45;
        StretchTime(*(void **)((char *)&self->mSpriteKeysWatcher + 1), v44, *(double *)((char *)&self->mItemInfos + 1));
        double v48 = v47;
        id v49 = [v39 objectForKey:@"subEffectID"];
        id v50 = [v49 isEqualToString:@"still"];
        if ([v49 isEqualToString:@"pstill"])
        {
          objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(objc_msgSend( objc_msgSend( objc_msgSend(v39, "objectForKey:", @"attributes"),  "objectForKey:",  @"slideIndex"),  "intValue"))),  "imageAspectRatio");
          BOOL v52 = v51 <= 0.5 || v51 >= 2.0;
          id v50 = (id)(v52 ^ 1);
        }

        else
        {
          BOOL v52 = 0LL;
        }

        double v53 = objc_alloc(&OBJC_CLASS___NSDictionary);
        double v54 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v46);
        float v55 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v48);
        uint64_t v57 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v50);
        id v36 = v40;
        double v56 = -[NSDictionary initWithObjectsAndKeys:]( v53,  "initWithObjectsAndKeys:",  v54,  v40,  v55,  @"endTime",  v57,  @"isStill",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v52),  @"isBreak",  0LL);
        uint64_t v34 = v38;
        [*(id *)((char *)&self->super.super.isa + v38) addObject:v56];
      }

      id obja = [v59 countByEnumeratingWithState:&v63 objects:v81 count:16];
    }

    while (obja);
  }

- (void)_renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  float v16 = a7.origin.x;
  float v17 = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  *(float *)&a4 = a4;
  objc_msgSend(*(id *)((char *)&self->mLittleSwing + 1), "valueAtTime:", a3, a5, a6, a4);
  float v21 = 3.1416 - v20;
  if (y != 0.0)
  {
    float v21 = fmax(v21 * 2.5, -3.14159265);
    if (v21 > 3.14159265) {
      float v21 = 3.1416;
    }
  }

  __float2 v24 = __sincosf_stret(v21);
  float cosval = v24.__cosval;
  LODWORD(v22) = *(void *)&v24;
  unsigned int v25 = objc_msgSend( objc_msgSend(a8, "objectForKey:", @"direction"),  "isEqualToString:",  @"back");
  float v26 = x + (float)(v17 + (float)((float)(1.0 - cosval) * height));
  v36[0] = v16;
  v36[1] = v26;
  float v27 = -height;
  if (!v25) {
    float v27 = height;
  }
  double v28 = (float)(v22 * v27);
  float v29 = y + v28;
  v36[2] = v29;
  v36[3] = v16;
  float v30 = x + (float)(v17 + height);
  float v31 = y;
  v36[4] = v30;
  v36[5] = v31;
  v36[6] = v16 + width;
  v36[7] = x + (float)(v17 + (float)((float)(1.0 - cosval) * height));
  v36[8] = v29;
  v36[9] = v16 + width;
  v36[10] = v30;
  v36[11] = v31;
  if (a9)
  {
    a9->double x = (float)((float)(1.0 - cosval) * height);
    a9->double y = v28;
  }

  HIDWORD(v32) = -1082130432;
  v35[0] = xmmword_1FBB64;
  v35[1] = unk_1FBB74;
  *(float *)&double v32 = width / height;
  [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v33 state:v32];
  [a5 cull:2];
  SetLightingColors(v34, v36, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:v36];
  [a5 setTextureCoordinatesPointer:v35 onTextureUnit:0];
  [a5 setColorsPointer:v34];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a5 cull:0];
  [a3 unsetOnContext:a5 onTextureUnit:0 state:&v33];
}

- (void)_renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  double height = a7.size.height;
  double width = a7.size.width;
  double v18 = a7.origin.y;
  double v19 = a7.origin.x;
  CGRect v74 = a7;
  signed int v23 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slideIndex"), "intValue");
  __float2 v24 = ImageKey(v23);
  unint64_t v25 = (unint64_t)(&(*(MROrigamiAnimationPath **)((char *)&self->mThirdsSwingBottom + 1))->super.isa)[2 * v23];
  if ((v25 & 0x8000000000000000LL) != 0)
  {
    -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  a3,  a5,  a6,  a8,  a9,  a4,  v19,  v18,  width,  height,  x,  y);
    return;
  }

  unsigned int v26 = objc_msgSend( objc_msgSend( objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"breakInformation"),  "objectForKey:",  v24),  "objectForKey:",  @"panEndDirection"),  "intValue");
  unsigned int v27 = -[MREffectOrigami _checkPanoramaAbsoluteSizeForImage:inRect:]( self,  "_checkPanoramaAbsoluteSizeForImage:inRect:",  a3,  &v74);
  if (v25)
  {
    double v72 = y;
    float v28 = v74.origin.x;
    float v29 = v74.origin.y;
    float v68 = v29;
    float v30 = v74.size.width;
    float v31 = v74.size.height;
    [a3 aspectRatio];
    double v33 = v32;
    [a3 scale];
    double v71 = v34;
    [a3 centerX];
    double v70 = v35;
    [a3 centerY];
    double v69 = v36;
    [a3 setScale:1.0];
    [a3 setCenterX:0.0];
    [a3 setCenterY:0.0];
    double v37 = (double)v25;
    if (v33 <= 1.0)
    {
      double v53 = v30 / v33;
      double v54 = 1.0 / v53;
      double v55 = (v53 - v31) / (v53 * v37) + (v53 - v31) / (v53 * v37);
      if (v26 != -1) {
        double v37 = 0.0;
      }
      double v43 = v55 * v37 + -1.0;
      float v44 = v43;
      *(float *)&double v43 = v43 + (float)(v31 + v31) * v54;
      v77[0] = -1.0;
      double v42 = v54 * v30;
      float v41 = 1.0;
      float v40 = -1.0;
    }

    else
    {
      double v38 = v33 * v31;
      double v39 = (v38 - v30) / (v38 * v37);
      if (v26 != -1) {
        double v37 = 0.0;
      }
      double v43 = v37 * v39 * 2.0 + -1.0;
      float v40 = v43;
      float v41 = v43 + (float)(v30 + v30) * (1.0 / v38);
      v77[0] = v40;
      double v42 = v38 / v31;
      LODWORD(v43) = 1.0;
      float v44 = -1.0;
    }

    v77[1] = v44;
    v77[2] = v40;
    v77[3] = *(float *)&v43;
    v77[4] = v41;
    v77[5] = v44;
    unint64_t v78 = __PAIR64__(LODWORD(v43), LODWORD(v41));
    *(float *)&double v43 = a4;
    [*(id *)((char *)&self->mLittleSwing + 1) valueAtTime:v43];
    __float2 v59 = __sincosf_stret(3.1416 - v56);
    float cosval = v59.__cosval;
    LODWORD(v57) = *(void *)&v59;
    unsigned int v60 = objc_msgSend( objc_msgSend(a8, "objectForKey:", @"direction"),  "isEqualToString:",  @"back");
    float v62 = x + (float)(v68 + (float)((float)(1.0 - cosval) * v31));
    v76[0] = v28;
    v76[1] = v62;
    float v63 = -v31;
    if (!v60) {
      float v63 = v31;
    }
    double v64 = (float)(v57 * v63);
    float v65 = v72 + v64;
    v76[2] = v65;
    v76[3] = v28;
    float v66 = x + (float)(v68 + v31);
    float v67 = v72;
    v76[4] = v66;
    v76[5] = v67;
    v76[6] = v28 + v30;
    v76[7] = x + (float)(v68 + (float)((float)(1.0 - cosval) * v31));
    v76[8] = v65;
    v76[9] = v28 + v30;
    v76[10] = v66;
    v76[11] = v67;
    if (a9)
    {
      CGFloat v61 = (float)((float)(1.0 - cosval) * v31);
      a9->double x = v61;
      a9->double y = v64;
    }

    *(float *)&CGFloat v61 = v42;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v73 state:v61];
    [a5 cull:2];
    SetLightingColors(v75, v76, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:v76];
    [a5 setTextureCoordinatesPointer:v77 onTextureUnit:0];
    [a5 setColorsPointer:v75];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [a5 cull:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:&v73];
    [a3 setScale:v71];
    [a3 setCenterX:v70];
    id v51 = a3;
    double v52 = v69;
    goto LABEL_18;
  }

  if (v27)
  {
    [a3 scale];
    double v46 = v45;
    [a3 centerX];
    double v48 = v47;
    [a3 centerY];
    double v50 = v49;
    [a3 setScale:1.0];
    [a3 setCenterX:0.0];
    [a3 setCenterY:0.0];
    -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  a3,  a5,  a6,  a8,  a9,  a4,  v74.origin.x,  v74.origin.y,  v74.size.width,  v74.size.height,  x,  y);
    [a3 setScale:v46];
    [a3 setCenterX:v48];
    id v51 = a3;
    double v52 = v50;
LABEL_18:
    [v51 setCenterY:v52];
    return;
  }

  -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  a3,  a5,  a6,  a8,  a9,  a4,  v74.origin.x,  v74.origin.y,  v74.size.width,  v74.size.height,  x,  y);
}

- (void)renderFallAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slideIndex"), "intValue"))),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  v17,  a5,  a6,  a8,  0LL,  a4,  x,  y,  width,  height,  CGPointZero.x,  CGPointZero.y);
  [v17 releaseByUser];
}

- (void)renderFall2AtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v18 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide0"), "intValue"))),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  id v19 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide1"), "intValue"))),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  double v20 = y + height * 0.5;
  double v21 = height * 0.5;
  -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  v18,  a5,  a6,  a8,  v22,  a4,  x,  v20,  width,  v21,  CGPointZero.x,  CGPointZero.y);
  -[MREffectOrigami _renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  v19,  a5,  a6,  a8,  0LL,  a4,  x,  y,  width,  v21,  v22[0],  v22[1]);
  [v18 releaseByUser];
  [v19 releaseByUser];
}

- (void)renderFallBreakAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slideIndex"), "intValue"))),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  -[MREffectOrigami _renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "_renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  v17,  a5,  a6,  a8,  0LL,  a4,  x,  y,  width,  height,  CGPointZero.x,  CGPointZero.y);
  [v17 releaseByUser];
}

- (void)renderStillAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  float x = a7.origin.x;
  float y = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  v59[0] = x;
  v59[1] = y;
  v59[2] = x;
  v59[3] = y + height;
  v59[4] = x + width;
  v59[5] = y;
  v59[6] = x + width;
  v59[7] = y + height;
  id v17 = [a8 objectForKey:@"slideRect"];
  v58[0] = (float32x4_t)xmmword_1FBB64;
  v58[1] = (float32x4_t)unk_1FBB74;
  if (v17) {
    MyGLRectFromString(v17, v58);
  }
  id v18 = [a8 objectForKey:@"slideIndex"];
  if ((v18 || -[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami-JustASlide"))
    && (id v19 = ImageKey((int)[v18 intValue])) != 0)
  {
    double v20 = v19;
    id v21 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v19);
    id v22 = [v21 retainedByUserRenderedImageAtTime:a5 inContext:a6 withArguments:a3];
    char v23 = 0;
  }

  else
  {
    id v22 = -[MREffectOrigami _retainedByUserBackColorImageInContext:]( self,  "_retainedByUserBackColorImageInContext:",  a5);
    id v21 = 0LL;
    double v20 = 0LL;
    char v23 = 1;
  }

  if ([v21 defaultKenBurnsType] == 1)
  {
    *(float *)&double v24 = width / height;
    [v22 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:v56 state:v24];
    *(float *)&double v25 = SetLightingColors2D((uint64_t)v57, v59, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v25);
    [a5 setVertex2DPointer:v59];
    [a5 setTextureCoordinatesPointer:v58 onTextureUnit:0];
    [a5 setColorsPointer:v57];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v22 unsetOnContext:a5 onTextureUnit:0 state:v56];
  }

  else
  {
    [v22 width];
    float v27 = v26;
    [v22 height];
    *(float *)&double v28 = v28;
    double v29 = (float)(v27 / *(float *)&v28);
    [v22 scale];
    double v31 = v30;
    *(float *)&double v30 = v30;
    double v53 = v30;
    [a5 localAspectRatio];
    double v34 = v31 * v32 / v29;
    float v33 = v34;
    LODWORD(v34) = 1.0;
    BOOL v35 = v33 < 1.0 || *(float *)&v53 < 1.0;
    if (v35)
    {
      float v52 = v33;
      objc_msgSend(v22, "centerX", v34, v53);
      double v29 = v36;
      [v22 centerY];
      double v31 = v37;
      [v22 setCenterX:0.0];
      [v22 setCenterY:0.0];
      float v33 = v52;
    }

    double v38 = v59;
    float32x4x2_t v60 = vld2q_f32(v38);
    v62.val[0] = vmulq_n_f32(v60.val[0], *(float *)&v53);
    v62.val[1] = vmulq_n_f32(v60.val[1], v33);
    double v39 = v56;
    vst2q_f32(v39, v62);
    float v40 = v58;
    float32x4x2_t v61 = vld2q_f32(v40->f32);
    v62.val[0] = vmulq_n_f32(v61.val[0], *(float *)&v53);
    v62.val[1] = vmulq_n_f32(v61.val[1], v33);
    float v41 = (float *)v55;
    vst2q_f32(v41, v62);
    v61.val[0].f32[0] = width / height;
    [v22 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v54 state:*(double *)v61.val[0].i64];
    *(float *)&double v42 = SetLightingColors2D((uint64_t)v57, v56, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v42);
    [a5 setVertex2DPointer:v56];
    [a5 setTextureCoordinatesPointer:v55 onTextureUnit:0];
    [a5 setColorsPointer:v57];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v22 unsetOnContext:a5 onTextureUnit:0 state:&v54];
    if (v35)
    {
      [v22 setCenterX:v29];
      [v22 setCenterY:v31];
    }
  }

  [v22 releaseByUser];
  if ((v23 & 1) == 0)
  {
    double v43 = *(void **)(&self->super._isInInteractiveMode + 1);
    float v44 = (MRCroppingSprite *)[v43 objectForKey:v20];
    if (!v44)
    {
      float v44 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v43 setObject:v44 forKey:v20];
    }

    float v45 = x + width * 0.5;
    float v46 = y + height * 0.5;
    double v47 = v45;
    [a5 localAspectRatio];
    double v49 = (float)(v48 * v46);
    [a5 localAspectRatio];
    LODWORD(v51) = 0;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v44,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a5,  v47,  v49,  width,  (float)(v50 * height),  v51);
    [*(id *)((char *)&self->mSprites + 1) removeObject:v20];
  }

- (BOOL)_checkPanoramaAbsoluteSizeForImage:(id)a3 inRect:(CGRect *)a4
{
  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-L1")
    || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-P1")
    || (BOOL v7 = -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-Intro-L1")))
  {
    [a3 width];
    double v9 = v8;
    [a3 height];
    double v11 = v9 / v10;
    double v12 = self->super.mPixelSize.width * 0.5;
    if (v11 <= 1.0)
    {
      double v19 = v12 * a4->size.width / v11;
      [a3 height];
      double v21 = v20 * 1.20000005;
      double height = a4->size.height;
      if (v21 < self->super.mPixelSize.width * 0.5 * height) {
        double v21 = self->super.mPixelSize.width * 0.5 * height;
      }
      if (v19 > v21)
      {
        double v23 = v21 / v19;
        if (v23 < 0.5) {
          double v23 = 0.5;
        }
        double width = a4->size.width;
        a4->origin.float x = a4->origin.x + width * 0.5 * (1.0 - v23);
        a4->size.double width = v23 * width;
        goto LABEL_17;
      }
    }

    else
    {
      double v13 = v11 * (v12 * a4->size.height);
      [a3 width];
      double v15 = v14 * 1.20000005;
      double v16 = a4->size.width;
      if (v15 < self->super.mPixelSize.width * 0.5 * v16) {
        double v15 = self->super.mPixelSize.width * 0.5 * v16;
      }
      if (v13 > v15)
      {
        double v17 = v15 / v13;
        if (v17 < 0.5) {
          double v17 = 0.5;
        }
        double v18 = a4->size.height;
        a4->origin.float y = a4->origin.y + v18 * 0.5 * (1.0 - v17);
        a4->size.double height = v17 * v18;
LABEL_17:
        LOBYTE(v7) = 1;
        return v7;
      }
    }

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)renderBreakAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  CGRect v184 = a7;
  int64_t v18 = (int)objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slideIndex"), "intValue");
  double v19 = ImageKey(v18);
  id v20 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v19),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  if (v20)
  {
    double v21 = v20;
    id v22 = (unint64_t *)(*(char **)((char *)&self->mThirdsSwingBottom + 1) + 16 * v18);
    unint64_t v23 = *v22;
    if ((*v22 & 0x8000000000000000LL) != 0)
    {
      -[MREffectOrigami renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a5,  a6,  a8,  a3,  a4,  x,  y,  width,  height);
      [v21 releaseByUser];
      return;
    }

    unint64_t v24 = v22[1];
    unsigned int v25 = objc_msgSend( objc_msgSend( objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"breakInformation"),  "objectForKey:",  v19),  "objectForKey:",  @"panEndDirection"),  "intValue");
    unsigned int v26 = -[MREffectOrigami _checkPanoramaAbsoluteSizeForImage:inRect:]( self,  "_checkPanoramaAbsoluteSizeForImage:inRect:",  v21,  &v184);
    double v27 = v184.origin.x;
    if (v23)
    {
      double v28 = self->super.mMainDuration + -2.0;
      if (a3 <= 1.0) {
        double v29 = 0.0;
      }
      else {
        double v29 = (a3 + -1.0) / v28;
      }
      double v179 = v184.origin.y;
      double v181 = v184.size.width;
      double v177 = v184.size.height;
      double v38 = 1.0;
      if (v29 <= 1.0) {
        double v39 = v29;
      }
      else {
        double v39 = 1.0;
      }
      unint64_t v40 = *(unint64_t *)((char *)&self->mBreakInfos + 1);
      double v41 = 0.6 / v28;
      if (v40) {
        double v38 = (v28 + (double)v40 * -0.6) / (v28 * (double)(v40 + 1));
      }
      double v42 = (v41 + v38) * (double)v24;
      double v43 = (double)v23;
      double v44 = v42 + (v41 + v38) * (double)v23;
      unint64_t v45 = vcvtmd_u64_f64(v39 / (v41 + v38));
      BOOL v46 = v45 >= v24;
      unint64_t v47 = v45 - v24;
      if (v46) {
        unint64_t v48 = v47;
      }
      else {
        unint64_t v48 = 0LL;
      }
      double v49 = fmod(v39, v41 + v38);
      double v50 = v49;
      if (self->super._panoramaPanningOffsets)
      {
        double v51 = v49 - v38;
        double v50 = 0.0;
        if (v49 <= v38) {
          double v51 = 0.0;
        }
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  v19,  (v51 + (double)v48 * v41) / (v41 * v43),  0.0,  1.0);
        double v53 = v52 * v43;
        unint64_t v48 = vcvtmd_u64_f64(v53);
        if (v23 > v48) {
          double v50 = v38 + fmod(v53, 1.0) * v41;
        }
        double v39 = (v42 + v44) * 0.5;
      }

      float v54 = v27;
      float v173 = v54;
      float v55 = v179;
      float v180 = v55;
      float v56 = v181;
      float v182 = v56;
      float v57 = v177;
      float v178 = v57;
      if (v48 > v23) {
        double v50 = 0.0;
      }
      if (v48 >= v23) {
        unint64_t v48 = v23;
      }
      [v21 scale];
      double v176 = v58;
      [v21 centerX];
      double v175 = v59;
      [v21 centerY];
      double v174 = v60;
      [v21 setScale:1.0];
      [v21 setCenterX:0.0];
      [v21 setCenterY:0.0];
      [v21 width];
      double v62 = v61;
      [v21 height];
      BOOL v64 = v50 > v38;
      if (v39 < v42) {
        BOOL v64 = 0;
      }
      BOOL v65 = v39 < v44 && v64;
      if (v62 <= v63)
      {
        [v21 height];
        double v108 = v182;
        double v110 = v109 * v182;
        [v21 width];
        double v112 = v110 / v111;
        double v113 = (v110 / v111 - v178) / (v110 / v111 * v43);
        double v114 = 1.0 / (v110 / v111);
        if (v65)
        {
          double v115 = (v50 - v38) / v41;
          double v116 = v178;
          [*(id *)((char *)&self->mPixelUnit + 1) evaluatAtTime:v115];
          double v118 = v117;
          double v119 = v112 * 0.5 * v113;
          *(float *)&double v117 = v117 * 1.57079633;
          __float2 v120 = __sincosf_stret(*(float *)&v117);
          double v121 = v119 * v120.__cosval;
          double v122 = -(v119 * v120.__sinval);
          double v123 = v121 + v180;
          double v124 = v121 + v123;
          float v66 = v178;
          double v125 = (v113 + v113) * (double)v48 + -1.0;
          double v126 = v113 + v125;
          double v127 = v113 + v113 + v125;
          double v128 = 2.0;
          double v129 = (float)(v180 + v178) - v121;
          double v130 = v129 - v121;
          double v131 = (v114 * v178 + v113 * (double)(v23 - v48)) * 2.0 + -1.0;
          double v132 = v131 - v113;
          double v133 = v131 - v113 - v113;
          if (v25 == -1)
          {
            double v128 = -2.0;
            double v125 = (v114 * v116 + v113 * (double)(v23 - v48)) * 2.0 + -1.0;
            double v134 = -0.5;
          }

          else
          {
            double v134 = 0.5;
          }

          if (v25 == -1) {
            float v135 = v180 + v178;
          }
          else {
            float v135 = v180;
          }
          if (v25 == -1)
          {
            double v123 = v129;
            float v136 = v180;
          }

          else
          {
            double v130 = v124;
            float v136 = v180 + v178;
          }

          if (v25 == -1) {
            double v137 = v132;
          }
          else {
            double v137 = v126;
          }
          if (v25 == -1) {
            double v138 = v133;
          }
          else {
            double v138 = v127;
          }
          double v139 = v116 + (v119 + v119) * v118;
          float v210 = v135;
          int v211 = 0;
          float v97 = v173;
          float v107 = v182;
          float v212 = v173 + v182;
          float v213 = v135;
          int v214 = 0;
          float v140 = v123;
          float v215 = v173;
          float v216 = v140;
          float v141 = v122;
          float v217 = v141;
          float v218 = v173 + v182;
          float v219 = v140;
          float v220 = v141;
          float v142 = v130;
          float v221 = v173;
          float v222 = v142;
          int v223 = 0;
          float v224 = v173 + v182;
          float v225 = v142;
          int v226 = 0;
          float v227 = v173;
          float v228 = v136;
          int v229 = 0;
          float v230 = v173 + v182;
          float v231 = v136;
          double v143 = v125 + v139 * v128 * v114;
          int v232 = 0;
          float v193 = -1.0;
          float v144 = v125;
          float v194 = v144;
          float v195 = 1.0;
          float v196 = v144;
          float v197 = -1.0;
          float v145 = v137;
          float v198 = v145;
          float v199 = 1.0;
          float v200 = v145;
          float v201 = -1.0;
          float v146 = v138;
          float v202 = v146;
          float v203 = 1.0;
          float v204 = v146;
          float v205 = -1.0;
          float v147 = v143;
          float v206 = v147;
          float v207 = 1.0;
          float v208 = v147;
          float v209 = v173;
          double v148 = v114 * v108;
          *(float *)&double v148 = v114 * v108;
          [v21 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v183 state:v148];
          SetLightingColors(&v185, &v209, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v209];
          [a5 setTextureCoordinatesPointer:&v193 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          SetLightingColors(&v185, &v215, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v215];
          [a5 setTextureCoordinatesPointer:&v197 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          SetLightingColors(&v185, &v221, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v221];
          [a5 setTextureCoordinatesPointer:&v201 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          [v21 unsetOnContext:a5 onTextureUnit:0 state:&v183];
          v149 = *(void **)((char *)&self->mTotalNumberOfFolds + 1);
          [v21 aspectRatio];
          objc_msgSend( v149,  "setObject:forKey:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (v143 / ((v178 + v178) * v114) - v134) * v150 / (float)(v182 / v178)),  v19);
        }

        else
        {
          float v97 = v173;
          float v193 = v173;
          float v194 = v180;
          float v66 = v178;
          float v195 = v173;
          float v196 = v180 + v178;
          float v197 = v173 + v182;
          float v198 = v180;
          float v199 = v173 + v182;
          float v200 = v180 + v178;
          unint64_t v158 = v23 - v48;
          if (v25 != -1) {
            unint64_t v158 = v48;
          }
          double v159 = (v113 + v113) * (double)v158 + -1.0;
          double v160 = v159 + (float)(v178 + v178) * v114;
          float v185 = -1.0;
          float v161 = v159;
          float v186 = v161;
          float v187 = -1.0;
          float v162 = v160;
          float v188 = v162;
          float v189 = 1.0;
          float v190 = v161;
          float v191 = 1.0;
          float v192 = v162;
          double v163 = v114 * v108;
          *(float *)&double v163 = v114 * v108;
          [v21 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v183 state:v163];
          *(float *)&double v164 = SetLightingColors2D((uint64_t)&v209, &v193, *(float *)[a5 foreColor]);
          objc_msgSend(a5, "setShader:", @"ColoredTexture", v164);
          [a5 setVertex2DPointer:&v193];
          [a5 setTextureCoordinatesPointer:&v185 onTextureUnit:0];
          [a5 setColorsPointer:&v209];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          [v21 unsetOnContext:a5 onTextureUnit:0 state:&v183];
          v165 = *(void **)((char *)&self->mTotalNumberOfFolds + 1);
          [v21 aspectRatio];
          objc_msgSend( v165,  "setObject:forKey:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (v159 + v160) / (v160 - v159) * v166 / (float)(v182 / v178)),  v19);
          float v107 = v182;
        }
      }

      else
      {
        [v21 width];
        float v66 = v178;
        double v67 = v178;
        double v69 = v68 * v178;
        [v21 height];
        double v71 = v69 / v70;
        double v72 = (v69 / v70 - v182) / (v69 / v70 * v43);
        if (v65)
        {
          double v73 = (v50 - v38) / v41;
          double v74 = 1.0 / v71;
          double v75 = v182;
          [*(id *)((char *)&self->mPixelUnit + 1) evaluatAtTime:v73];
          double v77 = v76;
          double v78 = v71 * 0.5 * v72;
          *(float *)&double v76 = v76 * 1.57079633;
          __float2 v79 = __sincosf_stret(*(float *)&v76);
          double v80 = v78 * v79.__cosval;
          double v81 = v80 + v173;
          double v82 = v80 + v81;
          double v83 = (v72 + v72) * (double)v48 + -1.0;
          double v84 = v72 + v83;
          double v85 = v72 + v72 + v83;
          double v86 = 2.0;
          double v87 = (float)(v173 + v182) - v80;
          double v88 = v87 - v80;
          double v89 = (1.0 / v71 * v182 + v72 * (double)(v23 - v48)) * 2.0 + -1.0;
          double v90 = v89 - v72;
          double v91 = v89 - v72 - v72;
          if (v25 == -1)
          {
            double v86 = -2.0;
            double v83 = (v74 * v75 + v72 * (double)(v23 - v48)) * 2.0 + -1.0;
            double v92 = -0.5;
          }

          else
          {
            double v92 = 0.5;
          }

          if (v25 == -1) {
            double v93 = v91;
          }
          else {
            double v93 = v85;
          }
          if (v25 == -1)
          {
            double v84 = v90;
            float v94 = v173;
          }

          else
          {
            float v94 = v173 + v182;
          }

          if (v25 == -1) {
            double v81 = v87;
          }
          else {
            double v88 = v82;
          }
          if (v25 == -1) {
            float v95 = v173 + v182;
          }
          else {
            float v95 = v173;
          }
          double v96 = v75 + (v78 + v78) * v77;
          float v97 = v173;
          double v98 = v83 + v96 * v86 * v74;
          float v209 = v95;
          float v210 = v180;
          int v211 = 0;
          float v212 = v95;
          float v213 = v180 + v178;
          int v214 = 0;
          float v99 = v81;
          float v215 = v99;
          float v216 = v180;
          float v100 = -(v78 * v79.__sinval);
          float v217 = v100;
          float v218 = v99;
          float v219 = v180 + v178;
          float v220 = v100;
          float v101 = v88;
          float v221 = v101;
          float v222 = v180;
          int v223 = 0;
          float v224 = v101;
          float v225 = v180 + v178;
          int v226 = 0;
          float v227 = v94;
          float v228 = v180;
          int v229 = 0;
          float v230 = v94;
          float v231 = v180 + v178;
          int v232 = 0;
          float v102 = v83;
          float v193 = v102;
          float v194 = -1.0;
          float v195 = v102;
          float v196 = 1.0;
          float v103 = v84;
          float v197 = v103;
          float v198 = -1.0;
          float v199 = v103;
          float v200 = 1.0;
          float v104 = v93;
          float v201 = v104;
          float v202 = -1.0;
          float v203 = v104;
          float v204 = 1.0;
          float v105 = v98;
          float v205 = v105;
          float v206 = -1.0;
          float v207 = v105;
          float v208 = 1.0;
          double v106 = v71 / v67;
          *(float *)&double v106 = v71 / v67;
          [v21 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v183 state:v106];
          SetLightingColors(&v185, &v209, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v209];
          [a5 setTextureCoordinatesPointer:&v193 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          SetLightingColors(&v185, &v215, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v215];
          [a5 setTextureCoordinatesPointer:&v197 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          SetLightingColors(&v185, &v221, *(float *)[a5 foreColor]);
          [a5 setShader:@"ColoredTexture"];
          [a5 setVertex3DPointer:&v221];
          [a5 setTextureCoordinatesPointer:&v201 onTextureUnit:0];
          [a5 setColorsPointer:&v185];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          [v21 unsetOnContext:a5 onTextureUnit:0 state:&v183];
          objc_msgSend( *(id *)((char *)&self->mTotalNumberOfFolds + 1),  "setObject:forKey:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v98 / ((v182 + v182) * v74) - v92),  v19);
          float v107 = v182;
        }

        else
        {
          float v97 = v173;
          float v193 = v173;
          float v194 = v180;
          float v195 = v173;
          float v196 = v180 + v178;
          float v197 = v173 + v182;
          float v198 = v180;
          float v199 = v173 + v182;
          float v200 = v180 + v178;
          unint64_t v151 = v23 - v48;
          if (v25 != -1) {
            unint64_t v151 = v48;
          }
          double v152 = v72 * (double)v151 * 2.0 + -1.0;
          double v153 = v152 + (float)(v182 + v182) * (1.0 / (v69 / v70));
          float v154 = v152;
          float v185 = v154;
          float v186 = -1.0;
          float v187 = v154;
          float v188 = 1.0;
          float v155 = v153;
          float v189 = v155;
          float v190 = -1.0;
          float v191 = v155;
          float v192 = 1.0;
          double v156 = v71 / v67;
          *(float *)&double v156 = v71 / v67;
          [v21 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v183 state:v156];
          *(float *)&double v157 = SetLightingColors2D((uint64_t)&v209, &v193, *(float *)[a5 foreColor]);
          objc_msgSend(a5, "setShader:", @"ColoredTexture", v157);
          [a5 setVertex2DPointer:&v193];
          [a5 setTextureCoordinatesPointer:&v185 onTextureUnit:0];
          [a5 setColorsPointer:&v209];
          [a5 drawTriangleStripFromOffset:0 count:4];
          [a5 unsetColorsPointer];
          [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
          [a5 unsetVertexPointer];
          [a5 unsetShader];
          [v21 unsetOnContext:a5 onTextureUnit:0 state:&v183];
          objc_msgSend( *(id *)((char *)&self->mTotalNumberOfFolds + 1),  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v152 + v153) / (v153 - v152)),  v19);
          float v107 = v182;
        }
      }

      v167 = *(void **)(&self->super._isInInteractiveMode + 1);
      v168 = (MRCroppingSprite *)[v167 objectForKey:v19];
      if (!v168)
      {
        v168 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
        [v167 setObject:v168 forKey:v19];
      }

      [a5 localAspectRatio];
      double v170 = (float)((float)(v180 + (float)(v66 * 0.5)) * v169);
      [a5 localAspectRatio];
      LODWORD(v172) = 0;
      -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v168,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a5,  (float)(v97 + (float)(v107 * 0.5)),  v170,  v107,  (float)(v171 * v66),  v172);
      [*(id *)((char *)&self->mSprites + 1) removeObject:v19];
      [v21 setScale:v176];
      [v21 setCenterX:v175];
      double v36 = v21;
      double v37 = v174;
    }

    else
    {
      if (!v26)
      {
        -[MREffectOrigami renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a5,  a6,  a8,  a3,  a4,  v184.origin.x,  v184.origin.y,  v184.size.width,  v184.size.height);
LABEL_79:
        [v21 releaseByUser];
        return;
      }

      [v21 scale];
      double v31 = v30;
      [v21 centerX];
      double v33 = v32;
      [v21 centerY];
      double v35 = v34;
      [v21 setScale:1.0];
      [v21 setCenterX:0.0];
      [v21 setCenterY:0.0];
      -[MREffectOrigami renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillAtTime:andProgress:inContext:withArguments:inRect:withAttributes:",  a5,  a6,  a8,  a3,  a4,  v184.origin.x,  v184.origin.y,  v184.size.width,  v184.size.height);
      [v21 setScale:v31];
      [v21 setCenterX:v33];
      double v36 = v21;
      double v37 = v35;
    }

    [v36 setCenterY:v37];
    goto LABEL_79;
  }

- (void)renderFlipLeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v14 = [a8 objectForKey:@"recto"];
  id v15 = [a8 objectForKey:@"verso"];
  objc_msgSend(objc_msgSend(a8, "objectForKey:", @"ratio"), "floatValue");
  float v135 = v16;
  id v17 = [v14 objectForKey:@"ratio01"];
  id v18 = [v14 objectForKey:@"ratio23"];
  id v19 = [v15 objectForKey:@"ratio01"];
  id v20 = [v15 objectForKey:@"ratio23"];
  float v21 = 0.0;
  LODWORD(v22) = 0;
  if (v17)
  {
    objc_msgSend(v17, "floatValue", v22);
    *(float *)&double v22 = 1.0 - *(float *)&v22;
  }

  float v113 = *(float *)&v22;
  if (v18)
  {
    [v18 floatValue];
    float v21 = 1.0 - *(float *)&v22;
  }

  float v23 = 0.0;
  float v24 = 0.0;
  if (v19)
  {
    [v19 floatValue];
    float v24 = 1.0 - *(float *)&v22;
  }

  if (v20)
  {
    [v20 floatValue];
    float v23 = 1.0 - *(float *)&v22;
  }

  float v114 = v23;
  *(float *)&double v22 = a4;
  [*(id *)((char *)&self->mBigSwing + 1) valueAtTime:v22];
  float v26 = v25;
  id v27 = [a8 objectForKey:@"invert"];
  float v28 = 3.1416 - v26;
  id v125 = v27;
  if (v27) {
    float v28 = v26;
  }
  __float2 v29 = __sincosf_stret(v28);
  signed int v30 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"slide0"), "intValue");
  signed int v31 = v30;
  if ([v14 objectForKey:@"slide1"]) {
    signed int v31 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"slide1"), "intValue");
  }
  unsigned int v32 = v30;
  if ([v14 objectForKey:@"slide2"]) {
    unsigned int v32 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"slide2"), "intValue");
  }
  float v33 = width;
  float v136 = v33;
  signed int v127 = v32;
  if ([v14 objectForKey:@"slide3"]) {
    unsigned int v32 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"slide3"), "intValue");
  }
  double v132 = a4;
  float v34 = height;
  signed int v35 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide0"), "intValue");
  id v36 = [v15 objectForKey:@"slide1"];
  unsigned int v37 = v35;
  if (v36) {
    unsigned int v37 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide1"), "intValue");
  }
  signed int v115 = v37;
  signed int v38 = v35;
  if ([v15 objectForKey:@"slide2"]) {
    signed int v38 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide2"), "intValue");
  }
  signed int v116 = v32;
  signed int v117 = v31;
  float v39 = v21 * v34;
  double v40 = (float)(v24 * v34);
  signed int v41 = v38;
  if ([v15 objectForKey:@"slide3"]) {
    signed int v41 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide3"), "intValue");
  }
  double v120 = v39;
  double v42 = x + v136;
  double v118 = y + v40;
  double v43 = x + (float)((float)(v135 - (float)(v135 * v29.__cosval)) * v136);
  float v44 = x;
  float v45 = x + (float)(v135 * v136);
  float v46 = y;
  float v47 = y + v34;
  float v131 = v47;
  [*(id *)((char *)&self->mBigSwing + 1) timeFirstAtRestValue];
  double v49 = v132;
  double v50 = a3;
  float v122 = v44;
  if (v48 > v132 || v125)
  {
    signed int v112 = v41;
    float v51 = y + (float)(v113 * v34);
    id v52 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v30)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    id v53 = v52;
    *(float *)&double v54 = v136;
    if (v127 != v30) {
      *(float *)&double v54 = v45 - v44;
    }
    *(float *)&double v54 = *(float *)&v54 / (float)(v131 - v51);
    if (v127 == v30) {
      float v55 = (float)(v135 * 2.0) + -1.0;
    }
    else {
      float v55 = 1.0;
    }
    [v52 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v54];
    float v144 = x;
    float v145 = y + (float)(v113 * v34);
    float v146 = x;
    float v147 = v131;
    float v148 = x + (float)(v135 * v136);
    float v149 = v145;
    float v150 = v148;
    float v151 = v131;
    *(_OWORD *)double v138 = xmmword_1FA170;
    *(float *)&v138[16] = v55;
    *(_DWORD *)&v138[20] = -1082130432;
    *(float *)&v138[24] = v55;
    float v139 = 1.0;
    *(float *)&double v56 = SetLightingColors2D((uint64_t)v162, &v144, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v56);
    [a5 setVertex2DPointer:&v144];
    [a5 setTextureCoordinatesPointer:v138 onTextureUnit:0];
    [a5 setColorsPointer:v162];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    if (v51 <= v46)
    {
      double v49 = v132;
      double v42 = x + v136;
    }

    else
    {
      id v57 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v31)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      if (v57 == v53)
      {
        [v53 releaseByUser];
        unsigned int v59 = v32;
      }

      else
      {
        double v58 = v57;
        [v53 unsetOnContext:a5 onTextureUnit:0 state:&v137];
        [v53 releaseByUser];
        unsigned int v59 = v32;
        *(float *)&double v60 = v136;
        if (v32 != v117) {
          *(float *)&double v60 = v45 - v44;
        }
        *(float *)&double v60 = *(float *)&v60 / (float)(v51 - v46);
        [v58 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v60];
        id v53 = v58;
      }

      double v49 = v132;
      double v42 = x + v136;
      *(float *)unint64_t v158 = x;
      *(float *)&v158[4] = y;
      *(float *)&v158[8] = x;
      *(float *)&unint64_t v159 = y + (float)(v113 * v34);
      *((float *)&v159 + 1) = x + (float)(v135 * v136);
      *(float *)&unint64_t v160 = y;
      *((float *)&v160 + 1) = *((float *)&v159 + 1);
      float v161 = *(float *)&v159;
      float v61 = 1.0;
      if (v59 == v117) {
        float v61 = (float)(v135 * 2.0) + -1.0;
      }
      *(_OWORD *)double v156 = xmmword_1FA170;
      *(float *)&v156[16] = v61;
      *(_DWORD *)&v156[20] = -1082130432;
      *(float *)&v156[24] = v61;
      int v157 = 1065353216;
      *(float *)&double v62 = SetLightingColors2D((uint64_t)v162, (float *)v158, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v62);
      [a5 setVertex2DPointer:v158];
      [a5 setTextureCoordinatesPointer:v156 onTextureUnit:0];
      [a5 setColorsPointer:v162];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
    }

    [v53 unsetOnContext:a5 onTextureUnit:0 state:&v137];
    [v53 releaseByUser];
    signed int v41 = v112;
    double v43 = x + (float)((float)(v135 - (float)(v135 * v29.__cosval)) * v136);
  }

  float v133 = y;
  double v119 = x + (float)((float)(v135 - (float)((float)(1.0 - v135) * v29.__cosval)) * v136);
  double v121 = y + v120;
  float v63 = v42;
  float v130 = v63;
  float v64 = v118;
  float v65 = v43;
  float v124 = v65;
  [*(id *)((char *)&self->mBigSwing + 1) timeFirstAtRestValue];
  if (v66 > v49 || !v125)
  {
    float v67 = y + (float)(v114 * v34);
    id v68 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v38)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    id v69 = v68;
    *(float *)&double v70 = v136;
    if (v38 != v35) {
      *(float *)&double v70 = v130 - v45;
    }
    *(float *)&double v70 = *(float *)&v70 / (float)(v131 - v67);
    if (v38 == v35) {
      float v71 = (float)(v135 * -2.0) + 1.0;
    }
    else {
      float v71 = -1.0;
    }
    [v68 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v70];
    float v144 = v45;
    float v145 = v67;
    float v146 = v45;
    float v147 = v131;
    float v148 = v130;
    float v149 = v67;
    float v150 = v130;
    float v151 = v131;
    *(float *)double v138 = v71;
    *(_DWORD *)&v138[4] = -1082130432;
    *(float *)&v138[8] = v71;
    *(_OWORD *)&v138[12] = xmmword_1FB9C0;
    float v139 = 1.0;
    *(float *)&double v72 = SetLightingColors2D((uint64_t)v162, &v144, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v72);
    [a5 setVertex2DPointer:&v144];
    [a5 setTextureCoordinatesPointer:v138 onTextureUnit:0];
    [a5 setColorsPointer:v162];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    if (v67 <= v133)
    {
      double v50 = a3;
    }

    else
    {
      id v73 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v41)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      double v50 = a3;
      if (v73 == v69)
      {
        [v69 releaseByUser];
        float v77 = y;
        signed int v75 = v115;
      }

      else
      {
        double v74 = v73;
        [v69 unsetOnContext:a5 onTextureUnit:0 state:&v137];
        [v69 releaseByUser];
        signed int v75 = v115;
        *(float *)&double v76 = v136;
        if (v41 != v115) {
          *(float *)&double v76 = v130 - v45;
        }
        float v77 = y;
        *(float *)&double v76 = *(float *)&v76 / (float)(v67 - v133);
        [v74 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v76];
        id v69 = v74;
      }

      *(float *)unint64_t v158 = v45;
      *(float *)&v158[4] = v77;
      *(float *)&v158[8] = v45;
      unint64_t v159 = __PAIR64__(LODWORD(v130), LODWORD(v67));
      unint64_t v160 = __PAIR64__(LODWORD(v130), LODWORD(v77));
      float v161 = v67;
      float v78 = -1.0;
      if (v41 == v75) {
        float v78 = (float)(v135 * -2.0) + 1.0;
      }
      *(float *)double v156 = v78;
      *(_DWORD *)&v156[4] = -1082130432;
      *(float *)&v156[8] = v78;
      *(_OWORD *)&v156[12] = xmmword_1FB9C0;
      int v157 = 1065353216;
      *(float *)&double v79 = SetLightingColors2D((uint64_t)v162, (float *)v158, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v79);
      [a5 setVertex2DPointer:v158];
      [a5 setTextureCoordinatesPointer:v156 onTextureUnit:0];
      [a5 setColorsPointer:v162];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
    }

    [v69 unsetOnContext:a5 onTextureUnit:0 state:&v137];
    [v69 releaseByUser];
    float v44 = v122;
  }

  float v80 = v121;
  float v81 = v119;
  float v126 = v81;
  [a5 cull:1];
  id v82 = a6;
  id v83 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v35)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v50);
  id v85 = v83;
  float v86 = v45 - v44;
  if (v38 == v35) {
    float v87 = v136;
  }
  else {
    float v87 = v45 - v44;
  }
  *(float *)&double v84 = v87 / (float)(v131 - v64);
  double v88 = v50;
  if (v38 == v35) {
    float v89 = (float)(v135 * 2.0) + -1.0;
  }
  else {
    float v89 = 1.0;
  }
  [v83 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v84];
  float v144 = v124;
  float v145 = v118;
  float v146 = (float)(v135 * v29.__sinval) * v136;
  float v147 = v45;
  float v148 = v118;
  float v149 = 0.0;
  float v150 = v124;
  float v151 = v131;
  float v152 = v146;
  float v153 = v45;
  float v154 = v131;
  float v155 = 0.0;
  __asm { FMOV            V9.2S, #-1.0 }

  *(void *)unint64_t v158 = _D9;
  *(float *)&v158[8] = v89;
  unint64_t v159 = _D9;
  LODWORD(v160) = 1065353216;
  *((float *)&v160 + 1) = v89;
  float v161 = 1.0;
  SetLightingColors(v162, &v144, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v144];
  [a5 setTextureCoordinatesPointer:v158 onTextureUnit:0];
  [a5 setColorsPointer:v162];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  if (v64 <= v133)
  {
    float v98 = y;
  }

  else
  {
    id v95 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v115)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v88);
    if (v95 == v85)
    {
      [v85 releaseByUser];
      float v98 = y;
    }

    else
    {
      double v96 = v95;
      [v85 unsetOnContext:a5 onTextureUnit:0 state:&v137];
      [v85 releaseByUser];
      *(float *)&double v97 = v136;
      if (v41 != v115) {
        *(float *)&double v97 = v86;
      }
      float v98 = y;
      *(float *)&double v97 = *(float *)&v97 / (float)(v64 - v133);
      [v96 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v97];
      id v85 = v96;
    }

    *(float *)double v138 = v124;
    *(float *)&v138[4] = v98;
    *(float *)&v138[8] = (float)(v135 * v29.__sinval) * v136;
    *(float *)&v138[12] = v45;
    *(float *)&v138[16] = v98;
    *(_DWORD *)&v138[20] = 0;
    *(float *)&v138[24] = v124;
    float v139 = v118;
    float v140 = *(float *)&v138[8];
    float v141 = v45;
    float v142 = v118;
    float v143 = 0.0;
    float v99 = 1.0;
    if (v41 == v115) {
      float v99 = (float)(v135 * 2.0) + -1.0;
    }
    *(void *)double v156 = _D9;
    *(float *)&v156[8] = v99;
    *(void *)&v156[12] = _D9;
    *(_DWORD *)&v156[20] = 1065353216;
    *(float *)&v156[24] = v99;
    int v157 = 1065353216;
    SetLightingColors(v162, (float *)v138, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:v138];
    [a5 setTextureCoordinatesPointer:v156 onTextureUnit:0];
    [a5 setColorsPointer:v162];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v82 = a6;
  }

  [v85 unsetOnContext:a5 onTextureUnit:0 state:&v137];
  [v85 releaseByUser];
  id v100 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v127)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v82,  v88);
  id v101 = v100;
  *(float *)&double v102 = v136;
  if (v127 != v30) {
    *(float *)&double v102 = v130 - v45;
  }
  *(float *)&double v102 = *(float *)&v102 / (float)(v131 - v80);
  if (v127 == v30) {
    float v103 = (float)(v135 * -2.0) + 1.0;
  }
  else {
    float v103 = -1.0;
  }
  [v100 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v102];
  float v144 = v45;
  float v145 = v121;
  float v146 = 0.0;
  float v147 = v126;
  float v148 = v121;
  float v149 = (float)((float)(1.0 - v135) * v29.__sinval) * v136;
  float v150 = v45;
  float v151 = v131;
  float v152 = 0.0;
  float v153 = v126;
  float v154 = v131;
  float v155 = v149;
  *(float *)unint64_t v158 = v103;
  *(void *)&v158[4] = 0x3F800000BF800000LL;
  LODWORD(v159) = -1082130432;
  *((float *)&v159 + 1) = v103;
  double v104 = v88;
  __asm { FMOV            V13.2S, #1.0 }

  unint64_t v160 = _D13;
  float v161 = 1.0;
  SetLightingColors(v162, &v144, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v144];
  [a5 setTextureCoordinatesPointer:v158 onTextureUnit:0];
  [a5 setColorsPointer:v162];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  if (v80 > v98)
  {
    id v106 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v116)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v82,  v104);
    if (v106 == v101)
    {
      [v101 releaseByUser];
      signed int v108 = v117;
      float v110 = y;
    }

    else
    {
      float v107 = v106;
      [v101 unsetOnContext:a5 onTextureUnit:0 state:&v137];
      [v101 releaseByUser];
      signed int v108 = v117;
      *(float *)&double v109 = v136;
      if (v116 != v117) {
        *(float *)&double v109 = v130 - v45;
      }
      float v110 = y;
      *(float *)&double v109 = *(float *)&v109 / (float)(v80 - v133);
      [v107 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v137 state:v109];
      id v101 = v107;
    }

    *(float *)double v138 = v45;
    *(void *)&v138[4] = LODWORD(v110);
    *(float *)&v138[12] = v126;
    *(float *)&v138[16] = v110;
    *(float *)&v138[20] = (float)((float)(1.0 - v135) * v29.__sinval) * v136;
    *(float *)&v138[24] = v45;
    float v139 = v121;
    float v140 = 0.0;
    float v141 = v126;
    float v142 = v121;
    float v143 = *(float *)&v138[20];
    float v111 = -1.0;
    if (v116 == v108) {
      float v111 = (float)(v135 * -2.0) + 1.0;
    }
    *(float *)double v156 = v111;
    *(void *)&v156[4] = 0x3F800000BF800000LL;
    *(_DWORD *)&v156[12] = -1082130432;
    *(float *)&v156[16] = v111;
    *(void *)&v156[20] = _D13;
    int v157 = 1065353216;
    SetLightingColors(v162, (float *)v138, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:v138];
    [a5 setTextureCoordinatesPointer:v156 onTextureUnit:0];
    [a5 setColorsPointer:v162];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
  }

  [v101 unsetOnContext:a5 onTextureUnit:0 state:&v137];
  [v101 releaseByUser];
  [a5 cull:0];
}

- (void)renderFlipDownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v15 = [a8 objectForKey:@"recto"];
  id v16 = [a8 objectForKey:@"verso"];
  objc_msgSend(objc_msgSend(a8, "objectForKey:", @"ratio"), "floatValue");
  float v182 = v17;
  id v18 = [v15 objectForKey:@"ratio01"];
  id v19 = [v15 objectForKey:@"ratio23"];
  id v20 = [v16 objectForKey:@"ratio01"];
  id v21 = [v16 objectForKey:@"ratio23"];
  float v23 = 1.0;
  float v24 = 1.0;
  if (v18)
  {
    [v18 floatValue];
    float v24 = *(float *)&v22;
  }

  if (v19)
  {
    [v19 floatValue];
    float v23 = *(float *)&v22;
  }

  float v25 = 1.0;
  float v26 = 1.0;
  if (v20)
  {
    [v20 floatValue];
    float v26 = *(float *)&v22;
  }

  double v164 = a3;
  if (v21)
  {
    [v21 floatValue];
    float v25 = *(float *)&v22;
  }

  *(float *)&double v22 = a4;
  [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:v22];
  __float2 v28 = __sincosf_stret(3.1416 - v27);
  float v29 = width;
  float v30 = height;
  float v189 = v30;
  float v31 = v182 * v30;
  unsigned int v32 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide0"), "intValue");
  id v33 = [v15 objectForKey:@"slide1"];
  unsigned int v34 = v32;
  if (v33) {
    unsigned int v34 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide1"), "intValue");
  }
  signed int v165 = v34;
  unsigned int v35 = v32;
  id v36 = a6;
  if ([v15 objectForKey:@"slide2"]) {
    unsigned int v35 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide2"), "intValue");
  }
  signed int v172 = v32;
  float32x2_t v186 = (float32x2_t)__PAIR64__(LODWORD(v189), v23 * v29);
  signed int v37 = v35;
  if ([v15 objectForKey:@"slide3"]) {
    signed int v37 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"slide3"), "intValue");
  }
  unsigned int v171 = v35;
  float v173 = 1.0 - v182;
  float v38 = v24 * v29;
  signed int v39 = objc_msgSend(objc_msgSend(v16, "objectForKey:", @"slide0"), "intValue");
  unsigned int v40 = v39;
  if ([v16 objectForKey:@"slide1"]) {
    unsigned int v40 = objc_msgSend(objc_msgSend(v16, "objectForKey:", @"slide1"), "intValue");
  }
  float v41 = v26 * v29;
  v42.f64[0] = x;
  v43.f64[0] = x;
  v43.f64[1] = y;
  float64x2_t v175 = vcvtq_f64_f32(v186);
  float64x2_t v177 = v43;
  double v44 = (float)(v25 * v29);
  double v45 = v29;
  v42.f64[1] = y + v31;
  float64x2_t v187 = v42;
  signed int v46 = v39;
  if ([v16 objectForKey:@"slide2"]) {
    signed int v46 = objc_msgSend(objc_msgSend(v16, "objectForKey:", @"slide2"), "intValue");
  }
  signed int v163 = v40;
  double v47 = v41;
  double v48 = x + v38;
  float64x2_t v180 = vaddq_f64(v177, v175);
  double v49 = x + v44;
  double v50 = x + v45;
  int32x2_t v188 = (int32x2_t)vcvt_f32_f64(v187);
  id v51 = [v16 objectForKey:@"slide3"];
  unsigned int v52 = v46;
  if (v51) {
    unsigned int v52 = objc_msgSend(objc_msgSend(v16, "objectForKey:", @"slide3"), "intValue");
  }
  signed int v162 = v52;
  float v53 = v182;
  double v54 = x + v47;
  HIDWORD(v55) = HIDWORD(y);
  float v56 = y;
  float v178 = v56;
  *(float *)&double v55 = v48;
  double v176 = v55;
  *(float32x2_t *)&double v185 = vcvt_f32_f64(v180);
  float v57 = v49;
  float v58 = v50;
  [*(id *)((char *)&self->mBreakCurve + 1) timeFirstAtRestValue];
  __asm { FMOV            V0.2S, #-1.0 }

  float32x2_t v169 = _D0;
  int32x2_t v168 = vrev64_s32(v188);
  if (!(_NF ^ _VF | _ZF))
  {
    id v64 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v172)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v164);
    unint64_t v198 = __PAIR64__(LODWORD(v178), v188.u32[0]);
    *(int32x2_t *)float v199 = v188;
    *(_DWORD *)&v199[8] = LODWORD(v176);
    float v200 = v178;
    float v201 = *(float *)&v176;
    float v202 = *(float *)&v188.i32[1];
    float v65 = 1.0;
    if (v171 == v172) {
      float v65 = (float)(v182 * 2.0) + -1.0;
    }
    unint64_t v191 = (unint64_t)v169;
    float v192 = -1.0;
    *(float *)float v193 = v65;
    *(void *)&v193[4] = 0xBF8000003F800000LL;
    *(_DWORD *)&v193[12] = 1065353216;
    *(float *)&v193[16] = v65;
    id v66 = [v15 objectForKey:@"slide0RefRect"];
    if (v66)
    {
      sscanf( (const char *)[v66 UTF8String],  "{{%lf, %lf}, {%lf, %lf}}",  &v213,  &v213.f64[1],  &v214,  &v214.f64[1]);
      v214.f64[1] = v214.f64[1] * 0.5;
      v213.f64[1] = v213.f64[1] + v214.f64[1];
      char v67 = objc_msgSend( objc_msgSend(v15, "objectForKey:", @"slide0RefRectStretchFlags"),  "intValue");
      double v68 = *(float *)((char *)&self->mBackColorForImage[1] + 1);
      [a5 localAspectRatio];
      StretchRectangle(v213.f64, v67, v68, v69);
      _D3 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vsub_f32(*(float32x2_t *)&v185, (float32x2_t)v188)), v214));
      __asm
      {
        FMOV            V2.2D, #2.0
        FMOV            V1.2D, #-1.0
      }

      *(float32x2_t *)&_Q1.f64[0] = vcvt_f32_f64( vaddq_f64( vmlaq_f64( vcvtq_f64_f32(_D3),  _Q2,  vdivq_f64(vsubq_f64(vcvtq_f64_f32((float32x2_t)v188), v213), v214)),  _Q1));
      float v73 = *(float *)_Q1.f64;
      float32x2_t v74 = *(float32x2_t *)&_Q1.f64[0];
      float32x2_t v75 = *(float32x2_t *)&_Q1.f64[0];
      float32x2_t v76 = vmla_f32(*(float32x2_t *)&_Q1.f64[0], (float32x2_t)v191, _D3);
      unint64_t v191 = (unint64_t)v76;
      float v192 = vmlas_n_f32(v73, v192, _D3.f32[0]);
      int32x2_t v77 = (int32x2_t)vmla_f32(v74, (float32x2_t)vrev64_s32(*(int32x2_t *)v193), _D3);
      *(int32x2_t *)float v193 = vrev64_s32(v77);
      *(int32x2_t *)&v193[8] = vrev64_s32((int32x2_t)vmla_f32(v75, (float32x2_t)vrev64_s32(*(int32x2_t *)&v193[8]), _D3));
      LODWORD(_Q2.f64[0]) = *(_DWORD *)&v193[16];
      __asm { FMLA            S6, S2, V3.S[1] }

      *(_DWORD *)&v193[16] = _S6;
    }

    else
    {
      MyGLRectFromString([v15 objectForKey:@"slide0Rect"], (float32x4_t *)&v191);
      int32x2_t v77 = vrev64_s32(*(int32x2_t *)v193);
      float32x2_t v76 = (float32x2_t)v191;
    }

    float32x2_t v79 = vsub_f32((float32x2_t)v77, v76);
    float32x2_t v80 = vsub_f32( (float32x2_t)__PAIR64__(LODWORD(v176), v168.u32[0]),  (float32x2_t)__PAIR64__(v168.u32[1], LODWORD(v178)));
    float v160 = v80.f32[0];
    int32x2_t v81 = (int32x2_t)vmul_f32(v79, v80);
    objc_msgSend( v64,  "setOnContext:onTextureUnit:withReferenceAspectRatio:state:",  a5,  0,  &v190,  COERCE_DOUBLE(vdiv_f32((float32x2_t)vdup_lane_s32(v81, 1), (float32x2_t)v81)));
    *(float *)&double v82 = SetLightingColors2D((uint64_t)&v213, (float *)&v198, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v82);
    [a5 setVertex2DPointer:&v198];
    [a5 setTextureCoordinatesPointer:&v191 onTextureUnit:0];
    [a5 setColorsPointer:&v213];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    double v83 = v176;
    if (*(float *)&v176 < v58)
    {
      id v84 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v165)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v164);
      if (v84 == v64)
      {
        [v64 releaseByUser];
        signed int v87 = v37;
        unsigned int v89 = LODWORD(v176);
      }

      else
      {
        id v85 = v84;
        [v64 unsetOnContext:a5 onTextureUnit:0 state:&v190];
        [v64 releaseByUser];
        HIDWORD(v86) = HIDWORD(v176);
        signed int v87 = v37;
        float v88 = v189;
        if (v37 != v165) {
          float v88 = v160;
        }
        *(float *)&double v86 = (float)(v58 - *(float *)&v176) / v88;
        [v85 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v86];
        unsigned int v89 = LODWORD(v176);
        id v64 = v85;
      }

      v210.i64[0] = __PAIR64__(LODWORD(v178), v89);
      v210.i64[1] = __PAIR64__(v188.u32[1], v89);
      unint64_t v211 = __PAIR64__(LODWORD(v178), LODWORD(v58));
      unint64_t v212 = __PAIR64__(v188.u32[1], LODWORD(v58));
      float v90 = 1.0;
      if (v87 == v165) {
        float v90 = (float)(v182 * 2.0) + -1.0;
      }
      float32x2_t v207 = v169;
      LODWORD(v208) = -1082130432;
      *((float *)&v208 + 1) = v90;
      *(void *)&__int128 v209 = 0xBF8000003F800000LL;
      DWORD2(v209) = 1065353216;
      *((float *)&v209 + 3) = v90;
      *(float *)&double v91 = SetLightingColors2D((uint64_t)&v213, v210.f32, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v91);
      [a5 setVertex2DPointer:&v210];
      [a5 setTextureCoordinatesPointer:&v207 onTextureUnit:0];
      [a5 setColorsPointer:&v213];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      id v36 = a6;
    }

    objc_msgSend(v64, "unsetOnContext:onTextureUnit:state:", a5, 0, &v190, v83);
    [v64 releaseByUser];
    float v53 = v182;
  }

  float v161 = v173 * v28.__sinval;
  float v92 = v54;
  float v166 = v92;
  float v93 = y + (float)((float)(v182 - (float)(v182 * v28.__cosval)) * v189);
  float v167 = v93;
  id v94 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v46)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v36,  v164);
  id v96 = v94;
  float v97 = *((float *)&v185 + 1) - *(float *)&v188.i32[1];
  if (v46 == v39) {
    float v97 = v189;
  }
  float v174 = (float)(v53 * -2.0) + 1.0;
  if (v46 == v39) {
    float v98 = (float)(v53 * -2.0) + 1.0;
  }
  else {
    float v98 = -1.0;
  }
  *(float *)&double v95 = (float)(v57 - *(float *)v188.i32) / v97;
  [v94 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v95];
  unint64_t v198 = (unint64_t)v188;
  *(float *)float v199 = v49;
  *(int32x2_t *)&v199[4] = v168;
  float v200 = *((float *)&v185 + 1);
  float v201 = v49;
  float v202 = *((float *)&v185 + 1);
  LODWORD(v191) = -1082130432;
  *((float *)&v191 + 1) = v98;
  float v192 = 1.0;
  *(float *)float v193 = v98;
  *(_OWORD *)&v193[4] = xmmword_1FB9D0;
  *(float *)&double v99 = SetLightingColors2D((uint64_t)&v213, (float *)&v198, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v99);
  [a5 setVertex2DPointer:&v198];
  [a5 setTextureCoordinatesPointer:&v191 onTextureUnit:0];
  [a5 setColorsPointer:&v213];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  float v181 = v58;
  if (v57 >= v58)
  {
    double v101 = v164;
    uint64_t v102 = (uint64_t)v169;
    float v108 = *(float *)&v188.i32[1];
  }

  else
  {
    id v100 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v162)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v36,  v164);
    double v101 = v164;
    uint64_t v102 = (uint64_t)v169;
    if (v100 == v96)
    {
      [v96 releaseByUser];
      float v105 = v58;
      signed int v106 = v163;
    }

    else
    {
      float v103 = v100;
      [v96 unsetOnContext:a5 onTextureUnit:0 state:&v190];
      [v96 releaseByUser];
      float v105 = v58;
      signed int v106 = v163;
      float v107 = v189;
      if (v162 != v163) {
        float v107 = *((float *)&v185 + 1) - *(float *)&v188.i32[1];
      }
      *(float *)&double v104 = (float)(v58 - v57) / v107;
      [v103 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v104];
      id v96 = v103;
    }

    float v108 = *(float *)&v188.i32[1];
    v210.i64[0] = __PAIR64__(v188.u32[1], LODWORD(v57));
    v210.i64[1] = __PAIR64__(v188.u32[1], LODWORD(v105));
    unint64_t v211 = __PAIR64__(HIDWORD(v185), LODWORD(v57));
    unint64_t v212 = __PAIR64__(HIDWORD(v185), LODWORD(v105));
    float v109 = -1.0;
    if (v162 == v106) {
      float v109 = v174;
    }
    v207.i32[0] = -1082130432;
    v207.f32[1] = v109;
    LODWORD(v208) = 1065353216;
    *((float *)&v208 + 1) = v109;
    __int128 v209 = xmmword_1FB9D0;
    *(float *)&double v110 = SetLightingColors2D((uint64_t)&v213, v210.f32, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v110);
    [a5 setVertex2DPointer:&v210];
    [a5 setTextureCoordinatesPointer:&v207 onTextureUnit:0];
    [a5 setColorsPointer:&v213];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
  }

  float v111 = y + (float)((float)(v182 - (float)(v173 * v28.__cosval)) * v189);
  float v170 = v111;
  [v96 unsetOnContext:a5 onTextureUnit:0 state:&v190];
  [v96 releaseByUser];
  [a5 cull:2];
  id v112 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v39)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v101);
  id v113 = v112;
  HIDWORD(v114) = v188.i32[1];
  float v115 = v189;
  if (v46 != v39) {
    float v115 = v108 - v178;
  }
  double v116 = v101;
  if (v46 == v39) {
    float v117 = (float)(v182 * 2.0) + -1.0;
  }
  else {
    float v117 = 1.0;
  }
  *(float *)&double v114 = (float)(v166 - *(float *)v188.i32) / v115;
  [v112 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v114];
  unint64_t v198 = __PAIR64__(LODWORD(v167), v188.u32[0]);
  *(float *)float v199 = (float)(v182 * v28.__sinval) * v189;
  *(int32x2_t *)&v199[4] = v188;
  float v200 = 0.0;
  float v201 = v166;
  float v202 = v167;
  float v203 = *(float *)v199;
  float v204 = v166;
  float v205 = v108;
  float v206 = 0.0;
  v210.i64[0] = v102;
  v210.i32[2] = -1082130432;
  v210.f32[3] = v117;
  unint64_t v211 = 0xBF8000003F800000LL;
  LODWORD(v212) = 1065353216;
  *((float *)&v212 + 1) = v117;
  SetLightingColors((float *)&v213, (float *)&v198, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v198];
  [a5 setTextureCoordinatesPointer:&v210 onTextureUnit:0];
  [a5 setColorsPointer:&v213];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  if (v166 >= v58)
  {
    double v120 = v116;
    signed int v128 = v165;
    signed int v121 = v171;
    signed int v127 = v172;
    __int32 v129 = v188.i32[1];
    float v130 = v161 * v189;
  }

  else
  {
    uint64_t v118 = v102;
    id v119 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v163)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v116);
    double v120 = v116;
    signed int v121 = v171;
    if (v119 == v113)
    {
      [v113 releaseByUser];
      float v123 = v181;
      signed int v127 = v172;
      signed int v125 = v162;
    }

    else
    {
      float v122 = v119;
      [v113 unsetOnContext:a5 onTextureUnit:0 state:&v190];
      [v113 releaseByUser];
      float v123 = v181;
      HIDWORD(v124) = HIDWORD(v176);
      signed int v125 = v162;
      float v126 = v189;
      if (v162 != v163) {
        float v126 = v108 - v178;
      }
      *(float *)&double v124 = (float)((float)(v181 - *(float *)&v176) * 1.3333) / v126;
      [v122 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v124];
      id v113 = v122;
      signed int v127 = v172;
    }

    float v130 = v161 * v189;
    unint64_t v191 = __PAIR64__(LODWORD(v167), LODWORD(v166));
    float v192 = (float)(v182 * v28.__sinval) * v189;
    *(float *)float v193 = v166;
    __int32 v129 = v188.i32[1];
    *(void *)&v193[4] = v188.u32[1];
    *(float *)&v193[12] = v123;
    *(float *)&v193[16] = v167;
    float v194 = v192;
    float v195 = v123;
    float v196 = *(float *)&v188.i32[1];
    float v197 = 0.0;
    float v131 = 1.0;
    if (v125 == v163) {
      float v131 = (float)(v182 * 2.0) + -1.0;
    }
    float32x2_t v207 = (float32x2_t)v118;
    LODWORD(v208) = -1082130432;
    *((float *)&v208 + 1) = v131;
    *(void *)&__int128 v209 = 0xBF8000003F800000LL;
    DWORD2(v209) = 1065353216;
    *((float *)&v209 + 3) = v131;
    SetLightingColors((float *)&v213, (float *)&v191, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v191];
    [a5 setTextureCoordinatesPointer:&v207 onTextureUnit:0];
    [a5 setColorsPointer:&v213];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    signed int v128 = v165;
  }

  [v113 unsetOnContext:a5 onTextureUnit:0 state:&v190];
  [v113 releaseByUser];
  id v132 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v121)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v120);
  unint64_t v198 = (unint64_t)v188;
  *(_DWORD *)float v199 = 0;
  *(_DWORD *)&v199[4] = v188.i32[0];
  *(float *)&v199[8] = v170;
  float v200 = v130;
  float v201 = *(float *)&v185;
  float v202 = *(float *)&v129;
  float v203 = 0.0;
  float v204 = *(float *)&v185;
  float v205 = v170;
  float v206 = v130;
  float v133 = -1.0;
  if (v121 == v127) {
    float v133 = v174;
  }
  v210.i32[0] = -1082130432;
  v210.f32[1] = v133;
  v210.i64[1] = 0x3F800000BF800000LL;
  *((float *)&v211 + 1) = v133;
  __asm { FMOV            V15.2S, #1.0 }

  LODWORD(v211) = 1065353216;
  if (_ZF) {
    float v135 = @"slide0RefRect";
  }
  else {
    float v135 = @"slide2RefRect";
  }
  unint64_t v212 = (unint64_t)_D15;
  id v136 = [v15 objectForKey:v135];
  if (v136)
  {
    sscanf( (const char *)[v136 UTF8String],  "{{%lf, %lf}, {%lf, %lf}}",  &v213,  &v213.f64[1],  &v214,  &v214.f64[1]);
    float v137 = v181;
    if (v121 == v127)
    {
      v214.f64[1] = v214.f64[1] * 0.5;
      v213.f64[1] = (v213.f64[1] + v214.f64[1]) * 0.5;
      double v138 = @"slide0RefRectStretchFlags";
    }

    else
    {
      double v138 = @"slide2RefRectStretchFlags";
    }

    char v145 = objc_msgSend(objc_msgSend(v15, "objectForKey:", v138), "intValue");
    double v146 = *(float *)((char *)&self->mBackColorForImage[1] + 1);
    [a5 localAspectRatio];
    StretchRectangle(v213.f64, v145, v146, v147);
    *(float32x2_t *)&double v141 = vsub_f32(*(float32x2_t *)&v185, (float32x2_t)v188);
    _S4 = v210.i32[1];
    _S6 = v210.i32[3];
    float v144 = *((float *)&v185 + 1) - *(float *)&v188.i32[1];
    _D17 = vcvt_f32_f64( vdivq_f64( vcvtq_f64_f32((float32x2_t)__PAIR64__(*((float *)&v185 + 1) - *(float *)&v188.i32[1], LODWORD(v141))),  v214));
    __asm
    {
      FMOV            V7.2D, #2.0
      FMOV            V1.2D, #-1.0
    }

    *(float32x2_t *)&_Q7.f64[0] = vcvt_f32_f64( vaddq_f64( vmlaq_f64( vcvtq_f64_f32(_D17),  _Q7,  vdivq_f64(vsubq_f64(vcvtq_f64_f32((float32x2_t)v188), v213), v214)),  _Q1));
    float v142 = vmlas_n_f32(*(float *)_Q7.f64, v210.f32[0], _D17.f32[0]);
    __asm { FMLA            S3, S4, V17.S[1] }

    v210.i64[0] = __PAIR64__(LODWORD(_S3), LODWORD(v142));
    __asm { FMLA            S2, S6, V17.S[1] }

    v210.i64[1] = __PAIR64__( LODWORD(_S2),  COERCE_UNSIGNED_INT(vmlas_n_f32(*(float *)_Q7.f64, v210.f32[2], _D17.f32[0])));
    float32x2_t v140 = vmla_f32(*(float32x2_t *)&_Q7.f64[0], (float32x2_t)v211, _D17);
    unint64_t v211 = (unint64_t)v140;
    unint64_t v212 = (unint64_t)vmla_f32(*(float32x2_t *)&_Q7.f64[0], (float32x2_t)v212, _D17);
  }

  else
  {
    MyGLRectFromString([v15 objectForKey:@"slide0Rect"], &v210);
    _S2 = v210.f32[3];
    v140.i32[0] = v211;
    *(float32x2_t *)&double v141 = vsub_f32(*(float32x2_t *)&v185, (float32x2_t)v188);
    _S3 = v210.f32[1];
    float v142 = v210.f32[0];
    float v137 = v181;
    float v144 = *((float *)&v185 + 1) - *(float *)&v188.i32[1];
  }

  *(float *)&double v141 = (float)(*(float *)&v141 * (float)(_S2 - _S3)) / (float)(v144 * (float)(v140.f32[0] - v142));
  [v132 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v141];
  SetLightingColors((float *)&v213, (float *)&v198, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v198];
  [a5 setTextureCoordinatesPointer:&v210 onTextureUnit:0];
  [a5 setColorsPointer:&v213];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  double v153 = v185;
  if (*(float *)&v185 < v137)
  {
    id v154 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  v185),  "objectForKey:",  ImageKey(v37)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v120);
    if (v154 == v132)
    {
      [v132 releaseByUser];
      unsigned int v158 = LODWORD(v185);
    }

    else
    {
      float v155 = v154;
      [v132 unsetOnContext:a5 onTextureUnit:0 state:&v190];
      [v132 releaseByUser];
      HIDWORD(v156) = HIDWORD(v185);
      float v157 = v189;
      if (v37 != v128) {
        float v157 = *((float *)&v185 + 1) - *(float *)&v188.i32[1];
      }
      *(float *)&double v156 = (float)(v137 - *(float *)&v185) / v157;
      [v155 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v190 state:v156];
      unsigned int v158 = LODWORD(v185);
      id v132 = v155;
    }

    unint64_t v191 = __PAIR64__(v129, v158);
    float v192 = 0.0;
    *(_DWORD *)float v193 = v158;
    *(float *)&v193[4] = v170;
    *(float *)&v193[8] = v130;
    *(float *)&v193[12] = v137;
    *(_DWORD *)&v193[16] = v129;
    float v194 = 0.0;
    float v195 = v137;
    float v196 = v170;
    float v197 = v130;
    float v159 = -1.0;
    if (v37 == v128) {
      float v159 = v174;
    }
    v207.i32[0] = -1082130432;
    v207.f32[1] = v159;
    uint64_t v208 = 0x3F800000BF800000LL;
    LODWORD(v209) = 1065353216;
    *((float *)&v209 + 1) = v159;
    *((float32x2_t *)&v209 + 1) = _D15;
    SetLightingColors((float *)&v213, (float *)&v191, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v191];
    [a5 setTextureCoordinatesPointer:&v207 onTextureUnit:0];
    [a5 setColorsPointer:&v213];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
  }

  objc_msgSend(v132, "unsetOnContext:onTextureUnit:state:", a5, 0, &v190, v153);
  [v132 releaseByUser];
  [a5 cull:0];
}

- (void)renderFoldLeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  CGFloat width = a7.size.width;
  double v47 = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = [a8 objectForKey:@"recto"];
  id v18 = [a8 objectForKey:@"verso"];
  *(float *)&double v19 = a4;
  [*(id *)((char *)&self->mBigSwing + 1) valueAtTime:v19];
  __float2 v23 = __sincosf_stret(3.1416 - v20);
  float cosval = v23.__cosval;
  LODWORD(v21) = *(void *)&v23;
  float v24 = x;
  float v25 = y;
  float v26 = width;
  *(float *)&CGFloat width = height;
  signed int v27 = objc_msgSend(objc_msgSend(v17, "objectForKey:", @"slide0"), "intValue");
  signed int v28 = objc_msgSend(objc_msgSend(v17, "objectForKey:", @"slide4"), "intValue");
  signed int v45 = objc_msgSend(objc_msgSend(v17, "objectForKey:", @"slide5"), "intValue");
  float v46 = v24 + (float)((float)(v26 * 0.33333) * (float)(1.0 - cosval));
  id v29 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)objc_msgSend(objc_msgSend(v18, "objectForKey:", @"slide0"), "intValue"))),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  double v30 = v47 * 0.666666687 / height;
  float v31 = v30;
  *(float *)&double v30 = v31;
  [v29 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v50 state:v30];
  v72[0] = v24 + (float)(v26 * 0.33333);
  v72[1] = v25;
  float v44 = *(float *)&width;
  float v32 = v25 + *(float *)&width;
  v72[2] = v72[0];
  v72[3] = v32;
  v72[4] = v24 + v26;
  v72[5] = v25;
  v72[6] = v24 + v26;
  v72[7] = v32;
  v71[0] = xmmword_1FBB64;
  v71[1] = unk_1FBB74;
  *(float *)&double v33 = SetLightingColors2D((uint64_t)v70, v72, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v33);
  [a5 setVertex2DPointer:v72];
  [a5 setTextureCoordinatesPointer:v71 onTextureUnit:0];
  [a5 setColorsPointer:v70];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v29 unsetOnContext:a5 onTextureUnit:0 state:&v50];
  [v29 releaseByUser];
  id v34 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v27)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  *(float *)&double v35 = v31;
  [v34 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v50 state:v35];
  [*(id *)((char *)&self->mBigSwing + 1) timeFirstAtRestValue];
  if (v36 > a4)
  {
    float v58 = v24;
    float v59 = y;
    float v60 = v24;
    float v61 = v32;
    float v62 = v24 + (float)(v26 * 0.33333);
    float v63 = y;
    float v64 = v62;
    float v65 = v32;
    __int128 v51 = xmmword_1FBAC4;
    __int128 v52 = *(_OWORD *)algn_1FBAD4;
    *(float *)&double v37 = SetLightingColors2D((uint64_t)v70, &v58, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v37);
    [a5 setVertex2DPointer:&v58];
    [a5 setTextureCoordinatesPointer:&v51 onTextureUnit:0];
    [a5 setColorsPointer:v70];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
  }

  [a5 cull:1];
  float v58 = v24 + (float)(v26 * 0.33333);
  float v59 = y;
  float v60 = 0.0;
  float v61 = v24 + (float)((float)(v26 * 0.33333) * (float)(1.0 - cosval));
  float v62 = y;
  float v63 = (float)(v26 * 0.33333) * v21;
  float v64 = v58;
  float v65 = v32;
  int v66 = 0;
  float v67 = v61;
  float v68 = v32;
  float v69 = v63;
  v57[0] = xmmword_1FBA24;
  v57[1] = *(_OWORD *)algn_1FBA34;
  SetLightingColors(v70, &v58, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v58];
  [a5 setTextureCoordinatesPointer:v57 onTextureUnit:0];
  [a5 setColorsPointer:v70];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v34 unsetOnContext:a5 onTextureUnit:0 state:&v50];
  [v34 releaseByUser];
  [a5 cull:0];
  id v38 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v28)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  *(float *)&double v39 = v31;
  [v38 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v50 state:v39];
  [*(id *)((char *)&self->mBigSwing + 1) timeFirstAtRestValue];
  *(float *)&__int128 v51 = v24 + (float)((float)(v26 * 0.33333) * (float)(1.0 - cosval));
  *((float *)&v51 + 1) = y;
  *((float *)&v51 + 2) = (float)(v26 * 0.33333) * v21;
  *((float *)&v51 + 3) = *(float *)&v51;
  *(float *)&__int128 v52 = v25 + (float)(v44 * 0.5);
  *((float *)&v52 + 1) = *((float *)&v51 + 2);
  if (v40 <= a4)
  {
    *((float *)&v52 + 2) = v24 + (float)(v26 * 0.33333);
    *((float *)&v52 + 3) = y;
    float v53 = 0.0;
    float v54 = *((float *)&v52 + 2);
    float v55 = v25 + (float)(v44 * 0.5);
    float v56 = 0.0;
  }

  else
  {
    *((float *)&v52 + 2) = v46 + (float)(v26 * 0.33333);
    *((float *)&v52 + 3) = y;
    float v53 = (float)(v26 * 0.33333) * v21;
    float v54 = *((float *)&v52 + 2);
    float v55 = v25 + (float)(v44 * 0.5);
    float v56 = v53;
  }

  SetLightingColors(v70, (float *)&v51, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v51];
  [a5 setTextureCoordinatesPointer:v71 onTextureUnit:0];
  [a5 setColorsPointer:v70];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v38 unsetOnContext:a5 onTextureUnit:0 state:&v50];
  [v38 releaseByUser];
  id v41 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v45)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  *(float *)&double v42 = v31;
  [v41 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v50 state:v42];
  [*(id *)((char *)&self->mBigSwing + 1) timeFirstAtRestValue];
  *(float *)&__int128 v51 = v24 + (float)((float)(v26 * 0.33333) * (float)(1.0 - cosval));
  *((float *)&v51 + 1) = v25 + (float)(v44 * 0.5);
  *((float *)&v51 + 2) = (float)(v26 * 0.33333) * v21;
  *((float *)&v51 + 3) = *(float *)&v51;
  *(float *)&__int128 v52 = v32;
  *((float *)&v52 + 1) = *((float *)&v51 + 2);
  if (v43 <= a4)
  {
    *((float *)&v52 + 2) = v24 + (float)(v26 * 0.33333);
    *((float *)&v52 + 3) = v25 + (float)(v44 * 0.5);
    float v53 = 0.0;
    float v54 = *((float *)&v52 + 2);
    float v55 = v32;
    float v56 = 0.0;
  }

  else
  {
    *((float *)&v52 + 2) = v46 + (float)(v26 * 0.33333);
    *((float *)&v52 + 3) = v25 + (float)(v44 * 0.5);
    float v53 = (float)(v26 * 0.33333) * v21;
    float v54 = *((float *)&v52 + 2);
    float v55 = v32;
    float v56 = v53;
  }

  SetLightingColors(v70, (float *)&v51, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v51];
  [a5 setTextureCoordinatesPointer:v71 onTextureUnit:0];
  [a5 setColorsPointer:v70];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v41 unsetOnContext:a5 onTextureUnit:0 state:&v50];
  [v41 releaseByUser];
}

- (void)renderFoldDownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  CGFloat y = a7.origin.y;
  double x = a7.origin.x;
  double v43 = a3;
  *(float *)&a3 = a4;
  [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:a3];
  __float2 v18 = __sincosf_stret(3.1416 - v17);
  float v19 = x;
  float v39 = v19;
  float v20 = y;
  float v21 = width;
  float v37 = v21;
  *(float *)&CGFloat y = height;
  signed int v22 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide0Index"), "intValue");
  signed int v23 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide1Index"), "intValue");
  float v38 = height;
  float v24 = v20 + (float)((float)(*(float *)&y * 0.33333) * (float)(1.0 - v18.__cosval));
  float v25 = (float)(*(float *)&y * 0.33333) * v18.__sinval;
  id v26 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v22)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v43);
  double v40 = height;
  double v41 = width;
  double v27 = width / (height * 0.666666687);
  *(float *)&double v27 = v27;
  [v26 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v44 state:v27];
  [*(id *)((char *)&self->mBreakCurve + 1) timeFirstAtRestValue];
  double v42 = a4;
  if (v28 <= a4)
  {
    float v29 = height;
    float v30 = v39;
    float v31 = v20 + (float)(v38 * 0.33333);
    float v32 = v39 + v37;
  }

  else
  {
    float v29 = height;
    float v30 = v39;
    float v53 = v39;
    float v54 = v20;
    float v31 = v20 + (float)(v38 * 0.33333);
    float v55 = v39;
    float v56 = v31;
    float v32 = v39 + v37;
    float v57 = v39 + v37;
    float v58 = v20;
    float v59 = v39 + v37;
    float v60 = v31;
    __int128 v45 = xmmword_1FBA44;
    __int128 v46 = unk_1FBA54;
    *(float *)&double v33 = SetLightingColors2D((uint64_t)v65, &v53, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v33);
    [a5 setVertex2DPointer:&v53];
    [a5 setTextureCoordinatesPointer:&v45 onTextureUnit:0];
    [a5 setColorsPointer:v65];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
  }

  [a5 cull:2];
  float v53 = v30;
  float v54 = v31;
  float v55 = 0.0;
  float v56 = v30;
  float v57 = v24;
  float v58 = v25;
  float v59 = v32;
  float v60 = v31;
  int v61 = 0;
  float v62 = v32;
  float v63 = v24;
  float v64 = v25;
  v52[0] = xmmword_1FBA64;
  v52[1] = unk_1FBA74;
  SetLightingColors(v65, &v53, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v53];
  [a5 setTextureCoordinatesPointer:v52 onTextureUnit:0];
  [a5 setColorsPointer:v65];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v26 unsetOnContext:a5 onTextureUnit:0 state:&v44];
  [v26 releaseByUser];
  [a5 cull:0];
  id v34 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v23)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v43);
  double v35 = v41 / (v40 * 0.333333343);
  *(float *)&double v35 = v35;
  [v34 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v44 state:v35];
  v51[0] = xmmword_1FBB64;
  v51[1] = unk_1FBB74;
  [*(id *)((char *)&self->mBreakCurve + 1) timeFirstAtRestValue];
  *(void *)&__int128 v45 = __PAIR64__(LODWORD(v24), LODWORD(v30));
  *((void *)&v45 + 1) = __PAIR64__(LODWORD(v30), LODWORD(v25));
  if (v36 <= v42)
  {
    *(void *)&__int128 v46 = LODWORD(v31);
    *((void *)&v46 + 1) = __PAIR64__(LODWORD(v24), LODWORD(v32));
    float v47 = v25;
    float v48 = v32;
    float v49 = v31;
    float v50 = 0.0;
  }

  else
  {
    *(float *)&__int128 v46 = v24 + (float)(v29 * 0.33333);
    *(void *)((char *)&v46 + 4) = __PAIR64__(LODWORD(v32), LODWORD(v25));
    *((float *)&v46 + 3) = v24;
    float v47 = v25;
    float v48 = v32;
    float v49 = *(float *)&v46;
    float v50 = v25;
  }

  SetLightingColors(v65, (float *)&v45, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:&v45];
  [a5 setTextureCoordinatesPointer:v51 onTextureUnit:0];
  [a5 setColorsPointer:v65];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v34 unsetOnContext:a5 onTextureUnit:0 state:&v44];
  [v34 releaseByUser];
}

- (void)render1To3DownAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  float height = a7.size.height;
  signed int v16 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide0Index"), "intValue");
  signed int v17 = v16;
  signed int v88 = v16;
  if ([a8 objectForKey:@"slide1Index"]) {
    signed int v88 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide1Index"), "intValue");
  }
  float v18 = width;
  float v19 = x;
  float v20 = y;
  if ([a8 objectForKey:@"slide2Index"]) {
    signed int v17 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide2Index"), "intValue");
  }
  float v21 = a4;
  float v87 = height * 0.33333;
  float v22 = v18 / (float)(height * 0.33333);
  signed int v23 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide3Index"), "intValue");
  signed int v24 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide4Index"), "intValue");
  signed int v86 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide5Index"), "intValue");
  id v25 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v23)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  float v26 = v20 + (float)(height * 0.66667);
  v127[0] = v19;
  v127[1] = v26;
  v127[2] = v19;
  v127[3] = v20 + height;
  float v27 = v19 + v18;
  v127[4] = v19 + v18;
  v127[5] = v26;
  v127[6] = v19 + v18;
  v127[7] = v20 + height;
  __int128 v125 = xmmword_1FBB64;
  *(_OWORD *)float v126 = unk_1FBB74;
  id v28 = [a8 objectForKey:@"slide3Rect"];
  if (v28)
  {
    float32x4_t v29 = MyGLRectFromString(v28, (float32x4_t *)&v125);
    v29.f32[0] = *((float *)&v125 + 3) - *((float *)&v125 + 1);
    float v30 = v126[0] - *(float *)&v125;
  }

  else
  {
    v29.i32[0] = 2.0;
    float v30 = 2.0;
  }

  v29.f32[0] = (float)(v22 * v29.f32[0]) / v30;
  [v25 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:*(double *)v29.i64];
  *(float *)&double v31 = SetLightingColors2D((uint64_t)v124, v127, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v31);
  [a5 setVertex2DPointer:v127];
  [a5 setTextureCoordinatesPointer:&v125 onTextureUnit:0];
  [a5 setColorsPointer:v124];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v25 unsetOnContext:a5 onTextureUnit:0 state:&v91];
  [v25 releaseByUser];
  if (v21 >= 0.33333)
  {
    id v46 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v24)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    float v47 = v20 + (float)(height * 0.33333);
    float v116 = v19;
    float v117 = v47;
    float v118 = v19;
    float v119 = v26;
    float v120 = v19 + v18;
    float v121 = v47;
    float v122 = v19 + v18;
    float v123 = v26;
    __int128 v114 = xmmword_1FBB64;
    __int128 v115 = unk_1FBB74;
    id v48 = [a8 objectForKey:@"slide4Rect"];
    if (v48)
    {
      float32x4_t v49 = MyGLRectFromString(v48, (float32x4_t *)&v114);
      v49.f32[0] = *((float *)&v114 + 3) - *((float *)&v114 + 1);
      float v50 = *(float *)&v115 - *(float *)&v114;
    }

    else
    {
      v49.i32[0] = 2.0;
      float v50 = 2.0;
    }

    v49.f32[0] = (float)(v22 * v49.f32[0]) / v50;
    [v46 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:*(double *)v49.i64];
    *(float *)&double v65 = SetLightingColors2D((uint64_t)v124, &v116, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v65);
    [a5 setVertex2DPointer:&v116];
    [a5 setTextureCoordinatesPointer:&v114 onTextureUnit:0];
    [a5 setColorsPointer:v124];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v46 unsetOnContext:a5 onTextureUnit:0 state:&v91];
    [v46 releaseByUser];
    double v66 = v21 * 1.5 + -0.5;
    float v67 = v66;
    *(float *)&double v66 = v67;
    [*(id *)((char *)&self->mThirdsSwingTop + 1) valueAtTime:v66];
    __float2 v69 = __sincosf_stret(3.1416 - v68);
    float v96 = v19;
    float v97 = v20 + (float)(v87 * (float)(1.0 - v69.__cosval));
    float v98 = v87 * v69.__sinval;
    float v99 = v19;
    float v100 = v47;
    float v101 = 0.0;
    float v102 = v19 + v18;
    float v103 = v97;
    float v104 = v87 * v69.__sinval;
    float v105 = v19 + v18;
    float v106 = v47;
    float v107 = 0.0;
    [*(id *)((char *)&self->mThirdsSwingTop + 1) timeFirstAtRestValue];
    if (v70 > v67)
    {
      id v71 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v17)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      *(void *)&__int128 v112 = __PAIR64__(LODWORD(v20), LODWORD(v19));
      *((void *)&v112 + 1) = __PAIR64__(LODWORD(v47), LODWORD(v19));
      *(float *)&__int128 v113 = v19 + v18;
      *((float *)&v113 + 1) = v20;
      *((float *)&v113 + 2) = v19 + v18;
      *((float *)&v113 + 3) = v47;
      __asm { FMOV            V0.2S, #-1.0 }

      v108.i64[0] = _D0;
      v108.i32[2] = -1082130432;
      if (v88 == v16) {
        float v73 = -0.33333;
      }
      else {
        float v73 = 1.0;
      }
      v108.f32[3] = v73;
      unint64_t v109 = 0xBF8000003F800000LL;
      int v110 = 1065353216;
      float v111 = v73;
      id v74 = [a8 objectForKey:@"slide2Rect"];
      if (v74)
      {
        float32x4_t v75 = MyGLRectFromString(v74, &v108);
        float v73 = v108.f32[3];
        float v76 = v108.f32[1];
        v75.f32[0] = *(float *)&v109 - v108.f32[0];
      }

      else
      {
        v75.i32[0] = 2.0;
        float v76 = -1.0;
      }

      v75.f32[0] = (float)(v22 * (float)(v73 - v76)) / v75.f32[0];
      [v71 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:*(double *)v75.i64];
      *(float *)&double v77 = SetLightingColors2D((uint64_t)v124, (float *)&v112, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v77);
      [a5 setVertex2DPointer:&v112];
      [a5 setTextureCoordinatesPointer:&v108 onTextureUnit:0];
      [a5 setColorsPointer:v124];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      v92.i32[0] = -1082130432;
      if (v88 == v16) {
        float v78 = 0.33333;
      }
      else {
        float v78 = -1.0;
      }
      v92.f32[1] = v78;
      v92.i64[1] = 0x3F800000BF800000LL;
      float v93 = 1.0;
      float v94 = v78;
      __asm { FMOV            V0.2S, #1.0 }

      uint64_t v95 = _D0;
      id v80 = [a8 objectForKey:@"slide0Rect"];
      if (v80) {
        *(void *)&double v81 = MyGLRectFromString(v80, &v92).u64[0];
      }
      id v82 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  v81),  "objectForKey:",  ImageKey(v16)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      if (v82 != v71)
      {
        [v71 unsetOnContext:a5 onTextureUnit:0 state:&v91];
        *(float *)&double v83 = (float)(v22 * (float)(v92.f32[3] - v92.f32[1])) / (float)(v93 - v92.f32[0]);
        [v82 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:v83];
      }

      [v71 releaseByUser];
      [a5 cull:1];
      SetLightingColors(v124, &v96, *(float *)[a5 foreColor]);
      [a5 setShader:@"ColoredTexture"];
      [a5 setVertex3DPointer:&v96];
      [a5 setTextureCoordinatesPointer:&v92 onTextureUnit:0];
      [a5 setColorsPointer:v124];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      [v82 unsetOnContext:a5 onTextureUnit:0 state:&v91];
      [v82 releaseByUser];
    }

    id v84 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v86)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    __int128 v112 = xmmword_1FBB64;
    HIDWORD(v85) = unk_1FBB78;
    __int128 v113 = unk_1FBB74;
    *(float *)&double v85 = (float)(v22 + v22) * 0.5;
    [v84 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:v85];
    [a5 cull:2];
    SetLightingColors(v124, &v96, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v96];
    [a5 setTextureCoordinatesPointer:&v112 onTextureUnit:0];
    [a5 setColorsPointer:v124];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v84 unsetOnContext:a5 onTextureUnit:0 state:&v91];
    [v84 releaseByUser];
    [a5 cull:0];
  }

  else
  {
    *(float *)&double v32 = v21 * 3.0;
    [*(id *)((char *)&self->mSideSwing + 1) valueAtTime:v32];
    __float2 v34 = __sincosf_stret(v33);
    id v35 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v17)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    float v117 = v20;
    float v118 = v19;
    float v36 = v20 + (float)(height * 0.33333);
    float v119 = v36;
    float v120 = v19 + v18;
    float v121 = v20;
    float v122 = v19 + v18;
    float v123 = v36;
    __asm { FMOV            V0.2S, #-1.0 }

    *(void *)&__int128 v114 = _D0;
    DWORD2(v114) = -1082130432;
    if (v88 == v16) {
      float v42 = -0.33333;
    }
    else {
      float v42 = 1.0;
    }
    *((float *)&v114 + 3) = v42;
    *(void *)&__int128 v115 = 0xBF8000003F800000LL;
    DWORD2(v115) = 1065353216;
    *((float *)&v115 + 3) = v42;
    float v116 = v19;
    id v43 = [a8 objectForKey:@"slide2Rect"];
    if (v43)
    {
      float32x4_t v44 = MyGLRectFromString(v43, (float32x4_t *)&v114);
      float v42 = *((float *)&v114 + 3);
      float v45 = *((float *)&v114 + 1);
      v44.f32[0] = *(float *)&v115 - *(float *)&v114;
    }

    else
    {
      v44.i32[0] = 2.0;
      float v45 = -1.0;
    }

    v44.f32[0] = (float)(v22 * (float)(v42 - v45)) / v44.f32[0];
    [v35 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:*(double *)v44.i64];
    *(float *)&double v51 = SetLightingColors2D((uint64_t)v124, &v116, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v51);
    [a5 setVertex2DPointer:&v116];
    [a5 setTextureCoordinatesPointer:&v114 onTextureUnit:0];
    [a5 setColorsPointer:v124];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v52 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v88)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    *(void *)&__int128 v112 = __PAIR64__(LODWORD(v36), LODWORD(v19));
    *((void *)&v112 + 1) = __PAIR64__(LODWORD(v26), LODWORD(v19));
    *(void *)&__int128 v113 = __PAIR64__(LODWORD(v36), LODWORD(v27));
    *((void *)&v113 + 1) = __PAIR64__(LODWORD(v26), LODWORD(v27));
    v108.i32[0] = -1082130432;
    float v53 = -1.0;
    if (v88 == v16) {
      float v53 = -0.33333;
    }
    *(uint64_t *)((char *)v108.i64 + 4) = LODWORD(v53) | 0xBF80000000000000LL;
    float v54 = 1.0;
    if (v88 == v16) {
      float v54 = 0.33333;
    }
    v108.f32[3] = v54;
    LODWORD(v109) = 1065353216;
    *((float *)&v109 + 1) = v53;
    int v110 = 1065353216;
    float v111 = v54;
    id v55 = [a8 objectForKey:@"slide1Rect"];
    if (v55) {
      *(void *)&double v56 = MyGLRectFromString(v55, &v108).u64[0];
    }
    if (v52 != v35)
    {
      objc_msgSend(v35, "unsetOnContext:onTextureUnit:state:", a5, 0, &v91, v56);
      *(float *)&double v57 = (float)(v22 * (float)(v108.f32[3] - v108.f32[1])) / (float)(*(float *)&v109 - v108.f32[0]);
      [v52 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:v57];
    }

    [v35 releaseByUser];
    *(float *)&double v58 = SetLightingColors2D((uint64_t)v124, (float *)&v112, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v58);
    [a5 setVertex2DPointer:&v112];
    [a5 setTextureCoordinatesPointer:&v108 onTextureUnit:0];
    [a5 setColorsPointer:v124];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v59 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v16)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    float v96 = v19;
    float v97 = v26;
    float v98 = 0.0;
    float v99 = v19;
    float v100 = v20 + (float)(v87 * (float)(v34.__cosval + 2.0));
    float v101 = v87 * v34.__sinval;
    float v102 = v27;
    float v103 = v26;
    float v104 = 0.0;
    float v105 = v27;
    float v106 = v100;
    float v107 = v87 * v34.__sinval;
    v92.i32[0] = -1082130432;
    float v60 = -1.0;
    if (v88 == v16) {
      float v60 = 0.33333;
    }
    v92.f32[1] = v60;
    v92.i64[1] = 0x3F800000BF800000LL;
    float v93 = 1.0;
    float v94 = v60;
    __asm { FMOV            V0.2S, #1.0 }

    uint64_t v95 = _D0;
    id v62 = [a8 objectForKey:@"slide0Rect"];
    if (v62) {
      *(void *)&double v63 = MyGLRectFromString(v62, &v92).u64[0];
    }
    if (v59 != v52)
    {
      objc_msgSend(v52, "unsetOnContext:onTextureUnit:state:", a5, 0, &v91, v63);
      *(float *)&double v64 = (float)(v22 * (float)(v92.f32[3] - v92.f32[1])) / (float)(v93 - v92.f32[0]);
      [v59 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v91 state:v64];
    }

    [v52 releaseByUser];
    SetLightingColors(v124, &v96, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v96];
    [a5 setTextureCoordinatesPointer:&v92 onTextureUnit:0];
    [a5 setColorsPointer:v124];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v59 unsetOnContext:a5 onTextureUnit:0 state:&v91];
    [v59 releaseByUser];
  }

- (void)render1To3LeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  float v13 = a4;
  float x = a7.origin.x;
  float y = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  float v74 = width * 0.33333;
  float v18 = (float)(width * 0.33333) / height;
  signed int v73 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide0Index"), "intValue");
  signed int v69 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide1Index"), "intValue");
  signed int v72 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide2Index"), "intValue");
  signed int v19 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide3Index"), "intValue");
  signed int v20 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide4Index"), "intValue");
  signed int v70 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"slide5Index"), "intValue");
  double v75 = a3;
  id v21 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v19)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  v108[0] = x;
  v108[1] = y;
  float v22 = y + height;
  v108[2] = x;
  v108[3] = y + height;
  float v109 = x + (float)(width * 0.33333);
  float v110 = y;
  float v111 = v109;
  float v112 = y + height;
  __int128 v106 = xmmword_1FBB64;
  *(_OWORD *)float v107 = unk_1FBB74;
  id v23 = [a8 objectForKey:@"slide3Rect"];
  if (v23)
  {
    float32x4_t v24 = MyGLRectFromString(v23, (float32x4_t *)&v106);
    v24.f32[0] = *((float *)&v106 + 3) - *((float *)&v106 + 1);
    float v25 = v107[0] - *(float *)&v106;
  }

  else
  {
    v24.i32[0] = 2.0;
    float v25 = 2.0;
  }

  v24.f32[0] = (float)(v18 * v24.f32[0]) / v25;
  [v21 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:*(double *)v24.i64];
  *(float *)&double v26 = SetLightingColors2D((uint64_t)v105, v108, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v26);
  [a5 setVertex2DPointer:v108];
  [a5 setTextureCoordinatesPointer:&v106 onTextureUnit:0];
  [a5 setColorsPointer:v105];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [v21 unsetOnContext:a5 onTextureUnit:0 state:&v76];
  [v21 releaseByUser];
  if (v13 >= 0.33333)
  {
    id v34 = a6;
    id v35 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v20)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v75);
    float v97 = x + (float)(width * 0.33333);
    float v98 = y;
    float v99 = v97;
    float v100 = y + height;
    float v101 = x + (float)(width * 0.66667);
    float v102 = y;
    float v103 = v101;
    float v104 = y + height;
    __int128 v95 = xmmword_1FBB64;
    __int128 v96 = unk_1FBB74;
    id v36 = [a8 objectForKey:@"slide4Rect"];
    v37.i32[0] = 2.0;
    float v38 = 2.0;
    if (v36)
    {
      float32x4_t v37 = MyGLRectFromString(v36, (float32x4_t *)&v95);
      v37.f32[0] = *((float *)&v95 + 3) - *((float *)&v95 + 1);
      float v38 = *(float *)&v96 - *(float *)&v95;
    }

    v37.f32[0] = (float)(v18 * v37.f32[0]) / v38;
    [v35 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:*(double *)v37.i64];
    *(float *)&double v39 = SetLightingColors2D((uint64_t)v105, &v97, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v39);
    [a5 setVertex2DPointer:&v97];
    [a5 setTextureCoordinatesPointer:&v95 onTextureUnit:0];
    [a5 setColorsPointer:v105];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v35 unsetOnContext:a5 onTextureUnit:0 state:&v76];
    [v35 releaseByUser];
    double v40 = v13 * 1.5 + -0.5;
    float v41 = v40;
    *(float *)&double v40 = v41;
    [*(id *)((char *)&self->mThirdsSwingTop + 1) valueAtTime:v40];
    __float2 v43 = __sincosf_stret(3.1416 - v42);
    float v79 = x + (float)(width * 0.66667);
    float v80 = y;
    float v81 = 0.0;
    float v82 = x + (float)(v74 * (float)(v43.__cosval + 2.0));
    float v83 = y;
    float v84 = v74 * v43.__sinval;
    float v85 = v79;
    float v86 = v22;
    float v87 = 0.0;
    float v88 = v82;
    float v89 = v22;
    float v90 = v74 * v43.__sinval;
    [*(id *)((char *)&self->mThirdsSwingTop + 1) timeFirstAtRestValue];
    if (v44 > v41)
    {
      id v45 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v72)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v34,  v75);
      *(float *)&__int128 v93 = x + (float)(width * 0.66667);
      *((float *)&v93 + 1) = y;
      *((float *)&v93 + 2) = *(float *)&v93;
      *((float *)&v93 + 3) = v22;
      *(float *)&__int128 v94 = x + width;
      *((float *)&v94 + 1) = y;
      *((float *)&v94 + 2) = x + width;
      *((float *)&v94 + 3) = v22;
      __int128 v91 = xmmword_1FBB64;
      __int128 v92 = unk_1FBB74;
      id v46 = [a8 objectForKey:@"slide2Rect"];
      if (v46)
      {
        float32x4_t v47 = MyGLRectFromString(v46, (float32x4_t *)&v91);
        v47.f32[0] = *((float *)&v91 + 3) - *((float *)&v91 + 1);
        float v48 = *(float *)&v92 - *(float *)&v91;
      }

      else
      {
        v47.i32[0] = 2.0;
        float v48 = 2.0;
      }

      v47.f32[0] = (float)(v18 * v47.f32[0]) / v48;
      [v45 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:*(double *)v47.i64];
      *(float *)&double v59 = SetLightingColors2D((uint64_t)v105, (float *)&v93, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v59);
      [a5 setVertex2DPointer:&v93];
      [a5 setTextureCoordinatesPointer:&v91 onTextureUnit:0];
      [a5 setColorsPointer:v105];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      __int128 v77 = xmmword_1FBA84;
      __int128 v78 = unk_1FBA94;
      id v60 = [a8 objectForKey:@"slide0Rect"];
      if (v60) {
        *(void *)&double v61 = MyGLRectFromString(v60, (float32x4_t *)&v77).u64[0];
      }
      id v62 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  v61),  "objectForKey:",  ImageKey(v73)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v34,  v75);
      if (v62 != v45)
      {
        [v45 unsetOnContext:a5 onTextureUnit:0 state:&v76];
        [v62 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:v63];
      }

      [v45 releaseByUser];
      [a5 cull:2];
      SetLightingColors(v105, &v79, *(float *)[a5 foreColor]);
      [a5 setShader:@"ColoredTexture"];
      [a5 setVertex3DPointer:&v79];
      [a5 setTextureCoordinatesPointer:&v77 onTextureUnit:0];
      [a5 setColorsPointer:v105];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      [v62 unsetOnContext:a5 onTextureUnit:0 state:&v76];
      [v62 releaseByUser];
    }

    id v64 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v70)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  v34,  v75);
    __int128 v93 = xmmword_1FBA84;
    __int128 v94 = unk_1FBA94;
    id v65 = [a8 objectForKey:@"slide5Rect"];
    if (v65)
    {
      float32x4_t v66 = MyGLRectFromString(v65, (float32x4_t *)&v93);
      v66.f32[0] = *((float *)&v94 + 1) - *((float *)&v93 + 1);
      float v67 = *((float *)&v93 + 2) - *(float *)&v93;
    }

    else
    {
      v66.i32[0] = 2.0;
      float v67 = 2.0;
    }

    v66.f32[0] = (float)(v18 * v66.f32[0]) / v67;
    [v64 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:*(double *)v66.i64];
    [a5 cull:1];
    SetLightingColors(v105, &v79, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v79];
    [a5 setTextureCoordinatesPointer:&v93 onTextureUnit:0];
    [a5 setColorsPointer:v105];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v64 unsetOnContext:a5 onTextureUnit:0 state:&v76];
    [v64 releaseByUser];
    [a5 cull:0];
  }

  else
  {
    *(float *)&double v27 = v13 * 3.0;
    [*(id *)((char *)&self->mSideSwing + 1) valueAtTime:v27];
    __float2 v29 = __sincosf_stret(v28);
    float cosval = v29.__cosval;
    LODWORD(v71) = *(void *)&v29;
    id v30 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v72)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v75);
    float v97 = x + (float)(width * 0.66667);
    float v98 = y;
    float v99 = v97;
    float v100 = y + height;
    float v101 = x + width;
    float v102 = y;
    float v103 = x + width;
    float v104 = y + height;
    __int128 v95 = xmmword_1FBB64;
    __int128 v96 = unk_1FBB74;
    id v31 = [a8 objectForKey:@"slide2Rect"];
    if (v31)
    {
      float32x4_t v32 = MyGLRectFromString(v31, (float32x4_t *)&v95);
      v32.f32[0] = *((float *)&v95 + 3) - *((float *)&v95 + 1);
      float v33 = *(float *)&v96 - *(float *)&v95;
    }

    else
    {
      v32.i32[0] = 2.0;
      float v33 = 2.0;
    }

    v32.f32[0] = (float)(v18 * v32.f32[0]) / v33;
    [v30 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:*(double *)v32.i64];
    *(float *)&double v49 = SetLightingColors2D((uint64_t)v105, &v97, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v49);
    [a5 setVertex2DPointer:&v97];
    [a5 setTextureCoordinatesPointer:&v95 onTextureUnit:0];
    [a5 setColorsPointer:v105];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v50 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v69)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v75);
    *(float *)&__int128 v93 = x + (float)(width * 0.33333);
    *((float *)&v93 + 1) = y;
    *((float *)&v93 + 2) = *(float *)&v93;
    *((float *)&v93 + 3) = y + height;
    *(float *)&__int128 v94 = x + (float)(width * 0.66667);
    *((float *)&v94 + 1) = y;
    *((float *)&v94 + 2) = *(float *)&v94;
    *((float *)&v94 + 3) = y + height;
    __int128 v91 = xmmword_1FBB64;
    __int128 v92 = unk_1FBB74;
    id v51 = [a8 objectForKey:@"slide1Rect"];
    if (v51) {
      *(void *)&double v52 = MyGLRectFromString(v51, (float32x4_t *)&v91).u64[0];
    }
    if (v50 != v30)
    {
      objc_msgSend(v30, "unsetOnContext:onTextureUnit:state:", a5, 0, &v76, v52);
      [v50 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:v53];
    }

    [v30 releaseByUser];
    *(float *)&double v54 = SetLightingColors2D((uint64_t)v105, (float *)&v93, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v54);
    [a5 setVertex2DPointer:&v93];
    [a5 setTextureCoordinatesPointer:&v91 onTextureUnit:0];
    [a5 setColorsPointer:v105];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v55 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v73)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  v75);
    float v79 = x + (float)(v74 * (float)(1.0 - cosval));
    float v80 = y;
    float v81 = v74 * v71;
    float v82 = x + (float)(width * 0.33333);
    float v83 = y;
    float v84 = 0.0;
    float v85 = v79;
    float v86 = y + height;
    float v87 = v74 * v71;
    float v88 = v82;
    float v89 = y + height;
    float v90 = 0.0;
    __int128 v77 = xmmword_1FBA84;
    __int128 v78 = unk_1FBA94;
    id v56 = [a8 objectForKey:@"slide0Rect"];
    if (v56) {
      *(void *)&double v57 = MyGLRectFromString(v56, (float32x4_t *)&v77).u64[0];
    }
    if (v55 != v50)
    {
      objc_msgSend(v50, "unsetOnContext:onTextureUnit:state:", a5, 0, &v76, v57);
      [v55 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v76 state:v58];
    }

    [v50 releaseByUser];
    SetLightingColors(v105, &v79, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v79];
    [a5 setTextureCoordinatesPointer:&v77 onTextureUnit:0];
    [a5 setColorsPointer:v105];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v55 unsetOnContext:a5 onTextureUnit:0 state:&v76];
    [v55 releaseByUser];
  }

- (void)renderFold4LeftAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  float v12 = a4;
  float x = a7.origin.x;
  float y = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  v82[0] = xmmword_1FBB64;
  v82[1] = unk_1FBB74;
  if (v12 >= 0.25)
  {
    id v35 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  a5,  a6,  a8),  "objectForKey:",  ImageKey(2)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    objc_msgSend(v35, "setOnContext:onTextureUnit:withReferenceAspectRatio:state:", a5, 0, v58);
    float v46 = x;
    float v47 = y + (float)(height * 0.33333);
    float v48 = x;
    float v49 = y + (float)(height * 0.66667);
    float v50 = x + width;
    float v51 = v47;
    float v52 = x + width;
    float v53 = v49;
    __int128 v80 = xmmword_1FBB64;
    __int128 v81 = unk_1FBB74;
    *(float *)&double v36 = SetLightingColors2D((uint64_t)v77, &v46, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v36);
    [a5 setVertex2DPointer:&v46];
    [a5 setTextureCoordinatesPointer:&v80 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v35 unsetOnContext:a5 onTextureUnit:0 state:v58];
    [v35 releaseByUser];
    if (v12 >= 0.66667)
    {
      id v32 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(3)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      *(float *)&double v42 = (float)(width * 3.0) / height;
      [v32 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:v58 state:v42];
      float v61 = x;
      float v62 = y;
      float v63 = x;
      float v64 = y + (float)(height * 0.33333);
      float v65 = x + width;
      float v66 = y;
      float v67 = x + width;
      float v68 = v64;
      __int128 v78 = xmmword_1FBB64;
      __int128 v79 = unk_1FBB74;
      *(float *)&double v43 = SetLightingColors2D((uint64_t)v77, &v61, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v43);
      [a5 setVertex2DPointer:&v61];
      [a5 setTextureCoordinatesPointer:&v78 onTextureUnit:0];
      [a5 setColorsPointer:v77];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
    }

    else
    {
      __float2 v37 = __sincosf_stret((float)((float)(v12 * 3.0) + -1.0) * 3.1416);
      id v38 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      *(float *)&double v39 = width / height;
      [v38 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:v58 state:v39];
      *(void *)&__int128 v78 = __PAIR64__(LODWORD(y), LODWORD(x));
      *((float *)&v78 + 2) = x;
      *((float *)&v78 + 3) = y + (float)(height * 0.33333);
      *(float *)&__int128 v79 = x + width;
      *((float *)&v79 + 1) = y;
      *((float *)&v79 + 2) = x + width;
      *((float *)&v79 + 3) = *((float *)&v78 + 3);
      __int128 v75 = xmmword_1FBB04;
      __int128 v76 = unk_1FBB14;
      *(float *)&double v40 = SetLightingColors2D((uint64_t)v77, (float *)&v78, *(float *)[a5 foreColor]);
      objc_msgSend(a5, "setShader:", @"ColoredTexture", v40);
      [a5 setVertex2DPointer:&v78];
      [a5 setTextureCoordinatesPointer:&v75 onTextureUnit:0];
      [a5 setColorsPointer:v77];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      float v61 = x;
      float v62 = y + (float)(height * 0.33333);
      float v63 = 0.0;
      float v64 = x;
      float v65 = y + (float)((float)(height * 0.33333) * (float)(v37.__cosval + 1.0));
      float v66 = v37.__sinval * (float)(height * 0.33333);
      float v67 = x + width;
      float v68 = v62;
      int v69 = 0;
      float v70 = x + width;
      float v71 = v65;
      float v72 = v66;
      __int128 v73 = xmmword_1FBB24;
      __int128 v74 = unk_1FBB34;
      [a5 cull:2];
      SetLightingColors(v77, &v61, *(float *)[a5 foreColor]);
      [a5 setShader:@"ColoredTexture"];
      [a5 setVertex3DPointer:&v61];
      [a5 setTextureCoordinatesPointer:&v73 onTextureUnit:0];
      [a5 setColorsPointer:v77];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      [v38 unsetOnContext:a5 onTextureUnit:0 state:v58];
      [v38 releaseByUser];
      id v32 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(3)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
      *(float *)&double v41 = (float)(width * 3.0) / height;
      [v32 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:v58 state:v41];
      [a5 cull:1];
      __int128 v59 = xmmword_1FBB44;
      __int128 v60 = unk_1FBB54;
      SetLightingColors(v77, &v61, *(float *)[a5 foreColor]);
      [a5 setShader:@"ColoredTexture"];
      [a5 setVertex3DPointer:&v61];
      [a5 setTextureCoordinatesPointer:&v59 onTextureUnit:0];
      [a5 setColorsPointer:v77];
      [a5 drawTriangleStripFromOffset:0 count:4];
      [a5 unsetColorsPointer];
      [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a5 unsetVertexPointer];
      [a5 unsetShader];
      [a5 cull:0];
    }

    id v34 = v58;
  }

  else
  {
    __float2 v17 = __sincosf_stret((float)(v12 * 4.0) * 3.1416);
    id v18 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(4)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    *(float *)&double v19 = (float)(width * 0.75) / height;
    [v18 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v45 state:v19];
    float v20 = x + (float)(width * 0.75);
    *(float *)&__int128 v80 = v20;
    *((float *)&v80 + 1) = y;
    *((float *)&v80 + 2) = v20;
    *((float *)&v80 + 3) = y + height;
    *(float *)&__int128 v81 = x + width;
    *((float *)&v81 + 1) = y;
    *((float *)&v81 + 2) = x + width;
    *((float *)&v81 + 3) = y + height;
    __int128 v78 = xmmword_1FBAA4;
    __int128 v79 = unk_1FBAB4;
    *(float *)&double v21 = SetLightingColors2D((uint64_t)v77, (float *)&v80, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v21);
    [a5 setVertex2DPointer:&v80];
    [a5 setTextureCoordinatesPointer:&v78 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v18 unsetOnContext:a5 onTextureUnit:0 state:&v45];
    [v18 releaseByUser];
    id v22 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(1)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    *(float *)&double v23 = width / height;
    [v22 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v45 state:v23];
    float v24 = x + (float)(width * 0.5);
    float v25 = y + (float)(height * 0.5);
    *(float *)&__int128 v75 = v24;
    *((float *)&v75 + 1) = v25;
    *((float *)&v75 + 2) = v24;
    *((float *)&v75 + 3) = y + height;
    *(float *)&__int128 v76 = v20;
    *((float *)&v76 + 1) = v25;
    *((float *)&v76 + 2) = v20;
    *((float *)&v76 + 3) = y + height;
    __int128 v73 = xmmword_1FBAC4;
    __int128 v74 = *(_OWORD *)algn_1FBAD4;
    *(float *)&double v26 = SetLightingColors2D((uint64_t)v77, (float *)&v75, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v26);
    [a5 setVertex2DPointer:&v75];
    [a5 setTextureCoordinatesPointer:&v73 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    float v61 = v20;
    float v62 = v25;
    float v63 = 0.0;
    float v64 = v20;
    float v65 = y + height;
    float v66 = v17.__sinval * (float)(width * 0.25);
    float v27 = x + (float)((float)(width * 0.25) * (float)(v17.__cosval + 3.0));
    float v67 = v27;
    float v68 = v25;
    int v69 = 0;
    float v70 = v27;
    float v71 = y + height;
    float v72 = v17.__sinval * (float)(width * 0.33333);
    __int128 v59 = xmmword_1FBAE4;
    __int128 v60 = unk_1FBAF4;
    SetLightingColors(v77, &v61, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v61];
    [a5 setTextureCoordinatesPointer:&v59 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v22 unsetOnContext:a5 onTextureUnit:0 state:&v45];
    [v22 releaseByUser];
    id v28 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(2)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    float v29 = (float)(width * 0.5) / height;
    *(float *)&double v30 = v29;
    [v28 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v45 state:v30];
    v58[0] = v24;
    v58[1] = y;
    float32x4_t v58[2] = v24;
    v58[3] = v25;
    v58[4] = v20;
    v58[5] = y;
    v58[6] = v20;
    v58[7] = v25;
    *(float *)&double v31 = SetLightingColors2D((uint64_t)v77, v58, *(float *)[a5 foreColor]);
    objc_msgSend(a5, "setShader:", @"ColoredTexture", v31);
    [a5 setVertex2DPointer:v58];
    [a5 setTextureCoordinatesPointer:v82 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [v28 unsetOnContext:a5 onTextureUnit:0 state:&v45];
    [v28 releaseByUser];
    id v32 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(3)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
    *(float *)&double v33 = v29;
    [v32 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v45 state:v33];
    float v46 = v20;
    float v47 = y;
    float v48 = 0.0;
    float v49 = v20;
    float v50 = v25;
    float v51 = v17.__sinval * (float)(width * 0.25);
    float v52 = v27;
    float v53 = y;
    int v54 = 0;
    float v55 = v27;
    float v56 = v25;
    float v57 = v17.__sinval * (float)(width * 0.33333);
    SetLightingColors(v77, &v46, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:&v46];
    [a5 setTextureCoordinatesPointer:v82 onTextureUnit:0];
    [a5 setColorsPointer:v77];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    id v34 = (float *)&v45;
  }

  [v32 unsetOnContext:a5 onTextureUnit:0 state:v34];
  [v32 releaseByUser];
}

- (void)renderFlipDiagonalAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  id v8 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v18 = [a8 objectForKey:@"recto"];
  id v19 = [v8 objectForKey:@"verso"];
  *(float *)&double v20 = a4;
  [*(id *)((char *)&self->mLittleSwing + 1) valueAtTime:v20];
  __float2 v22 = __sincosf_stret(3.1416 - v21);
  LODWORD(v8) = objc_msgSend(objc_msgSend(v18, "objectForKey:", @"slide0"), "intValue");
  LODWORD(v18) = objc_msgSend(objc_msgSend(v19, "objectForKey:", @"slide0"), "intValue");
  float v23 = x;
  float v24 = y;
  float v25 = width;
  float v26 = height;
  v43[0] = v23;
  v43[1] = v24;
  v43[2] = 0.0;
  float v27 = v24 + v26;
  v44[0] = v23;
  v44[1] = v24 + v26;
  v44[2] = 0.0;
  v44[3] = v23 + v25;
  v44[4] = v24;
  v44[5] = 0.0;
  float v45 = v23 + (float)((float)(v25 * 0.5) * (float)(1.0 - v22.__cosval));
  float v46 = v24 + (float)((float)(v26 * 0.5) * (float)(1.0 - v22.__cosval));
  float v28 = v22.__sinval * 1.41421356 * v26 * 0.5;
  float v47 = v28;
  uint64_t v49 = 0LL;
  int v48 = 0;
  v39[0] = v45;
  v39[1] = v46;
  v39[2] = v28;
  v40[0] = v23;
  v40[1] = v27;
  v40[2] = 0.0;
  v40[3] = v23 + v25;
  v40[4] = v24;
  v40[5] = 0.0;
  v40[6] = v23 + v25;
  v40[7] = v27;
  uint64_t v42 = 0LL;
  uint64_t v41 = 0LL;
  v38[0] = xmmword_1FBB64;
  v38[1] = unk_1FBB74;
  id v29 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)v8)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  id v30 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int)v18)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  LODWORD(v31) = 1.0;
  [v30 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v35 state:v31];
  [a5 setTextureCoordinatesPointer:v38 onTextureUnit:0];
  SetLightingColors(v37, v40, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v36];
  [a5 setVertex3DPointer:v39];
  [a5 drawTriangleStripFromOffset:1 count:3];
  [*(id *)((char *)&self->mLittleSwing + 1) timeFirstAtRestValue];
  if (v32 > a4)
  {
    if (v29 != v30)
    {
      [v30 unsetOnContext:a5 onTextureUnit:0 state:&v35];
      LODWORD(v33) = 1.0;
      [v29 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v35 state:v33];
    }

    SetLightingColors(v36, v43, *(float *)[a5 foreColor]);
    [a5 setColorsPointer:v36];
    [a5 setVertex3DPointer:v43];
    [a5 drawTriangleStripFromOffset:0 count:3];
    [a5 cull:1];
    SetLightingColors(v37, v44, *(float *)[a5 foreColor]);
    [a5 setColorsPointer:v36];
    [a5 drawTriangleStripFromOffset:1 count:3];
    if (v29 != v30)
    {
      [v29 unsetOnContext:a5 onTextureUnit:0 state:&v35];
      LODWORD(v34) = 1.0;
      [v30 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v35 state:v34];
    }
  }

  [a5 cull:2];
  SetLightingColors(v36, v39, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v36];
  [a5 setVertex3DPointer:v39];
  [a5 drawTriangleStripFromOffset:0 count:3];
  [a5 unsetVertexPointer];
  [a5 unsetColorsPointer];
  [a5 cull:0];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [v29 releaseByUser];
  [v30 unsetOnContext:a5 onTextureUnit:0 state:&v35];
  [v30 releaseByUser];
}

- (void)renderUnfoldingFlowerAtTime:(double)a3 andProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  float v16 = (a4 + -0.5) * 3.14159274;
  float v17 = sinf(v16);
  __float2 v18 = __sincosf_stret((float)(v17 + 1.0) * 1.5708);
  float v19 = -1.0;
  if (v18.__cosval > 0.0) {
    float v19 = 1.0;
  }
  if (v18.__sinval >= 0.0) {
    float sinval = v18.__sinval;
  }
  else {
    float sinval = 0.0;
  }
  if (v18.__sinval >= 0.0) {
    float cosval = v18.__cosval;
  }
  else {
    float cosval = v19;
  }
  signed int v22 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"rectoSlideIndex"), "intValue");
  signed int v56 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"versoSlideIndex"), "intValue");
  float v23 = x;
  float v24 = y;
  float v25 = width;
  float v26 = height;
  float v27 = v23 + (float)(v25 * 0.5);
  float v28 = v24 + (float)(v26 * 0.5);
  if (v25 >= v26) {
    float v29 = height;
  }
  else {
    float v29 = width;
  }
  float v30 = v29 * 0.5;
  float v31 = cosval + 1.0;
  float v54 = cosval;
  float v32 = -cosval;
  if (sinval > 0.0) {
  double v52 = sinval;
  }
  float v33 = sqrt((float)(1.0 - (float)(v32 * v32))) * v30;
  float v50 = v30 * v32;
  float v51 = v33;
  id v34 = [a8 objectForKey:@"direction"];
  else {
    float v35 = v30;
  }
  float v55 = v35;
  else {
    float v36 = v30;
  }
  float v53 = v36;
  else {
    float v37 = 1.0;
  }
  else {
    float v38 = 1.0;
  }
  v105.i64[0] = __PAIR64__(LODWORD(v38), LODWORD(v37));
  v105.f32[2] = v37;
  v105.f32[3] = -v38;
  float v106 = -v37;
  float v107 = v38;
  float v108 = -v37;
  float v109 = -v38;
  id v39 = [a8 objectForKey:@"rectoSlideRect"];
  if (v39) {
    MyGLRectFromString(v39, &v105);
  }
  v104[1] = v28;
  v104[2] = v27;
  v104[3] = v28;
  v104[4] = v27 - v55;
  v104[5] = v28 + v53;
  v104[6] = v27;
  v104[7] = v28 + v53;
  float v97 = -v37;
  uint64_t v98 = 0LL;
  int v99 = 0;
  float v100 = -v37;
  float v101 = v38;
  int v102 = 0;
  float v103 = v38;
  v104[0] = v27 - v55;
  v90[0] = v27;
  v90[1] = v28 + v53;
  v90[2] = 0.0;
  v91[0] = v27;
  v91[1] = v28;
  v91[2] = 0.0;
  v91[3] = v27 + (float)(v50 * v37);
  v91[4] = v28 + v53;
  v91[5] = v51;
  float v92 = v27 + (float)((float)(v55 * -0.5) * (float)(v54 + -1.0));
  float v40 = (float)(v30 * 0.5) * 1.41421356 * v52;
  float v93 = v28 + (float)((float)(v53 * 0.5) * v31);
  float v94 = v40;
  uint64_t v95 = 0LL;
  int v96 = 0;
  float v84 = v38;
  uint64_t v85 = 0LL;
  float v86 = v37;
  float v87 = v38;
  float v88 = v37;
  int v89 = 0;
  v77[1] = v28;
  v77[2] = 0.0;
  v78[0] = v27;
  v78[1] = v28;
  v78[2] = 0.0;
  v78[3] = v27 - v55;
  v78[4] = v28 - (float)(v50 * v38);
  v78[5] = v51;
  float v79 = v27 + (float)((float)(v55 * -0.5) * v31);
  float v80 = v28 + (float)((float)(v53 * 0.5) * (float)(v54 + -1.0));
  float v81 = v40;
  uint64_t v82 = 0LL;
  uint64_t v83 = 0LL;
  float v70 = -v37;
  uint64_t v71 = 0LL;
  int v72 = 0;
  float v73 = -v37;
  float v74 = -v38;
  int v75 = 0;
  float v76 = -v38;
  v77[0] = v27 - v55;
  v69[1] = v93;
  v69[2] = v40;
  v69[3] = v27;
  v69[4] = v28;
  v69[5] = 0.0;
  v69[6] = v27 - (float)(v55 * v54);
  v69[7] = v28 + (float)(v53 * v54);
  float v41 = v30 * 1.41421356 * v52;
  v69[8] = v41;
  v69[9] = v79;
  v69[10] = v80;
  v69[11] = v40;
  float v62 = v37;
  uint64_t v63 = 0LL;
  int v64 = 0;
  float v65 = v37;
  float v66 = -v38;
  int v67 = 0;
  float v68 = -v38;
  v69[0] = v92;
  id v42 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v22)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  id v43 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v56)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a3);
  else {
    uint64_t v45 = 2LL;
  }
  else {
    uint64_t v46 = 2LL;
  }
  *(float *)&double v44 = v55 * v53;
  objc_msgSend(a5, "cull:", v45, v44);
  LODWORD(v47) = 1.0;
  [v43 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v58 state:v47];
  *(float *)&double v48 = SetLightingColors2D((uint64_t)v60, v104, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v48);
  [a5 setVertex2DPointer:v104];
  [a5 setTextureCoordinatesPointer:&v97 onTextureUnit:0];
  [a5 setColorsPointer:v60];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a5 setTextureCoordinatesPointer:(char *)&v83 + 4 onTextureUnit:0];
  [a5 setShader:@"ColoredTexture"];
  SetLightingColors(v60, v90, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v60];
  [a5 setVertex3DPointer:v90];
  [a5 drawTriangleStripFromOffset:0 count:3];
  SetLightingColors(v61, v91, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v60];
  [a5 cull:v46];
  [a5 drawTriangleStripFromOffset:1 count:3];
  [a5 cull:v45];
  [a5 setTextureCoordinatesPointer:&v70 onTextureUnit:0];
  SetLightingColors(v60, v77, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v60];
  [a5 setVertex3DPointer:v77];
  [a5 cull:v46];
  [a5 drawTriangleStripFromOffset:0 count:3];
  [a5 cull:v45];
  SetLightingColors(v61, v78, *(float *)[a5 foreColor]);
  [a5 setColorsPointer:v60];
  [a5 drawTriangleStripFromOffset:1 count:3];
  [a5 unsetShader];
  SetLightingColors(v59, v69, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:v69];
  [a5 setTextureCoordinatesPointer:&v62 onTextureUnit:0];
  [a5 setColorsPointer:v59];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  if (v42 != v43)
  {
    [v43 unsetOnContext:a5 onTextureUnit:0 state:&v58];
    LODWORD(v49) = 1.0;
    [v42 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v58 state:v49];
  }

  [a5 cull:v46];
  SetLightingColors(v59, v69, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:v69];
  [a5 setTextureCoordinatesPointer:&v105 onTextureUnit:0];
  [a5 setColorsPointer:v59];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a5 unsetVertexPointer];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [v42 unsetOnContext:a5 onTextureUnit:0 state:&v58];
  [v42 releaseByUser];
  [v43 releaseByUser];
  [a5 cull:0];
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v9 = v8;
  double v10 = 2.0 / v8;
  double v11 = (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration) * 0.5;
  float v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v13 = -[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"Origami-JustASlide");
  int v229 = v12;
  double v223 = a3;
  if (v11 <= a3)
  {
    if (v13)
    {
      double v14 = v10 * -0.5;
      id v31 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
      id v16 = [v31 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
      [v16 width];
      float v33 = v32;
      [v16 height];
      *(float *)&double v34 = v34;
      double v35 = (float)(v33 / *(float *)&v34);
      [v16 scale];
      double v22 = v36;
      [a4 localAspectRatio];
      double v24 = v22 * v37 / v35;
      double v25 = 1.0;
      if (v22 >= 1.0 && v24 >= 1.0)
      {
LABEL_11:
        float v30 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v16 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v10 * -0.5, 2.0, v10),  @"rectangle",  0,  v199,  v200);
        goto LABEL_12;
      }

- (BOOL)_needsRenderingAtTime:(double)a3 remainingStillDurationAfter:(double *)a4
{
  double v5 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  if (a3 < 1.35) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5 + -1.35 - a3;
  }
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  id v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16, a4);
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v32;
    double v29 = v5 + -1.35;
    if (v5 + -1.35 <= a3) {
      double v12 = 0.0;
    }
    else {
      double v12 = v5 + -1.35 - a3;
    }
    double v28 = v5 + -1.85;
    if (v5 + -1.85 > a3) {
      double v12 = 0.0;
    }
    if (a3 < 2.35) {
      double v12 = 1.85 - a3;
    }
    double v27 = v12;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        objc_msgSend(objc_msgSend(v14, "objectForKey:", @"startTime"), "doubleValue");
        double v16 = v15;
        objc_msgSend(objc_msgSend(v14, "objectForKey:", @"endTime"), "doubleValue");
        double v18 = v17;
        unsigned __int8 v19 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"isStill"), "BOOLValue");
        unsigned int v20 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"isBreak"), "BOOLValue");
        double v21 = 10.0;
        if ((v19 & 1) == 0 && (v20 & 1) == 0)
        {
          if (v18 > a3) {
            double v21 = 0.0;
          }
          if (v16 >= a3) {
            double v21 = v16 - a3;
          }
        }

        if (v20) {
          double v21 = 0.0;
        }
        char v22 = v20 ^ 1;
        if (a3 < 1.35) {
          char v22 = 1;
        }
        if ((v22 & 1) == 0)
        {
          if (v29 > a3) {
            char v23 = 1;
          }
          else {
            char v23 = v19;
          }
          if (v28 > a3) {
            char v23 = v19;
          }
          if (a3 < 2.35) {
            unsigned __int8 v19 = 1;
          }
          else {
            unsigned __int8 v19 = v23;
          }
          double v21 = v27;
        }

        if (v21 < v7) {
          double v7 = v21;
        }
        BOOL v24 = v16 + -0.25 <= a3;
        if (v18 + 0.100000001 < a3) {
          BOOL v24 = 0;
        }
        v10 |= v24 & (v19 ^ 1);
      }

      id v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16, v18 + 0.100000001);
    }

    while (v9);
  }

  else
  {
    char v10 = 0;
  }

  if (v26) {
    *float v26 = v7;
  }
  return v10 & 1;
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  BYTE2(self->mDescriptionAspectRatio) = a3 >= 1.0;
  -[MREffectOrigami setPhaseInDuration:mainDuration:phaseOutDuration:]( self,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->super.mPhaseInDuration,  self->super.mMainDuration,  self->super.mPhaseOutDuration);
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return 0;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  char v10 = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    BOOL v30 = v8;
    double v28 = a5;
    double v29 = a6;
    uint64_t v13 = *(void *)v32;
    double v14 = 1.35;
    double v15 = 1.35;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        double v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        objc_msgSend(objc_msgSend(v17, "objectForKey:", @"startTime"), "doubleValue");
        double v19 = v18;
        objc_msgSend(objc_msgSend(v17, "objectForKey:", @"endTime"), "doubleValue");
        double v21 = v20;
        unsigned __int8 v22 = objc_msgSend(objc_msgSend(v17, "objectForKey:", @"isStill"), "BOOLValue");
        unsigned __int8 v23 = objc_msgSend(objc_msgSend(v17, "objectForKey:", @"isBreak"), "BOOLValue");
        if ((v22 & 1) == 0 && (v23 & 1) == 0)
        {
          if (v15 >= v19 || v15 <= 1.35) {
            double v15 = v19;
          }
          if (v14 >= v21) {
            double v25 = v14;
          }
          else {
            double v25 = v21;
          }
          if (v14 <= 1.35) {
            double v14 = v21;
          }
          else {
            double v14 = v25;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v12);
    if (v15 <= 1.35) {
      goto LABEL_26;
    }
    BOOL v26 = v15 >= a3;
    if (!v30) {
      BOOL v26 = v14 <= a3;
    }
    if (v26)
    {
LABEL_26:
      LOBYTE(v11) = 0;
    }

    else
    {
      if (v28) {
        *double v28 = v15;
      }
      if (v29) {
        *double v29 = v14 - v15;
      }
      LOBYTE(v11) = 1;
    }
  }

  return (char)v11;
}

- (double)interestingTimeForTime:(double)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_super v4 = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  double v6 = 1.35;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v18;
    double v6 = 1.35;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        objc_msgSend(objc_msgSend(v10, "objectForKey:", @"startTime"), "doubleValue");
        objc_msgSend(objc_msgSend(v10, "objectForKey:", @"endTime"), "doubleValue");
        double v12 = v11;
        unsigned int v13 = objc_msgSend(objc_msgSend(v10, "objectForKey:", @"isStill"), "BOOLValue");
        unsigned int v14 = v13 | objc_msgSend(objc_msgSend(v10, "objectForKey:", @"isBreak"), "BOOLValue");
        if (v6 >= v12) {
          double v15 = v6;
        }
        else {
          double v15 = v12;
        }
        if (v6 <= 1.35) {
          double v15 = v12;
        }
        if (!v14) {
          double v6 = v15;
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  if (v6 > a3) {
    return 1.35;
  }
  else {
    return v6;
  }
}

- (double)interestingTimeForElement:(id)a3
{
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  objc_super v4 = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  id v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (!v5) {
    return 1.35;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v34;
  double v8 = 1.35;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v4);
      }
      char v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      objc_msgSend(objc_msgSend(v10, "objectForKey:", @"startTime"), "doubleValue");
      double v12 = v11;
      unsigned int v13 = objc_msgSend(objc_msgSend(v10, "objectForKey:", @"isStill"), "BOOLValue");
      unsigned int v14 = v13 | objc_msgSend(objc_msgSend(v10, "objectForKey:", @"isBreak"), "BOOLValue");
      if (v8 >= v12 || v8 <= 1.35) {
        double v16 = v12;
      }
      else {
        double v16 = v8;
      }
      if (v14) {
        double v8 = v16;
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  }

  while (v6);
  double v17 = 1.35;
  if (v8 != 1.35)
  {
    id v18 = [(id)qword_2B0668 objectForKey:self->super.mEffectID];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          unsigned __int8 v23 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
          id v24 = objc_msgSend( objc_msgSend(v23, "objectForKey:", @"attributes"),  "objectForKey:",  @"slideIndex");
          objc_msgSend(objc_msgSend(v23, "objectForKey:", @"startTime"), "doubleValue");
          if (v25 != 0.0)
          {
            if (objc_msgSend(objc_msgSend(v23, "objectForKey:", @"isVisibleAtEnd"), "BOOLValue"))
            {
              unsigned int v26 = [v24 intValue];
            }
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
  }

  return v17;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v7 = *(NSArray **)((char *)&self->mAnimationTimeBounds + 1);
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    double v11 = 1.35;
    double v12 = 1.35;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        objc_msgSend(objc_msgSend(v14, "objectForKey:", @"startTime"), "doubleValue");
        double v16 = v15;
        objc_msgSend(objc_msgSend(v14, "objectForKey:", @"endTime"), "doubleValue");
        double v18 = v17;
        unsigned __int8 v19 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"isStill"), "BOOLValue");
        unsigned __int8 v20 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"isBreak"), "BOOLValue");
        if ((v19 & 1) == 0 && (v20 & 1) == 0)
        {
          if (v12 >= v16 || v12 <= 1.35) {
            double v12 = v16;
          }
          if (v11 >= v18) {
            double v22 = v11;
          }
          else {
            double v22 = v18;
          }
          if (v11 <= 1.35) {
            double v11 = v18;
          }
          else {
            double v11 = v22;
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v9);
  }

  else
  {
    double v11 = 1.35;
    double v12 = 1.35;
  }

  if (a4) {
    *a4 = 0.0;
  }
  if (v11 <= a6)
  {
    if (a3) {
      *a3 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration - v11;
    }
    double v23 = 0.0;
    if (a5) {
      goto LABEL_34;
    }
  }

  else
  {
    if (a3) {
      *a3 = v12 - a6;
    }
    if (a5)
    {
      double v23 = v11 - v12;
LABEL_34:
      *a5 = v23;
    }
  }

@end