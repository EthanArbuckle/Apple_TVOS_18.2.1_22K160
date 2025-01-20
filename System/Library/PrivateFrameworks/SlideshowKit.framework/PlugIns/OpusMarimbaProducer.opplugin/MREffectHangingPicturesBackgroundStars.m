@interface MREffectHangingPicturesBackgroundStars
+ (void)initialize;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectHangingPicturesBackgroundStars)initWithEffectID:(id)a3;
- (void)_cleanup;
- (void)_initStars;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectHangingPicturesBackgroundStars

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectHangingPicturesBackgroundStars;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tattribute mediump vec3 aAttributes; \n\t\tvarying mediump vec3 vAttributes; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tvAttributes = aAttributes; \n\t\t} \n\t\t",
    @"VertexHangingPicturesStar");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tvarying mediump vec3 vAttributes; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tcolor = min(vAttributes.y * color + vAttributes.z, 1.); \n\t\t\tgl_FragColor = color * vAttributes.x; \n\t\t} \n\t\t",
    @"VertexHangingPicturesStar",
    @"HangingPicturesStarNoColor");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tDeclareForeColorU; \n\t\tvarying mediump vec3 vAttributes; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tcolor = min(vAttributes.y * color + vAttributes.z, 1.); \n\t\t\tgl_FragColor = uColor * color * vAttributes.x; \n\t\t} \n\t\t",
    @"VertexHangingPicturesStar",
    @"HangingPicturesStar");
}

- (MREffectHangingPicturesBackgroundStars)initWithEffectID:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundStars;
  v3 = -[MREffect initWithEffectID:](&v9, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v5 = [v4 descriptionForEffectID:*((void *)v3 + 4)];
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    id v6 = objc_msgSend( objc_msgSend(v5, "objectForKey:", @"imageProviderInfo"),  "objectForKey:",  @"background");
    objc_msgSend( *(id *)(v3 + 217),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v6, "objectForKey:", @"imageName")));
    objc_msgSend(*(id *)(v3 + 217), "setImageSizeScript:", objc_msgSend(v6, "objectForKey:", @"imageSizeScript"));
    [*(id *)(v3 + 217) setWantsMipmap:0];
    objc_msgSend(*(id *)(v3 + 217), "setOriginalImageSize:", 3840.0, 2400.0);
    *(void *)(v3 + 225) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    id v7 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"imageProviderInfo"), "objectForKey:", @"star1");
    objc_msgSend( *(id *)(v3 + 225),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  objc_msgSend(v7, "objectForKey:", @"imageName")));
    objc_msgSend(*(id *)(v3 + 225), "setImageSizeScript:", objc_msgSend(v7, "objectForKey:", @"imageSizeScript"));
    [*(id *)(v3 + 225) setWantsMipmap:1];
    objc_msgSend(*(id *)(v3 + 225), "setOriginalImageSize:", 150.0, 150.0);
  }

  return (MREffectHangingPicturesBackgroundStars *)v3;
}

- (void)_cleanup
{
  *(float **)((char *)&self->mStarsAttributes + 1) = 0LL;
  [*(id *)((char *)&self->mBackgroundImageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBackgroundImageProvider + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundStars;
    -[MREffect setPixelSize:](&v7, "setPixelSize:", a3.width, a3.height);
    objc_msgSend(*(id *)((char *)&self->mStarsAttributes + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mBackgroundImageProvider + 1), "setDefaultSize:", width, height);
  }

- (void)_initStars
{
  id v3 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  *(void *)(&self->super._isInInteractiveMode + 1) = malloc(0x1680uLL);
  *($A26157C7E9E89F42FF5DE05795E35374 **)((char *)&self->mStars + 1) = ($A26157C7E9E89F42FF5DE05795E35374 *)malloc(0x1680uLL);
  *(float **)((char *)&self->mStarsVertices + 1) = (float *)malloc(0x1680uLL);
  *(float **)((char *)&self->mStarsTexCoords + 1) = (float *)malloc(0x21C0uLL);
  uint64_t v4 = 0x3FFFFFFFFFFFFA60LL;
  __asm { FMOV            V9.2S, #1.0 }

  __int128 v25 = xmmword_1F8060;
  do
  {
    uint64_t v10 = *(void *)(&self->super._isInInteractiveMode + 1) + v4 * 4;
    objc_msgSend(v3, "randomFloatInRange::", 0.01, 0.075, v25);
    *(float *)&double v11 = v11;
    *(_DWORD *)(v10 + 5760) = LODWORD(v11);
    [v3 randomFloatInRange:0.0 :6.28318531];
    *(float *)&double v12 = v12;
    *(_DWORD *)(v10 + 5764) = LODWORD(v12);
    float v13 = *(float *)(v10 + 5760);
    __float2 v14 = __sincosf_stret(*(float *)&v12);
    *(float *)(v10 + 5768) = v13 * v14.__cosval;
    *(float *)(v10 + 5772) = v13 * v14.__sinval;
    float v15 = 1.41421356 / v13;
    *(float *)(v10 + 5796) = v15;
    [v3 randomFloatInRange:0.0 :v15 * 0.25];
    *(float *)&double v16 = v16;
    *(_DWORD *)(v10 + 5800) = LODWORD(v16);
    [v3 randomFloatInRange:*(float *)(v10 + 5760) * -5.0 :*(float *)(v10 + 5760) * 5.0];
    *(float *)&double v17 = v17;
    *(_DWORD *)(v10 + 5792) = LODWORD(v17);
    [v3 randomFloatInRange:0.0 :*(float *)(v10 + 5796)];
    *(float *)&double v18 = v18;
    *(_DWORD *)(v10 + 5804) = LODWORD(v18);
    [v3 randomFloatInRange:0.1 :0.316];
    *(float *)&double v19 = v19;
    double v20 = (float)(*(float *)&v19 * *(float *)&v19);
    [v3 randomFloatInRange:0.0 :0.003 / v20];
    *(float *)&double v21 = v21;
    *(_DWORD *)(v10 + 5780) = LODWORD(v21);
    [v3 randomFloatInRange:v20 + v20 :v20 * 10.0];
    *(float *)&double v22 = v22;
    *(_DWORD *)(v10 + 5784) = LODWORD(v22);
    *(float *)&double v22 = v20 * 0.4;
    *(_DWORD *)(v10 + 5776) = LODWORD(v22);
    [v3 randomFloatInRange:0.3 :0.5];
    *(float *)&double v23 = v23;
    *(_DWORD *)(v10 + 5788) = LODWORD(v23);
    v24 = &(*(float **)((char *)&self->mStarsVertices + 1))[v4];
    v24[1444] = 0.0;
    *((_OWORD *)v24 + 360) = 0u;
    v24[1451] = 1.0;
    *(void *)(v24 + 1449) = _D9;
    *(_OWORD *)(v24 + 1445) = v25;
    v4 += 12LL;
  }

  while (v4 * 4);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectHangingPicturesBackgroundStars;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)((char *)&self->mStarsAttributes + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mBackgroundImageProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(void *)(&self->super._isInInteractiveMode + 1)
    || (-[MREffectHangingPicturesBackgroundStars _initStars](self, "_initStars"),
        *(void *)(&self->super._isInInteractiveMode + 1)))
  {
    float v9 = *(float *)[a4 foreColor] * 0.72;
    *(float *)&unsigned int v10 = *(float *)[a4 foreColor] * 0.76;
    double v11 = *(float *)[a4 foreColor] * 0.9;
    *(float *)&double v12 = v11;
    LODWORD(v13) = 1.0;
    *(float *)&double v11 = v9;
    [a4 setBackColorRed:v40 green:v11 blue:COERCE_DOUBLE(v10 | 0x3FECCCCC00000000) alpha:v12 saveTo:v13];
    [a4 clear:1];
    [a5 unalteredTime];
    double v38 = v14;
    [a4 blend:4];
    id v15 = [*(id *)((char *)&self->mBackgroundImageProvider + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    [v15 setClampMode:2];
    else {
      double v16 = @"HangingPicturesStar";
    }
    [a4 setShader:v16];
    uint64_t v17 = *(void *)(&self->super._isInInteractiveMode + 1);
    uint64_t v18 = *(uint64_t *)((char *)&self->mStarsTexCoords + 1);
    double v19 = *(float **)((char *)&self->mStars + 1);
    [a4 localAspectRatio];
    uint64_t v20 = 0LL;
    double v22 = (float)(1.0 / v21);
    double v23 = (float *)(v17 + 24);
    int v24 = 120;
    do
    {
      float v25 = fmod(v38 + v23[5], v23[3]);
      float v26 = *(v23 - 4) * v25;
      float v27 = *(v23 - 3) * v25;
      float v28 = *(v23 - 1);
      double v29 = *(v23 - 2);
      float v30 = (v25 + v25) * 3.14159265 * v23[2];
      *(float *)&double v31 = sinf(v30);
      float v32 = ((float)(v28 * *(float *)&v31) + 1.0) * v29;
      double v33 = fabsf(v27) - v32;
      if (fabsf(v26) - v32 < 1.0 && v33 < v22)
      {
        float v35 = fmin((float)(v25 - v23[4]), 1.0) * *v23;
        if (v35 > 0.0)
        {
          double v36 = (float)(*(float *)&v31 * v23[1]) + 1.0;
          double v31 = v36 + v36;
          *(float *)&double v31 = v31;
          *(float *)uint64_t v18 = v35;
          *(_DWORD *)(v18 + 4) = LODWORD(v31);
          float v37 = (*(float *)&v31 + -1.0) * 0.15;
          if (v37 > 0.0) {
            float v37 = 0.0;
          }
          *(float *)(v18 + 8) = v37;
          *(float *)(v18 + 12) = v35;
          *(_DWORD *)(v18 + 16) = LODWORD(v31);
          *(float *)(v18 + 20) = v37;
          ++v20;
          *(float *)(v18 + 24) = v35;
          *(_DWORD *)(v18 + 28) = LODWORD(v31);
          *(float *)(v18 + 32) = v37;
          *(float *)(v18 + 36) = v35;
          *(_DWORD *)(v18 + 40) = LODWORD(v31);
          *(float *)(v18 + 44) = v37;
          *(float *)(v18 + 48) = v35;
          *(_DWORD *)(v18 + 52) = LODWORD(v31);
          *(float *)(v18 + 56) = v37;
          *(float *)(v18 + 60) = v35;
          *(_DWORD *)(v18 + 64) = LODWORD(v31);
          *(float *)(v18 + 68) = v37;
          v18 += 72LL;
          *double v19 = v26 - v32;
          v19[1] = v27 - v32;
          v19[2] = v26 - v32;
          v19[3] = v27 - v32;
          v19[4] = v26 - v32;
          v19[5] = v27 + v32;
          v19[6] = v26 + v32;
          v19[7] = v27 - v32;
          v19[8] = v26 + v32;
          v19[9] = v27 + v32;
          v19[10] = v26 + v32;
          v19[11] = v27 + v32;
          v19 += 12;
        }
      }

      v23 += 12;
      --v24;
    }

    while (v24);
    LODWORD(v31) = 0;
    [v15 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v39 state:v31];
    [a4 setTextureCoordinatesPointer:*(float **)((char *)&self->mStarsVertices + 1) onTextureUnit:0];
    [a4 setVertexAttributePointer:*(float **)((char *)&self->mStarsTexCoords + 1) ofSize:3 forKey:@"aAttributes"];
    [a4 setVertex2DPointer:*($A26157C7E9E89F42FF5DE05795E35374 **)((char *)&self->mStars + 1)];
    [a4 drawTriangleStripFromOffset:0 count:6 * v20];
    [a4 unsetVertexPointer];
    [a4 unsetVertexAttributePointerForKey:@"aAttributes"];
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v15 unsetOnContext:a4 onTextureUnit:0 state:&v39];
    [a4 unsetShader];
    [v15 releaseByUser];
    [a4 blend:0];
    [a4 restoreBackColor:v40];
  }

- (void)_unload
{
  id v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v3)
  {
    free(v3);
    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  uint64_t v4 = *($A26157C7E9E89F42FF5DE05795E35374 **)((char *)&self->mStars + 1);
  if (v4)
  {
    free(v4);
    *($A26157C7E9E89F42FF5DE05795E35374 **)((char *)&self->mStars + 1) = 0LL;
  }

  id v5 = *(float **)((char *)&self->mStarsVertices + 1);
  if (v5)
  {
    free(v5);
    *(float **)((char *)&self->mStarsVertices + 1) = 0LL;
  }

  id v6 = *(float **)((char *)&self->mStarsTexCoords + 1);
  if (v6)
  {
    free(v6);
    *(float **)((char *)&self->mStarsTexCoords + 1) = 0LL;
  }

@end