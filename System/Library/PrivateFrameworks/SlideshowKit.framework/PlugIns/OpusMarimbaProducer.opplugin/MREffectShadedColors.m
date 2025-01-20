@interface MREffectShadedColors
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectShadedColors *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectShadedColors

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectShadedColors;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tuniform lowp vec4 primaryColor, secondaryColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = uColor * mix(secondaryColor, primaryColor, SampleTexture0.r); \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"ShadedColors");
}

- (void)setAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectShadedColors;
  -[MREffect setAttributes:](&v4, "setAttributes:", a3);
  CGRect v5 = CGRectFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"primaryColor"));
  *(float *)&v5.origin.x = v5.origin.x;
  *(float *)&v5.origin.y = v5.origin.y;
  *(_DWORD *)((char *)&self->_sprite + 1) = LODWORD(v5.origin.x);
  *(_DWORD *)((char *)&self->_sprite + 5) = LODWORD(v5.origin.y);
  *(float *)&v5.origin.x = v5.size.width;
  *(float *)&v5.origin.y = v5.size.height;
  *(float *)((char *)self->_primaryColor + 1) = *(float *)&v5.origin.x;
  *(float *)((char *)&self->_primaryColor[1] + 1) = *(float *)&v5.origin.y;
  CGRect v6 = CGRectFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"secondaryColor"));
  *(float *)&v6.origin.x = v6.origin.x;
  *(float *)&v6.origin.y = v6.origin.y;
  *(float *)((char *)&self->_primaryColor[2] + 1) = *(float *)&v6.origin.x;
  *(float *)((char *)&self->_primaryColor[3] + 1) = *(float *)&v6.origin.y;
  *(float *)&v6.origin.x = v6.size.width;
  *(float *)&v6.origin.y = v6.size.height;
  *(float *)((char *)self->_secondaryColor + 1) = *(float *)&v6.origin.x;
  *(float *)((char *)&self->_secondaryColor[1] + 1) = *(float *)&v6.origin.y;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!*(void *)(&self->super._isInInteractiveMode + 1))
  {
    v9 = objc_alloc(&OBJC_CLASS___MRCroppingSprite);
    LODWORD(v10) = 0;
    *(void *)(&self->super._isInInteractiveMode + 1) = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( v9,  "initWithPosition:size:zRotation:context:",  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v10);
  }

  id v11 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  if (v11)
  {
    v12 = v11;
    [v11 setScale:1.0];
    [v12 setCenterY:0.0];
    [v12 setCenterX:0.0];
    [a4 blend:2];
    [a4 setShader:@"ShadedColors"];
    LODWORD(v13) = *(_DWORD *)((char *)&self->_sprite + 1);
    LODWORD(v14) = *(_DWORD *)((char *)&self->_sprite + 5);
    *(float *)&double v15 = *(float *)((char *)self->_primaryColor + 1);
    *(float *)&double v16 = *(float *)((char *)&self->_primaryColor[1] + 1);
    [a4 setShaderUniformVec4:@"primaryColor" :v13 :v14 :v15 forKey:v16];
    *(float *)&double v17 = *(float *)((char *)&self->_primaryColor[2] + 1);
    *(float *)&double v18 = *(float *)((char *)&self->_primaryColor[3] + 1);
    *(float *)&double v19 = *(float *)((char *)self->_secondaryColor + 1);
    *(float *)&double v20 = *(float *)((char *)&self->_secondaryColor[1] + 1);
    [a4 setShaderUniformVec4:@"secondaryColor" :v17 :v18 :v19 forKey:v20];
    [*(id *)(&self->super._isInInteractiveMode + 1) renderImageInner:v12 inContext:a4];
    [a4 unsetShader];
    [a4 blend:0];
    [v12 releaseByUser];
  }

  else
  {
    [a4 setShader:@"PlainColor"];
    [a4 composeForeColor:(char *)&self->_sprite + 1 saveTo:v21];
    [*(id *)(&self->super._isInInteractiveMode + 1) renderImageInner:0 inContext:a4];
    [a4 restoreForeColor:v21];
    [a4 unsetShader];
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"color0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectShadedColors *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"color0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)(&self->super._isInInteractiveMode + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)_unload
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

@end