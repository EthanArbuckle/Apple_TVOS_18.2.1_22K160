@interface CaptureMTLHeap
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLHeap)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)backbuffer;
- (MTLDevice)device;
- (MTLHeap)baseObject;
- (NSString)description;
- (NSString)label;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)originalObject;
- (int64_t)type;
- (unint64_t)allocatedSize;
- (unint64_t)cpuCacheMode;
- (unint64_t)currentAllocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)memoryPoolId;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)usedSize;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLHeap

- (CaptureMTLHeap)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CaptureMTLHeap;
  v9 = -[CaptureMTLHeap init](&v18, "init");
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

    if ((qword_23A448 & 0x400000) != 0)
    {
      id v14 = MTLHeap_backbuffer(v10->_baseObject);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      backbuffer = v10->_backbuffer;
      v10->_backbuffer = (MTLBuffer *)v15;
    }
  }

  return v10;
}

- (MTLHeap)baseObject
{
  return self->_baseObject;
}

- (MTLBuffer)backbuffer
{
  return self->_backbuffer;
}

- (unint64_t)usedSize
{
  id v3 = -[MTLHeapSPI usedSize](self->_baseObject, "usedSize");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -10208;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return (unint64_t)v3;
}

- (unint64_t)currentAllocatedSize
{
  id v3 = -[MTLHeapSPI currentAllocatedSize](self->_baseObject, "currentAllocatedSize");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -10207;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return (unint64_t)v3;
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLHeapSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16118;
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
  uint64_t v8 = -[CaptureMTLHeap traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLHeap;
  -[CaptureMTLHeap dealloc](&v12, "dealloc");
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLHeap;
  uint64_t v3 = -[CaptureMTLHeap description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLHeapSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLHeapSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLHeapSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLHeapSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLHeapSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (NSString)label
{
  return (NSString *)-[MTLHeapSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLHeapSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16119;
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
  uint64_t v10 = -[CaptureMTLHeap traceStream](self, "traceStream");
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

- (unint64_t)memoryPoolId
{
  return (unint64_t)-[MTLHeapSPI memoryPoolId](self->_baseObject, "memoryPoolId");
}

- (unint64_t)protectionOptions
{
  return (unint64_t)-[MTLHeapSPI protectionOptions](self->_baseObject, "protectionOptions");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLHeapSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (unint64_t)size
{
  return (unint64_t)-[MTLHeapSPI size](self->_baseObject, "size");
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLHeapSPI storageMode](self->_baseObject, "storageMode");
}

- (int64_t)type
{
  return (int64_t)-[MTLHeapSPI type](self->_baseObject, "type");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLHeapSPI unfilteredResourceOptions](self->_baseObject, "unfilteredResourceOptions");
}

- (id)formattedDescription:(unint64_t)a3
{
  return -[MTLHeapSPI formattedDescription:](self->_baseObject, "formattedDescription:", a3);
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  id v5 = -[MTLHeapSPI maxAvailableSizeWithAlignment:](self->_baseObject, "maxAvailableSizeWithAlignment:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16105;
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
  uint64_t v11 = -[CaptureMTLHeap traceStream](self, "traceStream");
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

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v4 = a3;
  if ((qword_23A448 & 0x4000) != 0)
  {
    size_t v16 = -[CaptureMTLDevice newAccelerationStructureWithDescriptor:]( self->_captureDevice,  "newAccelerationStructureWithDescriptor:",  v4);
  }

  else
  {
    traceContext = self->_traceContext;
    p_var2 = &traceContext->var2;
    do
      unint64_t v7 = __ldaxr(p_var2);
    while (__stlxr(v7 + 1, p_var2));
    v28 = traceContext;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    unint64_t v31 = v7;
    s();
    uint64_t v9 = v8;
    uint64_t v10 = *v8;
    *uint64_t v8 = v11;
    uint64_t v32 = v10;
    char v33 = *((_BYTE *)v8 + 8);
    __int16 v34 = 16400;
    int v35 = 0;
    char v36 = 0;
    baseObject = self->_baseObject;
    id v13 = unwrapMTLAccelerationStructureDescriptor(v4);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = -[MTLHeapSPI newAccelerationStructureWithDescriptor:]( baseObject,  "newAccelerationStructureWithDescriptor:",  v14);

    if (v15) {
      size_t v16 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v15,  self);
    }
    else {
      size_t v16 = 0LL;
    }
    GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v16, "traceStream"));
    uint64_t v17 = v30;
    *(_DWORD *)(v30 + 8) = -15356;
    char v18 = v34;
    if (v34 > 0x28uLL)
    {
      uint64_t v20 = *(void *)(v29 + 24);
      uint64_t v21 = HIBYTE(v34);
      ++HIBYTE(v34);
      char v19 = GTTraceMemPool_allocateBytes(v20, v31, v21 | 0x1800000000LL) + 16;
      char v18 = v21;
    }

    else
    {
      char v19 = (char *)(v17 + v34);
      LOBYTE(v34) = v34 + 24;
    }

    *(_BYTE *)(v17 + 13) = v18;
    SaveMTLAccelerationStructureInfo((uint64_t)&v28, v15);
    char v22 = -[CaptureMTLHeap traceStream](self, "traceStream");
    if (v22) {
      unint64_t var0 = v22->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    unsigned __int8 v24 = -[CaptureMTLAccelerationStructure traceStream](v16, "traceStream");
    if (v24) {
      unint64_t v25 = v24->var0;
    }
    else {
      unint64_t v25 = 0LL;
    }
    char v26 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v28, v4);
    *(void *)char v19 = var0;
    *((void *)v19 + 1) = v25;
    v19[16] = v26;
    *(_DWORD *)(v19 + 17) = 0;
    *((_DWORD *)v19 + 5) = 0;
    uint64_t *v9 = v32;
    *((_BYTE *)v9 + 8) = v33;
    *(_BYTE *)(v30 + 15) |= 8u;
  }

  return v16;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  if ((qword_23A448 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    goto LABEL_5;
  }

  if (qword_23A440)
  {
    captureDevice = self;
LABEL_5:
    uint64_t v8 = (CaptureMTLAccelerationStructure *)[captureDevice newAccelerationStructureWithDescriptor:v6];
    goto LABEL_6;
  }

  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  unint64_t v31 = traceContext;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  unint64_t v34 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v35 = v15;
  char v36 = *((_BYTE *)v13 + 8);
  __int16 v37 = 16400;
  int v38 = 0;
  char v39 = 0;
  baseObject = self->_baseObject;
  id v18 = unwrapMTLAccelerationStructureDescriptor(v6);
  char v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = -[MTLHeapSPI newAccelerationStructureWithDescriptor:offset:]( baseObject,  "newAccelerationStructureWithDescriptor:offset:",  v19,  a4);

  if (v20) {
    uint64_t v8 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v20,  self);
  }
  else {
    uint64_t v8 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v8, "traceStream"));
  uint64_t v21 = v33;
  *(_DWORD *)(v33 + 8) = -15355;
  char v22 = v37;
  if (v37 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v32 + 24);
    uint64_t v25 = HIBYTE(v37);
    ++HIBYTE(v37);
    unsigned __int8 v23 = GTTraceMemPool_allocateBytes(v24, v34, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    unsigned __int8 v23 = (char *)(v21 + v37);
    LOBYTE(v37) = v37 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLAccelerationStructureInfo((uint64_t)&v31, v20);
  char v26 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v28 = -[CaptureMTLAccelerationStructure traceStream](v8, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  char v30 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v31, v6);
  *(void *)unsigned __int8 v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = a4;
  v23[24] = v30;
  *(_DWORD *)(v23 + 25) = 0;
  *((_DWORD *)v23 + 7) = 0;
  *uint64_t v14 = v35;
  *((_BYTE *)v14 + 8) = v36;
  *(_BYTE *)(v33 + 15) |= 8u;

LABEL_6:
  return v8;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ((qword_23A448 & 0x4000) != 0) {
    return -[CaptureMTLDevice newAccelerationStructureWithSize:]( self->_captureDevice,  "newAccelerationStructureWithSize:",  a3);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLHeapSPI newAccelerationStructureWithSize:](self->_baseObject, "newAccelerationStructureWithSize:", a3);
  if (v12) {
    id v13 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v13, "traceStream"));
  uint64_t v15 = v26;
  *(_DWORD *)(v26 + 8) = -15354;
  char v16 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v25 + 24);
    uint64_t v19 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v27, v19 | 0x1800000000LL) + 16;
    char v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  SaveMTLAccelerationStructureInfo((uint64_t)&v24, v12);
  id v20 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = -[CaptureMTLAccelerationStructure traceStream](v13, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  id v5 = self;
  if ((qword_23A448 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
    return -[CaptureMTLHeap newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", a3, a4);
  }

  if (qword_23A440) {
    return -[CaptureMTLHeap newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", a3, a4);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v10 = __ldaxr(p_var2);
  while (__stlxr(v10 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v10;
  s();
  id v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  uint64_t v30 = v13;
  char v31 = *((_BYTE *)v11 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v15 = -[MTLHeapSPI newAccelerationStructureWithSize:offset:]( v5->_baseObject,  "newAccelerationStructureWithSize:offset:",  a3,  a4);
  if (v15) {
    char v16 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v15,  v5);
  }
  else {
    char v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v16, "traceStream"));
  uint64_t v17 = v28;
  *(_DWORD *)(v28 + 8) = -15353;
  char v18 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v27 + 24);
    uint64_t v21 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v29, v21 | 0x2000000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLAccelerationStructureInfo((uint64_t)&v26, v15);
  char v22 = -[CaptureMTLHeap traceStream](v5, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLAccelerationStructure traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  *id v12 = v30;
  *((_BYTE *)v12 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  unint64_t v7 = self;
  if ((qword_23A448 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
    return -[CaptureMTLHeap newAccelerationStructureWithSize:resourceIndex:]( self,  "newAccelerationStructureWithSize:resourceIndex:",  a3,  a5);
  }

  if (qword_23A440) {
    return -[CaptureMTLHeap newAccelerationStructureWithSize:resourceIndex:]( self,  "newAccelerationStructureWithSize:resourceIndex:",  a3,  a5);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v32 = v15;
  char v33 = *((_BYTE *)v13 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  id v17 = -[MTLHeapSPI newAccelerationStructureWithSize:offset:resourceIndex:]( v7->_baseObject,  "newAccelerationStructureWithSize:offset:resourceIndex:",  a3,  a4,  a5);
  if (v17) {
    char v18 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v17,  v7);
  }
  else {
    char v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v18, "traceStream"));
  uint64_t v19 = v30;
  *(_DWORD *)(v30 + 8) = -15352;
  char v20 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v29 + 24);
    uint64_t v23 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v31, v23 | 0x2800000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v34);
    LOBYTE(v34) = v34 + 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLAccelerationStructureInfo((uint64_t)&v28, v17);
  uint64_t v24 = -[CaptureMTLHeap traceStream](v7, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = -[CaptureMTLAccelerationStructure traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a3;
  *((void *)v21 + 3) = a4;
  *((void *)v21 + 4) = a5;
  *uint64_t v14 = v32;
  *((_BYTE *)v14 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v18;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ((qword_23A448 & 0x4000) != 0) {
    return -[CaptureMTLDevice newAccelerationStructureWithSize:resourceIndex:]( self->_captureDevice,  "newAccelerationStructureWithSize:resourceIndex:",  a3,  a4);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v30 = v12;
  char v31 = *((_BYTE *)v10 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v14 = -[MTLHeapSPI newAccelerationStructureWithSize:resourceIndex:]( self->_baseObject,  "newAccelerationStructureWithSize:resourceIndex:",  a3,  a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureHeap:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v15, "traceStream"));
  uint64_t v17 = v28;
  *(_DWORD *)(v28 + 8) = -15351;
  char v18 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v27 + 24);
    uint64_t v21 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v29, v21 | 0x2000000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLAccelerationStructureInfo((uint64_t)&v26, v14);
  uint64_t v22 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLAccelerationStructure traceStream](v15, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  uint64_t *v11 = v30;
  *((_BYTE *)v11 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  if ((qword_23A448 & 0x4000) != 0) {
    return -[CaptureMTLDevice newBufferWithLength:options:]( self->_captureDevice,  "newBufferWithLength:options:",  a3,  a4);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v30 = v12;
  char v31 = *((_BYTE *)v10 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v14 = -[MTLHeapSPI newBufferWithLength:options:](self->_baseObject, "newBufferWithLength:options:", a3, a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLBuffer initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureHeap:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLBuffer traceStream](v15, "traceStream"));
  uint64_t v17 = v28;
  *(_DWORD *)(v28 + 8) = -16117;
  char v18 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v27 + 24);
    uint64_t v21 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v29, v21 | 0x2000000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  SaveMTLBufferInfo((uint64_t)&v26, v14);
  uint64_t v22 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLBuffer traceStream](v15, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  uint64_t *v11 = v30;
  *((_BYTE *)v11 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  unint64_t v7 = self;
  if ((qword_23A448 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
    return -[CaptureMTLHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, a4, a5);
  }

  if (qword_23A440) {
    return -[CaptureMTLHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, a4, a5);
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v32 = v15;
  char v33 = *((_BYTE *)v13 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  id v17 = -[MTLHeapSPI newBufferWithLength:options:offset:]( v7->_baseObject,  "newBufferWithLength:options:offset:",  a3,  a4,  a5);
  if (v17) {
    char v18 = -[CaptureMTLBuffer initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureHeap:",  v17,  v7);
  }
  else {
    char v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLBuffer traceStream](v18, "traceStream"));
  uint64_t v19 = v30;
  *(_DWORD *)(v30 + 8) = -15778;
  char v20 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v29 + 24);
    uint64_t v23 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v31, v23 | 0x2800000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v34);
    LOBYTE(v34) = v34 + 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLBufferInfo((uint64_t)&v28, v17);
  uint64_t v24 = -[CaptureMTLHeap traceStream](v7, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = -[CaptureMTLBuffer traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a3;
  *((void *)v21 + 3) = a4;
  *((void *)v21 + 4) = a5;
  *id v14 = v32;
  *((_BYTE *)v14 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v18;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((qword_23A448 & 0x4000) != 0)
  {
    unint64_t v7 = -[CaptureMTLDevice newTextureWithDescriptor:](self->_captureDevice, "newTextureWithDescriptor:", v4);
  }

  else
  {
    if ((qword_23A448 & 0x200) != 0)
    {
      id v6 = [v4 copy];

      [v6 setCompressionType:0];
      [v6 setCompressionMode:2];
    }

    else
    {
      id v6 = v4;
    }

    traceContext = self->_traceContext;
    p_var2 = &traceContext->var2;
    do
      unint64_t v10 = __ldaxr(p_var2);
    while (__stlxr(v10 + 1, p_var2));
    unint64_t v27 = traceContext;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    unint64_t v30 = v10;
    s();
    unint64_t v12 = v11;
    uint64_t v13 = *v11;
    uint64_t *v11 = v14;
    uint64_t v31 = v13;
    char v32 = *((_BYTE *)v11 + 8);
    __int16 v33 = 16400;
    int v34 = 0;
    char v35 = 0;
    id v15 = -[MTLHeapSPI newTextureWithDescriptor:](self->_baseObject, "newTextureWithDescriptor:", v6);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v15,  v6));

    if (v15) {
      unint64_t v7 = -[CaptureMTLTexture initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureHeap:",  v15,  self);
    }
    else {
      unint64_t v7 = 0LL;
    }
    GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLTexture traceStream](v7, "traceStream"));
    uint64_t v16 = v29;
    *(_DWORD *)(v29 + 8) = -16116;
    char v17 = v33;
    if (v33 > 0x28uLL)
    {
      uint64_t v19 = *(void *)(v28 + 24);
      uint64_t v20 = HIBYTE(v33);
      ++HIBYTE(v33);
      char v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x1800000000LL) + 16;
      char v17 = v20;
    }

    else
    {
      char v18 = (char *)(v16 + v33);
      LOBYTE(v33) = v33 + 24;
    }

    *(_BYTE *)(v16 + 13) = v17;
    SaveMTLTextureInfo((uint64_t)&v27, v15);
    uint64_t v21 = -[CaptureMTLHeap traceStream](self, "traceStream");
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v23 = -[CaptureMTLTexture traceStream](v7, "traceStream");
    if (v23) {
      unint64_t v24 = v23->var0;
    }
    else {
      unint64_t v24 = 0LL;
    }
    char v25 = SaveMTLTextureDescriptor((uint64_t)&v27, v5);
    *(void *)char v18 = var0;
    *((void *)v18 + 1) = v24;
    v18[16] = v25;
    *(_DWORD *)(v18 + 17) = 0;
    *((_DWORD *)v18 + 5) = 0;
    *unint64_t v12 = v31;
    *((_BYTE *)v12 + 8) = v32;
    *(_BYTE *)(v29 + 15) |= 8u;
  }

  return v7;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((qword_23A448 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    goto LABEL_5;
  }

  if (qword_23A440)
  {
    captureDevice = self;
LABEL_5:
    unint64_t v9 = (CaptureMTLTexture *)[captureDevice newTextureWithDescriptor:v7];
    goto LABEL_6;
  }

  if ((qword_23A448 & 0x200) != 0)
  {
    id v11 = [v6 copy];

    [v11 setCompressionType:0];
    [v11 setCompressionMode:2];
  }

  else
  {
    id v11 = v6;
  }

  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v14 = __ldaxr(p_var2);
  while (__stlxr(v14 + 1, p_var2));
  unint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v14;
  s();
  uint64_t v16 = v15;
  uint64_t v17 = *v15;
  *id v15 = v18;
  uint64_t v34 = v17;
  char v35 = *((_BYTE *)v15 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  id v19 = -[MTLHeapSPI newTextureWithDescriptor:offset:](self->_baseObject, "newTextureWithDescriptor:offset:", v11, a4);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self->_captureDevice,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v19,  v11));

  if (v19) {
    unint64_t v9 = -[CaptureMTLTexture initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureHeap:",  v19,  self);
  }
  else {
    unint64_t v9 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLTexture traceStream](v9, "traceStream"));
  uint64_t v20 = v32;
  *(_DWORD *)(v32 + 8) = -15777;
  char v21 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v31 + 24);
    uint64_t v24 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v33, v24 | 0x2000000000LL) + 16;
    char v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  SaveMTLTextureInfo((uint64_t)&v30, v19);
  char v25 = -[CaptureMTLHeap traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v27 = -[CaptureMTLTexture traceStream](v9, "traceStream");
  if (v27) {
    unint64_t v28 = v27->var0;
  }
  else {
    unint64_t v28 = 0LL;
  }
  char v29 = SaveMTLTextureDescriptor((uint64_t)&v30, v7);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = a4;
  v22[24] = v29;
  *(_DWORD *)(v22 + 25) = 0;
  *((_DWORD *)v22 + 7) = 0;
  *uint64_t v16 = v34;
  *((_BYTE *)v16 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

LABEL_6:
  return v9;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v5 = -[MTLHeapSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16115;
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
  id v11 = -[CaptureMTLHeap traceStream](self, "traceStream");
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

- (void).cxx_destruct
{
}

@end