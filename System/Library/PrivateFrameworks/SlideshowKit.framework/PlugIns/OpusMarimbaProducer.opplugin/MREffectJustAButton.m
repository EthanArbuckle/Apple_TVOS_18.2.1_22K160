@interface MREffectJustAButton
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setLiveAttributes:(id)a3;
@end

@implementation MREffectJustAButton

- (void)setLiveAttributes:(id)a3
{
  *(&self->super._isInInteractiveMode + 1) = objc_msgSend( objc_msgSend(a3, "objectForKey:", @"isPressed"),  "unsignedIntegerValue") != 0;
  *(&self->super._isInInteractiveMode + 2) = objc_msgSend( objc_msgSend(a3, "objectForKey:", @"isSet"),  "unsignedIntegerValue") != 0;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (a5) {
    *a5 = a3;
  }
  return @"image0";
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectJustAButton;
  -[MREffect prerenderForTime:inContext:withArguments:](&v6, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v9 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  v10 = v9;
  if (!*(&self->super._isInInteractiveMode + 2))
  {
    if (*(&self->super._isInInteractiveMode + 1))
    {
      id v12 = objc_msgSend( -[NSDictionary objectForKey:](v9, "objectForKey:", @"image2"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
      BOOL v13 = v12 == 0LL;
      if (v12) {
        goto LABEL_12;
      }
    }

    else
    {
      BOOL v13 = 0;
    }

    goto LABEL_11;
  }

  if (!*(&self->super._isInInteractiveMode + 1)
    || (id v11 = objc_msgSend( -[NSDictionary objectForKey:](v9, "objectForKey:", @"image3"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3)) == 0)
  {
    id v12 = objc_msgSend( -[NSDictionary objectForKey:](v10, "objectForKey:", @"image1"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    BOOL v13 = *(&self->super._isInInteractiveMode + 1);
    if (v12) {
      goto LABEL_12;
    }
LABEL_11:
    id v12 = objc_msgSend( -[NSDictionary objectForKey:](v10, "objectForKey:", @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    if (!v12) {
      return;
    }
    goto LABEL_12;
  }

  id v12 = v11;
  BOOL v13 = 0;
LABEL_12:
  [v12 setPreservesAspectRatio:0];
  [a4 blend:2];
  if (v13)
  {
    LODWORD(v14) = 1060320051;
    LODWORD(v17) = 1.0;
    LODWORD(v15) = 1060320051;
    LODWORD(v16) = 1060320051;
    [a4 composeForeColorRed:v20 green:v14 blue:v15 alpha:v16 saveTo:v17];
    [a4 setShader:@"PlainTexture"];
    LODWORD(v18) = 0;
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v12,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v18);
    [a4 unsetShader];
    [a4 restoreForeColor:v20];
  }

  else
  {
    [a4 setShader:@"PlainTexture"];
    LODWORD(v19) = 0;
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v12,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v19);
    [a4 unsetShader];
  }

  [a4 blend:0];
  [v12 releaseByUser];
}

@end