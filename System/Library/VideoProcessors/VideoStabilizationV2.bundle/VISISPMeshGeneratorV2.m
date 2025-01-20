@interface VISISPMeshGeneratorV2
- (NSData)ISPMeshParams;
- (VISISPMeshGeneratorV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4;
- (__n128)gridSize;
- (__n128)inputSize;
- (__n128)outputSize;
- (int)generateMeshWithTransforms:(float *)(a3 transforms3x3:validBufferRect:ltmLUT:;
- (int)setup;
- (void)dealloc;
- (void)setGridSize:(VISISPMeshGeneratorV2 *)self;
- (void)setInputSize:(VISISPMeshGeneratorV2 *)self;
- (void)setOutputSize:(VISISPMeshGeneratorV2 *)self;
@end

@implementation VISISPMeshGeneratorV2

- (VISISPMeshGeneratorV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___VISISPMeshGeneratorV2;
  v9 = -[VISISPMeshGeneratorV2 init](&v25, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_metalContext, a3);
  metalContext = v10->_metalContext;
  if (!metalContext)
  {
    v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v10, v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]( objc_alloc(&OBJC_CLASS___FigMetalContext),  "initWithbundle:andOptionalCommandQueue:",  v14,  v8);
    v16 = v10->_metalContext;
    v10->_metalContext = v15;

    metalContext = v10->_metalContext;
    if (!metalContext) {
      goto LABEL_10;
    }
  }

  if (v8)
  {
    -[FigMetalContext setCommandQueue:](metalContext, "setCommandQueue:", v8);
    metalContext = v10->_metalContext;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](metalContext, "device"));
  v18 = (MTLBuffer *)[v17 newBufferWithLength:648652 options:0];
  meshParamsBuffer = v10->_meshParamsBuffer;
  v10->_meshParamsBuffer = v18;

  v20 = v10->_meshParamsBuffer;
  if (!v20) {
    goto LABEL_10;
  }
  uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  -[MTLBuffer contents](v20, "contents"),  648652LL,  0LL));
  ISPMeshParams = v10->_ISPMeshParams;
  v10->_ISPMeshParams = (NSData *)v21;

  if (v10->_ISPMeshParams) {
    v23 = v10;
  }
  else {
LABEL_10:
  }
    v23 = 0LL;

  return v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VISISPMeshGeneratorV2;
  -[VISISPMeshGeneratorV2 dealloc](&v3, "dealloc");
}

- (int)setup
{
  return 0;
}

- (int)generateMeshWithTransforms:(float *)(a3 transforms3x3:validBufferRect:ltmLUT:
{
  double v6 = v5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a5;
  v13 = -[NSData bytes](self->_ISPMeshParams, "bytes");
  if (*(unsigned __int16 *)self->_inputSize >= *(unsigned __int16 *)self->_outputSize
    && *(unsigned __int16 *)&self->_inputSize[2] >= *(unsigned __int16 *)&self->_outputSize[2])
  {
    v17 = v13;
    _DWORD *v13 = 1;
    *((_WORD *)v13 + 2) = y;
    *((_WORD *)v13 + 3) = width;
    *((_WORD *)v13 + 4) = height;
    *((_WORD *)v13 + 5) = v6;
    v13[3] = 0;
    *((_WORD *)v13 + 8) = *(_WORD *)self->_outputSize;
    *((_WORD *)v13 + 9) = *(_WORD *)&self->_outputSize[2];
    *((_BYTE *)v13 + 20) = 1;
    v13[6] = 0;
    unsigned __int16 v18 = *(_WORD *)self->_gridSize;
    v75 = v12;
    if (v18)
    {
      uint32x2_t v19 = *(uint32x2_t *)&x;
      int v20 = HIDWORD(x);
    }

    else
    {
      int v20 = 0;
      unsigned __int16 v18 = *(_WORD *)self->_outputSize;
      uint32x2_t v19 = *(uint32x2_t *)&x;
    }

    int32x2_t v21 = (int32x2_t)vmax_u32(v19, (uint32x2_t)0x200000002LL);
    int v22 = *(unsigned __int16 *)&self->_outputSize[2];
    if (*(_WORD *)&self->_gridSize[2]) {
      unsigned __int16 v23 = *(_WORD *)&self->_gridSize[2];
    }
    else {
      unsigned __int16 v23 = *(_WORD *)&self->_outputSize[2];
    }
    int v24 = *(unsigned __int16 *)self->_inputSize;
    int v25 = *(unsigned __int16 *)self->_outputSize;
    int v26 = *(unsigned __int16 *)&self->_inputSize[2];
    v27 = *(void **)self->_inputPoints;
    int32x2_t v77 = v21;
    if (v27)
    {
      if (*(void *)&v21 == __PAIR64__( *(unsigned __int16 *)&self->_inputPointsCount[2],  *(unsigned __int16 *)self->_inputPointsCount)) {
        goto LABEL_16;
      }
      *(void *)self->_inputPoints = 0LL;
      free(v27);
      int32x2_t v21 = v77;
    }

    *(_WORD *)&self->_inputPointsCount[2] = v21.i16[2];
    *(_WORD *)self->_inputPointsCount = v21.i16[0];
    v28 = malloc(16LL * vmul_lane_s32(v21, v21, 1).u32[0]);
    int32x2_t v21 = v77;
    *(void *)self->_inputPoints = v28;
    if (!v28)
    {
      v73 = 0LL;
      int v74 = 0;
      id v12 = v75;
      goto LABEL_32;
    }

- (__n128)inputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 40);
  WORD2(v1) = *(_WORD *)(a1 + 42);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setInputSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_inputSize = v2;
}

- (__n128)outputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 44);
  WORD2(v1) = *(_WORD *)(a1 + 46);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setOutputSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_outputSize = v2;
}

- (__n128)gridSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 48);
  WORD2(v1) = *(_WORD *)(a1 + 50);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setGridSize:(VISISPMeshGeneratorV2 *)self
{
  *(_DWORD *)self->_gridSize = v2;
}

- (NSData)ISPMeshParams
{
  return self->_ISPMeshParams;
}

- (void).cxx_destruct
{
}

@end