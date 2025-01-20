@interface CaptureMTLIndirectCommandBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectCommandBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLIndirectCommandBuffer)baseObject;
- (MTLResourceID)gpuResourceID;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4;
- (void)makeAliasable;
- (void)resetWithRange:(_NSRange)a3;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLIndirectCommandBuffer

- (CaptureMTLIndirectCommandBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectCommandBuffer;
  v9 = -[CaptureMTLIndirectCommandBuffer init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);
  }

  return v10;
}

- (MTLIndirectCommandBuffer)baseObject
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectCommandBuffer;
  uint64_t v3 = -[CaptureMTLIndirectCommandBuffer description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIndirectCommandBufferSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIndirectCommandBufferSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI allocationID](self->_baseObject, "allocationID");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLIndirectCommandBufferSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (MTLHeap)heap
{
  return (MTLHeap *)-[MTLIndirectCommandBufferSPI heap](self->_baseObject, "heap");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI heapOffset](self->_baseObject, "heapOffset");
}

- (NSString)label
{
  return (NSString *)-[MTLIndirectCommandBufferSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLIndirectCommandBufferSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15925;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)v19, v15, v16 + 1);
  }

  *(void *)int v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLIndirectCommandBufferSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLIndirectCommandBufferSPI setResponsibleProcess:](self->_baseObject, "setResponsibleProcess:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15924;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)int v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (unint64_t)size
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI size](self->_baseObject, "size");
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI storageMode](self->_baseObject, "storageMode");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI unfilteredResourceOptions]( self->_baseObject,  "unfilteredResourceOptions");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLIndirectCommandBufferSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15923;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectCommandBuffer;
  -[CaptureMTLIndirectCommandBuffer dealloc](&v12, "dealloc");
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    uint64_t v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLIndirectCommandBufferSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    uint64_t v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLIndirectCommandBufferSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLIndirectCommandBufferSPI doesAliasResource:]( baseObject,  "doesAliasResource:",  v4);

  return (char)baseObject;
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *unint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTLIndirectCommandBufferSPI indirectComputeCommandAtIndex:]( self->_baseObject,  "indirectComputeCommandAtIndex:",  a3));
  if (v12) {
    uint64_t v13 = -[CaptureMTLIndirectComputeCommand initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIndirectComputeCommand),  "initWithBaseObject:captureContext:",  v12,  self->_traceContext);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v24,  (uint64_t)-[CaptureMTLIndirectComputeCommand traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15921;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLIndirectComputeCommand traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *unint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTLIndirectCommandBufferSPI indirectRenderCommandAtIndex:]( self->_baseObject,  "indirectRenderCommandAtIndex:",  a3));
  if (v12) {
    uint64_t v13 = -[CaptureMTLIndirectRenderCommand initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIndirectRenderCommand),  "initWithBaseObject:captureContext:",  v12,  self->_traceContext);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLIndirectRenderCommand traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15922;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLIndirectRenderCommand traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (BOOL)isAliasable
{
  unsigned int v3 = -[MTLIndirectCommandBufferSPI isAliasable](self->_baseObject, "isAliasable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15918;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    uint64_t v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  uint64_t v9 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)isComplete
{
  return -[MTLIndirectCommandBufferSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  unsigned int v3 = -[MTLIndirectCommandBufferSPI isPurgeable](self->_baseObject, "isPurgeable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15917;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    uint64_t v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  uint64_t v9 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (void)makeAliasable
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15919;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned __int8 v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void)resetWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v15);
  -[MTLIndirectCommandBufferSPI resetWithRange:](self->_baseObject, "resetWithRange:", location, length);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15896;
  unsigned __int8 v7 = v19;
  if (v19 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v19);
    v19 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = location;
  *((void *)v8 + 2) = length;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v5 = -[MTLIndirectCommandBufferSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15920;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLIndirectCommandBuffer traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (void)waitUntilComplete
{
}

- (void).cxx_destruct
{
}

@end