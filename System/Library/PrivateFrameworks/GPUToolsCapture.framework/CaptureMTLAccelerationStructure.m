@interface CaptureMTLAccelerationStructure
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureBuffer:(id)a5;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLAccelerationStructure)baseObject;
- (MTLAccelerationStructureDescriptor)captureDescriptor;
- (MTLBuffer)buffer;
- (MTLBuffer)stateBuffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResourceID)gpuResourceID;
- (NSMutableSet)extraRetainedObjects;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)accelerationStructureUniqueIdentifier;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferOffset;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)makeAliasable;
- (void)setCaptureDescriptor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)setStateBuffer:(id)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLAccelerationStructure

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  return -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:captureBuffer:]( self,  "initWithBaseObject:captureDevice:captureBuffer:",  a3,  a4,  0LL);
}

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureBuffer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructure;
  v12 = -[CaptureMTLAccelerationStructure init](&v54, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    captureHeap = v13->_captureHeap;
    v13->_captureHeap = 0LL;

    v15 = (GTTraceContext *)[v10 traceContext];
    v13->_uint64_t traceContext = v15;
    id v16 = DEVICEOBJECT(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v15,  (unint64_t)v17,  (unint64_t)v13);

    traceStream = (uint64_t *)v13->_traceStream;
    if (traceStream) {
      uint64_t v19 = *traceStream;
    }
    else {
      uint64_t v19 = 0LL;
    }
    RegisterAccelerationStructure(v13, v19, (uint64_t)[v9 gpuResourceID]);
    if (v11)
    {
      v20 = (CaptureMTLBuffer *)v11;
      buffer = v13->_buffer;
      v13->_buffer = v20;
    }

    else
    {
      buffer = (CaptureMTLBuffer *)objc_claimAutoreleasedReturnValue(-[MTLAccelerationStructureSPI buffer](v13->_baseObject, "buffer"));
      if (buffer)
      {
        v25 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  buffer,  v10);
        v26 = v13->_buffer;
        v13->_buffer = v25;

        if ((qword_23A448 & 4) != 0)
        {
          uint64_t traceContext = (uint64_t)v13->_traceContext;
          v28 = (unint64_t *)(traceContext + 72);
          do
            unint64_t v29 = __ldaxr(v28);
          while (__stlxr(v29 + 1, v28));
          uint64_t v45 = traceContext;
          uint64_t v46 = 0LL;
          uint64_t v47 = 0LL;
          unint64_t v48 = v29;
          s();
          v31 = v30;
          uint64_t v32 = *v30;
          uint64_t *v30 = v33;
          uint64_t v49 = v32;
          char v50 = *((_BYTE *)v30 + 8);
          __int16 v51 = 16400;
          int v52 = 0;
          char v53 = 0;
          GTTraceEncoder_setStream(&v45, (uint64_t)-[CaptureMTLBuffer traceStream](v13->_buffer, "traceStream"));
          uint64_t v34 = v47;
          *(_DWORD *)(v47 + 8) = -16314;
          char v35 = v51;
          if (v51 > 0x18uLL)
          {
            uint64_t v37 = *(void *)(v46 + 24);
            uint64_t v38 = HIBYTE(v51);
            ++HIBYTE(v51);
            v36 = GTTraceMemPool_allocateBytes(v37, v48, v38 | 0x2800000000LL) + 16;
            char v35 = v38;
          }

          else
          {
            v36 = (char *)(v34 + v51);
            LOBYTE(v51) = v51 + 40;
          }

          *(_BYTE *)(v34 + 13) = v35;
          SaveMTLBufferInfo((uint64_t)&v45, v13->_buffer);
          v39 = -[CaptureMTLDevice traceStream](v13->_captureDevice, "traceStream");
          if (v39) {
            unint64_t var0 = v39->var0;
          }
          else {
            unint64_t var0 = 0LL;
          }
          v40 = -[CaptureMTLBuffer traceStream](v13->_buffer, "traceStream");
          if (v40) {
            unint64_t v41 = v40->var0;
          }
          else {
            unint64_t v41 = 0LL;
          }
          unint64_t v42 = -[CaptureMTLBuffer length](v13->_buffer, "length");
          unint64_t v43 = -[CaptureMTLBuffer resourceOptions](v13->_buffer, "resourceOptions");
          *(void *)v36 = var0;
          *((void *)v36 + 1) = v41;
          *((void *)v36 + 2) = v42;
          *((void *)v36 + 3) = v43;
          *((void *)v36 + 4) = 0LL;
          uint64_t *v31 = v49;
          *((_BYTE *)v31 + 8) = v50;
          *(_BYTE *)(v47 + 15) |= 8u;
        }
      }
    }

    if ((qword_23A448 & 0x10) != 0)
    {
      v22 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      extraRetainedObjects = v13->_extraRetainedObjects;
      v13->_extraRetainedObjects = v22;
    }
  }

  return v13;
}

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructure;
  id v9 = -[CaptureMTLAccelerationStructure init](&v20, "init");
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 device]);
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v9->_captureHeap, a4);
    objc_storeStrong((id *)&v9->_captureDevice, v10);
    id v11 = (GTTraceContext *)[v8 traceContext];
    v9->_uint64_t traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v9);

    traceStream = (uint64_t *)v9->_traceStream;
    if (traceStream) {
      uint64_t v15 = *traceStream;
    }
    else {
      uint64_t v15 = 0LL;
    }
    RegisterAccelerationStructure(v9, v15, (uint64_t)[v7 gpuResourceID]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTLAccelerationStructureSPI buffer](v9->_baseObject, "buffer"));
    if (v16)
    {
      v17 = -[CaptureMTLBuffer initWithBaseObject:captureHeap:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureHeap:",  v16,  v8);
      buffer = v9->_buffer;
      v9->_buffer = v17;
    }
  }

  return v9;
}

- (MTLAccelerationStructure)baseObject
{
  return self->_baseObject;
}

- (MTLHeap)heap
{
  return (MTLHeap *)self->_captureHeap;
}

- (MTLBuffer)buffer
{
  if ((qword_23A448 & 4) == 0 && os_variant_has_internal_content(0LL)) {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( 0LL,  (uint64_t)"-[MTLAccelerationStructure buffer] SPI",  0LL,  (uint64_t)"To be able to capture, don't use -[MTLAccelerationStructure buffer] SPI.");
  }
  return (MTLBuffer *)self->_buffer;
}

- (MTLAccelerationStructureDescriptor)captureDescriptor
{
  return self->_captureDescriptor;
}

- (void)setCaptureDescriptor:(id)a3
{
}

- (void)dealloc
{
  v3 = (void *)s_accelerationStructureGPUResourceIDToStreamRef;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[MTLAccelerationStructureSPI gpuResourceID](self->_baseObject, "gpuResourceID")));
  [v3 removeObjectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&s_accelerationStructuresLock);
  -[CaptureMTLDevice deallocateResource:](self->_captureDevice, "deallocateResource:", self);
  baseObject = self->_baseObject;
  self->_baseObject = 0LL;

  -[CaptureMTLHeap usedSize](self->_captureHeap, "usedSize");
  -[CaptureMTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v16);
  uint64_t v6 = v18;
  *(_DWORD *)(v18 + 8) = -15659;
  unsigned __int8 v7 = v21;
  if (v21 > 0x38uLL)
  {
    uint64_t v9 = *(void *)(v17 + 24);
    uint64_t v10 = v22++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v19, v10 | 0x800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v21);
    v21 += 8;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLAccelerationStructure traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v20;
  *(_BYTE *)(v18 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructure;
  -[CaptureMTLAccelerationStructure dealloc](&v15, "dealloc");
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructure;
  uint64_t v3 = -[CaptureMTLAccelerationStructure description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLAccelerationStructureSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLAccelerationStructureSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return (unint64_t)-[MTLAccelerationStructureSPI accelerationStructureUniqueIdentifier]( self->_baseObject,  "accelerationStructureUniqueIdentifier");
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLAccelerationStructureSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLAccelerationStructureSPI allocationID](self->_baseObject, "allocationID");
}

- (unint64_t)bufferOffset
{
  return (unint64_t)-[MTLAccelerationStructureSPI bufferOffset](self->_baseObject, "bufferOffset");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLAccelerationStructureSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLAccelerationStructureSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLAccelerationStructureSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLAccelerationStructureSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLAccelerationStructureSPI heapOffset](self->_baseObject, "heapOffset");
}

- (NSString)label
{
  return (NSString *)-[MTLAccelerationStructureSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLAccelerationStructureSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15661;
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
  uint64_t v10 = -[CaptureMTLAccelerationStructure traceStream](self, "traceStream");
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

- (unint64_t)protectionOptions
{
  return (unint64_t)-[MTLAccelerationStructureSPI protectionOptions](self->_baseObject, "protectionOptions");
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLAccelerationStructureSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLAccelerationStructureSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLAccelerationStructureSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
}

- (unint64_t)size
{
  return (unint64_t)-[MTLAccelerationStructureSPI size](self->_baseObject, "size");
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLAccelerationStructureSPI storageMode](self->_baseObject, "storageMode");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLAccelerationStructureSPI unfilteredResourceOptions]( self->_baseObject,  "unfilteredResourceOptions");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLAccelerationStructureSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    id v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      id v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLAccelerationStructureSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    id v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      id v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLAccelerationStructureSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLAccelerationStructureSPI doesAliasResource:]( baseObject,  "doesAliasResource:",  v4);

  return (char)baseObject;
}

- (BOOL)isAliasable
{
  return -[MTLAccelerationStructureSPI isAliasable](self->_baseObject, "isAliasable");
}

- (BOOL)isComplete
{
  return -[MTLAccelerationStructureSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  return -[MTLAccelerationStructureSPI isPurgeable](self->_baseObject, "isPurgeable");
}

- (void)makeAliasable
{
  if (!qword_23A440)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v12);
    -[MTLAccelerationStructureSPI makeAliasable](self->_baseObject, "makeAliasable");
    -[CaptureMTLHeap usedSize](self->_captureHeap, "usedSize");
    -[CaptureMTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -15651;
    unsigned __int8 v4 = v16;
    if (v16 > 0x38uLL)
    {
      uint64_t v6 = *(void *)(v12[1] + 24LL);
      uint64_t v7 = v17++;
      uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
      unsigned __int8 v4 = v7;
    }

    else
    {
      uint64_t v5 = (char *)(v3 + v16);
      v16 += 8;
    }

    *(_BYTE *)(v3 + 13) = v4;
    unint64_t v8 = -[CaptureMTLAccelerationStructure traceStream](self, "traceStream");
    if (v8) {
      unint64_t var0 = v8->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    *(void *)uint64_t v5 = var0;
    s();
    *(void *)uint64_t v10 = v11;
    *(_BYTE *)(v10 + 8) = v15;
    *(_BYTE *)(v13 + 15) |= 8u;
  }

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v5 = -[MTLAccelerationStructureSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15650;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    unint64_t v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    unint64_t v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLAccelerationStructure traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unint64_t v8 = var0;
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
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15649;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    id v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    id v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  unint64_t v8 = -[CaptureMTLAccelerationStructure traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (NSMutableSet)extraRetainedObjects
{
  return self->_extraRetainedObjects;
}

- (MTLBuffer)stateBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setStateBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end