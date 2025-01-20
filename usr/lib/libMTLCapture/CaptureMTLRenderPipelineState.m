@interface CaptureMTLRenderPipelineState
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)threadgroupSizeMatchesTileSize;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 additionalBinaryFunctions:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLMeshRenderPipelineDescriptor)meshDescriptor;
- (MTLRenderPipelineDescriptor)descriptor;
- (MTLRenderPipelineReflection)reflection;
- (MTLRenderPipelineState)baseObject;
- (MTLResourceID)gpuResourceID;
- (MTLTileRenderPipelineDescriptor)tileDescriptor;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)functionHandleMap;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newFragmentShaderDebugInfo;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVertexShaderDebugInfo;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)originalObject;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockSampleLength;
- (unint64_t)maxTotalThreadgroupsPerMeshGrid;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)meshThreadExecutionWidth;
- (unint64_t)objectThreadExecutionWidth;
- (unint64_t)resourceIndex;
- (unint64_t)streamReference;
- (unint64_t)uniqueIdentifier;
- (unsigned)explicitVisibilityGroupID;
- (void)commonInit:(id)a3 captureDevice:(id)a4;
- (void)dealloc;
- (void)setDescriptor:(id)a3;
- (void)setMeshDescriptor:(id)a3;
- (void)setReflection:(id)a3;
- (void)setTileDescriptor:(id)a3;
- (void)swapObject:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLRenderPipelineState

- (void)commonInit:(id)a3 captureDevice:(id)a4
{
  v6 = (MTLRenderPipelineStateSPI *)a3;
  v7 = (CaptureMTLDevice *)a4;
  baseObject = self->_baseObject;
  self->_baseObject = v6;
  v18 = v6;

  captureDevice = self->_captureDevice;
  self->_captureDevice = v7;
  v10 = v7;

  capturePipelineState = self->_capturePipelineState;
  self->_capturePipelineState = 0LL;

  v12 = -[CaptureMTLDevice traceContext](v10, "traceContext");
  self->_traceContext = v12;
  id v13 = DEVICEOBJECT(v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  self->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v12,  (unint64_t)v14,  (unint64_t)self);

  additionalBinaryFunctions = self->_additionalBinaryFunctions;
  self->_additionalBinaryFunctions = 0LL;

  functionHandleMap = self->_functionHandleMap;
  self->_functionHandleMap = 0LL;

  retainedPipelineLibrary = self->_retainedPipelineLibrary;
  self->_retainedPipelineLibrary = 0LL;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderPipelineState;
  v8 = -[CaptureMTLRenderPipelineState init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[CaptureMTLRenderPipelineState commonInit:captureDevice:](v8, "commonInit:captureDevice:", v6, v7);
  }

  return v9;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 additionalBinaryFunctions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderPipelineState;
  objc_super v11 = -[CaptureMTLRenderPipelineState init](&v14, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
    -[CaptureMTLRenderPipelineState commonInit:captureDevice:](v11, "commonInit:captureDevice:", v8, v12);

    objc_storeStrong((id *)&v11->_capturePipelineState, a4);
    objc_storeStrong((id *)&v11->_additionalBinaryFunctions, a5);
  }

  return v11;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderPipelineState;
  id v8 = -[CaptureMTLRenderPipelineState init](&v11, "init");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    -[CaptureMTLRenderPipelineState commonInit:captureDevice:](v8, "commonInit:captureDevice:", v6, v9);

    objc_storeStrong((id *)&v8->_retainedPipelineLibrary, a4);
  }

  return v8;
}

- (void)swapObject:(id)a3
{
  p_baseObject = &self->_baseObject;
  v5 = self->_baseObject;
  objc_storeStrong((id *)p_baseObject, *((id *)a3 + 1));
  objc_super v11 = a3;
  id v6 = (void *)*((void *)a3 + 1);
  *((void *)a3 + 1) = v5;
  id v7 = v5;

  id v8 = p_baseObject[4];
  p_baseObject[4] = (MTLRenderPipelineStateSPI *)v11[5];
  v11[5] = v8;
  id v9 = p_baseObject[4];
  uint64_t v10 = *((void *)v9 + 2);
  *((void *)v9 + 2) = *((void *)v8 + 2);
  *((void *)v8 + 2) = v10;
}

- (MTLRenderPipelineState)baseObject
{
  return self->_baseObject;
}

- (id)functionHandleMap
{
  functionHandleMap = self->_functionHandleMap;
  if (!functionHandleMap)
  {
    v4 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  2LL,  0LL,  8LL);
    v5 = self->_functionHandleMap;
    self->_functionHandleMap = v4;

    functionHandleMap = self->_functionHandleMap;
  }

  return functionHandleMap;
}

- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLRenderPipelineState functionHandleMap](self, "functionHandleMap"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
  id v12 = *a3;
  *a3 = v11;

  id v13 = *a3;
  if (!*a3)
  {
    objc_super v14 = -[CaptureMTLFunctionHandle initWithBaseObject:captureRenderPipelineState:captureFunction:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunctionHandle),  "initWithBaseObject:captureRenderPipelineState:captureFunction:",  v8,  self,  v9);
    id v15 = *a3;
    *a3 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLRenderPipelineState functionHandleMap](self, "functionHandleMap"));
    [v16 setObject:*a3 forKey:v8];
  }

  return v13 == 0LL;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  v35 = traceContext;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  unint64_t v38 = v9;
  s();
  objc_super v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v39 = v12;
  char v40 = *((_BYTE *)v10 + 8);
  __int16 v41 = 16400;
  int v42 = 0;
  char v43 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLRenderPipelineFunctionsDescriptor(v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[MTLRenderPipelineStateSPI newRenderPipelineStateWithAdditionalBinaryFunctions:error:]( baseObject,  "newRenderPipelineStateWithAdditionalBinaryFunctions:error:",  v16,  a4);

  if (v17)
  {
    v18 = objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState);
    id v19 = [v6 copy];
    v20 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:]( v18,  "initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:",  v17,  self,  v19);
  }

  else
  {
    v20 = 0LL;
  }

  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v20, "traceStream"));
  -[CaptureMTLRenderPipelineState setDescriptor:](v20, "setDescriptor:", self->_descriptor);
  -[CaptureMTLRenderPipelineState setReflection:](v20, "setReflection:", self->_reflection);
  uint64_t v21 = v37;
  *(_DWORD *)(v37 + 8) = -15461;
  char v22 = v41;
  if (v41 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v36 + 24);
    uint64_t v25 = HIBYTE(v41);
    ++HIBYTE(v41);
    v23 = GTTraceMemPool_allocateBytes(v24, v38, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    v23 = (char *)(v21 + v41);
    LOBYTE(v41) = v41 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  reflection = self->_reflection;
  id DynamicLibrariesForRenderPipelineDescriptor = LoadDynamicLibrariesForRenderPipelineDescriptor(self->_descriptor);
  v28 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v35, v20, reflection, v28);

  v29 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v31 = -[CaptureMTLRenderPipelineState traceStream](v20, "traceStream");
  if (!v31)
  {
    unint64_t v32 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v32 = v31->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v33 = SaveMTLRenderPipelineFunctionsDescriptor((uint64_t)&v35, v6);
  *(void *)v23 = var0;
  *((void *)v23 + 1) = v32;
  *((void *)v23 + 2) = a4;
  v23[24] = v33;
  *(_DWORD *)(v23 + 25) = 0;
  *((_DWORD *)v23 + 7) = 0;
  *objc_super v11 = v39;
  *((_BYTE *)v11 + 8) = v40;
  *(_BYTE *)(v37 + 15) |= 8u;

  return v20;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderPipelineState_newTileRenderPipelineStateWithAdditionalBinaryFunctions_error",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v8 = unwrapNSArray(v6);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = -[MTLRenderPipelineStateSPI newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:]( baseObject,  "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:",  v9,  a4);
  if (v10) {
    objc_super v11 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:",  v10,  self,  0LL);
  }
  else {
    objc_super v11 = 0LL;
  }

  return v11;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderPipelineState_newRenderPipelineStateWithAdditionalBinaryFunctions_fragmentAdditionalBinaryFunctions_error",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v11 = unwrapNSArray(v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = unwrapNSArray(v8);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  id v15 = -[MTLRenderPipelineStateSPI newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:]( baseObject,  "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:",  v12,  v14,  a5);
  if (v15) {
    v16 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureRenderPipelineState:additionalBinaryFunctions:",  v15,  self,  0LL);
  }
  else {
    v16 = 0LL;
  }

  return v16;
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v5 = atomic_load(&traceStream[1].var1);
    while (1)
    {
      unint64_t v6 = __ldaxr(p_var1);
      if (v6 != v5) {
        break;
      }
      if (__stlxr(v5 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0LL, p_var1)) {
        goto LABEL_7;
      }
      int v7 = 1;
LABEL_8:
      unint64_t v5 = v6;
      if (v7) {
        return;
      }
    }

    __clrex();
LABEL_7:
    int v7 = 0;
    goto LABEL_8;
  }

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0LL;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderPipelineState;
  uint64_t v3 = -[CaptureMTLRenderPipelineState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineStateSPI description](self->_baseObject, "description"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", v4, v5));

  return (NSString *)v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLRenderPipelineStateSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLRenderPipelineStateSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unsigned)explicitVisibilityGroupID
{
  return -[MTLRenderPipelineStateSPI explicitVisibilityGroupID]( self->_baseObject,  "explicitVisibilityGroupID");
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLRenderPipelineStateSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLRenderPipelineStateSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLRenderPipelineStateSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)imageblockSampleLength
{
  return (unint64_t)-[MTLRenderPipelineStateSPI imageblockSampleLength]( self->_baseObject,  "imageblockSampleLength");
}

- (NSString)label
{
  return (NSString *)-[MTLRenderPipelineStateSPI label](self->_baseObject, "label");
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  return (unint64_t)-[MTLRenderPipelineStateSPI maxTotalThreadgroupsPerMeshGrid]( self->_baseObject,  "maxTotalThreadgroupsPerMeshGrid");
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return (unint64_t)-[MTLRenderPipelineStateSPI maxTotalThreadsPerMeshThreadgroup]( self->_baseObject,  "maxTotalThreadsPerMeshThreadgroup");
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return (unint64_t)-[MTLRenderPipelineStateSPI maxTotalThreadsPerObjectThreadgroup]( self->_baseObject,  "maxTotalThreadsPerObjectThreadgroup");
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return (unint64_t)-[MTLRenderPipelineStateSPI maxTotalThreadsPerThreadgroup]( self->_baseObject,  "maxTotalThreadsPerThreadgroup");
}

- (unint64_t)meshThreadExecutionWidth
{
  return (unint64_t)-[MTLRenderPipelineStateSPI meshThreadExecutionWidth]( self->_baseObject,  "meshThreadExecutionWidth");
}

- (unint64_t)objectThreadExecutionWidth
{
  return (unint64_t)-[MTLRenderPipelineStateSPI objectThreadExecutionWidth]( self->_baseObject,  "objectThreadExecutionWidth");
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLRenderPipelineStateSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (int64_t)shaderValidation
{
  return (int64_t)-[MTLRenderPipelineStateSPI shaderValidation](self->_baseObject, "shaderValidation");
}

- (int64_t)shaderValidationState
{
  return (int64_t)-[MTLRenderPipelineStateSPI shaderValidationState](self->_baseObject, "shaderValidationState");
}

- (BOOL)supportIndirectCommandBuffers
{
  return -[MTLRenderPipelineStateSPI supportIndirectCommandBuffers]( self->_baseObject,  "supportIndirectCommandBuffers");
}

- (int64_t)textureWriteRoundingMode
{
  return (int64_t)-[MTLRenderPipelineStateSPI textureWriteRoundingMode]( self->_baseObject,  "textureWriteRoundingMode");
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return -[MTLRenderPipelineStateSPI threadgroupSizeMatchesTileSize]( self->_baseObject,  "threadgroupSizeMatchesTileSize");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLRenderPipelineStateSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16242;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned __int8 v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  objc_super v8 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderPipelineState;
  -[CaptureMTLRenderPipelineState dealloc](&v12, "dealloc");
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI fragmentFunctionHandleWithFunction:]( baseObject,  "fragmentFunctionHandleWithFunction:",  v6));

  id v34 = 0LL;
  if (v7)
  {
    unsigned __int8 v8 = -[CaptureMTLRenderPipelineState newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:]( self,  "newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:",  &v34,  v7,  v4);
    id v9 = v34;
    if ((v8 & 1) == 0)
    {
      id v10 = v34;
      goto LABEL_18;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  traceContext = self->_traceContext;
  [v9 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v27);
  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -15444;
  unsigned __int8 v13 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v28 + 24);
    uint64_t v16 = v33++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v30, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = (uint64_t *)[v34 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v4 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v22;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
  id v10 = v34;
LABEL_18:
  uint64_t v25 = v10;

  return v25;
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  id v6 = a3;
  baseObject = self->_baseObject;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI functionHandleWithFunction:stage:]( baseObject,  "functionHandleWithFunction:stage:",  v8,  a4));

  id v36 = 0LL;
  if (v9)
  {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:]( self,  "newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:",  &v36,  v9,  v6);
    id v11 = v36;
    if ((v10 & 1) == 0)
    {
      id v12 = v36;
      goto LABEL_18;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  traceContext = self->_traceContext;
  [v11 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v29);
  uint64_t v14 = v31;
  *(_DWORD *)(v31 + 8) = -15463;
  unsigned __int8 v15 = v34;
  if (v34 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v30 + 24);
    uint64_t v18 = v35++;
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v32, v18 | 0x2000000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v34);
    v34 += 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v36 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  uint64_t v23 = (uint64_t *)[v6 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v24;
  *((void *)v16 + 3) = a4;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
  id v12 = v36;
LABEL_18:
  v27 = v12;

  return v27;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  return (unint64_t)-[MTLRenderPipelineStateSPI imageblockMemoryLengthForDimensions:]( baseObject,  "imageblockMemoryLengthForDimensions:",  &v5);
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderPipelineState_meshFunctionHandleWithFunction",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI meshFunctionHandleWithFunction:]( baseObject,  "meshFunctionHandleWithFunction:",  v6));
  return v7;
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newFragmentIntersectionFunctionTableWithDescriptor:]( baseObject,  "newFragmentIntersectionFunctionTableWithDescriptor:",  v13);

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    uint64_t v16 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15443;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    unsigned __int8 v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    unsigned __int8 v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)unsigned __int8 v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newFragmentShaderDebugInfo
{
  return -[MTLRenderPipelineStateSPI newFragmentShaderDebugInfo](self->_baseObject, "newFragmentShaderDebugInfo");
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v15 = [v7 copy];
  id v16 = -[MTLRenderPipelineStateSPI newIntersectionFunctionTableWithDescriptor:stage:]( baseObject,  "newIntersectionFunctionTableWithDescriptor:stage:",  v15,  a4);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v16,  v7));
  if (v16) {
    char v18 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v16,  self,  v17);
  }
  else {
    char v18 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v30,  (uint64_t)-[CaptureMTLIntersectionFunctionTable traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15462;
  char v20 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v30, v16);
  uint64_t v24 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v26 = -[CaptureMTLIntersectionFunctionTable traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v30, v17);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  *uint64_t v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newTileIntersectionFunctionTableWithDescriptor:]( baseObject,  "newTileIntersectionFunctionTableWithDescriptor:",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    id v16 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15442;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newVertexIntersectionFunctionTableWithDescriptor:]( baseObject,  "newVertexIntersectionFunctionTableWithDescriptor:",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    id v16 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15441;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newVertexShaderDebugInfo
{
  return -[MTLRenderPipelineStateSPI newVertexShaderDebugInfo](self->_baseObject, "newVertexShaderDebugInfo");
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newVisibleFunctionTableFromFragmentStageWithDescriptor:]( baseObject,  "newVisibleFunctionTableFromFragmentStageWithDescriptor:",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    id v16 = -[CaptureMTLVisibleFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLVisibleFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15440;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newVisibleFunctionTableFromTileStageWithDescriptor:]( baseObject,  "newVisibleFunctionTableFromTileStageWithDescriptor:",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    id v16 = -[CaptureMTLVisibleFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLVisibleFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15439;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = [v5 copy];
  id v14 = -[MTLRenderPipelineStateSPI newVisibleFunctionTableFromVertexStageWithDescriptor:]( baseObject,  "newVisibleFunctionTableFromVertexStageWithDescriptor:",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    id v16 = -[CaptureMTLVisibleFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLVisibleFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15438;
  char v18 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v29 + 24);
    uint64_t v21 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    LOBYTE(v34) = v34 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v15 = [v7 copy];
  id v16 = -[MTLRenderPipelineStateSPI newVisibleFunctionTableWithDescriptor:stage:]( baseObject,  "newVisibleFunctionTableWithDescriptor:stage:",  v15,  a4);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v16,  v7));
  if (v16) {
    char v18 = -[CaptureMTLVisibleFunctionTable initWithBaseObject:captureRenderPipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLVisibleFunctionTable),  "initWithBaseObject:captureRenderPipelineState:descriptor:",  v16,  self,  v17);
  }
  else {
    char v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLVisibleFunctionTable traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15460;
  char v20 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v30, v16);
  uint64_t v24 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v26 = -[CaptureMTLVisibleFunctionTable traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v30, v17);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  *uint64_t v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderPipelineState_objectFunctionHandleWithFunction",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI objectFunctionHandleWithFunction:]( baseObject,  "objectFunctionHandleWithFunction:",  v6));
  return v7;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI tileFunctionHandleWithFunction:]( baseObject,  "tileFunctionHandleWithFunction:",  v6));

  id v34 = 0LL;
  if (v7)
  {
    unsigned __int8 v8 = -[CaptureMTLRenderPipelineState newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:]( self,  "newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:",  &v34,  v7,  v4);
    id v9 = v34;
    if ((v8 & 1) == 0)
    {
      id v10 = v34;
      goto LABEL_18;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  traceContext = self->_traceContext;
  [v9 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v27);
  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -15437;
  unsigned __int8 v13 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v28 + 24);
    uint64_t v16 = v33++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v30, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v34 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v4 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v22;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
  id v10 = v34;
LABEL_18:
  unint64_t v25 = v10;

  return v25;
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLRenderPipelineStateSPI vertexFunctionHandleWithFunction:]( baseObject,  "vertexFunctionHandleWithFunction:",  v6));

  id v34 = 0LL;
  if (v7)
  {
    unsigned __int8 v8 = -[CaptureMTLRenderPipelineState newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:]( self,  "newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:",  &v34,  v7,  v4);
    id v9 = v34;
    if ((v8 & 1) == 0)
    {
      id v10 = v34;
      goto LABEL_18;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  traceContext = self->_traceContext;
  [v9 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v27);
  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -15436;
  unsigned __int8 v13 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v28 + 24);
    uint64_t v16 = v33++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v30, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderPipelineState traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v34 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v4 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v22;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
  id v10 = v34;
LABEL_18:
  unint64_t v25 = v10;

  return v25;
}

- (MTLRenderPipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (MTLRenderPipelineReflection)reflection
{
  return self->_reflection;
}

- (void)setReflection:(id)a3
{
}

- (MTLTileRenderPipelineDescriptor)tileDescriptor
{
  return self->_tileDescriptor;
}

- (void)setTileDescriptor:(id)a3
{
}

- (MTLMeshRenderPipelineDescriptor)meshDescriptor
{
  return self->_meshDescriptor;
}

- (void)setMeshDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end