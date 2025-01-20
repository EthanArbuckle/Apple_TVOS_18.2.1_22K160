@interface affineGPUMetal
- (FigMetalContext)metalContext;
- (affineGPUMetal)initWithMetalContext:(id)a3;
- (id)_compileShader:(id)a3 fragment:(id)a4 pixelFormat:(unint64_t)a5 deltaMapPixelFormat:(unint64_t)a6 unstyledPixelFormat:(unint64_t)a7 constants:(id)a8;
- (int)_allocateSemanticStyleColorCubeTextures;
- (int)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 isTwoPass:(BOOL)a4 isOptimized:(BOOL)a5 textures:(id *)a6;
- (int)_duplicateBottomRowsOnPixelBuffer:(__CVBuffer *)a3;
- (int)_getTransformShaderParameters:(unint64_t)a3 isLuma:(BOOL)a4 isRGB:(BOOL)a5 isAttachment:(BOOL)a6 pixelRatio:(unsigned int *)a7 pipelineIndexToUse:(int *)a8;
- (int)_renderBlurInputTextures:(id *)a3 inputTexturesCount:(unsigned int)a4 outputTextures:(id *)a5;
- (int)_transformInputPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 ltmLUT:(id)a5 isAttachment:(BOOL)a6 commandBuffer:(id)a7;
- (int)getBlurBuffersDecimationFactor;
- (int)renderWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 pixelBufferValidRect:(CGRect *)a5 ltmLUT:(id)a6 outputPixelBuffer:(__CVBuffer *)a7 isAttachmentRendering:(BOOL)a8;
- (int)renderWithSampleBuffer:(opaqueCMSampleBuffer *)a3 pixelBufferValidRect:(CGRect *)a4 ltmLUT:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 isAttachmentRendering:(BOOL)a7;
- (int)setTransformsArray:(float *)(a3 transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:;
- (int)updateCubesIfNeeded;
- (void)_blurDuplicatedPixelsOnPixelBuffer:(__CVBuffer *)a3 validBufferRect:(CGRect *)a4 forDeltaMap:(BOOL)a5;
- (void)_deallocateTransformBuffers;
- (void)cacheSourcePixelBuffer:(__CVBuffer *)a3;
- (void)configureBlurWith:(id *)a3;
- (void)configureP3ToBT2020conversion:(BOOL)a3;
- (void)dealloc;
- (void)finish;
- (void)setFillExtendedRowsInOutputBuffer:(BOOL)a3;
- (void)setOverscan:(int)a3 height:(int)a4;
- (void)setPriority:(int)a3;
- (void)setRenderMethod:(int)a3;
@end

@implementation affineGPUMetal

- (affineGPUMetal)initWithMetalContext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "metalContext",  "bail",  "metalContext is nil",  "affineGPUMetalV2.m",  378LL,  0);
LABEL_15:

    self = 0LL;
    goto LABEL_8;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___affineGPUMetal;
  v7 = -[affineGPUMetal init](&v22, "init");
  self = v7;
  if (!v7)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  (const char *)v22.receiver,  (const char *)v22.super_class,  v23,  v24,  v25,  v26);
    goto LABEL_8;
  }

  objc_storeStrong((id *)&v7->_metalContext, a3);
  self->_useBicubic = 1;
  unsigned int v8 = -[affineGPUMetal _initTransformShaders](self, "_initTransformShaders");
  if (v8)
  {
    unsigned int v15 = v8;
    uint64_t v16 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v16,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to create the transform shaders",  "affineGPUMetalV2.m",  387LL,  v15);
    goto LABEL_15;
  }

  unsigned int v9 = -[affineGPUMetal _initBlurShaders](self, "_initBlurShaders");
  if (v9)
  {
    unsigned int v17 = v9;
    uint64_t v18 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v18,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to create the blur shaders",  "affineGPUMetalV2.m",  390LL,  v17);
    goto LABEL_15;
  }

  unsigned int v10 = -[affineGPUMetal _initComputeShaders](self, "_initComputeShaders");
  if (v10)
  {
    unsigned int v19 = v10;
    uint64_t v20 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v20,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to create the compute shaders",  "affineGPUMetalV2.m",  393LL,  v19);
    goto LABEL_15;
  }

  v11 = objc_opt_new(&OBJC_CLASS___FigM2MController);
  fgCubeTexture = self->_fgCubeTexture;
  self->_fgCubeTexture = v11;

  if (!self->_fgCubeTexture)
  {
    uint64_t v21 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v21,  "<<<< affineGPUMetalV2 >>>> Fig",  "_m2m",  "bail",  "Unable to initialize M2M controller for BT2020 conversion",  "affineGPUMetalV2.m",  398LL,  0);
    goto LABEL_15;
  }

  -[FigMetalContext setQueuePriority:](self->_metalContext, "setQueuePriority:", 1LL);
LABEL_8:

  return self;
}

- (void)dealloc
{
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef) {
    CFRelease(cvMetalTextureCacheRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___affineGPUMetal;
  -[affineGPUMetal dealloc](&v4, "dealloc");
}

- (void)setOverscan:(int)a3 height:(int)a4
{
  *(_DWORD *)&self->_blurMetalConfig.mixEnabled = a3;
  *(_DWORD *)&self->_anon_3f9[3] = a4;
}

- (int)setTransformsArray:(float *)(a3 transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:
{
  unsigned int v10 = v5;
  uint64_t v13 = v7;
  if (gGMFigKTraceEnabled == 1)
  {
    __int128 v140 = v9;
    __int128 v141 = v6;
    __int128 v139 = v8;
    kdebug_trace(822152385LL, 50LL, 0LL, 0LL, 0LL);
    *(void *)&__int128 v8 = v139;
    *(void *)&__int128 v9 = v140;
    __int128 v6 = v141;
  }

  if (!(_DWORD)v8)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputSize[0] > 0",  "bail",  "Input width is invalid",  "affineGPUMetalV2.m",  474LL,  0);
LABEL_87:
    int v124 = -12780;
    goto LABEL_74;
  }

  if (!DWORD1(v8))
  {
    uint64_t v127 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v127,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputSize[1] > 0",  "bail",  "Input height is invalid",  "affineGPUMetalV2.m",  475LL,  0);
    goto LABEL_87;
  }

  if (!(_DWORD)v9)
  {
    uint64_t v128 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v128,  "<<<< affineGPUMetalV2 >>>> Fig",  "outputSize[0] > 0",  "bail",  "Output width is invalid",  "affineGPUMetalV2.m",  476LL,  0);
    goto LABEL_87;
  }

  if (!DWORD1(v9))
  {
    uint64_t v129 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v129,  "<<<< affineGPUMetalV2 >>>> Fig",  "outputSize[1] > 0",  "bail",  "Output height is invalid",  "affineGPUMetalV2.m",  477LL,  0);
    goto LABEL_87;
  }

  *((void *)&v8 + 1) = v9;
  p_inputWidth = (int32x2_t *)&self->_inputWidth;
  *(_OWORD *)&self->_inputWidth = v8;
  int v17 = v6;
  unsigned int v18 = DWORD1(v6);
  if (!(void)v6)
  {
    -[affineGPUMetal _deallocateTransformBuffers](self, "_deallocateTransformBuffers");
LABEL_73:
    int v124 = 0;
    goto LABEL_74;
  }

  if (!(_DWORD)v6)
  {
    uint64_t v130 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v130,  "<<<< affineGPUMetalV2 >>>> Fig",  "transformCounts.x",  "bail",  "transformCounts.x is 0",  "affineGPUMetalV2.m",  492LL,  0);
    goto LABEL_87;
  }

  if (!DWORD1(v6))
  {
    uint64_t v131 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v131,  "<<<< affineGPUMetalV2 >>>> Fig",  "transformCounts.y",  "bail",  "transformCounts.y is 0",  "affineGPUMetalV2.m",  493LL,  0);
    goto LABEL_87;
  }

  int v19 = v6 - 1;
  if (*(void *)&self->_texMatCount[4] == v19)
  {
    int v20 = DWORD1(v6) - 1;
    if (HIDWORD(*(void *)&self->_texMatCount[4]) == v20) {
      goto LABEL_23;
    }
  }

  LODWORD(v140) = (_DWORD)self + 540;
  texMats = self->_texMats;
  if (texMats)
  {
    self->_texMats = 0LL;
    __int128 v141 = v6;
    free(texMats);
    *(void *)&__int128 v6 = v141;
  }

  uint32x2_t v22 = vmax_u32(*(uint32x2_t *)&v6, (uint32x2_t)0x200000002LL);
  *(uint32x2_t *)&self->_texMatCount[4] = v22;
  __int32 v23 = v22.i32[1];
  __int32 v24 = v22.i32[0];
  __int32 v25 = v22.i32[0] * v22.i32[1];
  uint64_t v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc(48LL * (v22.i32[0] * v22.i32[1]));
  self->_texMats = v26;
  if (!v26)
  {
    uint64_t v135 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v135,  "<<<< affineGPUMetalV2 >>>> Fig",  "_texMats",  "bail",  "Unable to allocate matrices buffer",  "affineGPUMetalV2.m",  506LL,  0);
LABEL_90:
    int v124 = -12786;
    goto LABEL_74;
  }

  LODWORD(self->_swathMatrices) = 8 * v25;
  self->_overscanHeight = 48 * v25;
  self->_swathRenderVertexIndicesBufferSize = (12 * v23 - 12) * (v24 + 0x7FFFFFFF);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
  v28 = (MTLBuffer *)[v27 newBufferWithLength:LODWORD(self->_swathMatrices) options:0];
  verticesBuffer = self->_verticesBuffer;
  self->_verticesBuffer = v28;

  if (!self->_verticesBuffer)
  {
    uint64_t v136 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v136,  "<<<< affineGPUMetalV2 >>>> Fig",  "_verticesBuffer",  "bail",  "_verticesBuffer is nil",  "affineGPUMetalV2.m",  514LL,  0);
    goto LABEL_90;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
  v31 = (MTLBuffer *)[v30 newBufferWithLength:self->_overscanHeight options:0];
  matricesBuffer = self->_matricesBuffer;
  self->_matricesBuffer = v31;

  unsigned int v10 = v5;
  if (self->_matricesBuffer)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
    v34 = (MTLBuffer *)[v33 newBufferWithLength:self->_swathRenderVertexIndicesBufferSize options:0];
    vertexIndicesBuffer = self->_vertexIndicesBuffer;
    self->_vertexIndicesBuffer = v34;

    if (self->_vertexIndicesBuffer)
    {
      *(int32x2_t *)&self->_texMatCount[4] = vadd_s32(*(int32x2_t *)&self->_texMatCount[4], (int32x2_t)-1LL);
      p_inputWidth = (int32x2_t *)&self->_inputWidth;
LABEL_23:
      if (!self->_texMats)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v10,  (const char *)v139,  *((const char **)&v139 + 1),  (_DWORD)v140,  *((const char **)&v140 + 1),  (const char *)v141,  DWORD2(v141));
        int v124 = -12786;
        goto LABEL_74;
      }

      int v36 = 0;
      unsigned int v37 = 0;
      int v38 = 0;
      do
      {
        int v39 = 0;
        do
        {
          unsigned int v40 = v36 + v39;
          v41 = (int32x2_t *)((char *)self->_texMats + 48 * v37 + 48 * v39);
          v42 = &(*a3)[9 * (v36 + v39)];
          v43.i32[0] = (__int32)v42[2];
          int32x2_t v44 = *(int32x2_t *)(v42 + 3);
          uint64_t v45 = *((void *)v42 + 3);
          __int32 v46 = *((_DWORD *)v42 + 8);
          int32x2_t v47 = vzip1_s32(*(int32x2_t *)v42, v44);
          int32x2_t v48 = vzip2_s32(*(int32x2_t *)v42, v44);
          v43.i32[1] = (__int32)v42[5];
          v41[1].i32[0] = v45;
          v41[3].i32[0] = HIDWORD(v45);
          int32x2_t *v41 = v47;
          v41[2] = v48;
          v41[5].i32[0] = v46;
          v41[4] = v43;
          ++v39;
        }

        while (v18 != v39);
        v37 += v39;
        if (v18 == 1)
        {
          v49 = self->_texMats;
          v50 = (_OWORD *)((char *)v49 + 48 * v37);
          v51 = (__int128 *)((char *)v49 + 48 * v40);
          __int128 v52 = *v51;
          __int128 v53 = v51[2];
          ++v37;
          v50[1] = v51[1];
          v50[2] = v53;
          _OWORD *v50 = v52;
        }

        ++v38;
        v36 += v18;
      }

      while (v38 != v17);
      if (v17 == 1)
      {
        int v54 = 0;
        if (v18 <= 2) {
          int v55 = 2;
        }
        else {
          int v55 = v18;
        }
        int v56 = -v55;
        unsigned int v57 = v37 - v55;
        do
        {
          v58 = self->_texMats;
          v59 = (_OWORD *)((char *)v58 + 48 * v37 + 48 * v54);
          v60 = (_OWORD *)((char *)v58 + 48 * v57 + 48 * v54);
          __int128 v61 = v60[1];
          _OWORD *v59 = *v60;
          v59[1] = v61;
          v59[2] = v60[2];
          ++v54;
        }

        while (v56 + v54);
      }

      *(void *)self->_transformStrides = v13;
      id v62 = -[MTLBuffer contents](self->_verticesBuffer, "contents");
      *(void *)&self->_swathVertices[4] = v62;
      if (v62)
      {
        id v63 = -[MTLBuffer contents](self->_matricesBuffer, "contents");
        *(void *)&self->_swathMatricesBufferSize = v63;
        if (v63)
        {
          v64 = (unsigned __int16 *)-[MTLBuffer contents](self->_vertexIndicesBuffer, "contents");
          self->_swathRenderVertexIndices = v64;
          if (v64)
          {
            self->_transformConfig.clampingEnabled = 0;
            *(_DWORD *)&self->_anon_251[43] = 0;
            if (a4)
            {
              float x = a4->origin.x;
              __int128 v67 = *(_OWORD *)&self->_anon_251[15];
              v71.f32[0] = x;
              *(float *)&self->_anon_251[15] = x;
              float v68 = a4->origin.x + a4->size.width;
              v71.f32[1] = v68;
              *(float32x4_t *)&self->_anon_251[15] = v71;
              float32_t y = a4->origin.y;
              v71.f32[2] = y;
              *(float32x4_t *)&self->_anon_251[15] = v71;
              float32_t v70 = a4->origin.y + a4->size.height;
              v71.f32[3] = v70;
              if (x >= 2.0)
              {
                self->_transformConfig.clampingEnabled = 1;
                v71.f32[0] = x + 2.0;
                v71.f32[1] = v68 + -2.0;
              }

              v72.i32[0] = v71.i32[2];
              if (v71.f32[2] >= 2.0)
              {
                self->_transformConfig.clampingEnabled = 1;
                float32x2_t v72 = vadd_f32( (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v71, (int8x16_t)v71, 8uLL),  (float32x2_t)0xC000000040000000LL);
                v71.i32[3] = v72.i32[1];
              }

              uint32x2_t v73 = (uint32x2_t)*p_inputWidth;
              v74.i64[1] = -1LL;
              *(float32x2_t *)v74.i8 = vcvt_f32_u32((uint32x2_t)vadd_s32(*p_inputWidth, (int32x2_t)-1LL));
              float32x4_t v65 = (float32x4_t)vzip1q_s32(v74, v74);
              v71.i32[2] = v72.i32[0];
              *(float32x4_t *)&self->_anon_251[15] = vdivq_f32(v71, v65);
              if (a5)
              {
                unsigned int v75 = 0;
                unsigned int v76 = 0;
              }

              else
              {
                unsigned int v75 = a4->origin.x;
                unsigned int v76 = a4->origin.y;
              }
            }

            else
            {
              unsigned int v75 = 0;
              unsigned int v76 = 0;
              uint32x2_t v73 = (uint32x2_t)*p_inputWidth;
            }

            float32x2_t v77 = vcvt_f32_u32(v73);
            unsigned int v78 = HIDWORD(*(void *)&self->_texMatCount[4]);
            unsigned int v79 = *(void *)&self->_texMatCount[4];
            if (v79)
            {
              int v80 = 0;
              unsigned int v81 = 0;
              uint64_t v82 = *(void *)&self->_swathVertices[4];
              float v83 = (float)*(void *)self->_transformStrides / v77.f32[0];
              float v84 = (float)HIDWORD(*(void *)self->_transformStrides) / v77.f32[1];
              float v85 = v84 + v84;
              float v86 = v83 + v83;
              float v87 = (float)(*(_DWORD *)&self->_anon_3f9[3] + v76) / v77.f32[1];
              float v88 = (float)(*(_DWORD *)&self->_blurMetalConfig.mixEnabled + v75) / v77.f32[0];
              float v89 = (float)(v87 * -2.0) + 1.0;
              float v90 = (float)(v88 * 2.0) + -1.0;
              unsigned int v91 = v79 + 1;
              float v92 = (float)(v88 * -2.0) + 1.0;
              if (v79 + 1 > 1) {
                uint64_t v93 = v79 + 1;
              }
              else {
                uint64_t v93 = 1LL;
              }
              float v94 = (float)(v87 * 2.0) + -1.0;
              if (v78 + 1 > 1) {
                int v95 = v78 + 1;
              }
              else {
                int v95 = 1;
              }
              do
              {
                unint64_t v96 = 0LL;
                *(float *)&uint64_t v97 = v90;
                do
                {
                  *((float *)&v97 + 1) = v89;
                  *(void *)(v82 + 8LL * (v80 + v96)) = v97;
                  if (v96 >= v79 - 1) {
                    *(float *)&uint64_t v97 = v92;
                  }
                  else {
                    *(float *)&uint64_t v97 = v86 + *(float *)&v97;
                  }
                  ++v96;
                }

                while (v93 != v96);
                float v89 = v89 - v85;
                if (v81 >= v78 - 1) {
                  float v89 = v94;
                }
                ++v81;
                v80 += v91;
              }

              while (v81 != v95);
              int v98 = 0;
              int v99 = 0;
              int v100 = 1;
              do
              {
                ++v99;
                int v101 = v100;
                unsigned int v102 = v79;
                do
                {
                  v64[v98] = v101 - 1;
                  v64[v98 + 1] = v101;
                  v64[v98 + 2] = v79 + v101;
                  v64[v98 + 3] = v101;
                  int v103 = v98 + 5;
                  v64[v98 + 4] = v79 + v101;
                  v98 += 6;
                  v64[v103] = v79 + v101++ + 1;
                  --v102;
                }

                while (v102);
                v100 += v91;
              }

              while (v99 != v78);
              float32x2_t v77 = vcvt_f32_u32((uint32x2_t)*p_inputWidth);
              unsigned int v78 = HIDWORD(*(void *)&self->_texMatCount[4]);
              unsigned int v79 = *(void *)&self->_texMatCount[4];
            }

            unsigned int v104 = 0;
            int v105 = 0;
            uint64_t v106 = *(void *)&self->_swathMatricesBufferSize;
            v107 = self->_texMats;
            __asm { FMOV            V1.2S, #1.0 }

            float32x2_t v113 = vdiv_f32(_D1, v77);
            v65.f32[0] = v77.f32[0] / v77.f32[1];
            float32x2_t v114 = (float32x2_t)vzip1_s32(*(int32x2_t *)v65.f32, (int32x2_t)v77);
            v77.f32[0] = v77.f32[1] / v77.f32[0];
            do
            {
              unsigned int v115 = 0;
              unsigned int v116 = v104;
              do
              {
                uint64_t v117 = v106 + 48LL * (v105 + v115);
                v118 = (_OWORD *)((char *)v107 + 48 * v116);
                __int128 v120 = v118[1];
                __int128 v119 = v118[2];
                *(_OWORD *)uint64_t v117 = *v118;
                *(_OWORD *)(v117 + 16) = v120;
                *(_OWORD *)(v117 + 32) = v119;
                int8x16_t v121 = *(int8x16_t *)(v117 + 16);
                int32x4_t v122 = (int32x4_t)vextq_s8(*(int8x16_t *)v117, *(int8x16_t *)v117, 8uLL);
                *(float32x2_t *)v122.i8 = vmul_f32( v114,  (float32x2_t)vext_s8(*(int8x8_t *)v117, *(int8x8_t *)v122.i8, 4uLL));
                *(void *)&__int128 v119 = vzip1q_s32(*(int32x4_t *)v117, v122).u64[0];
                *(_DWORD *)(v117 + 8) = v122.i32[1];
                *(void *)uint64_t v117 = v119;
                *(float32x2_t *)&__int128 v119 = vmul_f32( v77,  (float32x2_t)vzip1_s32( *(int32x2_t *)v121.i8,  (int32x2_t)*(_OWORD *)&vextq_s8(v121, v121, 8uLL)));
                *(_DWORD *)(v117 + 24) = DWORD1(v119);
                DWORD1(v119) = v121.i32[1];
                *(void *)(v117 + 16) = v119;
                __int128 v123 = *(_OWORD *)(v117 + 32);
                *(_DWORD *)(v117 + 40) = DWORD2(v123);
                *(float32x2_t *)(v117 + 32) = vmul_f32(v113, *(float32x2_t *)&v123);
                ++v115;
                v116 += v78 + 1;
              }

              while (v115 <= v79);
              ++v104;
              v105 += v115;
            }

            while (v104 <= v78);
            goto LABEL_73;
          }

          uint64_t v134 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v134,  "<<<< affineGPUMetalV2 >>>> Fig",  "_swathRenderVertexIndices",  "bail",  "Unable to get swath vertex indices buffer",  "affineGPUMetalV2.m",  580LL,  0);
        }

        else
        {
          uint64_t v133 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v133,  "<<<< affineGPUMetalV2 >>>> Fig",  "_swathMatrices",  "bail",  "Unable to get swath matrices buffer",  "affineGPUMetalV2.m",  577LL,  0);
        }
      }

      else
      {
        uint64_t v132 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v132,  "<<<< affineGPUMetalV2 >>>> Fig",  "_swathVertices",  "bail",  "Unable to get swath vertices buffer",  "affineGPUMetalV2.m",  574LL,  0);
      }

      goto LABEL_87;
    }

    uint64_t v138 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v138,  "<<<< affineGPUMetalV2 >>>> Fig",  "_vertexIndicesBuffer",  "bail",  "_vertexIndicesBuffer is nil",  "affineGPUMetalV2.m",  520LL,  0);
  }

  else
  {
    uint64_t v137 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v137,  "<<<< affineGPUMetalV2 >>>> Fig",  "_matricesBuffer",  "bail",  "_matricesBuffer is nil",  "affineGPUMetalV2.m",  517LL,  0);
  }

  int v124 = -12786;
LABEL_74:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 50LL, 0LL, 0LL, 0LL);
  }
  return v124;
}

- (void)_deallocateTransformBuffers
{
  texMats = self->_texMats;
  if (texMats)
  {
    self->_texMats = 0LL;
    free(texMats);
  }

  LODWORD(self->_swathMatrices) = 0;
  self->_overscanHeight = 0;
  self->_swathRenderVertexIndicesBufferSize = 0;
  verticesBuffer = self->_verticesBuffer;
  self->_verticesBuffer = 0LL;

  matricesBuffer = self->_matricesBuffer;
  self->_matricesBuffer = 0LL;

  vertexIndicesBuffer = self->_vertexIndicesBuffer;
  self->_vertexIndicesBuffer = 0LL;

  *(void *)&self->_texMatCount[4] = 0LL;
}

- (void)setRenderMethod:(int)a3
{
  int useBicubic = self->_useBicubic;
  int v4 = a3 == 1;
  if (useBicubic != v4)
  {
    self->_int useBicubic = v4;
    unsigned int v6 = -[affineGPUMetal _initTransformShaders](self, "_initTransformShaders");
    if (v6)
    {
      unsigned int v8 = v6;
      uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      unsigned int v12 = v8;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to re-create the transform shaders",  "affineGPUMetalV2.m",  672LL,  v12);
    }

    else
    {
      unsigned int v7 = -[affineGPUMetal _initBlurShaders](self, "_initBlurShaders");
      if (!v7) {
        return;
      }
      unsigned int v10 = v7;
      uint64_t v11 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      unsigned int v13 = v10;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v11,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to re-create the blur shaders",  "affineGPUMetalV2.m",  675LL,  v13);
    }

    self->_int useBicubic = useBicubic;
  }

- (void)setFillExtendedRowsInOutputBuffer:(BOOL)a3
{
  *((_BYTE *)&self->_P3ToBT2020ConversionMethod + 4) = a3;
}

- (void)setPriority:(int)a3
{
}

- (void)configureP3ToBT2020conversion:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  LODWORD(self->_intermediateOutputPixelBuffer) = v3;
}

- (void)cacheSourcePixelBuffer:(__CVBuffer *)a3
{
  id v9 = 0LL;
  unsigned int v10 = 0LL;
  if (a3)
  {
    unsigned int v4 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3,  1LL,  0LL,  &v8);
    if (v4)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      unsigned int v6 = v4;
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v6, v3, v7, v8, (_DWORD)v9, v10, v11, v12);
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v5 = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v5, v3, v7, v8, (_DWORD)v9, v10, v11, v12);
  }
}

- (void)finish
{
  m2m = self->_m2m;
  if (m2m)
  {
    CFRelease(m2m);
    self->_m2m = 0LL;
  }

  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CFRelease(cvMetalTextureCacheRef);
    self->_cvMetalTextureCacheRef = 0LL;
  }

  -[affineGPUMetal _deallocateTransformBuffers](self, "_deallocateTransformBuffers");
  *(_OWORD *)self->_blurPreviousTextureIndefloat x = 0u;
}

- (int)renderWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 pixelBufferValidRect:(CGRect *)a5 ltmLUT:(id)a6 outputPixelBuffer:(__CVBuffer *)a7 isAttachmentRendering:(BOOL)a8
{
  unint64_t v9 = a8;
  unsigned int v15 = (char *)a4;
  uint64_t v16 = (char *)a6;
  if (!a3)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputPixelBuffer",  "bail",  "inputPixelBuffer is NULL",  "affineGPUMetalV2.m",  803LL,  0);
LABEL_50:
    v35 = 0LL;
    goto LABEL_41;
  }

  if (!a5)
  {
    uint64_t v49 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v49,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputPixelBufferValidRect",  "bail",  "inputPixelBufferValidRect is NULL",  "affineGPUMetalV2.m",  804LL,  0);
    goto LABEL_50;
  }

  if (!a7)
  {
    uint64_t v50 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v50,  "<<<< affineGPUMetalV2 >>>> Fig",  "outputPixelBuffer",  "bail",  "outputPixelBuffer is NULL",  "affineGPUMetalV2.m",  805LL,  0);
    goto LABEL_50;
  }

  if (!self->_verticesBuffer)
  {
    uint64_t v51 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v51,  "<<<< affineGPUMetalV2 >>>> Fig",  "_verticesBuffer",  "bail",  "_verticesBuffer is nil",  "affineGPUMetalV2.m",  806LL,  0);
    goto LABEL_50;
  }

  if (!self->_matricesBuffer)
  {
    uint64_t v52 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v52,  "<<<< affineGPUMetalV2 >>>> Fig",  "_matricesBuffer",  "bail",  "_matricesBuffer is nil",  "affineGPUMetalV2.m",  807LL,  0);
    goto LABEL_50;
  }

  if (!self->_vertexIndicesBuffer)
  {
    uint64_t v53 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v53,  "<<<< affineGPUMetalV2 >>>> Fig",  "_vertexIndicesBuffer",  "bail",  "_vertexIndicesBuffer is nil",  "affineGPUMetalV2.m",  808LL,  0);
    goto LABEL_50;
  }

  if (!self->_texMats)
  {
    uint64_t v54 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v54,  "<<<< affineGPUMetalV2 >>>> Fig",  "_texMats",  "bail",  "_texMats is NULL",  "affineGPUMetalV2.m",  809LL,  0);
    goto LABEL_50;
  }

  v64 = a5;
  CVPixelBufferGetWidthOfPlane(a3, 0LL);
  CVPixelBufferGetHeightOfPlane(a3, 0LL);
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a7, 0LL);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a7, 0LL);
  id v63 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor]);

  int v19 = a7;
  if (LODWORD(self->_intermediateOutputPixelBuffer) == 1)
  {
    p_m2m = &self->_m2m;
    m2m = self->_m2m;
    if (!m2m) {
      goto LABEL_17;
    }
    if (CVPixelBufferGetWidthOfPlane(m2m, 0LL) != WidthOfPlane
      || CVPixelBufferGetHeightOfPlane(*p_m2m, 0LL) != HeightOfPlane
      || (OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*p_m2m),
          PixelFormatType != CVPixelBufferGetPixelFormatType(a7)))
    {
      if (*p_m2m)
      {
        CFRelease(*p_m2m);
        *p_m2m = 0LL;
      }

      goto LABEL_17;
    }

    int v19 = *p_m2m;
    if (!*p_m2m)
    {
LABEL_17:
      HIDWORD(v56) = v9;
      v59 = v16;
      __int128 v61 = v15;
      uint64_t Attributes = CVPixelBufferGetAttributes(a3);
      __int32 v24 = (void *)objc_claimAutoreleasedReturnValue(Attributes);
      uint64_t v25 = CVPixelBufferGetAttributes(a7);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v27 setObject:&__NSDictionary0__struct forKeyedSubscript:kCVPixelBufferIOSurfacePropertiesKey];
      if (v26) {
        [v27 addEntriesFromDictionary:v26];
      }
      CFStringRef v28 = kCVBufferPropagatedAttachmentsKey;
      unsigned int v57 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:kCVBufferPropagatedAttachmentsKey]);
      [v27 setObject:v29 forKeyedSubscript:v28];

      OSType v30 = CVPixelBufferGetPixelFormatType(a7);
      CVReturn v31 = CVPixelBufferCreate( kCFAllocatorDefault,  WidthOfPlane,  HeightOfPlane,  v30,  (CFDictionaryRef)v27,  &self->_m2m);
      if (v31)
      {
        int v46 = v31;
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v46,  v8,  v55,  v56,  (_DWORD)v57,  v59,  v61,  (_DWORD)v8);

        v35 = 0LL;
        uint64_t v16 = v60;
        unsigned int v15 = v62;
        goto LABEL_42;
      }

      CFDictionaryRef v32 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
      unsigned int v15 = (char *)v61;
      if (v32)
      {
        v33 = (const __CFDictionary *)CFAutorelease(v32);
        if (v33) {
          CVBufferSetAttachments(*p_m2m, v33, kCVAttachmentMode_ShouldPropagate);
        }
      }

      int v19 = *p_m2m;
      uint64_t v16 = (char *)v59;
      unint64_t v9 = HIDWORD(v56);
    }
  }

  self->_gpuProcessFailed = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 commandBuffer]);

  if (!v35)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v8,  v55,  v56,  (_DWORD)v57,  v59,  v61,  (_DWORD)v8);
    int v46 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_42;
  }

  -[affineGPUMetal updateCubesIfNeeded](self, "updateCubesIfNeeded");
  -[affineGPUMetal _transformInputPixelBuffer:outputPixelBuffer:ltmLUT:isAttachment:commandBuffer:]( self,  "_transformInputPixelBuffer:outputPixelBuffer:ltmLUT:isAttachment:commandBuffer:",  a3,  v19,  v16,  v9,  v35);
  CFTypeRef v36 = CMGetAttachment(a3, @"InputDepthPixelBuffer", 0LL);
  CFTypeRef v37 = CMGetAttachment(a3, @"OutputDepthPixelBuffer", 0LL);
  if (v36)
  {
    CFTypeRef v38 = v37;
    if (v37)
    {
      char v39 = v9;
      unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue( [v15 objectForKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorMetadata_DepthBufferFOVScaling]);
      unint64_t v9 = (unint64_t)v40;
      if (v40)
      {
        [v40 floatValue];
        *(float *)&self->_anon_251[43] = v41;
        *(float *)v42.i32 = (float)(1.0 - v41) * 0.5;
        *(int32x2_t *)&self->_anon_251[47] = vdup_lane_s32(v42, 0);
      }

      -[affineGPUMetal _transformInputPixelBuffer:outputPixelBuffer:ltmLUT:isAttachment:commandBuffer:]( self,  "_transformInputPixelBuffer:outputPixelBuffer:ltmLUT:isAttachment:commandBuffer:",  v36,  v38,  0LL,  1LL,  v35);

      LOBYTE(v9) = v39;
    }
  }

  -[affineGPUMetal _addCommandBufferHandler:](self, "_addCommandBufferHandler:", v35);
  if (gGMFigKTraceEnabled)
  {
    int32x2_t v43 = (void *)objc_claimAutoreleasedReturnValue([v35 commandQueue]);
    int32x2_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 commandBuffer]);

    [v44 setLabel:@"KTRACE_MTLCMDBUF"];
    [v44 addCompletedHandler:&__block_literal_global];
    [v44 commit];
    [v35 addCompletedHandler:&__block_literal_global_61];
  }

  [v35 commit];
  if ((v9 & 1) == 0 && LOBYTE(self->_blurOverscan.width))
  {
    if (v63) {
      uint64_t v45 = 0LL;
    }
    else {
      uint64_t v45 = v64;
    }
    -[affineGPUMetal _blurDuplicatedPixelsOnPixelBuffer:validBufferRect:forDeltaMap:]( self,  "_blurDuplicatedPixelsOnPixelBuffer:validBufferRect:forDeltaMap:",  v19,  v45,  0LL);
  }

  -[affineGPUMetal _duplicateBottomRowsOnPixelBuffer:](self, "_duplicateBottomRowsOnPixelBuffer:", v19);
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  if (self->_gpuProcessFailed)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v8,  v55,  v56,  (_DWORD)v57,  v59,  v61,  (_DWORD)v8);
    int v46 = -12782;
    goto LABEL_42;
  }

- (int)renderWithSampleBuffer:(opaqueCMSampleBuffer *)a3 pixelBufferValidRect:(CGRect *)a4 ltmLUT:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 isAttachmentRendering:(BOOL)a7
{
  BOOL v8 = a7;
  id v13 = a5;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  unsigned int v15 = (opaqueCMSampleBuffer *)CMGetAttachment( a3,  kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStylePersonMaskSampleBuffer,  0LL);
  if (v8 || !v15)
  {
    backgroundColorCube = self->_backgroundColorCube;
    *(_OWORD *)&self->_foregroundColorCube = 0u;

    fgCubePtr = (void *)self->_fgCubePtr;
    self->_fgCubePtr = 0LL;
  }

  else
  {
    self->_foregroundColorCube = (NSData *)CMSampleBufferGetImageBuffer(v15);
    CFTypeRef v16 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStyleForegroundLUT, 0LL);
    int v17 = (NSData *)objc_claimAutoreleasedReturnValue(v16);
    unsigned int v18 = self->_backgroundColorCube;
    self->_backgroundColorCube = v17;

    CFTypeRef v19 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStyleBackgroundLUT, 0LL);
    int v20 = (const void *)objc_claimAutoreleasedReturnValue(v19);
    fgCubePtr = (void *)self->_fgCubePtr;
    self->_fgCubePtr = v20;
  }

  if (v8)
  {
    LOBYTE(self[1].super.isa) = 0;
    HIDWORD(self[1].super.isa) = 0;
  }

  else
  {
    CFTypeRef v23 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_SubjectRelightingCurveParameter, 0LL);
    __int32 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = v24;
    LOBYTE(self[1].super.isa) = v24 != 0LL;
    if (v24)
    {
      [v24 floatValue];
      HIDWORD(self[1].super.isa) = v26;
    }
  }

  CFTypeRef v27 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
  CFStringRef v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  int v29 = -[affineGPUMetal renderWithPixelBuffer:metadata:pixelBufferValidRect:ltmLUT:outputPixelBuffer:isAttachmentRendering:]( self,  "renderWithPixelBuffer:metadata:pixelBufferValidRect:ltmLUT:outputPixelBuffer:isAttachmentRendering:",  ImageBuffer,  v28,  a4,  v13,  a6,  v8);

  if (v29)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v29, v7, v31, v32, v33, v34, v35, v36);
  }

  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 55LL, v29, 0LL, 0LL);
  }

  return v29;
}

- (int)_transformInputPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 ltmLUT:(id)a5 isAttachment:(BOOL)a6 commandBuffer:(id)a7
{
  BOOL v56 = a6;
  uint64_t v11 = (const char *)a5;
  id v51 = a7;
  id v68 = 0LL;
  id v69 = 0LL;
  id v65 = 0LL;
  id v66 = 0LL;
  int32x2_t v47 = (char *)v11;
  if (!*(void *)&self->_swathVertices[4]
    || !LODWORD(self->_swathMatrices)
    || !*(void *)&self->_swathMatricesBufferSize
    || !self->_overscanHeight
    || !self->_swathRenderVertexIndices
    || !self->_swathRenderVertexIndicesBufferSize
    || !a3
    || !a4
    || !v51
    || v11)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
LABEL_12:
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v46, v46, v11, v48, v49, v50, (_DWORD)v51);
    uint64_t v12 = 0LL;
    id v13 = 0LL;
    int v14 = -12780;
    goto LABEL_36;
  }

  unsigned int v58 = *(void *)&self->_texMatCount[4];
  int v14 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3,  1LL,  0LL,  v67);
  if (v14)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v14, v46, v46, v11, v48, v49, v50, (_DWORD)v51);
LABEL_53:
    uint64_t v12 = 0LL;
    id v13 = 0LL;
    goto LABEL_36;
  }

  int v14 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a4,  1LL,  v58 < 2,  v64);
  if (v14)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v14, v46, v46, v11, v48, v49, v50, (_DWORD)v51);
    goto LABEL_53;
  }

  if (v64[0] >= 3u)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    goto LABEL_12;
  }

  HIDWORD(v50) = CVPixelBufferGetPixelFormatType(a3);
  if (v64[0])
  {
    unint64_t v15 = 0LL;
    id v13 = 0LL;
    pipelineRenderStates = self->_pipelineRenderStates;
    int v55 = 0LL;
    p_transformConfig = &self->_transformConfig;
    __asm { FMOV            V10.2S, #1.0 }

    while (1)
    {
      unsigned int v21 = [*(&v68 + v15) width];
      unsigned int v52 = [*(&v68 + v15) height];
      uint32x2_t v22 = (id *)&v64[2 * v15];
      unsigned int v57 = [v22[1] width];
      unsigned int v23 = [v22[1] height];
      float v61 = 1.0 / (float)v21;
      int v14 = -[affineGPUMetal _getTransformShaderParameters:isLuma:isRGB:isAttachment:pixelRatio:pipelineIndexToUse:]( self,  "_getTransformShaderParameters:isLuma:isRGB:isAttachment:pixelRatio:pipelineIndexToUse:",  [v22[1] pixelFormat],  v15 == 0,  HIDWORD(v50) == 1111970369,  v56,  &v62,  &v63);
      if (v14)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        uint64_t v12 = v55;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v14,  v46,  v46,  v47,  0,  (const char *)0x3FF0000000000000LL,  v50,  (_DWORD)v51);
        goto LABEL_36;
      }

      if (!pipelineRenderStates[v63] || (unsigned int v24 = v62) == 0)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v46,  v46,  v47,  0,  (const char *)0x3FF0000000000000LL,  v50,  (_DWORD)v51);
        int v14 = -12782;
        goto LABEL_40;
      }

      uint64_t v25 = objc_opt_new(&OBJC_CLASS___MTLRenderPassDescriptor);

      if (!v25) {
        break;
      }
      int v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v25, "colorAttachments"));
      CFTypeRef v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:0]);
      [v27 setLoadAction:0];

      CFStringRef v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v25, "colorAttachments"));
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
      [v29 setStoreAction:1];

      id v30 = v22[1];
      CVReturn v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v25, "colorAttachments"));
      CFDictionaryRef v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:0]);
      [v32 setTexture:v30];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v51 renderCommandEncoderWithDescriptor:v25]);
      if (!v12)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v46,  v46,  v47,  0,  (const char *)0x3FF0000000000000LL,  v50,  (_DWORD)v51);
        int v14 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        uint64_t v12 = 0LL;
        goto LABEL_34;
      }

      [v12 setRenderPipelineState:pipelineRenderStates[v63]];
      double v36 = (double)v23;
      if (v56)
      {
        LODWORD(v33) = self->_inputWidth;
        *(double *)&unint64_t v37 = (double)v33;
        LODWORD(v34) = self->_outputWidth;
        double v38 = *(double *)&v37 / (double)v34;
        LODWORD(v37) = self->_inputHeight;
        LODWORD(v35) = self->_outputHeight;
        double v39 = (double)v37 / (double)v35;
        double v40 = v38 * (double)v57;
        double v41 = -((double)v57 - (double)v57 * v38) * -0.5;
        double v42 = v39 * v36;
        double v43 = -(v36 - v36 * v39) * -0.5;
      }

      else
      {
        unsigned int v44 = v21 / v24;
        if (v21 / v24 <= v57) {
          double v41 = 0.0;
        }
        else {
          double v41 = (double)(v21 / v24 - v57) * -0.5;
        }
        if (v44 <= v57) {
          unsigned int v44 = v57;
        }
        double v40 = (double)v44;
        double v42 = (double)v52;
        double v43 = (double)(v52 - v23) * -0.5;
        if (v52 <= v23)
        {
          double v43 = 0.0;
          double v42 = (double)v23;
        }
      }

      *(double *)v59 = v41;
      *(double *)&v59[1] = v43;
      *(double *)&v59[2] = v40;
      *(double *)&v59[3] = v42;
      __int128 v60 = xmmword_37830;
      [v12 setViewport:v59];
      [v12 setVertexBuffer:self->_verticesBuffer offset:0 atIndex:0];
      [v12 setVertexBuffer:self->_matricesBuffer offset:0 atIndex:1];
      [v12 setVertexBytes:&v61 length:4 atIndex:2];
      [v12 setVertexBytes:p_transformConfig length:368 atIndex:3];
      [v12 setFragmentTexture:*(&v68 + v15) atIndex:0];
      self->_anon_251[31] = self[1].super.isa;
      *(_DWORD *)&self->_anon_251[35] = HIDWORD(self[1].super.isa);
      *(float32x2_t *)&self->_anon_251[55] = vdiv_f32(_D10, vcvt_f32_u32((uint32x2_t)__PAIR64__(v23, v57)));
      [v12 setFragmentBytes:p_transformConfig length:368 atIndex:0];
      [v12 setTriangleFillMode:0];
      [v12 drawIndexedPrimitives:3 indexCount:(unint64_t)self->_swathRenderVertexIndicesBufferSize >> 1 indexType:0 indexBuffer:self->_vertexIndicesBuffer indexBufferOffset:0];
      [v12 endEncoding];
      ++v15;
      id v13 = v25;
      int v55 = v12;
      if (v15 >= v64[0])
      {
        int v14 = 0;
LABEL_34:
        id v13 = v25;
        goto LABEL_36;
      }
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v46,  v46,  v47,  0,  (const char *)0x3FF0000000000000LL,  v50,  (_DWORD)v51);
    int v14 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    id v13 = 0LL;
LABEL_40:
    uint64_t v12 = v55;
  }

  else
  {
    uint64_t v12 = 0LL;
    id v13 = 0LL;
    int v14 = 0;
  }

- (int)_renderBlurInputTextures:(id *)a3 inputTexturesCount:(unsigned int)a4 outputTextures:(id *)a5
{
  if (!a4)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputTexturesCount",  "bail",  "inputTexturesCount is 0",  "affineGPUMetalV2.m",  1710LL,  0);
    return -12780;
  }

  if (!a3)
  {
    uint64_t v42 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v42,  "<<<< affineGPUMetalV2 >>>> Fig",  "inputTextures",  "bail",  "inputTextures is NULL",  "affineGPUMetalV2.m",  1711LL,  0);
    return -12780;
  }

  unsigned int v7 = a5;
  if (!a5)
  {
    uint64_t v43 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v43,  "<<<< affineGPUMetalV2 >>>> Fig",  "outputTextures",  "bail",  "outputTextures is NULL",  "affineGPUMetalV2.m",  1712LL,  0);
    return -12780;
  }

  if (LODWORD(self->_blurVertexIndices) > 0x1000)
  {
    uint64_t v44 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v44,  "<<<< affineGPUMetalV2 >>>> Fig",  "_blurVertexSize <= 4 * 1024",  "bail",  "The blur vertices buffer is too big",  "affineGPUMetalV2.m",  1713LL,  0);
    return -12780;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue([v10 commandBuffer]);

  if (v11)
  {
    if (v7->var0)
    {
      uint64_t v50 = (const char *)v7;
      unsigned int v52 = v11;
      unint64_t v12 = 0LL;
      id v13 = 0LL;
      int v14 = 0LL;
      unint64_t v15 = 0LL;
      pipelineRenderStates = self->_pipelineRenderStates;
      int v48 = &self->_anon_3f9[11];
      var1 = a3->var1;
      uint64_t v17 = a4;
      while (1)
      {
        unsigned int v58 = v15;
        unsigned int v18 = (char *)v7 + 8 * v12;
        int v20 = (void *)*((void *)v18 + 1);
        CFTypeRef v19 = (uint64_t *)(v18 + 8);
        unsigned int v21 = -[affineGPUMetal _getBlurShaderParameters:pipelineIndexToUse:]( self,  "_getBlurShaderParameters:pipelineIndexToUse:",  [v20 pixelFormat],  &v62);
        if (v21)
        {
          int v39 = v21;
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v39,  v5,  v45,  v5,  (_DWORD)v48,  v50,  v52,  (_DWORD)v58);

LABEL_24:
          return v39;
        }

        if (!pipelineRenderStates[v62])
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v5,  v45,  v5,  (_DWORD)v48,  v50,  v52,  (_DWORD)v58);

          return -12782;
        }

        uint32x2_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
        id v23 = [v22 newBufferWithBytes:*(void *)&self->_blurVertexIndicesSize length:self->_P3ToBT2020ConversionMethod options:0];

        if (!v23)
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v5,  v45,  v5,  (_DWORD)v48,  v50,  v52,  (_DWORD)v58);
          int v39 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

          goto LABEL_24;
        }

        unsigned int v24 = objc_opt_new(&OBJC_CLASS___MTLRenderPassDescriptor);

        if (!v24)
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v5,  v45,  v5,  (_DWORD)v48,  v50,  v52,  (_DWORD)v58);
          int v39 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

          return v39;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v24, "colorAttachments"));
        int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);
        [v26 setLoadAction:1];

        CFTypeRef v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v24, "colorAttachments"));
        CFStringRef v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:0]);
        [v28 setStoreAction:1];

        uint64_t v29 = *v19;
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPassDescriptor colorAttachments](v24, "colorAttachments"));
        CVReturn v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:0]);
        [v31 setTexture:v29];

        CFDictionaryRef v32 = v52;
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v52 renderCommandEncoderWithDescriptor:v24]);

        if (!v33) {
          break;
        }
        id v13 = v33;
        [v33 setRenderPipelineState:pipelineRenderStates[v62]];
        [v33 setVertexBytes:*(void *)&self->_blurVertexSize length:LODWORD(self->_blurVertexIndices) atIndex:0];
        uint64_t v34 = 0LL;
        unint64_t v35 = var1;
        do
        {
          id v36 = *v35;
          v35 += 3;
          [v13 setFragmentTexture:v36 atIndex:v34++];
        }

        while (v17 != v34);
        [v13 setFragmentBytes:v48 length:32 atIndex:0];
        [v13 setTriangleFillMode:0];
        [v13 drawIndexedPrimitives:3 indexCount:(unint64_t)self->_P3ToBT2020ConversionMethod >> 1 indexType:0 indexBuffer:v23 indexBufferOffset:0];
        [v13 endEncoding];
        ++v12;
        unsigned int v7 = ($52165BD84AFDBB053DF55A51EBCB896A *)v50;
        ++var1;
        int v14 = v23;
        unint64_t v15 = v24;
        if (v12 >= *(unsigned int *)v50)
        {

          uint64_t v11 = v52;
          goto LABEL_17;
        }
      }

      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v5,  v45,  v5,  (_DWORD)v48,  v50,  v52,  (_DWORD)v58);
      int v39 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
LABEL_17:
      -[affineGPUMetal _addCommandBufferHandler:](self, "_addCommandBufferHandler:", v11);
      if (gGMFigKTraceEnabled)
      {
        unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v11 commandQueue]);
        double v38 = (void *)objc_claimAutoreleasedReturnValue([v37 commandBuffer]);

        [v38 setLabel:@"KTRACE_MTLCMDBUF"];
        [v38 addCompletedHandler:&__block_literal_global_101];
        [v38 commit];
        [v11 addCompletedHandler:&__block_literal_global_102];
      }

      [v11 commit];

      return 0;
    }

    return v39;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v5, v45, v46, v47, v49, v51, v57);
  return FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

- (int)getBlurBuffersDecimationFactor
{
  return 2;
}

- (void)configureBlurWith:(id *)a3
{
  if (a3)
  {
    int var0 = a3->var0;
    LOBYTE(self->_blurOverscan.width) = a3->var0 != 0;
    if (var0)
    {
      if (a3->var1 < 4)
      {
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        int v27 = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "( config->nbWorkBlurBuffers >= 4)",  "bail",  "Not enough pixel buffers for temporal blur mix",  "affineGPUMetalV2.m",  1915LL,  v27);
      }

      else
      {
        *(_OWORD *)self->_blurPreviousTextureIndefloat x = 0u;
        HIDWORD(self->_blurOverscan.width) = 5;
        *(_DWORD *)&self->_blurRadiusTable[4] = 4;
        *(float64x2_t *)&self->_blurOverscan.height = vcvtq_f64_f32(vcvt_f32_s32(*(int32x2_t *)&a3->var2));
        *(void *)&self->_blurBorderVertices[10] = 0x3F800000BF800000LL;
        __asm { FMOV            V1.2S, #1.0 }

        *(void *)&self->_blurBorderVertices[18] = _D1;
        __asm { FMOV            V2.2S, #-1.0 }

        *(void *)&self->_blurBorderVertices[26] = _D2;
        *(void *)&self->_blurBorderVertices[34] = 0xBF8000003F800000LL;
        *(void *)&self->_blurBorderVertices[42] = 0x3F800000BF800000LL;
        *(void *)&self->_blurBorderVertices[50] = _D1;
        *(void *)&self->_blurBorderVertices[58] = _D2;
        *(void *)&self->_blurRenderIndices[1] = 0xBF8000003F800000LL;
        *(_OWORD *)&self->_blurBorderIndices[4] = xmmword_37840;
        *(_OWORD *)&self->_blurBorderIndices[12] = xmmword_37850;
        *(_OWORD *)&self->_blurBorderIndices[20] = xmmword_37860;
        *(void *)&self->_blurRenderVertices[10] = 0x3F800000BF800000LL;
        *(void *)&self->_blurRenderVertices[18] = 0x3F800000BF800000LL;
        *(void *)&self->_blurRenderVertices[26] = _D1;
        *(void *)&self->_blurRenderVertices[34] = _D1;
        *(void *)&self->_blurRenderVertices[42] = 0x3F800000BF800000LL;
        *(void *)&self->_blurRenderVertices[50] = 0x3F800000BF800000LL;
        *(void *)&self->_blurRenderVertices[58] = _D1;
        *(void *)&self->_blurRenderVertices[66] = _D1;
        *(void *)&self->_blurRenderVertices[74] = _D2;
        *(void *)&self->_blurRenderVertices[82] = _D2;
        *(void *)&self->_blurRenderVertices[90] = 0xBF8000003F800000LL;
        *(void *)&self->_blurRenderVertices[98] = 0xBF8000003F800000LL;
        *(void *)&self->_blurRenderVertices[106] = _D2;
        *(void *)&self->_blurRenderVertices[114] = _D2;
        *(void *)&self->_blurRenderVertices[122] = 0xBF8000003F800000LL;
        *(void *)self->_blurFrameCounter = 0xBF8000003F800000LL;
        *(_OWORD *)&self->_blurRenderIndices[5] = xmmword_37870;
        *(_OWORD *)&self->_blurRenderIndices[13] = xmmword_37880;
        *(_OWORD *)&self->_blurRenderIndices[21] = xmmword_37890;
        *(_OWORD *)&self->_blurRenderIndices[29] = xmmword_378A0;
        *(_OWORD *)&self->_blurRenderIndices[37] = xmmword_378B0;
        *(_OWORD *)&self->_blurRenderIndices[45] = xmmword_378C0;
        *(void *)&self->_blurRadiusTable[8] = 0x102030201020100LL;
        self->_blurBorderIndices[3] = 257;
        unsigned int v12 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3->var8[0],  1LL,  0LL,  self->_blurTempTextures[0][0].texture);
        if (v12)
        {
          unsigned int v18 = v12;
          uint64_t v19 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          unsigned int v28 = v18;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v19,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to cache blur tmp texture 0",  "affineGPUMetalV2.m",  2006LL,  v28);
        }

        else
        {
          unsigned int v13 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3->var8[1],  1LL,  0LL,  self->_blurPreviousTextures[0][0].texture);
          if (v13)
          {
            unsigned int v20 = v13;
            uint64_t v21 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            unsigned int v29 = v20;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v21,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to cache blur previous texture 0",  "affineGPUMetalV2.m",  2008LL,  v29);
          }

          else
          {
            unsigned int v14 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3->var8[2],  1LL,  0LL,  self->_blurPreviousTextures[0][1].texture);
            if (v14)
            {
              unsigned int v22 = v14;
              uint64_t v23 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              unsigned int v30 = v22;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v23,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to cache blur previous texture 1",  "affineGPUMetalV2.m",  2010LL,  v30);
            }

            else
            {
              unsigned int v15 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3->var8[3],  1LL,  0LL,  self->_blurPreviousTextures[0][2].texture);
              if (v15)
              {
                unsigned int v24 = v15;
                uint64_t v25 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                unsigned int v31 = v24;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v25,  "<<<< affineGPUMetalV2 >>>> Fig",  "err == 0 ",  "bail",  "Unable to cache blur previous texture 2",  "affineGPUMetalV2.m",  2012LL,  v31);
              }
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v16 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v26 = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v16,  "<<<< affineGPUMetalV2 >>>> Fig",  "config",  "bail",  "config is NULL",  "affineGPUMetalV2.m",  1900LL,  v26);
  }

- (void)_blurDuplicatedPixelsOnPixelBuffer:(__CVBuffer *)a3 validBufferRect:(CGRect *)a4 forDeltaMap:(BOOL)a5
{
  id v116 = 0LL;
  id v117 = 0LL;
  uint64_t v124 = 0LL;
  uint64_t v125 = 0LL;
  uint64_t v127 = 0LL;
  uint64_t v128 = 0LL;
  uint64_t v130 = 0LL;
  uint64_t v131 = 0LL;
  id v113 = 0LL;
  id v114 = 0LL;
  uint64_t v119 = 0LL;
  uint64_t v120 = 0LL;
  uint64_t v121 = 0LL;
  uint64_t v122 = 0LL;
  if (a3)
  {
    BOOL v6 = a5;
    unsigned int v9 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:]( self,  "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:",  a3,  1LL,  0LL,  &v115);
    if (v9)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v9, v5, v95, v96, v97, v98, v99, v101);
    }

    else
    {
      p_inputWidth = &self->_inputWidth;
      ++self->_blurPreviousTextureIndex[v6];
      *(void *)&self->_blurBorderVertices[42] = 0x3F800000BF800000LL;
      __asm { FMOV            V0.2S, #1.0 }

      *(void *)&self->_blurBorderVertices[50] = _D0;
      __asm { FMOV            V13.2S, #-1.0 }

      *(void *)&self->_blurBorderVertices[58] = _D13;
      *(void *)&self->_blurRenderIndices[1] = 0xBF8000003F800000LL;
      double height = self->_blurOverscan.height;
      double v15 = *(double *)&self->_blurNoiseRadius;
      uint64_t v110 = _D0;
      if (a4)
      {
        double height = height + a4->origin.x;
        double v15 = v15 + a4->origin.y;
      }

      uint64_t v16 = *(void *)&self->_swathMatricesBufferSize;
      uint64_t v17 = *(void *)&self->_texMatCount[4];
      uint32x2_t v19 = *(uint32x2_t *)p_inputWidth;
      uint64_t v18 = *(void *)&self->_outputWidth;
      v20.i64[0] = *(void *)p_inputWidth;
      v20.i64[1] = HIDWORD(*(void *)p_inputWidth);
      float64x2_t v21 = vcvtq_f64_u64(v20);
      float32x2_t v22 = 0LL;
      if (a4)
      {
        float64x2_t v105 = v21;
        uint64_t v108 = *(void *)&self->_texMatCount[4];
        BOOL IsNull = CGRectIsNull(*a4);
        float64x2_t v21 = v105;
        CGSize size = (CGSize)v105;
        uint64_t v17 = v108;
        if (!IsNull)
        {
          CGSize size = a4->size;
          float32x2_t v22 = vcvt_f32_f64((float64x2_t)a4->origin);
        }
      }

      else
      {
        CGSize size = (CGSize)v21;
      }

      uint64_t v25 = 0LL;
      BOOL v26 = v6;
      v27.i64[0] = v18;
      v27.i64[1] = HIDWORD(v18);
      float64x2_t v28 = vcvtq_f64_u64(v27);
      float v29 = height / v28.f64[0];
      float v106 = (float)(v29 * 2.0) + -1.0;
      float v30 = v15 / v28.f64[1];
      float v31 = (float)((float)(v29 * -2.0) + 1.0) + (float)((float)(v29 * -2.0) + 1.0);
      float v104 = (float)(v30 * -2.0) + 1.0;
      float v32 = v104 + v104;
      float32x2_t v33 = vcvt_f32_f64(vdivq_f64(v21, v28));
      *(float32x2_t *)&v28.f64[0] = vcvt_f32_u32(v19);
      float32x2_t v34 = vmla_f32( (float32x2_t)0x3F800000BF800000LL,  (float32x2_t)0xC000000040000000LL,  vdiv_f32(v22, *(float32x2_t *)&v28.f64[0]));
      *(float32x2_t *)&v28.f64[0] = vmla_f32( v34,  (float32x2_t)0xC000000040000000LL,  vdiv_f32(vcvt_f32_f64((float64x2_t)size), *(float32x2_t *)&v28.f64[0]));
      v140[0] = v34;
      v140[1] = __PAIR64__(v34.u32[1], LODWORD(v28.f64[0]));
      v34.i32[1] = HIDWORD(v28.f64[0]);
      v140[2] = v34;
      v140[3] = *(void *)&v28.f64[0];
      int v132 = 0;
      int v133 = v17 + v17 * HIDWORD(v17);
      int v134 = HIDWORD(v17);
      int v135 = v133 + HIDWORD(v17);
      _S9 = -0.5;
      do
      {
        simd_float3x3 v141 = __invert_f3(*(simd_float3x3 *)(v16 + 48LL * *(&v132 + v25)));
        _D3 = v140[v25];
        __asm { FMLA            S5, S9, V3.S[1] }

        v141.columns[0] = (simd_float3)vaddq_f32( (float32x4_t)v141.columns[2],  vmlaq_n_f32( vmulq_n_f32( (float32x4_t)v141.columns[0],  vmlas_n_f32(0.5, 0.5, *(float *)&_D3)),  (float32x4_t)v141.columns[1],  _S5));
        *(&v136 + v25++) = vmul_f32( vmla_f32( (float32x2_t)0x3F800000BF800000LL,  (float32x2_t)0xC000000040000000LL,  vdiv_f32( *(float32x2_t *)v141.columns[0].f32,  (float32x2_t)vdup_laneq_s32((int32x4_t)v141.columns[0], 2))),  v33);
      }

      while (v25 != 4);
      uint64_t v38 = 0LL;
      uint64_t v39 = 1LL;
      uint64_t v40 = 8LL;
      do
      {
        uint64_t v41 = v40;
        do
        {
          float32x2_t v42 = *(&v136 + v38);
          float32x2_t v43 = *(float32x2_t *)((char *)&v136 + v41);
          if ((vcgt_f32(v43, v42).i32[1] & 1) != 0)
          {
            *(&v136 + v38) = v43;
            *(float32x2_t *)((char *)&v136 + v41) = v42;
          }

          v41 += 8LL;
        }

        while (v41 != 32);
        ++v39;
        v40 += 8LL;
        uint64_t v38 = 1LL;
      }

      while (v39 != 3);
      float32x2_t v44 = v138;
      unsigned __int8 v45 = vcgt_f32(v138, v139).u8[0];
      _ZF = (v45 & 1) == 0;
      if ((v45 & 1) != 0) {
        float v47 = v138.f32[0];
      }
      else {
        float v47 = v139.f32[0];
      }
      if ((v45 & 1) != 0) {
        float v48 = v139.f32[0];
      }
      else {
        float v48 = v138.f32[0];
      }
      if ((v45 & 1) != 0) {
        float32x2_t v49 = v138;
      }
      else {
        float32x2_t v49 = v139;
      }
      if (!_ZF) {
        float32x2_t v44 = v139;
      }
      if ((vcgt_f32(v136, v137).u8[0] & 1) != 0) {
        unsigned int v50 = -1;
      }
      else {
        unsigned int v50 = 0;
      }
      int8x8_t v51 = (int8x8_t)vdup_n_s32(v50);
      int8x8_t v52 = vbsl_s8(v51, (int8x8_t)v137, (int8x8_t)v136);
      int8x8_t v53 = vbsl_s8(v51, (int8x8_t)v136, (int8x8_t)v137);
      *(void *)&self->_blurRenderVertices[10] = 0x3F800000BF800000LL;
      float v54 = *(float *)&v52.i32[1];
      float v55 = *(float *)&v53.i32[1];
      else {
        float v56 = -1.0;
      }
      HIDWORD(v57) = v52.i32[1];
      *(int8x8_t *)&self->_blurRenderVertices[50] = v52;
      *(float *)&v52.i32[1] = v54;
      *(int8x8_t *)&self->_blurRenderVertices[18] = v52;
      *(void *)&self->_blurRenderVertices[26] = __PAIR64__(LODWORD(v55), v53.u32[0]);
      *(float *)&uint64_t v57 = v56;
      *(void *)&self->_blurRenderVertices[34] = v110;
      *(int8x8_t *)&self->_blurRenderVertices[58] = v53;
      else {
        float v58 = 1.0;
      }
      *(float *)v53.i32 = v58;
      *(void *)&self->_blurRenderVertices[42] = v57;
      *(int8x8_t *)&self->_blurRenderVertices[66] = v53;
      if (v48 > -1.0) {
        float v48 = -1.0;
      }
      *(void *)&self->_blurRenderVertices[74] = __PAIR64__(v44.u32[1], LODWORD(v48));
      *(float32x2_t *)&self->_blurRenderVertices[82] = v44;
      *(float32x2_t *)&self->_blurRenderVertices[90] = v49;
      if (v47 < 1.0) {
        float v47 = 1.0;
      }
      *(void *)&self->_blurRenderVertices[98] = __PAIR64__(v49.u32[1], LODWORD(v47));
      *(void *)&self->_blurRenderVertices[106] = _D13;
      if (v44.f32[1] <= -1.0) {
        float v59 = v44.f32[1];
      }
      else {
        float v59 = -1.0;
      }
      v44.f32[1] = v59;
      *(float32x2_t *)&self->_blurRenderVertices[114] = v44;
      if (v49.f32[1] <= -1.0) {
        float v60 = v49.f32[1];
      }
      else {
        float v60 = -1.0;
      }
      v49.f32[1] = v60;
      *(float32x2_t *)&self->_blurRenderVertices[122] = v49;
      *(void *)self->_blurFrameCounter = 0xBF8000003F800000LL;
      int v61 = HIDWORD(self->_blurOverscan.width) & 1;
      blurTempTextures = self->_blurTempTextures;
      __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE( &v118[24 * (HIDWORD(self->_blurOverscan.width) & 1)],  self->_blurPreviousTextures[v26][*(&self->_blurTempTextures[0][0].count + v26)].texture);
      __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v118[24 * (v61 ^ 1)], self->_blurTempTextures[v26][0].texture);
      LODWORD(width_high) = HIDWORD(self->_blurOverscan.width);
      if ((_DWORD)width_high)
      {
        unint64_t v63 = 0LL;
        uint64_t v64 = 0LL;
        *(float *)v65.i32 = v106;
        *(float *)&uint64_t v66 = v106 + v31;
        *(float *)&v65.i32[1] = v104 - v32;
        int32x2_t v103 = v65;
        *((float *)&v66 + 1) = v104 - v32;
        uint64_t v102 = v66;
        _S9 = 10.0;
        _S10 = -10.0;
        do
        {
          uint64_t v69 = (width_high - 1);
          if (v63 == v69)
          {
            BOOL v70 = self->_blurPreviousTextureIndex[v26] > 2;
            if (!v63) {
              goto LABEL_61;
            }
            texture = self->_blurPreviousTextures[v26][0].texture;
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v123, &texture[3 * *(&(*blurTempTextures)[0].count + v26)]);
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE( &v126,  &texture[3 * ((*(&(*blurTempTextures)[0].count + v26) + 1) % 3)]);
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE( &v129,  &texture[3 * ((*(&(*blurTempTextures)[0].count + v26) + 2) % 3)]);
            uint64_t v73 = 3LL;
          }

          else
          {
            if (!v63)
            {
              BOOL v70 = 0;
LABEL_61:
              __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v123, &v115);
              uint64_t v73 = 1LL;
              v72.i32[0] = 2.0;
LABEL_62:
              unsigned int v74 = self->_blurRadiusTable[v63 + 8];
              goto LABEL_63;
            }

            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v123, &v118[24 * (v64 ^ 1)]);
            BOOL v70 = 0;
            uint64_t v73 = 1LL;
          }

          v72.i32[0] = 4.0;
          if (v63 <= 9) {
            goto LABEL_62;
          }
          unsigned int v74 = 1;
LABEL_63:
          _D5 = vdiv_f32((float32x2_t)vdup_lane_s32(v72, 0), vcvt_f32_u32(*(uint32x2_t *)&self->_outputWidth));
          *(float *)v82.i32 = vmlas_n_f32(v106, 10.0, _D5.f32[0]);
          __asm { FMLA            S1, S10, V5.S[1] }

          double v77 = COERCE_DOUBLE(__PAIR64__(_S1, v82.u32[0]));
          *(float *)&uint64_t v83 = vmlas_n_f32(v106 + v31, -10.0, _D5.f32[0]);
          double v78 = COERCE_DOUBLE(__PAIR64__(_S1, v83));
          float32x2_t v109 = _D5;
          __asm { FMLA            S1, S9, V5.S[1] }

          v82.i32[1] = _S1;
          HIDWORD(v83) = _S1;
          double v84 = COERCE_DOUBLE(__PAIR64__(LODWORD(v104), LODWORD(v106)));
          if (!(!_ZF & _CF)) {
            double v84 = v77;
          }
          double v85 = COERCE_DOUBLE(__PAIR64__(LODWORD(v104), v106 + v31));
          if (!_ZF & _CF) {
            int32x2_t v82 = v103;
          }
          else {
            double v85 = v78;
          }
          if (!_ZF & _CF) {
            uint64_t v83 = v102;
          }
          *(double *)&self->_blurBorderVertices[42] = v84;
          *(double *)&self->_blurBorderVertices[50] = v85;
          *(int32x2_t *)&self->_blurBorderVertices[58] = v82;
          *(void *)&self->_blurRenderIndices[1] = v83;
          if (v63 == v69) {
            float v86 = &v115;
          }
          else {
            float v86 = (int *)&v118[24 * v64];
          }
          if (v63 == v69) {
            *(float *)v82.i32 = 1.0;
          }
          else {
            *(float *)v82.i32 = 2.0;
          }
          int32x2_t v111 = v82;
          __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v112, v86);
          float32x2_t v87 = vcvt_f32_u32(*(uint32x2_t *)&self->_outputWidth);
          *(float32x2_t *)&self->_anon_3f9[19] = vmul_n_f32( vdiv_f32((float32x2_t)vdup_lane_s32(v111, 0), v87),  (float)v74 + 0.5);
          float32x2_t v88 = 0LL;
          if (!v63) {
            float32x2_t v88 = vmul_n_f32(v109, (float)*(int *)&self->_blurRadiusTable[4]);
          }
          *(float32x2_t *)&self->_anon_3f9[27] = v88;
          if (v63 == v69)
          {
            int v89 = 96;
            int v90 = 128;
            unsigned int v91 = &self->_blurRenderVertices[10];
            float v92 = &self->_blurRenderIndices[5];
          }

          else
          {
            int v89 = 48;
            int v90 = 64;
            unsigned int v91 = &self->_blurBorderVertices[10];
            float v92 = &self->_blurBorderIndices[4];
          }

          *(void *)&self->_blurVertexSize = v91;
          LODWORD(self->_blurVertexIndices) = v90;
          *(void *)&self->_blurVertexIndicesSize = v92;
          self->_P3ToBT2020ConversionMethod = v89;
          *(float32x2_t *)&self->_blurPasses = v87;
          self->_anon_3f9[11] = v70;
          -[affineGPUMetal _renderBlurInputTextures:inputTexturesCount:outputTextures:]( self,  "_renderBlurInputTextures:inputTexturesCount:outputTextures:",  &v123,  v73,  &v112);
          v64 ^= 1uLL;
          ++v63;
          unint64_t width_high = HIDWORD(self->_blurOverscan.width);
        }

        while (v63 < width_high);
      }

      *(&(*blurTempTextures)[0].count + v26) = (*(&(*blurTempTextures)[0].count + v26) + 1) % 3;
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v5, v95, v96, v97, v98, v99, v101);
  }

  for (uint64_t i = 0LL; i != -48; i -= 24LL)
  {
  }

  for (uint64_t j = 0LL; j != -72; j -= 24LL)
  {
  }
}

- (int)_duplicateBottomRowsOnPixelBuffer:(__CVBuffer *)a3
{
  if (!self->_pipelineComputeStates[0] || !*((_BYTE *)&self->_P3ToBT2020ConversionMethod + 4)) {
    return 0;
  }
  if (!a3)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "pixelBuffer",  "bail",  "pixelBuffer is NULL",  "affineGPUMetalV2.m",  2275LL,  0);
    return 0;
  }

  CVPixelBufferGetExtendedPixels(a3, 0LL, 0LL, 0LL, &extraRowsOnBottom);
  int v6 = 0;
  if (CVPixelBufferGetHeight(a3) == 1080 && extraRowsOnBottom == 8)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 875704438 || CVPixelBufferGetPixelFormatType(a3) == 875704422)
    {
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
      if (!IOSurface)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  (const char *)v19,  *((const char **)&v19 + 1),  v20,  v21,  v22,  v23.i32[0]);
        return -12782;
      }

      BOOL v8 = IOSurface;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
      id v10 = [v9 newBufferWithIOSurface:v8];

      if (!v10)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  (const char *)v19,  *((const char **)&v19 + 1),  v20,  v21,  v22,  v23.i32[0]);
        return -12786;
      }

      uint64_t v24 = 0x43800000437LL;
      int OffsetOfPlane = IOSurfaceGetOffsetOfPlane(v8, 1LL);
      int v25 = OffsetOfPlane - IOSurfaceGetOffsetOfPlane(v8, 0LL);
      int BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v8, 0LL);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 commandBuffer]);

      if (!v13)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  (const char *)v19,  *((const char **)&v19 + 1),  v20,  v21,  v22,  v23.i32[0]);
        int v6 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

        return v6;
      }

      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 computeCommandEncoder]);
      if (!v14)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  (const char *)v19,  *((const char **)&v19 + 1),  v20,  v21,  v22,  v23.i32[0]);
        int v6 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

        return v6;
      }

      double v15 = v14;
      [v14 setComputePipelineState:self->_pipelineComputeStates[0]];
      [v15 setBuffer:v10 offset:0 atIndex:0];
      [v15 setBytes:&v24 length:16 atIndex:1];
      float32x2_t v22 = (const char *)(((CVPixelBufferGetWidth(a3) >> 1) + 31) >> 5);
      int64x2_t v23 = vdupq_n_s64(1uLL);
      __int128 v19 = xmmword_378D0;
      uint64_t v20 = 1LL;
      [v15 dispatchThreadgroups:&v22 threadsPerThreadgroup:&v19];
      [v15 endEncoding];
      -[affineGPUMetal _addCommandBufferHandler:](self, "_addCommandBufferHandler:", v13);
      [v13 commit];
      CVBufferSetAttachment( a3,  kCVPixelBufferExtendedPixelsFilledKey,  kCFBooleanTrue,  kCVAttachmentMode_ShouldNotPropagate);
    }

    else
    {
      uint64_t v18 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v18,  "<<<< affineGPUMetalV2 >>>> Fig",  "( CVPixelBufferGetPixelFormatType( pixelBuffer) == kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange) ||(CVPix elBufferGetPixelFormatType( pixelBuffer) == kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)",  "bail",  "Replication of rows work only on 8bits uncompressed pixel buffers",  "affineGPUMetalV2.m",  2293LL,  0);
    }

    return 0;
  }

  return v6;
}

- (id)_compileShader:(id)a3 fragment:(id)a4 pixelFormat:(unint64_t)a5 deltaMapPixelFormat:(unint64_t)a6 unstyledPixelFormat:(unint64_t)a7 constants:(id)a8
{
  double v15 = (char *)a3;
  id v16 = a4;
  id v17 = a8;
  uint64_t v18 = v17;
  if (!v15)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "vertex",  "bail",  "vertex shader name is nil",  "affineGPUMetalV2.m",  3088LL,  0);
LABEL_18:
    __int128 v19 = 0LL;
LABEL_22:
    id v36 = 0LL;
    goto LABEL_14;
  }

  if (!v16)
  {
    uint64_t v39 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v39,  "<<<< affineGPUMetalV2 >>>> Fig",  "fragment",  "bail",  "fragment shader name is nil",  "affineGPUMetalV2.m",  3089LL,  0);
    goto LABEL_18;
  }

  if (!v17)
  {
    uint64_t v40 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v40,  "<<<< affineGPUMetalV2 >>>> Fig",  "constants",  "bail",  "metal function constants nil",  "affineGPUMetalV2.m",  3090LL,  0);
    goto LABEL_18;
  }

  __int128 v19 = objc_opt_new(&OBJC_CLASS___MTLRenderPipelineDescriptor);
  if (!v19)
  {
    uint64_t v41 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v41,  "<<<< affineGPUMetalV2 >>>> Fig",  "pipelineDescriptor",  "bail",  0LL,  "affineGPUMetalV2.m",  3093LL,  0);
LABEL_21:
    FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_22;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext library](self->_metalContext, "library"));
  id v21 = [v20 newFunctionWithName:v15];
  -[MTLRenderPipelineDescriptor setVertexFunction:](v19, "setVertexFunction:", v21);

  float32x2_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor vertexFunction](v19, "vertexFunction"));
  if (!v22)
  {
    uint64_t v42 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v42,  "<<<< affineGPUMetalV2 >>>> Fig",  "pipelineDescriptor.vertexFunction",  "bail",  0LL,  "affineGPUMetalV2.m",  3096LL,  0);
    goto LABEL_21;
  }

  float32x2_t v43 = v15;
  int64x2_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext library](self->_metalContext, "library"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext pipelineLibrary](self->_metalContext, "pipelineLibrary"));
  id v25 = [v23 newFunctionWithName:v16 constantValues:v18 pipelineLibrary:v24 error:0];
  -[MTLRenderPipelineDescriptor setFragmentFunction:](v19, "setFragmentFunction:", v25);

  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor fragmentFunction](v19, "fragmentFunction"));
  if (v26)
  {
    uint64x2_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext fullRangeVertexDesc](self->_metalContext, "fullRangeVertexDesc"));
    -[MTLRenderPipelineDescriptor setVertexDescriptor:](v19, "setVertexDescriptor:", v27);

    float64x2_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext pipelineLibrary](self->_metalContext, "pipelineLibrary"));
    -[MTLRenderPipelineDescriptor setPipelineLibrary:](v19, "setPipelineLibrary:", v28);

    float v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v19, "colorAttachments"));
    float v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:0]);
    [v30 setPixelFormat:a5];

    if (a6)
    {
      float v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v19, "colorAttachments"));
      float v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:1]);
      [v32 setPixelFormat:a6];
    }

    if (a7)
    {
      float32x2_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v19, "colorAttachments"));
      float32x2_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:2]);
      [v34 setPixelFormat:a7];
    }

    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
    id v36 = [v35 newRenderPipelineStateWithDescriptor:v19 error:0];

    if (!v36)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v8, v8, v43, v44, v45, v46, v47);
      FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v8, v8, v43, v44, v45, v46, v47);
    FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    id v36 = 0LL;
  }

  double v15 = (char *)v43;
LABEL_14:

  return v36;
}

- (int)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 isTwoPass:(BOOL)a4 isOptimized:(BOOL)a5 textures:(id *)a6
{
  CVMetalTextureRef image = 0LL;
  if (!a3)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "pixelBuffer",  "bail",  "pixelBuffer is NULL",  "affineGPUMetalV2.m",  3134LL,  0);
LABEL_182:
    double v15 = 0LL;
    CVReturn v13 = -12780;
    goto LABEL_175;
  }

  if (!a6)
  {
    uint64_t v57 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v57,  "<<<< affineGPUMetalV2 >>>> Fig",  "textures",  "bail",  "textures is NULL",  "affineGPUMetalV2.m",  3135LL,  0);
    goto LABEL_182;
  }

  BOOL v7 = a5;
  BOOL v8 = a4;
  cacheOut = &self->_cvMetalTextureCacheRef;
  if (!self->_cvMetalTextureCacheRef)
  {
    CFStringRef v72 = kCVMetalTextureCacheMaximumTextureAgeKey;
    uint64_t v73 = &off_397B0;
    uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
    CVReturn v13 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v11, v12, 0LL, cacheOut);

    if (v13)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v13,  v65,  v64,  v65,  (_DWORD)cacheOut,  pixelBuffer,  (const char *)image,  (_DWORD)v70);

      double v15 = 0LL;
      goto LABEL_175;
    }
  }

  a6->int var0 = 0;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  double v15 = 0LL;
  CVReturn v13 = -12782;
  CVPixelBufferRef pixelBuffera = a3;
  if (PixelFormatType <= 1111970368)
  {
    if (PixelFormatType <= 762869295)
    {
      if (PixelFormatType <= 645428785)
      {
        if (PixelFormatType > 645424687)
        {
          if (PixelFormatType != 645424688)
          {
            if (PixelFormatType != 645424690)
            {
              int v16 = 645428784;
              goto LABEL_73;
            }

- (int)_getTransformShaderParameters:(unint64_t)a3 isLuma:(BOOL)a4 isRGB:(BOOL)a5 isAttachment:(BOOL)a6 pixelRatio:(unsigned int *)a7 pipelineIndexToUse:(int *)a8
{
  if (!a7)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "pixelRatio",  "bail",  "pixelRatio is NULL",  "affineGPUMetalV2.m",  3492LL,  0);
    return -12780;
  }

  if (!a8)
  {
    uint64_t v17 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v17,  "<<<< affineGPUMetalV2 >>>> Fig",  "pipelineIndexToUse",  "bail",  "pipelineIndexToUse is NULL",  "affineGPUMetalV2.m",  3493LL,  0);
    return -12780;
  }

  if ((uint64_t)a3 > 109)
  {
    if ((uint64_t)a3 <= 587)
    {
      switch(a3)
      {
        case 0x21CuLL:
          if (self->_bgCubePtr)
          {
            int v9 = 10;
            if (*(void *)&self->_srlFixOn)
            {
              if (self->_foregroundColorCube) {
                int v9 = 12;
              }
              else {
                int v9 = 10;
              }
            }
          }

          else
          {
            int v9 = 10;
          }

          int result = 0;
          else {
            int v11 = v9;
          }
          goto LABEL_52;
        case 0x21DuLL:
        case 0x21EuLL:
        case 0x221uLL:
          goto LABEL_30;
        case 0x21FuLL:
          int result = 0;
          BOOL v13 = LODWORD(self->_intermediateOutputPixelBuffer) == 2;
          int v11 = 17;
          int v14 = 24;
          goto LABEL_35;
        case 0x220uLL:
          int result = 0;
          int v11 = 26;
          goto LABEL_52;
        case 0x222uLL:
          int result = 0;
          BOOL v13 = LODWORD(self->_intermediateOutputPixelBuffer) == 2;
          int v11 = 20;
          int v14 = 25;
LABEL_35:
          if (v13) {
            int v11 = v14;
          }
          break;
        case 0x223uLL:
          int result = 0;
          int v11 = 29;
          goto LABEL_52;
        default:
          if (a3 != 110) {
            goto LABEL_30;
          }
          int result = 0;
          int v11 = 46;
          break;
      }

      goto LABEL_52;
    }

    if (a3 == 588)
    {
      int result = 0;
      int v11 = 7;
      goto LABEL_52;
    }

    if (a3 == 589)
    {
      int result = 0;
      int v11 = 8;
      goto LABEL_52;
    }

    goto LABEL_30;
  }

  if ((uint64_t)a3 <= 29)
  {
    switch(a3)
    {
      case 0xAuLL:
        int result = 0;
        int v11 = 2;
        goto LABEL_52;
      case 0x14uLL:
        int result = 0;
        int v11 = 4;
        goto LABEL_52;
      case 0x19uLL:
        int result = 0;
        int v11 = 44;
        goto LABEL_52;
    }

- (int)_allocateSemanticStyleColorCubeTextures
{
  int v3 = objc_opt_new(&OBJC_CLASS___MTLTextureDescriptor);
  unsigned int v4 = v3;
  if (!v3)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< affineGPUMetalV2 >>>> Fig",  "textureDesc",  "bail",  "Unable to allocate textureDesc",  "affineGPUMetalV2.m",  3910LL,  0);
LABEL_9:
    int v11 = -12786;
    goto LABEL_5;
  }

  -[MTLTextureDescriptor setTextureType:](v3, "setTextureType:", 2LL);
  -[MTLTextureDescriptor setHeight:](v4, "setHeight:", 1024LL);
  -[MTLTextureDescriptor setWidth:](v4, "setWidth:", 32LL);
  -[MTLTextureDescriptor setPixelFormat:](v4, "setPixelFormat:", 70LL);
  -[MTLTextureDescriptor setUsage:](v4, "setUsage:", 7LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
  int v6 = (__CVBuffer *)[v5 newTextureWithDescriptor:v4];
  segmentationMask = self->_segmentationMask;
  self->_segmentationMask = v6;

  if (!self->_segmentationMask)
  {
    uint64_t v14 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v14,  "<<<< affineGPUMetalV2 >>>> Fig",  "_bgCubeTexture",  "bail",  "Unable to allocate _bgCubeTexture",  "affineGPUMetalV2.m",  3919LL,  0);
    goto LABEL_9;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
  int v9 = (MTLTexture *)[v8 newTextureWithDescriptor:v4];
  bgCubeid Texture = self->_bgCubeTexture;
  self->_bgCubeid Texture = v9;

  if (!self->_bgCubeTexture)
  {
    uint64_t v15 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v15,  "<<<< affineGPUMetalV2 >>>> Fig",  "_fgCubeTexture",  "bail",  "Unable to allocate _fgCubeTexture",  "affineGPUMetalV2.m",  3922LL,  0);
    goto LABEL_9;
  }

  int v11 = 0;
LABEL_5:

  return v11;
}

- (int)updateCubesIfNeeded
{
  if ((self->_bgCubeTexture && self->_segmentationMask
     || (-[affineGPUMetal _allocateSemanticStyleColorCubeTextures](self, "_allocateSemanticStyleColorCubeTextures"),
         self->_bgCubeTexture))
    && self->_segmentationMask)
  {
    unsigned int v4 = -[NSData bytes](self->_backgroundColorCube, "bytes");
    if (v4)
    {
      int v5 = v4;
      if (self->_bgCubePtr != v4)
      {
        bgCubeid Texture = self->_bgCubeTexture;
        memset(v16, 0, sizeof(v16));
        __int128 v17 = xmmword_378E0;
        uint64_t v18 = 1LL;
        -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:]( bgCubeTexture,  "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:",  v16,  0LL,  0LL,  v5,  128LL,  0LL);
        self->_bgCubePtr = v5;
      }
    }

    id v7 = [(id)self->_fgCubePtr bytes];
    if (v7)
    {
      id v8 = v7;
      if (*(id *)&self->_srlFixOn != v7)
      {
        segmentationMask = self->_segmentationMask;
        unsigned int v12 = 0LL;
        uint64_t v13 = 0LL;
        int v11 = 0LL;
        __int128 v14 = xmmword_378E0;
        uint64_t v15 = 1LL;
        -[__CVBuffer replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:]( segmentationMask,  "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:",  &v11,  0LL,  0LL,  v8,  128LL,  0LL);
        *(void *)&self->_srlFixOn = v8;
      }
    }

    return 0;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v11,  v12,  v13,  (const char *)v14,  *((const char **)&v14 + 1),  v15);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void).cxx_destruct
{
  for (unint64_t i = 0LL; i != -144LL; i -= 24LL)
  {
  }

  for (unint64_t j = 0LL; j != -96LL; j -= 24LL)
  {
  }

  objc_storeStrong((id *)&self->_vertexIndicesBuffer, 0LL);
  objc_storeStrong((id *)&self->_matricesBuffer, 0LL);
  objc_storeStrong((id *)&self->_verticesBuffer, 0LL);
  objc_storeStrong((id *)self->_pipelineComputeStates, 0LL);
  for (uint64_t k = 61LL; k != 1; --k)
    objc_storeStrong((id *)&(&self->super.isa)[k], 0LL);
  objc_storeStrong((id *)&self->_metalContext, 0LL);
}

@end