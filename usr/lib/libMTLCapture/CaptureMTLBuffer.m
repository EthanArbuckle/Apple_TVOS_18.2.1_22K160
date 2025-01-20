@interface CaptureMTLBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureBuffer:(id)a4;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)baseObject;
- (MTLDevice)device;
- (MTLHeap)heap;
- (NSString)description;
- (NSString)label;
- (__IOSurface)_aneIOSurface;
- (__IOSurface)iosurface;
- (id)_quicklookData;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)length;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (void)addDebugMarker:(id)a3 range:(_NSRange)a4;
- (void)contents;
- (void)dealloc;
- (void)didModifyRange:(_NSRange)a3;
- (void)makeAliasable;
- (void)removeAllDebugMarkers;
- (void)setLabel:(id)a3;
- (void)setParentGPUAddress:(unint64_t)a3;
- (void)setParentGPUSize:(unint64_t)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLBuffer

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLBuffer;
  v9 = -[CaptureMTLBuffer init](&v15, "init");
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

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLBuffer;
  v9 = -[CaptureMTLBuffer init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureHeap, a4);
    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)v10);

    [v8 usedSize];
    [v8 currentAllocatedSize];
  }

  return v10;
}

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLBuffer;
  v9 = -[CaptureMTLBuffer init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureRemoteStorageBuffer, a4);
    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)v10);
  }

  return v10;
}

- (void)dealloc
{
  if (ShouldRegisterBufferForTracing(self->_baseObject)) {
    GTMemoryGuard_unregisterRegion((uint64_t)self->_traceStream);
  }
  -[MTLDevice deallocateResource:](self->_captureDevice, "deallocateResource:", self);
  baseObject = self->_baseObject;
  self->_baseObject = 0LL;

  -[MTLHeap usedSize](self->_captureHeap, "usedSize");
  -[MTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  uint64_t v4 = v16;
  *(_DWORD *)(v16 + 8) = -16370;
  unsigned __int8 v5 = v19;
  if (v19 > 0x38uLL)
  {
    uint64_t v7 = *(void *)(v15 + 24);
    uint64_t v8 = v20++;
    v6 = GTTraceMemPool_allocateBytes(v7, v17, v8 | 0x800000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v19);
    v19 += 8;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLBuffer traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLBuffer;
  -[CaptureMTLBuffer dealloc](&v13, "dealloc");
}

- (MTLBuffer)baseObject
{
  return self->_baseObject;
}

- (MTLHeap)heap
{
  return self->_captureHeap;
}

- (void)contents
{
  traceStream = self->_traceStream;
  if (!traceStream)
  {
    uint64_t v8 = 0LL;
    goto LABEL_11;
  }

  p_var1 = &traceStream[1].var1;
  unint64_t v5 = atomic_load(p_var1);
  do
  {
    unint64_t v6 = __ldaxr(p_var1);
    if (v6 == v5)
    {
      if (!__stlxr(v5 | 3, p_var1))
      {
        int v7 = 1;
        goto LABEL_8;
      }
    }

    else
    {
      __clrex();
    }

    int v7 = 0;
LABEL_8:
    unint64_t v5 = v6;
  }

  while (!v7);
  uint64_t v8 = self->_traceStream;
LABEL_11:
  CaptureMTLBuffer_registerBaseBufferForTracing(self->_baseObject, (uint64_t)v8, 0);
  return -[MTLBufferSPI contents](self->_baseObject, "contents");
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLBuffer;
  uint64_t v3 = -[CaptureMTLBuffer description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBufferSPI description](self->_baseObject, "description"));
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
  uint64_t v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLBufferSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLBufferSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLBufferSPI allocationID](self->_baseObject, "allocationID");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLBufferSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLBufferSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLBufferSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLBufferSPI heapOffset](self->_baseObject, "heapOffset");
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)-[MTLBufferSPI iosurface](self->_baseObject, "iosurface");
}

- (NSString)label
{
  return (NSString *)-[MTLBufferSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLBufferSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16372;
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
  v10 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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

- (unint64_t)length
{
  return (unint64_t)-[MTLBufferSPI length](self->_baseObject, "length");
}

- (unint64_t)parentGPUAddress
{
  return (unint64_t)-[MTLBufferSPI parentGPUAddress](self->_baseObject, "parentGPUAddress");
}

- (void)setParentGPUAddress:(unint64_t)a3
{
}

- (unint64_t)parentGPUSize
{
  return (unint64_t)-[MTLBufferSPI parentGPUSize](self->_baseObject, "parentGPUSize");
}

- (void)setParentGPUSize:(unint64_t)a3
{
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLBufferSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLBufferSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLBufferSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLBufferSPI setResponsibleProcess:](self->_baseObject, "setResponsibleProcess:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16371;
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
  v10 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLBufferSPI storageMode](self->_baseObject, "storageMode");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLBufferSPI unfilteredResourceOptions](self->_baseObject, "unfilteredResourceOptions");
}

- (__IOSurface)_aneIOSurface
{
  return (__IOSurface *)-[MTLBufferSPI _aneIOSurface](self->_baseObject, "_aneIOSurface");
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v22);
  -[MTLBufferSPI addDebugMarker:range:](self->_baseObject, "addDebugMarker:range:", v7, location, length);
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -16103;
  unsigned __int8 v9 = v26;
  if (v26 > 0x20uLL)
  {
    uint64_t v11 = *(void *)(v22[1] + 24LL);
    uint64_t v12 = v27++;
    v10 = GTTraceMemPool_allocateBytes(v11, v24, v12 | 0x2000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    v10 = (char *)(v8 + v26);
    v26 += 32;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v15 = v7;
  id v16 = [v15 UTF8String];
  if (v16)
  {
    id v17 = v15;
    id v18 = [v17 UTF8String];
    size_t v19 = strlen((const char *)[v17 UTF8String]);
    LOBYTE(v16) = GTTraceEncoder_storeBytes((uint64_t)v22, v18, v19 + 1);
  }

  *(void *)v10 = var0;
  *((void *)v10 + 1) = location;
  *((void *)v10 + 2) = length;
  v10[24] = (char)v16;
  *(_DWORD *)(v10 + 25) = 0;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
}

- (void)didModifyRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v15);
    -[MTLBufferSPI didModifyRange:](self->_baseObject, "didModifyRange:", location, length);
    uint64_t v6 = v16;
    *(_DWORD *)(v16 + 8) = -16208;
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
    uint64_t v11 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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

  else
  {
    -[MTLBufferSPI didModifyRange:](self->_baseObject, "didModifyRange:", a3.location, a3.length);
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

  return -[MTLBufferSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
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

  return -[MTLBufferSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLBufferSPI doesAliasResource:](baseObject, "doesAliasResource:", v4);

  return (char)baseObject;
}

- (BOOL)isAliasable
{
  unsigned int v3 = -[MTLBufferSPI isAliasable](self->_baseObject, "isAliasable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16113;
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
  uint64_t v9 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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
  return -[MTLBufferSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  unsigned int v3 = -[MTLBufferSPI isPurgeable](self->_baseObject, "isPurgeable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16366;
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
  uint64_t v9 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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
  if (!qword_23A440)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v12);
    -[MTLBufferSPI makeAliasable](self->_baseObject, "makeAliasable");
    -[MTLHeap usedSize](self->_captureHeap, "usedSize");
    -[MTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -16122;
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
    uint64_t v8 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  traceContext = self->_traceContext;
  id v11 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v13 = __ldaxr(p_var2);
  while (__stlxr(v13 + 1, p_var2));
  v37 = traceContext;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  unint64_t v40 = v13;
  s();
  char v15 = v14;
  uint64_t v16 = *v14;
  *uint64_t v14 = v17;
  uint64_t v41 = v16;
  char v42 = *((_BYTE *)v14 + 8);
  __int16 v43 = 16400;
  int v44 = 0;
  char v45 = 0;
  id v18 = -[MTLBufferSPI newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:]( self->_baseObject,  "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:",  v11,  a4,  a5,  a6);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( -[MTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v18,  v11));

  if (v18) {
    unsigned __int8 v20 = -[CaptureMTLTexture initWithBaseObject:captureBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureBuffer:",  v18,  self);
  }
  else {
    unsigned __int8 v20 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)-[CaptureMTLTexture traceStream](v20, "traceStream"));
  uint64_t v21 = v39;
  *(_DWORD *)(v39 + 8) = -16098;
  char v22 = v43;
  if (v43 > 0x10uLL)
  {
    uint64_t v24 = *(void *)(v38 + 24);
    v36 = v20;
    char v25 = v19;
    unint64_t v26 = a4;
    unint64_t v27 = a5;
    unint64_t v28 = a6;
    uint64_t v29 = HIBYTE(v43);
    ++HIBYTE(v43);
    uint64_t v23 = GTTraceMemPool_allocateBytes(v24, v40, v29 | 0x3000000000LL) + 16;
    char v22 = v29;
    a6 = v28;
    a5 = v27;
    a4 = v26;
    unsigned __int8 v19 = v25;
    unsigned __int8 v20 = v36;
  }

  else
  {
    uint64_t v23 = (char *)(v21 + v43);
    LOBYTE(v43) = v43 + 48;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLTextureInfo((uint64_t)&v37, v18);
  v30 = -[CaptureMTLBuffer traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v32 = -[CaptureMTLTexture traceStream](v20, "traceStream");
  if (v32) {
    unint64_t v33 = v32->var0;
  }
  else {
    unint64_t v33 = 0LL;
  }
  char v34 = SaveMTLTextureDescriptor((uint64_t)&v37, v19);
  *(void *)uint64_t v23 = var0;
  *((void *)v23 + 1) = v33;
  *((void *)v23 + 2) = a4;
  *((void *)v23 + 3) = a5;
  *((void *)v23 + 4) = a6;
  v23[40] = v34;
  *(_DWORD *)(v23 + 41) = 0;
  *((_DWORD *)v23 + 11) = 0;
  *char v15 = v41;
  *((_BYTE *)v15 + 8) = v42;
  *(_BYTE *)(v39 + 15) |= 8u;

  return v20;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v11;
  s();
  unint64_t v13 = v12;
  uint64_t v14 = *v12;
  *uint64_t v12 = v15;
  uint64_t v34 = v14;
  char v35 = *((_BYTE *)v12 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  id v16 = -[MTLBufferSPI newTextureWithDescriptor:offset:bytesPerRow:]( self->_baseObject,  "newTextureWithDescriptor:offset:bytesPerRow:",  v9,  a4,  a5);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v16,  v9));

  if (v16) {
    id v18 = -[CaptureMTLTexture initWithBaseObject:captureBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureBuffer:",  v16,  self);
  }
  else {
    id v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLTexture traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -16368;
  char v20 = v36;
  if (v36 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2800000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLTextureInfo((uint64_t)&v30, v16);
  uint64_t v24 = -[CaptureMTLBuffer traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v26 = -[CaptureMTLTexture traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLTextureDescriptor((uint64_t)&v30, v17);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  *((void *)v21 + 3) = a5;
  v21[32] = v28;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  uint64_t *v13 = v34;
  *((_BYTE *)v13 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (void)removeAllDebugMarkers
{
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v5 = -[MTLBufferSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16367;
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
  unint64_t v11 = -[CaptureMTLBuffer traceStream](self, "traceStream");
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

- (id)_quicklookData
{
  return GTMTLQL_EncodeBuffer((uint64_t)self->_traceContext, self);
}

- (void).cxx_destruct
{
}

@end