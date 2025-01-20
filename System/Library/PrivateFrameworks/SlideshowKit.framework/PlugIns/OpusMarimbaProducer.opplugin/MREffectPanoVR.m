@interface MREffectPanoVR
- (BOOL)getVerticesCoordinates:(MREffectPanoVR *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectPanoVR)init;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectPanoVR

- (MREffectPanoVR)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectPanoVR;
  v2 = -[MREffectPanoVR init](&v4, "init");
  if (v2)
  {
    *(void *)(v2 + 225) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(CGPoint *)(v2 + 185) = CGPointZero;
  }

  return (MREffectPanoVR *)v2;
}

- (void)_cleanup
{
  *(void *)(&self->mIsPanning + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___MREffectPanoVR;
    -[MREffect setPixelSize:](&v4, "setPixelSize:");
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectPanoVR;
  -[MREffect prerenderForTime:inContext:withArguments:](&v6, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  id v10 = [v9 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [a4 setShader:@"PlainTexture"];
  [v9 imageAspectRatio];
  *(float *)&a3 = v11;
  [a4 localAspectRatio];
  double v13 = 2.0 / v12 * *(float *)&a3;
  double v14 = v13 * -0.5;
  if (v14 >= v13 * 0.5) {
    double v14 = v13 * 0.5;
  }
  *(double *)(&self->super._isInInteractiveMode + 1) = v14;
  objc_msgSend(*(id *)(&self->mIsPanning + 1), "renderImage:inContext:atPosition:andSize:", v10, a4);
  [a4 unsetShader];
  [v10 releaseByUser];
  [a4 restoreModelViewMatrix:v15];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)(&self->mIsPanning + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"image0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectPanoVR *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"image0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)(&self->mIsPanning + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (double)pzrStart:(id)a3
{
  BYTE1(self->mStartCenter.y) = 1;
  *(_OWORD *)((char *)&self->mCenter.y + 1) = *(_OWORD *)(&self->super._isInInteractiveMode + 1);
  return *((double *)a3 + 1);
}

- (double)pzrUpdate:(id)a3
{
  if (BYTE1(self->mStartCenter.y))
  {
    v3.f64[0] = -*((double *)a3 + 4);
    v3.f64[1] = *((float64_t *)a3 + 5);
    *(float64x2_t *)(&self->super._isInInteractiveMode + 1) = vmlaq_f64( *(float64x2_t *)((char *)&self->mCenter.y + 1),  (float64x2_t)self->super.mPixelSize,  v3);
  }

  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  BYTE1(self->mStartCenter.y) = 0;
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  BYTE1(self->mStartCenter.y) = 0;
  *(_OWORD *)(&self->super._isInInteractiveMode + 1) = *(_OWORD *)((char *)&self->mCenter.y + 1);
  return 0.0;
}

@end