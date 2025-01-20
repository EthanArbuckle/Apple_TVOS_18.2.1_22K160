@interface MREffectShatterText
- (BOOL)getVerticesCoordinates:(MREffectShatterText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectShatterText)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_renderSublayer:(id)a3 layerCount:(int64_t)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectShatterText

- (MREffectShatterText)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectShatterText;
  result = -[MREffect initWithEffectID:](&v4, "initWithEffectID:", a3);
  if (result)
  {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer + 1) = 0LL;
    *(MRImage **)((char *)&result->mTextImage + 1) = 0LL;
    *(MRCroppingSprite **)((char *)&result->mTextSprite + 1) = 0LL;
  }

  return result;
}

- (void)_cleanup
{
  v3 = *(NSMutableDictionary **)((char *)&self->mLayout + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(NSMutableDictionary **)((char *)&self->mLayout + 1) = 0LL;
  }

  *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  [*(id *)(&self->super._isInInteractiveMode + 1) cleanup];

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;

  *(void *)(&self->mIsTitle + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)self->mCurves + 1) = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_super v4 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        [v9 unload];
        [v9 cleanup];
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MREffectShatterText;
    -[MREffect setPixelSize:](&v15, "setPixelSize:");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "setDefaultSize:",  p_mPixelSize->width,  p_mPixelSize->height);
        }

        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }

      while (v8);
    }
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectShatterText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mTextImage + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v4 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    LOBYTE(v8) = 1;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((v8 & 1) != 0) {
          unsigned int v8 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) isLoaded];
        }
        else {
          unsigned int v8 = 0;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  else
  {
    unsigned int v8 = 1;
  }

  id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  BOOL v11 = v10 && [v10 length] && *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) == 0;
  BOOL result = 0;
  if (v8)
  {
    if (!v11) {
      return !self->super.mNeedsToUpdateTexts;
    }
  }

  return result;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!*(MRCroppingSprite **)((char *)&self->mTextSprite + 1))
  {
    *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = (MRCroppingSprite *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = -4LL;
    do
    {
      unsigned int v8 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      -[MRImageProvider setAssetPath:]( v8,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"Shatter",  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"text_mask_%d.png", v7 + 5)));
      -[MRImageProvider setOriginalImageSize:](v8, "setOriginalImageSize:", 1680.0, 1050.0);
      -[MRImageProvider setDefaultSize:]( v8,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      [*(id *)((char *)&self->mTextSprite + 1) addObject:v8];
    }

    while (!__CFADD__(v7++, 1LL));
  }

  if (!BYTE1(self->mMasks))
  {
    *(void *)(&self->mIsLoaded + 1) =  objc_msgSend( +[MRTransitionShatter shatterDescriptions]( MRTransitionShatter,  "shatterDescriptions"),  "objectForKey:",  @"titleIntro");
    BYTE1(self->mMasks) = 1;
    BYTE1(self->mRenderedTextImage) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mAttributes,  "objectForKey:",  @"PresetID"),  "isEqualToString:",  @"Default");
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MREffectShatterText;
  -[MREffect prerenderForTime:inContext:withArguments:](&v13, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 1.0 || BYTE1(self->mRenderedTextImage) == 0)
  {
    objc_msgSend(a4, "blend:", 2, a5);
    [a4 setShader:@"PlainTexture"];
    objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    double v10 = v9;
    double v12 = v11;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v13) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  v10 * 0.5 + -0.8,  -0.400000006,  v10,  v12,  v13);
    }

    else
    {
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  v10 * 0.5 + -0.8,  -0.400000006,  v10,  v12);
    }

    [a4 unsetShader];
    [a4 blend:0];
  }

  else
  {
    if (!*(NSMutableDictionary **)((char *)&self->mLayout + 1))
    {
      v36[0] = 0LL;
      v36[1] = 0LL;
      p_mPixelSize = &self->super.mPixelSize;
      id v16 = objc_msgSend( a4,  "beginLocalContextWithSize:backgroundColor:state:",  v36,  v34,  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      CGFloat v17 = p_mPixelSize->width / self->super.mPixelSize.height;
      *(float *)&CGFloat v17 = v17;
      [v16 setLocalAspectRatio:v17];
      v18 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
      v19 = v18;
      if (v18 != [v16 glContext]) {
        +[EAGLContext setCurrentContext:]( EAGLContext,  "setCurrentContext:",  [v16 glContext]);
      }
      [v16 blend:2];
      [v16 setShader:@"PlainTexture"];
      objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  p_mPixelSize->width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  v16,  v20 * 0.5 + -0.8,  -0.400000006,  v20,  v21);
      [v16 unsetShader];
      [v16 blend:0];
      if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v18) {
        +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v18);
      }

      v22 = (NSMutableDictionary *)[a4 retainedByUserImageByEndingLocalContext:v16 andRestoreState:v34];
      v23 = *(NSMutableDictionary **)((char *)&self->mLayout + 1);
      if (v23) {
        [v23 releaseByUser];
      }
      *(NSMutableDictionary **)((char *)&self->mLayout + 1) = v22;
    }

    [a4 setShader:@"AlphaMaskPremultiplied"];
    [a4 cull:2];
    id v24 = objc_msgSend( objc_msgSend(*(id *)(&self->mIsLoaded + 1), "objectForKey:", @"layerCount"),  "integerValue");
    id v25 = [*(id *)(&self->mIsLoaded + 1) objectForKey:@"sublayers"];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(v25);
          }
          -[MREffectShatterText _renderSublayer:layerCount:atTime:inContext:withArguments:]( self,  "_renderSublayer:layerCount:atTime:inContext:withArguments:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i),  v24,  a4,  a5,  a3);
        }

        id v27 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v27);
    }

    [a4 cull:0];
    [a4 unsetShader];
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.949999988;
  double v4 = self->super.mPixelSize.height * 0.333000004;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 2LL;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v5, "addObject:", @"isTitle");
  return v5;
}

- (void)_renderSublayer:(id)a3 layerCount:(int64_t)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7
{
  int64_t v111 = a4;
  id v112 = a7;
  id v106 = a6;
  id v107 = a3;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  id v108 = [a3 objectForKey:@"animations"];
  id v113 = [v108 countByEnumeratingWithState:&v145 objects:v158 count:16];
  if (v113)
  {
    uint64_t v109 = *(void *)v146;
    double v9 = 0.0;
    double v10 = -1.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    v110 = self;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v146 != v109) {
          objc_enumerationMutation(v108);
        }
        uint64_t v117 = v15;
        id v16 = *(void **)(*((void *)&v145 + 1) + 8 * v15);
        uint64_t v17 = (uint64_t)objc_msgSend(objc_msgSend(v16, "objectForKey:", @"keyframeCount"), "integerValue");
        v116 = &v106;
        uint64_t v114 = v17;
        uint64_t v18 = 8 * v17;
        unint64_t v19 = (8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        __chkstk_darwin(v17);
        id v118 = v16;
        v119 = (double *)((char *)&v106 - v19);
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        id v20 = [v16 objectForKey:@"keyTimes"];
        id v21 = [v20 countByEnumeratingWithState:&v141 objects:v157 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = 0LL;
          uint64_t v24 = *(void *)v142;
          do
          {
            id v25 = 0LL;
            id v26 = &v119[v23];
            do
            {
              if (*(void *)v142 != v24) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v141 + 1) + 8 * (void)v25) floatValue];
              v26[(void)v25] = v27;
              id v25 = (char *)v25 + 1;
            }

            while (v22 != v25);
            id v21 = [v20 countByEnumeratingWithState:&v141 objects:v157 count:16];
            id v22 = v21;
            v23 += (uint64_t)v25;
          }

          while (v21);
        }

        __chkstk_darwin(v21);
        uint64_t v28 = (char *)&v106 - v19;
        __int128 v139 = 0u;
        __int128 v140 = 0u;
        __int128 v137 = 0u;
        __int128 v138 = 0u;
        id v29 = [v118 objectForKey:@"values"];
        id v30 = [v29 countByEnumeratingWithState:&v137 objects:v156 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = 0LL;
          uint64_t v33 = *(void *)v138;
          do
          {
            v34 = 0LL;
            do
            {
              if (*(void *)v138 != v33) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v137 + 1) + 8 * (void)v34) floatValue];
              *(double *)&v28[8 * v32 + 8 * (void)v34] = v35;
              v34 = (char *)v34 + 1;
            }

            while (v31 != v34);
            id v30 = [v29 countByEnumeratingWithState:&v137 objects:v156 count:16];
            id v31 = v30;
            v32 += (uint64_t)v34;
          }

          while (v30);
        }

        v115 = v28;
        __chkstk_darwin(v30);
        v122 = (id *)((char *)&v106 - (v18 & 0xFFFFFFFFFFFFFFF0LL));
        __int128 v135 = 0u;
        __int128 v136 = 0u;
        __int128 v133 = 0u;
        __int128 v134 = 0u;
        id v120 = [v118 objectForKey:@"timingFunctions"];
        double v123 = COERCE_DOUBLE([v120 countByEnumeratingWithState:&v133 objects:v155 count:16]);
        if (v123 != 0.0)
        {
          uint64_t v36 = 0LL;
          uint64_t v121 = *(void *)v134;
          do
          {
            uint64_t v37 = 0LL;
            do
            {
              if (*(void *)v134 != v121) {
                objc_enumerationMutation(v120);
              }
              v38 = *(void **)(*((void *)&v133 + 1) + 8 * v37);
              __int128 v129 = 0u;
              __int128 v130 = 0u;
              __int128 v131 = 0u;
              __int128 v132 = 0u;
              id v39 = [v38 countByEnumeratingWithState:&v129 objects:v154 count:16];
              if (v39)
              {
                id v40 = v39;
                uint64_t v41 = 0LL;
                uint64_t v42 = *(void *)v130;
                do
                {
                  for (i = 0LL; i != v40; i = (char *)i + 1)
                  {
                    if (*(void *)v130 != v42) {
                      objc_enumerationMutation(v38);
                    }
                    [*(id *)(*((void *)&v129 + 1) + 8 * (void)i) doubleValue];
                    *((void *)v153 + v41 + (void)i) = v44;
                  }

                  id v40 = [v38 countByEnumeratingWithState:&v129 objects:v154 count:16];
                  v41 += (uint64_t)i;
                }

                while (v40);
              }

              v45 =  -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v153);
              v122[v36++] = v45;
              ++v37;
            }

            while (v37 != *(void *)&v123);
            double v123 = COERCE_DOUBLE([v120 countByEnumeratingWithState:&v133 objects:v155 count:16]);
          }

          while (v123 != 0.0);
        }

        id v46 = [v118 objectForKey:@"key"];
        if ([v46 isEqualToString:@"yRotation"])
        {
          ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, (uint64_t)v115, v114);
          double v14 = v47;
          self = v110;
        }

        else
        {
          unsigned int v48 = [v46 isEqualToString:@"xRotation"];
          self = v110;
          uint64_t v49 = (uint64_t)v115;
          if (v48)
          {
            ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, (uint64_t)v115, v114);
            double v13 = v50;
          }

          else if ([v46 isEqualToString:@"zRotation"])
          {
            ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, v49, v114);
            double v12 = v51;
          }

          else if ([v46 isEqualToString:@"translateZ"])
          {
            ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, v49, v114);
            double v11 = v52 * 1.29999995;
          }

          else if ([v46 isEqualToString:@"translateY"])
          {
            ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, v49, v114);
            double v9 = v53;
          }

          else if ([v46 isEqualToString:@"opacity"])
          {
            ValueFromBezierPath(v122, v119, 0.0, 1.0, a5, v49, v114);
            double v10 = v54;
          }
        }

        uint64_t v15 = v117 + 1;
      }

      while ((id)(v117 + 1) != v113);
      id v113 = [v108 countByEnumeratingWithState:&v145 objects:v158 count:16];
    }

    while (v113);
  }

  else
  {
    double v9 = 0.0;
    double v10 = -1.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }

  if (!*(void *)(&self->mIsTitle + 1))
  {
    v153[0] = xmmword_1FBDF0;
    v153[1] = unk_1FBE00;
    *(void *)(&self->mIsTitle + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v153);
    v152[0] = xmmword_1FBE10;
    v152[1] = unk_1FBE20;
    *(MRCAMLBezierData **)((char *)self->mCurves + 1) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v152);
    *(_OWORD *)((char *)&self->mCurves[1] + 1) = xmmword_1FBDE0;
    *(double *)((char *)&self->mValues[1] + 1) = 0.0;
    *(_OWORD *)((char *)&self->mValues[2] + 1) = xmmword_1F6190;
    *(double *)((char *)&self->mKeyTimes[1] + 1) = 1.0;
  }

  v55 = v106;
  ValueFromBezierPath( (id *)(&self->mIsTitle + 1),  (double *)((char *)&self->mValues[2] + 1),  0.0,  1.0,  a5,  (uint64_t)&self->mCurves[1] + 1,  3LL);
  double v57 = v56;
  id v58 = [v107 objectForKey:@"translateZ"];
  if (v58)
  {
    [v58 floatValue];
    double v11 = (float)(v59 * 0.5);
  }

  id v60 = [v107 objectForKey:@"translateY"];
  if (v60)
  {
    [v60 floatValue];
    double v9 = v61;
  }

  id v62 = [v107 objectForKey:@"yRotation"];
  if (v62)
  {
    [v62 floatValue];
    double v14 = v63;
  }

  id v64 = [v107 objectForKey:@"xRotation"];
  if (v64)
  {
    [v64 floatValue];
    double v13 = v65;
  }

  id v66 = [v107 objectForKey:@"zRotation"];
  if (v66)
  {
    [v66 floatValue];
    double v12 = v67;
  }

  double v123 = v10;
  id v68 = [v107 objectForKey:@"invScale"];
  if (v68)
  {
    [v68 floatValue];
    double v70 = (v57 * v11 + v57 * v69 * 0.5) * -0.577350259 + 1.0;
  }

  else
  {
    double v70 = 1.0;
  }

  id v71 = [v107 objectForKey:@"scale"];
  if (v71)
  {
    [v71 floatValue];
    double v70 = v72;
  }

  double v73 = MRMatrix_Clear((uint64_t)v153);
  if (objc_msgSend(objc_msgSend(v107, "objectForKey:", @"alignBottom", v73), "BOOLValue"))
  {
    [v55 localAspectRatio];
    MRMatrix_Translate((float *)v153, 0.0, -1.0 / v74, 0.0);
    float v75 = v13;
    float v76 = v14;
    float v77 = v12;
    MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v152, v75, v76, v77);
    objc_msgSend(v55, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v153, (float *)v152));
    MRMatrix_Translate((float *)v153, 0.0, 1.0 / v78, 0.0);
  }

  else
  {
    float v79 = v13;
    float v80 = v14;
    float v81 = v12;
    MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v153, v79, v80, v81);
  }

  float v82 = v9;
  float v83 = v57 * v11;
  MRMatrix_Translate((float *)v153, 0.0, v82, v83);
  v84.f32[0] = v70;
  *(float *)&double v85 = MRMatrix_Scale((float32x2_t *)v153, v84, v84.f32[0], 1.0);
  objc_msgSend(v55, "composeModelViewMatrix:saveTo:", v153, v151, v85);
  double v86 = v123;
  if (v123 >= 0.0)
  {
    [v55 blend:3];
    *(float *)&double v87 = v86;
    LODWORD(v88) = 1.0;
    LODWORD(v89) = 1.0;
    LODWORD(v90) = 1.0;
    [v55 setForeColorRed:v150 green:v88 blue:v89 alpha:v90 saveTo:v87];
  }

  id v91 = [v107 objectForKey:@"layerIndex"];
  if (v91)
  {
    id v92 = [v91 integerValue];
    uint64_t v93 = *(uint64_t *)((char *)&self->mLayout + 1);
    else {
      id v94 = 0LL;
    }
    id v95 = [*(id *)((char *)&self->mTextSprite + 1) objectAtIndex:v94];
    id v96 = [v95 retainedByUserRenderedImageAtTime:v55 inContext:v112 withArguments:a5];
    [v96 setClampMode:2];
    [v96 setPreservesAspectRatio:0];
    LODWORD(v97) = 0;
    [v96 setOnContext:v55 onTextureUnit:1 withReferenceAspectRatio:&v128 state:v97];
    v98 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    LODWORD(v99) = 0;
    -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v98,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v93,  v55,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v99);

    [v96 unsetOnContext:v55 onTextureUnit:1 state:&v128];
    [v96 releaseByUser];
  }

  id v100 = [v107 objectForKey:@"sublayers"];
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  id v101 = [v100 reverseObjectEnumerator];
  id v102 = [v101 countByEnumeratingWithState:&v124 objects:v149 count:16];
  if (v102)
  {
    id v103 = v102;
    uint64_t v104 = *(void *)v125;
    do
    {
      for (j = 0LL; j != v103; j = (char *)j + 1)
      {
        if (*(void *)v125 != v104) {
          objc_enumerationMutation(v101);
        }
        -[MREffectShatterText _renderSublayer:layerCount:atTime:inContext:withArguments:]( self,  "_renderSublayer:layerCount:atTime:inContext:withArguments:",  *(void *)(*((void *)&v124 + 1) + 8LL * (void)j),  v111,  v55,  v112,  a5);
      }

      id v103 = [v101 countByEnumeratingWithState:&v124 objects:v149 count:16];
    }

    while (v103);
  }

  if (v86 >= 0.0)
  {
    [v55 blend:0];
    [v55 restoreForeColor:v150];
  }

  [v55 restoreModelViewMatrix:v151];
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  unsigned int v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  double v9 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.800000012,  self->super.mPixelSize.height * 0.333000004);
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:2];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    double v10 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v10)
    {
      double v11 = v10;
      double v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba Shatter Text");
      CGContextRelease(v11);
    }
  }

  else
  {
    if (v9)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    double v13 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v13)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

- (void)_unload
{
  double v3 = *(NSMutableDictionary **)((char *)&self->mLayout + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(NSMutableDictionary **)((char *)&self->mLayout + 1) = 0LL;
  }

  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v4 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        [v9 unload];
        [v9 cleanup];
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
  *(void *)(&self->mIsLoaded + 1) = 0LL;
  BYTE1(self->mMasks) = 0;
  double v10 = (id *)(&self->mIsTitle + 1);

  *double v10 = 0LL;
  v10[1] = 0LL;
}

@end