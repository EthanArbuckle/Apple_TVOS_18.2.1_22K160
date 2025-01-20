@interface CaptureMTLVisibleFunctionTable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5;
- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)globalBuffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResourceID)gpuResourceID;
- (MTLVisibleFunctionTable)baseObject;
- (NSArray)functionArray;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)cpuCacheMode;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)makeAliasable;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setGlobalBuffer:(id)a3;
- (void)setGlobalBufferOffset:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLVisibleFunctionTable

- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CaptureMTLVisibleFunctionTable;
  v12 = -[CaptureMTLVisibleFunctionTable init](&v25, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 device]);
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_computePipelineState, a4);
    v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    id v17 = DEVICEOBJECT(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v16,  (unint64_t)v18,  (unint64_t)v13);

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 functionCount]));
    functionArray = v13->_functionArray;
    v13->_functionArray = (NSMutableArray *)v19;

    if ([v11 functionCount])
    {
      unint64_t v21 = 0LL;
      do
      {
        v22 = v13->_functionArray;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](v22, "addObject:", v23);

        ++v21;
      }

      while ((unint64_t)[v11 functionCount] > v21);
    }
  }

  return v13;
}

- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CaptureMTLVisibleFunctionTable;
  v12 = -[CaptureMTLVisibleFunctionTable init](&v25, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 device]);
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_renderPipelineState, a4);
    v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    id v17 = DEVICEOBJECT(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v16,  (unint64_t)v18,  (unint64_t)v13);

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 functionCount]));
    functionArray = v13->_functionArray;
    v13->_functionArray = (NSMutableArray *)v19;

    if ([v11 functionCount])
    {
      unint64_t v21 = 0LL;
      do
      {
        v22 = v13->_functionArray;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](v22, "addObject:", v23);

        ++v21;
      }

      while ((unint64_t)[v11 functionCount] > v21);
    }
  }

  return v13;
}

- (MTLVisibleFunctionTable)baseObject
{
  return self->_baseObject;
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v6 = a3;
  v7 = self;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    id v9 = a3;
    NSUInteger v10 = a4.length;
    do
    {
      self = (CaptureMTLVisibleFunctionTable *)-[NSMutableArray count](v7->_functionArray, "count");
      if (v8 < (unint64_t)self)
      {
        if (*v9)
        {
          self = (CaptureMTLVisibleFunctionTable *)-[NSMutableArray setObject:atIndexedSubscript:]( v7->_functionArray,  "setObject:atIndexedSubscript:",  *v9,  v8);
        }

        else
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray setObject:atIndexedSubscript:](v7->_functionArray, "setObject:atIndexedSubscript:", v11, v8);
        }
      }

      ++v9;
      ++v8;
      --v10;
    }

    while (v10);
  }

  traceStream = v7->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v14 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v15 = __ldaxr(p_var1);
      if (v15 != v14) {
        break;
      }
      if (__stlxr(v14 | 2, p_var1)) {
        goto LABEL_14;
      }
      int v16 = 1;
LABEL_15:
      unint64_t v14 = v15;
      if (v16) {
        goto LABEL_16;
      }
    }

    __clrex();
LABEL_14:
    int v16 = 0;
    goto LABEL_15;
  }

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setVisibleFunctionTables_withBufferRange",  (uint64_t)"Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, v10);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v13 = (char *)&v17 - v12;
  if (length)
  {
    unint64_t v14 = (uint64_t *)((char *)&v17 - v12);
    NSUInteger v15 = length;
    do
    {
      int v16 = (void *)*a3++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLVisibleFunctionTableSPI setVisibleFunctionTables:withBufferRange:]( baseObject,  "setVisibleFunctionTables:withBufferRange:",  v13,  location,  length);
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_functionArray, "setObject:atIndexedSubscript:", v6, a4);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableArray setObject:atIndexedSubscript:](self->_functionArray, "setObject:atIndexedSubscript:", v7, a4);
  }

  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v10 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v11 = __ldaxr(p_var1);
      if (v11 != v10) {
        break;
      }
      if (__stlxr(v10 | 2, p_var1)) {
        goto LABEL_10;
      }
      int v12 = 1;
LABEL_11:
      unint64_t v10 = v11;
      if (v12) {
        goto LABEL_12;
      }
    }

    __clrex();
LABEL_10:
    int v12 = 0;
    goto LABEL_11;
  }

- (MTLBuffer)globalBuffer
{
  return (MTLBuffer *)-[MTLVisibleFunctionTableSPI globalBuffer](self->_baseObject, "globalBuffer");
}

- (void)setGlobalBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setGlobalBuffer",  (uint64_t)"Function Pointers",  0LL,  0LL);
  -[MTLVisibleFunctionTableSPI setGlobalBuffer:](self->_baseObject, "setGlobalBuffer:", v4);
}

- (unint64_t)globalBufferOffset
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI globalBufferOffset](self->_baseObject, "globalBufferOffset");
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setBuffer_offset_atIndex",  (uint64_t)"Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 baseObject]);

  -[MTLVisibleFunctionTableSPI setBuffer:offset:atIndex:](baseObject, "setBuffer:offset:atIndex:", v10, a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setBuffers_offsets_withRange",  (uint64_t)"Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  __chkstk_darwin(v11, v12);
  unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v15 = (char *)&v19 - v14;
  if (length)
  {
    unsigned __int8 v16 = (uint64_t *)((char *)&v19 - v14);
    NSUInteger v17 = length;
    do
    {
      v18 = (void *)*a3++;
      *v16++ = [v18 baseObject];
      --v17;
    }

    while (v17);
  }

  -[MTLVisibleFunctionTableSPI setBuffers:offsets:withRange:]( baseObject,  "setBuffers:offsets:withRange:",  v15,  a4,  location,  length);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
}

- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setValue_withRange",  (uint64_t)"Function Pointers",  0LL,  0LL);
  -[MTLVisibleFunctionTableSPI setValue:withRange:](self->_baseObject, "setValue:withRange:", a3, location, length);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLVisibleFunctionTable_setVisibleFunctionTable_atBufferIndex",  (uint64_t)"Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 baseObject]);

  -[MTLVisibleFunctionTableSPI setVisibleFunctionTable:atBufferIndex:]( baseObject,  "setVisibleFunctionTable:atBufferIndex:",  v8,  a4);
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLVisibleFunctionTable;
  uint64_t v3 = -[CaptureMTLVisibleFunctionTable description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLVisibleFunctionTableSPI description](self->_baseObject, "description"));
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
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLVisibleFunctionTableSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI allocationID](self->_baseObject, "allocationID");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLVisibleFunctionTableSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (MTLHeap)heap
{
  return (MTLHeap *)-[MTLVisibleFunctionTableSPI heap](self->_baseObject, "heap");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI heapOffset](self->_baseObject, "heapOffset");
}

- (NSString)label
{
  return (NSString *)-[MTLVisibleFunctionTableSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLVisibleFunctionTableSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15607;
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
  id v10 = -[CaptureMTLVisibleFunctionTable traceStream](self, "traceStream");
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
  return (unint64_t)-[MTLVisibleFunctionTableSPI protectionOptions](self->_baseObject, "protectionOptions");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLVisibleFunctionTableSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI storageMode](self->_baseObject, "storageMode");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI unfilteredResourceOptions]( self->_baseObject,  "unfilteredResourceOptions");
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLVisibleFunctionTableSPI bufferAddressAtIndex:]( self->_baseObject,  "bufferAddressAtIndex:",  a3);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15605;
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
  uint64_t v8 = -[CaptureMTLVisibleFunctionTable traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLVisibleFunctionTable;
  -[CaptureMTLVisibleFunctionTable dealloc](&v12, "dealloc");
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
      id v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLVisibleFunctionTableSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
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
      id v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLVisibleFunctionTableSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLVisibleFunctionTableSPI doesAliasResource:]( baseObject,  "doesAliasResource:",  v4);

  return (char)baseObject;
}

- (BOOL)isAliasable
{
  return -[MTLVisibleFunctionTableSPI isAliasable](self->_baseObject, "isAliasable");
}

- (BOOL)isComplete
{
  return -[MTLVisibleFunctionTableSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  return -[MTLVisibleFunctionTableSPI isPurgeable](self->_baseObject, "isPurgeable");
}

- (void)makeAliasable
{
}

- (void)waitUntilComplete
{
}

- (NSArray)functionArray
{
  return &self->_functionArray->super;
}

- (void).cxx_destruct
{
}

@end