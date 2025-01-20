@interface MREffectScrapbookTitle
- (BOOL)getVerticesCoordinates:(MREffectScrapbookTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isAlphaFriendly;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectScrapbookTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderEffectTitle2AtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderEffectTitleAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectScrapbookTitle

- (MREffectScrapbookTitle)initWithEffectID:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MREffectScrapbookTitle;
  v3 = -[MREffect initWithEffectID:](&v26, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v5 = objc_msgSend( objc_msgSend(v4, "descriptionForEffectID:", *((void *)v3 + 4)),  "objectForKey:",  @"imageProviderInfo");
    *(void *)(v3 + 225) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (id *)(v3 + 185);
    *(_OWORD *)(v3 + 185) = 0u;
    *(_OWORD *)(v3 + 201) = 0u;
    *(void *)(v3 + 217) = 0LL;
    if ([*((id *)v3 + 4) hasSuffix:@"Title"])
    {
      id v7 = [v5 objectForKey:@"picFrame"];
      id *v6 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *v6,  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v7, "objectForKey:", @"imageName")));
      objc_msgSend(*v6, "setImageSizeScript:", objc_msgSend(v7, "objectForKey:", @"imageSizeScript"));
      objc_msgSend(*v6, "setOriginalImageSize:", 576.0, 460.0);
      id v8 = [v5 objectForKey:@"picMask"];
      *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v8, "objectForKey:", @"imageName")));
      objc_msgSend( *(id *)(v3 + 193),  "setImageSizeScript:",  objc_msgSend(v8, "objectForKey:", @"imageSizeScript"));
      objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 762.0, 608.0);
      id v9 = [v5 objectForKey:@"deckleEdgeFramePortrait"];
      *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v9, "objectForKey:", @"imageName")));
      objc_msgSend( *(id *)(v3 + 201),  "setImageSizeScript:",  objc_msgSend(v9, "objectForKey:", @"imageSizeScript"));
      double v10 = 784.0;
      double v11 = 998.0;
      objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 784.0, 998.0);
      v12 = @"deckleEdgeFrameMaskPortrait";
    }

    else
    {
      if (![*((id *)v3 + 4) hasSuffix:@"Title2"])
      {
        id v22 = [v5 objectForKey:@"tornFrame"];
        id *v6 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        objc_msgSend( *v6,  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v22, "objectForKey:", @"imageName")));
        objc_msgSend(*v6, "setImageSizeScript:", objc_msgSend(v22, "objectForKey:", @"imageSizeScript"));
        objc_msgSend(*v6, "setOriginalImageSize:", 1710.0, 1480.0);
        id v23 = [v5 objectForKey:@"tornFrameMask"];
        *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v23, "objectForKey:", @"imageName")));
        objc_msgSend( *(id *)(v3 + 193),  "setImageSizeScript:",  objc_msgSend(v23, "objectForKey:", @"imageSizeScript"));
        objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 1710.0, 1480.0);
        id v24 = [v5 objectForKey:@"deckleEdgeFramePortrait"];
        *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v24, "objectForKey:", @"imageName")));
        objc_msgSend( *(id *)(v3 + 201),  "setImageSizeScript:",  objc_msgSend(v24, "objectForKey:", @"imageSizeScript"));
        objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 784.0, 998.0);
        id v25 = [v5 objectForKey:@"deckleEdgeFrameMaskPortrait"];
        *(void *)(v3 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        objc_msgSend( *(id *)(v3 + 209),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v25, "objectForKey:", @"imageName")));
        objc_msgSend( *(id *)(v3 + 209),  "setImageSizeScript:",  objc_msgSend(v25, "objectForKey:", @"imageSizeScript"));
        objc_msgSend(*(id *)(v3 + 209), "setOriginalImageSize:", 784.0, 998.0);
        id v17 = [v5 objectForKey:@"tornPaper"];
        *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        v18 = (id *)(v3 + 217);
        double v19 = 1159.0;
        double v20 = 1416.0;
LABEL_7:
        objc_msgSend( *v18,  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v17, "objectForKey:", @"imageName")));
        objc_msgSend(*v18, "setImageSizeScript:", objc_msgSend(v17, "objectForKey:", @"imageSizeScript"));
        objc_msgSend(*v18, "setOriginalImageSize:", v20, v19);
LABEL_8:
        *(void *)(v3 + 233) = 0LL;
        *(void *)(v3 + 241) = 0LL;
        return (MREffectScrapbookTitle *)v3;
      }

      id v13 = [v5 objectForKey:@"picFrame"];
      id *v6 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *v6,  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v13, "objectForKey:", @"imageName")));
      objc_msgSend(*v6, "setImageSizeScript:", objc_msgSend(v13, "objectForKey:", @"imageSizeScript"));
      objc_msgSend(*v6, "setOriginalImageSize:", 576.0, 460.0);
      id v14 = [v5 objectForKey:@"picMask"];
      *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v14, "objectForKey:", @"imageName")));
      objc_msgSend( *(id *)(v3 + 193),  "setImageSizeScript:",  objc_msgSend(v14, "objectForKey:", @"imageSizeScript"));
      objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 762.0, 608.0);
      id v15 = [v5 objectForKey:@"picFramePortrait"];
      *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v15, "objectForKey:", @"imageName")));
      objc_msgSend( *(id *)(v3 + 201),  "setImageSizeScript:",  objc_msgSend(v15, "objectForKey:", @"imageSizeScript"));
      double v10 = 645.0;
      double v11 = 806.0;
      objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 645.0, 806.0);
      v12 = @"picMaskPortrait";
    }

    id v16 = [v5 objectForKey:v12];
    *(void *)(v3 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 209),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v16, "objectForKey:", @"imageName")));
    objc_msgSend(*(id *)(v3 + 209), "setImageSizeScript:", objc_msgSend(v16, "objectForKey:", @"imageSizeScript"));
    objc_msgSend(*(id *)(v3 + 209), "setOriginalImageSize:", v10, v11);
    id v17 = [v5 objectForKey:@"tanPaper"];
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    v18 = (id *)(v3 + 217);
    double v19 = 1374.0;
    double v20 = 1651.0;
    goto LABEL_7;
  }

  return (MREffectScrapbookTitle *)v3;
}

- (void)_cleanup
{
  uint64_t v3 = 0LL;
  id v4 = &self->super._isInInteractiveMode + 1;
  do
  {
    id v5 = *(void **)&v4[v3];
    if (v5) {
      [v5 cleanup];
    }
    v3 += 8LL;
  }

  while (v3 != 40);

  *(MRImageProvider **)((char *)&self->mImageProviders[4] + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MREffectScrapbookTitle;
    -[MREffect setPixelSize:](&v10, "setPixelSize:", a3.width, a3.height);
    uint64_t v7 = 0LL;
    id v8 = &self->super._isInInteractiveMode + 1;
    do
    {
      id v9 = *(void **)&v8[v7];
      if (v9) {
        objc_msgSend(v9, "setDefaultSize:", width, height);
      }
      v7 += 8LL;
    }

    while (v7 != 40);
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  MRMatrix_Clear((uint64_t)v30);
  MRMatrix_Translate(v30, *(float *)((char *)&self->mTextImage0 + 1), *(float *)((char *)&self->mTextImage0 + 5), 0.0);
  MRMatrix_Invert(v30, v31);
  double v10 = MRMatrix_PreMultiply(a4, (uint64_t)v31);
  double v11 = @"text0";
  if ((objc_msgSend( objc_msgSend( *(id *)((char *)&self->mImageProviders[4] + 1),  "objectForKey:",  @"text0",  v10),  "hitAtPoint:withInverseMatrix:localPoint:",  v31,  a5,  x,  y) & 1) == 0)
  {
    double v11 = @"text1";
    if ((objc_msgSend( objc_msgSend(*(id *)((char *)&self->mImageProviders[4] + 1), "objectForKey:", @"text1"),  "hitAtPoint:withInverseMatrix:localPoint:",  v31,  a5,  x,  y) & 1) == 0)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      v12 = *(MRImageProvider **)((char *)&self->mImageProviders[4] + 1);
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v13) {
        return 0LL;
      }
      id v14 = v13;
      double v11 = 0LL;
      uint64_t v15 = *(void *)v26;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(__CFString **)(*((void *)&v25 + 1) + 8LL * (void)v16);
          if (-[__CFString hasPrefix:](v17, "hasPrefix:", @"image"))
          {
            id v18 = [*(id *)((char *)&self->mImageProviders[4] + 1) objectForKey:v17];
            if (v18 && objc_msgSend(v18, "hitAtPoint:withInverseMatrix:localPoint:", v31, &v24, x, y))
            {
              if (v11)
              {
                double v19 = (char *)-[__CFString compare:](v17, "compare:", v11);
                if (v19 == (_BYTE *)&dword_0 + 1) {
                  double v20 = v17;
                }
                else {
                  double v20 = v11;
                }
                if (v19 != (_BYTE *)&dword_0 + 1 || a5 == 0LL) {
                  id v17 = (__CFString *)v20;
                }
                else {
LABEL_26:
                }
                  *a5 = v24;
              }

              else if (a5)
              {
                goto LABEL_26;
              }
            }

            else
            {
              id v17 = (__CFString *)v11;
            }

            double v11 = v17;
          }

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v22 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        id v14 = v22;
      }

      while (v22);
    }
  }

  return (id)v11;
}

- (BOOL)getVerticesCoordinates:(MREffectScrapbookTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  __int128 v8 = *((_OWORD *)a4 + 1);
  __int128 v15 = *(_OWORD *)a4;
  __int128 v16 = v8;
  __int128 v9 = *((_OWORD *)a4 + 3);
  __int128 v17 = *((_OWORD *)a4 + 2);
  *(_OWORD *)id v18 = v9;
  *(float *)&__int128 v8 = *(float *)((char *)&self->mTextImage0 + 5) + *((float *)&v9 + 1);
  v18[0] = *(float *)((char *)&self->mTextImage0 + 1) + *(float *)&v9;
  LODWORD(v18[1]) = v8;
  if (objc_msgSend( a5,  "isEqualToString:",  @"text0",  v15,  v16,  v17,  *(void *)v18,  *((void *)&v9 + 1)))
  {
    double v10 = *(MRImageProvider **)((char *)&self->mImageProviders[4] + 1);
    double v11 = @"text0";
  }

  else
  {
    unsigned int v12 = [a5 isEqualToString:@"text1"];
    double v10 = *(MRImageProvider **)((char *)&self->mImageProviders[4] + 1);
    if (!v12)
    {
      id v13 = [v10 objectForKey:a5];
      if (!v13) {
        return (char)v13;
      }
      goto LABEL_6;
    }

    double v11 = @"text1";
  }

  id v13 = [v10 objectForKey:v11];
LABEL_6:
  LOBYTE(v13) = [v13 getVerticesCoordinates:a3 withMatrix:&v15];
  return (char)v13;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isAlphaFriendly
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MREffectScrapbookTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v13, "prerenderForTime:inContext:withArguments:");
  uint64_t v9 = 0LL;
  double v10 = &self->super._isInInteractiveMode + 1;
  do
  {
    double v11 = *(void **)&v10[v9];
    if (v11) {
      [v11 prerenderForTime:a4 inContext:a5 withArguments:a3];
    }
    v9 += 8LL;
  }

  while (v9 != 40);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mNeedsToUpdateSlides)
  {
    self->super.mNeedsToUpdateSlides = 0;
    [*(id *)((char *)&self->mImageProviders[4] + 1) removeAllObjects];
  }

  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title"))
  {
    -[MREffectScrapbookTitle renderEffectTitleAtTime:inContext:withArguments:]( self,  "renderEffectTitleAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title2") {
         || -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle"))
  }
  {
    -[MREffectScrapbookTitle renderEffectTitle2AtTime:inContext:withArguments:]( self,  "renderEffectTitle2AtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  __int128 v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  uint64_t v9 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v7)
  {
    if (!v9) {
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mSprites + 1) setTruncate:1];
    [*(id *)((char *)&self->mSprites + 1) setMaxNumberOfLines:3];
    unsigned int v10 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title");
    double v11 = 1.9;
    if (!v10) {
      double v11 = 2.5;
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefinedSize:",  self->super.mPixelSize.width / v11,  self->super.mPixelSize.height * 0.5);
    [*(id *)((char *)&self->mSprites + 1) setText:v7];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setScale:");
    unsigned int v12 = (CGContext *)[*(id *)((char *)&self->mSprites + 1) retainedContext];
    if (v12)
    {
      objc_super v13 = v12;
      id v14 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v12);
      *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = v14;
      -[MRTextRenderer setLabel:](v14, "setLabel:", @"Marimba Scrapbook Title");
      CGContextRelease(v13);
    }
  }

  else
  {
    if (v9)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
    }

    [*(id *)((char *)&self->mImageProviders[4] + 1) removeObjectForKey:@"text0"];
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  unsigned int v4 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title");
  double v5 = 1.9;
  if (!v4) {
    double v5 = 2.5;
  }
  double v6 = self->super.mPixelSize.width / v5;
  double v7 = self->super.mPixelSize.height * 0.5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_unload
{
  uint64_t v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  unsigned int v4 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v4)
  {
    [v4 cleanup];

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  }

  for (uint64_t i = 0LL; i != 40; i += 8LL)
  {
    double v6 = *(void **)(&self->super._isInInteractiveMode + i + 1);
    if (v6) {
      [v6 unload];
    }
  }

  [*(id *)((char *)&self->mImageProviders[4] + 1) removeAllObjects];
}

- (void)renderEffectTitleAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v122 = v8;
  double v9 = self->super.mDefaultMainDuration * a3 / (self->super.mPhaseInDuration + self->super.mMainDuration);
  double v121 = v9;
  if (v9 >= 4.5)
  {
    double v17 = v9 + -4.5;
    double v18 = (v9 + -4.5) * -0.23597 + -0.08403;
    if (v9 >= 5.5) {
      double v18 = -0.32;
    }
    float v19 = v18;
    double v11 = (float *)((char *)&self->mTextImage0 + 1);
    *(float *)((char *)&self->mTextImage0 + 1) = v19;
    double v20 = v17 * 0.86524 + -0.04524;
    if (v9 >= 5.5) {
      double v20 = 0.82;
    }
    float v21 = v20;
    objc_super v13 = (float *)((char *)&self->mTextImage0 + 5);
    *(float *)((char *)&self->mTextImage0 + 5) = v21;
    if (v9 < 5.5)
    {
      float v23 = v17 * (v17 * 0.16);
      double v16 = v23;
      float v14 = 1.0;
      double v15 = 0.0;
      goto LABEL_16;
    }
  }

  else
  {
    float v10 = v9 * -0.12281 / 4.5 + 0.03878;
    double v11 = (float *)((char *)&self->mTextImage0 + 1);
    *(float *)((char *)&self->mTextImage0 + 1) = v10;
    float v12 = v9 * -0.07756 / 4.5 + 0.03232;
    objc_super v13 = (float *)((char *)&self->mTextImage0 + 5);
    *(float *)((char *)&self->mTextImage0 + 5) = v12;
    if (v9 < 5.5)
    {
      float v14 = 1.0;
      double v15 = 0.0;
      double v16 = 0.0;
      goto LABEL_16;
    }
  }

  if (v9 >= 13.0)
  {
    double v15 = 0.0500000007;
    float v14 = 1.057;
  }

  else
  {
    float v14 = (v9 + -5.5) * 0.057 / 7.5 + 1.0;
    float v22 = (v9 + -5.5) * 0.05 / 7.5 + 0.0;
    double v15 = v22;
  }

  if (v9 >= 4.5) {
    double v16 = 0.159999996;
  }
  else {
    double v16 = 0.0;
  }
LABEL_16:
  CGPoint v24 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
  p_isa = (id *)&self->super.super.isa;
  if ([*(id *)((char *)&self->mImageProviders[4] + 1) count])
  {
    double v25 = v14;
    __int128 v26 = &xmmword_1F7000;
  }

  else
  {
    v112 = v13;
    v113 = v11;
    [a4 localAspectRatio];
    double v27 = MRCGPointRotatedByRadians(v16 * -0.25 + -0.595, v16 + 0.27, 0.24435);
    double v29 = v28;
    [a4 localAspectRatio];
    double v31 = v30 * 0.765;
    v32 = objc_alloc(&OBJC_CLASS___MRCroppingSprite);
    LODWORD(v33) = 1048196573;
    v34 = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( v32,  "initWithPosition:size:zRotation:context:",  a4,  v27,  v29,  0.585,  v31,  v33);
    [*(id *)((char *)&self->mImageProviders[4] + 1) setObject:v34 forKey:@"image0"];

    uint64_t v35 = 0LL;
    double v115 = v15;
    double v124 = 0.35 - v15;
    double v123 = v14 * 1.275;
    double v114 = v14;
    double v119 = v14 * 0.9435;
    do
    {
      float v36 = flt_1F7B90[v35] * 0.017453;
      [a4 localAspectRatio];
      double v38 = v37 * -0.81;
      [a4 localAspectRatio];
      double v40 = v119 * v39;
      v41 = objc_alloc(&OBJC_CLASS___MRCroppingSprite);
      *(float *)&double v42 = v36;
      v43 = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( v41,  "initWithPosition:size:zRotation:context:",  a4,  v124,  v38,  v123,  v40,  v42);
      -[MRCroppingSprite setInnerRect:](v43, "setInnerRect:", 0.1245, 0.15, 0.756, 0.698);
      -[MRCroppingSprite setOuterRect:](v43, "setOuterRect:", 0.017, 0.022, 0.965, 0.956);
      [*(id *)((char *)&self->mImageProviders[4] + 1) setObject:v43, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"image%d", ++v35) forKey];
    }

    while (v35 != 4);
    double v25 = v114;
    double v15 = v115;
    __int128 v26 = &xmmword_1F7000;
    objc_super v13 = v112;
    double v11 = v113;
  }

  MRMatrix_Clear((uint64_t)v128);
  *(float *)&double v44 = MRMatrix_Translate(v128, *v11, *v13, 0.0);
  id v45 = a4;
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v128, v127, v44);
  v46 = p_isa;
  double v47 = a3;
  id v48 = [*(id *)((char *)p_isa + 217) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  v49 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
  [a4 localAspectRatio];
  double v51 = v50 * -0.2;
  [a4 localAspectRatio];
  LODWORD(v53) = -1102800887;
  v54 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v49,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  0.305 - v15,  v51,  v25 + v25,  v25 * 1.5 * v52,  v53,  0x3F747AE147AE147BLL,  0x3FAEB851EB851EB8LL,  0x3FEFBE76C8B43958LL,  0x3FEBF7CED916872BLL);
  -[MRTiledSprite setPreservesImageAspectRatio:](v54, "setPreservesImageAspectRatio:", 0LL);
  else {
    v55 = @"PlainTexture";
  }
  [a4 setShader:v55];
  -[MRTiledSprite renderImageInner:inContext:](v54, "renderImageInner:inContext:", v48, a4);
  [a4 blend:2];
  -[MRTiledSprite renderImageOuter:inContext:](v54, "renderImageOuter:inContext:", v48, a4);
  [a4 unsetShader];
  [a4 blend:0];

  [v48 releaseByUser];
  id v56 = objc_msgSend( objc_msgSend(objc_msgSend(p_isa[2], "slideProvidersForElementIDs"), "objectForKey:", @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  if (v56)
  {
    v57 = v56;
    id v58 = [v56 retainedByUserImage];
    [v58 setScale:0.905];
    id v59 = [*(id *)((char *)p_isa + 201) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    id v60 = [*(id *)((char *)p_isa + 209) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    +[MREffectScrapbook renderImage:withFrame:andMask:usingSprite:inContext:]( MREffectScrapbook,  "renderImage:withFrame:andMask:usingSprite:inContext:",  v58,  v59,  v60,  [*(id *)((char *)p_isa + 225) objectForKey:@"image0"],  a4);
    v61 = v60;
    id v45 = a4;
    [v61 releaseByUser];
    CGPoint v24 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    [v59 releaseByUser];
    [v58 releaseByUser];
    [v57 releaseByUser];
  }

  uint64_t v62 = 0LL;
  double v120 = 0.35 - v15;
  double v63 = v25 * 1.275;
  double v118 = v25 * *((double *)v26 + 316);
  v64 = (double *)&qword_1F7BA0;
  double v66 = v121;
  double v65 = v122;
  do
  {
    uint64_t v67 = v62 + 1;
    id v68 = -[AVAudioTimePitchAlgorithm stringWithFormat:]((id)v24[244], "stringWithFormat:", @"image%d", v62 + 1);
    double v70 = *v64;
    double v71 = v64[1];
    double v72 = 1.0;
    if (v71 > *v64 && v65 < v71)
    {
      if (v66 >= v71) {
        double v74 = v64[1];
      }
      else {
        double v74 = v66;
      }
      double v75 = v74 - v70;
      double v70 = v71 - v70;
      double v72 = v75 / v70;
    }

    float v76 = v72;
    if (v76 > 0.0)
    {
      if (v62) {
        v77 = 0LL;
      }
      else {
        v77 = v126;
      }
      LODWORD(v70) = 1.0;
      LODWORD(v71) = 1.0;
      LODWORD(v72) = 1.0;
      *(float *)&double v69 = v76;
      [v45 composeForeColorRed:v77 green:v70 blue:v71 alpha:v72 saveTo:v69];
      id v78 = [*(id *)((char *)p_isa + 185) retainedByUserRenderedImageAtTime:v45 inContext:a5 withArguments:v47];
      if (v62 == 3 || v66 < v64[3])
      {
        id v79 = objc_msgSend( objc_msgSend(objc_msgSend(v46[2], "slideProvidersForElementIDs"), "objectForKey:", v68),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  v45,  a5,  v47);
        if (v79)
        {
          v80 = v79;
          id v81 = [v79 retainedByUserImage];
          [v81 setScale:0.77];
          [v81 setCenterX:-0.01];
          [v81 setCenterY:0.005];
          [a4 localAspectRatio];
          double v83 = v82 * -0.81;
          [a4 localAspectRatio];
          double v85 = v118 * v84;
          float v86 = flt_1F7B90[v62] * 0.017453;
          id v87 = [*(id *)((char *)v46 + 225) objectForKey:v68];
          double v88 = v83;
          double v65 = v122;
          double v89 = v85;
          double v66 = v121;
          *(float *)&double v90 = v86;
          double v47 = a3;
          objc_msgSend(v87, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, v120, v88, v63, v89, v90);
          id v91 = a5;
          id v92 = [*(id *)((char *)p_isa + 193) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
          id v93 = v87;
          v46 = p_isa;
          +[MREffectScrapbook renderImage:withFrame:andMask:usingSprite:inContext:]( &OBJC_CLASS___MREffectScrapbook,  "renderImage:withFrame:andMask:usingSprite:inContext:",  v81,  v78,  v92,  v93,  a4);
          v94 = v92;
          a5 = v91;
          [v94 releaseByUser];
          [v81 releaseByUser];
          [v80 releaseByUser];
        }
      }

      else
      {
        [v45 blend:2];
        float v95 = flt_1F7B90[v62] * 0.017453;
        [v45 localAspectRatio];
        double v97 = v96 * -0.81;
        [v45 localAspectRatio];
        double v99 = v97;
        double v66 = v121;
        *(float *)&double v100 = v95;
        double v65 = v122;
        +[MREffectScrapbook renderDumbImage:inContext:atPosition:andSize:zRotation:withBorderRect:]( &OBJC_CLASS___MREffectScrapbook,  "renderDumbImage:inContext:atPosition:andSize:zRotation:withBorderRect:",  v78,  v45,  v120,  v99,  v63,  v118 * v98,  v100,  0x3FC0000000000000LL,  0x3FC3333333333333LL,  0x3FEC28F5C28F5C29LL,  0x3FEB22D0E5604189LL);
        [v45 blend:0];
      }

      [v78 releaseByUser];
      CGPoint v24 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      id v45 = a4;
    }

    objc_msgSend(objc_msgSend(*(id *)((char *)v46 + 225), "objectForKey:", v68), "setHitIsActive:", v76 >= 1.0);
    v64 += 2;
    uint64_t v62 = v67;
  }

  while (v67 != 4);
  [v45 restoreForeColor:v126];
  if (*(id *)((char *)v46 + 241))
  {
    v101 = *(id *)((char *)v46 + 225);
    v102 = (MRCroppingSprite *)[v101 objectForKey:@"text0"];
    if (!v102)
    {
      v102 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v101 setObject:v102 forKey:@"text0"];
    }

    [*(id *)((char *)v46 + 241) width];
    double v104 = v103 / *((double *)v46 + 12) + v103 / *((double *)v46 + 12);
    [*(id *)((char *)v46 + 241) height];
    double v106 = v105 / *((double *)v46 + 13) + v105 / *((double *)v46 + 13);
    [v45 localAspectRatio];
    double v108 = v106 * -0.35 + v107 * 0.327;
    if (objc_msgSend(objc_msgSend(v46[2], "editedElement"), "isEqualToString:", @"text0")
      && ([v46[2] _hideTextWhileEditing] & 1) != 0)
    {
      LODWORD(v109) = 1041168949;
      -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v102,  "fakeRenderInContext:atPosition:andSize:zRotation:",  v45,  v104 * 0.5 + -0.25,  v108 + v106 / 1.2 * 0.1,  v104,  v106,  v109);
    }

    else
    {
      [v45 blend:2];
      else {
        v110 = @"PlainTexture";
      }
      [v45 setShader:v110];
      LODWORD(v111) = 1041168949;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( v102,  "renderImage:inContext:atPosition:andSize:zRotation:",  *(id *)((char *)v46 + 241),  v45,  v104 * 0.5 + -0.25,  v108 + v106 / -1.2 * 0.1,  v104,  v106,  v111);
      [v45 unsetShader];
      [v45 blend:0];
    }
  }

  [v45 restoreModelViewMatrix:v127];
}

- (void)renderEffectTitle2AtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v6 = a3;
  double v8 = self->super.mDefaultMainDuration * a3 / (self->super.mPhaseInDuration + self->super.mMainDuration);
  if (v8 >= 6.0)
  {
    float v10 = (float *)((char *)&self->mTextImage0 + 1);
    *(_DWORD *)((char *)&self->mTextImage0 + 1) = 0;
    float v11 = 0.04;
  }

  else
  {
    float v9 = 0.05 - v8 * 0.05 / 6.0;
    float v10 = (float *)((char *)&self->mTextImage0 + 1);
    *(float *)((char *)&self->mTextImage0 + 1) = v9;
    float v11 = v8 * -0.01 / 6.0 + 0.05;
  }

  *(float *)((char *)&self->mTextImage0 + 5) = v11;
  unsigned int v12 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"aspect"),  "intValue");
  unsigned int v13 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle");
  if (v12)
  {
    [a4 localAspectRatio];
    double v15 = v14 * -0.025;
    double v16 = -0.7;
  }

  else
  {
    double v15 = 0.0;
    double v16 = -0.76;
  }

  [a4 localAspectRatio];
  double v17 = MRCGPointRotatedByRadians(v16, v15, 0.069813);
  if (v12) {
    unsigned int v19 = v13;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 == 1)
  {
    double v20 = v17 + 0.2;
    double v21 = v18 + 0.1;
  }

  else
  {
    int v22 = v13 ^ 1;
    if (v12) {
      int v22 = 1;
    }
    double v20 = v17 + 0.3;
    if (v22) {
      double v21 = v18;
    }
    else {
      double v21 = v18 + 0.05;
    }
  }

  [a4 localAspectRatio];
  float v24 = v23;
  unsigned int v88 = v13;
  if (![*(id *)((char *)&self->mImageProviders[4] + 1) count])
  {
    double v85 = v6;
    float v86 = v10;
    double v25 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    [a4 localAspectRatio];
    double v28 = (double *)((char *)&unk_1F7AA0 + 8 * (v12 != 0));
    if (v12) {
      double v29 = 0.875;
    }
    else {
      double v29 = 0.82;
    }
    BOOL v30 = v13 == 0;
    if (!v13) {
      double v28 = (double *)((char *)&unk_1F7AB0 + 8 * (v12 != 0));
    }
    double v84 = *v28 * v24;
    double v31 = (double *)((char *)&unk_1F7AC0 + 8 * (v12 != 0));
    if (!v13) {
      double v31 = (double *)((char *)&unk_1F7AD0 + 8 * (v12 != 0));
    }
    double v32 = *v31;
    double v33 = 1.3;
    if (v13)
    {
      *(float *)&double v27 = -0.05236;
    }

    else
    {
      double v33 = 1.9;
      *(float *)&double v27 = 0.10472;
    }

    if (v13) {
      double v34 = 0.25;
    }
    else {
      double v34 = -0.05;
    }
    double v35 = -0.07;
    double v36 = 0.0;
    if (v13)
    {
      double v37 = v29;
    }

    else
    {
      double v35 = 0.0;
      double v37 = dbl_1F7B40[v12 != 0];
    }

    if (v13) {
      double v38 = (double *)((char *)&unk_1F7B00 + 8 * (v12 != 0));
    }
    else {
      double v38 = (double *)((char *)&unk_1F7B30 + 8 * (v12 != 0));
    }
    if (v13) {
      float v39 = (double *)((char *)&unk_1F7AF0 + 8 * (v12 != 0));
    }
    else {
      float v39 = (double *)((char *)&unk_1F7B20 + 8 * (v12 != 0));
    }
    unsigned int v40 = v12;
    if (v30) {
      v41 = (double *)((char *)&unk_1F7B10 + 8 * (v12 != 0));
    }
    else {
      v41 = (double *)((char *)&unk_1F7AE0 + 8 * (v12 != 0));
    }
    double v42 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v25,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v34,  v35,  v33,  v26,  v27,  0x3F847AE147AE147BLL,  0x3FB1EB851EB851ECLL,  0x3FEF5C28F5C28F5CLL,  0x3FEB851EB851EB85LL);
    [*(id *)((char *)&self->mImageProviders[4] + 1) setObject:v42 forKey:@"tornPaper"];
    double v43 = *v41;
    double v44 = *v39;
    double v45 = *v38;
    -[MRTiledSprite setPreservesImageAspectRatio:](v42, "setPreservesImageAspectRatio:", 0LL);
    LODWORD(v46) = 1032780341;
    -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v42,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a4,  v20,  v21,  v32,  v84,  v46,  *(void *)&v43,  *(void *)&v44,  *(void *)&v45,  *(void *)&v37);

    double v47 = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( objc_alloc(&OBJC_CLASS___MRCroppingSprite),  "initWithPosition:size:zRotation:context:",  a4,  v20,  v21,  v32,  v84);
    id v48 = v47;
    if ((v19 & 1) != 0)
    {
      double v49 = 1.0;
      double v50 = 0.0;
      double v51 = 1.0;
    }

    else
    {
      double v51 = dbl_1F7B50[v40 != 0];
      double v49 = dbl_1F7B60[v40 != 0];
      double v50 = dbl_1F7B70[v40 != 0];
      double v36 = dbl_1F7B80[v40 != 0];
    }

    unsigned int v12 = v40;
    -[MRCroppingSprite setInnerRect:](v47, "setInnerRect:", v36, v50, v49, v51);
    -[MRCroppingSprite setOuterRect:](v48, "setOuterRect:", v43, v44, v45, v37);
    [*(id *)((char *)&self->mImageProviders[4] + 1) setObject:v48 forKey:@"image0"];

    unsigned int v13 = v88;
    float v10 = v86;
    double v6 = v85;
  }

  MRMatrix_Clear((uint64_t)v90);
  *(float *)&double v52 = MRMatrix_Translate(v90, *v10, *(float *)((char *)&self->mTextImage0 + 5), 0.0);
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v90, v89, v52);
  id v53 = [*(id *)((char *)&self->mImageProviders[3] + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v6];
  id v54 = [*(id *)((char *)&self->mImageProviders[4] + 1) objectForKey:@"tornPaper"];
  else {
    v55 = @"PlainTexture";
  }
  [a4 setShader:v55];
  [v54 renderImageInner:v53 inContext:a4];
  [a4 blend:2];
  [v54 renderImageOuter:v53 inContext:a4];
  [a4 unsetShader];
  [a4 blend:0];
  [v53 releaseByUser];
  id v56 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v6);
  if (v56)
  {
    v57 = v56;
    id v58 = [v56 retainedByUserImage];
    id v59 = v58;
    if (v12)
    {
      double v60 = 0.73;
      if (v13)
      {
        double v60 = 0.905;
        double v61 = 0.0;
      }

      else
      {
        double v61 = -0.01;
      }

      [v58 setScale:v60];
      [v59 setCenterX:v61];
      id v62 = [*(id *)((char *)&self->mImageProviders[1] + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v6];
      id v63 = [*(id *)((char *)&self->mImageProviders[2] + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v6];
      id v64 = [*(id *)((char *)&self->mImageProviders[4] + 1) objectForKey:@"image0"];
      double v65 = v59;
      id v66 = v62;
      id v67 = v63;
    }

    else
    {
      double v68 = 0.77;
      if (v13)
      {
        double v68 = 0.9;
        double v69 = 0.01;
      }

      else
      {
        double v69 = -0.01;
      }

      if (v13) {
        double v70 = 0.0;
      }
      else {
        double v70 = 0.005;
      }
      [v58 setScale:v68];
      [v59 setCenterX:v69];
      [v59 setCenterY:v70];
      id v63 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v6];
      id v62 = [*(id *)((char *)self->mImageProviders + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v6];
      id v64 = [*(id *)((char *)&self->mImageProviders[4] + 1) objectForKey:@"image0"];
      double v65 = v59;
      id v66 = v63;
      id v67 = v62;
    }

    +[MREffectScrapbook renderImage:withFrame:andMask:usingSprite:inContext:]( &OBJC_CLASS___MREffectScrapbook,  "renderImage:withFrame:andMask:usingSprite:inContext:",  v65,  v66,  v67,  v64,  a4);
    [v63 releaseByUser];
    [v62 releaseByUser];
    [v59 releaseByUser];
    [v57 releaseByUser];
    unsigned int v13 = v88;
  }

  if (*(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1))
  {
    double v71 = *(MRImageProvider **)((char *)&self->mImageProviders[4] + 1);
    double v72 = (MRCroppingSprite *)[v71 objectForKey:@"text0"];
    if (!v72)
    {
      double v72 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v71 setObject:v72 forKey:@"text0"];
    }

    [*(id *)((char *)&self->mTextRenderer0 + 1) width];
    double v74 = v73 / self->super.mPixelSize.width + v73 / self->super.mPixelSize.width;
    double v75 = v74 * 0.5 + 0.03;
    if (v13) {
      double v76 = v74 * 0.5 + 0.03;
    }
    else {
      double v76 = v74 * 0.5 + 0.1;
    }
    double v77 = v76 + -0.1;
    if (v12) {
      double v75 = v77;
    }
    if (v13) {
      double v78 = v75;
    }
    else {
      double v78 = v74 * 0.5 + 0.1;
    }
    [*(id *)((char *)&self->mTextRenderer0 + 1) height];
    double v80 = v79 / self->super.mPixelSize.height + v79 / self->super.mPixelSize.height;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v81) = 1032780341;
      -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v72,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  v78,  v80 / 1.2 * 0.1 + 0.04,  v74,  v80,  v81);
    }

    else
    {
      [a4 blend:2];
      else {
        float v82 = @"PlainTexture";
      }
      [a4 setShader:v82];
      LODWORD(v83) = 1032780341;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( v72,  "renderImage:inContext:atPosition:andSize:zRotation:",  *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1),  a4,  v78,  v80 / -1.2 * 0.1 + 0.04,  v74,  v80,  v83);
      [a4 unsetShader];
      [a4 blend:0];
    }
  }

@end