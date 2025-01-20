@interface MRTransitionCrossWipe
+ (void)initialize;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionCrossWipe

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionCrossWipe;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* source */ \n\t\tDeclareTexture1; /* target */ \n\t\tuniform mediump float\t\ttex2HeightInv; \n\t\tuniform mediump float\t\ttime; \n\t\tuniform mediump float\t\tbarHeight; \n\t\tuniform lowp float\t\t\tambientSource, ambientTarget; \n\t\tuniform lowp float\t\t\tbarLuminance; \n\t\tvarying mediump\tvec2\t\tvInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 sourceColor = SampleTexture0; \n            DoFilter0(sourceColor); \n\t\t\tlowp vec4 targetColor = SampleTexture1; \n            DoFilter1(targetColor); \n\t\t\tmediump float barBottom = (-barHeight + (1. + barHeight) * time); \n\t\t\tmediump float barTop = barBottom + barHeight; \n\t\t\t\t\t\tlowp vec4 color; \n\t\t\tif (vInSpriteCoordinates.t < barTop) { \n\t\t\t\t\tcolor = mix(targetColor, sourceColor, ambientSource*time) * time; \n\t\t\t\t\tif (vInSpriteCoordinates.t >= barBottom) { \n\t\t\t\t\t\t\tcolor.rgb += vec3(barLuminance); \n\t\t\t\t\t\t\tcolor.a *= .5; \n\t\t\t\t\t\t} \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tcolor = mix(sourceColor, targetColor, ambientTarget*time) * (1. - time); \n\t\t\t\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture01",
    @"TransitionCrossWipeVertical");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* source */ \n\t\tDeclareTexture1; /* target */ \n\t\tuniform mediump float\t\ttex2WidthInv; \n\t\tuniform mediump float\t\ttime; \n\t\tuniform mediump float\t\tbarWidth; \n\t\tuniform lowp float\t\t\tambientSource, ambientTarget; \n\t\tuniform lowp float\t\t\tbarLuminance; \n\t\tvarying mediump\tvec2\t\tvInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 sourceColor = SampleTexture0; \n            DoFilter0(sourceColor); \n\t\t\tlowp vec4 targetColor = SampleTexture1; \n            DoFilter1(targetColor); \n\t\t\tmediump float barLeft = (-barWidth + (1. + barWidth) * time); \n\t\t\tmediump float barRight = barLeft + barWidth; \n\t\t\t\t\t\tlowp vec4 color; \n\t\t\tif (vInSpriteCoordinates.s < barRight) { \n\t\t\t\t\tcolor = mix(targetColor, sourceColor, ambientSource*time) * time; \n\t\t\t\t\tif (vInSpriteCoordinates.s >= barLeft) { \n\t\t\t\t\t\t\tcolor.rgb += vec3(barLuminance); \n\t\t\t\t\t\t\tcolor.a *= .5; \n\t\t\t\t\t\t} \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tcolor = mix(sourceColor, targetColor, ambientTarget*time) * (1. - time); \n\t\t\t\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture01",
    @"TransitionCrossWipeHorizontal");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* source */ \n\t\tDeclareTexture1; /* target */ \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform mediump float\t\ttex2WidthInv, tex2HeightInv; \n\t\tuniform mediump float\t\ttime; \n\t\tuniform mediump float\t\tbarWidth, barHeight; \n\t\tuniform lowp float\t\t\tambientSource, ambientTarget; \n\t\tuniform lowp float\t\t\tbarLuminance; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 sourceColor = SampleTexture0; \n            DoFilter0(sourceColor); \n\t\t\tlowp vec4 targetColor = SampleTexture1; \n            DoFilter1(targetColor); \n\t\t\tmediump float barBottom = (-barHeight + (1. + barHeight) * time); \n\t\t\tmediump float barTop = barBottom + barHeight; \n\t\t\tmediump float barLeft = (-barWidth + (1. + barWidth) * time); \n\t\t\tmediump float barRight = barLeft + barWidth; \n\t\t\tmediump vec2 barLeftBottom = vec2(barLeft, barBottom), barRightTop = vec2(barRight, barTop); \n\t\t\t\t\t\tlowp vec4 color; \n\t\t\tif (all(lessThan(vInSpriteCoordinates, barLeftBottom))) \n\t\t\t\tcolor = mix(targetColor, sourceColor, ambientSource*time) * time; \n\t\t\telse if (all(greaterThanEqual(vInSpriteCoordinates, barRightTop))) \n\t\t\t\tcolor = mix(sourceColor, targetColor, ambientTarget*time) * (1. - time); \n\t\t\telse \n\t\t\t\tcolor = vec4(0); \n\t\t\t\t\t\tif ((vInSpriteCoordinates.s >= barLeft) && (vInSpriteCoordinates.s < barRight)) { \n\t\t\t\t\tcolor.rgb += vec3(barLuminance); \n\t\t\t\t\tcolor.a *= .5; \n\t\t\t\t} \n\t\t\tif ((vInSpriteCoordinates.t >= barBottom) && (vInSpriteCoordinates.t < barTop)) { \n\t\t\t\t\tcolor.rgb += vec3(barLuminance); \n\t\t\t\t\tcolor.a *= .5; \n\t\t\t\t} \n\t\t\t\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture01",
    @"TransitionCrossWipeVerticalHorizontal");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = v9;
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  id v12 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSourceLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v14 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mTargetLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  unsigned int v15 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"moveVertically"),  "BOOLValue");
  unsigned int v16 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"moveHorizontally"),  "BOOLValue");
  v17 = @"TransitionCrossWipeVertical";
  if (v16) {
    v17 = @"TransitionCrossWipeVerticalHorizontal";
  }
  if (v15) {
    v18 = v17;
  }
  else {
    v18 = @"TransitionCrossWipeHorizontal";
  }
  [a4 setShader:v18];
  LODWORD(v19) = 0;
  [a4 setShaderUniformFloat:@"ambientSource" forKey:v19];
  LODWORD(v20) = 1045220557;
  [a4 setShaderUniformFloat:@"ambientTarget" forKey:v20];
  LODWORD(v21) = 1032805417;
  [a4 setShaderUniformFloat:@"barLuminance" forKey:v21];
  if (v16)
  {
    LODWORD(v22) = 1036831949;
    [a4 setShaderUniformFloat:@"barWidth" forKey:v22];
  }

  if (v15)
  {
    LODWORD(v22) = 0.25;
    [a4 setShaderUniformFloat:@"barHeight" forKey:v22];
  }

  *(float *)&double v22 = a3;
  [a4 setShaderUniformFloat:@"time" forKey:v22];
  if (v12)
  {
    *(float *)&double v23 = v10;
    [v12 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v25 state:v23];
  }

  if (v14)
  {
    *(float *)&double v23 = v10;
    [v14 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v24 state:v23];
  }

  [a4 blend:2];
  v28[0] = -1082130432;
  *(float *)&v28[1] = 1.0 / v10;
  v28[2] = -1082130432;
  float v29 = -(float)(1.0 / v10);
  int v30 = 1065353216;
  float v31 = 1.0 / v10;
  int v32 = 1065353216;
  float v33 = v29;
  [a4 setVertex2DPointer:v28];
  v27[0] = xmmword_1FC240;
  v27[1] = unk_1FC250;
  [a4 setTextureCoordinatesPointer:v27 onTextureUnit:0];
  [a4 setTextureCoordinatesPointer:v27 onTextureUnit:1];
  v26[0] = xmmword_1FC260;
  v26[1] = unk_1FC270;
  [a4 setInSpriteCoordinatesPointer:v26];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetInSpriteCoordinatesPointer];
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a4 unsetVertexPointer];
  [v14 unsetOnContext:a4 onTextureUnit:1 state:&v24];
  [v14 releaseByUser];
  [v12 unsetOnContext:a4 onTextureUnit:0 state:&v25];
  [v12 releaseByUser];
  [a4 blend:0];
  [a4 unsetShader];
}

@end