@interface MREffectHangingPicturesTitle
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectHangingPicturesTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectHangingPicturesTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
@end

@implementation MREffectHangingPicturesTitle

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectHangingPicturesTitle;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform mediump vec2\t\ta, b, invRadii; \n\t\tuniform lowp vec4\t\t\tborderColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tmediump vec2 p1 = vInSpriteCoordinates * a + b, absP1 = abs(p1); \n\t\t\tlowp vec4 color; \n\t\t\tif (all(lessThanEqual(absP1, vec2(.5)))) { \n\t\t\t\t\tmediump vec2 borderAlphaXY = 1. - (.5 - absP1) * invRadii; \n\t\t\t\t\tlowp float borderAlpha = clamp(max(borderAlphaXY.x, borderAlphaXY.y), 0., 1.); \n\t\t\t\t\tcolor = vec4(vec3(.85 - .4 * (vInSpriteCoordinates.x - .4) * (vInSpriteCoordinates.x - .4)), 1.); \n\t\t\t\t\tcolor = mix(color, borderColor, borderAlpha); \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tcolor = borderColor * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexCoordinates",
    @"HangingPicturesTitleBorder");
}

- (MREffectHangingPicturesTitle)initWithEffectID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesTitle;
  v3 = -[MREffect initWithEffectID:](&v7, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v5 = objc_msgSend( objc_msgSend( objc_msgSend(v4, "descriptionForEffectID:", *((void *)v3 + 4)),  "objectForKey:",  @"imageProviderInfo"),  "objectForKey:",  @"rope");
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v5, "objectForKey:", @"imageName")));
    objc_msgSend(*(id *)(v3 + 185), "setImageSizeScript:", objc_msgSend(v5, "objectForKey:", @"imageSizeScript"));
    [*(id *)(v3 + 185) setWantsMipmap:1];
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 300.0, 1440.0);
    *(void *)(v3 + 193) = 0LL;
  }

  return (MREffectHangingPicturesTitle *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  v3 = *(void **)((char *)&self->mEditedTextSize.height + 1);
  if (v3)
  {

    *(CGFloat *)((char *)&self->mEditedTextSize.height + 1) = 0.0;
  }

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  BOOL result = (!v4
         || ![v4 length]
         || (*(double *)((char *)&self->mTextRenderer + 1) == CGSizeZero.width
           ? (BOOL v5 = *(double *)((char *)&self->mTextSize.width + 1) == CGSizeZero.height)
           : (BOOL v5 = 0),
             !v5))
        && !self->super.mNeedsToUpdateTexts;
  return result;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  MRMatrix_Invert((float *)((char *)&self->mSprite + 1), v11);
  MRMatrix_MultiplyWithMatrix(a4, v11, v12);
  if (objc_msgSend( *(id *)((char *)&self->mEditedTextSize.height + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  v12,  a5,  x,  y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectHangingPicturesTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  *(float *)&double v7 = MRMatrix_MultiplyWithMatrix((float *)((char *)&self->mSprite + 1), a4, v9);
  return objc_msgSend( *(id *)((char *)&self->mEditedTextSize.height + 1),  "getVerticesCoordinates:withMatrix:",  a3,  v9,  v7);
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  if (v7)
  {
    v8 = v7;
    if (![v8 length]) {
      objc_msgSend( *(id *)((char *)&self->mRopeImageProvider + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mRopeImageProvider + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mRopeImageProvider + 1) setText:v8];
    [*(id *)((char *)&self->mRopeImageProvider + 1) setMaxNumberOfLines:1];
    objc_msgSend( *(id *)((char *)&self->mRopeImageProvider + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.550000012,  self->super.mPixelSize.height * 0.5);
    [*(id *)((char *)&self->mRopeImageProvider + 1) setTruncate:1];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mRopeImageProvider + 1), "setScale:");
    [*(id *)((char *)&self->mRopeImageProvider + 1) sizeOfContext];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v9;
    *(void *)((char *)&self->mTextSize.width + 1) = v10;
    v11 = (CGContext *)[*(id *)((char *)&self->mRopeImageProvider + 1) retainedContext];
    if (v11)
    {
      v12 = v11;
      id v13 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v11);
      *(void *)((char *)&self->mMatrix[14] + 1) = v13;
      [v13 setLabel:@"Marimba HangingPictures Title"];
      CGContextRelease(v12);
    }
  }

  else
  {
    v14 = *(MRImageProvider **)((char *)&self->mRopeImageProvider + 1);
    if (v14)
    {

      *(MRImageProvider **)((char *)&self->mRopeImageProvider + 1) = 0LL;
    }
  }

- (void)_unload
{
  v3 = *(MRImageProvider **)((char *)&self->mRopeImageProvider + 1);
  if (v3)
  {
    [v3 cleanup];

    *(MRImageProvider **)((char *)&self->mRopeImageProvider + 1) = 0LL;
  }

  [*(id *)((char *)&self->mMatrix[14] + 1) releaseByUser];
  *(void *)((char *)&self->mMatrix[14] + 1) = 0LL;
  id v4 = *(void **)((char *)&self->mEditedTextSize.height + 1);
  if (v4)
  {

    *(CGFloat *)((char *)&self->mEditedTextSize.height + 1) = 0.0;
  }

  CGSize v5 = CGSizeZero;
  *(CGSize *)((char *)&self->mTextSize.height + 1) = CGSizeZero;
  *(CGSize *)((char *)&self->mTextRenderer + 1) = v5;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.550000012;
  double v4 = self->super.mPixelSize.height * 0.150000006;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 1LL;
}

@end