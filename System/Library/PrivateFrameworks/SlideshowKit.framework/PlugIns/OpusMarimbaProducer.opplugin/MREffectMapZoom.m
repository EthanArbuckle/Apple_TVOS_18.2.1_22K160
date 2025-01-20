@interface MREffectMapZoom
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectMapZoom)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectMapZoom

- (MREffectMapZoom)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectMapZoom;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"shadow.png"));
    [*(id *)(v3 + 193) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 3360.0, 2100.0);
  }

  return (MREffectMapZoom *)v3;
}

- (void)_cleanup
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = *(void **)(&self->super._isInInteractiveMode + 1);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) cleanup];
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];
  [*(id *)((char *)&self->mTileProviders + 1) cleanup];

  *(NSMutableArray **)((char *)&self->mTileProviders + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectMapZoom;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mTileProviders + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v3)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unsigned int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) isLoaded];
        if (!v9) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }

    else
    {
LABEL_10:
      LOBYTE(v9) = [*(id *)((char *)&self->mTileProviders + 1) isLoaded];
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!*(void *)(&self->super._isInInteractiveMode + 1))
  {
    *(void *)(&self->super._isInInteractiveMode + 1) =  +[NSMutableArray array]( &OBJC_CLASS___NSMutableArray,  "array");
    uint64_t v9 = (uint64_t)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"tileSet"),  "integerValue");
    __int128 v10 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"zoomKind"),  "integerValue");
    uint64_t v11 = 11LL;
    if (v10 == (_BYTE *)&dword_0 + 2) {
      uint64_t v11 = 7LL;
    }
    if (v10 == (_BYTE *)&dword_0 + 1) {
      uint64_t v11 = 4LL;
    }
    if (!v10) {
      uint64_t v11 = 2LL;
    }
    uint64_t v45 = v11;
    v42 = v10;
    if (!v10)
    {
      uint64_t v12 = 0LL;
      __int128 v13 = @"land%d.jpg";
      BOOL v14 = v9 == 4 || v9 < 3;
      if (v9 != 4) {
        __int128 v13 = 0LL;
      }
      v43 = v13;
      double v15 = dbl_1F80D0[v9 > 2];
      do
      {
        v16 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        if (v14) {
          v17 = v43;
        }
        else {
          v17 = @"water.jpg";
        }
        -[MRImageProvider setAssetPath:]( v16,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, ++v12)));
        -[MRImageProvider setImageSizeScript:]( v16,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.5,layerHeight * .5");
        -[MRImageProvider setOriginalImageSize:](v16, "setOriginalImageSize:", v15, v15);
        -[MRImageProvider setDefaultSize:]( v16,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
        [*(id *)(&self->super._isInInteractiveMode + 1) addObject:v16];
      }

      while (v45 != v12);
    }

    v18 = @"land%d.jpg";
    v19 = v42;
    switch(v9)
    {
      case 0LL:
        goto LABEL_31;
      case 1LL:
        v18 = @"landLakes%d.jpg";
        goto LABEL_31;
      case 2LL:
        v18 = @"landGreen%d.jpg";
        goto LABEL_31;
      case 3LL:
        v18 = @"landLeft%d.jpg";
        goto LABEL_31;
      case 4LL:
        v18 = @"landRight%d.jpg";
        goto LABEL_31;
      case 5LL:
        v18 = @"landTop%d.jpg";
        goto LABEL_31;
      case 6LL:
        v18 = @"landBottom%d.jpg";
        goto LABEL_31;
      case 7LL:
        v18 = @"water.jpg";
        goto LABEL_31;
      case 8LL:
        uint64_t v34 = 0LL;
        uint64_t v35 = 1LL;
        do
        {
          unint64_t v36 = v34 + 1;
          v37 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
          v38 = @"landRight%d.jpg";
          if (((v34 + 1) & 0x7FFFFFFFFFFFFFFELL) == 6) {
            v38 = @"water.jpg";
          }
          uint64_t v39 = v34 + 7;
          if (v36 > 5) {
            uint64_t v39 = v35;
          }
          else {
            v38 = @"landLeft%d.jpg";
          }
          if (v42 == (_BYTE *)&dword_0 + 1) {
            v40 = @"shortWater%d.jpg";
          }
          else {
            v40 = v38;
          }
          if (v42 == (_BYTE *)&dword_0 + 1) {
            uint64_t v41 = v35;
          }
          else {
            uint64_t v41 = v39;
          }
          -[MRImageProvider setAssetPath:]( v37,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v41)));
          -[MRImageProvider setImageSizeScript:]( v37,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.5,layerHeight * .5");
          -[MRImageProvider setOriginalImageSize:]( v37,  "setOriginalImageSize:",  dbl_1F80D0[((v34 + 1) & 0x7FFFFFFFFFFFFFFELL) == 6],  dbl_1F80D0[((v34 + 1) & 0x7FFFFFFFFFFFFFFELL) == 6]);
          -[MRImageProvider setDefaultSize:]( v37,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
          [*(id *)(&self->super._isInInteractiveMode + 1) addObject:v37];

          ++v35;
          ++v34;
        }

        while (v45 != v36);
        break;
      default:
        v18 = 0LL;
        v19 = v42;
LABEL_31:
        BOOL v20 = v9 == 4 && v19 == (_BYTE *)&dword_0 + 1;
        int v21 = v20;
        int v44 = v21;
        unint64_t v22 = 1LL;
        do
        {
          v23 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
          v24 = @"water.jpg";
          if (v9 != 4 || v22 >= 8) {
            v24 = v18;
          }
          if (v44) {
            v25 = v18;
          }
          else {
            v25 = v24;
          }
          unint64_t v26 = v22 + 7;
          if (!v44) {
            unint64_t v26 = v22;
          }
          -[MRImageProvider setAssetPath:]( v23,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v26)));
          -[MRImageProvider setImageSizeScript:]( v23,  "setImageSizeScript:",  @"layerHeight*imageAspectRatio*.5,layerHeight * .5");
          if (v9 == 7 || v9 == 4 && v22 < 8) {
            double v27 = 1000.0;
          }
          else {
            double v27 = 2000.0;
          }
          -[MRImageProvider setOriginalImageSize:](v23, "setOriginalImageSize:", v27, v27);
          -[MRImageProvider setDefaultSize:]( v23,  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
          [*(id *)(&self->super._isInInteractiveMode + 1) addObject:v23];

          BOOL v20 = v22++ == v45;
        }

        while (!v20);
        break;
    }
  }

  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___MREffectMapZoom;
  -[MREffect prerenderForTime:inContext:withArguments:](&v50, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v28 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v29 = [v28 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * (void)i) prerenderForTime:a4 inContext:a5 withArguments:a3];
      }

      id v30 = [v28 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v30);
  }

  [*(id *)((char *)&self->mTileProviders + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (v9 > 1.5) {
    float v10 = 35.0;
  }
  else {
    float v10 = 28.0;
  }
  MRMatrix_Clear((uint64_t)v47);
  MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v47, 0.0, -v10, 0.0);
  *(float *)&double v11 = MRMatrix_Translate(v47, 0.0, 0.2, 0.0);
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v47, v46, v11);
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double mMainDuration = self->super.mMainDuration;
  double mPhaseOutDuration = self->super.mPhaseOutDuration;
  double v15 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction"),  "integerValue");
  unint64_t v16 = (unint64_t)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"zoomKind"),  "integerValue");
  if (v16 > 2) {
    uint64_t v17 = 11LL;
  }
  else {
    uint64_t v17 = qword_1F80F0[v16];
  }
  else {
    v18 = @"PlainTexture";
  }
  [a4 setShader:v18];
  double v19 = a3 / (mPhaseInDuration + mMainDuration + mPhaseOutDuration);
  switch((unint64_t)v15)
  {
    case 0uLL:
    case 2uLL:
      BOOL v20 = v15 == 0LL;
      BOOL v21 = v15 == 0LL;
      if (v20) {
        uint64_t v22 = 1LL;
      }
      else {
        uint64_t v22 = -1LL;
      }
      [a4 localAspectRatio];
      uint64_t v23 = 0LL;
      int v24 = dword_1F80C0[v21];
      double v26 = v25 * 2.8;
      double v27 = v19 * (v26 * (double)(v17 - 1));
      do
      {
        id v28 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectAtIndex:", v23),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
        [v28 setClampMode:2];
        if (v27 >= v26 * (double)(v23 - 2) && v27 < v26 * (double)(v23 + 2))
        {
          LODWORD(v29) = v24;
          +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  v28,  a4,  0.0,  (v26 * (double)v23 + 0.0 - v27) * (double)v22,  2.8,  v26,  v29);
        }

        [v28 releaseByUser];
        ++v23;
      }

      while (v17 != v23);
      break;
    case 1uLL:
    case 3uLL:
      [a4 localAspectRatio];
      uint64_t v32 = 0LL;
      if (v15 == (_BYTE *)&dword_0 + 1) {
        uint64_t v33 = 1LL;
      }
      else {
        uint64_t v33 = -1LL;
      }
      double v34 = (double)v33;
      double v35 = v31 + v31;
      double v36 = (double)v33 * 0.0;
      double v37 = v19 * ((double)(v17 - 1) + (double)(v17 - 1));
      if (v15 == (_BYTE *)&dword_0 + 1) {
        float v38 = 0.0;
      }
      else {
        float v38 = 3.1416;
      }
      do
      {
        id v39 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectAtIndex:", v32),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
        [v39 setClampMode:2];
        if (v37 >= (double)(v32 - 2) + (double)(v32 - 2) && v37 < (double)(v32 + 2) + (double)(v32 + 2))
        {
          *(float *)&double v40 = v38;
          +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  v39,  a4,  (v36 + (double)v32 * 2.0 - v37) * v34,  0.0,  2.0,  v35,  v40);
        }

        [v39 releaseByUser];
        ++v32;
      }

      while (v17 != v32);
      break;
    default:
      break;
  }

  [a4 blend:2];
  MRMatrix_Clear((uint64_t)v45);
  MRMatrix_Clear((uint64_t)v44);
  MRMatrix_Translate(v45, 0.0, -0.2, 0.0);
  MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v44, 0.0, v10, 0.0);
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v45, v43, MRMatrix_PostMultiply((uint64_t)v45, v44));
  id v42 = [*(id *)((char *)&self->mTileProviders + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v42,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
  [v42 releaseByUser];
  [a4 restoreModelViewMatrix:v45];
  [a4 unsetShader];
  [a4 restoreModelViewMatrix:v46];
  [a4 blend:0];
}

- (void)_unload
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = *(void **)(&self->super._isInInteractiveMode + 1);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) unload];
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mTileProviders + 1) unload];
}

@end