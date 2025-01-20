@interface CaptureMTLComputePipelineState
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportIndirectCommandBuffers;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 additionalBinaryFunctions:(id)a5;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLComputePipelineDescriptor)descriptor;
- (MTLComputePipelineReflection)reflection;
- (MTLComputePipelineState)baseObject;
- (MTLDevice)device;
- (MTLFunction)function;
- (MTLResourceID)gpuResourceID;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)functionHandleMap;
- (id)functionHandleWithFunction:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)originalObject;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)resourceIndex;
- (unint64_t)staticThreadgroupMemoryLength;
- (unint64_t)streamReference;
- (unint64_t)threadExecutionWidth;
- (unint64_t)uniqueIdentifier;
- (void)commonInit:(id)a3 captureDevice:(id)a4;
- (void)dealloc;
- (void)setDescriptor:(id)a3;
- (void)setFunction:(id)a3;
- (void)setReflection:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLComputePipelineState

- (void)commonInit:(id)a3 captureDevice:(id)a4
{
  v6 = (MTLComputePipelineStateSPI *)a3;
  v7 = (CaptureMTLDevice *)a4;
  baseObject = self->_baseObject;
  self->_baseObject = v6;
  v18 = v6;

  captureDevice = self->_captureDevice;
  self->_captureDevice = v7;
  v10 = v7;

  captureComputePipelineState = self->_captureComputePipelineState;
  self->_captureComputePipelineState = 0LL;

  functions = self->_functions;
  self->_functions = 0LL;

  v13 = -[CaptureMTLDevice traceContext](v10, "traceContext");
  self->_traceContext = v13;
  id v14 = DEVICEOBJECT(v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  self->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)self);

  functionHandleMap = self->_functionHandleMap;
  self->_functionHandleMap = 0LL;

  retainedPipelineLibrary = self->_retainedPipelineLibrary;
  self->_retainedPipelineLibrary = 0LL;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CaptureMTLComputePipelineState;
  v8 = -[CaptureMTLComputePipelineState init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[CaptureMTLComputePipelineState commonInit:captureDevice:](v8, "commonInit:captureDevice:", v6, v7);
  }

  return v9;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 additionalBinaryFunctions:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CaptureMTLComputePipelineState;
  objc_super v11 = -[CaptureMTLComputePipelineState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[CaptureMTLComputePipelineState commonInit:captureDevice:](v11, "commonInit:captureDevice:", v8, v9[2]);
    objc_storeStrong((id *)&v12->_captureComputePipelineState, a4);
    objc_storeStrong((id *)&v12->_functions, a5);
  }

  return v12;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CaptureMTLComputePipelineState;
  id v8 = -[CaptureMTLComputePipelineState init](&v11, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    -[CaptureMTLComputePipelineState commonInit:captureDevice:](v8, "commonInit:captureDevice:", v6, v9);

    objc_storeStrong((id *)&v8->_retainedPipelineLibrary, a4);
  }

  return v8;
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
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLComputePipelineState functionHandleMap](self, "functionHandleMap"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
  id v12 = *a3;
  *a3 = v11;

  id v13 = *a3;
  if (!*a3)
  {
    objc_super v14 = -[CaptureMTLFunctionHandle initWithBaseObject:captureComputePipelineState:captureFunction:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunctionHandle),  "initWithBaseObject:captureComputePipelineState:captureFunction:",  v8,  self,  v9);
    id v15 = *a3;
    *a3 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLComputePipelineState functionHandleMap](self, "functionHandleMap"));
    [v16 setObject:*a3 forKey:v8];
  }

  return v13 == 0LL;
}

- (MTLComputePipelineState)baseObject
{
  return self->_baseObject;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLComputePipelineState;
  uint64_t v3 = -[CaptureMTLComputePipelineState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLComputePipelineStateSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLComputePipelineStateSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLComputePipelineStateSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLComputePipelineStateSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLComputePipelineStateSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLComputePipelineStateSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (NSString)label
{
  return (NSString *)-[MTLComputePipelineStateSPI label](self->_baseObject, "label");
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return (unint64_t)-[MTLComputePipelineStateSPI maxTotalThreadsPerThreadgroup]( self->_baseObject,  "maxTotalThreadsPerThreadgroup");
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLComputePipelineStateSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (int64_t)shaderValidation
{
  return (int64_t)-[MTLComputePipelineStateSPI shaderValidation](self->_baseObject, "shaderValidation");
}

- (int64_t)shaderValidationState
{
  return (int64_t)-[MTLComputePipelineStateSPI shaderValidationState](self->_baseObject, "shaderValidationState");
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return (unint64_t)-[MTLComputePipelineStateSPI staticThreadgroupMemoryLength]( self->_baseObject,  "staticThreadgroupMemoryLength");
}

- (BOOL)supportIndirectCommandBuffers
{
  return -[MTLComputePipelineStateSPI supportIndirectCommandBuffers]( self->_baseObject,  "supportIndirectCommandBuffers");
}

- (int64_t)textureWriteRoundingMode
{
  return (int64_t)-[MTLComputePipelineStateSPI textureWriteRoundingMode]( self->_baseObject,  "textureWriteRoundingMode");
}

- (unint64_t)threadExecutionWidth
{
  return (unint64_t)-[MTLComputePipelineStateSPI threadExecutionWidth](self->_baseObject, "threadExecutionWidth");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLComputePipelineStateSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16321;
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
  objc_super v8 = -[CaptureMTLComputePipelineState traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLComputePipelineState;
  -[CaptureMTLComputePipelineState dealloc](&v12, "dealloc");
}

- (id)functionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLComputePipelineStateSPI functionHandleWithFunction:]( baseObject,  "functionHandleWithFunction:",  v6));

  id v34 = 0LL;
  if (v7)
  {
    unsigned __int8 v8 = -[CaptureMTLComputePipelineState newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:]( self,  "newFunctionHandle:associatedWithBaseFunctionHandle:captureFunction:",  &v34,  v7,  v4);
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
  *(_DWORD *)(v29 + 8) = -15620;
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
  char v17 = -[CaptureMTLComputePipelineState traceStream](self, "traceStream");
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
  v21 = (uint64_t *)[v4 traceStream];
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
  v25 = v10;

  return v25;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  return (unint64_t)-[MTLComputePipelineStateSPI imageblockMemoryLengthForDimensions:]( baseObject,  "imageblockMemoryLengthForDimensions:",  &v5);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
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
  id v14 = -[MTLComputePipelineStateSPI newIntersectionFunctionTableWithDescriptor:]( baseObject,  "newIntersectionFunctionTableWithDescriptor:",  v13);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    uint64_t v16 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureComputePipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureComputePipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLIntersectionFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15540;
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
  uint64_t v22 = -[CaptureMTLComputePipelineState traceStream](self, "traceStream");
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

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
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
  id v14 = -[MTLComputePipelineStateSPI newVisibleFunctionTableWithDescriptor:]( baseObject,  "newVisibleFunctionTableWithDescriptor:",  v13);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:",  v14,  v5));
  if (v14) {
    uint64_t v16 = -[CaptureMTLVisibleFunctionTable initWithBaseObject:captureComputePipelineState:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLVisibleFunctionTable),  "initWithBaseObject:captureComputePipelineState:descriptor:",  v14,  self,  v15);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLVisibleFunctionTable traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15578;
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
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = -[CaptureMTLComputePipelineState traceStream](self, "traceStream");
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

- (MTLFunction)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
}

- (MTLComputePipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (MTLComputePipelineReflection)reflection
{
  return self->_reflection;
}

- (void)setReflection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end