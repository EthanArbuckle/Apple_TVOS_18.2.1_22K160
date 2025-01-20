@interface CaptureMTLCommandQueue
- (BOOL)commitSynchronously;
- (BOOL)commitsWithQoS;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)disableCrossQueueHazardTracking;
- (BOOL)executionEnabled;
- (BOOL)isOpenGLQueue;
- (BOOL)isProfilingEnabled;
- (BOOL)isStatEnabled;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)skipRender;
- (CaptureMTLCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCommandQueue)accelerationStructureDescriptorDownloadQueue;
- (MTLCommandQueue)baseObject;
- (MTLCommandQueue)downloadQueue;
- (MTLDevice)device;
- (NSArray)enqueuedCommandBuffers;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)commitQueue;
- (OS_dispatch_queue)completionQueue;
- (id)availableCounters;
- (id)availableCountersAndDict;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
- (id)counterInfo;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getRequestedCounters;
- (id)originalObject;
- (id)subdivideCounterList:(id)a3;
- (int)backgroundTrackingPID;
- (int)requestCounters:(id)a3;
- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4;
- (unint64_t)getBackgroundGPUPriority;
- (unint64_t)getGPUPriority;
- (unint64_t)getStatLocations;
- (unint64_t)getStatOptions;
- (unint64_t)maxCommandBufferCount;
- (unint64_t)qosLevel;
- (unint64_t)streamReference;
- (void)addPerfSampleHandler:(id)a3;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)commitCommandBuffer:(id)a3 withIndex:(unint64_t)a4;
- (void)dealloc;
- (void)enqueueCommandBuffer:(id)a3;
- (void)finish;
- (void)insertDebugCaptureBoundary;
- (void)removeResidencySet:(id)a3;
- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)setBackgroundTrackingPID:(int)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setExecutionEnabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setSkipRender:(BOOL)a3;
- (void)setStatEnabled:(BOOL)a3;
- (void)setStatLocations:(unint64_t)a3;
- (void)setStatOptions:(unint64_t)a3;
- (void)setSubmissionQueue:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLCommandQueue

- (CaptureMTLCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandQueue;
  v9 = -[CaptureMTLCommandQueue init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureDevice, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);

    GTMTLGuestAppClientAddMTLCommandQueueInfo(g_guestAppClientMTL, v10);
    v14 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
    pendingQueue = v10->_pendingQueue;
    v10->_pendingQueue = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.dt.GPUTools.pendingQueueLock", 0LL);
    pendingQueueLock = v10->_pendingQueueLock;
    v10->_pendingQueueLock = (OS_dispatch_queue *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    currentResidencySets = v10->_currentResidencySets;
    v10->_currentResidencySets = (NSMutableSet *)v18;

    lastSnapshot = v10->_lastSnapshot;
    v10->_lastSnapshot = 0LL;

    v10->_snapshotCreated = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

- (MTLCommandQueue)downloadQueue
{
  downloadQueue = self->_downloadQueue;
  if (!downloadQueue)
  {
    pendingQueueLock = (dispatch_queue_s *)self->_pendingQueueLock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __39__CaptureMTLCommandQueue_downloadQueue__block_invoke;
    block[3] = &unk_20E0C8;
    block[4] = self;
    dispatch_sync(pendingQueueLock, block);
    downloadQueue = self->_downloadQueue;
  }

  return downloadQueue;
}

- (MTLCommandQueue)accelerationStructureDescriptorDownloadQueue
{
  accelerationStructureDescriptorDownloadQueue = self->_accelerationStructureDescriptorDownloadQueue;
  if (!accelerationStructureDescriptorDownloadQueue)
  {
    pendingQueueLock = (dispatch_queue_s *)self->_pendingQueueLock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __70__CaptureMTLCommandQueue_accelerationStructureDescriptorDownloadQueue__block_invoke;
    block[3] = &unk_20E0C8;
    block[4] = self;
    dispatch_sync(pendingQueueLock, block);
    accelerationStructureDescriptorDownloadQueue = self->_accelerationStructureDescriptorDownloadQueue;
  }

  return accelerationStructureDescriptorDownloadQueue;
}

- (MTLCommandQueue)baseObject
{
  return self->_baseObject;
}

- (void)insertDebugCaptureBoundary
{
  v3 = v32;
  *((_DWORD *)v32 + 2) = -16341;
  unsigned __int8 v4 = v35;
  if (v35 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v31 + 24);
    uint64_t v7 = v36++;
    v5 = GTTraceMemPool_allocateBytes(v6, v33, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)v3 + v35;
    v35 += 8;
  }

  *((_BYTE *)v3 + 13) = v4;
  id v8 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  -[MTLCommandQueueSPI insertDebugCaptureBoundary](self->_baseObject, "insertDebugCaptureBoundary");
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v34;
  *((_BYTE *)v32 + 15) |= 8u;
  id v12 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0LL;
  }
  uint64_t v14 = *v32;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandQueue device](self, "device"));
  dispatch_queue_t v16 = (uint64_t *)[v15 traceStream];
  if (v16) {
    uint64_t v17 = *v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0LL;
  }

  *(void *)&__int128 v20 = 0x300000007LL;
  *((void *)&v20 + 1) = v13;
  uint64_t v21 = v14;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = v17;
  uint64_t v25 = 0LL;
  unint64_t v26 = v19;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  GTCaptureBoundaryTracker_handleTrigger(&v20);
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLCommandQueueSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16349;
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
  uint64_t v10 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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
  GTMTLGuestAppClientUpdateMTLCommandQueueInfo(g_guestAppClientMTL);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16344;
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
  uint64_t v8 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandQueue;
  -[CaptureMTLCommandQueue dealloc](&v12, "dealloc");
}

- (void)enqueueCommandBuffer:(id)a3
{
  id v4 = a3;
  if (([v4 isEnqueued] & 1) == 0)
  {
    pendingQueueLock = (dispatch_queue_s *)self->_pendingQueueLock;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __47__CaptureMTLCommandQueue_enqueueCommandBuffer___block_invoke;
    v6[3] = &unk_20E0F0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(pendingQueueLock, v6);
  }
}

- (void)commitCommandBuffer:(id)a3 withIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_perfSampleHandlerUsed)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    objc_setAssociatedObject(v8, &sAssociationKey, v7, 0LL);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke;
    v14[3] = &unk_20E118;
    id v15 = v7;
    [v8 addCompletedHandler:v14];
  }

  pendingQueueLock = (dispatch_queue_s *)self->_pendingQueueLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke_2;
  v11[3] = &unk_20E140;
  v11[4] = self;
  id v12 = v7;
  unint64_t v13 = a4;
  id v10 = v7;
  dispatch_sync(pendingQueueLock, v11);
}

- (NSArray)enqueuedCommandBuffers
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__8446;
  id v10 = __Block_byref_object_dispose__8447;
  id v11 = 0LL;
  pendingQueueLock = (dispatch_queue_s *)self->_pendingQueueLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __48__CaptureMTLCommandQueue_enqueuedCommandBuffers__block_invoke;
  v5[3] = &unk_20E168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(pendingQueueLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addPerfSampleHandler:(id)a3
{
  id v4 = a3;
  self->_perfSampleHandlerUsed = 1;
  baseObject = self->_baseObject;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __47__CaptureMTLCommandQueue_addPerfSampleHandler___block_invoke;
  v7[3] = &unk_20E190;
  id v8 = v4;
  id v6 = v4;
  -[MTLCommandQueueSPI addPerfSampleHandler:](baseObject, "addPerfSampleHandler:", v7);
}

- (void)addResidencySet:(id)a3
{
  id v4 = a3;
  CommandQueueTakeSnapshot(self);
  AddResidencySet(self, v4);
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandQueueSPI addResidencySet:](baseObject, "addResidencySet:", v6);

  if (self->_snapshotCreated)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15252;
    unsigned __int8 v8 = v22;
    if (v22 > 0x30uLL)
    {
      uint64_t v10 = *(void *)(v18[1] + 24LL);
      uint64_t v11 = v23++;
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v20, v11 | 0x1000000000LL) + 16;
      unsigned __int8 v8 = v11;
    }

    else
    {
      uint64_t v9 = (char *)(v7 + v22);
      v22 += 16;
    }

    *(_BYTE *)(v7 + 13) = v8;
    id v12 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(_BYTE *)(v16 + 8) = v21;
    *(_BYTE *)(v19 + 15) |= 8u;
  }
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = 0LL;
  if (a4)
  {
    do
      AddResidencySet(self, (void *)a3[v7++]);
    while (a4 != v7);
    baseObject = self->_baseObject;
    unint64_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = &v24[-((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v12 = 0LL;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }

    while (a4 != v12);
  }

  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v31;
  }

  -[MTLCommandQueueSPI addResidencySets:count:](baseObject, "addResidencySets:count:", v11, a4);
  if (self->_snapshotCreated)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
    uint64_t v13 = v26;
    *(_DWORD *)(v26 + 8) = -15251;
    unsigned __int8 v14 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v16 = *(void *)(v25 + 24);
      uint64_t v17 = v30++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v27, v17 | 0x1800000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v13 + 13) = v14;
    unsigned __int8 v18 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v18, v19);
    char v21 = StreamArray((uint64_t)v24, &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)], (id *)a3, a4);
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

- (void)removeResidencySet:(id)a3
{
  id v4 = a3;
  CommandQueueTakeSnapshot(self);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CaptureMTLResidencySet, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    -[NSMutableSet removeObject:](self->_currentResidencySets, "removeObject:", v4);
  }
  baseObject = self->_baseObject;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandQueueSPI removeResidencySet:](baseObject, "removeResidencySet:", v8);

  if (self->_snapshotCreated)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v20);
    uint64_t v9 = v21;
    *(_DWORD *)(v21 + 8) = -15250;
    unsigned __int8 v10 = v24;
    if (v24 > 0x30uLL)
    {
      uint64_t v12 = *(void *)(v20[1] + 24LL);
      uint64_t v13 = v25++;
      uint64_t v11 = GTTraceMemPool_allocateBytes(v12, v22, v13 | 0x1000000000LL) + 16;
      unsigned __int8 v10 = v13;
    }

    else
    {
      uint64_t v11 = (char *)(v9 + v24);
      v24 += 16;
    }

    *(_BYTE *)(v9 + 13) = v10;
    unsigned __int8 v14 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
    if (v14) {
      unint64_t var0 = v14->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v16 = (uint64_t *)[v4 traceStream];
    if (v16) {
      uint64_t v17 = *v16;
    }
    else {
      uint64_t v17 = 0LL;
    }
    *(void *)uint64_t v11 = var0;
    *((void *)v11 + 1) = v17;
    s();
    *(void *)uint64_t v18 = v19;
    *(_BYTE *)(v18 + 8) = v23;
    *(_BYTE *)(v21 + 15) |= 8u;
  }
}

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = a3[v8];
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___CaptureMTLResidencySet, v7);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v10);
      if ((isKindOfClass & 1) != 0) {
        uint64_t isKindOfClass = (uint64_t)-[NSMutableSet removeObject:](self->_currentResidencySets, "removeObject:", a3[v8]);
      }
      ++v8;
    }

    while (a4 != v8);
    baseObject = self->_baseObject;
    unint64_t v13 = 8 * a4;
    __chkstk_darwin(isKindOfClass, v7);
    unsigned __int8 v14 = &v27[-((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v15 = 0LL;
    do
    {
      *(void *)&v14[8 * v15] = [(id)a3[v15] baseObject];
      ++v15;
    }

    while (a4 != v15);
  }

  else
  {
    unint64_t v13 = 0LL;
    baseObject = self->_baseObject;
    unsigned __int8 v14 = &v34;
  }

  -[MTLCommandQueueSPI removeResidencySets:count:](baseObject, "removeResidencySets:count:", v14, a4);
  if (self->_snapshotCreated)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
    uint64_t v16 = v29;
    *(_DWORD *)(v29 + 8) = -15249;
    unsigned __int8 v17 = v32;
    if (v32 > 0x28uLL)
    {
      uint64_t v19 = *(void *)(v28 + 24);
      uint64_t v20 = v33++;
      uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x1800000000LL) + 16;
      unsigned __int8 v17 = v20;
    }

    else
    {
      uint64_t v18 = (char *)(v16 + v32);
      v32 += 24;
    }

    *(_BYTE *)(v16 + 13) = v17;
    uint64_t v21 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v21, v22);
    char v24 = StreamArray((uint64_t)v27, &v27[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)], (id *)a3, a4);
    *(void *)uint64_t v18 = var0;
    *((void *)v18 + 1) = a4;
    v18[16] = v24;
    *(_DWORD *)(v18 + 17) = 0;
    *((_DWORD *)v18 + 5) = 0;
    s();
    *(void *)uint64_t v25 = v26;
    *(_BYTE *)(v25 + 8) = v31;
    *(_BYTE *)(v29 + 15) |= 8u;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandQueue;
  uint64_t v3 = -[CaptureMTLCommandQueue description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueueSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLCommandQueueSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)isStatEnabled
{
  return -[MTLCommandQueueSPI isStatEnabled](self->_baseObject, "isStatEnabled");
}

- (void)setStatEnabled:(BOOL)a3
{
}

- (unint64_t)getStatLocations
{
  return (unint64_t)-[MTLCommandQueueSPI getStatLocations](self->_baseObject, "getStatLocations");
}

- (void)setStatLocations:(unint64_t)a3
{
}

- (unint64_t)getStatOptions
{
  return (unint64_t)-[MTLCommandQueueSPI getStatOptions](self->_baseObject, "getStatOptions");
}

- (void)setStatOptions:(unint64_t)a3
{
}

- (int)backgroundTrackingPID
{
  return -[MTLCommandQueueSPI backgroundTrackingPID](self->_baseObject, "backgroundTrackingPID");
}

- (void)setBackgroundTrackingPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLCommandQueueSPI setBackgroundTrackingPID:](self->_baseObject, "setBackgroundTrackingPID:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16348;
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
  uint64_t v10 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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

- (OS_dispatch_queue)commitQueue
{
  return (OS_dispatch_queue *)-[MTLCommandQueueSPI commitQueue](self->_baseObject, "commitQueue");
}

- (BOOL)commitSynchronously
{
  return -[MTLCommandQueueSPI commitSynchronously](self->_baseObject, "commitSynchronously");
}

- (BOOL)commitsWithQoS
{
  return -[MTLCommandQueueSPI commitsWithQoS](self->_baseObject, "commitsWithQoS");
}

- (OS_dispatch_queue)completionQueue
{
  return (OS_dispatch_queue *)-[MTLCommandQueueSPI completionQueue](self->_baseObject, "completionQueue");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)disableCrossQueueHazardTracking
{
  return -[MTLCommandQueueSPI disableCrossQueueHazardTracking]( self->_baseObject,  "disableCrossQueueHazardTracking");
}

- (BOOL)executionEnabled
{
  return -[MTLCommandQueueSPI executionEnabled](self->_baseObject, "executionEnabled");
}

- (void)setExecutionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLCommandQueueSPI setExecutionEnabled:](self->_baseObject, "setExecutionEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16346;
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
  uint64_t v10 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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

- (BOOL)isOpenGLQueue
{
  return -[MTLCommandQueueSPI isOpenGLQueue](self->_baseObject, "isOpenGLQueue");
}

- (NSString)label
{
  return (NSString *)-[MTLCommandQueueSPI label](self->_baseObject, "label");
}

- (unint64_t)maxCommandBufferCount
{
  return (unint64_t)-[MTLCommandQueueSPI maxCommandBufferCount](self->_baseObject, "maxCommandBufferCount");
}

- (BOOL)isProfilingEnabled
{
  return -[MTLCommandQueueSPI isProfilingEnabled](self->_baseObject, "isProfilingEnabled");
}

- (void)setProfilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLCommandQueueSPI setProfilingEnabled:](self->_baseObject, "setProfilingEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16345;
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
  uint64_t v10 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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

- (unint64_t)qosLevel
{
  return (unint64_t)-[MTLCommandQueueSPI qosLevel](self->_baseObject, "qosLevel");
}

- (BOOL)skipRender
{
  return -[MTLCommandQueueSPI skipRender](self->_baseObject, "skipRender");
}

- (void)setSkipRender:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLCommandQueueSPI setSkipRender:](self->_baseObject, "setSkipRender:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16347;
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
  uint64_t v10 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
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

- (id)availableCounters
{
  return -[MTLCommandQueueSPI availableCounters](self->_baseObject, "availableCounters");
}

- (id)availableCountersAndDict
{
  return -[MTLCommandQueueSPI availableCountersAndDict](self->_baseObject, "availableCountersAndDict");
}

- (id)commandBuffer
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  char v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v5;
  s();
  int v7 = v6;
  unint64_t v8 = *v6;
  *unsigned __int8 v6 = v5;
  unint64_t v28 = v8;
  char v29 = *((_BYTE *)v6 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueueSPI commandBuffer](self->_baseObject, "commandBuffer"));
  if (v9) {
    uint64_t v10 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandBuffer),  "initWithBaseObject:captureCommandQueue:funcRef:",  v9,  self,  0LL,  v5);
  }
  else {
    uint64_t v10 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLCommandBuffer traceStream](v10, "traceStream"));
  CreateCommandBufferEpilogue(v9);
  uint64_t v11 = v26;
  *(_DWORD *)(v26 + 8) = -16343;
  char v12 = v30;
  if (v30 > 0x30uLL)
  {
    uint64_t v14 = *(void *)(v25 + 24);
    uint64_t v15 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v27, v15 | 0x1000000000LL) + 16;
    char v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v30);
    LOBYTE(v30) = v30 + 16;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v18 = -[CaptureMTLCommandBuffer traceStream](v10, "traceStream");
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0LL;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = v19;
  unsigned __int8 __src = -[CaptureMTLCommandBuffer isCapturing](v10, "isCapturing");
  char v20 = GTTraceEncoder_storeBytes((uint64_t)&v24, &__src, 1uLL);
  uint64_t v21 = v26;
  *(_BYTE *)(v26 + 14) = v20;
  *int v7 = v28;
  *((_BYTE *)v7 + 8) = v29;
  *(_BYTE *)(v21 + 15) |= 8u;

  return v10;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int16 v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v7;
  s();
  uint64_t v9 = v8;
  unint64_t v10 = *v8;
  *unint64_t v8 = v7;
  unint64_t v34 = v10;
  char v35 = *((_BYTE *)v8 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v12 = unwrapMTLCommandBufferDescriptor(v4);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueueSPI commandBufferWithDescriptor:](baseObject, "commandBufferWithDescriptor:", v13));

  if (v14) {
    uint64_t v15 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandBuffer),  "initWithBaseObject:captureCommandQueue:funcRef:",  v14,  self,  0LL,  v7);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLCommandBuffer traceStream](v15, "traceStream"));
  CreateCommandBufferEpilogue(v14);
  uint64_t v16 = v32;
  *(_DWORD *)(v32 + 8) = -15701;
  char v17 = v36;
  if (v36 > 0x28uLL)
  {
    uint64_t v19 = *(void *)(v31 + 24);
    uint64_t v20 = HIBYTE(v36);
    ++HIBYTE(v36);
    unsigned __int8 v18 = GTTraceMemPool_allocateBytes(v19, v33, v20 | 0x1800000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    unsigned __int8 v18 = (char *)(v16 + v36);
    LOBYTE(v36) = v36 + 24;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v23 = -[CaptureMTLCommandBuffer traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  char v25 = SaveMTLCommandBufferDescriptor((uint64_t)&v30, v4);
  *(void *)unsigned __int8 v18 = var0;
  *((void *)v18 + 1) = v24;
  v18[16] = v25;
  *(_DWORD *)(v18 + 17) = 0;
  *((_DWORD *)v18 + 5) = 0;
  unsigned __int8 __src = -[CaptureMTLCommandBuffer isCapturing](v15, "isCapturing");
  char v26 = GTTraceEncoder_storeBytes((uint64_t)&v30, &__src, 1uLL);
  uint64_t v27 = v32;
  *(_BYTE *)(v32 + 14) = v26;
  unint64_t *v9 = v34;
  *((_BYTE *)v9 + 8) = v35;
  *(_BYTE *)(v27 + 15) |= 8u;

  return v15;
}

- (id)commandBufferWithUnretainedReferences
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  unint64_t v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v5;
  s();
  unint64_t v7 = v6;
  unint64_t v8 = *v6;
  *unsigned __int8 v6 = v5;
  unint64_t v28 = v8;
  char v29 = *((_BYTE *)v6 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandQueueSPI commandBufferWithUnretainedReferences]( self->_baseObject,  "commandBufferWithUnretainedReferences"));
  if (v9) {
    unint64_t v10 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandBuffer),  "initWithBaseObject:captureCommandQueue:funcRef:",  v9,  self,  0LL,  v5);
  }
  else {
    unint64_t v10 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLCommandBuffer traceStream](v10, "traceStream"));
  CreateCommandBufferEpilogue(v9);
  uint64_t v11 = v26;
  *(_DWORD *)(v26 + 8) = -16342;
  char v12 = v30;
  if (v30 > 0x30uLL)
  {
    uint64_t v14 = *(void *)(v25 + 24);
    uint64_t v15 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v27, v15 | 0x1000000000LL) + 16;
    char v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v30);
    LOBYTE(v30) = v30 + 16;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v18 = -[CaptureMTLCommandBuffer traceStream](v10, "traceStream");
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0LL;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = v19;
  unsigned __int8 __src = -[CaptureMTLCommandBuffer isCapturing](v10, "isCapturing");
  char v20 = GTTraceEncoder_storeBytes((uint64_t)&v24, &__src, 1uLL);
  uint64_t v21 = v26;
  *(_BYTE *)(v26 + 14) = v20;
  *unint64_t v7 = v28;
  *((_BYTE *)v7 + 8) = v29;
  *(_BYTE *)(v21 + 15) |= 8u;

  return v10;
}

- (id)counterInfo
{
  return -[MTLCommandQueueSPI counterInfo](self->_baseObject, "counterInfo");
}

- (void)finish
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16340;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unint64_t v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  unint64_t v8 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (unint64_t)getBackgroundGPUPriority
{
  return (unint64_t)-[MTLCommandQueueSPI getBackgroundGPUPriority](self->_baseObject, "getBackgroundGPUPriority");
}

- (unint64_t)getGPUPriority
{
  return (unint64_t)-[MTLCommandQueueSPI getGPUPriority](self->_baseObject, "getGPUPriority");
}

- (id)getRequestedCounters
{
  return -[MTLCommandQueueSPI getRequestedCounters](self->_baseObject, "getRequestedCounters");
}

- (int)requestCounters:(id)a3
{
  return -[MTLCommandQueueSPI requestCounters:](self->_baseObject, "requestCounters:", a3);
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  return -[MTLCommandQueueSPI requestCounters:withIndex:]( self->_baseObject,  "requestCounters:withIndex:",  a3,  a4);
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  unsigned int v5 = -[MTLCommandQueueSPI setBackgroundGPUPriority:](self->_baseObject, "setBackgroundGPUPriority:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15809;
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
  uint64_t v11 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  unsigned int v7 = -[MTLCommandQueueSPI setBackgroundGPUPriority:offset:]( self->_baseObject,  "setBackgroundGPUPriority:offset:",  a3,  v4);
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15808;
  unsigned __int8 v9 = v22;
  if (v22 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v18[1] + 24LL);
    uint64_t v12 = v23++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v20, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v22);
    v22 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((_DWORD *)v10 + 4) = v7;
  *((_WORD *)v10 + 10) = v4;
  *((_WORD *)v10 + 11) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
  return v7;
}

- (void)setCompletionQueue:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v15);
  -[MTLCommandQueueSPI setCompletionQueue:](self->_baseObject, "setCompletionQueue:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15807;
  unsigned __int8 v7 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  unsigned int v5 = -[MTLCommandQueueSPI setGPUPriority:](self->_baseObject, "setGPUPriority:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15806;
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
  uint64_t v11 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  unsigned int v7 = -[MTLCommandQueueSPI setGPUPriority:offset:](self->_baseObject, "setGPUPriority:offset:", a3, v4);
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15805;
  unsigned __int8 v9 = v22;
  if (v22 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v18[1] + 24LL);
    uint64_t v12 = v23++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v20, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v22);
    v22 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((_DWORD *)v10 + 4) = v7;
  *((_WORD *)v10 + 10) = v4;
  *((_WORD *)v10 + 11) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
  return v7;
}

- (void)setSubmissionQueue:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v15);
  -[MTLCommandQueueSPI setSubmissionQueue:](self->_baseObject, "setSubmissionQueue:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15804;
  unsigned __int8 v7 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLCommandQueue traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (id)subdivideCounterList:(id)a3
{
  return -[MTLCommandQueueSPI subdivideCounterList:](self->_baseObject, "subdivideCounterList:", a3);
}

- (void).cxx_destruct
{
}

void __47__CaptureMTLCommandQueue_addPerfSampleHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id AssociatedObject = objc_getAssociatedObject(v6, &sAssociationKey);
  id v8 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_setAssociatedObject(v6, &sAssociationKey, 0LL, 0LL);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __48__CaptureMTLCommandQueue_enqueuedCommandBuffers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) label];
}

id __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56) && (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 16) baseObject]);
    id v4 = DEVICEOBJECT(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (!qword_23A438) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v6 = objc_msgSend(v5, "newCommandQueueWithMaxCommandBufferCount:");
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;
  }

  [*(id *)(a1 + 40) setIsCommited:1];
  uint64_t v9 = (char *)[*(id *)(*(void *)(a1 + 32) + 40) count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
    while (1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:v11]);
      [v12 addRequestsToDownloadQueue:*(void *)(*(void *)(a1 + 32) + 56) withIndex:*(void *)(a1 + 48)];

      if (v10 == ++v11)
      {
        uint64_t v11 = v10;
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectsInRange:", 0, v11);
      }
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectsInRange:", 0, v11);
}

id __47__CaptureMTLCommandQueue_enqueueCommandBuffer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

void __70__CaptureMTLCommandQueue_accelerationStructureDescriptorDownloadQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 64))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 16) baseObject]);
    id v4 = DEVICEOBJECT(v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v4);

    if (!qword_23A438) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v5 = objc_msgSend(v8, "newCommandQueueWithMaxCommandBufferCount:");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;
  }

void __39__CaptureMTLCommandQueue_downloadQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 56))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 16) baseObject]);
    id v4 = DEVICEOBJECT(v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v4);

    if (!qword_23A438) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v5 = objc_msgSend(v8, "newCommandQueueWithMaxCommandBufferCount:");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }

@end