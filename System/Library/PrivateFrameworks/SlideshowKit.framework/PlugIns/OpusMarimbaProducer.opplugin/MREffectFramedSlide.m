@interface MREffectFramedSlide
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectFramedSlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectFramedSlide)init;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_renderImage:(id)a3 withFrame:(id)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setLiveAttributes:(id)a3;
@end

@implementation MREffectFramedSlide

+ (void)initialize
{
  if ((byte_2B06B0 & 1) == 0)
  {
    v2.receiver = a1;
    v2.super_class = (Class)&OBJC_METACLASS___MREffectFramedSlide;
    objc_msgSendSuper2(&v2, "initialize");
    objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp vec4 frameColor = SampleTexture1; \n            DoFilter0(color); \n\t\t\tcolor.rgb = mix(color.rgb, frameColor.rgb, frameColor.a); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"FramedSlide");
    byte_2B06B0 = 1;
  }

- (MREffectFramedSlide)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectFramedSlide;
  objc_super v2 = -[MREffectFramedSlide init](&v4, "init");
  if (v2) {
    *(void *)(v2 + 185) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
  }
  return (MREffectFramedSlide *)v2;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectFramedSlide;
  -[MREffect setAttributes:](&v8, "setAttributes:", a3);
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setOuterRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:", 0.0, 0.0, 1.0, 1.0);
  objc_super v4 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"innerRect");
  BYTE1(self->mSprite) = v4 != 0LL;
  if (v4)
  {
    CGRect v9 = CGRectFromString(v4);
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setInnerRect:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height);
  }

  v5 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"outerRect");
  BYTE2(self->mSprite) = v5 != 0LL;
  if (v5)
  {
    int v6 = BYTE1(self->mSprite);
    CGRect v10 = CGRectFromString(v5);
    v7 = *(void **)(&self->super._isInInteractiveMode + 1);
    if (v6) {
      objc_msgSend(v7, "setOuterRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    }
    else {
      objc_msgSend(v7, "setInnerRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    }
  }

- (void)setLiveAttributes:(id)a3
{
  BYTE3(self->mSprite) = objc_msgSend( objc_msgSend(a3, "objectForKey:", @"isPlayable"),  "BOOLValue");
  BYTE4(self->mSprite) = objc_msgSend( objc_msgSend(a3, "objectForKey:", @"isPlaying"),  "BOOLValue");
  BYTE5(self->mSprite) = objc_msgSend( objc_msgSend(a3, "objectForKey:", @"isPressed"),  "BOOLValue");
}

- (BOOL)isNative3D
{
  return 1;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MREffectFramedSlide;
  -[MREffect prerenderForTime:inContext:withArguments:](&v13, "prerenderForTime:inContext:withArguments:", a4, a5);
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  if (BYTE3(self->mSprite) != [v7 canPlay]) {
    -[MRLayerEffect _setStateValue:forKey:]( self->super.mEffectLayer,  "_setStateValue:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 canPlay]),  @"isPlayable");
  }
  if (BYTE4(self->mSprite))
  {
    [v7 showTime];
    double v9 = v8;
    [v7 slideDuration];
    if (v9 + v10 <= a3)
    {
      BYTE4(self->mSprite) = 0;
      -[MRLayerEffect _setStateValue:forKey:]( self->super.mEffectLayer,  "_setStateValue:forKey:",  &__kCFBooleanFalse,  @"isPlaying");
    }

    if (BYTE4(self->mSprite)) {
      goto LABEL_10;
    }
  }

  if ([v7 isPlaying])
  {
    uint64_t v11 = 0LL;
LABEL_12:
    [v7 setIsPlaying:v11];
    return 0;
  }

  if (BYTE4(self->mSprite))
  {
LABEL_10:
    if (([v7 isPlaying] & 1) == 0)
    {
      uint64_t v11 = 1LL;
      goto LABEL_12;
    }
  }

  return 0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  int v10 = BYTE4(self->mSprite);
  id v11 = [v9 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  id v12 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [v12 setScale:1.0];
  [v12 setPreservesAspectRatio:0];
  -[MREffectFramedSlide _renderImage:withFrame:atTime:inContext:withArguments:]( self,  "_renderImage:withFrame:atTime:inContext:withArguments:",  v11,  v12,  a4,  a5,  a3);
  [v12 releaseByUser];
  [v11 releaseByUser];
  if (BYTE3(self->mSprite) && !BYTE4(self->mSprite))
  {
    if (BYTE5(self->mSprite)
      && (id v13 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  @"image3"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3)) != 0)
    {
      v14 = v13;
    }

    else
    {
      id v15 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image2"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
      if (!v15) {
        return;
      }
      v14 = v15;
      if (BYTE5(self->mSprite))
      {
        LODWORD(v16) = 0.5;
        LODWORD(v17) = 0.5;
        LODWORD(v18) = 0.5;
        LODWORD(v19) = 1.0;
        [a4 composeForeColorRed:v21 green:v16 blue:v17 alpha:v18 saveTo:v19];
        int v20 = 1;
LABEL_12:
        [a4 blend:2];
        [a4 setShader:@"PlainTexture"];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v14,  a4,  CGPointZero.x,  CGPointZero.y,  0.4,  self->super.mPixelSize.width * 0.4 / self->super.mPixelSize.height);
        [a4 unsetShader];
        [a4 blend:0];
        if (v20) {
          [a4 restoreForeColor:v21];
        }
        [v14 releaseByUser];
        return;
      }
    }

    int v20 = 0;
    goto LABEL_12;
  }

- (void)_renderImage:(id)a3 withFrame:(id)a4 atTime:(double)a5 inContext:(id)a6 withArguments:(id)a7
{
  if (a3 && a4 && BYTE2(self->mSprite))
  {
    id v11 = objc_msgSend(a3, "retainedByUserImage", a5);
    id v12 = *(void **)(&self->super._isInInteractiveMode + 1);
    if (BYTE1(self->mSprite)) {
      [v12 outerRect];
    }
    else {
      [v12 innerRect];
    }
    double v18 = v13;
    double v19 = v14;
    double v20 = v15;
    double v21 = v16;
    CGFloat v22 = self->super.mPixelSize.width * v15 / (v16 * self->super.mPixelSize.height);
    [a3 aspectRatio];
    if (v22 <= v23) {
      double v24 = v21;
    }
    else {
      double v24 = v20;
    }
    [v11 setScale:v24];
    [v11 scale];
    [v11 setCenterX:(1.0 - (v20 + v18 * 2.0)) / v25];
    [v11 scale];
    [v11 setCenterY:(1.0 - (v21 + v19 * 2.0)) / v26];
  }

  else
  {
    id v11 = objc_msgSend(a3, "retainByUser", a5);
  }

  if (BYTE1(self->mSprite))
  {
    [a6 setShader:@"PlainTexture"];
    LODWORD(v27) = 0;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v11,  a6,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v27);
    [a6 unsetShader];
  }

  if (a4)
  {
    LODWORD(v17) = 0;
    [a6 setImage:a4 onTextureUnit:1 withReferenceAspectRatio:&v33 state:v17];
    v28 = @"FramedSlide";
  }

  else
  {
    v28 = @"PlainTexture";
  }

  [a6 setShader:v28];
  if (!BYTE1(self->mSprite))
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    goto LABEL_21;
  }

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (!BYTE2(self->mSprite))
  {
LABEL_21:
    LODWORD(v29) = 0;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v11,  a6,  x,  y,  2.0,  2.0,  v29);
    goto LABEL_22;
  }

  LODWORD(v29) = 0;
  objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageMiddle:inContext:atPosition:andSize:zRotation:",  v11,  a6,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v29);
LABEL_22:
  [a6 unsetShader];
  if (a4)
  {
    [a6 unsetImage:a4 onTextureUnit:1 state:&v33];
    if (BYTE2(self->mSprite))
    {
      [a6 blend:2];
      [a6 setShader:@"PlainTexture"];
      LODWORD(v32) = 0;
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  a4,  a6,  x,  y,  2.0,  2.0,  v32);
      [a6 unsetShader];
      [a6 blend:0];
    }
  }

  [v11 releaseByUser];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"image0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectFramedSlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"image0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)(&self->super._isInInteractiveMode + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

@end