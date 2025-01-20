@interface CaptureMTLIntersectionFunctionTable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureDevice:(id)a4 descriptor:(id)a5;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLIntersectionFunctionTable)baseObject;
- (MTLResourceID)gpuResourceID;
- (NSArray)functionArray;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)globalBuffer;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)cpuCacheMode;
- (unint64_t)globalBufferOffset;
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
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setResponsibleProcess:(int)a3;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLIntersectionFunctionTable

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureDevice:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CaptureMTLIntersectionFunctionTable;
  v12 = -[CaptureMTLIntersectionFunctionTable init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    v14 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v14;
    id v15 = DEVICEOBJECT(v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v14,  (unint64_t)v16,  (unint64_t)v13);

    int v17 = 31;
    v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 31LL);
    buffers = v13->_buffers;
    v13->_buffers = v18;

    do
    {
      v20 = v13->_buffers;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray addObject:](v20, "addObject:", v21);

      --v17;
    }

    while (v17);
    v22 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 functionCount]);
    functions = v13->_functions;
    v13->_functions = v22;

    if ([v11 functionCount])
    {
      unint64_t v24 = 0LL;
      do
      {
        v25 = v13->_functions;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](v25, "addObject:", v26);

        ++v24;
      }

      while ((unint64_t)[v11 functionCount] > v24);
    }
  }

  return v13;
}

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CaptureMTLIntersectionFunctionTable;
  v12 = -[CaptureMTLIntersectionFunctionTable init](&v30, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 device]);
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureComputePipelineState, a4);
    v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    id v17 = DEVICEOBJECT(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v16,  (unint64_t)v18,  (unint64_t)v13);

    int v19 = 31;
    v20 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 31LL);
    buffers = v13->_buffers;
    v13->_buffers = v20;

    do
    {
      v22 = v13->_buffers;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray addObject:](v22, "addObject:", v23);

      --v19;
    }

    while (v19);
    unint64_t v24 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 functionCount]);
    functions = v13->_functions;
    v13->_functions = v24;

    if ([v11 functionCount])
    {
      unint64_t v26 = 0LL;
      do
      {
        v27 = v13->_functions;
        objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](v27, "addObject:", v28);

        ++v26;
      }

      while ((unint64_t)[v11 functionCount] > v26);
    }
  }

  return v13;
}

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CaptureMTLIntersectionFunctionTable;
  v12 = -[CaptureMTLIntersectionFunctionTable init](&v30, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 device]);
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureRenderPipelineState, a4);
    v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    id v17 = DEVICEOBJECT(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v16,  (unint64_t)v18,  (unint64_t)v13);

    int v19 = 31;
    v20 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 31LL);
    buffers = v13->_buffers;
    v13->_buffers = v20;

    do
    {
      v22 = v13->_buffers;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray addObject:](v22, "addObject:", v23);

      --v19;
    }

    while (v19);
    unint64_t v24 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 functionCount]);
    functions = v13->_functions;
    v13->_functions = v24;

    if ([v11 functionCount])
    {
      unint64_t v26 = 0LL;
      do
      {
        v27 = v13->_functions;
        objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](v27, "addObject:", v28);

        ++v26;
      }

      while ((unint64_t)[v11 functionCount] > v26);
    }
  }

  return v13;
}

- (MTLIntersectionFunctionTable)baseObject
{
  return self->_baseObject;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_buffers, "count") > a5)
  {
    if (v8)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v8, a5);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v9, a5);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  s();
  uint64_t v11 = v10;
  *(_BYTE *)(v10 + 8) |= 1u;
  baseObject = self->_baseObject;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLIntersectionFunctionTableSPI setBuffer:offset:atIndex:](baseObject, "setBuffer:offset:atIndex:", v13, a4, a5);

  uint64_t v14 = v24;
  *(_DWORD *)(v24 + 8) = -15545;
  unsigned __int8 v15 = v28;
  if (v28 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v23[1] + 24LL);
    uint64_t v18 = v29++;
    v16 = GTTraceMemPool_allocateBytes(v17, v25, v18 | 0x2000000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    v16 = (char *)(v14 + v28);
    v28 += 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  int v19 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v21 = (uint64_t *)[v8 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *(void *)uint64_t v11 = v26;
  *(_BYTE *)(v11 + 8) = v27;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v34 = a4;
  v35 = (id *)a3;
  if (a5.length)
  {
    NSUInteger v8 = a5.location;
    id v9 = v35;
    NSUInteger v10 = a5.length;
    do
    {
      if (v8 < (unint64_t)-[NSMutableArray count](self->_buffers, "count"))
      {
        if (*v9)
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", *v9, v8);
        }

        else
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v11, v8);
        }
      }

      ++v9;
      ++v8;
      --v10;
    }

    while (v10);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v36);
  s();
  uint64_t v13 = v12;
  *(_BYTE *)(v12 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v15 = 8 * length;
  __chkstk_darwin(v12, v16);
  if (length)
  {
    uint64_t v17 = v35;
    uint64_t v18 = (uint64_t *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    NSUInteger v19 = length;
    do
    {
      v20 = *v17++;
      *v18++ = [v20 baseObject];
      --v19;
    }

    while (v19);
  }

  v21 = (unint64_t *)v34;
  NSUInteger v22 = location;
  -[MTLIntersectionFunctionTableSPI setBuffers:offsets:withRange:]( baseObject,  "setBuffers:offsets:withRange:",  (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v34,  location,  length);
  uint64_t v23 = v38;
  *(_DWORD *)(v38 + 8) = -15544;
  unsigned __int8 v24 = v42;
  if (v42 > 0x20uLL)
  {
    uint64_t v26 = *(void *)(v37 + 24);
    uint64_t v27 = v43++;
    uint64_t v25 = GTTraceMemPool_allocateBytes(v26, v39, v27 | 0x2000000000LL) + 16;
    unsigned __int8 v24 = v27;
  }

  else
  {
    uint64_t v25 = (char *)(v23 + v42);
    v42 += 32;
  }

  *(_BYTE *)(v23 + 13) = v24;
  unsigned __int8 v28 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v28, v29);
  char v31 = StreamArray((uint64_t)v36, (uint64_t *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)), v35, length);
  char v32 = GTTraceEncoder_storeBytes((uint64_t)v36, v21, 8 * length);
  *(void *)uint64_t v25 = var0;
  *((void *)v25 + 1) = v22;
  *((void *)v25 + 2) = length;
  v25[24] = v31;
  v25[25] = v32;
  *(_DWORD *)(v25 + 26) = 0;
  *((_WORD *)v25 + 15) = 0;
  *(void *)uint64_t v13 = v40;
  *(_BYTE *)(v13 + 8) = v41;
  *(_BYTE *)(v38 + 15) |= 8u;
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_functions, "count") > a4)
  {
    if (v6)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v6, a4);
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v7, a4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIntersectionFunctionTableSPI setFunction:atIndex:](baseObject, "setFunction:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15559;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    uint64_t v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    id v9 = a3;
    NSUInteger v10 = a4.length;
    do
    {
      if (v8 < (unint64_t)-[NSMutableArray count](self->_functions, "count"))
      {
        if (*v9)
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", *v9, v8);
        }

        else
        {
          unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v11, v8);
        }
      }

      ++v9;
      ++v8;
      --v10;
    }

    while (v10);
  }

  uint64_t v12 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v32);
  baseObject = self->_baseObject;
  uint64_t v14 = 8 * length;
  __chkstk_darwin(v12, v15);
  if (length)
  {
    uint64_t v16 = a3;
    uint64_t v17 = &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v18 = length;
    do
    {
      uint64_t v19 = (void *)*v16++;
      *v17++ = [v19 baseObject];
      --v18;
    }

    while (v18);
  }

  -[MTLIntersectionFunctionTableSPI setFunctions:withRange:]( baseObject,  "setFunctions:withRange:",  &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -15558;
  unsigned __int8 v21 = v37;
  if (v37 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v33 + 24);
    uint64_t v24 = v38++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v35, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v37);
    v37 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  unsigned __int8 v25 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v32, &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = location;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  *(_DWORD *)(v22 + 25) = 0;
  *((_DWORD *)v22 + 7) = 0;
  s();
  *(void *)uint64_t v29 = v30;
  *(_BYTE *)(v29 + 8) = v36;
  *(_BYTE *)(v34 + 15) |= 8u;
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ((unint64_t)-[NSMutableArray count](self->_functions, "count") > a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v7, a4);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v17);
  -[MTLIntersectionFunctionTableSPI setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:]( self->_baseObject,  "setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:",  a3,  a4);
  uint64_t v8 = v18;
  *(_DWORD *)(v18 + 8) = -15530;
  unsigned __int8 v9 = v21;
  if (v21 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v17[1] + 24LL);
    uint64_t v12 = v22++;
    NSUInteger v10 = GTTraceMemPool_allocateBytes(v11, v19, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    NSUInteger v10 = (char *)(v8 + v21);
    v21 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)NSUInteger v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = a4;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v20;
  *(_BYTE *)(v18 + 15) |= 8u;
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    NSUInteger v9 = a4.length;
    do
    {
      if (v8 < (unint64_t)-[NSMutableArray count](self->_functions, "count"))
      {
        NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v10, v8);
      }

      ++v8;
      --v9;
    }

    while (v9);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v20);
  -[MTLIntersectionFunctionTableSPI setOpaqueTriangleIntersectionFunctionWithSignature:withRange:]( self->_baseObject,  "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:",  a3,  location,  length);
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -15529;
  unsigned __int8 v12 = v24;
  if (v24 > 0x20uLL)
  {
    uint64_t v14 = *(void *)(v20[1] + 24LL);
    uint64_t v15 = v25++;
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v22, v15 | 0x2000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v24);
    v24 += 32;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ((unint64_t)-[NSMutableArray count](self->_functions, "count") > a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v7, a4);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v17);
  -[MTLIntersectionFunctionTableSPI setOpaqueCurveIntersectionFunctionWithSignature:atIndex:]( self->_baseObject,  "setOpaqueCurveIntersectionFunctionWithSignature:atIndex:",  a3,  a4);
  uint64_t v8 = v18;
  *(_DWORD *)(v18 + 8) = -15258;
  unsigned __int8 v9 = v21;
  if (v21 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v17[1] + 24LL);
    uint64_t v12 = v22++;
    NSUInteger v10 = GTTraceMemPool_allocateBytes(v11, v19, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    NSUInteger v10 = (char *)(v8 + v21);
    v21 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)NSUInteger v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = a4;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v20;
  *(_BYTE *)(v18 + 15) |= 8u;
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    NSUInteger v9 = a4.length;
    do
    {
      if (v8 < (unint64_t)-[NSMutableArray count](self->_functions, "count"))
      {
        NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray setObject:atIndexedSubscript:](self->_functions, "setObject:atIndexedSubscript:", v10, v8);
      }

      ++v8;
      --v9;
    }

    while (v9);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v20);
  -[MTLIntersectionFunctionTableSPI setOpaqueCurveIntersectionFunctionWithSignature:withRange:]( self->_baseObject,  "setOpaqueCurveIntersectionFunctionWithSignature:withRange:",  a3,  location,  length);
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -15257;
  unsigned __int8 v12 = v24;
  if (v24 > 0x20uLL)
  {
    uint64_t v14 = *(void *)(v20[1] + 24LL);
    uint64_t v15 = v25++;
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v22, v15 | 0x2000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v24);
    v24 += 32;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_buffers, "count") > a4)
  {
    if (v6)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v6, a4);
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v7, a4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  s();
  uint64_t v9 = v8;
  *(_BYTE *)(v8 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIntersectionFunctionTableSPI setVisibleFunctionTable:atBufferIndex:]( baseObject,  "setVisibleFunctionTable:atBufferIndex:",  v11,  a4);

  uint64_t v12 = v22;
  *(_DWORD *)(v22 + 8) = -15526;
  unsigned __int8 v13 = v26;
  if (v26 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v21[1] + 24LL);
    uint64_t v16 = v27++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v23, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v26);
    v26 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v6 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *(void *)uint64_t v9 = v24;
  *(_BYTE *)(v9 + 8) = v25;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v29 = (id *)a3;
  if (a4.length)
  {
    NSUInteger v7 = a4.location;
    uint64_t v8 = v29;
    NSUInteger v9 = a4.length;
    do
    {
      if (v7 < (unint64_t)-[NSMutableArray count](self->_buffers, "count", v29))
      {
        if (*v8)
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", *v8, v7);
        }

        else
        {
          NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray setObject:atIndexedSubscript:](self->_buffers, "setObject:atIndexedSubscript:", v10, v7);
        }
      }

      ++v8;
      ++v7;
      --v9;
    }

    while (v9);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  s();
  uint64_t v12 = v11;
  *(_BYTE *)(v11 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v14 = 8 * length;
  __chkstk_darwin(v11, v15);
  if (length)
  {
    uint64_t v16 = v29;
    uint64_t v17 = &v30[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v18 = length;
    do
    {
      uint64_t v19 = *v16++;
      *v17++ = objc_msgSend(v19, "baseObject", v29);
      --v18;
    }

    while (v18);
  }

  -[MTLIntersectionFunctionTableSPI setVisibleFunctionTables:withBufferRange:]( baseObject,  "setVisibleFunctionTables:withBufferRange:",  &v30[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length,  v29);
  uint64_t v20 = v32;
  *(_DWORD *)(v32 + 8) = -15525;
  unsigned __int8 v21 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v31 + 24);
    uint64_t v24 = v37++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v33, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v36);
    v36 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  char v25 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v30, &v30[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], v29, length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = location;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  *(_DWORD *)(v22 + 25) = 0;
  *((_DWORD *)v22 + 7) = 0;
  *(void *)uint64_t v12 = v34;
  *(_BYTE *)(v12 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIntersectionFunctionTable;
  uint64_t v3 = -[CaptureMTLIntersectionFunctionTable description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIntersectionFunctionTableSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIntersectionFunctionTableSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI allocationID](self->_baseObject, "allocationID");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (id)globalBuffer
{
  return -[MTLIntersectionFunctionTableSPI globalBuffer](self->_baseObject, "globalBuffer");
}

- (void)setGlobalBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLIntersectionFunctionTable_setGlobalBuffer",  (uint64_t)"Ray tracing",  0LL,  0LL);
  -[MTLIntersectionFunctionTableSPI setGlobalBuffer:](self->_baseObject, "setGlobalBuffer:", v4);
}

- (unint64_t)globalBufferOffset
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI globalBufferOffset]( self->_baseObject,  "globalBufferOffset");
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLIntersectionFunctionTableSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI hazardTrackingMode]( self->_baseObject,  "hazardTrackingMode");
}

- (MTLHeap)heap
{
  return (MTLHeap *)-[MTLIntersectionFunctionTableSPI heap](self->_baseObject, "heap");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI heapOffset](self->_baseObject, "heapOffset");
}

- (NSString)label
{
  return (NSString *)-[MTLIntersectionFunctionTableSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLIntersectionFunctionTableSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15570;
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
  NSUInteger v10 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
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
  return (unint64_t)-[MTLIntersectionFunctionTableSPI protectionOptions](self->_baseObject, "protectionOptions");
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLIntersectionFunctionTableSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI storageMode](self->_baseObject, "storageMode");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI unfilteredResourceOptions]( self->_baseObject,  "unfilteredResourceOptions");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIntersectionFunctionTableSPI bufferAddressAtIndex:]( self->_baseObject,  "bufferAddressAtIndex:",  a3);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15568;
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
  uint64_t v8 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIntersectionFunctionTable;
  -[CaptureMTLIntersectionFunctionTable dealloc](&v12, "dealloc");
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

  return -[MTLIntersectionFunctionTableSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
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

  return -[MTLIntersectionFunctionTableSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLIntersectionFunctionTableSPI doesAliasResource:]( baseObject,  "doesAliasResource:",  v4);

  return (char)baseObject;
}

- (BOOL)isAliasable
{
  return -[MTLIntersectionFunctionTableSPI isAliasable](self->_baseObject, "isAliasable");
}

- (BOOL)isComplete
{
  return -[MTLIntersectionFunctionTableSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  return -[MTLIntersectionFunctionTableSPI isPurgeable](self->_baseObject, "isPurgeable");
}

- (void)makeAliasable
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15560;
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
  unint64_t v8 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
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
  id v5 = -[MTLIntersectionFunctionTableSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15557;
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
  uint64_t v11 = -[CaptureMTLIntersectionFunctionTable traceStream](self, "traceStream");
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
}

- (NSArray)functionArray
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end