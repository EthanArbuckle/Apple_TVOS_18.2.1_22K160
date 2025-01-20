@interface MREffectPortfolio
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectPortfolio *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGRect)_rectForSlideAtIndex:(int64_t)a3 frame:(id)a4 leftCount:(int64_t)a5 movie:(BOOL)a6 localAspectRatio:(double)a7;
- (MREffectPortfolio)initWithEffectID:(id)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_drawBreakXLAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_drawFrame:(id)a3 index:(int64_t)a4 leftCount:(int64_t)a5 time:(double)a6 inContext:(id)a7 withArguments:(id)a8;
- (void)_drawIndex:(int64_t)a3 time:(double)a4 context:(id)a5 arguments:(id)a6 size:(CGSize)a7 position:(CGPoint)a8;
- (void)_drawLandscapeBreakForPortraitAtTime:(double)a3 duration:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)_drawPagesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_drawPagesCreaseWithHeight:(double)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)_drawPortraitBreakForLandscapeAtTime:(double)a3 duration:(double)a4 onePage:(BOOL)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)_drawPortraitBreakForPortraitAtTime:(double)a3 duration:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_renderLandscapeBreakPageAtIndex:(int64_t)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)_renderPortraitBreakForPortraitPageAtIndex:(int64_t)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)_renderPortraitBreakPageAtIndex:(int64_t)a3 flipped:(BOOL)a4 onePage:(BOOL)a5 atTime:(double)a6 inContext:(id)a7 withArguments:(id)a8;
- (void)_renderXLPageAtIndex:(int64_t)a3 flipped:(BOOL)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)_unload;
- (void)_updateSizes:(double)a3;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)endMorphing;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectPortfolio

+ (void)initialize
{
  if (!qword_2B04C0)
  {
    qword_2B04C0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v2->outer.origin = (CGPoint)xmmword_1F7C40;
    v2->outer.size = (CGSize)xmmword_1F7C50;
    v2->inner.origin.x = 0.0;
    v2->inner.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    CGSize v112 = _Q0;
    v2->inner.size = _Q0;
    v2->size = (CGSize)xmmword_1F7C60;
    BOOL v8 = !NSStringHasPrefix(@"offwhiteFrameV1", "NoBorder")
      && !NSStringHasPrefix(@"offwhiteFrameV1", "Full")
      && !NSStringHasPrefix(@"offwhiteFrameV1", "RoundedBorder");
    v2->isImageFrame = v8;
    BOOL v9 = NSStringHasPrefix(@"offwhiteFrameV1", "squareBorderNotches")
      || NSStringHasPrefix(@"offwhiteFrameV1", "offwhiteFrame")
      || NSStringHasPrefix(@"offwhiteFrameV1", "PolaroidType55");
    v2->needsInset = v9;
    BOOL HasPrefix = NSStringHasPrefix(@"offwhiteFrameV1", "FiledEdgeBleed");
    v2->isMask = HasPrefix;
    BOOL v11 = !HasPrefix && NSStringHasPrefix(@"offwhiteFrameV1", "RoundedBorder");
    v2->isRounded = v11;
    [(id)qword_2B04C0 setObject:v2 forKey:@"offwhiteFrameV1"];

    v12 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v12->outer.origin.x = 0.0;
    v12->outer.origin.y = 0.0;
    v12->outer.size = v112;
    v12->inner.origin.x = 0.0;
    v12->inner.origin.y = 0.0;
    v12->inner.size = v112;
    v12->size = (CGSize)vdupq_n_s64(0x4095180000000000uLL);
    BOOL v13 = !NSStringHasPrefix(@"squareBorderNotchesV1", "NoBorder")
       && !NSStringHasPrefix(@"squareBorderNotchesV1", "Full")
       && !NSStringHasPrefix(@"squareBorderNotchesV1", "RoundedBorder");
    v12->isImageFrame = v13;
    BOOL v14 = NSStringHasPrefix(@"squareBorderNotchesV1", "squareBorderNotches")
       || NSStringHasPrefix(@"squareBorderNotchesV1", "offwhiteFrame")
       || NSStringHasPrefix(@"squareBorderNotchesV1", "PolaroidType55");
    v12->needsInset = v14;
    BOOL v15 = NSStringHasPrefix(@"squareBorderNotchesV1", "FiledEdgeBleed");
    v12->isMask = v15;
    BOOL v16 = !v15 && NSStringHasPrefix(@"squareBorderNotchesV1", "RoundedBorder");
    v12->isRounded = v16;
    [(id)qword_2B04C0 setObject:v12 forKey:@"squareBorderNotchesV1"];

    v17 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v17->outer.origin.x = 0.0;
    v17->outer.origin.y = 0.0;
    v17->outer.size = v112;
    v17->inner.origin.x = 0.0;
    v17->inner.origin.y = 0.0;
    v17->inner.size = v112;
    v17->size = (CGSize)vdupq_n_s64(0x4095180000000000uLL);
    BOOL v18 = !NSStringHasPrefix(@"squareBorderV1", "NoBorder")
       && !NSStringHasPrefix(@"squareBorderV1", "Full")
       && !NSStringHasPrefix(@"squareBorderV1", "RoundedBorder");
    v17->isImageFrame = v18;
    BOOL v19 = NSStringHasPrefix(@"squareBorderV1", "squareBorderNotches")
       || NSStringHasPrefix(@"squareBorderV1", "offwhiteFrame")
       || NSStringHasPrefix(@"squareBorderV1", "PolaroidType55");
    v17->needsInset = v19;
    BOOL v20 = NSStringHasPrefix(@"squareBorderV1", "FiledEdgeBleed");
    v17->isMask = v20;
    BOOL v21 = !v20 && NSStringHasPrefix(@"squareBorderV1", "RoundedBorder");
    v17->isRounded = v21;
    [(id)qword_2B04C0 setObject:v17 forKey:@"squareBorderV1"];

    v22 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v22->outer.origin = (CGPoint)xmmword_1F7C70;
    v22->outer.size = (CGSize)xmmword_1F7C80;
    v22->inner.origin = (CGPoint)xmmword_1F7C70;
    v22->inner.size = (CGSize)xmmword_1F7C80;
    v22->size = (CGSize)xmmword_1F7C90;
    BOOL v23 = !NSStringHasPrefix(@"BrushStroke-A-V2", "NoBorder")
       && !NSStringHasPrefix(@"BrushStroke-A-V2", "Full")
       && !NSStringHasPrefix(@"BrushStroke-A-V2", "RoundedBorder");
    v22->isImageFrame = v23;
    BOOL v24 = NSStringHasPrefix(@"BrushStroke-A-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"BrushStroke-A-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"BrushStroke-A-V2", "PolaroidType55");
    v22->needsInset = v24;
    BOOL v25 = NSStringHasPrefix(@"BrushStroke-A-V2", "FiledEdgeBleed");
    v22->isMask = v25;
    BOOL v26 = !v25 && NSStringHasPrefix(@"BrushStroke-A-V2", "RoundedBorder");
    v22->isRounded = v26;
    [(id)qword_2B04C0 setObject:v22 forKey:@"BrushStroke-A-V2"];

    v27 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v27->outer.origin = (CGPoint)xmmword_1F7C70;
    v27->outer.size = (CGSize)xmmword_1F7C80;
    v27->inner.origin = (CGPoint)xmmword_1F7C70;
    v27->inner.size = (CGSize)xmmword_1F7C80;
    v27->size = (CGSize)xmmword_1F7C90;
    BOOL v28 = !NSStringHasPrefix(@"BrushStroke-B-V2", "NoBorder")
       && !NSStringHasPrefix(@"BrushStroke-B-V2", "Full")
       && !NSStringHasPrefix(@"BrushStroke-B-V2", "RoundedBorder");
    v27->isImageFrame = v28;
    BOOL v29 = NSStringHasPrefix(@"BrushStroke-B-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"BrushStroke-B-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"BrushStroke-B-V2", "PolaroidType55");
    v27->needsInset = v29;
    BOOL v30 = NSStringHasPrefix(@"BrushStroke-B-V2", "FiledEdgeBleed");
    v27->isMask = v30;
    BOOL v31 = !v30 && NSStringHasPrefix(@"BrushStroke-B-V2", "RoundedBorder");
    v27->isRounded = v31;
    [(id)qword_2B04C0 setObject:v27 forKey:@"BrushStroke-B-V2"];

    v32 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v32->outer.origin = (CGPoint)xmmword_1F7C70;
    v32->outer.size = (CGSize)xmmword_1F7C80;
    v32->inner.origin = (CGPoint)xmmword_1F7C70;
    v32->inner.size = (CGSize)xmmword_1F7C80;
    v32->size = (CGSize)xmmword_1F7C90;
    BOOL v33 = !NSStringHasPrefix(@"BrushStroke-C-V2", "NoBorder")
       && !NSStringHasPrefix(@"BrushStroke-C-V2", "Full")
       && !NSStringHasPrefix(@"BrushStroke-C-V2", "RoundedBorder");
    v32->isImageFrame = v33;
    BOOL v34 = NSStringHasPrefix(@"BrushStroke-C-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"BrushStroke-C-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"BrushStroke-C-V2", "PolaroidType55");
    v32->needsInset = v34;
    BOOL v35 = NSStringHasPrefix(@"BrushStroke-C-V2", "FiledEdgeBleed");
    v32->isMask = v35;
    BOOL v36 = !v35 && NSStringHasPrefix(@"BrushStroke-C-V2", "RoundedBorder");
    v32->isRounded = v36;
    [(id)qword_2B04C0 setObject:v32 forKey:@"BrushStroke-C-V2"];

    v37 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v37->outer.origin = (CGPoint)xmmword_1F7CA0;
    v37->outer.size = (CGSize)xmmword_1F7CB0;
    v37->inner.origin = (CGPoint)xmmword_1F7CA0;
    v37->inner.size = (CGSize)xmmword_1F7CB0;
    v37->size = (CGSize)xmmword_1F7C90;
    BOOL v38 = !NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "Full")
       && !NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "RoundedBorder");
    v37->isImageFrame = v38;
    BOOL v39 = NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "PolaroidType55");
    v37->needsInset = v39;
    BOOL v40 = NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "FiledEdgeBleed");
    v37->isMask = v40;
    BOOL v41 = !v40 && NSStringHasPrefix(@"FiledEdgeBlack-A-V2", "RoundedBorder");
    v37->isRounded = v41;
    [(id)qword_2B04C0 setObject:v37 forKey:@"FiledEdgeBlack-A-V2"];

    v42 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v42->outer.origin = (CGPoint)xmmword_1F7CA0;
    v42->outer.size = (CGSize)xmmword_1F7CB0;
    v42->inner.origin = (CGPoint)xmmword_1F7CA0;
    v42->inner.size = (CGSize)xmmword_1F7CB0;
    v42->size = (CGSize)xmmword_1F7C90;
    BOOL v43 = !NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "Full")
       && !NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "RoundedBorder");
    v42->isImageFrame = v43;
    BOOL v44 = NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "PolaroidType55");
    v42->needsInset = v44;
    BOOL v45 = NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "FiledEdgeBleed");
    v42->isMask = v45;
    BOOL v46 = !v45 && NSStringHasPrefix(@"FiledEdgeBlack-B-V2", "RoundedBorder");
    v42->isRounded = v46;
    [(id)qword_2B04C0 setObject:v42 forKey:@"FiledEdgeBlack-B-V2"];

    v47 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v47->outer.origin.x = 0.0;
    v47->outer.origin.y = 0.0;
    v47->outer.size = v112;
    v47->inner.origin.x = 0.0;
    v47->inner.origin.y = 0.0;
    v47->inner.size = v112;
    v47->size = (CGSize)xmmword_1F7CC0;
    BOOL v48 = !NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "Full")
       && !NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "RoundedBorder");
    v47->isImageFrame = v48;
    BOOL v49 = NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "PolaroidType55");
    v47->needsInset = v49;
    BOOL v50 = NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "FiledEdgeBleed");
    v47->isMask = v50;
    BOOL v51 = !v50 && NSStringHasPrefix(@"FiledEdgeBleed-A-V1", "RoundedBorder");
    v47->isRounded = v51;
    [(id)qword_2B04C0 setObject:v47 forKey:@"FiledEdgeBleed-A-V1"];

    v52 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v52->outer.origin.x = 0.0;
    v52->outer.origin.y = 0.0;
    v52->outer.size = v112;
    v52->inner.origin.x = 0.0;
    v52->inner.origin.y = 0.0;
    v52->inner.size = v112;
    v52->size = (CGSize)xmmword_1F7CD0;
    BOOL v53 = !NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "Full")
       && !NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "RoundedBorder");
    v52->isImageFrame = v53;
    BOOL v54 = NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "PolaroidType55");
    v52->needsInset = v54;
    BOOL v55 = NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "FiledEdgeBleed");
    v52->isMask = v55;
    BOOL v56 = !v55 && NSStringHasPrefix(@"FiledEdgeBleed-B-V1", "RoundedBorder");
    v52->isRounded = v56;
    [(id)qword_2B04C0 setObject:v52 forKey:@"FiledEdgeBleed-B-V1"];

    v57 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v57->outer.origin = (CGPoint)xmmword_1F7C70;
    v57->outer.size = (CGSize)xmmword_1F7CE0;
    v57->inner.origin = (CGPoint)xmmword_1F7C70;
    v57->inner.size = (CGSize)xmmword_1F7CE0;
    v57->size = (CGSize)xmmword_1F7C90;
    BOOL v58 = !NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "Full")
       && !NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "RoundedBorder");
    v57->isImageFrame = v58;
    BOOL v59 = NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "PolaroidType55");
    v57->needsInset = v59;
    BOOL v60 = NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "FiledEdgeBleed");
    v57->isMask = v60;
    BOOL v61 = !v60 && NSStringHasPrefix(@"FiledEdgeSprocket-A-V2", "RoundedBorder");
    v57->isRounded = v61;
    [(id)qword_2B04C0 setObject:v57 forKey:@"FiledEdgeSprocket-A-V2"];

    v62 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v62->outer.origin = (CGPoint)xmmword_1F7C70;
    v62->outer.size = (CGSize)xmmword_1F7CE0;
    v62->inner.origin = (CGPoint)xmmword_1F7C70;
    v62->inner.size = (CGSize)xmmword_1F7CE0;
    v62->size = (CGSize)xmmword_1F7C90;
    BOOL v63 = !NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "NoBorder")
       && !NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "Full")
       && !NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "RoundedBorder");
    v62->isImageFrame = v63;
    BOOL v64 = NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "squareBorderNotches")
       || NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "offwhiteFrame")
       || NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "PolaroidType55");
    v62->needsInset = v64;
    BOOL v65 = NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "FiledEdgeBleed");
    v62->isMask = v65;
    BOOL v66 = !v65 && NSStringHasPrefix(@"FiledEdgeSprocket-B-V2", "RoundedBorder");
    v62->isRounded = v66;
    [(id)qword_2B04C0 setObject:v62 forKey:@"FiledEdgeSprocket-B-V2"];

    v67 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v67->outer.origin = (CGPoint)xmmword_1F7CF0;
    v67->outer.size = (CGSize)xmmword_1F7D00;
    v67->inner.origin = (CGPoint)xmmword_1F7CF0;
    v67->inner.size = (CGSize)xmmword_1F7D00;
    v67->size = (CGSize)xmmword_1F7D10;
    BOOL v68 = !NSStringHasPrefix(@"PolaroidType55-A-V1", "NoBorder")
       && !NSStringHasPrefix(@"PolaroidType55-A-V1", "Full")
       && !NSStringHasPrefix(@"PolaroidType55-A-V1", "RoundedBorder");
    v67->isImageFrame = v68;
    BOOL v69 = NSStringHasPrefix(@"PolaroidType55-A-V1", "squareBorderNotches")
       || NSStringHasPrefix(@"PolaroidType55-A-V1", "offwhiteFrame")
       || NSStringHasPrefix(@"PolaroidType55-A-V1", "PolaroidType55");
    v67->needsInset = v69;
    BOOL v70 = NSStringHasPrefix(@"PolaroidType55-A-V1", "FiledEdgeBleed");
    v67->isMask = v70;
    BOOL v71 = !v70 && NSStringHasPrefix(@"PolaroidType55-A-V1", "RoundedBorder");
    v67->isRounded = v71;
    [(id)qword_2B04C0 setObject:v67 forKey:@"PolaroidType55-A-V1"];

    v72 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v72->outer.origin = (CGPoint)xmmword_1F7CF0;
    v72->outer.size = (CGSize)xmmword_1F7D00;
    v72->inner.origin = (CGPoint)xmmword_1F7CF0;
    v72->inner.size = (CGSize)xmmword_1F7D00;
    v72->size = (CGSize)xmmword_1F7D10;
    BOOL v73 = !NSStringHasPrefix(@"PolaroidType55-B-V1", "NoBorder")
       && !NSStringHasPrefix(@"PolaroidType55-B-V1", "Full")
       && !NSStringHasPrefix(@"PolaroidType55-B-V1", "RoundedBorder");
    v72->isImageFrame = v73;
    BOOL v74 = NSStringHasPrefix(@"PolaroidType55-B-V1", "squareBorderNotches")
       || NSStringHasPrefix(@"PolaroidType55-B-V1", "offwhiteFrame")
       || NSStringHasPrefix(@"PolaroidType55-B-V1", "PolaroidType55");
    v72->needsInset = v74;
    BOOL v75 = NSStringHasPrefix(@"PolaroidType55-B-V1", "FiledEdgeBleed");
    v72->isMask = v75;
    BOOL v76 = !v75 && NSStringHasPrefix(@"PolaroidType55-B-V1", "RoundedBorder");
    v72->isRounded = v76;
    [(id)qword_2B04C0 setObject:v72 forKey:@"PolaroidType55-B-V1"];

    v77 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v77->outer.origin.x = 0.0;
    v77->outer.origin.y = 0.0;
    v77->outer.size = v112;
    v77->inner.origin.x = 0.0;
    v77->inner.origin.y = 0.0;
    v77->inner.size = v112;
    v77->size = (CGSize)xmmword_1F7C60;
    BOOL v78 = !NSStringHasPrefix(@"NoBorderPortrait", "NoBorder")
       && !NSStringHasPrefix(@"NoBorderPortrait", "Full")
       && !NSStringHasPrefix(@"NoBorderPortrait", "RoundedBorder");
    v77->isImageFrame = v78;
    BOOL v79 = NSStringHasPrefix(@"NoBorderPortrait", "squareBorderNotches")
       || NSStringHasPrefix(@"NoBorderPortrait", "offwhiteFrame")
       || NSStringHasPrefix(@"NoBorderPortrait", "PolaroidType55");
    v77->needsInset = v79;
    BOOL v80 = NSStringHasPrefix(@"NoBorderPortrait", "FiledEdgeBleed");
    v77->isMask = v80;
    BOOL v81 = !v80 && NSStringHasPrefix(@"NoBorderPortrait", "RoundedBorder");
    v77->isRounded = v81;
    [(id)qword_2B04C0 setObject:v77 forKey:@"NoBorderPortrait"];

    v82 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v82->outer.origin.x = 0.0;
    v82->outer.origin.y = 0.0;
    v82->outer.size = v112;
    v82->inner.origin.x = 0.0;
    v82->inner.origin.y = 0.0;
    v82->inner.size = v112;
    v82->size = v112;
    BOOL v83 = !NSStringHasPrefix(@"NoBorderSquare", "NoBorder")
       && !NSStringHasPrefix(@"NoBorderSquare", "Full")
       && !NSStringHasPrefix(@"NoBorderSquare", "RoundedBorder");
    v82->isImageFrame = v83;
    BOOL v84 = NSStringHasPrefix(@"NoBorderSquare", "squareBorderNotches")
       || NSStringHasPrefix(@"NoBorderSquare", "offwhiteFrame")
       || NSStringHasPrefix(@"NoBorderSquare", "PolaroidType55");
    v82->needsInset = v84;
    BOOL v85 = NSStringHasPrefix(@"NoBorderSquare", "FiledEdgeBleed");
    v82->isMask = v85;
    BOOL v86 = !v85 && NSStringHasPrefix(@"NoBorderSquare", "RoundedBorder");
    v82->isRounded = v86;
    [(id)qword_2B04C0 setObject:v82 forKey:@"NoBorderSquare"];

    v87 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v87->outer.origin.x = 0.0;
    v87->outer.origin.y = 0.0;
    v87->outer.size = v112;
    v87->inner.origin.x = 0.0;
    v87->inner.origin.y = 0.0;
    v87->inner.size = v112;
    v87->size = (CGSize)xmmword_1F7D20;
    BOOL v88 = !NSStringHasPrefix(@"NoBorderLandscape", "NoBorder")
       && !NSStringHasPrefix(@"NoBorderLandscape", "Full")
       && !NSStringHasPrefix(@"NoBorderLandscape", "RoundedBorder");
    v87->isImageFrame = v88;
    BOOL v89 = NSStringHasPrefix(@"NoBorderLandscape", "squareBorderNotches")
       || NSStringHasPrefix(@"NoBorderLandscape", "offwhiteFrame")
       || NSStringHasPrefix(@"NoBorderLandscape", "PolaroidType55");
    v87->needsInset = v89;
    BOOL v90 = NSStringHasPrefix(@"NoBorderLandscape", "FiledEdgeBleed");
    v87->isMask = v90;
    BOOL v91 = !v90 && NSStringHasPrefix(@"NoBorderLandscape", "RoundedBorder");
    v87->isRounded = v91;
    [(id)qword_2B04C0 setObject:v87 forKey:@"NoBorderLandscape"];

    v92 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v92->outer.origin.x = 0.0;
    v92->outer.origin.y = 0.0;
    v92->outer.size = v112;
    v92->inner.origin.x = 0.0;
    v92->inner.origin.y = 0.0;
    v92->inner.size = v112;
    v92->size = (CGSize)xmmword_1F7C60;
    BOOL v93 = !NSStringHasPrefix(@"RoundedBorderPortrait", "NoBorder")
       && !NSStringHasPrefix(@"RoundedBorderPortrait", "Full")
       && !NSStringHasPrefix(@"RoundedBorderPortrait", "RoundedBorder");
    v92->isImageFrame = v93;
    BOOL v94 = NSStringHasPrefix(@"RoundedBorderPortrait", "squareBorderNotches")
       || NSStringHasPrefix(@"RoundedBorderPortrait", "offwhiteFrame")
       || NSStringHasPrefix(@"RoundedBorderPortrait", "PolaroidType55");
    v92->needsInset = v94;
    BOOL v95 = NSStringHasPrefix(@"RoundedBorderPortrait", "FiledEdgeBleed");
    v92->isMask = v95;
    BOOL v96 = !v95 && NSStringHasPrefix(@"RoundedBorderPortrait", "RoundedBorder");
    v92->isRounded = v96;
    [(id)qword_2B04C0 setObject:v92 forKey:@"RoundedBorderPortrait"];

    v97 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v97->outer.origin.x = 0.0;
    v97->outer.origin.y = 0.0;
    v97->outer.size = v112;
    v97->inner.origin.x = 0.0;
    v97->inner.origin.y = 0.0;
    v97->inner.size = v112;
    v97->size = v112;
    BOOL v98 = !NSStringHasPrefix(@"RoundedBorderSquare", "NoBorder")
       && !NSStringHasPrefix(@"RoundedBorderSquare", "Full")
       && !NSStringHasPrefix(@"RoundedBorderSquare", "RoundedBorder");
    v97->isImageFrame = v98;
    BOOL v99 = NSStringHasPrefix(@"RoundedBorderSquare", "squareBorderNotches")
       || NSStringHasPrefix(@"RoundedBorderSquare", "offwhiteFrame")
       || NSStringHasPrefix(@"RoundedBorderSquare", "PolaroidType55");
    v97->needsInset = v99;
    BOOL v100 = NSStringHasPrefix(@"RoundedBorderSquare", "FiledEdgeBleed");
    v97->isMask = v100;
    BOOL v101 = !v100 && NSStringHasPrefix(@"RoundedBorderSquare", "RoundedBorder");
    v97->isRounded = v101;
    [(id)qword_2B04C0 setObject:v97 forKey:@"RoundedBorderSquare"];

    v102 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v102->outer.origin.x = 0.0;
    v102->outer.origin.y = 0.0;
    v102->outer.size = v112;
    v102->inner.origin.x = 0.0;
    v102->inner.origin.y = 0.0;
    v102->inner.size = v112;
    v102->size = (CGSize)xmmword_1F7D20;
    BOOL v103 = !NSStringHasPrefix(@"RoundedBorderLandscape", "NoBorder")
        && !NSStringHasPrefix(@"RoundedBorderLandscape", "Full")
        && !NSStringHasPrefix(@"RoundedBorderLandscape", "RoundedBorder");
    v102->isImageFrame = v103;
    BOOL v104 = NSStringHasPrefix(@"RoundedBorderLandscape", "squareBorderNotches")
        || NSStringHasPrefix(@"RoundedBorderLandscape", "offwhiteFrame")
        || NSStringHasPrefix(@"RoundedBorderLandscape", "PolaroidType55");
    v102->needsInset = v104;
    BOOL v105 = NSStringHasPrefix(@"RoundedBorderLandscape", "FiledEdgeBleed");
    v102->isMask = v105;
    BOOL v106 = !v105 && NSStringHasPrefix(@"RoundedBorderLandscape", "RoundedBorder");
    v102->isRounded = v106;
    objc_msgSend((id)qword_2B04C0, "setObject:forKey:", v102);

    v107 = objc_alloc_init(&OBJC_CLASS___MRPortfolioFrameImage);
    v107->outer.origin.x = 0.0;
    v107->outer.origin.y = 0.0;
    v107->outer.size = v112;
    v107->inner.origin.x = 0.0;
    v107->inner.origin.y = 0.0;
    v107->inner.size = v112;
    v107->size = (CGSize)xmmword_1F7D30;
    BOOL v108 = !NSStringHasPrefix(@"FullPortrait", "NoBorder")
        && !NSStringHasPrefix(@"FullPortrait", "Full")
        && !NSStringHasPrefix(@"FullPortrait", "RoundedBorder");
    v107->isImageFrame = v108;
    BOOL v109 = NSStringHasPrefix(@"FullPortrait", "squareBorderNotches")
        || NSStringHasPrefix(@"FullPortrait", "offwhiteFrame")
        || NSStringHasPrefix(@"FullPortrait", "PolaroidType55");
    v107->needsInset = v109;
    BOOL v110 = NSStringHasPrefix(@"FullPortrait", "FiledEdgeBleed");
    v107->isMask = v110;
    BOOL v111 = !v110 && NSStringHasPrefix(@"FullPortrait", "RoundedBorder");
    v107->isRounded = v111;
    [(id)qword_2B04C0 setObject:v107 forKey:@"FullPortrait"];

    qword_2B04C8 =  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"offwhiteFrame",  @"squareBorderNotches",  @"squareBorder",  @"BrushStroke",  @"FiledEdgeBlack",  @"FiledEdgeBleed",  @"FiledEdgeSprocket",  @"PolaroidType55",  @"NoBorder",  @"RoundedBorder",  @"Full",  0LL);
    qword_2B04D0 = objc_retain( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"offwhiteFrameV1",  0LL),  @"offwhiteFrame",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"squareBorderNotchesV1",  0LL),  @"squareBorderNotches",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"squareBorderV1",  0LL),  @"squareBorder",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"BrushStroke-A-V2",  @"BrushStroke-B-V2",  @"BrushStroke-C-V2",  0LL),  @"BrushStroke",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"FiledEdgeBlack-A-V2",  @"FiledEdgeBlack-B-V2",  0LL),  @"FiledEdgeBlack",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"FiledEdgeBleed-A-V1",  @"FiledEdgeBleed-B-V1",  0LL),  @"FiledEdgeBleed",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"FiledEdgeSprocket-A-V2",  @"FiledEdgeSprocket-B-V2",  0LL),
                       @"FiledEdgeSprocket",
                       +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"PolaroidType55-A-V1",  @"PolaroidType55-B-V1",  0LL),  @"PolaroidType55",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"NoBorderPortrait",  @"NoBorderSquare",  @"NoBorderLandscape",  0LL),  @"NoBorder",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"RoundedBorderPortrait",  @"RoundedBorderSquare",  @"RoundedBorderLandscape",  0LL),  @"RoundedBorder",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"FullPortrait",  0LL),  @"Full",  0LL));
  }

- (MREffectPortfolio)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectPortfolio;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3[233] = 0;
    v3[257] = 0;
    v3[258] = 0;
    __int128 v6 = xmmword_1F7D40;
    __int128 v7 = xmmword_1F7D50;
    *(void *)(v3 + 281) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
    __int128 v6 = xmmword_1F7D60;
    __int128 v7 = xmmword_1F7D70;
    *(void *)(v3 + 289) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
    __int128 v6 = xmmword_1F6FA0;
    __int128 v7 = xmmword_1F7D80;
    *(void *)(v3 + 297) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
    __int128 v6 = xmmword_1F7D90;
    __int128 v7 = xmmword_1F7DA0;
    *(void *)(v3 + 305) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v6);
  }

  return (MREffectPortfolio *)v3;
}

- (void)_cleanup
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = *(MRImageProvider **)((char *)&self->mPageCreaseProvider + 1);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mPageCreaseProvider + 1),  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "cleanup");
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  *(MRImageProvider **)((char *)&self->mPageCreaseProvider + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = 0LL;
  [*(id *)((char *)&self->mSprites + 1) cleanup];

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->mLeftPageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mLeftPageProvider + 1) = 0LL;
  [*(id *)((char *)&self->mRightPageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mRightPageProvider + 1) = 0LL;
  *(MRImage **)((char *)&self->mTextImage0 + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)self->mZoomCurves + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)&self->mZoomCurves[1] + 1) = 0LL;

  *(MRCAMLBezierData **)((char *)self->mXLCurves + 1) = 0LL;
  self->mIsBreakXL = 0;
  BYTE1(self->mFrameList) = 0;
  BYTE3(self->mPageCount) = 0;
  BYTE4(self->mPageCount) = 0;
  BYTE5(self->mPageCount) = 0;
  HIBYTE(self->mPageCount) = 0;
  self->mLeftZoom = 0;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MREffectPortfolio;
    -[MREffect setPixelSize:](&v17, "setPixelSize:", a3.width, a3.height);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v8 = *(MRImageProvider **)((char *)&self->mPageCreaseProvider + 1);
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( objc_msgSend( *(id *)((char *)&self->mPageCreaseProvider + 1),  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)i)),  "setDefaultSize:",  width,  height);
        }

        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v10);
    }

    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.5,  p_mPixelSize->height);
    objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.5,  p_mPixelSize->height);
    BYTE1(self->mFrameList) = 0;
  }

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = *(MRImageProvider **)((char *)&self->mPageCreaseProvider + 1);
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend( objc_msgSend( *(id *)((char *)&self->mPageCreaseProvider + 1),  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)i)),  "isLoaded"))
        {
          char v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  char v9 = 0;
LABEL_11:
  id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  BOOL v11 = !v10 || ![v10 length] || *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) != 0;
  v12 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v12) {
    unsigned int v13 = [v12 isLoaded] ^ 1;
  }
  else {
    LOBYTE(v13) = 0;
  }
  __int128 v14 = *(MRImageProvider **)((char *)&self->mLeftPageProvider + 1);
  if (v14) {
    unsigned __int8 v15 = [v14 isLoaded];
  }
  else {
    unsigned __int8 v15 = 1;
  }
  else {
    return v15 & v11;
  }
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (BYTE1(self->mFrameList)) {
    goto LABEL_3;
  }
  self->mLeftZoom = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"fitMovies"),  "BOOLValue");
  if (BYTE1(self->mFrameList)) {
    goto LABEL_3;
  }
  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"PortfolioSlideBreakXL"))
  {
    self->mIsBreakXL = 1;
    BYTE1(self->mFrameList) = 1;
    BYTE3(self->mPageCount) = 1;
    id v25 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    if (!*(NSMutableDictionary **)((char *)&self->mSprites + 1))
    {
      BOOL v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@Page-Left.jpg",  @"white");
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setAssetPath:",  objc_msgSend(v25, "resourcePathForEffectID:andResource:", self->super.mEffectID, v26));
      objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setOriginalImageSize:", 1200.0, 960.0);
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
    }

    if (!*(MRImageProvider **)((char *)&self->mLeftPageProvider + 1))
    {
      v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@Page-Right.jpg",  @"white");
      *(MRImageProvider **)((char *)&self->mLeftPageProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "setAssetPath:",  objc_msgSend(v25, "resourcePathForEffectID:andResource:", self->super.mEffectID, v27));
      objc_msgSend(*(id *)((char *)&self->mLeftPageProvider + 1), "setOriginalImageSize:", 1200.0, 960.0);
      objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
    }

    goto LABEL_3;
  }

  if (BYTE1(self->mFrameList)) {
    goto LABEL_3;
  }
  if (!-[NSString hasPrefix:](self->super.mEffectID, "hasPrefix:", @"PortfolioSlide"))
  {
    if (BYTE1(self->mFrameList)) {
      goto LABEL_3;
    }
    id v171 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v175 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"leftColor");
    id v169 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"rightColor");
    id v44 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"leftCount"),  "integerValue");
    else {
      uint64_t v45 = (uint64_t)v44;
    }
    uint64_t v174 = v45;
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"pageCount")) {
      id v46 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"pageCount"),  "integerValue");
    }
    else {
      id v46 = &dword_0 + 2;
    }
    *(void *)(&self->mIsLoaded + 1) = v46;
    BYTE5(self->mPageCount) = -[NSString hasPrefix:]( self->super.mEffectID,  "hasPrefix:",  @"Portfolio2SlidesBreak");
    BYTE6(self->mPageCount) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"breakDirection"),  "integerValue") != 0;
    if (!*(NSMutableDictionary **)((char *)&self->mSprites + 1))
    {
      BOOL v59 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@Page-Left.jpg", v175);
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setAssetPath:",  objc_msgSend(v171, "resourcePathForEffectID:andResource:", self->super.mEffectID, v59));
      objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setOriginalImageSize:", 1200.0, 960.0);
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
    }

    if (!*(MRImageProvider **)((char *)&self->mLeftPageProvider + 1))
    {
      id v60 = v175;
      if (v169) {
        id v60 = v169;
      }
      BOOL v61 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@Page-Right.jpg", v60);
      *(MRImageProvider **)((char *)&self->mLeftPageProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "setAssetPath:",  objc_msgSend(v171, "resourcePathForEffectID:andResource:", self->super.mEffectID, v61));
      objc_msgSend(*(id *)((char *)&self->mLeftPageProvider + 1), "setOriginalImageSize:", 1200.0, 960.0);
      objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width * 0.5,  self->super.mPixelSize.height);
    }

    NSUInteger v172 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
    v62 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
    if (v62)
    {

      *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = 0LL;
    }

    *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned int v63 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"leftSquare"),  "BOOLValue");
    unsigned int v162 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"rightSquare"),  "BOOLValue");
    BYTE1(self->mPageCount) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"leftZoom"),  "BOOLValue");
    BYTE2(self->mPageCount) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"rightZoom"),  "BOOLValue");
    id v64 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    uint64_t v65 = 1LL;
    if (v174 == 2) {
      uint64_t v65 = 2LL;
    }
    if (v172 == 2) {
      uint64_t v65 = 1LL;
    }
    if (*(void *)(&self->mIsLoaded + 1) == 1LL) {
      uint64_t v66 = v172;
    }
    else {
      uint64_t v66 = v65;
    }
    int v67 = BYTE1(self->mPageCount);
    unsigned int v164 = [v175 isEqualToString:v169];
    __int128 v199 = 0u;
    __int128 v200 = 0u;
    __int128 v201 = 0u;
    __int128 v202 = 0u;
    BOOL v68 = -[NSDictionary allValues]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "allValues");
    id v69 = -[NSArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v199,  v206,  16LL);
    if (v69)
    {
      id v70 = v69;
      int v183 = v67;
      uint64_t v71 = *(void *)v200;
      while (2)
      {
        for (i = 0LL; i != v70; i = (char *)i + 1)
        {
          if (*(void *)v200 != v71) {
            objc_enumerationMutation(v68);
          }
          if ([*(id *)(*((void *)&v199 + 1) + 8 * (void)i) canPlay])
          {
            char v73 = 1;
            goto LABEL_143;
          }
        }

        id v70 = -[NSArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v199,  v206,  16LL);
        if (v70) {
          continue;
        }
        break;
      }

      char v73 = 0;
LABEL_143:
      uint64_t v74 = v66;
      int v67 = v183;
    }

    else
    {
      char v73 = 0;
      uint64_t v74 = v66;
    }

    BOOL v163 = 0;
    int64_t v75 = 0LL;
    uint64_t v170 = 0LL;
    int v173 = 0;
    id v76 = 0LL;
    BOOL v77 = v67 != 0;
    char v160 = v73;
    unsigned __int8 v161 = v73 ^ 1;
    char v78 = 1;
    double v79 = -1.0;
    id obj = v175;
    while (1)
    {
      uint64_t v166 = v74;
      if ((v78 & 1) != 0)
      {
        unint64_t v80 = (unint64_t)[v64 randomInt];
        unint64_t v81 = v80 % ((unint64_t)[(id)qword_2B04C8 count] - 3);
        v82 = (const __CFString *)[(id)qword_2B04C8 objectAtIndex:v81];
        if (BYTE1(self->mPageCount))
        {
          int v83 = 1;
        }

        else
        {
          char v84 = v160;
          if (BYTE2(self->mPageCount)) {
            char v84 = 1;
          }
          if ((v84 & 1) != 0)
          {
            int v83 = 1;
          }

          else if ((v164 & 1) != 0 {
                 || v77 | (([obj isEqualToString:@"white"] & 1) == 0))
          }
          {
            unsigned __int8 v85 = [obj isEqualToString:@"black"];
            if (v81 == 7) {
              unsigned __int8 v86 = 0;
            }
            else {
              unsigned __int8 v86 = v85;
            }
            int v83 = v77 | (v170 == 1) & ~v173 | v86 & 1;
          }

          else
          {
            int v83 = 0;
          }
        }

        if (v76) {

        }
        if (v83) {
          v87 = @"NoBorder";
        }
        else {
          v87 = v82;
        }
        id v76 = objc_msgSend(objc_msgSend((id)qword_2B04D0, "objectForKey:", v87), "mutableCopy");
        BOOL v163 = ((unint64_t)[v64 randomInt] & 0x8000000000000001) == 1 && !v77;
        int v173 = v83 != 0;
        uint64_t v74 = v166;
      }

      if (v74 >= 1) {
        break;
      }
LABEL_222:
      uint64_t v74 = v172 - v166;
      int v114 = BYTE2(self->mPageCount);
      BOOL v77 = BYTE2(self->mPageCount) != 0;
      if (((v173 | v164) & 1) != 0 || ([obj isEqualToString:@"white"] & 1) == 0)
      {
        id v115 = [v76 count];
        char v78 = (v172 == 3) & ~(_BYTE)v173;
        if (v114) {
          char v78 = 1;
        }
      }

      else
      {
        char v78 = 1;
      }

      id obj = v169;
      unsigned int v63 = v162;
      int64_t v75 = v166;
      if (++v170 >= *(void *)(&self->mIsLoaded + 1))
      {
        if (v76) {

        }
        __int128 v197 = 0u;
        __int128 v198 = 0u;
        __int128 v195 = 0u;
        __int128 v196 = 0u;
        id obja = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
        id v185 = [obja countByEnumeratingWithState:&v195 objects:v205 count:16];
        if (!v185)
        {
LABEL_274:
          BYTE1(self->mFrameList) = 1;
          goto LABEL_3;
        }

        v116 = 0LL;
        uint64_t v180 = *(void *)v196;
        while (2)
        {
          v117 = 0LL;
          v177 = (void *)(v172 - 1 - (void)v116);
          v182 = v116;
LABEL_235:
          if (*(void *)v196 != v180) {
            objc_enumerationMutation(obja);
          }
          v118 = (char *)v117 + (void)v116;
          uint64_t v119 = *(void *)(*((void *)&v195 + 1) + 8LL * (void)v117);
          v120 = (double *)[(id)qword_2B04C0 objectForKey:v119];
          double v121 = v120[9];
          double v122 = v120[10];
          id v123 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v117 + (void)v116));
          id v124 = [v123 canPlay];
          [a4 localAspectRatio];
          -[MREffectPortfolio _rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:]( self,  "_rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:",  v118,  v119,  v174,  v124,  v125);
          double v127 = v126;
          double v129 = v128;
          if (*((_BYTE *)v120 + 88))
          {
            v130 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
            [*(id *)((char *)&self->mPageCreaseProvider + 1) setObject:v130 forKey:v119];
            -[MRImageProvider setAssetPath:]( v130,  "setAssetPath:",  [v171 resourcePathForEffectID:self->super.mEffectID, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.png", v119) andResource]);
            -[MRImageProvider setImageSizeScript:](v130, "setImageSizeScript:", 0LL);
            -[MRImageProvider setOriginalImageSize:](v130, "setOriginalImageSize:", v121, v122);
            -[MRImageProvider setDefaultSize:]( v130,  "setDefaultSize:",  v127 * 0.5 * self->super.mPixelSize.width,  v129 * 0.5 * self->super.mPixelSize.height);

            double v127 = v127 * v120[7];
            double v129 = v129 * v120[8];
          }

          if ((BYTE1(self->mPageCount) && !v118 || BYTE2(self->mPageCount) && v177 == v117)
            && (([v123 imageAspectRatio], v131 < 1.0)
             || ([a4 localAspectRatio], v132 >= 1.0)))
          {
            [v123 imageAspectRatio];
            if (v136 <= 2.0 || ([a4 localAspectRatio], v137 >= 1.0))
            {
              [v123 imageAspectRatio];
              double width = self->super.mPixelSize.width;
              double height = self->super.mPixelSize.height;
              if (v143 < 1.0) {
                goto LABEL_272;
              }
              double v142 = 1.0 / v127;
            }

            else
            {
              double height = 0.333000004;
              CGFloat v139 = self->super.mPixelSize.height * 0.333000004;
              [v123 imageAspectRatio];
              double width = v139 * v140;
              double v142 = self->super.mPixelSize.height;
            }

            double height = v142 * height;
          }

          else
          {
            if (*(void *)(&self->mIsLoaded + 1) != 1LL) {
              goto LABEL_261;
            }
            [a4 localAspectRatio];
            if (v133 > 1.0)
            {
              [v123 imageAspectRatio];
              if (v134 < 1.0 && v172 == 1)
              {
                double v135 = self->super.mPixelSize.height;
                goto LABEL_271;
              }
            }

            if (*(void *)(&self->mIsLoaded + 1) == 1LL
              && ([a4 localAspectRatio], v144 > 1.0)
              && ([v123 imageAspectRatio], v145 >= 1.0)
              && v172 == 1)
            {
              double width = self->super.mPixelSize.width;
              double height = self->super.mPixelSize.height;
            }

            else
            {
LABEL_261:
              [a4 localAspectRatio];
              if (v146 >= 1.0 || ([v123 imageAspectRatio], v147 <= 2.0))
              {
                [a4 localAspectRatio];
                if (v152 >= 1.0 || ([v123 imageAspectRatio], v153 >= 0.5))
                {
                  double width = v127 * 0.5 * self->super.mPixelSize.width;
                  double height = v129 * 0.5 * self->super.mPixelSize.height;
                }

                else
                {
                  [v123 imageAspectRatio];
                  double v155 = v154 * 4.0;
                  [a4 localAspectRatio];
                  double v157 = v155 / v156;
                  double v135 = self->super.mPixelSize.height;
                  if (v157 >= 2.0)
                  {
LABEL_271:
                    [v123 imageAspectRatio];
                    double width = v135 * v159;
                    double height = self->super.mPixelSize.height;
                  }

                  else
                  {
                    [v123 imageAspectRatio];
                    double width = (v135 + v135) * v158;
                    double height = self->super.mPixelSize.height + self->super.mPixelSize.height;
                  }
                }
              }

              else
              {
                [v123 imageAspectRatio];
                double v149 = 6.0 / v148;
                [a4 localAspectRatio];
                double width = self->super.mPixelSize.width;
                if (v149 * v150 < 1.75) {
                  double width = width * 3.0;
                }
                [v123 imageAspectRatio];
                double height = width / v151;
              }
            }
          }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (BYTE3(self->mPageCount))
  {
    [a4 localAspectRatio];
    if (v9 > 1.0)
    {
      -[MREffectPortfolio _drawBreakXLAtTime:inContext:withArguments:]( self,  "_drawBreakXLAtTime:inContext:withArguments:",  a4,  a5,  a3);
      return;
    }
  }

  [a4 setShader:@"PlainTexture"];
  id v10 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"leftCount"),  "integerValue");
  else {
    uint64_t v11 = (uint64_t)v10;
  }
  uint64_t v12 = *(void *)(&self->mIsLoaded + 1);
  if (v12 == 2)
  {
    [a4 localAspectRatio];
    BOOL v14 = v13 < 1.0;
    uint64_t v12 = *(void *)(&self->mIsLoaded + 1);
  }

  else
  {
    BOOL v14 = 0;
  }

  if (v12 == 1)
  {
    [a4 localAspectRatio];
    BOOL v16 = v15 > 1.0;
  }

  else
  {
    BOOL v16 = 0;
  }

  NSUInteger v17 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  if (self->mIsBreakXL)
  {
    char v18 = ImageKey(0LL);
    id v19 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v18);
    id v20 = [v19 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    if (!self->mLeftZoom || ![v19 canPlay])
    {
      [v20 aspectRatio];
      if (v33 < 0.5 || v33 > 2.0)
      {
        [a4 localAspectRatio];
        if (v35 > 1.0)
        {
          [v20 aspectRatio];
          if (v36 > 2.0)
          {
            [v20 aspectRatio];
            double v38 = 2.0 / v37;
            [a4 localAspectRatio];
            double v40 = v38 * v39;
            -[MREffectPortfolio _drawPagesAtTime:inContext:withArguments:]( self,  "_drawPagesAtTime:inContext:withArguments:",  a4,  a5,  a3);
            double v41 = *(void **)(&self->super._isInInteractiveMode + 1);
            double v42 = (MRCroppingSprite *)[v41 objectForKey:v18];
            if (!v42)
            {
              double v42 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
              [v41 setObject:v42 forKey:v18];
            }

            LODWORD(v43) = 0;
            -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v42,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v20,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  v40,  v43);
            -[MREffectPortfolio _drawPagesCreaseWithHeight:atTime:inContext:withArguments:]( self,  "_drawPagesCreaseWithHeight:atTime:inContext:withArguments:",  a4,  a5,  v40,  a3);
            goto LABEL_81;
          }
        }

        [a4 localAspectRatio];
        if (v73 <= 1.0 || ([v20 aspectRatio], v74 >= 0.5))
        {
          [a4 localAspectRatio];
          if (v80 >= 1.0 || ([v20 aspectRatio], v81 >= 0.5))
          {
            [a4 localAspectRatio];
            if (v85 >= 1.0) {
              goto LABEL_81;
            }
            [v20 aspectRatio];
            if (v86 <= 2.0) {
              goto LABEL_81;
            }
            [v20 aspectRatio];
            double v88 = 6.0 / v87;
            [a4 localAspectRatio];
            if (v88 * v89 >= 1.75)
            {
              id v177 = [*(id *)((char *)&self->mSprites + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
              +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v177,  a4,  0.0,  0.0,  2.0,  2.0);
              [v177 releaseByUser];
              [v20 aspectRatio];
              double v179 = 2.0 / v178;
              [a4 localAspectRatio];
              double v181 = v179 * v180;
              v182 = *(void **)(&self->super._isInInteractiveMode + 1);
              int v183 = (MRCroppingSprite *)[v182 objectForKey:v18];
              if (!v183)
              {
                int v183 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
                [v182 setObject:v183 forKey:v18];
              }

              double x = CGPointZero.x;
              double y = CGPointZero.y;
              double v102 = 2.0;
              LODWORD(v96) = 0;
              BOOL v99 = v183;
              id v100 = v20;
              id v101 = a4;
              double v103 = v181;
              goto LABEL_80;
            }

            -[MREffectPortfolio _drawLandscapeBreakForPortraitAtTime:duration:inContext:withArguments:]( self,  "_drawLandscapeBreakForPortraitAtTime:duration:inContext:withArguments:",  a4,  a5,  a3,  self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration);
          }

          else
          {
            [v20 aspectRatio];
            double v83 = v82 * 4.0;
            [a4 localAspectRatio];
            if (v83 / v84 >= 2.0)
            {
              id v104 = [*(id *)((char *)&self->mSprites + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
              +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v104,  a4,  0.0,  0.0,  2.0,  2.0);
              [v104 releaseByUser];
              [v20 aspectRatio];
              double v106 = v105 + v105;
              [a4 localAspectRatio];
              double v108 = *(void **)(&self->super._isInInteractiveMode + 1);
              double v109 = v106 / v107;
              double v110 = (MRCroppingSprite *)[v108 objectForKey:v18];
              if (!v110)
              {
                double v110 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
                [v108 setObject:v110 forKey:v18];
              }

              double x = CGPointZero.x;
              double y = CGPointZero.y;
              double v103 = 2.0;
              LODWORD(v96) = 0;
              BOOL v99 = v110;
              id v100 = v20;
              id v101 = a4;
              double v102 = v109;
              goto LABEL_80;
            }

            -[MREffectPortfolio _drawPortraitBreakForPortraitAtTime:duration:inContext:withArguments:]( self,  "_drawPortraitBreakForPortraitAtTime:duration:inContext:withArguments:",  a4,  a5,  a3,  self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration);
          }
        }

        else
        {
          -[MREffectPortfolio _drawPortraitBreakForLandscapeAtTime:duration:onePage:inContext:withArguments:]( self,  "_drawPortraitBreakForLandscapeAtTime:duration:onePage:inContext:withArguments:",  0LL,  a4,  a5,  a3,  self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration);
        }

- (void)_drawPagesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:");
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v9,  a4,  0.5,  0.0,  1.0,  2.0);
  [v9 releaseByUser];
  id v10 = [*(id *)((char *)&self->mSprites + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v10,  a4,  -0.5,  0.0,  1.0,  2.0);
  [v10 releaseByUser];
}

- (void)_drawPagesCreaseWithHeight:(double)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  id v11 = [*(id *)((char *)&self->mRightPageProvider + 1) retainedByUserRenderedImageAtTime:a5 inContext:a6 withArguments:a4];
  [v11 aspectRatio];
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v11,  a5,  v12 * a3 * -0.5,  0.0,  v12 * a3,  a3);
  [v11 releaseByUser];
  [a5 blend:0];
}

- (void)_drawFrame:(id)a3 index:(int64_t)a4 leftCount:(int64_t)a5 time:(double)a6 inContext:(id)a7 withArguments:(id)a8
{
  float v15 = (double *)objc_msgSend((id)qword_2B04C0, "objectForKey:");
  BOOL v16 = ImageKey(a4);
  id v17 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v16);
  id v91 = [v17 retainedByUserRenderedImageAtTime:a7 inContext:a8 withArguments:a6];
  [v91 aspectRatio];
  double v19 = v18;
  BOOL v20 = v18 > 2.0 || v18 < 0.5;
  if (v20)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  else
  {
    id v25 = [v17 canPlay];
    [a7 localAspectRatio];
    -[MREffectPortfolio _rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:]( self,  "_rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:",  a4,  a3,  a5,  v25,  v26);
    double x = v27;
    double y = v28;
    double width = v29;
    double height = v30;
  }

  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  if (*((_BYTE *)v15 + 88))
  {
    double v36 = v15[7];
    double v35 = v15[8];
    double v33 = width * v36;
    double v34 = height * v35;
    double v31 = x + (v15[5] - (1.0 - (v36 + v15[5]))) * 0.5;
    double v32 = y + (v15[6] - (1.0 - (v35 + v15[6]))) * 0.5;
  }

  if (v20)
  {
    double v37 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v38 = (MRCroppingSprite *)objc_msgSend(v37, "objectForKey:", v16, v32, v31);
    if (!v38)
    {
      double v38 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v37 setObject:v38 forKey:v16];
    }

    [a7 localAspectRatio];
    float v40 = v39;
    if (v19 < 1.0)
    {
      if (v39 >= 1.0)
      {
        if (a4) {
          double v78 = 0.5;
        }
        else {
          double v78 = -0.5;
        }
        float v51 = v91;
        [v91 aspectRatio];
        double v80 = v79 * 6.0;
        [a7 localAspectRatio];
        double v60 = v80 / v81 * 0.5;
        *(float *)&double v41 = v19;
        double v59 = 0.0;
        double v43 = 2.0;
        double v53 = 0.0;
        double v54 = 1.0;
        double v55 = (__objc2_class *)v38;
        id v56 = v91;
        id v57 = a7;
        double v58 = v78;
        goto LABEL_42;
      }

      [a7 localAspectRatio];
      double v43 = 0.85 / v19 * v42;
      if (v43 <= 1.79999995)
      {
        *(float *)&double v41 = v19;
        double v58 = 0.0;
        double v59 = 0.0;
        double v53 = 0.0;
        double v54 = 0.0;
        double v55 = (__objc2_class *)v38;
        float v51 = v91;
        id v56 = v91;
        id v57 = a7;
        double v60 = 0.85;
        goto LABEL_42;
      }

      [a7 localAspectRatio];
      double v45 = 0.85 / (v19 + v19) * v44;
      if (v45 * 0.5 >= 0.75) {
        double v46 = 0.0;
      }
      else {
        double v46 = (1.0 - v45 * 0.5) * 0.5;
      }
      [a7 localAspectRatio];
      double v48 = dbl_1F7DB0[v47 < 1.0];
      double v49 = v48 + 0.425;
      float v50 = v19;
      float v51 = v91;
      *(float *)&double v52 = v50;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v38,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v91,  a7,  -0.425 - v48,  1.0 - v45 * 0.5 + -0.0199999996 - v46,  0.85,  v45,  v52,  0.0,  1.0);
      double v53 = 0.0;
      double v54 = 3.0;
      double v55 = (__objc2_class *)v38;
      id v56 = v91;
      id v57 = a7;
      double v58 = v49;
      double v59 = v45 * 0.5 + -1.0 + 0.0199999996 + v46;
      double v60 = 0.85;
      double v43 = v45;
LABEL_41:
      *(float *)&double v41 = v50;
LABEL_42:
      -[__objc2_class renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v55,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v56,  v57,  v58,  v59,  v60,  v43,  v41,  v53,  v54);
      goto LABEL_49;
    }

    [a7 localAspectRatio];
    if (v72 >= 0.6)
    {
      [a7 localAspectRatio];
      if (v82 >= 0.7)
      {
        [a7 localAspectRatio];
        float v51 = v91;
        if (v89 >= 1.0) {
          double v73 = 1.32000008;
        }
        else {
          double v73 = 1.21000005;
        }
        goto LABEL_35;
      }

      double v73 = 1.10000002;
    }

    else
    {
      double v73 = 0.962500021;
    }

    float v51 = v91;
LABEL_35:
    [a7 localAspectRatio];
    double v85 = 0.5;
    if (!a4) {
      double v85 = -0.5;
    }
    double v86 = v73 / v83;
    if (v40 >= 1.0) {
      double v87 = v85;
    }
    else {
      double v87 = 0.0;
    }
    float v50 = v19;
    *(float *)&double v84 = v50;
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v51,  a7,  v87 + -0.0500000007,  0.650000013,  v86,  0.550000012,  v84,  1.0,  0.0);
    *(float *)&double v88 = v50;
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v51,  a7,  v87,  0.0,  v86,  0.550000012,  v88,  2.0,  0.0);
    double v55 = &OBJC_CLASS___MRCroppingSprite;
    double v59 = -0.650000013;
    double v53 = 3.0;
    double v54 = 0.0;
    id v56 = v51;
    id v57 = a7;
    double v58 = v87 + 0.0500000007;
    double v60 = v86;
    double v43 = 0.550000012;
    goto LABEL_41;
  }

  if (!*((_BYTE *)v15 + 91))
  {
    int v74 = *((unsigned __int8 *)v15 + 90);
    double v90 = v32;
    double v75 = v31;
    if (*((_BYTE *)v15 + 88))
    {
      id v76 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mPageCreaseProvider + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a7,  a8,  a6);
      if (v74)
      {
LABEL_27:
        [a7 blend:2];
        [a7 unsetShader];
        [a7 setShader:@"AlphaMaskPremultipliedOnlyAlpha"];
        [v76 setClampMode:2];
        [v76 setPreservesAspectRatio:0];
        LODWORD(v77) = 0;
        [v76 setOnContext:a7 onTextureUnit:1 withReferenceAspectRatio:&v92 state:v77];
        -[MREffectPortfolio _drawIndex:time:context:arguments:size:position:]( self,  "_drawIndex:time:context:arguments:size:position:",  a4,  a7,  a8,  a6,  v33,  v34,  v75,  v90);
        [v76 unsetOnContext:a7 onTextureUnit:1 state:&v92];
        [a7 unsetShader];
        [a7 blend:0];
        [a7 setShader:@"PlainTexture"];
        goto LABEL_46;
      }
    }

    else
    {
      id v76 = 0LL;
      if (*((_BYTE *)v15 + 90)) {
        goto LABEL_27;
      }
    }

    -[MREffectPortfolio _drawIndex:time:context:arguments:size:position:]( self,  "_drawIndex:time:context:arguments:size:position:",  a4,  a7,  a8,  a6,  v33,  v34,  v75,  v90);
    if (!*((_BYTE *)v15 + 88))
    {
LABEL_48:
      float v51 = v91;
      goto LABEL_49;
    }

    [a7 blend:2];
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v76,  a7,  x,  y,  width,  height);
    [a7 blend:0];
LABEL_46:
    if (*((_BYTE *)v15 + 88)) {
      [v76 releaseByUser];
    }
    goto LABEL_48;
  }

  double v61 = v32;
  double v62 = v31;
  [a7 blend:2];
  [a7 unsetShader];
  [a7 setShader:@"RoundedCorners"];
  LODWORD(v63) = 5.0;
  LODWORD(v64) = 5.0;
  [a7 setShaderUniformVec2:@"invRadii" :v63 forKey:v64];
  [a7 localAspectRatio];
  double v66 = v33 * 0.00999999978 / (v34 / v65);
  *(float *)&double v67 = v66;
  LODWORD(v66) = 1008981770;
  [a7 setShaderUniformVec2:@"radius" :v66 forKey:v67];
  float v68 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v69 = (MRCroppingSprite *)[v68 objectForKey:v16];
  if (!v69)
  {
    double v69 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v68 setObject:v69 forKey:v16];
  }

  -[MRCroppingSprite setInnerRect:]( v69,  "setInnerRect:",  2.0 / (v33 * self->super.mPixelSize.width * 0.1),  2.0 / (v34 * self->super.mPixelSize.height * 0.1),  1.0 - 4.0 / (v33 * self->super.mPixelSize.width * 0.1),  1.0 - 4.0 / (v34 * self->super.mPixelSize.height * 0.1));
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v69, "setNeedsInSpriteCoordinates:", 1LL);
  LODWORD(v70) = 0;
  float v51 = v91;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v69,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v91,  a7,  v62,  v61,  v33,  v34,  v70);
  [a7 unsetShader];
  [a7 setShader:@"PlainTexture"];
  [a7 blend:0];
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v69, "setNeedsInSpriteCoordinates:", 0LL);
  LODWORD(v71) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v69,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v91,  a7,  v62,  v61,  v33,  v34,  v71);
LABEL_49:
  [v51 releaseByUser];
}

- (CGRect)_rectForSlideAtIndex:(int64_t)a3 frame:(id)a4 leftCount:(int64_t)a5 movie:(BOOL)a6 localAspectRatio:(double)a7
{
  BOOL v46 = a6;
  uint64_t v11 = *(void *)(&self->mIsLoaded + 1);
  BOOL v12 = v11 == 2;
  BOOL v13 = a7 < 1.0;
  BOOL v14 = v11 == 1 && a7 > 1.0;
  int v15 = v13 && v12;
  if (v13 && v12) {
    int64_t v16 = a5;
  }
  else {
    int64_t v16 = 0LL;
  }
  if (v13 && v12) {
    int64_t v17 = (a3 - a5) & ~((a3 - a5) >> 63);
  }
  else {
    int64_t v17 = a3;
  }
  double v18 = (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  16LL),  "count")
      - v16;
  double v19 = (double *)[(id)qword_2B04C0 objectForKey:a4];
  if (*((_BYTE *)v19 + 88)) {
    double v20 = dbl_1F6AE0[*((_BYTE *)v19 + 89) == 0];
  }
  else {
    double v20 = 0.800000012;
  }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double v23 = v19[9] / v19[10];
  if (v18 != (_BYTE *)&dword_0 + 2)
  {
    BOOL v27 = a5 == 2 && v17 == 2 || a5 == 1 && v17 == 0;
    BOOL HasPrefix = NSStringHasPrefix(a4, "Full");
    if (v18 == (_BYTE *)&dword_0 + 1)
    {
      if (HasPrefix)
      {
        double width = 2.0;
        if (v23 >= 1.0) {
          double height = a7 / v23 + a7 / v23;
        }
        else {
          double height = 2.0;
        }
      }

      else
      {
        double width = v20 + v20;
        double height = a7 / v23 * (v20 + v20);
        if (height > 1.79999995)
        {
          double width = width * (1.79999995 / height);
          double height = height * (1.79999995 / height);
        }
      }

      goto LABEL_81;
    }

    if (v18 == (_BYTE *)&dword_0 + 3)
    {
      double height = 2.0;
      double v33 = 0.0;
      double v34 = 0.0;
      double width = 1.0;
      if (!HasPrefix)
      {
        double v34 = a7 / v23;
        if (v27) {
          double width = v20;
        }
        else {
          double width = 0.800000012;
        }
        double height = v34 * width;
        if (v34 * width > 1.79999995)
        {
          double width = width * (1.79999995 / height);
          double height = height * (1.79999995 / height);
        }

        char v35 = height <= 0.899999976 || v27;
        if ((v35 & 1) == 0)
        {
          double width = width * (0.899999976 / height);
          double v34 = height;
          double height = height * (0.899999976 / height);
        }
      }

      double v36 = (a7 / -1.77777778 + 1.0) * 0.15;
      double v37 = (v34 - height) * 0.5;
      if (!v27) {
        double v33 = v37;
      }
      if (v17 != 2)
      {
        if (v17 != 1)
        {
          if (!v17)
          {
            BOOL v38 = v46;
            if (a5 == 2)
            {
              double x = -0.5;
              double y = v33 * -0.5 + 0.5 - v36;
              goto LABEL_82;
            }

- (void)_drawBreakXLAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v9 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  double v10 = 0.0;
  if (v9 * 0.5 + 0.6665 <= a3)
  {
    uint64_t v12 = 1LL;
  }

  else
  {
    double v11 = v9 * 0.5 + -0.6665;
    uint64_t v12 = 0LL;
    if (v11 < a3) {
      double v10 = (a3 - v11) / 1.333;
    }
  }

  if (self->super._panoramaPanningOffsets)
  {
    -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0",  v10 + (double)v12,  0.0,  1.0);
    uint64_t v12 = vcvtmd_s64_f64(v13);
    double v10 = fmod(v13, 1.0);
  }

  if (v10 == 0.0)
  {
    -[MREffectPortfolio _renderXLPageAtIndex:flipped:atTime:inContext:withArguments:]( self,  "_renderXLPageAtIndex:flipped:atTime:inContext:withArguments:",  v12,  0LL,  a4,  a5,  a3);
  }

  else
  {
    ValueFromBezierPath((id *)((char *)&self->mZoomCurves[1] + 1), dbl_2AD400, 0.0, 1.0, v10, (uint64_t)&unk_2AD418, 3LL);
    double v15 = v14 * 57.2957795;
    MRMatrix_Clear((uint64_t)v52);
    float v16 = v15 / -180.0;
    int v17 = 0;
    *(float *)&double v18 = MRMatrix_Translate(v52, v16, 0.0, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v52, v51, v18);
    -[MREffectPortfolio _renderXLPageAtIndex:flipped:atTime:inContext:withArguments:]( self,  "_renderXLPageAtIndex:flipped:atTime:inContext:withArguments:",  0LL,  1LL,  a4,  a5,  a3);
    [a4 setShader:@"PlainTexture"];
    MRMatrix_Clear((uint64_t)v49);
    MRMatrix_Translate(v49, -1.0, 0.0, 0.0);
    float v19 = v15;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v50, 0.0, v19, 0.0);
    MRMatrix_PostMultiply((uint64_t)v49, v50);
    *(float *)&double v20 = MRMatrix_Translate(v49, 1.0, 0.0, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v49, v48, v20);
    if (v15 < 70.0)
    {
      double v22 = v15 * 0.0174532924;
    }

    else
    {
      MRMatrix_Clear((uint64_t)v47);
      *(float *)&double v21 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v47, 180.0, 0.0, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v47, v46, v21);
      double v22 = v15 * -0.0174532924 + 3.14159265;
      int v17 = 1078530011;
    }

    float v23 = v22;
    *(float *)&double v24 = (float)(cosf(v23) * 0.35) + 0.65;
    LODWORD(v25) = 1.0;
    LODWORD(v26) = LODWORD(v24);
    LODWORD(v27) = LODWORD(v24);
    [a4 composeForeColorRed:v45 green:v24 blue:v26 alpha:v27 saveTo:v25];
    id v28 = [*(id *)((char *)&self->mLeftPageProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    double v29 = 1.0;
    LODWORD(v30) = v17;
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v28,  a4,  0.5,  0.0,  1.0,  2.0,  v30);
    [v28 releaseByUser];
    if (v15 >= 70.0)
    {
      [a4 restoreModelViewMatrix:v46];
      double v29 = 3.0;
    }

    double v31 = ImageKey(0LL);
    id v32 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v31),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    double v33 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v34 = (MRCroppingSprite *)[v33 objectForKey:v31];
    if (!v34)
    {
      double v34 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v33 setObject:v34 forKey:v31];
    }

    [v32 aspectRatio];
    double v36 = 2.0 / (v35 * 0.666667);
    [a4 localAspectRatio];
    double v38 = v36 * v37;
    [v32 centerX];
    double v40 = v39;
    if (v15 < 70.0)
    {
      [v32 setCenterX:0.666666985];
    }

    else
    {
      MRMatrix_Clear((uint64_t)v47);
      MRMatrix_Translate(v47, -0.5, 0.0, 0.0);
      MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v44, 180.0, 0.0, 180.0);
      MRMatrix_PostMultiply((uint64_t)v47, v44);
      *(float *)&double v41 = MRMatrix_Translate(v47, 0.5, 0.0, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v47, v46, v41);
    }

    [v32 aspectRatio];
    *(float *)&double v43 = v42;
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v34,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v32,  a4,  0.5,  0.0,  1.0,  v38,  v43,  v29,  0.0);
    if (v15 < 70.0) {
      [v32 setCenterX:v40];
    }
    [v32 releaseByUser];
    [a4 unsetShader];
    [a4 restoreForeColor:v45];
    [a4 restoreModelViewMatrix:v51];
  }

- (void)_renderXLPageAtIndex:(int64_t)a3 flipped:(BOOL)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7
{
  BOOL v10 = a4;
  [a6 setShader:@"PlainTexture"];
  if (v10)
  {
    id v13 = [*(id *)((char *)&self->mSprites + 1) retainedByUserRenderedImageAtTime:a6 inContext:a7 withArguments:a5];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v13,  a6,  0.5,  0.0,  1.0,  2.0);
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v13,  a6,  -0.5,  0.0,  1.0,  2.0);
    [v13 releaseByUser];
  }

  else
  {
    -[MREffectPortfolio _drawPagesAtTime:inContext:withArguments:]( self,  "_drawPagesAtTime:inContext:withArguments:",  a6,  a7,  a5);
  }

  double v14 = ImageKey(0LL);
  id v15 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v14),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  float v16 = *(void **)(&self->super._isInInteractiveMode + 1);
  int v17 = (MRCroppingSprite *)[v16 objectForKey:v14];
  if (!v17)
  {
    int v17 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v16 setObject:v17 forKey:v14];
  }

  [v15 aspectRatio];
  double v19 = 2.0 / (v18 * 0.66667);
  [a6 localAspectRatio];
  double v21 = v19 * v20;
  if (a3) {
    double v22 = 3.0;
  }
  else {
    double v22 = 1.0;
  }
  [v15 aspectRatio];
  *(float *)&double v24 = v23;
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v17,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v15,  a6,  0.0,  0.0,  2.0,  v21,  v24,  v22,  0.0);
  [v15 releaseByUser];
  if (v10)
  {
    [a6 blend:2];
    id v25 = [*(id *)((char *)&self->mRightPageProvider + 1) retainedByUserRenderedImageAtTime:a6 inContext:a7 withArguments:a5];
    [v25 aspectRatio];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v25,  a6,  v21 * v26 * -0.5 + 1.0,  0.0,  v21 * v26,  v21);
    [v25 releaseByUser];
    [a6 blend:0];
  }

  -[MREffectPortfolio _drawPagesCreaseWithHeight:atTime:inContext:withArguments:]( self,  "_drawPagesCreaseWithHeight:atTime:inContext:withArguments:",  a6,  a7,  v21,  a5);
  [a6 unsetShader];
}

- (void)_drawPortraitBreakForLandscapeAtTime:(double)a3 duration:(double)a4 onePage:(BOOL)a5 inContext:(id)a6 withArguments:(id)a7
{
  BOOL v9 = a5;
  double v12 = 0.0;
  if (a4 * 0.666 + 0.6665 <= a3)
  {
    uint64_t v14 = 2LL;
    goto LABEL_10;
  }

  if (a4 * 0.333 + 0.6665 > a3)
  {
    double v13 = a4 * 0.333 + -0.6665;
    uint64_t v14 = 0LL;
    if (v13 >= a3) {
      goto LABEL_10;
    }
    double v15 = a3 - v13;
    goto LABEL_8;
  }

  double v16 = a4 * 0.666 + -0.6665;
  if (v16 < a3)
  {
    double v15 = a3 - v16;
    uint64_t v14 = 1LL;
LABEL_8:
    double v12 = v15 / 1.333;
    goto LABEL_10;
  }

  uint64_t v14 = 1LL;
LABEL_10:
  if (self->super._panoramaPanningOffsets)
  {
    -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0",  (v12 + (double)v14) * 0.5,  0.0,  1.0);
    double v18 = v17 + v17;
    uint64_t v14 = vcvtmd_s64_f64(v18);
    double v12 = fmod(v18, 1.0);
  }

  if (v12 == 0.0)
  {
    -[MREffectPortfolio _renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:",  v14,  0LL,  v9,  a6,  a7,  a3);
  }

  else
  {
    ValueFromBezierPath((id *)((char *)&self->mZoomCurves[1] + 1), dbl_2AD430, 0.0, 1.0, v12, (uint64_t)&unk_2AD448, 3LL);
    double v20 = v19 * 57.2957795;
    [a6 localAspectRatio];
    float v22 = 2.0 / v21;
    double v23 = (float)(2.0 / v21);
    MRMatrix_Clear((uint64_t)v43);
    float v24 = v20 / 180.0 * v23;
    *(float *)&double v25 = MRMatrix_Translate(v43, 0.0, v24, 0.0);
    objc_msgSend(a6, "composeModelViewMatrix:saveTo:", v43, v42, v25);
    -[MREffectPortfolio _renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:",  v14,  1LL,  v9,  a6,  a7,  a3);
    MRMatrix_Clear((uint64_t)v41);
    MRMatrix_Translate(v41, 0.0, v22 * 0.5, 0.0);
    float v26 = v20;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v40, v26, 0.0, 0.0);
    MRMatrix_PostMultiply((uint64_t)v41, v40);
    *(float *)&double v27 = MRMatrix_Translate(v41, 0.0, v22 * -0.5, 0.0);
    objc_msgSend(a6, "composeModelViewMatrix:saveTo:", v41, 0, v27);
    if (v20 >= 90.0)
    {
      MRMatrix_Clear((uint64_t)v41);
      *(float *)&double v33 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v41, 0.0, 180.0, 180.0);
      objc_msgSend(a6, "composeModelViewMatrix:saveTo:", v41, 0, v33);
      float v34 = v20 * -0.0174532924 + 3.14159265;
      *(float *)&double v35 = (float)(cosf(v34) * 0.35) + 0.65;
      LODWORD(v36) = 1.0;
      LODWORD(v37) = LODWORD(v35);
      LODWORD(v38) = LODWORD(v35);
      [a6 composeForeColorRed:v39 green:v35 blue:v37 alpha:v38 saveTo:v36];
      ++v14;
    }

    else
    {
      float v28 = v20 * 0.0174532924;
      *(float *)&double v29 = (float)(cosf(v28) * 0.35) + 0.65;
      LODWORD(v30) = 1.0;
      LODWORD(v31) = LODWORD(v29);
      LODWORD(v32) = LODWORD(v29);
      [a6 composeForeColorRed:v39 green:v29 blue:v31 alpha:v32 saveTo:v30];
    }

    -[MREffectPortfolio _renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakPageAtIndex:flipped:onePage:atTime:inContext:withArguments:",  v14,  1LL,  v9,  a6,  a7,  a3);
    [a6 restoreForeColor:v39];
    [a6 restoreModelViewMatrix:v42];
  }

- (void)_drawPortraitBreakForPortraitAtTime:(double)a3 duration:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  double v10 = 0.0;
  if (a4 * 0.5 + 0.6665 <= a3)
  {
    uint64_t v12 = 1LL;
  }

  else
  {
    double v11 = a4 * 0.5 + -0.6665;
    uint64_t v12 = 0LL;
    if (v11 < a3) {
      double v10 = (a3 - v11) / 1.333;
    }
  }

  if (self->super._panoramaPanningOffsets)
  {
    -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0",  v10 + (double)v12,  0.0,  1.0);
    uint64_t v12 = vcvtmd_s64_f64(v13);
    double v10 = fmod(v13, 1.0);
  }

  if (v10 == 0.0)
  {
    -[MREffectPortfolio _renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:",  v12,  a5,  a6,  a3);
  }

  else
  {
    ValueFromBezierPath((id *)((char *)&self->mZoomCurves[1] + 1), dbl_2AD460, 0.0, 1.0, v10, (uint64_t)&unk_2AD478, 3LL);
    double v15 = v14 * 57.2957795;
    [a5 localAspectRatio];
    float v17 = 2.0 / v16;
    double v18 = (float)(2.0 / v16);
    MRMatrix_Clear((uint64_t)v39);
    float v19 = v15 / 180.0 * v18;
    *(float *)&double v20 = MRMatrix_Translate(v39, 0.0, v19, 0.0);
    objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v39, v38, v20);
    -[MREffectPortfolio _renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:",  0LL,  a5,  a6,  a3);
    MRMatrix_Clear((uint64_t)v37);
    MRMatrix_Translate(v37, 0.0, v17 * 0.5, 0.0);
    float v21 = v15;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v36, v21, 0.0, 0.0);
    MRMatrix_PostMultiply((uint64_t)v37, v36);
    *(float *)&double v22 = MRMatrix_Translate(v37, 0.0, v17 * -0.5, 0.0);
    objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v37, 0, v22);
    if (v15 >= 90.0)
    {
      MRMatrix_Clear((uint64_t)v37);
      *(float *)&double v29 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v37, 0.0, 180.0, 180.0);
      objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v37, 0, v29);
      float v30 = v15 * -0.0174532924 + 3.14159265;
      *(float *)&double v31 = (float)(cosf(v30) * 0.35) + 0.65;
      LODWORD(v32) = 1.0;
      LODWORD(v33) = LODWORD(v31);
      LODWORD(v34) = LODWORD(v31);
      [a5 composeForeColorRed:v35 green:v31 blue:v33 alpha:v34 saveTo:v32];
      uint64_t v28 = 1LL;
    }

    else
    {
      float v23 = v15 * 0.0174532924;
      *(float *)&double v24 = (float)(cosf(v23) * 0.35) + 0.65;
      LODWORD(v25) = 1.0;
      LODWORD(v26) = LODWORD(v24);
      LODWORD(v27) = LODWORD(v24);
      [a5 composeForeColorRed:v35 green:v24 blue:v26 alpha:v27 saveTo:v25];
      uint64_t v28 = 0LL;
    }

    -[MREffectPortfolio _renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderPortraitBreakForPortraitPageAtIndex:atTime:inContext:withArguments:",  v28,  a5,  a6,  a3);
    [a5 restoreForeColor:v35];
    [a5 restoreModelViewMatrix:v38];
  }

- (void)_renderPortraitBreakPageAtIndex:(int64_t)a3 flipped:(BOOL)a4 onePage:(BOOL)a5 atTime:(double)a6 inContext:(id)a7 withArguments:(id)a8
{
  if (a5)
  {
    if (BYTE6(self->mPageCount)) {
      double v13 = &OBJC_IVAR___MREffectPortfolio_mRightPageProvider;
    }
    else {
      double v13 = &OBJC_IVAR___MREffectPortfolio_mLeftPageProvider;
    }
    id v14 = [*(id *)((char *)&self->super.super.isa + *v13) retainedByUserRenderedImageAtTime:a7 inContext:a8 withArguments:a6];
    [v14 aspectRatio];
    *(float *)&double v16 = v15;
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v14,  a7,  0.0,  0.0,  2.0,  2.0,  v16,  0.0,  1.0);
    [v14 releaseByUser];
    if (BYTE6(self->mPageCount))
    {
      int64_t v17 = 1LL;
      goto LABEL_9;
    }
  }

  else
  {
    -[MREffectPortfolio _drawPagesAtTime:inContext:withArguments:]( self,  "_drawPagesAtTime:inContext:withArguments:",  a7,  a8,  a6);
  }

  int64_t v17 = 0LL;
LABEL_9:
  double v18 = ImageKey(v17);
  id v19 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v18),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a7,  a8,  a6);
  double v20 = *(void **)(&self->super._isInInteractiveMode + 1);
  float v21 = (MRCroppingSprite *)[v20 objectForKey:v18];
  if (!v21)
  {
    float v21 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v20 setObject:v21 forKey:v18];
  }

  [v19 aspectRatio];
  double v23 = v22 * 6.0;
  [a7 localAspectRatio];
  double v25 = v23 / v24;
  if (!a3)
  {
    double v26 = 1.0;
LABEL_16:
    [v19 aspectRatio];
    *(float *)&double v28 = v27;
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v21,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v19,  a7,  0.0,  0.0,  v25,  2.0,  v28,  0.0,  v26);
    goto LABEL_17;
  }

  if (a3 != 1)
  {
    double v26 = 3.0;
    goto LABEL_16;
  }

  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( v21,  "renderImage:inContext:atPosition:andSize:",  v19,  a7,  0.0,  0.0,  v25,  2.0);
LABEL_17:
  [v19 releaseByUser];
}

- (void)_renderPortraitBreakForPortraitPageAtIndex:(int64_t)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  id v11 = objc_msgSend( *(id *)((char *)&self->mLeftPageProvider + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6);
  [v11 aspectRatio];
  *(float *)&double v13 = v12;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v11,  a5,  0.0,  0.0,  2.0,  2.0,  v13,  0.0,  1.0);
  [v11 releaseByUser];
  id v14 = ImageKey(BYTE6(self->mPageCount));
  id v15 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v14),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a4);
  double v16 = *(void **)(&self->super._isInInteractiveMode + 1);
  int64_t v17 = (MRCroppingSprite *)[v16 objectForKey:v14];
  if (!v17)
  {
    int64_t v17 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v16 setObject:v17 forKey:v14];
  }

  [v15 aspectRatio];
  double v19 = v18 * 4.0;
  [a5 localAspectRatio];
  double v21 = v20;
  if (a3) {
    double v22 = 3.0;
  }
  else {
    double v22 = 1.0;
  }
  double v23 = v19 / v21;
  [v15 aspectRatio];
  *(float *)&double v25 = v24;
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v17,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v15,  a5,  0.0,  0.0,  v23,  2.0,  v25,  0.0,  v22);
  [v15 releaseByUser];
}

- (void)_drawLandscapeBreakForPortraitAtTime:(double)a3 duration:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  double v10 = 0.0;
  if (a4 * 0.666 + 0.6665 <= a3)
  {
    uint64_t v12 = 2LL;
    goto LABEL_10;
  }

  if (a4 * 0.333 + 0.6665 > a3)
  {
    double v11 = a4 * 0.333 + -0.6665;
    uint64_t v12 = 0LL;
    if (v11 >= a3) {
      goto LABEL_10;
    }
    double v13 = a3 - v11;
    goto LABEL_8;
  }

  double v14 = a4 * 0.666 + -0.6665;
  if (v14 < a3)
  {
    double v13 = a3 - v14;
    uint64_t v12 = 1LL;
LABEL_8:
    double v10 = v13 / 1.333;
    goto LABEL_10;
  }

  uint64_t v12 = 1LL;
LABEL_10:
  if (self->super._panoramaPanningOffsets)
  {
    -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0",  (v10 + (double)v12) * 0.5,  0.0,  1.0);
    double v16 = v15 + v15;
    uint64_t v12 = vcvtmd_s64_f64(v16);
    double v10 = fmod(v16, 1.0);
  }

  if (v10 == 0.0)
  {
    -[MREffectPortfolio _renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:",  v12,  a5,  a6,  a3);
  }

  else
  {
    ValueFromBezierPath((id *)((char *)&self->mZoomCurves[1] + 1), dbl_2AD490, 0.0, 1.0, v10, (uint64_t)&unk_2AD4A8, 3LL);
    double v18 = v17 * 57.2957795;
    MRMatrix_Clear((uint64_t)v38);
    float v19 = v18 / -180.0 + v18 / -180.0;
    *(float *)&double v20 = MRMatrix_Translate(v38, v19, 0.0, 0.0);
    objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v38, v37, v20);
    -[MREffectPortfolio _renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:",  0LL,  a5,  a6,  a3);
    MRMatrix_Clear((uint64_t)v36);
    MRMatrix_Translate(v36, -1.0, 0.0, 0.0);
    float v21 = v18;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v35, 0.0, v21, 0.0);
    MRMatrix_PostMultiply((uint64_t)v36, v35);
    *(float *)&double v22 = MRMatrix_Translate(v36, 1.0, 0.0, 0.0);
    objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v36, 0, v22);
    if (v18 >= 90.0)
    {
      MRMatrix_Clear((uint64_t)v36);
      *(float *)&double v28 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v36, 180.0, 0.0, 180.0);
      objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v36, 0, v28);
      float v29 = v18 * -0.0174532924 + 3.14159265;
      *(float *)&double v30 = (float)(cosf(v29) * 0.35) + 0.65;
      LODWORD(v31) = 1.0;
      LODWORD(v32) = LODWORD(v30);
      LODWORD(v33) = LODWORD(v30);
      [a5 composeForeColorRed:v34 green:v30 blue:v32 alpha:v33 saveTo:v31];
      ++v12;
    }

    else
    {
      float v23 = v18 * 0.0174532924;
      *(float *)&double v24 = (float)(cosf(v23) * 0.35) + 0.65;
      LODWORD(v25) = 1.0;
      LODWORD(v26) = LODWORD(v24);
      LODWORD(v27) = LODWORD(v24);
      [a5 composeForeColorRed:v34 green:v24 blue:v26 alpha:v27 saveTo:v25];
    }

    -[MREffectPortfolio _renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:]( self,  "_renderLandscapeBreakPageAtIndex:atTime:inContext:withArguments:",  v12,  a5,  a6,  a3);
    [a5 restoreForeColor:v34];
    [a5 restoreModelViewMatrix:v37];
  }

- (void)_renderLandscapeBreakPageAtIndex:(int64_t)a3 atTime:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  id v11 = objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6);
  [v11 aspectRatio];
  *(float *)&double v13 = v12;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v11,  a5,  0.0,  0.0,  2.0,  2.0,  v13,  0.0,  1.0);
  [v11 releaseByUser];
  double v14 = ImageKey(0LL);
  id v15 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v14),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a4);
  double v16 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v17 = (MRCroppingSprite *)[v16 objectForKey:v14];
  if (!v17)
  {
    double v17 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v16 setObject:v17 forKey:v14];
  }

  [v15 aspectRatio];
  double v19 = v18;
  [a5 localAspectRatio];
  double v21 = 3.0;
  if (a3 == 1) {
    double v21 = 2.0;
  }
  if (a3) {
    double v22 = v21;
  }
  else {
    double v22 = 1.0;
  }
  double v23 = 6.0 / v19 * v20;
  [v15 aspectRatio];
  *(float *)&double v25 = v24;
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v17,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v15,  a5,  0.0,  0.0,  2.0,  v23,  v25,  v22,  0.0);
  [v15 releaseByUser];
}

- (void)_drawIndex:(int64_t)a3 time:(double)a4 context:(id)a5 arguments:(id)a6 size:(CGSize)a7 position:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a7.height;
  double width = a7.width;
  double v16 = ImageKey(a3);
  id v17 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v16),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a5,  a6,  a4);
  double v18 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v19 = (MRCroppingSprite *)[v18 objectForKey:v16];
  if (!v19)
  {
    double v19 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v18 setObject:v19 forKey:v16];
  }

  LODWORD(v20) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v19,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v17,  a5,  x,  y,  width,  height,  v20);
  [v17 releaseByUser];
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

- (BOOL)getVerticesCoordinates:(MREffectPortfolio *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v7 = mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  if (BYTE1(self->mPageCount))
  {
    double v8 = v7 * 0.5;
    if (!a4 && v8 > a3 || (BOOL result = 0, a4) && v8 <= a3)
    {
      if (a5)
      {
        double v10 = v7 * 0.5 + -0.829999983;
LABEL_15:
        *a5 = v10;
        goto LABEL_16;
      }

      goto LABEL_16;
    }
  }

  else
  {
    if (!BYTE2(self->mPageCount))
    {
      if (!BYTE5(self->mPageCount)) {
        return 0;
      }
      double v12 = self->super.mDefaultMainDuration * 0.25 + 0.414999992;
      if (a4 || v12 <= a3)
      {
        BOOL result = 0;
        if (!a4 || v12 > a3) {
          return result;
        }
        if (a5) {
          *a5 = v12;
        }
      }

      else if (a5)
      {
        *a5 = mPhaseInDuration;
      }

      goto LABEL_16;
    }

    double v11 = v7 * 0.5 + 0.829999983;
    if (!a4 && v11 > a3 || (BOOL result = 0, a4) && v11 <= a3)
    {
      if (a5)
      {
        double v10 = v7 * 0.5;
        goto LABEL_15;
      }

- (double)interestingTimeForTime:(double)a3
{
  double v3 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  if (!BYTE1(self->mPageCount) || (double v4 = v3 * 0.5, v3 * 0.5 > a3))
  {
    if (!BYTE2(self->mPageCount) || (double v4 = v3 * 0.5 + 0.829999983, v4 > a3))
    {
      double v4 = self->super.mDefaultMainDuration * 0.25 + 0.414999992;
      if (v4 > a3 || BYTE5(self->mPageCount) == 0) {
        return self->super.mPhaseInDuration;
      }
    }
  }

  return v4;
}

- (double)interestingTimeForElement:(id)a3
{
  double v5 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  return self->super.mPhaseInDuration;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  double v9 = self->super.mPhaseInDuration + self->super.mMainDuration;
  double v10 = v9 + self->super.mPhaseOutDuration;
  if (BYTE1(self->mPageCount))
  {
    if (v10 * 0.5 > a6)
    {
      if (!a3) {
        goto LABEL_6;
      }
      double v11 = v10 * 0.5 + -0.829999983;
      goto LABEL_5;
    }

    goto LABEL_18;
  }

  if (BYTE2(self->mPageCount))
  {
    double mPhaseOutDuration = 0.829999983;
    if (v10 * 0.5 + 0.829999983 > a6)
    {
      if (a3) {
        *a3 = -(a6 - v10 * 0.5);
      }
      if (a4) {
        *a4 = 0.0;
      }
      if (a5) {
        goto LABEL_24;
      }
      return;
    }

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = objc_msgSend(*(id *)((char *)&self->mPageCreaseProvider + 1), "objectEnumerator", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) beginLiveUpdate];
        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  [*(id *)((char *)&self->mSprites + 1) beginLiveUpdate];
  [*(id *)((char *)&self->mLeftPageProvider + 1) beginLiveUpdate];
  [*(id *)((char *)&self->mRightPageProvider + 1) beginLiveUpdate];
  self->mRightZoom = 1;
}

- (void)endMorphing
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = objc_msgSend(*(id *)((char *)&self->mPageCreaseProvider + 1), "objectEnumerator", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) endLiveUpdate];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  [*(id *)((char *)&self->mSprites + 1) endLiveUpdate];
  [*(id *)((char *)&self->mLeftPageProvider + 1) endLiveUpdate];
  [*(id *)((char *)&self->mRightPageProvider + 1) endLiveUpdate];
}

- (void)_updateSizes:(double)a3
{
  uint64_t v5 = 16LL;
  NSUInteger v50 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v6 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"leftCount"),  "integerValue");
  else {
    uint64_t v7 = (uint64_t)v6;
  }
  uint64_t v54 = v7;
  if (![*(id *)((char *)&self->mFrameProviders + 1) count])
  {
    id v41 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
    [v41 imageAspectRatio];
    double v43 = v42;
    if (self->mLeftZoom && [v41 canPlay])
    {
      p_mPixelSize = &self->super.mPixelSize;
      if (v43 < 1.0)
      {
LABEL_59:
        double height = p_mPixelSize->height;
LABEL_60:
        double width = v43 * height;
LABEL_86:
        [v41 setImageSizeScript:0];
        objc_msgSend(v41, "setDefaultSize:", width, height);
        return;
      }

      double width = p_mPixelSize->width;
    }

    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      if (v43 >= 0.5 && v43 <= 2.0)
      {
        if (a3 < 1.0 && v43 < 1.0 || a3 >= 1.0 && v43 >= 1.0)
        {
          double width = self->super.mPixelSize.width;
          double height = self->super.mPixelSize.height;
          goto LABEL_86;
        }

        if (a3 >= 1.0 || v43 < 1.0)
        {
          if (a3 <= 1.0 || v43 >= 1.0) {
            goto LABEL_86;
          }
          p_mPixelSize = &self->super.mPixelSize;
          goto LABEL_59;
        }

        double width = self->super.mPixelSize.width;
      }

      else
      {
        if (a3 <= 1.0) {
          goto LABEL_79;
        }
        if (v43 > 2.0)
        {
          double v48 = self->super.mPixelSize.height;
          double width = v43 * v48 * 0.75;
          double height = v48 * 0.75;
          goto LABEL_86;
        }

        if (v43 >= 0.5)
        {
LABEL_79:
          if (a3 >= 1.0) {
            goto LABEL_86;
          }
          if (v43 < 1.0)
          {
            double height = self->super.mPixelSize.height;
            if (v43 * 4.0 / a3 < 2.0) {
              double height = height + height;
            }
            goto LABEL_60;
          }

          double width = self->super.mPixelSize.width;
          if (6.0 / v43 * a3 < 1.75) {
            double width = width * 3.0;
          }
        }

        else
        {
          double width = self->super.mPixelSize.width * 0.5;
        }
      }
    }

    double height = width / v43;
    goto LABEL_86;
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  id v8 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (!v8) {
    return;
  }
  id v9 = v8;
  uint64_t v10 = 0LL;
  uint64_t v53 = *(void *)v56;
  NSUInteger v49 = v50 - 1;
  do
  {
    __int128 v11 = 0LL;
    float v51 = (void *)(v49 - v10);
    do
    {
      if (*(void *)v56 != v53) {
        objc_enumerationMutation(obj);
      }
      __int128 v12 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v11);
      __int128 v13 = (double *)objc_msgSend((id)qword_2B04C0, "objectForKey:", v12, v49);
      uint64_t v14 = v5;
      id v15 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v11 + v10));
      [v15 setImageSizeScript:0];
      -[MREffectPortfolio _rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:]( self,  "_rectForSlideAtIndex:frame:leftCount:movie:localAspectRatio:",  (char *)v11 + v10,  v12,  v54,  [v15 canPlay],  a3);
      double v17 = v16;
      double v19 = v18;
      if (!NSStringHasPrefix(v12, "NoBorder")
        && !NSStringHasPrefix(v12, "Full")
        && !NSStringHasPrefix(v12, "RoundedBorder"))
      {
        objc_msgSend( objc_msgSend(*(id *)((char *)&self->mPageCreaseProvider + 1), "objectForKey:", v12),  "setDefaultSize:",  v17 * 0.5 * self->super.mPixelSize.width,  v19 * 0.5 * self->super.mPixelSize.height);
        double v17 = v17 * v13[7];
        double v19 = v19 * v13[8];
      }

      if (BYTE1(self->mPageCount)) {
        BOOL v20 = (char *)v11 + v10 == 0LL;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20 || (BYTE2(self->mPageCount) ? (BOOL v21 = v51 == v11) : (BOOL v21 = 0), v21))
      {
        [v15 imageAspectRatio];
        if (a3 < 1.0 && v28 >= 1.0)
        {
LABEL_30:
          double v26 = self->super.mPixelSize.width;
LABEL_31:
          [v15 imageAspectRatio];
          double v27 = v26 / v29;
          goto LABEL_53;
        }

        [v15 imageAspectRatio];
        if (a3 < 1.0 && v30 > 2.0)
        {
          CGFloat v31 = self->super.mPixelSize.height * 0.333000004;
          [v15 imageAspectRatio];
          double v26 = v31 * v32;
          double v27 = self->super.mPixelSize.height * 0.333000004;
          goto LABEL_53;
        }

        double v33 = &self->super.mPixelSize;
        goto LABEL_36;
      }

      uint64_t v22 = *(void *)(&self->mIsLoaded + 1);
      if (a3 > 1.0 && v22 == 1)
      {
        [v15 imageAspectRatio];
        if (v23 < 1.0 && v50 == 1)
        {
          double v24 = self->super.mPixelSize.height;
LABEL_27:
          [v15 imageAspectRatio];
          double v26 = v24 * v25;
          double v27 = self->super.mPixelSize.height;
          goto LABEL_53;
        }

        uint64_t v22 = *(void *)(&self->mIsLoaded + 1);
      }

      if (a3 > 1.0 && v22 == 1)
      {
        [v15 imageAspectRatio];
        if (v34 >= 1.0 && v50 == 1)
        {
          double v33 = &self->super.mPixelSize;
LABEL_36:
          double v26 = v33->width;
          double v27 = v33->height;
          goto LABEL_53;
        }
      }

      if (a3 >= 1.0) {
        goto LABEL_52;
      }
      [v15 imageAspectRatio];
      double v36 = v35;
      [v15 imageAspectRatio];
      if (v36 > 2.0)
      {
        double v26 = self->super.mPixelSize.width;
        if (6.0 / v37 * a3 < 1.75) {
          double v26 = v26 * 3.0;
        }
        goto LABEL_31;
      }

      if (v37 >= 0.5)
      {
        if (self->mIsBreakXL)
        {
          [v15 imageAspectRatio];
          if (v40 >= 1.0) {
            goto LABEL_30;
          }
        }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  id v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  id v9 = *(void **)&self->mIsSlideOnly;
  if (v7)
  {
    if (!v9) {
      *(void *)&self->mIsSlideOnldouble y = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)&self->mIsSlideOnly,  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)&self->mIsSlideOnly,  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)&self->mIsSlideOnly setTruncate:1];
    [*(id *)&self->mIsSlideOnly setMaxNumberOfLines:3];
    objc_msgSend( *(id *)&self->mIsSlideOnly,  "setDefinedSize:",  self->super.mPixelSize.width * 0.5 * 0.899999976,  self->super.mPixelSize.height * 0.5);
    [*(id *)&self->mIsSlideOnly setText:v7];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)&self->mIsSlideOnly, "setScale:");
    [*(id *)&self->mIsSlideOnly sizeOfText];
    [*(id *)&self->mIsSlideOnly setRenderAtDefinedSize:1];
    [*(id *)&self->mIsSlideOnly definedSize];
    objc_msgSend(*(id *)&self->mIsSlideOnly, "setDefinedSize:");
    uint64_t v10 = (CGContext *)[*(id *)&self->mIsSlideOnly retainedContext];
    if (v10)
    {
      __int128 v11 = v10;
      __int128 v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba Portfolio Text");
      CGContextRelease(v11);
    }
  }

  else
  {
    if (v9)
    {

      *(void *)&self->mIsSlideOnldouble y = 0LL;
    }

    [*(id *)(&self->super._isInInteractiveMode + 1) removeObjectForKey:@"text0"];
  }

- (void)_unload
{
  id v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  id v4 = *(void **)&self->mIsSlideOnly;
  if (v4)
  {
    [v4 cleanup];

    *(void *)&self->mIsSlideOnldouble y = 0LL;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = *(MRImageProvider **)((char *)&self->mPageCreaseProvider + 1);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)((char *)&self->mPageCreaseProvider + 1) objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)];
        [v10 unload];
        [v10 cleanup];
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  [*(id *)((char *)&self->mPageCreaseProvider + 1) removeAllObjects];
  [*(id *)((char *)&self->mSprites + 1) cleanup];

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->mLeftPageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mLeftPageProvider + 1) = 0LL;
  [*(id *)((char *)&self->mRightPageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mRightPageProvider + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = 0LL;
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];
  BYTE1(self->mFrameList) = 0;
  self->mRightZoom = 0;
  self->mIsBreakXL = 0;
  BYTE3(self->mPageCount) = 0;
  BYTE4(self->mPageCount) = 0;
  BYTE5(self->mPageCount) = 0;
  HIBYTE(self->mPageCount) = 0;
  self->mLeftZoom = 0;
}

@end