@interface MREffectBackgroundImage
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectBackgroundImage)initWithEffectID:(id)a3;
- (id)assetPath;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAssetPath:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectBackgroundImage

- (MREffectBackgroundImage)initWithEffectID:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectBackgroundImage;
  v4 = -[MREffect initWithEffectID:](&v10, "initWithEffectID:");
  if (v4)
  {
    if (([a3 hasPrefix:@"Scrapbook"] & 1) == 0)
    {
      *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      id v5 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
      id v6 = objc_msgSend( objc_msgSend( objc_msgSend(v5, "descriptionForEffectID:", *((void *)v4 + 4)),  "objectForKey:",  @"imageProviderInfo"),  "objectForKey:",  @"background");
      objc_msgSend( *(id *)(v4 + 185),  "setAssetPath:",  objc_msgSend( v5,  "resourcePathForEffectID:andResource:",  *((void *)v4 + 4),  objc_msgSend(v6, "objectForKey:", @"imageName")));
      objc_msgSend( *(id *)(v4 + 185),  "setImageSizeScript:",  objc_msgSend(v6, "objectForKey:", @"imageSizeScript"));
      CGSize v7 = CGSizeFromString((NSString *)[v6 objectForKey:@"originalImageSize"]);
      objc_msgSend(*(id *)(v4 + 185), "setOriginalImageSize:", v7.width, v7.height);
      id v8 = [v6 objectForKey:@"clampingMode"];
      *(void *)(v4 + 193) = v8;
    }
  }

  return (MREffectBackgroundImage *)v4;
}

- (void)_cleanup
{
  v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v3)
  {
    [v3 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  v4 = *(MRImageProvider **)((char *)&self->mImageProvider + 1);
  if (v4)
  {

    *(MRImageProvider **)((char *)&self->mImageProvider + 1) = 0LL;
  }

- (void)setPixelSize:(CGSize)a3
{
  if (*(void *)(&self->super._isInInteractiveMode + 1))
  {
    double height = a3.height;
    double width = a3.width;
    if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___MREffectBackgroundImage;
      -[MREffect setPixelSize:](&v7, "setPixelSize:", a3.width, a3.height);
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefaultSize:", width, height);
    }
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!*(void *)(&self->super._isInInteractiveMode + 1)) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectBackgroundImage;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  return [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(void *)(&self->super._isInInteractiveMode + 1))
  {
    [a4 localAspectRatio];
    float v10 = v9;
    id v11 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    if ([*(id *)((char *)&self->mImageProvider + 1) isEqualToString:@"MirroredRepeat"])
    {
      float v12 = 1.0 / v10;
      else {
        uint64_t v13 = 2LL;
      }
      [v11 setClampMode:v13];
      LODWORD(v14) = 0;
      [v11 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v75 state:v14];
      else {
        v15 = @"PlainTexture";
      }
      [a4 setShader:v15];
      unsigned int v16 = [v11 clampMode];
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = 1.0;
      [a4 setNormal:v17 :v18 :v19];
      if (v16 == 4)
      {
        v83[0] = -1082130432;
        *(float *)&v83[1] = -v12;
        v83[2] = -1082130432;
        *(float *)&v83[3] = v12;
        v83[4] = 1065353216;
        *(float *)&v83[5] = -v12;
        v83[6] = 1065353216;
        *(float *)&v83[7] = v12;
        objc_msgSend( v11,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
        *(float *)&double v20 = 2.0 / v20;
        uint64_t v76 = 0LL;
        int v77 = 0;
        *(float *)&double v21 = (v12 + v12) / v21;
        int v78 = LODWORD(v21);
        int v79 = LODWORD(v20);
        int v80 = 0;
        int v81 = LODWORD(v20);
        int v82 = LODWORD(v21);
        [a4 setTextureCoordinatesPointer:&v76 onTextureUnit:0];
        [a4 setVertex2DPointer:v83];
        [a4 drawTriangleStripFromOffset:0 count:4];
        [a4 unsetVertexPointer];
        [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      }

      else
      {
        uint64_t v24 = __chkstk_darwin( objc_msgSend( v11,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height));
        v26 = &v74[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
        __chkstk_darwin(v24);
        v32 = &v74[-v31];
        unint64_t v33 = 0LL;
        if (v30 > 0.0)
        {
          float v34 = v27;
          float v35 = v28;
          float v36 = -v12;
          double v37 = v35;
          v38 = v32 + 28;
          v39 = v26 + 28;
          float v40 = 0.0;
          while (1)
          {
            double v41 = (float)(v30 - v40) <= 1.0 ? (float)(v30 - v40) : 1.0;
            float v42 = v41;
            float v43 = v36 + v41 * v37;
            v44 = (float *)&v26[4 * v33];
            float *v44 = -1.0;
            v44[1] = v36;
            *(void *)&v32[4 * v33] = 0LL;
            uint64_t v45 = 4 * v33 + 8;
            *(_DWORD *)&v26[v45] = -1082130432;
            *(_DWORD *)&v32[v45] = 0;
            uint64_t v46 = 4 * v33 + 12;
            *(float *)&v26[v46] = v43;
            *(float *)&v32[v46] = v42;
            int v47 = 0;
            if (v29 <= 0.0)
            {
              unint64_t v58 = v33 + 4;
              float v49 = 0.0;
              float v50 = -1.0;
              float v57 = -1.0;
              float v55 = 0.0;
            }

            else
            {
              v48 = (float *)&v38[4 * v33];
              float v49 = 0.0;
              float v50 = -1.0;
              v51 = (float *)&v39[4 * v33];
              do
              {
                else {
                  double v52 = 1.0;
                }
                double v53 = fmax(v49 + 1.0 - v29, 0.0);
                if ((v47 & 1) != 0) {
                  double v54 = v53;
                }
                else {
                  double v54 = v52;
                }
                float v55 = v54;
                else {
                  double v56 = 1.0;
                }
                float v57 = v50 + v56 * v34;
                *(v48 - 3) = v55;
                *(v51 - 3) = v57;
                *(v51 - 2) = v36;
                *(v48 - 2) = 0.0;
                *(v48 - 1) = v55;
                float *v48 = v42;
                *(v51 - 1) = v57;
                float *v51 = v43;
                float v50 = v50 + v34;
                float v49 = v49 + 1.0;
                v47 ^= 1u;
                v33 += 4LL;
                v48 += 4;
                v51 += 4;
              }

              while (v49 < v29);
              unint64_t v58 = v33 + 4;
            }

            float v59 = v40 + 1.0;
            if (v59 >= v30) {
              break;
            }
            float v60 = v36 + v35;
            double v61 = fmax(v59 + 1.0 - v30, 0.0);
            double v62 = (float)(v30 - v59);
            if (v62 > 1.0) {
              double v62 = 1.0;
            }
            *(float *)&v26[4 * v58] = v57;
            *(float *)&v32[4 * v58] = v55;
            uint64_t v63 = 4 * v33;
            uint64_t v64 = v63 + 20;
            *(float *)&v26[v64] = v60;
            *(float *)&v32[v64] = v42;
            uint64_t v65 = v63 + 24;
            *(float *)&v26[v65] = v57;
            float v66 = v60 + v62 * v37;
            *(float *)&v32[v65] = v55;
            v63 += 28LL;
            *(float *)&v26[v63] = v66;
            float v67 = v61;
            *(float *)&v32[v63] = v67;
            float v68 = v49 + -1.0;
            unint64_t v33 = v58 + 4;
            if (v68 >= 0.0)
            {
              v69 = (float *)&v38[4 * v58];
              v70 = (float *)&v39[4 * v58];
              do
              {
                float v50 = v50 - v34;
                BOOL v71 = (v47 & 1) == 0;
                v47 ^= 1u;
                if (v71) {
                  float v72 = 1.0;
                }
                else {
                  float v72 = 0.0;
                }
                *(v70 - 3) = v50;
                *(v70 - 2) = v60;
                *(v69 - 3) = v72;
                *(v69 - 2) = v42;
                *(v70 - 1) = v50;
                float *v70 = v66;
                *(v69 - 1) = v72;
                float *v69 = v67;
                float v68 = v68 + -1.0;
                v33 += 4LL;
                v69 += 4;
                v70 += 4;
              }

              while (v68 >= 0.0);
            }

            float v36 = v60 + v35;
            float v40 = v59 + 1.0;
            if (v40 >= v30) {
              goto LABEL_46;
            }
          }

          unint64_t v33 = v58;
        }

- (id)assetPath
{
  id result = *(id *)(&self->super._isInInteractiveMode + 1);
  if (result) {
    return [result assetPath];
  }
  return result;
}

- (void)setAssetPath:(id)a3
{
  v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v3) {
    [v3 setAssetPath:a3];
  }
}

- (void)_unload
{
  v2 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v2) {
    [v2 unload];
  }
}

@end