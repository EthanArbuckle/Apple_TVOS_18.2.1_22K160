@interface VISISPRendererV2
- (BOOL)_isPixelBuffer422:(__CVBuffer *)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (VISISPRendererV2)initWithISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3 metalContext:(id)a4 metalCommandQueue:(id)a5;
- (VISISPRendererV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4;
- (VISRendererDelegate)delegate;
- (__n128)gridSize;
- (__n128)inputSize;
- (__n128)outputSize;
- (int)_compileShaders;
- (int)enqueuePixelBufferForRendering:(VISISPRendererV2 *)self inputValidBufferRect:(SEL)a2 metadata:(__CVBuffer *)a3 ltmLUT:(CGRect *)a4 outputPixelBuffer:(id)a5 transformCounts:(id)a6 transforms3x3:(__CVBuffer *)a7 transformStrides:(float *)(a8;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (unsigned)extendedOutputRowsToFill;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtendedOutputRowsToFill:(unsigned int)a3;
- (void)setGridSize:(VISISPRendererV2 *)self;
- (void)setInputSize:(VISISPRendererV2 *)self;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutputSize:(VISISPRendererV2 *)self;
- (void)setTuningParameters:(id)a3;
@end

@implementation VISISPRendererV2

- (VISISPRendererV2)initWithISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3 metalContext:(id)a4 metalCommandQueue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VISISPRendererV2;
  v11 = -[VISISPRendererV2 init](&v21, "init");
  v12 = v11;
  if (!v11) {
    goto LABEL_9;
  }
  v11->_ispProcessingSession = a3;
  objc_storeStrong((id *)&v11->_metalContext, a4);
  metalContext = v12->_metalContext;
  if (!metalContext)
  {
    v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v12, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]( objc_alloc(&OBJC_CLASS___FigMetalContext),  "initWithbundle:andOptionalCommandQueue:",  v16,  v10);
    v18 = v12->_metalContext;
    v12->_metalContext = v17;

    metalContext = v12->_metalContext;
    if (!metalContext) {
      goto LABEL_9;
    }
  }

  if (v10) {
    -[FigMetalContext setCommandQueue:](metalContext, "setCommandQueue:", v10);
  }
  if (!-[VISISPRendererV2 _compileShaders](v12, "_compileShaders")) {
    v19 = v12;
  }
  else {
LABEL_9:
  }
    v19 = 0LL;

  return v19;
}

- (VISISPRendererV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VISISPRendererV2;
  -[VISISPRendererV2 dealloc](&v3, "dealloc");
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (a3 - 1 > 2) {
    goto LABEL_30;
  }
  if (self->_setupCompleted) {
    goto LABEL_30;
  }
  v6 = AffineTransformContextAlloc(self->_metalCommandQueue);
  self->_gpuRenderer = v6;
  if (!v6) {
    goto LABEL_30;
  }
  p_ispProcessingSession = &self->_ispProcessingSession;
  ispProcessingSession = self->_ispProcessingSession;
  if (!ispProcessingSession)
  {
    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v32
      && (Function = (uint64_t (*)(const CFAllocatorRef, void, OpaqueFigCaptureDevice **))FigCaptureGetCaptureDeviceCreateFunction()) != 0LL)
    {
      p_ispCaptureDevice = &self->_ispCaptureDevice;
      int v35 = Function(kCFAllocatorDefault, 0LL, &self->_ispCaptureDevice);
      if (v35)
      {
        LODWORD(v9) = v35;
      }

      else
      {
        if (a3 == 3) {
          v36 = &off_39E58;
        }
        else {
          v36 = &off_39E70;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v36,  kFigCaptureISPProcessingSessionConfigurationKey_SessionType);
        id v9 = (OpaqueFigCaptureISPProcessingSession *)*p_ispCaptureDevice;
        v37 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, const CFAllocatorRef, NSMutableDictionary *, OpaqueFigCaptureISPProcessingSession **))(*(void *)(CMBaseObjectGetVTable(*p_ispCaptureDevice) + 16) + 8LL);
        if (v37)
        {
          LODWORD(v9) = v37(v9, kCFAllocatorDefault, v32, &self->_ispProcessingSession);
          if (!(_DWORD)v9)
          {

            goto LABEL_6;
          }
        }

        else
        {
          LODWORD(v9) = -12782;
        }
      }
    }

    else
    {
      LODWORD(v9) = 0;
    }

    goto LABEL_43;
  }

  CFRetain(ispProcessingSession);
LABEL_6:
  id v9 = *p_ispProcessingSession;
  if (!*p_ispProcessingSession) {
    return (int)v9;
  }
  id v10 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, void, const CFAllocatorRef, NSArray **))(*(void *)(CMBaseObjectGetVTable(*p_ispProcessingSession) + 8) + 48LL);
  if (!v10) {
    goto LABEL_31;
  }
  p_ispOutputIdentifiers = &self->_ispOutputIdentifiers;
  int v12 = v10( v9,  kFigCaptureISPProcessingSessionProperty_SupportedOutputs,  kCFAllocatorDefault,  &self->_ispOutputIdentifiers);
  if (v12)
  {
    LODWORD(v9) = v12;
    goto LABEL_44;
  }

  if (!-[NSArray count](*p_ispOutputIdentifiers, "count")) {
    goto LABEL_30;
  }
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v13 = *p_ispOutputIdentifiers;
  v14 = (char *)-[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v62;
    while (1)
    {
      if (*(void *)v62 != v15) {
        objc_enumerationMutation(v13);
      }
      if (!--v14)
      {
        v14 = (char *)-[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
        if (!v14) {
          break;
        }
      }
    }
  }

  id v9 = *p_ispProcessingSession;
  v16 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, void, const CFAllocatorRef, NSDictionary **))(*(void *)(CMBaseObjectGetVTable(*p_ispProcessingSession) + 8) + 48LL);
  if (!v16) {
    goto LABEL_31;
  }
  LODWORD(v9) = v16( v9,  kFigCaptureISPProcessingSessionProperty_InputPixelBufferAttributes,  kCFAllocatorDefault,  &self->_ispInputPixelBufferAttributes);
  if ((_DWORD)v9) {
    goto LABEL_44;
  }
  id v9 = *p_ispProcessingSession;
  v17 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, void, const CFAllocatorRef, NSDictionary **))(*(void *)(CMBaseObjectGetVTable(*p_ispProcessingSession) + 8) + 48LL);
  if (!v17)
  {
LABEL_31:
    LODWORD(v9) = -12782;
    goto LABEL_44;
  }

  LODWORD(v9) = v17( v9,  kFigCaptureISPProcessingSessionProperty_OutputPixelBufferAttributes,  kCFAllocatorDefault,  &self->_ispOutputPixelBufferAttributes);
  if ((_DWORD)v9) {
    goto LABEL_44;
  }
  v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1LL);
  ispRendererLock = self->_ispRendererLock;
  self->_ispRendererLock = v18;

  if (!self->_ispRendererLock) {
    goto LABEL_30;
  }
  v20 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  ispWait = self->_ispWait;
  self->_ispWait = v20;

  if (!self->_ispWait) {
    goto LABEL_30;
  }
  v22 = (OS_dispatch_semaphore *)dispatch_semaphore_create(6LL);
  ispBackPressure = self->_ispBackPressure;
  self->_ispBackPressure = v22;

  if (!self->_ispBackPressure
    || (v24 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1LL),
        frameCounterMutex = self->_frameCounterMutex,
        self->_frameCounterMutex = v24,
        frameCounterMutex,
        !self->_frameCounterMutex))
  {
LABEL_30:
    LODWORD(v9) = 0;
    return (int)v9;
  }

  v26 = *p_ispProcessingSession;
  if (!v27) {
    goto LABEL_31;
  }
  LODWORD(v9) = v27(v26, kFigCaptureISPProcessingSessionProperty_OutputHandler, &__block_literal_global_0);
  if (!(_DWORD)v9)
  {
    v59[0] = 0LL;
    v59[1] = v59;
    v59[2] = 0x3032000000LL;
    v59[3] = __Block_byref_object_copy_;
    v59[4] = __Block_byref_object_dispose_;
    v28 = self;
    v60 = v28;
    id v9 = self->_ispProcessingSession;
    v54 = _NSConcreteStackBlock;
    uint64_t v55 = 3221225472LL;
    v56 = __37__VISISPRendererV2_prepareToProcess___block_invoke_8;
    v57 = (const char *)&unk_38DE8;
    v58 = v59;
    v29 = &v54;
    if (v30)
    {
      LODWORD(v9) = v30(v9, v29);

      if ((_DWORD)v9)
      {
        int v31 = 0;
LABEL_51:
        _Block_object_dispose(v59, 8);

        if (v31)
        {
          if (a3 == 3)
          {
            v40 = objc_alloc(&OBJC_CLASS___VISISPMeshGeneratorV2);
            metalContext = v28->_metalContext;
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext commandQueue](metalContext, "commandQueue"));
            v43 = -[VISISPMeshGeneratorV2 initWithMetalContext:metalCommandQueue:]( v40,  "initWithMetalContext:metalCommandQueue:",  metalContext,  v42);
            ispMeshGenerator = v28->_ispMeshGenerator;
            v28->_ispMeshGenerator = v43;

            v45 = v28->_ispMeshGenerator;
            if (v45)
            {
              -[VISISPMeshGeneratorV2 setInputSize:](v45, "setInputSize:", *(unsigned int *)v28->_inputSize);
              -[VISISPMeshGeneratorV2 setOutputSize:]( v28->_ispMeshGenerator,  "setOutputSize:",  *(unsigned int *)v28->_outputSize);
              -[VISISPMeshGeneratorV2 setGridSize:]( v28->_ispMeshGenerator,  "setGridSize:",  *(unsigned int *)v28->_gridSize);
              unsigned int v46 = -[VISISPMeshGeneratorV2 setup](v28->_ispMeshGenerator, "setup");
              goto LABEL_60;
            }
          }

          else
          {
            v47 = objc_alloc_init(&OBJC_CLASS___VISISPStripGeneratorV2);
            ispStripGenerator = v28->_ispStripGenerator;
            v28->_ispStripGenerator = v47;

            v49 = v28->_ispStripGenerator;
            if (v49)
            {
              BOOL v50 = a3 == 1;
              -[VISISPStripGeneratorV2 setInputSize:](v49, "setInputSize:", *(unsigned int *)v28->_inputSize);
              p_ispStripGenerator = (id *)&v28->_ispStripGenerator;
              -[VISISPStripGeneratorV2 setOutputSize:]( v28->_ispStripGenerator,  "setOutputSize:",  *(unsigned int *)v28->_outputSize);
              -[VISISPStripGeneratorV2 setGridSize:]( v28->_ispStripGenerator,  "setGridSize:",  *(unsigned int *)v28->_gridSize);
              -[VISISPStripGeneratorV2 setExtendedOutputRowsToFill:]( v28->_ispStripGenerator,  "setExtendedOutputRowsToFill:",  v28->_extendedOutputRowsToFill);
              if (v50) {
                uint64_t v52 = 1LL;
              }
              else {
                uint64_t v52 = 2LL;
              }
              [*p_ispStripGenerator setType:v52];
              unsigned int v46 = [*p_ispStripGenerator setup];
LABEL_60:
              LODWORD(v9) = v46;
              if (!v46)
              {
                LODWORD(v9) = 0;
                self->_setupCompleted = 1;
                v28->_finishProcessingCompleted = 0;
                v28->_numberOfFramesEnqueued = 0;
                return (int)v9;
              }

              goto LABEL_44;
            }
          }
        }

void __37__VISISPRendererV2_prepareToProcess___block_invoke( id a1,  void *a2,  int a3,  int a4,  $C56C58E6D1B727D0EAB6D99D70E820E2 *a5)
{
}

uint64_t __37__VISISPRendererV2_prepareToProcess___block_invoke_8(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 104LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)
                                                           + 88LL));
}

- (int)finishProcessing
{
  gpuRenderer = self->_gpuRenderer;
  if (gpuRenderer) {
    AffineTransformFinish(gpuRenderer);
  }
  if (self->_finishProcessingCompleted || !self->_setupCompleted)
  {
    int result = 0;
  }

  else
  {
    ispProcessingSession = self->_ispProcessingSession;
    v6 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(*(void *)(CMBaseObjectGetVTable(ispProcessingSession)
                                                                                      + 16)
                                                                          + 24LL);
    if (v6) {
      int result = v6(ispProcessingSession);
    }
    else {
      int result = -12782;
    }
  }

  self->_finishProcessingCompleted = 1;
  return result;
}

- (int)purgeResources
{
  gpuRenderer = self->_gpuRenderer;
  if (gpuRenderer)
  {
    AffineTransformFinish(gpuRenderer);
    AffineTransformContextRelease(self->_gpuRenderer);
    self->_gpuRenderer = 0LL;
  }

  ispProcessingSession = self->_ispProcessingSession;
  if (ispProcessingSession && self->_setupCompleted)
  {
    if (self->_ispCaptureDevice)
    {
      v5 = *(void (**)(OpaqueFigCaptureISPProcessingSession *))(*(void *)(CMBaseObjectGetVTable(self->_ispProcessingSession)
                                                                                     + 8)
                                                                         + 24LL);
      if (v5) {
        v5(ispProcessingSession);
      }
      ispCaptureDevice = self->_ispCaptureDevice;
      if (ispCaptureDevice)
      {
        CFRelease(ispCaptureDevice);
        self->_ispCaptureDevice = 0LL;
      }
    }

    ispMeshGenerator = self->_ispMeshGenerator;
    self->_ispMeshGenerator = 0LL;

    ispStripGenerator = self->_ispStripGenerator;
    self->_ispStripGenerator = 0LL;

    id v9 = self->_ispProcessingSession;
    if (v9)
    {
      CFRelease(v9);
      self->_ispProcessingSession = 0LL;
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_numberOfFramesEnqueued)
    {
      unsigned int v10 = 0;
      do
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispBackPressure);
        ++v10;
      }

      while (v10 < self->_numberOfFramesEnqueued);
    }

    self->_numberOfFramesEnqueued = 0;
    ispBackPressure = self->_ispBackPressure;
    self->_ispBackPressure = 0LL;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
    ispRendererLock = self->_ispRendererLock;
    self->_ispRendererLock = 0LL;

    ispWait = self->_ispWait;
    self->_ispWait = 0LL;

    frameCounterMutex = self->_frameCounterMutex;
    self->_frameCounterMutex = 0LL;

    self->_setupCompleted = 0;
  }

  return 0;
}

- (int)enqueuePixelBufferForRendering:(VISISPRendererV2 *)self inputValidBufferRect:(SEL)a2 metadata:(__CVBuffer *)a3 ltmLUT:(CGRect *)a4 outputPixelBuffer:(id)a5 transformCounts:(id)a6 transforms3x3:(__CVBuffer *)a7 transformStrides:(float *)(a8
{
  double v10 = v9;
  double v12 = v8;
  id v18 = a5;
  id v19 = a6;
  int v20 = 0;
  id v51 = 0LL;
  if (!a3 || !a7)
  {
    objc_super v21 = 0LL;
    goto LABEL_35;
  }

  objc_super v21 = 0LL;
  if (!a8) {
    goto LABEL_35;
  }
  if (!self->_setupCompleted)
  {
    int v20 = 0;
    id v51 = 0LL;
    objc_super v21 = 0LL;
    goto LABEL_35;
  }

  CFTypeRef v22 = CMGetAttachment(a3, @"LowResolutionImageUsedByVideoEncoder", 0LL);
  uint64_t v23 = kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes;
  if (v22)
  {
    if (!-[NSArray containsObject:]( self->_ispOutputIdentifiers,  "containsObject:",  kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes))
    {
      int v20 = 0;
      id v51 = 0LL;
      objc_super v21 = 0LL;
      goto LABEL_34;
    }

    v24 = a7;
    unsigned int v50 = 2;
  }

  else
  {
    unsigned int v50 = 1;
    v24 = a7;
  }

  v54[0] = kFigCaptureISPProcessingSessionOutputID_PrimaryScaler;
  v54[1] = v24;
  v54[2] = v23;
  v54[3] = v22;
  if (a4)
  {
    CGSize size = a4->size;
    CGPoint origin = a4->origin;
    CGSize v53 = size;
  }

  else
  {
    CGPoint origin = (CGPoint)0LL;
    v53.width = (float)CVPixelBufferGetWidth(a3);
    v53.height = (float)CVPixelBufferGetHeight(a3);
  }

  ispMeshGenerator = self->_ispMeshGenerator;
  if (ispMeshGenerator)
  {
    unsigned int v27 = -[VISISPMeshGeneratorV2 generateMeshWithTransforms:transforms3x3:validBufferRect:ltmLUT:]( ispMeshGenerator,  "generateMeshWithTransforms:transforms3x3:validBufferRect:ltmLUT:",  a8,  v19,  v12,  origin,  v53);
    if (!v27)
    {
      id v51 = (id)objc_claimAutoreleasedReturnValue(-[VISISPMeshGeneratorV2 ISPMeshParams](self->_ispMeshGenerator, "ISPMeshParams"));
      if (!v51) {
        goto LABEL_39;
      }
      goto LABEL_20;
    }

- (int)process
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)_compileShaders
{
  return 0;
}

- (BOOL)_isPixelBuffer422:(__CVBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  BOOL result = 1;
  if (PixelFormatType > 1885745713)
  {
    if (PixelFormatType > 2037741157)
    {
      if (PixelFormatType > 2088265265)
      {
        if (PixelFormatType == 2088265266) {
          return result;
        }
        int v5 = 2088269362;
      }

      else
      {
        if (PixelFormatType == 2037741158) {
          return result;
        }
        int v5 = 2037741171;
      }

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (VISRendererDelegate)delegate
{
  return (VISRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (__n128)inputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 128);
  WORD2(v1) = *(_WORD *)(a1 + 130);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setInputSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_inputSize = v2;
}

- (__n128)outputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 132);
  WORD2(v1) = *(_WORD *)(a1 + 134);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setOutputSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_outputSize = v2;
}

- (__n128)gridSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 136);
  WORD2(v1) = *(_WORD *)(a1 + 138);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setGridSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_gridSize = v2;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (void).cxx_destruct
{
}

@end