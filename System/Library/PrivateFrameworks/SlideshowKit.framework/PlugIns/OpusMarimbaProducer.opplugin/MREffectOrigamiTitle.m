@interface MREffectOrigamiTitle
- (BOOL)getVerticesCoordinates:(MREffectOrigamiTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectOrigamiTitle)init;
- (id)_retainedByUserBackColorImageInContext:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_cleanupSwingTimings;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setupSwingTimings;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderBreakImage:(id)a3 atProgress:(double)a4 withKey:(id)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9;
- (void)renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)renderFallImage:(id)a3 atProgress:(double)a4 strength:(double)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9 :(CGPoint *)a10 :(CGPoint)a11;
- (void)renderStillImage:(id)a3 withKey:(id)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderTextEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderTitleEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectOrigamiTitle

- (MREffectOrigamiTitle)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectOrigamiTitle;
  v2 = -[MREffectOrigamiTitle init](&v4, "init");
  if (v2)
  {
    *(void *)(v2 + 193) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    v5[0] = xmmword_1F7F30;
    v5[1] = xmmword_1F7D70;
    *(void *)(v2 + 281) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v5);
    [v2 _setupSwingTimings];
    *(_DWORD *)(v2 + 305) = -1082130432;
    *(void *)(v2 + 321) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return (MREffectOrigamiTitle *)v2;
}

- (void)_cleanup
{
  *(void *)((char *)&self->mBackColorForImage[2] + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mWordIndexForGlyph + 1) = 0LL;
  *(void *)&self->mLineWordCounts[1] = 0LL;

  *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) = 0LL;
  *(NSArray **)((char *)&self->mPatchworkAtEnd + 1) = 0LL;

  *(int64_t *)((char *)&self->mWordCount + 1) = 0LL;
  -[MREffectOrigamiTitle _cleanupSwingTimings](self, "_cleanupSwingTimings");
}

- (void)_setupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = (MRCAMLBezierData *)-[MROrigamiAnimationPath initWithSwingType:]( objc_alloc(&OBJC_CLASS___MROrigamiAnimationPath),  "initWithSwingType:",  1LL);
}

- (void)_cleanupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = 0LL;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  id v5 = -[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"LTitleP");
  BOOL v7 = -[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"Text") == (id)0x7FFFFFFFFFFFFFFFLL
    && v5 == (id)0x7FFFFFFFFFFFFFFFLL;
  if (v4 && [v4 length])
  {
    id v8 = [*(id *)((char *)&self->mText0Sprite + 1) count];
    if (v8) {
      char v9 = 1;
    }
    else {
      char v9 = v7;
    }
    if ((v9 & 1) != 0)
    {
      if (!v8) {
        return (char)v8;
      }
    }

    else if (!*(NSMutableArray **)((char *)&self->mText0Offsets + 1))
    {
      LOBYTE(v8) = 0;
      return (char)v8;
    }
  }

  LOBYTE(v8) = !self->super.mNeedsToUpdateTexts;
  return (char)v8;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!-[MRLayer isActivated](self->super.mEffectLayer, "isActivated")) {
    [*(id *)((char *)&self->mBackColorForImage[2] + 1) removeAllObjects];
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectOrigamiTitle;
  return -[MREffect prerenderForTime:inContext:withArguments:]( &v10,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.0 && self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration > a3)
  {
    if (-[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"Title") == (id)0x7FFFFFFFFFFFFFFFLL) {
      -[MREffectOrigamiTitle renderTextEffectAtTime:inContext:withArguments:]( self,  "renderTextEffectAtTime:inContext:withArguments:",  a4,  a5,  a3);
    }
    else {
      -[MREffectOrigamiTitle renderTitleEffectAtTime:inContext:withArguments:]( self,  "renderTitleEffectAtTime:inContext:withArguments:",  a4,  a5,  a3);
    }
  }

- (void)renderTitleEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v10 = v9;
  [a4 blend:2];
  v129 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"back",  @"direction");
  id v11 = -[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"LTitleP");
  [a4 localAspectRatio];
  double v128 = 1.0 / v12;
  id v137 = a4;
  if (v10 >= 5.0 && v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)((char *)&self->mText0Renderer + 1) reset];
    goto LABEL_49;
  }

  __asm { FMOV            V2.2D, #2.0 }

  float64x2_t v127 = vmulq_f64(*(float64x2_t *)((char *)&self->mSprites + 1), vdivq_f64(_Q2, (float64x2_t)self->super.mPixelSize));
  double y = CGPointZero.y;
  double v135 = y;
  double x = CGPointZero.x;
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v17 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"1");
    double v18 = vmlad_n_f64(-0.23333333, 0.5, v127.f64[0]);
    if (v17) {
      double v18 = 0.0;
    }
    double x = v18;
    double v19 = -0.645;
    if (!v17) {
      double v19 = 0.0;
    }
    double v135 = v19;
  }

  if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
    || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
  {
    id v124 = v11;
    double v126 = v10;
    CGPoint v159 = CGPointZero;
    uint64_t v21 = *(void *)((char *)&self->mImageSize.height + 1);
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    id obj = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
    id v138 = [obj countByEnumeratingWithState:&v143 objects:v170 count:16];
    if (!v138) {
      goto LABEL_37;
    }
    unsigned int v22 = 0;
    unsigned int v23 = 0;
    LODWORD(v24) = 0;
    float v25 = v10 / ((double)v21 * 0.3);
    float v139 = v25;
    uint64_t v133 = *(void *)v144;
    float v26 = 0.0;
    double v132 = CGPointZero.x;
    double v131 = y;
    id v134 = a5;
    while (1)
    {
      for (i = 0LL; i != v138; i = (char *)i + 1)
      {
        if (*(void *)v144 != v133) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v143 + 1) + 8LL * (void)i);
        int64_t v29 = (int64_t)objc_msgSend( objc_msgSend(*(id *)&self->mLineWordCounts[1], "objectAtIndex:", v24),  "integerValue");
        v140 = (char *)v29;
        if ((v23 & 1) != 0)
        {
          uint64_t v31 = *((unsigned __int8 *)&self->mText0Image + v23 + 1);
          uint64_t v30 = v22 + v31 + ~v29;
        }

        else
        {
          uint64_t v30 = v29 - v22;
          uint64_t v31 = *((unsigned __int8 *)&self->mText0Image + v23 + 1);
        }

        uint64_t v32 = v31 - 1;
        [v28 width];
        float v34 = (v33 + v33) / self->super.mPixelSize.width;
        [v28 height];
        float v36 = (v35 + v35) / self->super.mPixelSize.width;
        double v37 = v139
            + ((double)(v30 & 1) * 0.2 + (double)(v30 >> 1) * 0.1 + (double)v23 * 0.1)
        float v38 = v37;
        if (v30 == v32) {
          float v26 = v37;
        }
        objc_msgSend( objc_msgSend(*(id *)((char *)&self->mText0Images + 1), "objectAtIndex:", v24),  "CGPointValue");
        double width = self->super.mPixelSize.width;
        *(float *)&double v39 = (v39 + v39) / width;
        *(float *)&double v41 = (v41 + v41) / width;
        double v42 = x + *(float *)&v39;
        double v43 = *(float *)&v41;
        a4 = v137;
        [v137 localAspectRatio];
        double v45 = v135 / v44 + v43;
        if (v38 >= 1.0)
        {
          a5 = v134;
          -[MREffectOrigamiTitle renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:",  v28,  @"text0",  v137,  v134,  0LL,  v42,  v45,  v34,  v36);
        }

        else
        {
          if (v30 == v32) {
            v46 = &v159;
          }
          else {
            v46 = 0LL;
          }
          a5 = v134;
          -[MREffectOrigamiTitle renderFallImage:atProgress:strength:inContext:withArguments:inRect:withAttributes:::]( self,  "renderFallImage:atProgress:strength:inContext:withArguments:inRect:withAttributes:::",  v28,  v137,  v134,  v129,  v46,  v38,  (double)v23 * 0.1 + 0.3,  v42,  v45,  v34,  v36,  v132,  v131);
        }

        unint64_t v24 = (v24 + 1);
        if ((unint64_t)[*(id *)&self->mLineWordCounts[1] count] <= v24)
        {
          v47 = v140 + 1;
        }

        else
        {
          v47 = (char *)objc_msgSend( objc_msgSend(*(id *)&self->mLineWordCounts[1], "objectAtIndex:", v24),  "integerValue");
          if (v47 == v140) {
            continue;
          }
        }

        uint64_t v48 = v22 + *((unsigned __int8 *)&self->mText0Image + v23 + 1);
        if ((uint64_t)v47 >= v48)
        {
          do
          {
            unsigned int v22 = v48;
            uint64_t v48 = v48 + *((unsigned __int8 *)&self->mText0Image + ++v23 + 1);
          }

          while ((uint64_t)v47 >= v48);
          double v131 = v159.y;
          double v132 = v159.x;
          float v139 = v26;
        }
      }

      id v138 = [obj countByEnumeratingWithState:&v143 objects:v170 count:16];
      if (!v138)
      {
LABEL_37:
        double v10 = v126;
        id v11 = v124;
        break;
      }
    }
  }

  LODWORD(v20) = 0;
  objc_msgSend( *(id *)((char *)&self->mText0Renderer + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  x,  v135,  *(_OWORD *)&v127,  v20);
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v49 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"1");
    if (v49) {
      double v50 = v128 * -0.3333333;
    }
    else {
      double v50 = -v128;
    }
    if (v49) {
      double v51 = 2.0;
    }
    else {
      double v51 = 0.6666667;
    }
    double v52 = 1.3333333;
    if (!v49) {
      double v52 = 2.0;
    }
    double v53 = v128 * v52;
    id v54 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    id v55 = a4;
    v56 = v54;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    if (mPhaseInDuration <= a3) {
      -[MREffectOrigamiTitle renderBreakImage:atProgress:withKey:inContext:withArguments:inRect:withAttributes:]( self,  "renderBreakImage:atProgress:withKey:inContext:withArguments:inRect:withAttributes:",  v54,  @"image0",  v55,  a5,  0LL,  (a3 - mPhaseInDuration) / self->super.mMainDuration,  -1.0,  v50,  v51,  v53);
    }
    else {
      -[MREffectOrigamiTitle renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  v54,  v55,  a5,  v129,  0LL,  a3,  -1.0,  v50,  v51,  v53,  CGPointZero.x,  y);
    }
    goto LABEL_98;
  }

- (void)renderTextEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double width = 1.0;
  double v11 = 1.0 / v9;
  objc_msgSend( *(id *)((char *)&self->mText0Offsets + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  double v13 = v12;
  double v26 = v14;
  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-Text"))
  {
    int v15 = 0;
    double y = -v11;
    double height = v11 + v11;
    double v18 = 0.0;
    double v19 = -0.5;
    double x = 0.0;
    goto LABEL_10;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LText1")
    || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LText1"))
  {
    int v15 = 0;
    double y = v11 * -0.5;
    double height = v11 * 1.5;
    double v19 = v13 * 0.5 + -0.85;
    double width = 2.0;
    double x = -1.0;
    double v18 = -0.75;
    goto LABEL_10;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LText2")
    || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LText2"))
  {
    int v15 = 0;
    double y = -v11;
    double height = v11 + v11;
    double v19 = v13 * -0.5 + -0.1;
    double x = 0.0;
LABEL_9:
    double v18 = -0.3333333;
    goto LABEL_10;
  }

  if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTextP1")
    || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LTextP1"))
  {
    double y = v11 * -0.3333333;
    double height = v11 * 1.3333333;
    double v19 = v13 * 0.5 + -0.85;
    double width = 2.0;
    double x = -1.0;
    int v15 = 1;
    double v18 = -0.6666667;
  }

  else
  {
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTextP2")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LTextP2"))
    {
      double y = -v11;
      double height = v11 + v11;
      double v19 = v13 * 0.5 + -0.23333333;
      double x = -1.0;
      int v15 = 1;
      double width = 0.6666667;
      goto LABEL_9;
    }

    int v15 = 0;
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v19 = CGPointZero.x;
    double v18 = CGPointZero.y;
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((objc_msgSend( *(id *)((char *)&self->mText0Renderer + 1),  "hitAtPoint:withInverseMatrix:localPoint:") & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    double v11 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v12) {
      return 0LL;
    }
    id v13 = v12;
    double v10 = 0LL;
    uint64_t v14 = *(void *)v22;
LABEL_5:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = [*(id *)((char *)&self->mPatchworkAtEnd + 1) objectForKey:v16];
      if (v10) {
        break;
      }
      if (a5) {
        goto LABEL_18;
      }
LABEL_19:
      double v10 = v16;
LABEL_20:
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v13) {
          return v10;
        }
        goto LABEL_5;
      }
    }

    if ([v16 compare:v10] == (id)-1)
    {
      double v10 = v16;
      BOOL v18 = a5 == 0LL;
    }

    else
    {
      BOOL v18 = 1;
    }

    if (v18) {
      goto LABEL_20;
    }
LABEL_18:
    *a5 = v20;
    goto LABEL_19;
  }

  return @"text0";
}

- (BOOL)getVerticesCoordinates:(MREffectOrigamiTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  if ([a5 isEqualToString:@"text0"])
  {
    id v9 = *(MRTextRenderer **)((char *)&self->mText0Renderer + 1);
LABEL_4:
    LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:a4];
    return (char)v9;
  }

  id v9 = [*(id *)((char *)&self->mPatchworkAtEnd + 1) objectForKey:a5];
  if (v9) {
    goto LABEL_4;
  }
  return (char)v9;
}

- (void)renderFallImage:(id)a3 atProgress:(double)a4 strength:(double)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9 :(CGPoint *)a10 :(CGPoint)a11
{
  double y = a11.y;
  double x = a11.x;
  float v17 = a8.origin.x;
  float v18 = a8.origin.y;
  float width = a8.size.width;
  float height = a8.size.height;
  if (a4 <= 0.0)
  {
    float v23 = -3.1416;
  }

  else
  {
    double v21 = a4 * 18.8495559;
    float v22 = a4 * 18.8495559;
    float v23 = a5 * 6.28318531 * sinf(v22) / v21;
  }

  if (v23 < -3.14159265) {
    float v23 = 3.1416;
  }
  if (v23 > 3.14159265) {
    float v23 = 3.1416;
  }
  __float2 v24 = __sincosf_stret(v23);
  unsigned int v25 = objc_msgSend( objc_msgSend(a9, "objectForKey:", @"direction"),  "isEqualToString:",  @"back");
  double v26 = 1.0 - v24.__cosval;
  float v27 = x + v18 + v26 * height;
  v37[0] = v17;
  v37[1] = v27;
  float v28 = -height;
  if (!v25) {
    float v28 = height;
  }
  double v29 = (float)(v28 * v24.__sinval);
  float v30 = y + v29;
  v37[2] = v30;
  v37[3] = v17;
  float v31 = x + (float)(v18 + height);
  float v32 = y;
  v37[4] = v31;
  v37[5] = v32;
  v37[6] = v17 + width;
  v37[7] = x + v18 + v26 * height;
  v37[8] = v30;
  v37[9] = v17 + width;
  v37[10] = v31;
  v37[11] = v32;
  if (a10)
  {
    a10->double x = v26 * height;
    a10->double y = v29;
  }

  HIDWORD(v33) = -1082130432;
  v36[0] = xmmword_1F7FFC;
  v36[1] = unk_1F800C;
  *(float *)&double v33 = width / height;
  [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v34 state:v33];
  [a6 cull:2];
  SetLightingColors(v35, v37, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:v37];
  [a6 setTextureCoordinatesPointer:v36 onTextureUnit:0];
  [a6 setColorsPointer:v35];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  [a6 cull:0];
  [a3 unsetOnContext:a6 onTextureUnit:0 state:&v34];
}

- (void)renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  float v16 = a7.origin.x;
  float v17 = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  *(float *)&a4 = a4;
  objc_msgSend(*(id *)((char *)&self->mBreakCurve + 1), "valueAtTime:", a3, a5, a6, a4);
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
  v41[0] = v16;
  v41[1] = v26;
  float v27 = -height;
  if (!v25) {
    float v27 = height;
  }
  double v28 = (float)(v22 * v27);
  float v29 = y + v28;
  v41[2] = v29;
  v41[3] = v16;
  float v30 = x + (float)(v17 + height);
  float v31 = y;
  v41[4] = v30;
  v41[5] = v31;
  v41[6] = v16 + width;
  v41[7] = x + (float)(v17 + (float)((float)(1.0 - cosval) * height));
  v41[8] = v29;
  v41[9] = v16 + width;
  v41[10] = v30;
  v41[11] = v31;
  if (a9)
  {
    a9->double x = (float)((float)(1.0 - cosval) * height);
    a9->double y = v28;
  }

  v40[0] = xmmword_1F7FFC;
  v40[1] = unk_1F800C;
  [a3 setUsesBackgroundColorAsBorderColor:1];
  LODWORD(v32) = 0;
  LODWORD(v33) = 0;
  LODWORD(v34) = 0;
  LODWORD(v35) = 1.0;
  [a5 setBackColorRed:v39 green:v32 blue:v33 alpha:v34 saveTo:v35];
  *(float *)&double v36 = width / height;
  [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v37 state:v36];
  [a5 cull:2];
  SetLightingColors(v38, v41, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:v41];
  [a5 setTextureCoordinatesPointer:v40 onTextureUnit:0];
  [a5 setColorsPointer:v38];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a5 cull:0];
  [a3 unsetOnContext:a5 onTextureUnit:0 state:&v37];
  [a5 setBackColor:v39 saveTo:0];
}

- (void)renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  double height = a7.size.height;
  double width = a7.size.width;
  double v17 = a7.origin.y;
  double v18 = a7.origin.x;
  [a3 aspectRatio];
  double v23 = v22;
  if (v22 >= 0.5 && v22 <= 2.0) {
    goto LABEL_8;
  }
  double v25 = width / height / v22;
  if (v23 >= 1.0) {
    double v25 = v23 / (width / height);
  }
  if (v25 < 1.1)
  {
LABEL_8:
    -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::]( self,  "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::",  a3,  a5,  a6,  0LL,  a9,  a4,  v18,  v17,  width,  height,  x,  y);
  }

  else
  {
    double v76 = y;
    unsigned int v26 = objc_msgSend( objc_msgSend( objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"breakInformation"),  "objectForKey:",  @"image0"),  "objectForKey:",  @"panEndDirection"),  "intValue");
    float v27 = width;
    float v28 = height;
    if (v27 >= v28) {
      float v29 = height;
    }
    else {
      float v29 = v27;
    }
    double v81 = v29;
    float v77 = v27;
    if (v23 <= 1.0)
    {
      [a3 height];
      double v36 = v35;
      [a3 width];
      double v33 = v36 * v27 - v37 * v28;
      [a3 width];
    }

    else
    {
      [a3 width];
      double v31 = v30;
      [a3 height];
      double v33 = v31 * v28 - v32 * v27;
      [a3 height];
    }

    float v38 = v18;
    float v39 = v17;
    float v78 = v39;
    double v40 = v33 / (v34 * v81);
    float v41 = v40;
    unint64_t v42 = vcvtps_u32_f32(v41);
    if (v40 <= 0.0) {
      unint64_t v43 = 0LL;
    }
    else {
      unint64_t v43 = v42;
    }
    [a3 scale];
    double v82 = v44;
    [a3 centerX];
    double v80 = v45;
    [a3 centerY];
    double v79 = v46;
    [a3 setScale:1.0];
    [a3 setCenterX:0.0];
    [a3 setCenterY:0.0];
    if (v23 <= 1.0)
    {
      float v49 = v77;
      if (v40 <= 0.0) {
        double v57 = v28;
      }
      else {
        double v57 = v77 / v23;
      }
      double v55 = v76;
      double v56 = x;
      double v47 = 1.0 / v57;
      if (v43)
      {
        double v58 = (v57 - v28) / (v57 * (double)v43);
        double v59 = v58 + v58;
        double v60 = 0.0;
        if (v26 == -1) {
          double v60 = (double)v43;
        }
        double v61 = v59 * v60 + -1.0;
      }

      else
      {
        double v61 = -1.0;
      }

      float v62 = v61 + (float)(v28 + v28) * v47;
      if (!v43) {
        float v62 = 1.0;
      }
      float v63 = v61;
      float v87 = -1.0;
      float v88 = v63;
      float v89 = -1.0;
      int v90 = LODWORD(v62);
      int v91 = 1065353216;
      float v92 = v63;
      int v93 = 1065353216;
      int v94 = LODWORD(v62);
      double v54 = v47 * v77;
    }

    else
    {
      double v47 = v28;
      double v48 = v23 * v28;
      float v49 = v77;
      if (v40 <= 0.0) {
        double v48 = v77;
      }
      double v50 = (double)v43;
      if (v26 != -1) {
        double v50 = 0.0;
      }
      double v51 = v50 * ((v48 - v77) / (v48 * (double)v43)) * 2.0 + -1.0;
      if (!v43) {
        double v51 = -1.0;
      }
      float v52 = v51 + (float)(v77 + v77) * (1.0 / v48);
      if (!v43) {
        float v52 = 1.0;
      }
      float v53 = v51;
      float v87 = v53;
      float v88 = -1.0;
      float v89 = v53;
      int v90 = 1065353216;
      int v91 = LODWORD(v52);
      float v92 = -1.0;
      int v93 = LODWORD(v52);
      int v94 = 1065353216;
      double v54 = v48 / v47;
      double v55 = v76;
      double v56 = x;
    }

    *(float *)&double v47 = a4;
    [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:v47];
    __float2 v67 = __sincosf_stret(3.1416 - v64);
    float cosval = v67.__cosval;
    LODWORD(v65) = *(void *)&v67;
    unsigned int v68 = objc_msgSend( objc_msgSend(a8, "objectForKey:", @"direction"),  "isEqualToString:",  @"back");
    float v70 = v56 + (float)(v78 + (float)((float)(1.0 - cosval) * v28));
    v86[0] = v38;
    v86[1] = v70;
    float v71 = -v28;
    if (!v68) {
      float v71 = v28;
    }
    double v72 = (float)(v65 * v71);
    float v73 = v55 + v72;
    v86[2] = v73;
    v86[3] = v38;
    float v74 = v56 + (float)(v78 + v28);
    float v75 = v55;
    v86[4] = v74;
    v86[5] = v75;
    v86[6] = v38 + v49;
    v86[7] = v56 + (float)(v78 + (float)((float)(1.0 - cosval) * v28));
    v86[8] = v73;
    v86[9] = v38 + v49;
    v86[10] = v74;
    v86[11] = v75;
    if (a9)
    {
      CGFloat v69 = (float)((float)(1.0 - cosval) * v28);
      a9->double x = v69;
      a9->double y = v72;
    }

    *(float *)&CGFloat v69 = v54;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v84 state:v69];
    [a5 cull:2];
    SetLightingColors(v85, v86, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:v86];
    [a5 setTextureCoordinatesPointer:&v87 onTextureUnit:0];
    [a5 setColorsPointer:v85];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [a5 cull:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:&v84];
    [a3 setScale:v82];
    [a3 setCenterX:v80];
    [a3 setCenterY:v79];
  }

- (void)renderStillImage:(id)a3 withKey:(id)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  float x = a7.origin.x;
  float y = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  v37[0] = x;
  v37[1] = y;
  v37[2] = x;
  v37[3] = y + height;
  v37[4] = x + width;
  v37[5] = y;
  v37[6] = x + width;
  v37[7] = y + height;
  id v16 = objc_msgSend(a8, "objectForKey:", @"slideRect", a4, a5, a6);
  v36[0] = (float32x4_t)xmmword_1F7FFC;
  v36[1] = (float32x4_t)unk_1F800C;
  if (v16) {
    MyGLRectFromString(v16, v36);
  }
  objc_msgSend( a3,  "setUsesBackgroundColorAsBorderColor:",  objc_msgSend(a4, "hasPrefix:", @"text") ^ 1);
  LODWORD(v17) = 0;
  LODWORD(v18) = 0;
  LODWORD(v19) = 0;
  LODWORD(v20) = 1.0;
  [a5 setBackColorRed:v35 green:v17 blue:v18 alpha:v19 saveTo:v20];
  *(float *)&double v21 = width / height;
  [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v33 state:v21];
  *(float *)&double v22 = SetLightingColors2D((uint64_t)v34, v37, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v22);
  [a5 setVertex2DPointer:v37];
  [a5 setTextureCoordinatesPointer:v36 onTextureUnit:0];
  [a5 setColorsPointer:v34];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a3 unsetOnContext:a5 onTextureUnit:0 state:&v33];
  [a5 setBackColor:v35 saveTo:0];
  if (([a4 isEqualToString:@"text0"] & 1) == 0)
  {
    double v23 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
    __float2 v24 = (MRCroppingSprite *)[v23 objectForKey:a4];
    if (!v24)
    {
      __float2 v24 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v23 setObject:v24 forKey:a4];
    }

    double v25 = width;
    float v26 = x + v25 * 0.5;
    float v27 = y + height * 0.5;
    double v28 = v26;
    [a5 localAspectRatio];
    double v30 = (float)(v29 * v27);
    [a5 localAspectRatio];
    LODWORD(v32) = 0;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v24,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a5,  v28,  v30,  v25,  (float)(v31 * height),  v32);
  }

- (void)renderBreakImage:(id)a3 atProgress:(double)a4 withKey:(id)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  [a3 aspectRatio];
  double v20 = v19;
  if (v19 >= 0.5 && v19 <= 2.0) {
    goto LABEL_8;
  }
  double v22 = width / height / v19;
  if (v20 >= 1.0) {
    double v22 = v20 / (width / height);
  }
  if (v22 < 1.1)
  {
LABEL_8:
    -[MREffectOrigamiTitle renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:]( self,  "renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:",  a3,  a5,  a6,  a7,  0LL,  x,  y,  width,  height);
    return;
  }

  unsigned int v23 = objc_msgSend( objc_msgSend( objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"breakInformation"),  "objectForKey:",  @"image0"),  "objectForKey:",  @"panEndDirection"),  "intValue");
  float v24 = width;
  float v25 = height;
  if (v24 >= v25) {
    float v26 = height;
  }
  else {
    float v26 = v24;
  }
  double v160 = v26;
  float v158 = v24;
  float v159 = height;
  if (v20 <= 1.0)
  {
    [a3 height];
    double v33 = v32;
    [a3 width];
    double v30 = v33 * v24 - v34 * v25;
    [a3 width];
  }

  else
  {
    [a3 width];
    double v28 = v27;
    [a3 height];
    double v30 = v28 * v25 - v29 * v24;
    [a3 height];
  }

  double v35 = v30 / (v31 * v160);
  float v36 = v35;
  unint64_t v37 = vcvtps_u32_f32(v36);
  double mMainDuration = self->super.mMainDuration;
  if (v35 <= 0.0) {
    unint64_t v39 = 0LL;
  }
  else {
    unint64_t v39 = v37;
  }
  double v40 = 0.6 / mMainDuration;
  double v41 = 1.0;
  if (v39) {
    double v41 = (mMainDuration + (double)v39 * -0.6) / (mMainDuration * (double)(v39 + 1));
  }
  float v42 = x;
  float v155 = v42;
  float v43 = y;
  float v161 = v43;
  unint64_t v44 = vcvtmd_u64_f64(a4 / (v40 + v41));
  double v45 = fmod(a4, v40 + v41);
  if (v39 >= v44) {
    double v46 = v45;
  }
  else {
    double v46 = 0.0;
  }
  if (v39 < v44) {
    unint64_t v44 = v39;
  }
  objc_msgSend(a3, "scale", v45);
  double v154 = v47;
  [a3 centerX];
  double v49 = v48;
  [a3 centerY];
  double v51 = v50;
  [a3 setScale:1.0];
  [a3 setCenterX:0.0];
  [a3 setCenterY:0.0];
  double v156 = v51;
  double v157 = v49;
  if (v20 <= 1.0)
  {
    double v90 = v159;
    if (v35 <= 0.0) {
      double v91 = v159;
    }
    else {
      double v91 = v24 / v20;
    }
    double v94 = (v91 - v90) / (v91 * (double)v39);
    double v95 = 1.0 / v91;
    if (v46 > v41)
    {
      [*(id *)((char *)&self->mWordCount + 1) evaluatAtTime:(v46 - v41) / v40];
      double v97 = v96;
      double v98 = 0.5;
      double v99 = v91 * 0.5 * v94;
      *(float *)&double v96 = v96 * 1.57079633;
      __float2 v100 = __sincosf_stret(*(float *)&v96);
      double v101 = v99 * v100.__cosval;
      double v102 = -(v99 * v100.__sinval);
      float v89 = v159;
      double v103 = v101 + v161;
      double v104 = v101 + v103;
      double v105 = (v94 + v94) * (double)v44 + -1.0;
      double v106 = v94 + v105;
      double v107 = v94 + v94 + v105;
      double v108 = 2.0;
      double v109 = (float)(v161 + v159) - v101;
      double v110 = v109 - v101;
      double v111 = (v95 * v90 + v94 * (double)(v39 - v44)) * 2.0 + -1.0;
      double v112 = v111 - v94;
      double v113 = v111 - v94 - v94;
      if (v23 == -1)
      {
        double v108 = -2.0;
        double v105 = (v95 * v90 + v94 * (double)(v39 - v44)) * 2.0 + -1.0;
        double v98 = -0.5;
        float v114 = v161 + v159;
      }

      else
      {
        float v114 = v161;
      }

      if (v23 == -1)
      {
        double v103 = v109;
        float v115 = v161;
      }

      else
      {
        double v110 = v104;
        float v115 = v161 + v159;
      }

      if (v23 == -1) {
        double v116 = v112;
      }
      else {
        double v116 = v106;
      }
      if (v23 == -1) {
        double v117 = v113;
      }
      else {
        double v117 = v107;
      }
      double v118 = v90 + (v99 + v99) * v97;
      float v79 = v155;
      float v187 = v155;
      float v188 = v114;
      int v189 = 0;
      float v24 = v158;
      float v190 = v155 + v158;
      float v191 = v114;
      int v192 = 0;
      float v119 = v103;
      float v193 = v155;
      float v194 = v119;
      float v120 = v102;
      float v195 = v120;
      float v196 = v155 + v158;
      float v197 = v119;
      float v198 = v120;
      float v121 = v110;
      float v199 = v155;
      float v200 = v121;
      int v201 = 0;
      float v202 = v155 + v158;
      float v203 = v121;
      int v204 = 0;
      double v122 = v105 + v118 * v108 * v95;
      float v205 = v155;
      float v206 = v115;
      int v207 = 0;
      float v208 = v155 + v158;
      float v209 = v115;
      int v210 = 0;
      float v171 = -1.0;
      float v123 = v105;
      float v172 = v123;
      float v173 = 1.0;
      float v174 = v123;
      float v175 = -1.0;
      float v124 = v116;
      float v176 = v124;
      float v177 = 1.0;
      float v178 = v124;
      float v179 = -1.0;
      float v125 = v117;
      float v180 = v125;
      float v181 = 1.0;
      float v182 = v125;
      float v183 = -1.0;
      float v126 = v122;
      float v184 = v126;
      float v185 = 1.0;
      float v186 = v126;
      double v127 = v95 * v158;
      *(float *)&double v127 = v127;
      [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v127];
      SetLightingColors(&v163, &v187, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v187];
      [a6 setTextureCoordinatesPointer:&v171 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      SetLightingColors(&v163, &v193, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v193];
      [a6 setTextureCoordinatesPointer:&v175 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      SetLightingColors(&v163, &v199, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v199];
      [a6 setTextureCoordinatesPointer:&v179 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
      double v128 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
      [a3 aspectRatio];
      objc_msgSend( v128,  "setObject:forKey:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (v122 / ((v90 + v90) * v95) - v98) * v129 / (float)(v158 / v159)),  @"image0");
      goto LABEL_67;
    }

    float v79 = v155;
    float v89 = v159;
    float v171 = v155;
    float v172 = v161;
    float v173 = v155;
    float v174 = v161 + v159;
    float v24 = v158;
    float v175 = v155 + v158;
    float v176 = v161;
    float v177 = v155 + v158;
    float v178 = v161 + v159;
    if (v39)
    {
      unint64_t v131 = v39 - v44;
      if (v23 != -1) {
        unint64_t v131 = v44;
      }
      double v132 = (v94 + v94) * (double)v131 + -1.0;
    }

    else
    {
      double v132 = -1.0;
    }

    double v130 = v154;
    if (v39) {
      double v140 = v132 + (float)(v159 + v159) * v95;
    }
    else {
      double v140 = 1.0;
    }
    float v163 = -1.0;
    float v141 = v132;
    float v164 = v141;
    float v165 = -1.0;
    float v142 = v140;
    float v166 = v142;
    float v167 = 1.0;
    float v168 = v141;
    float v169 = 1.0;
    float v170 = v142;
    double v143 = v95 * v158;
    *(float *)&double v143 = v143;
    [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v143];
    *(float *)&double v144 = SetLightingColors2D((uint64_t)&v187, &v171, *(float *)[a6 foreColor]);
    objc_msgSend(a6, "setShader:", @"ColoredTexture", v144);
    [a6 setVertex2DPointer:&v171];
    [a6 setTextureCoordinatesPointer:&v163 onTextureUnit:0];
    [a6 setColorsPointer:&v187];
    [a6 drawTriangleStripFromOffset:0 count:4];
    [a6 unsetColorsPointer];
    [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a6 unsetVertexPointer];
    [a6 unsetShader];
    [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
    id v138 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
    [a3 aspectRatio];
    double v139 = (v132 + v140) / (v140 - v132) * v145 / (float)(v158 / v159);
LABEL_82:
    objc_msgSend( v138,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v139),  @"image0");
    goto LABEL_83;
  }

  double v52 = v159;
  double v53 = v24;
  if (v35 <= 0.0) {
    double v54 = v24;
  }
  else {
    double v54 = v20 * v159;
  }
  double v55 = (v54 - v53) / (v54 * (double)v39);
  if (v46 <= v41)
  {
    float v79 = v155;
    float v171 = v155;
    float v172 = v161;
    float v173 = v155;
    float v174 = v161 + v159;
    float v175 = v155 + v24;
    float v176 = v161;
    float v177 = v155 + v24;
    float v178 = v161 + v159;
    float v89 = v159;
    if (v39)
    {
      unint64_t v92 = v39 - v44;
      if (v23 != -1) {
        unint64_t v92 = v44;
      }
      double v93 = v55 * (double)v92 * 2.0 + -1.0;
    }

    else
    {
      double v93 = -1.0;
    }

    double v130 = v154;
    if (v39) {
      double v133 = v93 + (float)(v24 + v24) * (1.0 / v54);
    }
    else {
      double v133 = 1.0;
    }
    float v134 = v93;
    float v163 = v134;
    float v164 = -1.0;
    float v165 = v134;
    float v166 = 1.0;
    float v135 = v133;
    float v167 = v135;
    float v168 = -1.0;
    float v169 = v135;
    float v170 = 1.0;
    double v136 = v54 / v52;
    *(float *)&double v136 = v54 / v52;
    [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v136];
    *(float *)&double v137 = SetLightingColors2D((uint64_t)&v187, &v171, *(float *)[a6 foreColor]);
    objc_msgSend(a6, "setShader:", @"ColoredTexture", v137);
    [a6 setVertex2DPointer:&v171];
    [a6 setTextureCoordinatesPointer:&v163 onTextureUnit:0];
    [a6 setColorsPointer:&v187];
    [a6 drawTriangleStripFromOffset:0 count:4];
    [a6 unsetColorsPointer];
    [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a6 unsetVertexPointer];
    [a6 unsetShader];
    [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
    id v138 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
    double v139 = (v93 + v133) / (v133 - v93);
    goto LABEL_82;
  }

  double v56 = 1.0 / v54;
  double v153 = v159;
  [*(id *)((char *)&self->mWordCount + 1) evaluatAtTime:(v46 - v41) / v40];
  double v58 = v57;
  double v59 = v54 * 0.5 * v55;
  *(float *)&double v57 = v57 * 1.57079633;
  __float2 v60 = __sincosf_stret(*(float *)&v57);
  double v61 = v59 * v60.__cosval;
  double v62 = -(v59 * v60.__sinval);
  double v63 = v61 + v155;
  double v64 = v61 + v63;
  double v65 = (v55 + v55) * (double)v44 + -1.0;
  double v66 = v55 + v65;
  double v67 = v55 + v55 + v65;
  double v68 = 2.0;
  double v69 = (float)(v155 + v158) - v61;
  double v70 = v69 - v61;
  double v71 = (1.0 / v54 * v53 + v55 * (double)(v39 - v44)) * 2.0 + -1.0;
  double v72 = v71 - v55;
  double v73 = v71 - v55 - v55;
  if (v23 == -1)
  {
    double v68 = -2.0;
    double v65 = (v56 * v53 + v55 * (double)(v39 - v44)) * 2.0 + -1.0;
    double v74 = -0.5;
  }

  else
  {
    double v74 = 0.5;
  }

  if (v23 == -1) {
    double v75 = v73;
  }
  else {
    double v75 = v67;
  }
  if (v23 == -1)
  {
    double v66 = v72;
    float v76 = v155;
  }

  else
  {
    float v76 = v155 + v158;
  }

  if (v23 == -1) {
    double v63 = v69;
  }
  else {
    double v70 = v64;
  }
  if (v23 == -1) {
    float v77 = v155 + v158;
  }
  else {
    float v77 = v155;
  }
  double v78 = v59 + v59;
  float v79 = v155;
  double v80 = v65 + (v53 + v78 * v58) * v68 * v56;
  float v187 = v77;
  float v188 = v161;
  int v189 = 0;
  float v190 = v77;
  float v191 = v161 + v159;
  int v192 = 0;
  float v81 = v63;
  float v193 = v81;
  float v194 = v161;
  float v82 = v62;
  float v195 = v82;
  float v196 = v81;
  float v197 = v161 + v159;
  float v198 = v82;
  float v83 = v70;
  float v199 = v83;
  float v200 = v161;
  int v201 = 0;
  float v202 = v83;
  float v203 = v161 + v159;
  int v204 = 0;
  float v205 = v76;
  float v206 = v161;
  int v207 = 0;
  float v208 = v76;
  float v209 = v161 + v159;
  int v210 = 0;
  float v84 = v65;
  float v171 = v84;
  float v172 = -1.0;
  float v173 = v84;
  float v174 = 1.0;
  float v85 = v66;
  float v175 = v85;
  float v176 = -1.0;
  float v177 = v85;
  float v178 = 1.0;
  float v86 = v75;
  float v179 = v86;
  float v180 = -1.0;
  float v181 = v86;
  float v182 = 1.0;
  float v87 = v80;
  float v183 = v87;
  float v184 = -1.0;
  float v185 = v87;
  float v186 = 1.0;
  double v88 = v54 / v153;
  *(float *)&double v88 = v54 / v153;
  [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v88];
  SetLightingColors(&v163, &v187, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v187];
  [a6 setTextureCoordinatesPointer:&v171 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  SetLightingColors(&v163, &v193, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v193];
  [a6 setTextureCoordinatesPointer:&v175 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  SetLightingColors(&v163, &v199, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v199];
  [a6 setTextureCoordinatesPointer:&v179 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
  objc_msgSend( *(id *)((char *)&self->mBackColorForImage[2] + 1),  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80 / ((v53 + v53) * v56) - v74),  @"image0");
  float v89 = v159;
  float v24 = v158;
LABEL_67:
  double v130 = v154;
LABEL_83:
  __int128 v146 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
  int v147 = (MRCroppingSprite *)[v146 objectForKey:@"image0"];
  if (!v147)
  {
    int v147 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v146 setObject:v147 forKey:@"image0"];
  }

  double v148 = (float)(v79 + (float)(v24 * 0.5));
  [a6 localAspectRatio];
  double v150 = (float)((float)(v161 + (float)(v89 * 0.5)) * v149);
  [a6 localAspectRatio];
  LODWORD(v152) = 0;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v147,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a6,  v148,  v150,  v24,  (float)(v151 * v89),  v152);
  [a3 setScale:v130];
  [a3 setCenterX:v157];
  [a3 setCenterY:v156];
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v10 = a4;
  [a4 localAspectRatio];
  float v12 = 1.0 / v11;
  if (!-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"5"))
  {
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Text"))
    {
      id v20 = objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithSize:andColor:",  objc_msgSend(a4, "backColor"),  1.0,  1.0);
      [v20 setLabel:@"Marimba OrigamiTitle Background"];
      [v20 setClampMode:2];
      objc_msgSend( *(id *)((char *)&self->mText0Offsets + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      double v22 = v21;
      double v24 = v23;
      float v25 = v9;
      double v26 = (float)-v12;
      double v27 = v12 + v12;
      objc_msgSend( v9,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  objc_msgSend(v20, "insertingInCollection"),  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v26, 1.0, v27),  @"rectangle",  0));
      id v28 = [*(id *)((char *)&self->mText0Offsets + 1) insertingInCollection];
      double v29 = +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  (v22 + 1.0) * -0.5,  v24 * -0.5,  v22,  v24);
      id v30 = v28;
      id v9 = v25;
      objc_msgSend( v25,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v30,  @"image",  &__kCFBooleanTrue,  @"needsBlend",  v29,  @"rectangle",  0));
      id v31 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
      objc_msgSend( v25,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  objc_msgSend(v31, "insertingInCollection"),  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, v26, 1.0, v27),  @"rectangle",  0));
LABEL_5:
      double v32 = v31;
LABEL_49:
      [v32 releaseByUser];
      goto LABEL_50;
    }

    unsigned int v33 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title1");
    [a4 localAspectRatio];
    double v35 = v34;
    if (v33)
    {
      double v36 = 2.0 / v35;
      double v37 = 2.0 / v35 * -0.5;
      id v38 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
      id v20 = [v38 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
      [v20 width];
      float v40 = v39;
      [v20 height];
      *(float *)&double v41 = v41;
      double v42 = (float)(v40 / *(float *)&v41);
      [v20 scale];
      double v44 = v43;
      [a4 localAspectRatio];
      double v46 = v44 * v45 / v42;
      if (v44 >= 1.0 && v46 >= 1.0)
      {
LABEL_10:
        double v47 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v20 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v36 * -0.5, 2.0, v36),  @"rectangle",  0);
        [v9 addObject:v47];

        goto LABEL_50;
      }

      id v31 = -[MREffectOrigamiTitle _retainedByUserBackColorImageInContext:]( self,  "_retainedByUserBackColorImageInContext:",  a4);
      [v20 setCenterX:0.0];
      [v20 setCenterY:0.0];
      double v72 = objc_alloc(&OBJC_CLASS___NSDictionary);
      id v73 = [v20 insertingInCollection];
      if (v44 >= 1.0)
      {
        float v87 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", -1.0, v37 * v46, 2.0, v36 * v46);
        double v88 = 2.0 / v36;
        *(float *)&double v88 = 2.0 / v36;
        float v89 = -[NSDictionary initWithObjectsAndKeys:]( v72,  "initWithObjectsAndKeys:",  v73,  @"image",  v87,  @"rectangle",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v88),  @"referenceAspectRatio",  0LL);
        [v9 addObject:v89];

        double v90 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v31 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:]( NSValue,  "valueWithCGRect:",  -1.0,  v36 * -0.5,  2.0,  v37 * (v46 + -1.0)),  @"rectangle",  &__kCFBooleanTrue,  @"onTop",  0);
        [v9 addObject:v90];

        double v78 = objc_alloc(&OBJC_CLASS___NSDictionary);
        id v79 = [v31 insertingInCollection];
        double v82 = (v36 + v37) * v46;
        double v83 = (v36 + v37) * (1.0 - v46);
        double v81 = -1.0;
        double v80 = 2.0;
      }

      else
      {
        double v74 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", -v44, v36 * -0.5, v44 + v44, v36);
        double v75 = 2.0 / v36;
        *(float *)&double v75 = 2.0 / v36;
        float v76 = -[NSDictionary initWithObjectsAndKeys:]( v72,  "initWithObjectsAndKeys:",  v73,  @"image",  v74,  @"rectangle",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v75),  @"referenceAspectRatio",  0LL);
        [v9 addObject:v76];

        float v77 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v31 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:]( NSValue,  "valueWithCGRect:",  -1.0,  v36 * -0.5,  -(v44 + -1.0),  v36),  @"rectangle",  &__kCFBooleanTrue,  @"onTop",  0);
        [v9 addObject:v77];

        double v78 = objc_alloc(&OBJC_CLASS___NSDictionary);
        id v79 = [v31 insertingInCollection];
        double v80 = 1.0 - v44;
        double v81 = v44;
        double v82 = v36 * -0.5;
        double v83 = v36;
      }

      double v91 = -[NSDictionary initWithObjectsAndKeys:]( v78,  "initWithObjectsAndKeys:",  v79,  @"image",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v81, v82, v80, v83),  @"rectangle",  &__kCFBooleanTrue,  @"onTop",  0LL);
      [v9 addObject:v91];

      goto LABEL_5;
    }

    double width = 1.0;
    double v49 = 1.0 / v35;
    objc_msgSend( *(id *)((char *)&self->mText0Offsets + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    double v51 = v50;
    double v99 = v52;
    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami-Text"))
    {
      double v53 = v9;
      int v96 = 0;
      double y = -v49;
      double height = v49 + v49;
      double x = -1.0;
      double v57 = 0.0;
      double v95 = -0.5;
      CGFloat v93 = 0.0;
LABEL_13:
      double v94 = y;
      double v97 = 1.0;
LABEL_14:
      double v98 = height;
      goto LABEL_19;
    }

    if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LText1")
      || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LText1"))
    {
      double v53 = v9;
      int v96 = 0;
      double v98 = v49 * 1.5;
      double y = -v49;
      double height = v49 * 0.5;
      double v94 = v49 * -0.5;
      double v95 = v51 * 0.5 + -0.85;
      double width = 2.0;
      double x = -1.0;
      double v57 = -0.75;
    }

    else
    {
      if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LText2")
        || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LText2"))
      {
        double v53 = v9;
        int v96 = 0;
        double v57 = -0.3333333;
        double y = -v49;
        double height = v49 + v49;
        double v95 = v51 * -0.5 + -0.1;
        CGFloat v93 = 0.0;
        double x = -1.0;
        goto LABEL_13;
      }

      if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTextP1")
        && !-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LTextP1"))
      {
        if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTextP2")
          || -[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami3-LTextP2"))
        {
          double v53 = v9;
          double y = -v49;
          double height = v49 + v49;
          double v95 = v51 * 0.5 + -0.23333333;
          CGFloat v93 = -1.0;
          int v96 = 1;
          double v97 = 0.6666667;
          double width = 1.3333333;
          double v57 = -0.3333333;
          double x = -0.3333333;
        }

        else
        {
          if (-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTitleP1"))
          {
            double v53 = v9;
            double v94 = v49 * -0.3333333;
            double v98 = v49 * 1.3333333;
            double y = -v49;
            double height = v49 * 0.6666667;
            double width = 2.0;
            double x = -1.0;
            double v95 = 0.0;
            int v96 = 1;
            double v57 = -0.645;
            goto LABEL_18;
          }

          double v53 = v9;
          if (!-[NSString isEqualToString:](self->super.mEffectID, "isEqualToString:", @"Origami2-LTitleP2"))
          {
            int v96 = 0;
            double x = CGRectZero.origin.x;
            double y = CGRectZero.origin.y;
            double width = CGRectZero.size.width;
            double height = CGRectZero.size.height;
            double v57 = CGPointZero.y;
            double v94 = y;
            double v95 = CGPointZero.x;
            CGFloat v93 = CGRectZero.origin.x;
            double v97 = width;
            goto LABEL_14;
          }

          double y = -v49;
          double height = v49 + v49;
          double v95 = v51 * 0.5 + -0.23333333;
          CGFloat v93 = -1.0;
          double v57 = 0.0;
          int v96 = 1;
          double v97 = 0.6666667;
          double width = 1.3333333;
          double x = -0.3333333;
        }

        double v94 = y;
        goto LABEL_14;
      }

      double v53 = v9;
      double v94 = v49 * -0.3333333;
      double v98 = v49 * 1.3333333;
      double y = -v49;
      double height = v49 * 0.6666667;
      double v95 = v51 * 0.5 + -0.85;
      double width = 2.0;
      double x = -1.0;
      int v96 = 1;
      double v57 = -0.6666667;
    }

- (id)_retainedByUserBackColorImageInContext:(id)a3
{
  id v5 = [a3 backColor];
  BOOL v7 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
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
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = (MROrigamiAnimationPath *)[a3 retainedByUserBlackImage];
  }

  else
  {
    id v8 = (MROrigamiAnimationPath *)objc_msgSend( objc_msgSend(a3, "imageManager", v6),  "retainedByUserImageWithSize:andColor:",  v5,  1.0,  1.0);
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = v8;
    -[MROrigamiAnimationPath setLabel:](v8, "setLabel:", @"Marimba Origami Background");
    [*(id *)((char *)&self->mBigSwing + 1) setClampMode:2];
  }

  *(_DWORD *)((char *)&self->mBackColorImage + 1) = *v5;
  *(_DWORD *)((char *)&self->mBackColorImage + 5) = v5[1];
  *(float *)((char *)self->mBackColorForImage + 1) = (float)v5[2];
  BOOL v7 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
  return [v7 retainByUser];
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  double v6 = *(NSMutableArray **)((char *)&self->mText0Offsets + 1);
  if (v6)
  {
    objc_msgSend(v6, "releaseByUser", a4, a5, a3);
    *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = 0LL;
  }

  BOOL v7 = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
  if (v7)
  {
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * (void)i) removingFromCollection];
        }

        id v9 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }

      while (v9);
    }

    *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = 0LL;
    *(NSMutableArray **)((char *)&self->mText0Images + 1) = 0LL;

    *(void *)&self->mLineWordCounts[1] = 0LL;
  }

  id v12 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  id v13 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v12)
  {
    uint64_t v14 = v12;
    if (!v13) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v14 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    id v15 = -[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"LTitleP");
    id v16 = -[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"LTitleP2");
    double v17 = dbl_1F7F40[-[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"LText") == (id)0x7FFFFFFFFFFFFFFFLL];
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL) {
      double v17 = 0.9;
    }
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL) {
      double v17 = 0.55;
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * v17,  self->super.mPixelSize.height * 0.5);
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:3];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v14];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInset:", 1.0, 1.0);
    [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = v18;
    *(void *)((char *)&self->mImageSize.width + 1) = v19;
    if (-[NSString rangeOfString:](self->super.mEffectID, "rangeOfString:", @"Text") == (id)0x7FFFFFFFFFFFFFFFLL
      && v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_26;
    }

    id v20 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v20)
    {
      double v21 = v20;
      double v22 = (NSMutableArray *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v20);
      *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = v22;
      -[NSMutableArray setLabel:](v22, "setLabel:", @"Marimba Origami Text");
      CGContextRelease(v21);
    }

    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_26:
      *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = (MRCroppingSprite *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      *(NSMutableArray **)((char *)&self->mText0Images + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      *(void *)&self->mLineWordCounts[1] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      *(void *)((char *)&self->mImageSize.height + 1) = [*(id *)(&self->super._isInInteractiveMode + 1) countOfWords];
      [*(id *)(&self->super._isInInteractiveMode + 1) cacheText];
      if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
        || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
      {
        double v23 = (char *)objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "rangeOfGlyphsForWordsInRange:",  0,  1);
        uint64_t v48 = v24;
        [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
        double v26 = v25;
        double v28 = v27;
        double v29 = (char *)[*(id *)(&self->super._isInInteractiveMode + 1) numberOfLinesForTruncatedText];
        if ((uint64_t)v29 >= 1)
        {
          id v30 = v29;
          id v31 = 0LL;
          uint64_t v32 = 0LL;
          double v46 = v29;
          do
          {
            unsigned int v33 = (char *)[*(id *)(&self->super._isInInteractiveMode + 1) rangeOfGlyphsOnLine:v31];
            if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              if (v34 >= 1)
              {
                double v35 = v33;
                double v36 = &v33[v34];
                do
                {
                  [*(id *)(&self->super._isInInteractiveMode + 1) originOfGlyphAtIndex:v35];
                  double v38 = v37;
                  double v40 = v39;
                  double v41 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContextOfGlyphAtIndex:v35];
                  if (v41)
                  {
                    double v42 = v41;
                    id v43 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v41);
                    [v43 setLabel:@"Marimba Origami Text"];
                    objc_msgSend( *(id *)((char *)&self->mText0Sprite + 1),  "addObject:",  objc_msgSend(v43, "insertingInCollection"));
                    [v43 releaseByUser];
                    CGContextRelease(v42);
                    objc_msgSend( *(id *)((char *)&self->mText0Images + 1),  "addObject:",  +[NSValue valueWithCGPoint:]( NSValue,  "valueWithCGPoint:",  v38 + v26 * -0.5,  v40 + v28 * -0.5));
                    if ((uint64_t)v35 < (uint64_t)v23 || (uint64_t)v35 >= (uint64_t)&v23[v48])
                    {
                      else {
                        uint64_t v32 = *(void *)((char *)&self->mImageSize.height + 1);
                      }
                      double v23 = (char *)objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "rangeOfGlyphsForWordsInRange:",  v32,  1);
                      uint64_t v48 = v44;
                    }

                    objc_msgSend( *(id *)&self->mLineWordCounts[1],  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v32));
                  }

                  ++v35;
                }

                while ((uint64_t)v35 < (uint64_t)v36);
              }

              [*(id *)(&self->super._isInInteractiveMode + 1) rangeOfWordsOnLine:v31];
              v31[(void)&self->mText0Image + 1] = v45;
              id v30 = v46;
            }

            ++v31;
          }

          while (v31 != v30);
        }
      }

      [*(id *)(&self->super._isInInteractiveMode + 1) clearCache];
    }
  }

  else if (v13)
  {

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.45;
  double v4 = self->super.mPixelSize.height * 0.5;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_unload
{
  double v3 = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
  if (v3)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        BOOL v7 = 0LL;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) removingFromCollection];
          BOOL v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v5);
    }

    *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = 0LL;
    *(NSMutableArray **)((char *)&self->mText0Images + 1) = 0LL;

    *(void *)&self->mLineWordCounts[1] = 0LL;
  }

  [*(id *)((char *)&self->mText0Offsets + 1) releaseByUser];
  *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = 0LL;
  id v8 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v8)
  {
    [v8 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  id v9 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
  if (v9)
  {
    [v9 releaseByUser];
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = 0LL;
  }

  *(_DWORD *)((char *)&self->mBackColorImage + 1) = -1082130432;
}

@end