@interface MREffectFilmStrip
- (BOOL)getVerticesCoordinates:(MREffectFilmStrip *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (MREffectFilmStrip)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectFilmStrip

- (MREffectFilmStrip)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectFilmStrip;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3) {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return (MREffectFilmStrip *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v9 = ImageKey(0LL);
  id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v9);
  [v10 imageAspectRatio];
  double v12 = v11;
  [a4 localAspectRatio];
  float v14 = v13;
  double y = CGPointZero.y;
  id v16 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v16 setUsesBackgroundColorAsBorderColor:1];
  v17 = *(void **)(&self->super._isInInteractiveMode + 1);
  v18 = (MRCroppingSprite *)[v17 objectForKey:v9];
  if (!v18)
  {
    v18 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v17 setObject:v18 forKey:v9];
  }

  float v19 = fmin(v12, 1.7777778);
  double v20 = 1.6 / v14 * v19;
  [a4 setShader:@"PlainTexture"];
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( v18,  "renderImage:inContext:atPosition:andSize:",  v16,  a4,  CGPointZero.x,  y,  v20,  1.6);
  [a4 unsetShader];
  [v16 releaseByUser];
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
    float v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            float v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            float v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectFilmStrip *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
}

@end