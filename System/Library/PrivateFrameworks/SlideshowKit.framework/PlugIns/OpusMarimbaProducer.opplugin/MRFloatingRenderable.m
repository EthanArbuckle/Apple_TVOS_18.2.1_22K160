@interface MRFloatingRenderable
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
+ (void)initialize;
- (MRImage)slide;
- (void)dealloc;
- (void)purge;
- (void)setSlide:(id)a3;
@end

@implementation MRFloatingRenderable

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B0648;
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRFloatingRenderable;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tuniform highp vec4\t\t\tshadow; /* this is shadowSize, shadowHardness */ \n\t\tuniform highp vec2\t\t\tinvRadii; \n\t\tvarying lowp vec2\t\t\tborderAlphaXY; \n\t\tvarying lowp vec2\t\t\tshadowStrengthXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\thighp vec2 absP1 = abs(shadow.xy * aTextureCoordinates0.st * .5); \n\t\t\thighp vec2 absP2 = absP1 * (1. / shadow.xy); \n\t\t\tborderAlphaXY = 1. + (.5 - absP1) * invRadii; \n\t\t\tshadowStrengthXY = 1. + (absP2 - .5) * shadow.zw; \n\t\t} \n\t\t",
    @"VertexFloating");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tconst lowp vec4\t\t\t\tshadowColor = vec4(0., 0., 0., .6); \n\t\tvarying lowp vec2\t\t\tborderAlphaXY; \n\t\tvarying lowp vec2\t\t\tshadowStrengthXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp float borderAlpha = min(borderAlphaXY.x, borderAlphaXY.y); \n\t\t\tlowp float shadowStrength = 1. - smoothstep(0., 1., length(max(shadowStrengthXY, 0.))); \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = mix(vec4(shadowColor.rgb, shadowColor.a * shadowStrength), color, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexFloating",
    @"FragmentFloating");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tuniform highp vec2\t\t\tinvRadii; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\thighp vec2 borderAlphaXY = (invRadii * .5 - abs(aTextureCoordinates0.st * invRadii * .5)); \n\t\t\tborderAlpha = borderAlphaXY.x, borderAlphaXY.y; \n\t\t} \n\t\t",
    @"VertexFloatingSoft");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = color * clamp(borderAlpha, 0., 1.); \n\t\t} \n\t\t",
    @"VertexFloatingSoft",
    @"FragmentFloatingSoft");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRFloatingRenderable;
  -[MRFloatingRenderable dealloc](&v3, "dealloc");
}

- (void)purge
{
  self->slide = 0LL;
  self->next = 0LL;
}

- (void)setSlide:(id)a3
{
  slide = self->slide;
  if (slide != a3)
  {
    -[MRImage releaseByUser](slide, "releaseByUser");
    self->slide = (MRImage *)[a3 retainByUser];
  }

- (MRImage)slide
{
  return self->slide;
}

@end