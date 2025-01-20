@interface CaptureMTLIOCommandBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isCapturing;
- (BOOL)isCommited;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOCommandBuffer)initWithBaseObject:(id)a3 captureIOCommandQueue:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIOCommandBuffer)baseObject;
- (NSError)error;
- (NSMutableSet)retainedObjects;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int64_t)status;
- (unint64_t)globalTraceObjectID;
- (unint64_t)streamReference;
- (void)_preCommitWithIndex:(unint64_t)a3;
- (void)addBarrier;
- (void)addCompletedHandler:(id)a3;
- (void)commit;
- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)enqueue;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setIsCommited:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)touch;
- (void)tryCancel;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
- (void)waitUntilCompleted;
@end

@implementation CaptureMTLIOCommandBuffer

- (CaptureMTLIOCommandBuffer)initWithBaseObject:(id)a3 captureIOCommandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandBuffer;
  v9 = -[CaptureMTLIOCommandBuffer init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureCommandQueue, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = v11;

    v13 = -[CaptureMTLIOCommandQueue traceContext](v10->_captureCommandQueue, "traceContext");
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)v10);

    v10->_isCapturing = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

- (MTLIOCommandBuffer)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  v4 = v3;
  uint64_t v5 = *v3;
  void *v3 = v6;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = self->_completedDispatchArray;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8LL * (void)i) + 16LL))();
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
    }

    while (v9);
  }

  void *v4 = v5;
  uint64_t v12 = v26;
  *(_DWORD *)(v26 + 8) = -15341;
  unsigned __int8 v13 = v30;
  if (v30 > 0x38uLL)
  {
    uint64_t v15 = *(void *)(v25 + 24);
    uint64_t v16 = v31++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v27, v16 | 0x800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v30);
    v30 += 8;
  }

  *(_BYTE *)(v12 + 13) = v13;
  objc_super v17 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v14 = var0;
  void *v4 = v28;
  *((_BYTE *)v4 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandBuffer;
  -[CaptureMTLIOCommandBuffer dealloc](&v19, "dealloc");
}

- (void)addCompletedHandler:(id)a3
{
  id v4 = a3;
  completedDispatchArray = self->_completedDispatchArray;
  if (!completedDispatchArray)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = v6;

    completedDispatchArray = self->_completedDispatchArray;
  }

  id v8 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](completedDispatchArray, "addObject:", v8);

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15345;
  unsigned __int8 v10 = v22;
  if (v22 > 0x30uLL)
  {
    uint64_t v12 = *(void *)(v18[1] + 24LL);
    uint64_t v13 = v23++;
    v11 = GTTraceMemPool_allocateBytes(v12, v20, v13 | 0x1000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    v11 = (char *)(v9 + v22);
    v22 += 16;
  }

  *(_BYTE *)(v9 + 13) = v10;
  id v14 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
}

- (void)_preCommitWithIndex:(unint64_t)a3
{
  completedDispatchArray = self->_completedDispatchArray;
  if (completedDispatchArray)
  {
    uint64_t v6 = completedDispatchArray;
    id v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = 0LL;

    id v8 = self;
    baseObject = v8->_baseObject;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __49__CaptureMTLIOCommandBuffer__preCommitWithIndex___block_invoke;
    v12[3] = &unk_20DC18;
    id v14 = v8;
    unint64_t v15 = a3;
    uint64_t v13 = v6;
    unsigned __int8 v10 = v8;
    v11 = v6;
    -[MTLIOCommandBufferSPI addCompletedHandler:](baseObject, "addCompletedHandler:", v12);
  }

- (void)commit
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15343;
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
  id v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)-[MTLIOCommandBufferSPI globalTraceObjectID](self->_baseObject, "globalTraceObjectID");
}

- (NSError)error
{
  return (NSError *)-[MTLIOCommandBufferSPI error](self->_baseObject, "error");
}

- (NSString)label
{
  return (NSString *)-[MTLIOCommandBufferSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLIOCommandBufferSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15313;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIOCommandBufferSPI waitForEvent:value:](baseObject, "waitForEvent:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15308;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  id v15 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIOCommandBufferSPI signalEvent:value:](baseObject, "signalEvent:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15309;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  id v15 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIOCommandBufferSPI encodeSignalEvent:value:](baseObject, "encodeSignalEvent:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15340;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  id v15 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLIOCommandBufferSPI encodeWaitForEvent:value:](baseObject, "encodeWaitForEvent:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15339;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  id v15 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  traceContext = self->_traceContext;
  id v11 = a5;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v26);
  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLIOCommandBufferSPI loadBytes:size:sourceHandle:sourceHandleOffset:]( baseObject,  "loadBytes:size:sourceHandle:sourceHandleOffset:",  a3,  a4,  v13,  a6);

  uint64_t v14 = v27;
  *(_DWORD *)(v27 + 8) = -15294;
  unsigned __int8 v15 = v30;
  if (v30 > 0x18uLL)
  {
    uint64_t v17 = *(void *)(v26[1] + 24LL);
    uint64_t v18 = v31++;
    size_t v16 = GTTraceMemPool_allocateBytes(v17, v28, v18 | 0x2800000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    size_t v16 = (char *)(v14 + v30);
    v30 += 40;
  }

  *(_BYTE *)(v14 + 13) = v15;
  uint64_t v19 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v11 traceStream];

  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v23 = GTTraceEncoder_storeBlob((uint64_t)v26, a3, a4);
  }
  else {
    char v23 = 0;
  }
  *(void *)size_t v16 = var0;
  *((void *)v16 + 1) = a4;
  *((void *)v16 + 2) = v22;
  *((void *)v16 + 3) = a6;
  v16[32] = v23;
  *(_DWORD *)(v16 + 33) = 0;
  *((_DWORD *)v16 + 9) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v29;
  *(_BYTE *)(v27 + 15) |= 8u;
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = (unint64_t *)[v13 traceStream];
  if (v14)
  {
    unsigned __int8 v15 = v14 + 7;
    unint64_t v16 = atomic_load(v14 + 7);
    while (1)
    {
      unint64_t v17 = __ldaxr(v15);
      if (v17 != v16) {
        break;
      }
      if (__stlxr(v16 | 2, v15)) {
        goto LABEL_7;
      }
      int v18 = 1;
LABEL_8:
      unint64_t v16 = v17;
      if (v18) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v18 = 0;
    goto LABEL_8;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandBuffer;
  uint64_t v3 = -[CaptureMTLIOCommandBuffer description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIOCommandBufferSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIOCommandBufferSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (int64_t)status
{
  return (int64_t)-[MTLIOCommandBufferSPI status](self->_baseObject, "status");
}

- (void)addBarrier
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15295;
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
  objc_super v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLIOCommandBufferSPI copyStatusToBuffer:offset:](baseObject, "copyStatusToBuffer:offset:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15342;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  char v15 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v17 = (uint64_t *)[v7 traceStream];

  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)enqueue
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15312;
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
  objc_super v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  traceContext = self->_traceContext;
  id v17 = a10;
  id v18 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v47);
  baseObject = self->_baseObject;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  uint64_t v40 = v17;
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v46 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45 = *a9;
  unint64_t v41 = a4;
  unint64_t v42 = a7;
  -[MTLIOCommandBufferSPI loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]( baseObject,  "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:",  v20,  a4,  a5,  &v46,  a7,  a8,  &v45,  v21,  a11);

  uint64_t v22 = v49;
  *(_DWORD *)(v49 + 8) = -15310;
  uint64_t v23 = *(void *)(v48 + 24);
  uint64_t v24 = v52++;
  Bytes = GTTraceMemPool_allocateBytes(v23, v50, v24 | 0x7000000000LL);
  *(_BYTE *)(v22 + 13) = v24;
  unsigned __int8 v26 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v18 traceStream];

  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  unint64_t v29 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t var2 = a6->var2;
  unint64_t v32 = a9->var0;
  unint64_t v33 = a9->var1;
  unint64_t v34 = a9->var2;
  v35 = (uint64_t *)[v40 traceStream];

  if (v35) {
    uint64_t v36 = *v35;
  }
  else {
    uint64_t v36 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v28;
  *((void *)Bytes + 4) = v41;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v29;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = var2;
  *((void *)Bytes + 9) = v42;
  *((void *)Bytes + 10) = a8;
  *((void *)Bytes + 11) = v32;
  *((void *)Bytes + 12) = v33;
  *((void *)Bytes + 13) = v34;
  *((void *)Bytes + 14) = v36;
  *((void *)Bytes + 15) = a11;
  s();
  *(void *)uint64_t v37 = v38;
  *(_BYTE *)(v37 + 8) = v51;
  *(_BYTE *)(v49 + 15) |= 8u;
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15293;
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
  objc_super v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLIOCommandBufferSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15292;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)tryCancel
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15336;
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
  uint64_t v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (void)waitUntilCompleted
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15335;
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
  uint64_t v8 = -[CaptureMTLIOCommandBuffer traceStream](self, "traceStream");
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

- (NSMutableSet)retainedObjects
{
  return self->_retainedObjects;
}

- (BOOL)isCapturing
{
  return self->_isCapturing;
}

- (BOOL)isCommited
{
  return self->_isCommited;
}

- (void)setIsCommited:(BOOL)a3
{
  self->_isCommited = a3;
}

- (void).cxx_destruct
{
}

void __49__CaptureMTLIOCommandBuffer__preCommitWithIndex___block_invoke(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  void *v2 = v5;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10) + 16LL))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

  void *v3 = v4;
}

@end