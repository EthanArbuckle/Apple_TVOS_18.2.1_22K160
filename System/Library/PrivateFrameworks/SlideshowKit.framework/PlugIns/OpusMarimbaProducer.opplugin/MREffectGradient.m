@interface MREffectGradient
+ (void)initialize;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectGradient

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectGradient;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = uColor + vec4(vec3(mod(mod((vInSpriteCoordinates.s*255.-1.)*(vInSpriteCoordinates.t*256.+1.), 10.2345678), .008)-.004), 0.); \n\t\t} \n\t\t",
    @"VertexCoordinates",
    @"DitheredGradient");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v27[0] = xmmword_1F5EA8;
  v27[1] = unk_1F5EB8;
  [a4 setVertex2DPointer:v27];
  v6 = (float *)[a4 foreColor];
  float v7 = v6[1];
  v12[0] = *v6;
  v12[1] = v7;
  int v8 = *((_DWORD *)v6 + 3);
  float v13 = v6[2];
  int v14 = v8;
  float v9 = v12[0] * 0.32;
  float v10 = v7 * 0.32;
  float v15 = v9;
  float v16 = v10;
  float v11 = v13 * 0.32;
  float v17 = v11;
  int v18 = v8;
  float v19 = v12[0];
  float v20 = v7;
  float v21 = v13;
  int v22 = v8;
  float v23 = v9;
  float v24 = v10;
  float v25 = v11;
  int v26 = v8;
  [a4 setColorsPointer:v12];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetColorsPointer];
  [a4 unsetVertexPointer];
  [a4 unsetShader];
}

@end